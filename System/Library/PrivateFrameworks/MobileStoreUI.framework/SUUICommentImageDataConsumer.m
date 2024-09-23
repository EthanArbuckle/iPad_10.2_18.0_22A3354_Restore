@implementation SUUICommentImageDataConsumer

- (id)imageForImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void (**completionBlock)(id, void *, _QWORD);
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[SUUIStyledImageDataConsumer imageSize](self, "imageSize");
  v6 = v5;
  v8 = v7;
  -[SUUIStyledImageDataConsumer imageSize](self, "imageSize");
  v10 = v9;
  -[SUUIStyledImageDataConsumer imageSize](self, "imageSize");
  v12 = v11;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __46__SUUICommentImageDataConsumer_imageForImage___block_invoke;
  v18[3] = &unk_2511F52C8;
  v13 = v4;
  v19 = v13;
  -[SUUICommentImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v18, v6, v8, 0.0, 0.0, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithRenderingMode:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  completionBlock = (void (**)(id, void *, _QWORD))self->_completionBlock;
  if (completionBlock)
    completionBlock[2](completionBlock, v15, 0);

  return v15;
}

uint64_t __46__SUUICommentImageDataConsumer_imageForImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:");
}

- (id)_scaledImageWithBounds:(CGSize)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void (**v12)(_QWORD, double, double, double, double);
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  CGSize v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.height;
  v10 = a3.width;
  v11 = (void *)MEMORY[0x24BEBD8F8];
  v12 = (void (**)(_QWORD, double, double, double, double))a5;
  objc_msgSend(v11, "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;
  v18.width = v10;
  v18.height = v9;
  UIGraphicsBeginImageContextWithOptions(v18, 1, v15);

  v12[2](v12, x, y, width, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v16;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
