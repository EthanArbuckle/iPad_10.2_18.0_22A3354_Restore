@implementation AMSUIPrivacyIconViewController

- (AMSUIPrivacyIconViewController)initWithImage:(id)a3
{
  id v4;
  AMSUIPrivacyIconViewController *v5;
  void *v6;
  uint64_t v7;
  UIImageView *imageView;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSUIPrivacyIconViewController;
  v5 = -[AMSUIPrivacyIconViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    objc_msgSend(v4, "imageWithRenderingMode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v6);
    imageView = v5->_imageView;
    v5->_imageView = (UIImageView *)v7;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIPrivacyIconViewController;
  -[AMSUIPrivacyIconViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[AMSUIPrivacyIconViewController imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentMode:", 1);

  -[AMSUIPrivacyIconViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIPrivacyIconViewController imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v18.receiver = self;
  v18.super_class = (Class)AMSUIPrivacyIconViewController;
  -[AMSUIPrivacyIconViewController viewWillLayoutSubviews](&v18, sel_viewWillLayoutSubviews);
  -[AMSUIPrivacyIconViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AMSUIPrivacyIconViewController imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  objc_msgSend(v12, "sizeThatFits:", CGRectGetWidth(v19) + -44.0, 38.0);
  v14 = v13;

  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  v15 = CGRectGetMidX(v20) + v14 * -0.5;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  v16 = CGRectGetMinY(v21) + 22.0;
  -[AMSUIPrivacyIconViewController imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v15, v16, v14, 38.0);

}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;

  -[AMSUIPrivacyIconViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AMSUIPrivacyIconViewController imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  objc_msgSend(v12, "sizeThatFits:", CGRectGetWidth(v18) + -44.0, 38.0);
  v14 = v13;

  v15 = v14 + 44.0;
  v16 = 60.0;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
