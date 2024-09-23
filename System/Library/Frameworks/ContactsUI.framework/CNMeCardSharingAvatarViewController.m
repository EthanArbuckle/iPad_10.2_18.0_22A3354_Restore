@implementation CNMeCardSharingAvatarViewController

- (CNMeCardSharingAvatarViewController)initWithAvatarProvider:(id)a3
{
  return -[CNMeCardSharingAvatarViewController initWithAvatarProvider:mode:](self, "initWithAvatarProvider:mode:", a3, 0);
}

- (CNMeCardSharingAvatarViewController)initWithAvatarProvider:(id)a3 mode:(int64_t)a4
{
  id v7;
  CNMeCardSharingAvatarViewController *v8;
  CNMeCardSharingAvatarViewController *v9;
  void *v10;
  CNAvatarImageRenderer *v11;
  uint64_t v12;
  CNAvatarImageProvider *fallbackImageProvider;
  CNMeCardSharingAvatarViewController *v14;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNMeCardSharingAvatarViewController;
  v8 = -[CNMeCardSharingAvatarViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_avatarProvider, a3);
    +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNAvatarImageRenderer initWithSettings:]([CNAvatarImageRenderer alloc], "initWithSettings:", v10);
    -[CNAvatarImageRenderer placeholderImageProvider](v11, "placeholderImageProvider");
    v12 = objc_claimAutoreleasedReturnValue();
    fallbackImageProvider = v9->_fallbackImageProvider;
    v9->_fallbackImageProvider = (CNAvatarImageProvider *)v12;

    v9->_mode = a4;
    v9->_needsReload = 1;
    v14 = v9;

  }
  return v9;
}

- (void)loadView
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
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIView *v17;
  UIView *avatarContainerView;
  UIImageView *v19;
  UIImageView *imageView;
  id v21;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v7, v9, v11);
  v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v17 = (UIView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
  avatarContainerView = self->_avatarContainerView;
  self->_avatarContainerView = v17;

  v19 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v13, v14, v15, v16);
  imageView = self->_imageView;
  self->_imageView = v19;

  -[UIImageView setAlpha:](self->_imageView, "setAlpha:", 0.0);
  -[CNMeCardSharingAvatarViewController configureSubviews](self, "configureSubviews");
  objc_msgSend(v21, "addSubview:", self->_avatarContainerView);
  -[UIView addSubview:](self->_avatarContainerView, "addSubview:", self->_imageView);
  -[CNMeCardSharingAvatarViewController setView:](self, "setView:", v21);

}

- (void)configureSubviews
{
  void *v3;
  void *v4;
  CAShapeLayer *v5;
  CAShapeLayer *circularLayer;
  CAShapeLayer *v7;
  void *v8;
  id v9;

  if (-[CNMeCardSharingAvatarViewController showsPosterAnimation](self, "showsPosterAnimation"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_avatarContainerView, "setBackgroundColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v4);

    self->_isWaitingForPosterPreviews = -[CNMeCardSharingAvatarViewController showsPosterAnimation](self, "showsPosterAnimation");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    circularLayer = self->_circularLayer;
    self->_circularLayer = v5;

    v7 = self->_circularLayer;
    -[UIView layer](self->_avatarContainerView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMask:", v7);

    -[UIView setClipsToBounds:](self->_avatarContainerView, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_avatarContainerView, "setBackgroundColor:", v9);

  }
}

- (void)viewDidLoad
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapGestureRecognizer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNMeCardSharingAvatarViewController;
  -[CNMeCardSharingAvatarViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapAvatarView_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v3;

  -[UIView addGestureRecognizer:](self->_avatarContainerView, "addGestureRecognizer:", self->_tapGestureRecognizer);
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingAvatarViewController;
  -[CNMeCardSharingAvatarViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  if (-[CNMeCardSharingAvatarViewController needsReload](self, "needsReload"))
    -[CNMeCardSharingAvatarViewController reload](self, "reload");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  id v4;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)CNMeCardSharingAvatarViewController;
  -[CNMeCardSharingAvatarViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[CNMeCardSharingAvatarViewController frameForContainerView](self, "frameForContainerView");
  -[UIView setFrame:](self->_avatarContainerView, "setFrame:");
  v3 = (void *)MEMORY[0x1E0DC3508];
  -[UIView bounds](self->_avatarContainerView, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_circularLayer, "setPath:", objc_msgSend(v4, "CGPath"));
  -[UIView bounds](self->_avatarContainerView, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[UIView bounds](self->_avatarContainerView, "bounds");
  v7 = CGRectInset(v6, 12.0, 0.0);
  -[UILabel setFrame:](self->_addPhotoLabel, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);

}

- (CGRect)frameForContainerView
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Width;
  double Height;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  v3 = -[CNMeCardSharingAvatarViewController showsPosterAnimation](self, "showsPosterAnimation");
  -[CNMeCardSharingAvatarViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (v3)
  {

  }
  else
  {

    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    Width = CGRectGetWidth(v20);
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    Height = CGRectGetHeight(v21);
    if (Width >= Height)
      Width = Height;
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    v15 = floor((CGRectGetHeight(v22) - Width) * 0.5);
    v23.origin.x = v6;
    v23.origin.y = v8;
    v23.size.width = v10;
    v23.size.height = v12;
    v6 = floor((CGRectGetWidth(v23) - Width) * 0.5);
    v8 = v15;
    v10 = Width;
    v12 = Width;
  }
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)updateWithAvatarProvider:(id)a3
{
  CNMeCardSharingAvatarProvider *v5;
  CNMeCardSharingAvatarProvider *v6;

  v5 = (CNMeCardSharingAvatarProvider *)a3;
  if (self->_avatarProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_avatarProvider, a3);
    -[CNMeCardSharingAvatarViewController reload](self, "reload");
    v5 = v6;
  }

}

- (void)reload
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[CNMeCardSharingAvatarViewController showsPosterAnimation](self, "showsPosterAnimation"))
  {
    -[CNMeCardSharingAvatarViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = 1;
      goto LABEL_7;
    }
    -[CNMeCardSharingAvatarViewController reloadPosterImage](self, "reloadPosterImage");
  }
  else
  {
    -[CNMeCardSharingAvatarViewController reloadAvatarImage](self, "reloadAvatarImage");
  }
  v6 = 0;
LABEL_7:
  -[CNMeCardSharingAvatarViewController setNeedsReload:](self, "setNeedsReload:", v6);
}

- (void)reloadAvatarImage
{
  double v3;
  double v4;
  double v6;
  double v7;
  CNMeCardSharingAvatarProvider *avatarProvider;
  _QWORD v9[4];
  id v10[3];
  id location;

  -[UIImageView bounds](self->_imageView, "bounds");
  if (*MEMORY[0x1E0C9D820] == v3 && *(double *)(MEMORY[0x1E0C9D820] + 8) == v4)
  {
    v7 = 200.0;
LABEL_10:
    v6 = v7;
    goto LABEL_11;
  }
  v6 = v3;
  v7 = v4;
  if (v3 != v4)
  {
    if (v3 >= v4)
      v7 = v3;
    goto LABEL_10;
  }
LABEL_11:
  objc_initWeak(&location, self);
  avatarProvider = self->_avatarProvider;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CNMeCardSharingAvatarViewController_reloadAvatarImage__block_invoke;
  v9[3] = &unk_1E204DAF0;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&v6;
  v10[2] = *(id *)&v7;
  -[CNMeCardSharingAvatarProvider generateAvatarImageOfSize:imageHandler:](avatarProvider, "generateAvatarImageOfSize:imageHandler:", v9, v6, v7);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)reloadPosterImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD);
  void (**v16)(_QWORD);
  _QWORD block[7];
  _QWORD v18[5];
  id v19;
  id v20;
  double v21;
  double v22;
  _QWORD v23[5];
  id v24;
  double v25;
  double v26;
  _QWORD aBlock[5];

  -[UIImageView bounds](self->_imageView, "bounds");
  v5 = v4;
  v6 = v3;
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] == v4 && v7 == v3)
  {
    -[CNMeCardSharingAvatarViewController portraitScreenSize](self, "portraitScreenSize", *MEMORY[0x1E0C9D820], v7);
    v5 = v9;
    v6 = v10;
  }
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke;
  aBlock[3] = &unk_1E204F648;
  aBlock[4] = self;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_4;
  v23[3] = &unk_1E204DB18;
  v23[4] = self;
  v12 = _Block_copy(aBlock);
  v24 = v12;
  v25 = v5;
  v26 = v6;
  v13 = _Block_copy(v23);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_7;
  v18[3] = &unk_1E204DB90;
  v18[4] = self;
  v14 = v12;
  v19 = v14;
  v15 = v13;
  v20 = v15;
  v21 = v5;
  v22 = v6;
  v16 = (void (**)(_QWORD))_Block_copy(v18);
  -[CNMeCardSharingAvatarViewController addPosterAnimationLoadingSpinner](self, "addPosterAnimationLoadingSpinner");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16[2](v16);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[2](v15);
  }
  else
  {
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_10;
    block[3] = &unk_1E204E668;
    block[4] = self;
    *(double *)&block[5] = v5;
    *(double *)&block[6] = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (void)addPosterAnimationLoadingSpinner
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    -[CNMeCardSharingAvatarViewController setActivityIndicator:](self, "setActivityIndicator:", v4);

    -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v20;
    -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v10;
    -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
  }
  -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startAnimating");

}

- (void)removePosterAnimationLoadingSpinner
{
  void *v3;
  void *v4;
  void *v5;

  -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAnimating");

    -[CNMeCardSharingAvatarViewController activityIndicator](self, "activityIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[CNMeCardSharingAvatarViewController setActivityIndicator:](self, "setActivityIndicator:", 0);
  }
}

- (CGSize)portraitScreenSize
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 <= v7)
    v8 = v4;
  else
    v8 = v7;
  if (v4 <= v7)
    v9 = v7;
  else
    v9 = v4;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)addPosterAnimationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNMeCardSharingAvatarViewController setPosterAnimationController:](self, "setPosterAnimationController:", v4);
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(v4, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v30;
  objc_msgSend(v4, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v25;
  objc_msgSend(v4, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v11;
  objc_msgSend(v4, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingAvatarViewController avatarContainerView](self, "avatarContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
  -[CNMeCardSharingAvatarViewController addChildViewController:](self, "addChildViewController:", v4);
  self->_hasImage = 1;
  -[CNMeCardSharingAvatarViewController viewIfLoaded](self, "viewIfLoaded");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_mode == 1;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __68__CNMeCardSharingAvatarViewController_addPosterAnimationController___block_invoke;
  v35[3] = &unk_1E2050400;
  v35[4] = self;
  v36 = v4;
  v20 = v4;
  -[CNMeCardSharingAvatarViewController updateImageAnimated:newImage:placeHolder:additionalAnimatedChanges:](self, "updateImageAnimated:newImage:placeHolder:additionalAnimatedChanges:", v18 != 0, 0, v19, v35);

  -[CNMeCardSharingAvatarViewController delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "avatarViewControllerDidUpdateImage:needsLayout:", self, 0);

}

- (void)removePosterAnimationController
{
  void *v3;

  -[CNMeCardSharingAvatarViewController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_46272);

  -[CNMeCardSharingAvatarViewController setPosterAnimationController:](self, "setPosterAnimationController:", 0);
}

- (void)updateViewsToUseGeneratedPosterImage:(id)a3 forSize:(CGSize)a4
{
  -[CNMeCardSharingAvatarViewController updateViewsToUseGeneratedImage:forSize:usingFallback:](self, "updateViewsToUseGeneratedImage:forSize:usingFallback:", a3, 0, a4.width, a4.height);
}

- (void)updateViewsToUseGeneratedAvatarImage:(id)a3 forSize:(CGSize)a4
{
  -[CNMeCardSharingAvatarViewController updateViewsToUseGeneratedImage:forSize:usingFallback:](self, "updateViewsToUseGeneratedImage:forSize:usingFallback:", a3, 1, a4.width, a4.height);
}

- (void)updateViewsToUseGeneratedImage:(id)a3 forSize:(CGSize)a4 usingFallback:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v9;
  id v10;
  _BOOL8 v11;
  CNAvatarImageProvider *fallbackImageProvider;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  v18 = v9;
  if (v9)
  {
    self->_hasImage = 1;
    v10 = v9;
    v11 = -[CNMeCardSharingAvatarViewController showsPosterAnimation](self, "showsPosterAnimation");
  }
  else
  {
    self->_hasImage = 0;
    if (v5)
    {
      fallbackImageProvider = self->_fallbackImageProvider;
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scale");
      -[CNAvatarImageProvider imageForSize:scale:](fallbackImageProvider, "imageForSize:scale:", width, height, v14);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    v11 = 0;
  }
  -[CNMeCardSharingAvatarViewController viewIfLoaded](self, "viewIfLoaded");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingAvatarViewController updateImageAnimated:newImage:placeHolder:additionalAnimatedChanges:](self, "updateImageAnimated:newImage:placeHolder:additionalAnimatedChanges:", v16 != 0, v10, v11, &__block_literal_global_27_46271);

  -[CNMeCardSharingAvatarViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "avatarViewControllerDidUpdateImage:needsLayout:", self, -[CNMeCardSharingAvatarViewController posterPreviewsGenerationTimedOut](self, "posterPreviewsGenerationTimedOut"));

}

- (void)updateImageAnimated:(BOOL)a3 newImage:(id)a4 placeHolder:(BOOL)a5 additionalAnimatedChanges:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  UIImageView *imageView;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD aBlock[4];
  id v24;
  CNMeCardSharingAvatarViewController *v25;
  id v26;
  BOOL v27;

  v7 = a5;
  v8 = a3;
  v10 = a4;
  v11 = a6;
  if (v7)
    v12 = 0;
  else
    v12 = v10;
  v13 = v12;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__CNMeCardSharingAvatarViewController_updateImageAnimated_newImage_placeHolder_additionalAnimatedChanges___block_invoke;
  aBlock[3] = &unk_1E204DC18;
  v15 = v13;
  v27 = v8;
  v24 = v15;
  v25 = self;
  v16 = v11;
  v26 = v16;
  v17 = (void (**)(_QWORD))_Block_copy(aBlock);
  v18 = v17;
  if (v8)
  {
    v19 = (void *)MEMORY[0x1E0DC3F10];
    imageView = self->_imageView;
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __106__CNMeCardSharingAvatarViewController_updateImageAnimated_newImage_placeHolder_additionalAnimatedChanges___block_invoke_2;
    v21[3] = &unk_1E204FB40;
    v22 = v17;
    objc_msgSend(v19, "transitionWithView:duration:options:animations:completion:", imageView, 5243012, v21, 0, 0.5);

  }
  else
  {
    v17[2](v17);
  }

}

- (void)didTapAvatarView:(id)a3
{
  id v4;

  -[CNMeCardSharingAvatarViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarViewControllerWasTapped:", self);

}

- (BOOL)showsPosterAnimation
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 0;
  else
    return !-[CNMeCardSharingAvatarViewController posterPreviewsGenerationTimedOut](self, "posterPreviewsGenerationTimedOut");
}

- (BOOL)isPosterAnimationPausable
{
  return +[CNPosterOnboardingSettingsAnimationViewController isAnimationPausable](_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController, "isAnimationPausable");
}

- (BOOL)isPosterAnimationPaused
{
  void *v3;
  void *v4;
  char v5;

  -[CNMeCardSharingAvatarViewController posterAnimationController](self, "posterAnimationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return +[CNPosterOnboardingSettingsAnimationViewController pausableAnimationStartingValue](_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController, "pausableAnimationStartingValue");
  -[CNMeCardSharingAvatarViewController posterAnimationController](self, "posterAnimationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAnimationPaused");

  return v5;
}

- (void)togglePosterAnimation
{
  id v2;

  -[CNMeCardSharingAvatarViewController posterAnimationController](self, "posterAnimationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleAnimation");

}

- (CNMeCardSharingAvatarViewControllerDelegate)delegate
{
  return (CNMeCardSharingAvatarViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isWaitingForPosterPreviews
{
  return self->_isWaitingForPosterPreviews;
}

- (void)setIsWaitingForPosterPreviews:(BOOL)a3
{
  self->_isWaitingForPosterPreviews = a3;
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setHasImage:(BOOL)a3
{
  self->_hasImage = a3;
}

- (BOOL)posterPreviewsGenerationTimedOut
{
  return self->_posterPreviewsGenerationTimedOut;
}

- (void)setPosterPreviewsGenerationTimedOut:(BOOL)a3
{
  self->_posterPreviewsGenerationTimedOut = a3;
}

- (UIView)avatarContainerView
{
  return self->_avatarContainerView;
}

- (void)setAvatarContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContainerView, a3);
}

- (CAShapeLayer)circularLayer
{
  return self->_circularLayer;
}

- (void)setCircularLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circularLayer, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)addPhotoLabel
{
  return self->_addPhotoLabel;
}

- (void)setAddPhotoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_addPhotoLabel, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController)posterAnimationController
{
  return self->_posterAnimationController;
}

- (void)setPosterAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_posterAnimationController, a3);
}

- (CNMeCardSharingAvatarProvider)avatarProvider
{
  return self->_avatarProvider;
}

- (void)setAvatarProvider:(id)a3
{
  objc_storeStrong((id *)&self->_avatarProvider, a3);
}

- (CNAvatarImageProvider)fallbackImageProvider
{
  return self->_fallbackImageProvider;
}

- (void)setFallbackImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackImageProvider, a3);
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewController, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_fallbackImageProvider, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);
  objc_storeStrong((id *)&self->_posterAnimationController, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_addPhotoLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_circularLayer, 0);
  objc_storeStrong((id *)&self->_avatarContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __106__CNMeCardSharingAvatarViewController_updateImageAnimated_newImage_placeHolder_additionalAnimatedChanges___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  BOOL v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = 1.0;
  else
    v3 = 0.0;
  if (*(_BYTE *)(a1 + 56))
    v4 = v2 == 0;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);

    if (v5 != v6)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "setImage:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "alpha");
  if (v7 != v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "setAlpha:", v3);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __106__CNMeCardSharingAvatarViewController_updateImageAnimated_newImage_placeHolder_additionalAnimatedChanges___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__CNMeCardSharingAvatarViewController_removePosterAnimationController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "willMoveToParentViewController:", 0);
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(v3, "removeFromParentViewController");
  objc_msgSend(v3, "didMoveToParentViewController:", 0);

}

void __68__CNMeCardSharingAvatarViewController_addPosterAnimationController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setBackgroundColor:", v2);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_2;
  block[3] = &unk_1E204F648;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "setIsWaitingForPosterPreviews:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "avatarProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_5;
  v6[3] = &unk_1E204DAF0;
  objc_copyWeak(&v7, &location);
  v8 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "generatePosterImageWithWindowScene:imageHandler:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  __int128 v9;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "removePosterAnimationController");
  objc_msgSend(*(id *)(a1 + 32), "setIsWaitingForPosterPreviews:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "avatarProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_8;
  v6[3] = &unk_1E204DB68;
  objc_copyWeak(&v8, &location);
  v7 = *(id *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v2, "generatePosterAnimationControllerWithWindowScene:imageHandler:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateViewsToUseGeneratedPosterImage:forSize:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;
  __int128 v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_9;
  block[3] = &unk_1E204DB40;
  block[4] = WeakRetained;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_9(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "removePosterAnimationLoadingSpinner");
  objc_msgSend(*(id *)(a1 + 32), "setIsWaitingForPosterPreviews:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "posterPreviewsGenerationTimedOut");
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
    {
      return objc_msgSend(v3, "addPosterAnimationController:");
    }
    else
    {
      objc_msgSend(v3, "avatarProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      else
        return objc_msgSend(*(id *)(a1 + 32), "updateViewsToUseGeneratedPosterImage:forSize:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
  }
  return result;
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;
  __int128 v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_6;
  v6[3] = &unk_1E204DAC8;
  v6[4] = WeakRetained;
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 40);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_6(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsWaitingForPosterPreviews:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "posterPreviewsGenerationTimedOut");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "removePosterAnimationLoadingSpinner");
    return objc_msgSend(*(id *)(a1 + 32), "updateViewsToUseGeneratedPosterImage:forSize:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  return result;
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "isWaitingForPosterPreviews"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPosterPreviewsGenerationTimedOut:", 1);
    objc_msgSend(*(id *)(a1 + 32), "removePosterAnimationLoadingSpinner");
    objc_msgSend(*(id *)(a1 + 32), "configureSubviews");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_3;
    block[3] = &unk_1E204F648;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadAvatarImage");
}

void __56__CNMeCardSharingAvatarViewController_reloadAvatarImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;
  __int128 v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CNMeCardSharingAvatarViewController_reloadAvatarImage__block_invoke_2;
  v6[3] = &unk_1E204DAC8;
  v6[4] = WeakRetained;
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 40);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadAvatarImage__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateViewsToUseGeneratedAvatarImage:forSize:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end
