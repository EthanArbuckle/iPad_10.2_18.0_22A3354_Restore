@implementation HUImageOBWelcomeController

- (HUImageOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HUImageOBWelcomeController *v16;
  objc_super v18;

  v10 = (objc_class *)MEMORY[0x1E0CEA658];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v10 alloc], "initWithImage:", v11);

  v18.receiver = self;
  v18.super_class = (Class)HUImageOBWelcomeController;
  v16 = -[HUCenterFillOBWelcomeController initWithTitle:detailText:icon:contentView:](&v18, sel_initWithTitle_detailText_icon_contentView_, v14, v13, v12, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_contentImageView, v15);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v16->_contentImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  return v16;
}

- (HUImageOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTitle_detailText_icon_contentImage_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUImageOBWelcomeController.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUImageOBWelcomeController initWithTitle:detailText:icon:contentView:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUImageOBWelcomeController;
  -[HUCenterFillOBWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[HUImageOBWelcomeController _updateContentMode](self, "_updateContentMode");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUImageOBWelcomeController;
  -[OBWelcomeFullCenterContentController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HUImageOBWelcomeController _updateContentMode](self, "_updateContentMode");
}

- (UIImage)contentImage
{
  void *v2;
  void *v3;

  -[HUImageOBWelcomeController contentImageView](self, "contentImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setContentImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[HUImageOBWelcomeController contentImageView](self, "contentImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5 != v9)
  {
    -[HUImageOBWelcomeController contentImageView](self, "contentImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v9);

    v8 = -[HUImageOBWelcomeController isViewLoaded](self, "isViewLoaded");
    v6 = v9;
    if (v8)
    {
      -[HUImageOBWelcomeController _viewDidUpdateContent](self, "_viewDidUpdateContent");
      v6 = v9;
    }
  }

}

- (double)_contentAspectRatio
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  -[HUImageOBWelcomeController contentImage](self, "contentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUImageOBWelcomeController contentImage](self, "contentImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;
    -[HUImageOBWelcomeController contentImage](self, "contentImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v9 = v6 / v8;

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUImageOBWelcomeController;
    -[HUCenterFillOBWelcomeController _contentAspectRatio](&v12, sel__contentAspectRatio);
    return v10;
  }
  return v9;
}

- (void)_viewDidUpdateContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUImageOBWelcomeController;
  -[HUCenterFillOBWelcomeController _viewDidUpdateContent](&v3, sel__viewDidUpdateContent);
  -[HUImageOBWelcomeController _updateContentMode](self, "_updateContentMode");
}

- (void)_updateContentMode
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;

  -[HUImageOBWelcomeController contentImage](self, "contentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[UIImageView bounds](self->_contentImageView, "bounds");
  if (v5 > v6)
  {

    v12 = 1;
  }
  else
  {
    -[HUImageOBWelcomeController contentImage](self, "contentImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v9 = v8;
    -[UIImageView bounds](self->_contentImageView, "bounds");
    v11 = v10;

    if (v9 <= v11)
      v12 = 4;
    else
      v12 = 1;
  }
  -[UIImageView setContentMode:](self->_contentImageView, "setContentMode:", v12);
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
}

@end
