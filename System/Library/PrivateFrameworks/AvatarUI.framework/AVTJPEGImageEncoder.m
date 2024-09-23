@implementation AVTJPEGImageEncoder

- (AVTJPEGImageEncoder)init
{
  return -[AVTJPEGImageEncoder initWithCompressionQuality:](self, "initWithCompressionQuality:", 1.0);
}

- (AVTJPEGImageEncoder)initWithCompressionQuality:(double)a3
{
  AVTJPEGImageEncoder *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTJPEGImageEncoder;
  result = -[AVTJPEGImageEncoder init](&v5, sel_init);
  if (result)
    result->_compressionQuality = a3;
  return result;
}

- (id)imageFromURL:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C99D50];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithContentsOfURL:options:error:", v7, 1, a4);

  if (v8)
  {
    -[AVTJPEGImageEncoder imageFromData:error:](self, "imageFromData:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)imageFromData:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 604, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)dataFromImage:(id)a3
{
  UIImage *v4;
  CGFloat v5;
  void *v6;

  v4 = (UIImage *)a3;
  -[AVTJPEGImageEncoder compressionQuality](self, "compressionQuality");
  UIImageJPEGRepresentation(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fileExtension
{
  return CFSTR("jpeg");
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

@end
