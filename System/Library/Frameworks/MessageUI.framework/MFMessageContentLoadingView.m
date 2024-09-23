@implementation MFMessageContentLoadingView

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)MFMessageContentLoadingView;
  -[MFMessageContentLoadingView dealloc](&v3, sel_dealloc);
}

- (MFMessageContentLoadingView)initWithFrame:(CGRect)a3
{
  MFMessageContentLoadingView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMessageContentLoadingView;
  v3 = -[MFMessageContentLoadingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOADING_ALL_CAPS"), &stru_1E5A6A588, CFSTR("Main"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentLoadingView setLoadingTitle:](v3, "setLoadingTitle:", v5);

    -[MFMessageContentLoadingView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (void)setLoadingTitle:(id)a3
{
  NSString *v4;
  NSString *loadingTitle;
  UILabel *loadingLabel;
  id v7;

  v7 = a3;
  v4 = (NSString *)objc_msgSend(v7, "copy");
  loadingTitle = self->_loadingTitle;
  self->_loadingTitle = v4;

  loadingLabel = self->_loadingLabel;
  if (loadingLabel)
    -[UILabel setText:](loadingLabel, "setText:", self->_loadingTitle);

}

- (BOOL)isLoadingIndicatorVisible
{
  void *v3;
  double v4;
  BOOL v5;

  -[UILabel superview](self->_loadingLabel, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UILabel alpha](self->_loadingLabel, "alpha");
    v5 = v4 == 1.0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setLoadingIndicatorVisible:(BOOL)a3
{
  -[MFMessageContentLoadingView setLoadingIndicatorVisible:animated:](self, "setLoadingIndicatorVisible:animated:", a3, 0);
}

- (void)setLoadingIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v9;
  UILabel *v10;
  UILabel *loadingLabel;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  UIActivityIndicatorView *v18;
  id *v19;
  UILabel *v20;
  void (**v21)(_QWORD);
  id *v22;
  UILabel *v23;
  void (**v24)(void *, uint64_t);
  UIActivityIndicatorView *v25;
  UILabel *v26;
  uint64_t v27;
  UIActivityIndicatorView *v28;
  UILabel *v29;
  UIActivityIndicatorView *v30;
  UILabel *v31;
  _QWORD v32[4];
  UIActivityIndicatorView *v33;
  UILabel *v34;
  _QWORD v35[5];
  UIActivityIndicatorView *v36;
  UILabel *v37;
  _QWORD v38[4];
  UIActivityIndicatorView *v39;
  _QWORD aBlock[5];
  UIActivityIndicatorView *v41;
  UILabel *v42;

  v4 = a4;
  v5 = a3;
  if (-[MFMessageContentLoadingView isLoadingIndicatorVisible](self, "isLoadingIndicatorVisible") != a3)
  {
    if (v5)
    {
      v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      activityIndicatorView = self->_activityIndicatorView;
      self->_activityIndicatorView = v7;

      v9 = v7;
      -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicatorView, "setHidesWhenStopped:", 0);
      -[UIActivityIndicatorView setAccessibilityIdentifier:](self->_activityIndicatorView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B40]);
      v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      loadingLabel = self->_loadingLabel;
      self->_loadingLabel = v10;

      v12 = v10;
      -[MFMessageContentLoadingView loadingTitle](self, "loadingTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_loadingLabel, "setText:", v13);

      objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_loadingLabel, "setTextColor:", v14);

      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_loadingLabel, "setFont:", v15);

      -[UILabel setAccessibilityIdentifier:](self->_loadingLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B48]);
      -[UILabel sizeToFit](self->_loadingLabel, "sizeToFit");
      -[MFMessageContentLoadingView addSubview:](self, "addSubview:", self->_activityIndicatorView);
      -[MFMessageContentLoadingView addSubview:](self, "addSubview:", self->_loadingLabel);
      -[UIActivityIndicatorView setAlpha:](self->_activityIndicatorView, "setAlpha:", 0.0);
      -[UILabel setAlpha:](self->_loadingLabel, "setAlpha:", 0.0);
      v16 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__MFMessageContentLoadingView_setLoadingIndicatorVisible_animated___block_invoke;
      aBlock[3] = &unk_1E5A65BD8;
      aBlock[4] = self;
      v17 = (id *)&v41;
      v18 = v9;
      v19 = (id *)&v42;
      v41 = v18;
      v42 = v12;
      v20 = v12;
      v21 = (void (**)(_QWORD))_Block_copy(aBlock);
      v38[0] = v16;
      v38[1] = 3221225472;
      v38[2] = __67__MFMessageContentLoadingView_setLoadingIndicatorVisible_animated___block_invoke_2;
      v38[3] = &unk_1E5A66750;
      v22 = (id *)&v39;
      v39 = v18;
      v23 = v18;
      v24 = (void (**)(void *, uint64_t))_Block_copy(v38);
    }
    else
    {
      v25 = self->_activityIndicatorView;
      v26 = self->_loadingLabel;
      v27 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __67__MFMessageContentLoadingView_setLoadingIndicatorVisible_animated___block_invoke_3;
      v35[3] = &unk_1E5A65BD8;
      v35[4] = self;
      v17 = (id *)&v36;
      v28 = v25;
      v36 = v28;
      v19 = (id *)&v37;
      v29 = v26;
      v37 = v29;
      v21 = (void (**)(_QWORD))_Block_copy(v35);
      v32[0] = v27;
      v32[1] = 3221225472;
      v32[2] = __67__MFMessageContentLoadingView_setLoadingIndicatorVisible_animated___block_invoke_4;
      v32[3] = &unk_1E5A69660;
      v22 = (id *)&v33;
      v33 = v28;
      v34 = v29;
      v23 = v29;
      v20 = v28;
      v24 = (void (**)(void *, uint64_t))_Block_copy(v32);
      v30 = self->_activityIndicatorView;
      self->_activityIndicatorView = 0;

      v31 = self->_loadingLabel;
      self->_loadingLabel = 0;

    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v21, v24, 0.6);
    }
    else
    {
      v21[2](v21);
      if (v24)
        v24[2](v24, 1);
    }

  }
}

uint64_t __67__MFMessageContentLoadingView_setLoadingIndicatorVisible_animated___block_invoke(id *a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "mailMessageContentViewBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setBackgroundColor:", v2);

  objc_msgSend(a1[5], "setAlpha:", 1.0);
  return objc_msgSend(a1[6], "setAlpha:", 1.0);
}

uint64_t __67__MFMessageContentLoadingView_setLoadingIndicatorVisible_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startAnimating");
}

uint64_t __67__MFMessageContentLoadingView_setLoadingIndicatorVisible_animated___block_invoke_3(id *a1)
{
  objc_msgSend(a1[4], "setBackgroundColor:", 0);
  objc_msgSend(a1[5], "setAlpha:", 0.0);
  return objc_msgSend(a1[6], "setAlpha:", 0.0);
}

uint64_t __67__MFMessageContentLoadingView_setLoadingIndicatorVisible_animated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopAnimating");
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MFMessageContentLoadingView;
  -[MFMessageContentLoadingView layoutSubviews](&v28, sel_layoutSubviews);
  -[MFMessageContentLoadingView bounds](self, "bounds");
  v4 = v3;
  -[MFMessageContentLoadingView activityIndicatorView](self, "activityIndicatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  -[MFMessageContentLoadingView loadingLabel](self, "loadingLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v27 = v11;
  v13 = v12;

  UIRoundToViewScale();
  v15 = v14;
  UIRoundToViewScale();
  v17 = v16;
  if (v4 >= 135.0)
  {
    -[MFMessageContentLoadingView loadingLabel](self, "loadingLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_firstBaselineOffsetFromTop");
    UIRoundToViewScale();
    v19 = v21;

  }
  else
  {
    UIRoundToViewScale();
    v19 = v18;
  }
  -[MFMessageContentLoadingView loadingLabel](self, "loadingLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_firstBaselineOffsetFromTop");
  v24 = v23;

  -[MFMessageContentLoadingView activityIndicatorView](self, "activityIndicatorView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v15, v19, v7, v9);

  -[MFMessageContentLoadingView loadingLabel](self, "loadingLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v17, v9 + 18.0 + v19 - v24, v13, v27);

}

- (NSString)loadingTitle
{
  return self->_loadingTitle;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UILabel)loadingLabel
{
  return self->_loadingLabel;
}

- (void)setLoadingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_loadingLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_loadingTitle, 0);
}

@end
