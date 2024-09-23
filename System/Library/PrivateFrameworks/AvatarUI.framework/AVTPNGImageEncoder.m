@implementation AVTPNGImageEncoder

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
    -[AVTPNGImageEncoder imageFromData:error:](self, "imageFromData:error:", v8, a4);
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
  return UIImagePNGRepresentation((UIImage *)a3);
}

- (id)fileExtension
{
  return CFSTR("png");
}

@end
