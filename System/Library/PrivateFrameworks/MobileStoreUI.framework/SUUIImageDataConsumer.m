@implementation SUUIImageDataConsumer

- (id)imageForColor:(id)a3
{
  return 0;
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  return 0;
}

- (id)imageForImage:(id)a3
{
  return a3;
}

- (id)imagePlaceholderForColor:(id)a3
{
  return 0;
}

- (BOOL)isImagePlaceholderAvailable
{
  return 0;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x24BEBD640];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v10 = (void *)objc_msgSend(v8, "initWithData:scale:", v7);

  if (v10)
  {
    -[SUUIImageDataConsumer imageForImage:](self, "imageForImage:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
