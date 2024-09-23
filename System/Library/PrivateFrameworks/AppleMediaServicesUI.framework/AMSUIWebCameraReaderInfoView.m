@implementation AMSUIWebCameraReaderInfoView

- (AMSUIWebCameraReaderInfoView)initWithFrame:(CGRect)a3
{
  AMSUIWebCameraReaderInfoView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebCameraReaderInfoView;
  v3 = -[AMSUICommonView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[AMSUIWebAppearance systemBackgroundColor](AMSUIWebAppearance, "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView ams_setBackgroundColor:](v3, "ams_setBackgroundColor:", v4);

    -[AMSUIWebCameraReaderInfoView _createLabelWithLines:title:](v3, "_createLabelWithLines:title:", 1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderInfoView setPrimaryLabel:](v3, "setPrimaryLabel:", v5);

    -[AMSUIWebCameraReaderInfoView primaryLabel](v3, "primaryLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderInfoView addSubview:](v3, "addSubview:", v6);

    -[AMSUIWebCameraReaderInfoView _createLabelWithLines:title:](v3, "_createLabelWithLines:title:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderInfoView setSecondaryLabel:](v3, "setSecondaryLabel:", v7);

    -[AMSUIWebCameraReaderInfoView secondaryLabel](v3, "secondaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderInfoView addSubview:](v3, "addSubview:", v8);

    -[AMSUIWebCameraReaderInfoView _createButtonWithTarget:selector:](v3, "_createButtonWithTarget:selector:", v3, sel__bottomLinkSelected_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderInfoView setBottomLink:](v3, "setBottomLink:", v9);

    -[AMSUIWebCameraReaderInfoView bottomLink](v3, "bottomLink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderInfoView addSubview:](v3, "addSubview:", v10);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
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
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL8 v43;
  void *v44;
  void *v45;
  objc_super v46;
  CGRect v47;

  v46.receiver = self;
  v46.super_class = (Class)AMSUIWebCameraReaderInfoView;
  -[AMSUIWebCameraReaderInfoView layoutSubviews](&v46, sel_layoutSubviews);
  -[AMSUIWebCameraReaderInfoView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[AMSUIWebCameraReaderInfoView safeAreaInsets](self, "safeAreaInsets");
  v13 = v8 - (v11 + v12);
  v14 = v4 + v9 + 16.0;
  v15 = v6 - (v9 + v10) + -32.0;
  v16 = (v13 + -25.0 + -32.0) / 3.0;
  -[AMSUIWebCameraReaderInfoView primaryLabel](self, "primaryLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", v15, v13);
  v19 = v18;

  if (v16 < v19)
    v19 = (v13 + -25.0 + -32.0) / 3.0;
  -[AMSUIWebCameraReaderInfoView primaryLabel](self, "primaryLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v14, 25.0, v15, v19);

  -[AMSUIWebCameraReaderInfoView bottomLink](self, "bottomLink");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
    v25 = (v13 + -25.0 + -32.0) / 3.0;
  else
    v25 = v16 + v16;
  -[AMSUIWebCameraReaderInfoView secondaryLabel](self, "secondaryLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeThatFits:", v15, v13);
  v28 = v27;

  if (v25 < v28)
    v28 = v25;
  v47.origin.y = 25.0;
  v47.origin.x = v14;
  v47.size.width = v15;
  v47.size.height = v19;
  v29 = CGRectGetMaxY(v47) + 16.0;
  -[AMSUIWebCameraReaderInfoView secondaryLabel](self, "secondaryLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v14, v29, v15, v28);

  -[AMSUIWebCameraReaderInfoView bottomLink](self, "bottomLink");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sizeThatFits:", v15, v13);
  v34 = v33;

  -[AMSUIWebCameraReaderInfoView bounds](self, "bounds");
  v36 = v35;
  -[AMSUIWebCameraReaderInfoView safeAreaInsets](self, "safeAreaInsets");
  v38 = v37;
  -[AMSUIWebCameraReaderInfoView bottomLinkAction](self, "bottomLinkAction");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    -[AMSUIWebCameraReaderInfoView bottomLink](self, "bottomLink");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "titleLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "text");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "length") == 0;

  }
  else
  {
    v43 = 1;
  }
  if (v16 < v34)
    v34 = v16;

  -[AMSUIWebCameraReaderInfoView bottomLink](self, "bottomLink");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setHidden:", v43);

  -[AMSUIWebCameraReaderInfoView bottomLink](self, "bottomLink");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v14, v36 - v38 - v34 + -16.0, v15, v34);

}

- (void)_bottomLinkSelected:(id)a3
{
  id v3;
  id v4;

  -[AMSUIWebCameraReaderInfoView bottomLinkAction](self, "bottomLinkAction", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "runAction");

}

- (id)_createButtonWithTarget:(id)a3 selector:(SEL)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x24BEBD430];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  objc_msgSend(v8, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineBreakMode:", 4);

  objc_msgSend(v8, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 1);

  objc_msgSend(v8, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleColor:forState:", v14, 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", v6, a4, 64);
  return v8;
}

- (id)_createLabelWithLines:(int64_t)a3 title:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  void *v9;

  v4 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BEBD708]);
  v7 = (id)*MEMORY[0x24BEBE1D0];
  if (v4)
  {
    v8 = (id)*MEMORY[0x24BEBE210];

    v7 = v8;
  }
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v9);

  objc_msgSend(v6, "setNumberOfLines:", a3);
  objc_msgSend(v6, "setTextAlignment:", 1);

  return v6;
}

- (UIButton)bottomLink
{
  return self->_bottomLink;
}

- (void)setBottomLink:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLink, a3);
}

- (AMSUIWebActionRunnable)bottomLinkAction
{
  return self->_bottomLinkAction;
}

- (void)setBottomLinkAction:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLinkAction, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_bottomLinkAction, 0);
  objc_storeStrong((id *)&self->_bottomLink, 0);
}

@end
