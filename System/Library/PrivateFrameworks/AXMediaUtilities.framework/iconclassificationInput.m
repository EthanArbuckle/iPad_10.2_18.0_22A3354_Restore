@implementation iconclassificationInput

- (iconclassificationInput)initWithImage_Placeholder:(__CVBuffer *)a3
{
  iconclassificationInput *v4;
  iconclassificationInput *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)iconclassificationInput;
  v4 = -[iconclassificationInput init](&v7, sel_init);
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
  v3.super_class = (Class)iconclassificationInput;
  -[iconclassificationInput dealloc](&v3, sel_dealloc);
}

- (iconclassificationInput)initWithImage_PlaceholderFromCGImage:(CGImage *)a3 error:(id *)a4
{
  iconclassificationInput *v6;
  void *v7;
  void *v8;
  id v9;
  iconclassificationInput *v10;
  id v12;

  if (!self)
    return 0;
  v6 = self;
  v7 = (void *)MEMORY[0x1B5E128FC](self, a2);
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithCGImage:pixelsWide:pixelsHigh:pixelFormatType:options:error:", a3, 256, 256, 32, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    v6 = -[iconclassificationInput initWithImage_Placeholder:](v6, "initWithImage_Placeholder:", objc_msgSend(v8, "imageBufferValue"));
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

- (iconclassificationInput)initWithImage_PlaceholderAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  iconclassificationInput *v10;
  id v12;

  v6 = a3;
  if (self)
  {
    v7 = (void *)MEMORY[0x1B5E128FC]();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithImageAtURL:pixelsWide:pixelsHigh:pixelFormatType:options:error:", v6, 256, 256, 32, 0, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v8)
    {
      self = -[iconclassificationInput initWithImage_Placeholder:](self, "initWithImage_Placeholder:", objc_msgSend(v8, "imageBufferValue"));
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
  __CVBuffer *v10;
  id v12;

  v7 = (void *)MEMORY[0x1B5E128FC](self, a2);
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithCGImage:pixelsWide:pixelsHigh:pixelFormatType:options:error:", a3, 256, 256, 32, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    CVPixelBufferRelease(self->_image_Placeholder);
    v10 = (__CVBuffer *)objc_msgSend(v8, "imageBufferValue");
    self->_image_Placeholder = v10;
    CVPixelBufferRetain(v10);
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
  __CVBuffer *v10;
  id v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1B5E128FC]();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithImageAtURL:pixelsWide:pixelsHigh:pixelFormatType:options:error:", v6, 256, 256, 32, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    CVPixelBufferRelease(self->_image_Placeholder);
    v10 = (__CVBuffer *)objc_msgSend(v8, "imageBufferValue");
    self->_image_Placeholder = v10;
    CVPixelBufferRetain(v10);
  }

  objc_autoreleasePoolPop(v7);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8 != 0;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E62894D0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("image/Placeholder")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithPixelBuffer:", self->_image_Placeholder);
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
