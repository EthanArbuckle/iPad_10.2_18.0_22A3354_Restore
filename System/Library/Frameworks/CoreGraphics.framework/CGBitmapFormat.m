@implementation CGBitmapFormat

- (CGBitmapFormat)initWithBitmapContext:(CGContext *)a3
{
  CGBitmapFormat *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CGBitmapFormat;
  v4 = -[CGBitmapFormat init](&v6, sel_init);
  if (v4)
  {
    v4->_width = CGBitmapContextGetWidth(a3);
    v4->_height = CGBitmapContextGetHeight(a3);
    v4->_bitsPerPixel = CGBitmapContextGetBitsPerPixel(a3);
    v4->_bitsPerComponent = CGBitmapContextGetBitsPerComponent(a3);
    v4->_bytesPerRow = CGBitmapContextGetBytesPerRow(a3);
    v4->_bitmapInfo = CGBitmapContextGetBitmapInfo(a3);
    v4->_colorSpace = CGBitmapContextGetColorSpace(a3);
  }
  return v4;
}

- (CGImage)createImageWithData:(id)a3
{
  const __CFData *v4;
  CGDataProvider *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGDataProvider *v12;
  CGImage *v13;

  v4 = (const __CFData *)a3;
  v5 = CGDataProviderCreateWithCFData(v4);
  if (v5)
  {
    v12 = v5;
    v13 = CGImageCreate(-[CGBitmapFormat width](self, "width"), -[CGBitmapFormat height](self, "height"), -[CGBitmapFormat bitsPerComponent](self, "bitsPerComponent"), -[CGBitmapFormat bitsPerPixel](self, "bitsPerPixel"), -[CGBitmapFormat bytesPerRow](self, "bytesPerRow"), -[CGBitmapFormat colorSpace](self, "colorSpace"), -[CGBitmapFormat bitmapInfo](self, "bitmapInfo"), v5, 0, 1, kCGRenderingIntentPerceptual);
    CFRelease(v12);
  }
  else
  {
    CGLog(2, (uint64_t)"Failed to create data provoder with data: (%p)", v6, v7, v8, v9, v10, v11, (char)v4);
    v13 = 0;
  }

  return v13;
}

- (CGBitmapFormat)initWithCoder:(id)a3
{
  id v4;
  CGBitmapFormat *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CGBitmapFormat;
  v5 = -[CGBitmapFormat init](&v11, sel_init);
  if (v5)
  {
    v5->_width = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("w"));
    v5->_height = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("h"));
    v5->_bitsPerPixel = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bpp"));
    v5->_bitsPerComponent = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bpc"));
    v5->_bytesPerRow = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bpr"));
    v5->_bitmapInfo = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bmi"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v12[2] = objc_opt_class();
    v12[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("cs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_colorSpace = CGColorSpaceCreateWithPropertyList(v9);

  }
  return v5;
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
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_bitsPerPixel), CFSTR("bpp"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_bitsPerComponent), CFSTR("bpc"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_bytesPerRow), CFSTR("bpr"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_bitmapInfo, CFSTR("bmi"));
  v6 = (id)CGColorSpaceCopyPropertyList(self->_colorSpace);
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("cs"));

}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (void)setBitsPerComponent:(unint64_t)a3
{
  self->_bitsPerComponent = a3;
}

- (unint64_t)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerPixel:(unint64_t)a3
{
  self->_bitsPerPixel = a3;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(unint64_t)a3
{
  self->_bytesPerRow = a3;
}

- (unsigned)bitmapInfo
{
  return self->_bitmapInfo;
}

- (void)setBitmapInfo:(unsigned int)a3
{
  self->_bitmapInfo = a3;
}

- (CGColorSpace)colorSpace
{
  return (CGColorSpace *)objc_getProperty(self, a2, 56, 1);
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
