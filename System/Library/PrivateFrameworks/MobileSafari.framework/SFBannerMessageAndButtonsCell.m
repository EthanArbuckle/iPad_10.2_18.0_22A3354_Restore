@implementation SFBannerMessageAndButtonsCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("SFBannerMessageAndButtonsCell");
}

- (SFBannerMessageAndButtonsCell)initWithFrame:(CGRect)a3
{
  SFBannerMessageAndButtonsCell *v3;
  SFBannerMessageAndButtonsCell *v4;
  void *v5;
  uint64_t v6;
  UILabel *titleLabel;
  UITextView *v8;
  UITextView *messageTextView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIButton *primaryButton;
  void *v16;
  void *v17;
  uint64_t v18;
  UIButton *secondaryButton;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SFBannerMessageAndButtonsCell *v30;
  void *v32;
  objc_super v33;
  _QWORD v34[3];
  _QWORD v35[2];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)SFBannerMessageAndButtonsCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFStartPageFilledBackgroundCell defaultBackgroundConfiguration](v3, "defaultBackgroundConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 10.0);
    -[SFBannerMessageAndButtonsCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v5);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B60], *MEMORY[0x1E0DC1448]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3990], "sf_startPageBannerTitleLabelWithFont:", v32);
    v6 = objc_claimAutoreleasedReturnValue();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v6;

    v8 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    messageTextView = v4->_messageTextView;
    v4->_messageTextView = v8;

    -[UITextView setDelegate:](v4->_messageTextView, "setDelegate:", v4);
    -[UITextView setScrollEnabled:](v4->_messageTextView, "setScrollEnabled:", 0);
    -[UITextView setEditable:](v4->_messageTextView, "setEditable:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_messageTextView, "setBackgroundColor:", v10);

    v36 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setLinkTextAttributes:](v4->_messageTextView, "setLinkTextAttributes:", v12);

    objc_msgSend(MEMORY[0x1E0DC3520], "borderedProminentButtonConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerStyle:", 3);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    primaryButton = v4->_primaryButton;
    v4->_primaryButton = (UIButton *)v14;

    objc_msgSend(MEMORY[0x1E0DC3520], "borderedButtonConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBaseForegroundColor:", v17);

    objc_msgSend(v16, "setCornerStyle:", 3);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v16, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v4->_secondaryButton;
    v4->_secondaryButton = (UIButton *)v18;

    v20 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v35[0] = v4->_secondaryButton;
    v35[1] = v4->_primaryButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithArrangedSubviews:", v21);

    objc_msgSend(v22, "setSpacing:", 10.0);
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22, "setAlignment:", 3);
    v23 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v34[0] = v4->_titleLabel;
    v34[1] = v4->_messageTextView;
    v34[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithArrangedSubviews:", v24);

    objc_msgSend(v25, "setSpacing:", 10.0);
    objc_msgSend(v25, "setAxis:", 1);
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v25, "setAlignment:", 3);
    -[SFBannerMessageAndButtonsCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v25);

    v27 = (void *)MEMORY[0x1E0CB3718];
    -[SFBannerMessageAndButtonsCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safari_constraintsMatchingFrameOfView:withFrameOfView:edgeInsets:", v25, v28, 10.0, 10.0, 10.0, 10.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v29);

    v30 = v4;
  }

  return v4;
}

- (void)configureUsingBanner:(id)a3
{
  void *v5;
  void *v6;
  UIButton *primaryButton;
  void *v8;
  UIButton *secondaryButton;
  void *v10;
  id v11;

  objc_storeStrong((id *)&self->_banner, a3);
  v11 = a3;
  objc_msgSend(v11, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  objc_msgSend(v11, "attributedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_messageTextView, "setAttributedText:", v6);

  primaryButton = self->_primaryButton;
  objc_msgSend(v11, "primaryButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](primaryButton, "setTitle:forState:", v8, 0);

  secondaryButton = self->_secondaryButton;
  objc_msgSend(v11, "secondaryButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](secondaryButton, "setTitle:forState:", v10, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_primaryButton, "addTarget:action:forControlEvents:", self, sel__primaryButtonSelected, 64);
  -[UIButton addTarget:action:forControlEvents:](self->_secondaryButton, "addTarget:action:forControlEvents:", self, sel__secondaryButtonSelected, 64);

}

- (void)_primaryButtonSelected
{
  void (**v2)(void);

  -[WBSStartPageBanner primaryButtonHandler](self->_banner, "primaryButtonHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (void)_secondaryButtonSelected
{
  void (**v2)(void);

  -[WBSStartPageBanner secondaryButtonHandler](self->_banner, "secondaryButtonHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  WBSStartPageBanner *banner;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  id v12;

  banner = self->_banner;
  v7 = a5;
  v8 = a4;
  -[WBSStartPageBanner messageTextItemHandler](banner, "messageTextItemHandler");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v9)[2](v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;
  else
    v11 = v7;
  v12 = v11;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end
