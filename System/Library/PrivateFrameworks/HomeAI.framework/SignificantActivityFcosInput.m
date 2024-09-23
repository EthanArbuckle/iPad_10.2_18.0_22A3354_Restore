@implementation SignificantActivityFcosInput

- (SignificantActivityFcosInput)initWithImage_Placeholder:(__CVBuffer *)a3
{
  SignificantActivityFcosInput *v4;
  SignificantActivityFcosInput *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SignificantActivityFcosInput;
  v4 = -[SignificantActivityFcosInput init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_image_Placeholder = a3;
    CVPixelBufferRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_image_Placeholder);
  v3.receiver = self;
  v3.super_class = (Class)SignificantActivityFcosInput;
  -[SignificantActivityFcosInput dealloc](&v3, sel_dealloc);
}

- (SignificantActivityFcosInput)initWithImage_PlaceholderFromCGImage:(CGImage *)a3 error:(id *)a4
{
  SignificantActivityFcosInput *v6;
  void *v7;
  void *v8;
  id v9;
  SignificantActivityFcosInput *v10;
  id v12;

  if (!self)
    return 0;
  v6 = self;
  v7 = (void *)MEMORY[0x220735570](self, a2);
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithCGImage:pixelsWide:pixelsHigh:pixelFormatType:options:error:", a3, 384, 384, 32, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    v6 = -[SignificantActivityFcosInput initWithImage_Placeholder:](v6, "initWithImage_Placeholder:", objc_msgSend(v8, "imageBufferValue"));
    v10 = v6;
  }
  else
  {
    v10 = 0;
  }

  objc_autoreleasePoolPop(v7);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v10;
}

- (SignificantActivityFcosInput)initWithImage_PlaceholderAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  SignificantActivityFcosInput *v10;
  id v12;

  v6 = a3;
  if (self)
  {
    v7 = (void *)MEMORY[0x220735570]();
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithImageAtURL:pixelsWide:pixelsHigh:pixelFormatType:options:error:", v6, 384, 384, 32, 0, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v8)
    {
      self = -[SignificantActivityFcosInput initWithImage_Placeholder:](self, "initWithImage_Placeholder:", objc_msgSend(v8, "imageBufferValue"));
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
    if (a4)
      *a4 = objc_retainAutorelease(v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)setImage_PlaceholderWithCGImage:(CGImage *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  id v11;

  v7 = (void *)MEMORY[0x220735570](self, a2);
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithCGImage:pixelsWide:pixelsHigh:pixelFormatType:options:error:", a3, 384, 384, 32, 0, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
  {
    CVPixelBufferRelease(-[SignificantActivityFcosInput image_Placeholder](self, "image_Placeholder"));
    -[SignificantActivityFcosInput setImage_Placeholder:](self, "setImage_Placeholder:", objc_msgSend(v8, "imageBufferValue"));
    CVPixelBufferRetain(-[SignificantActivityFcosInput image_Placeholder](self, "image_Placeholder"));
  }

  objc_autoreleasePoolPop(v7);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8 != 0;
}

- (BOOL)setImage_PlaceholderWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v11;

  v6 = a3;
  v7 = (void *)MEMORY[0x220735570]();
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithImageAtURL:pixelsWide:pixelsHigh:pixelFormatType:options:error:", v6, 384, 384, 32, 0, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
  {
    CVPixelBufferRelease(-[SignificantActivityFcosInput image_Placeholder](self, "image_Placeholder"));
    -[SignificantActivityFcosInput setImage_Placeholder:](self, "setImage_Placeholder:", objc_msgSend(v8, "imageBufferValue"));
    CVPixelBufferRetain(-[SignificantActivityFcosInput image_Placeholder](self, "image_Placeholder"));
  }

  objc_autoreleasePoolPop(v7);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8 != 0;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DC153B0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("image_Placeholder")))
  {
    objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithPixelBuffer:", -[SignificantActivityFcosInput image_Placeholder](self, "image_Placeholder"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CVBuffer)image_Placeholder
{
  return self->_image_Placeholder;
}

- (void)setImage_Placeholder:(__CVBuffer *)a3
{
  self->_image_Placeholder = a3;
}

@end
