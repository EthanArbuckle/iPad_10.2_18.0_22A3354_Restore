@implementation CATintedImage

- (void)CA_copyRenderValue
{
  CGImage *image;
  uint64_t v4;
  uint64_t v5;
  CGImage *v6;
  CA::Render::Pattern **v7;
  char *v8;
  CGColor *tint;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  image = self->_image;
  if (!image)
    return 0;
  v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v4 && (v5 = *(_QWORD *)(v4 + 40)) != 0)
  {
    v6 = *(CGImage **)(v5 + 112);
  }
  else
  {
    v6 = (CGImage *)CAGetColorSpace(0x1Du);
    image = self->_image;
  }
  v8 = CA::Render::copy_image(image, v6, (CGColorSpace *)self->_copy_flags, 0.0, 1.0);
  tint = self->_tint;
  if (tint)
  {
    v11 = 0uLL;
    CA::Render::convert_cgcolor_to_float(tint, v6, (CGColorSpace *)&v11, 0, v7);
    *(_OWORD *)(v8 + 60) = v11;
  }
  *((_DWORD *)v8 + 3) |= 0x100000u;
  return v8;
}

+ (id)tintedImageWithCGImage:(CGImage *)a3 tint:(CGColor *)a4 copyFlags:(unsigned int)a5
{
  uint64_t v8;

  v8 = objc_opt_new();
  *(_QWORD *)(v8 + 8) = CGImageRetain(a3);
  *(_QWORD *)(v8 + 16) = CGColorRetain(a4);
  *(_DWORD *)(v8 + 24) = a5;
  return (id)v8;
}

- (void)CA_prepareRenderValue
{
  double v2;
  CGImage *image;
  uint64_t v5;
  uint64_t v6;
  CGImage *v7;

  image = self->_image;
  if (image)
  {
    v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (v5 && (v6 = *(_QWORD *)(v5 + 40)) != 0)
      v7 = *(CGImage **)(v6 + 112);
    else
      v7 = (CGImage *)CAGetColorSpace(0x1Du);
    CA::Render::prepare_image(image, v7, (CGColorSpace *)self->_copy_flags, v2);
  }
}

- (CGColor)tint
{
  return (CGColor *)objc_getProperty(self, a2, 16, 1);
}

- (CGImage)image
{
  return (CGImage *)objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CGImageRelease(self->_image);
  CGColorRelease(self->_tint);
  v3.receiver = self;
  v3.super_class = (Class)CATintedImage;
  -[CATintedImage dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  CGImage *image;
  CGColor *tint;

  image = self->_image;
  if (image)
  {
    objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", image, CFSTR("image"), 0);
    tint = self->_tint;
    if (tint)
      objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", tint, CFSTR("tint"), 0);
  }
}

- (CATintedImage)initWithCoder:(id)a3
{
  CATintedImage *v4;
  CFTypeID v5;
  CFTypeID v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CATintedImage;
  v4 = -[CATintedImage init](&v8, sel_init);
  if (v4)
  {
    if ((-[CATintedImage setImage:](v4, "setImage:", objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("image"))),
          -[CATintedImage setTint:](v4, "setTint:", objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("tint"))),
          -[CATintedImage image](v4, "image"))
      && (v5 = CFGetTypeID(-[CATintedImage image](v4, "image")), v5 != CGImageGetTypeID())
      || -[CATintedImage tint](v4, "tint")
      && (v6 = CFGetTypeID(-[CATintedImage tint](v4, "tint")), v6 != CGColorGetTypeID()))
    {

      return 0;
    }
  }
  return v4;
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("image")))
  {
    -[CATintedImage setImage:](self, "setImage:", a4);
  }
  else if (objc_msgSend(a5, "isEqualToString:", CFSTR("tint")))
  {
    -[CATintedImage setTint:](self, "setTint:", a4);
  }
}

- (void)encodeWithCAMLWriter:(id)a3
{
  if (self->_image)
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("image"));
    objc_msgSend(a3, "encodeObject:", self->_image);
    objc_msgSend(a3, "endElement");
  }
  if (self->_tint)
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("tint"));
    objc_msgSend(a3, "encodeObject:", self->_tint);
    objc_msgSend(a3, "endElement");
  }
}

- (id)CAMLTypeForKey:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("image")) & 1) != 0)
    return CFSTR("CGImage");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("tint")))
    return CFSTR("CGColor");
  return 0;
}

- (void)setImage:(CGImage *)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setTint:(CGColor *)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

+ (id)tintedImageWithCGImage:(CGImage *)a3 tint:(CGColor *)a4
{
  return (id)objc_msgSend(a1, "tintedImageWithCGImage:tint:copyFlags:", a3, a4, 0);
}

+ (id)tintedImageWithCABackingStore:(CABackingStore *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_opt_new();
  v4[1] = CABackingStoreCopyCGImage((uint64_t)a3);
  v4[2] = CABackingStoreCopyTintColor((uint64_t)a3);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4;

  v4 = (id)objc_opt_new();
  objc_msgSend(a3, "setElementValue:", v4);

}

@end
