@implementation WFGiphyCell

- (WFGiphyCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  WFGiphyCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)WFGiphyCell;
  v7 = -[WFGiphyCell initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    if (initWithFrame__onceToken != -1)
      dispatch_once(&initWithFrame__onceToken, &__block_literal_global_5562);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    -[WFGiphyCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    -[WFGiphyCell setIndicatorView:](v7, "setIndicatorView:", v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", x, y, width, height);
    -[WFGiphyCell contentView](v7, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    -[WFGiphyCell setImageView:](v7, "setImageView:", v10);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v12, "setHidden:", 1);
    objc_msgSend(v12, "setImage:", initWithFrame__selectedImage);
    -[WFGiphyCell contentView](v7, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v12);

    -[WFGiphyCell setSelectedImageView:](v7, "setSelectedImageView:", v12);
  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double MidX;
  double MidY;
  void *v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v25.receiver = self;
  v25.super_class = (Class)WFGiphyCell;
  -[WFGiphyCell layoutSubviews](&v25, sel_layoutSubviews);
  -[WFGiphyCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[WFGiphyCell imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[WFGiphyCell selectedImageView](self, "selectedImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  v14 = *MEMORY[0x24BDBEFB0];
  v15 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[WFGiphyCell indicatorView](self, "indicatorView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "intrinsicContentSize");
  v18 = v17;
  v20 = v19;
  -[WFGiphyCell indicatorView](self, "indicatorView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBounds:", v14, v15, v18, v20);

  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  MidX = CGRectGetMidX(v26);
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  MidY = CGRectGetMidY(v27);
  -[WFGiphyCell indicatorView](self, "indicatorView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCenter:", MidX, MidY);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFGiphyCell;
  -[WFGiphyCell setSelected:](&v6, sel_setSelected_);
  -[WFGiphyCell selectedImageView](self, "selectedImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !v3);

}

- (void)setObject:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  v6 = objc_msgSend(WeakRetained, "isEqual:", v4);

  objc_storeWeak((id *)&self->_object, v4);
  if ((v6 & 1) == 0)
  {
    -[WFGiphyCell dataTask](self, "dataTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

    objc_msgSend(v4, "images");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("fixed_width_downsampled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v4, "images");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("fixed_width_downsampled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(v4, "originalImage");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v15;

    }
    objc_msgSend(v11, "cachedImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UIImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGiphyCell imageView](self, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:", v17);

    objc_msgSend(v11, "cachedImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[WFGiphyCell indicatorView](self, "indicatorView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startAnimating");

      objc_msgSend(MEMORY[0x24BDD1850], "wf_sharedSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "url");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __25__WFGiphyCell_setObject___block_invoke;
      v24[3] = &unk_24E343AF8;
      v24[4] = self;
      v25 = v11;
      v26 = v4;
      v11 = v11;
      objc_msgSend(v21, "dataTaskWithURL:completionHandler:", v22, v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFGiphyCell setDataTask:](self, "setDataTask:", v23);
      objc_msgSend(v23, "resume");

    }
  }

}

- (UIActivityIndicatorView)indicatorView
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_indicatorView);
}

- (void)setIndicatorView:(id)a3
{
  objc_storeWeak((id *)&self->_indicatorView, a3);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (UIImageView)selectedImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_selectedImageView);
}

- (void)setSelectedImageView:(id)a3
{
  objc_storeWeak((id *)&self->_selectedImageView, a3);
}

- (NSURLSessionDataTask)dataTask
{
  return (NSURLSessionDataTask *)objc_loadWeakRetained((id *)&self->_dataTask);
}

- (void)setDataTask:(id)a3
{
  objc_storeWeak((id *)&self->_dataTask, a3);
}

- (WFGiphyObject)object
{
  return (WFGiphyObject *)objc_loadWeakRetained((id *)&self->_object);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_object);
  objc_destroyWeak((id *)&self->_dataTask);
  objc_destroyWeak((id *)&self->_selectedImageView);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_indicatorView);
}

void __25__WFGiphyCell_setObject___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEC14E0], "imageWithData:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __25__WFGiphyCell_setObject___block_invoke_2;
  v6[3] = &unk_24E343AD0;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __25__WFGiphyCell_setObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "indicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

  objc_msgSend(*(id *)(a1 + 40), "setCachedImage:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 56));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "UIImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

void __29__WFGiphyCell_initWithFrame___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  CGSize v10;
  CGRect v11;
  CGRect v12;

  v10.width = 38.0;
  v10.height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", 0.0, 0.0, 38.0, 38.0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x24BEBD420];
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 38.0;
  v11.size.height = 38.0;
  v12 = CGRectInset(v11, 7.0, 7.0);
  objc_msgSend(v0, "bezierPathWithOvalInRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveToPoint:", 13.0, 19.0);
  objc_msgSend(v2, "addLineToPoint:", 17.0, 23.0);
  objc_msgSend(v2, "addLineToPoint:", 25.0, 16.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.300000012);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFill");

  objc_msgSend(v9, "fill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.071, 0.337, 0.843, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  objc_msgSend(v1, "fill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStroke");

  objc_msgSend(v1, "stroke");
  objc_msgSend(v2, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resizableImageWithCapInsets:", 0.0, 0.0, 34.0, 34.0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)initWithFrame__selectedImage;
  initWithFrame__selectedImage = v7;

  UIGraphicsEndImageContext();
}

@end
