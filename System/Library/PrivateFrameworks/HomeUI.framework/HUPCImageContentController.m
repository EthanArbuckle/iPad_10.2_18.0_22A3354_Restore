@implementation HUPCImageContentController

- (HUPCImageContentController)initWithTitle:(id)a3 detailText:(id)a4 contentImage:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HUPCImageContentController *v13;
  objc_super v15;

  v8 = (objc_class *)MEMORY[0x1E0CEA658];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithImage:", v9);

  v15.receiver = self;
  v15.super_class = (Class)HUPCImageContentController;
  v13 = -[HUPCCenterFillContentController initWithTitle:detailText:contentView:](&v15, sel_initWithTitle_detailText_contentView_, v11, v10, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_contentImageView, v12);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v13->_contentImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  return v13;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUPCImageContentController;
  -[HUPCCenterFillContentController viewDidLoad](&v3, sel_viewDidLoad);
  -[HUPCImageContentController _updateContentMode](self, "_updateContentMode");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUPCImageContentController;
  -[HUPCFullCenterContentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HUPCImageContentController _updateContentMode](self, "_updateContentMode");
}

- (UIImage)contentImage
{
  void *v2;
  void *v3;

  -[HUPCImageContentController contentImageView](self, "contentImageView");
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
  -[HUPCImageContentController contentImageView](self, "contentImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5 != v9)
  {
    -[HUPCImageContentController contentImageView](self, "contentImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v9);

    v8 = -[HUPCImageContentController isViewLoaded](self, "isViewLoaded");
    v6 = v9;
    if (v8)
    {
      -[HUPCImageContentController _viewDidUpdateContent](self, "_viewDidUpdateContent");
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

  -[HUPCImageContentController contentImage](self, "contentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUPCImageContentController contentImage](self, "contentImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;
    -[HUPCImageContentController contentImage](self, "contentImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v9 = v6 / v8;

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUPCImageContentController;
    -[HUPCCenterFillContentController _contentAspectRatio](&v12, sel__contentAspectRatio);
    return v10;
  }
  return v9;
}

- (void)_viewDidUpdateContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUPCImageContentController;
  -[HUPCCenterFillContentController _viewDidUpdateContent](&v3, sel__viewDidUpdateContent);
  -[HUPCImageContentController _updateContentMode](self, "_updateContentMode");
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

  -[HUPCImageContentController contentImage](self, "contentImage");
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
    -[HUPCImageContentController contentImage](self, "contentImage");
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
