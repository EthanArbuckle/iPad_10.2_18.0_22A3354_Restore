@implementation HUCameraLoadingActivityIndicatorView

- (HUCameraLoadingActivityIndicatorView)initWithFrame:(CGRect)a3
{
  HUCameraLoadingActivityIndicatorView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUCameraLoadingActivityIndicatorView;
  v3 = -[HUCameraLoadingActivityIndicatorView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraLoadingActivityIndicatorView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[HUCameraLoadingActivityIndicatorView loadingActivityIndicator](v3, "loadingActivityIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraLoadingActivityIndicatorView addSubview:](v3, "addSubview:", v5);

    -[HUCameraLoadingActivityIndicatorView loadingActivityIndicator](v3, "loadingActivityIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraLoadingActivityIndicatorView centerXAnchor](v3, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

    -[HUCameraLoadingActivityIndicatorView loadingActivityIndicator](v3, "loadingActivityIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraLoadingActivityIndicatorView centerYAnchor](v3, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

  }
  return v3;
}

- (void)willMoveToSuperview:(id)a3
{
  void *v4;
  id v5;

  -[HUCameraLoadingActivityIndicatorView loadingActivityIndicator](self, "loadingActivityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

}

- (UIActivityIndicatorView)loadingActivityIndicator
{
  UIActivityIndicatorView *loadingActivityIndicator;
  UIActivityIndicatorView *v4;
  void *v5;
  UIActivityIndicatorView *v6;

  loadingActivityIndicator = self->_loadingActivityIndicator;
  if (!loadingActivityIndicator)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 101);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v4, "setColor:", v5);

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = self->_loadingActivityIndicator;
    self->_loadingActivityIndicator = v4;

    loadingActivityIndicator = self->_loadingActivityIndicator;
  }
  return loadingActivityIndicator;
}

- (void)setLoadingActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingActivityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingActivityIndicator, 0);
}

@end
