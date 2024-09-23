@implementation MonzaV4_1Input

- (MonzaV4_1Input)initWithInputImage:(__CVBuffer *)a3
{
  MonzaV4_1Input *v4;
  MonzaV4_1Input *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MonzaV4_1Input;
  v4 = -[MonzaV4_1Input init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_inputImage = a3;
    CVPixelBufferRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_inputImage);
  v3.receiver = self;
  v3.super_class = (Class)MonzaV4_1Input;
  -[MonzaV4_1Input dealloc](&v3, sel_dealloc);
}

- (MonzaV4_1Input)initWithInputImageFromCGImage:(CGImage *)a3 error:(id *)a4
{
  MonzaV4_1Input *v6;
  void *v7;
  void *v8;
  id v9;
  MonzaV4_1Input *v10;
  id v12;

  if (!self)
    return 0;
  v6 = self;
  v7 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithCGImage:pixelsWide:pixelsHigh:pixelFormatType:options:error:", a3, 224, 224, 1111970369, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    v6 = -[MonzaV4_1Input initWithInputImage:](v6, "initWithInputImage:", objc_msgSend(v8, "imageBufferValue"));
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

- (MonzaV4_1Input)initWithInputImageAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  MonzaV4_1Input *v10;
  id v12;

  v6 = a3;
  if (self)
  {
    v7 = (void *)MEMORY[0x1BCCA1B2C]();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithImageAtURL:pixelsWide:pixelsHigh:pixelFormatType:options:error:", v6, 224, 224, 1111970369, 0, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v8)
    {
      self = -[MonzaV4_1Input initWithInputImage:](self, "initWithInputImage:", objc_msgSend(v8, "imageBufferValue"));
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

- (BOOL)setInputImageWithCGImage:(CGImage *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  id v11;

  v7 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithCGImage:pixelsWide:pixelsHigh:pixelFormatType:options:error:", a3, 224, 224, 1111970369, 0, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
  {
    CVPixelBufferRelease(-[MonzaV4_1Input inputImage](self, "inputImage"));
    -[MonzaV4_1Input setInputImage:](self, "setInputImage:", objc_msgSend(v8, "imageBufferValue"));
    CVPixelBufferRetain(-[MonzaV4_1Input inputImage](self, "inputImage"));
  }

  objc_autoreleasePoolPop(v7);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8 != 0;
}

- (BOOL)setInputImageWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v11;

  v6 = a3;
  v7 = (void *)MEMORY[0x1BCCA1B2C]();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithImageAtURL:pixelsWide:pixelsHigh:pixelFormatType:options:error:", v6, 224, 224, 1111970369, 0, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
  {
    CVPixelBufferRelease(-[MonzaV4_1Input inputImage](self, "inputImage"));
    -[MonzaV4_1Input setInputImage:](self, "setInputImage:", objc_msgSend(v8, "imageBufferValue"));
    CVPixelBufferRetain(-[MonzaV4_1Input inputImage](self, "inputImage"));
  }

  objc_autoreleasePoolPop(v7);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8 != 0;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6B76AA0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("inputImage")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithPixelBuffer:", -[MonzaV4_1Input inputImage](self, "inputImage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CVBuffer)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(__CVBuffer *)a3
{
  self->_inputImage = a3;
}

@end
