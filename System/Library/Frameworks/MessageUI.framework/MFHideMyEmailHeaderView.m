@implementation MFHideMyEmailHeaderView

- (MFHideMyEmailHeaderView)initWithFrame:(CGRect)a3 address:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  MFHideMyEmailHeaderView *v10;
  MFHideMyEmailHeaderView *v11;
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
  uint64_t v25;
  UIListContentView *contentView;
  void *v27;
  void *v28;
  uint64_t v29;
  UIButton *infoButton;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v38;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)MFHideMyEmailHeaderView;
  v10 = -[MFHideMyEmailHeaderView initWithFrame:](&v38, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[MFHideMyEmailHeaderView setAddress:](v10, "setAddress:", v9);
    -[MFHideMyEmailHeaderView setAxis:](v11, "setAxis:", 0);
    -[MFHideMyEmailHeaderView setAlignment:](v11, "setAlignment:", 3);
    -[MFHideMyEmailHeaderView setDistribution:](v11, "setDistribution:", 0);
    -[MFHideMyEmailHeaderView setSpacing:](v11, "setSpacing:", 8.0);
    -[MFHideMyEmailHeaderView setLayoutMarginsRelativeArrangement:](v11, "setLayoutMarginsRelativeArrangement:", 1);
    -[MFHideMyEmailHeaderView setDirectionalLayoutMargins:](v11, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 16.0);
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextToSecondaryTextVerticalPadding:", 4.0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v14);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v15);

    objc_msgSend(v12, "textProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNumberOfLines:", 0);

    objc_msgSend(v12, "textProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v12, "setSecondaryText:", v9);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "secondaryTextProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v19);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "secondaryTextProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setColor:", v21);

    objc_msgSend(v12, "secondaryTextProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setNumberOfLines:", 0);

    objc_msgSend(v12, "secondaryTextProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v12, "directionalLayoutMargins");
    objc_msgSend(v12, "setDirectionalLayoutMargins:");
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39B0]), "initWithConfiguration:", v12);
    contentView = v11->_contentView;
    v11->_contentView = (UIListContentView *)v25;

    -[UIListContentView setTranslatesAutoresizingMaskIntoConstraints:](v11->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFHideMyEmailHeaderView addArrangedSubview:](v11, "addArrangedSubview:", v11->_contentView);
    v27 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("info.circle"), 21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "systemButtonWithImage:target:action:", v28, v11, sel_infoButtonPressed_);
    v29 = objc_claimAutoreleasedReturnValue();
    infoButton = v11->_infoButton;
    v11->_infoButton = (UIButton *)v29;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v11->_infoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFHideMyEmailHeaderView addArrangedSubview:](v11, "addArrangedSubview:", v11->_infoButton);
    -[UIButton widthAnchor](v11->_infoButton, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton heightAnchor](v11->_infoButton, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 1.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", v11);
    -[MFHideMyEmailHeaderView setEditInteraction:](v11, "setEditInteraction:", v34);

    -[MFHideMyEmailHeaderView editInteraction](v11, "editInteraction");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHideMyEmailHeaderView addInteraction:](v11, "addInteraction:", v35);

    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v11, sel_didTriggerEditGesture_);
    objc_msgSend(v36, "setAllowedTouchTypes:", &unk_1E5A9FF98);
    -[MFHideMyEmailHeaderView addGestureRecognizer:](v11, "addGestureRecognizer:", v36);

  }
  return v11;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[UIListContentView frame](self->_contentView, "frame", a3.width, a3.height);
  v5 = v4 + 14.0;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[MFHideMyEmailHeaderView bounds](self, "bounds");
  -[MFHideMyEmailHeaderView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFHideMyEmailHeaderView bounds](self, "bounds");
  if (width != v8)
    -[MFHideMyEmailHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v9.receiver = self;
  v9.super_class = (Class)MFHideMyEmailHeaderView;
  -[MFHideMyEmailHeaderView setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (void)infoButtonPressed:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[MFPreferencesURL hideMyEmailURL](MFPreferencesURL, "hideMyEmailURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3;
}

- (void)copy:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFHideMyEmailHeaderView address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v4);

}

- (void)didTriggerEditGesture:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "locationInView:", self);
  objc_msgSend(MEMORY[0x1E0DC3798], "configurationWithIdentifier:sourcePoint:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFHideMyEmailHeaderView editInteraction](self, "editInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentEditMenuWithConfiguration:", v5);

}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (UIEditMenuInteraction)editInteraction
{
  return self->_editInteraction;
}

- (void)setEditInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_editInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editInteraction, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
