@implementation SFPrivateBrowsingExplanationModuleCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("PrivateBrowsingExplanationBanner");
}

- (SFPrivateBrowsingExplanationModuleCell)initWithFrame:(CGRect)a3
{
  SFPrivateBrowsingExplanationModuleCell *v3;
  uint64_t v4;
  SFBannerBackgroundView *backgroundView;
  SFPrivateBrowsingExplanationModuleCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFPrivateBrowsingExplanationModuleCell;
  v3 = -[SFPrivateBrowsingExplanationModuleCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIVisualEffectView sf_startPageCellBackgroundEffectViewWithShadow:](SFBannerBackgroundView, "sf_startPageCellBackgroundEffectViewWithShadow:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (SFBannerBackgroundView *)v4;

    -[SFBannerBackgroundView setBannerStyle:](v3->_backgroundView, "setBannerStyle:", 1);
    -[SFBannerBackgroundView _setGroupName:](v3->_backgroundView, "_setGroupName:", 0);
    -[SFPrivateBrowsingExplanationModuleCell setBackgroundView:](v3, "setBackgroundView:", v3->_backgroundView);
    -[SFPrivateBrowsingExplanationModuleCell setOverrideUserInterfaceStyle:](v3, "setOverrideUserInterfaceStyle:", 2);
    v6 = v3;
  }

  return v3;
}

- (void)configureUsingBanner:(id)a3
{
  SFPrivateBrowsingExplanationModuleContentView *explanationView;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  SFPrivateBrowsingExplanationModuleContentView *v8;
  id v9;

  v9 = a3;
  -[SFPrivateBrowsingExplanationModuleCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  explanationView = self->_explanationView;
  if (explanationView
    && (-[SFPrivateBrowsingExplanationModuleContentView banner](explanationView, "banner"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "privateBrowsingExplanationState"),
        v7 = objc_msgSend(v9, "privateBrowsingExplanationState"),
        v5,
        v6 == v7))
  {
    -[SFPrivateBrowsingExplanationModuleContentView setBanner:](self->_explanationView, "setBanner:", v9);
  }
  else
  {
    v8 = -[SFPrivateBrowsingExplanationModuleContentView initWithBanner:]([SFPrivateBrowsingExplanationModuleContentView alloc], "initWithBanner:", v9);
    -[SFPrivateBrowsingExplanationModuleCell _setExplanationView:animated:](self, "_setExplanationView:animated:", v8, self->_explanationView != 0);

  }
}

- (void)_setExplanationView:(id)a3 animated:(BOOL)a4
{
  SFPrivateBrowsingExplanationModuleContentView *v7;
  SFPrivateBrowsingExplanationModuleContentView *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SFPrivateBrowsingExplanationModuleContentView *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  SFPrivateBrowsingExplanationModuleContentView *v16;
  _QWORD v17[4];
  SFPrivateBrowsingExplanationModuleContentView *v18;
  _QWORD v19[4];
  SFPrivateBrowsingExplanationModuleContentView *v20;
  _QWORD v21[4];
  SFPrivateBrowsingExplanationModuleContentView *v22;
  SFPrivateBrowsingExplanationModuleCell *v23;

  v7 = (SFPrivateBrowsingExplanationModuleContentView *)a3;
  v8 = self->_explanationView;
  if (v8 != v7)
  {
    objc_storeStrong((id *)&self->_explanationView, a3);
    -[SFPrivateBrowsingExplanationModuleCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v7);

    -[SFPrivateBrowsingExplanationModuleCell setNeedsLayout](self, "setNeedsLayout");
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v11 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke;
      v21[3] = &unk_1E21E2258;
      v12 = v7;
      v22 = v12;
      v23 = self;
      objc_msgSend(v10, "performWithoutAnimation:", v21);
      v13 = (void *)MEMORY[0x1E0DC3F10];
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_2;
      v19[3] = &unk_1E21E2050;
      v20 = v8;
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_3;
      v17[3] = &unk_1E21E2190;
      v18 = v20;
      objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 50331744, v19, v17, 0.2, 0.0);
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_4;
      v15[3] = &unk_1E21E2050;
      v16 = v12;
      objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 50331744, v15, 0, 0.5, 0.06);

    }
    else
    {
      -[SFPrivateBrowsingExplanationModuleContentView removeFromSuperview](v8, "removeFromSuperview");
    }
  }

}

uint64_t __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

uint64_t __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPrivateBrowsingExplanationModuleCell;
  -[SFPrivateBrowsingExplanationModuleCell layoutSubviews](&v4, sel_layoutSubviews);
  -[SFPrivateBrowsingExplanationModuleCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[SFPrivateBrowsingExplanationModuleContentView setFrame:](self->_explanationView, "setFrame:");

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)SFPrivateBrowsingExplanationModuleCell;
  -[SFPrivateBrowsingExplanationModuleCell preferredLayoutAttributesFittingAttributes:](&v12, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SFPrivateBrowsingExplanationModuleContentView setFrame:](self->_explanationView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v13), 2000.0);
  -[SFPrivateBrowsingExplanationModuleContentView layoutIfNeeded](self->_explanationView, "layoutIfNeeded");
  -[SFPrivateBrowsingExplanationModuleContentView sizeToFit](self->_explanationView, "sizeToFit");
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFPrivateBrowsingExplanationModuleContentView bounds](self->_explanationView, "bounds");
  objc_msgSend(v4, "setFrame:", v6, v8, v10, CGRectGetHeight(v14));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
