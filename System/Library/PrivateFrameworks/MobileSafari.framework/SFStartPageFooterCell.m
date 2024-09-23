@implementation SFStartPageFooterCell

- (void)setBackdropCaptureView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UIVisualEffectView _captureView](self->_buttonBackgroundView, "_captureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
    -[UIVisualEffectView _setCaptureView:](self->_buttonBackgroundView, "_setCaptureView:", v6);

}

- (void)setAction:(id)a3
{
  UIAction **p_action;
  UIButton *button;
  void *v7;
  UIButton *v8;
  void *v9;
  id v10;

  p_action = &self->_action;
  v10 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_action, a3);
    button = self->_button;
    -[UIAction title](*p_action, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](button, "setTitle:forState:", v7, 0);

    v8 = self->_button;
    -[UIAction image](*p_action, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v8, "setImage:forState:", v9, 0);

  }
}

- (SFStartPageFooterCell)initWithFrame:(CGRect)a3
{
  SFStartPageFooterCell *v3;
  SFStartPageFooterCell *v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *buttonBackgroundView;
  SFFooterButton *v8;
  UIButton *button;
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
  UIVisualEffectView *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  SFStartPageFooterCell *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  uint64_t v49;
  _QWORD v50[10];

  v50[8] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)SFStartPageFooterCell;
  v3 = -[SFStartPageFooterCell initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFStartPageFooterCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageCellBackgroundEffectViewWithShadow:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    buttonBackgroundView = v4->_buttonBackgroundView;
    v4->_buttonBackgroundView = (UIVisualEffectView *)v6;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_buttonBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v47 = v5;
    objc_msgSend(v5, "addSubview:", v4->_buttonBackgroundView);
    v8 = objc_alloc_init(SFFooterButton);
    button = v4->_button;
    v4->_button = &v8->super;

    -[UIButton setAccessibilityIdentifier:](v4->_button, "setAccessibilityIdentifier:", CFSTR("customizationsSheetButton"));
    -[UIButton addTarget:action:forControlEvents:](v4->_button, "addTarget:action:forControlEvents:", v4, sel_primaryActionTriggered_, 0x2000);
    objc_msgSend(v5, "addSubview:", v4->_button);
    -[SFStartPageFooterCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton centerXAnchor](v4->_button, "centerXAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v43;
    -[UIButton centerYAnchor](v4->_button, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v40;
    -[UIButton topAnchor](v4->_button, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v11;
    objc_msgSend(v11, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v37;
    -[UIButton leadingAnchor](v4->_button, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v33;
    -[UIVisualEffectView centerXAnchor](v4->_buttonBackgroundView, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerXAnchor](v4->_button, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v30;
    -[UIVisualEffectView centerYAnchor](v4->_buttonBackgroundView, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](v4->_button, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v12;
    -[UIVisualEffectView topAnchor](v4->_buttonBackgroundView, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v4->_button, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v15;
    -[UIVisualEffectView leadingAnchor](v4->_buttonBackgroundView, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v4->_button, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v50[7] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v19);

    -[UIVisualEffectView sf_configureAsStartPageBackground](v4->_buttonBackgroundView, "sf_configureAsStartPageBackground");
    v20 = v4->_buttonBackgroundView;
    objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageBackgroundTraits");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)-[UIVisualEffectView registerForTraitChanges:withAction:](v20, "registerForTraitChanges:withAction:", v21, sel_sf_configureAsStartPageBackground);

    -[SFStartPageFooterCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v23, "registerForTraitChanges:withTarget:action:", v24, v4, sel__updateVibrancy);

    v26 = v4;
  }

  return v4;
}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("Footer");
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageFooterCell;
  -[SFStartPageFooterCell layoutSubviews](&v4, sel_layoutSubviews);
  -[UIButton frame](self->_button, "frame");
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_buttonBackgroundView, "_setContinuousCornerRadius:", v3 * 0.5);
}

- (void)_updateVibrancy
{
  id v3;

  -[SFStartPageFooterCell traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setHidden:](self->_buttonBackgroundView, "setHidden:", objc_msgSend(v3, "sf_usesVibrantAppearance") ^ 1);

}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return (_UIVisualEffectBackdropView *)-[UIVisualEffectView _captureView](self->_buttonBackgroundView, "_captureView");
}

- (void)primaryActionTriggered:(id)a3
{
  -[UIButton sendAction:](self->_button, "sendAction:", self->_action);
}

- (UIAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
