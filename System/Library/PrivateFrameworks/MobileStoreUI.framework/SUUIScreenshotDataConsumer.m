@implementation SUUIScreenshotDataConsumer

+ (id)consumer
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SUUIScreenshotDataConsumer;
  objc_msgSendSuper2(&v3, sel_consumer);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (SUUIScreenshotDataConsumer)consumerWithScreenshotSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;

  height = a3.height;
  width = a3.width;
  objc_msgSend(a1, "consumer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSize:", width, height);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v6);

  objc_msgSend(v5, "setBorderWidths:", 1.0, 1.0, 1.0, 1.0);
  return (SUUIScreenshotDataConsumer *)v5;
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  _BOOL4 forcesPortrait;
  _BOOL4 v5;
  double height;
  objc_super v8;

  forcesPortrait = self->_forcesPortrait;
  v5 = a4.width > a4.height;
  if (forcesPortrait && v5)
    height = a4.height;
  else
    height = a4.width;
  if (forcesPortrait && v5)
    a4.height = a4.width;
  v8.receiver = self;
  v8.super_class = (Class)SUUIScreenshotDataConsumer;
  -[SUUIStyledImageDataConsumer imageForColor:size:](&v8, sel_imageForColor_size_, a3, height, a4.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)imageForImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (self->_forcesPortrait)
  {
    objc_msgSend(v4, "size");
    v7 = v6;
    objc_msgSend(v5, "size");
    if (v7 > v8)
    {
      v9 = objc_alloc(MEMORY[0x24BEBD640]);
      v10 = objc_retainAutorelease(v5);
      v11 = objc_msgSend(v10, "CGImage");
      objc_msgSend(v10, "scale");
      v5 = (void *)objc_msgSend(v9, "initWithCGImage:scale:orientation:", v11, 2);

    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SUUIScreenshotDataConsumer;
  -[SUUIStyledImageDataConsumer imageForImage:](&v14, sel_imageForImage_, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)forcesPortrait
{
  return self->_forcesPortrait;
}

- (void)setForcesPortrait:(BOOL)a3
{
  self->_forcesPortrait = a3;
}

@end
