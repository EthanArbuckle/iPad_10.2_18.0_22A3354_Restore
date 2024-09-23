@implementation MDLURLTexture

- (MDLURLTexture)initWithURL:(NSURL *)URL name:(NSString *)name
{
  NSURL *v6;
  NSString *v7;
  const char *v8;
  MDLURLTexture *v9;
  uint64_t v10;
  NSString *v11;
  MDLURLTexture *v12;
  objc_super v14;

  v6 = URL;
  v7 = name;
  v14.receiver = self;
  v14.super_class = (Class)MDLURLTexture;
  v9 = -[MDLTexture init](&v14, sel_init);
  if (v9)
  {
    if (v7)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v8, (uint64_t)v7);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v9->super._name;
      v9->super._name = (NSString *)v10;

    }
    objc_msgSend_setURL_(v9, v8, (uint64_t)v6);
    v12 = v9;
  }

  return v9;
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(NSURL *)URL
{
  CGImageSource *v5;
  CGImageSource *v6;
  CGImage *ImageAtIndex;
  unsigned int Width;
  signed int Height;
  id v10;
  const char *v11;
  NSData *v12;
  NSData *v13;
  NSData *v14;
  const char *v15;
  uint64_t v16;
  CGColorSpace *DeviceRGB;
  NSData *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  CGContext *v22;
  uint64_t v23;
  NSURL *url;
  CGRect v25;

  url = URL;
  objc_storeStrong((id *)&self->_url, URL);
  if (url)
  {
    v5 = CGImageSourceCreateWithURL((CFURLRef)url, 0);
    v6 = v5;
    if (v5)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0);
      CFRelease(v6);
      if (ImageAtIndex)
      {
        Width = CGImageGetWidth(ImageAtIndex);
        Height = CGImageGetHeight(ImageAtIndex);
        *(_QWORD *)self->super._anon_118 = __PAIR64__(Height, Width);
        if (Height / 6 == Width)
          self->super._anon_118[16] = 1;
        v10 = objc_alloc(MEMORY[0x1E0C99DF0]);
        v12 = (NSData *)objc_msgSend_initWithLength_(v10, v11, (int)(4 * HIDWORD(*(_QWORD *)self->super._anon_118) * *(_QWORD *)self->super._anon_118));
        v13 = self->super._bottomLeftOriginData[0];
        self->super._bottomLeftOriginData[0] = v12;

        v14 = objc_retainAutorelease(self->super._bottomLeftOriginData[0]);
        self->super._textureData.bottomLeftBytesForMip[0] = (char *)objc_msgSend_bytes(v14, v15, v16);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v18 = objc_retainAutorelease(self->super._bottomLeftOriginData[0]);
        v21 = (void *)objc_msgSend_bytes(v18, v19, v20);
        v22 = CGBitmapContextCreate(v21, (int)*(_QWORD *)self->super._anon_118, (int)HIDWORD(*(_QWORD *)self->super._anon_118), 8uLL, (int)(4 * *(_QWORD *)self->super._anon_118), DeviceRGB, 1u);
        CFRelease(DeviceRGB);
        CGContextSetBlendMode(v22, kCGBlendModeCopy);
        v23 = *(_QWORD *)self->super._anon_118;
        v25.size.width = (double)(int)v23;
        v25.size.height = (double)SHIDWORD(v23);
        v25.origin.x = 0.0;
        v25.origin.y = 0.0;
        CGContextDrawImage(v22, v25, ImageAtIndex);
        CGContextRelease(v22);
        CFRelease(ImageAtIndex);
        *(_QWORD *)&self->super._anon_118[8] = (int)(4 * *(_QWORD *)self->super._anon_118);
        self->super._textureData.channelCount = 4;
        self->super._channelEncoding = 1;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
