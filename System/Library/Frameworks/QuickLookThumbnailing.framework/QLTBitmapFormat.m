@implementation QLTBitmapFormat

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (unint64_t)width
{
  return self->_width;
}

- (CGColorSpace)colorSpace
{
  return (CGColorSpace *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (unint64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (unsigned)bitmapInfo
{
  return self->_bitmapInfo;
}

- (QLTBitmapFormat)initWithCoder:(id)a3
{
  id v4;
  QLTBitmapFormat *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLTBitmapFormat;
  v5 = -[QLTBitmapFormat init](&v13, sel_init);
  if (v5)
  {
    v5->_width = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("w"));
    v5->_height = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("h"));
    v5->_bitsPerComponent = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bpc"));
    v5->_bitsPerPixel = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bpp"));
    v5->_bytesPerRow = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bpr"));
    v5->_bitmapInfo = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("i"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("cs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_colorSpace = CGColorSpaceCreateWithPropertyList(v11);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t width_low;
  id v5;
  id v6;

  width_low = LODWORD(self->_width);
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", width_low, CFSTR("w"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_height), CFSTR("h"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_bitsPerComponent), CFSTR("bpc"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_bitsPerPixel), CFSTR("bpp"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_bytesPerRow), CFSTR("bpr"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_bitmapInfo, CFSTR("i"));
  v6 = (id)CGColorSpaceCopyPropertyList(self->_colorSpace);
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("cs"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<QLTBitmapFormat %p s=(%zd, %zd) bpc=%zd bpp=%zd bpr=%zd i=%u>"), self, self->_width, self->_height, self->_bitsPerComponent, self->_bitsPerPixel, self->_bytesPerRow, self->_bitmapInfo);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[QLTBitmapFormat isEqualToFormat:](self, "isEqualToFormat:", v4);

  return v5;
}

- (BOOL)isEqualToFormat:(id)a3
{
  id v4;
  unint64_t width;
  unint64_t height;
  unint64_t bitsPerComponent;
  unint64_t bytesPerRow;
  unsigned int bitmapInfo;
  CGColorSpace *colorSpace;
  const void *v11;
  BOOL v12;

  v4 = a3;
  width = self->_width;
  if (width == objc_msgSend(v4, "width")
    && (height = self->_height, height == objc_msgSend(v4, "height"))
    && (bitsPerComponent = self->_bitsPerComponent, bitsPerComponent == objc_msgSend(v4, "bitsPerComponent"))
    && (bytesPerRow = self->_bytesPerRow, bytesPerRow == objc_msgSend(v4, "bytesPerRow"))
    && (bitmapInfo = self->_bitmapInfo, bitmapInfo == objc_msgSend(v4, "bitmapInfo")))
  {
    colorSpace = self->_colorSpace;
    v11 = (const void *)objc_msgSend(v4, "colorSpace");
    if (colorSpace)
      v12 = CFEqual(colorSpace, v11) != 0;
    else
      v12 = v11 == 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (QLTBitmapFormat)bitmapFormatWithBitmapImage:(CGImage *)a3
{
  QLTBitmapFormat *v4;

  v4 = objc_alloc_init(QLTBitmapFormat);
  if (a3)
  {
    -[QLTBitmapFormat setWidth:](v4, "setWidth:", CGImageGetWidth(a3));
    -[QLTBitmapFormat setHeight:](v4, "setHeight:", CGImageGetHeight(a3));
    -[QLTBitmapFormat setBitsPerComponent:](v4, "setBitsPerComponent:", CGImageGetBitsPerComponent(a3));
    -[QLTBitmapFormat setBytesPerRow:](v4, "setBytesPerRow:", CGImageGetBytesPerRow(a3));
    -[QLTBitmapFormat setBitsPerPixel:](v4, "setBitsPerPixel:", CGImageGetBitsPerPixel(a3));
    -[QLTBitmapFormat setBitmapInfo:](v4, "setBitmapInfo:", CGImageGetBitmapInfo(a3));
    -[QLTBitmapFormat setColorSpace:](v4, "setColorSpace:", CGImageGetColorSpace(a3));
  }
  return v4;
}

- (QLTBitmapFormat)initWithBitmapContext:(CGContext *)a3
{
  QLTBitmapFormat *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLTBitmapFormat;
  v4 = -[QLTBitmapFormat init](&v6, sel_init);
  if (v4)
  {
    v4->_width = CGBitmapContextGetWidth(a3);
    v4->_height = CGBitmapContextGetHeight(a3);
    v4->_bitsPerComponent = CGBitmapContextGetBitsPerComponent(a3);
    v4->_bytesPerRow = CGBitmapContextGetBytesPerRow(a3);
    v4->_bitsPerPixel = CGBitmapContextGetBitsPerPixel(a3);
    v4->_bitmapInfo = CGBitmapContextGetBitmapInfo(a3);
    v4->_colorSpace = CGBitmapContextGetColorSpace(a3);
  }
  return v4;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (void)setBitsPerComponent:(unint64_t)a3
{
  self->_bitsPerComponent = a3;
}

- (void)setBitsPerPixel:(unint64_t)a3
{
  self->_bitsPerPixel = a3;
}

- (void)setBytesPerRow:(unint64_t)a3
{
  self->_bytesPerRow = a3;
}

- (void)setBitmapInfo:(unsigned int)a3
{
  self->_bitmapInfo = a3;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

@end
