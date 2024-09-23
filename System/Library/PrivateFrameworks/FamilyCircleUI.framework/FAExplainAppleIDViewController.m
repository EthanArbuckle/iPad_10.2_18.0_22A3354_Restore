@implementation FAExplainAppleIDViewController

- (void)loadView
{
  id v3;
  void *v4;
  UIScrollView *v5;
  UIScrollView *scrollView;
  UIScrollView *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;
  UIView *contentView;
  UILabel *v16;
  UILabel *titleLabel;
  UILabel *v18;
  void *v19;
  __CFString *v20;
  int v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  UILabel *descriptionLabel;
  _BOOL4 shouldShowInviteeInstructions;
  UILabel *v28;
  void *v29;
  __CFString *v30;
  char v31;
  void *v32;
  UILabel *v33;
  void *v34;
  int v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)FAExplainAppleIDViewController;
  -[FAExplainAppleIDViewController loadView](&v37, sel_loadView);
  v3 = objc_alloc(MEMORY[0x24BEBD918]);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  v7 = self->_scrollView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[FAExplainAppleIDViewController setView:](self, "setView:", self->_scrollView);
  v9 = objc_alloc(MEMORY[0x24BEBDB00]);
  v10 = *MEMORY[0x24BDBF090];
  v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v14 = (UIView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], v11, v12, v13);
  contentView = self->_contentView;
  self->_contentView = v14;

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_contentView);
  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v16;

  v18 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("FAMILY_SETUP_YOUR_APPLE_ID_TITLE");
  if ((objc_msgSend(CFSTR("FAMILY_SETUP_YOUR_APPLE_ID_TITLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("FAMILY_SETUP_YOUR_APPLE_ID_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = 1;
  }
  objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_24C8A3000, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v18, "setText:", v22);

  if (v21)
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v23 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPageTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v23, "setFont:", v24);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_titleLabel);
  v25 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v25;

  shouldShowInviteeInstructions = self->_shouldShowInviteeInstructions;
  v28 = self->_descriptionLabel;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (shouldShowInviteeInstructions)
  {
    v30 = CFSTR("FAMILY_SETUP_APPLE_ID_EXPLANATION_FOR_INVITEE");
    if ((objc_msgSend(CFSTR("FAMILY_SETUP_APPLE_ID_EXPLANATION_FOR_INVITEE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v31 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("FAMILY_SETUP_APPLE_ID_EXPLANATION_FOR_INVITEE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v31 = 1;
    }
    objc_msgSend(v29, "localizedStringForKey:value:table:", v30, &stru_24C8A3000, CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v28, "setText:", v32);

    if ((v31 & 1) != 0)
LABEL_13:

  }
  else
  {
    v30 = CFSTR("FAMILY_SETUP_APPLE_ID_EXPLANATION");
    if ((objc_msgSend(CFSTR("FAMILY_SETUP_APPLE_ID_EXPLANATION"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v35 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("FAMILY_SETUP_APPLE_ID_EXPLANATION"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v35 = 1;
    }
    objc_msgSend(v29, "localizedStringForKey:value:table:", v30, &stru_24C8A3000, CFSTR("Localizable"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v28, "setText:", v36);

    if (v35)
      goto LABEL_13;
  }

  -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  v33 = self->_descriptionLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPrimaryInformationLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v33, "setFont:", v34);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_descriptionLabel);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)FAExplainAppleIDViewController;
  -[FAExplainAppleIDViewController viewWillLayoutSubviews](&v28, sel_viewWillLayoutSubviews);
  -[FAExplainAppleIDViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[UILabel frame](self->_titleLabel, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v8 = 44.0;
  else
    v8 = 14.0;
  UIRoundToViewScale();
  v10 = v9;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v13 = 88.0;
  else
    v13 = 28.0;
  v14 = v5 - v13;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5 - v13, 0.0);
  v16 = v15;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v8, v10, v14, v15);
  -[UILabel frame](self->_descriptionLabel, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v19 = 44.0;
  else
    v19 = 14.0;
  v20 = v10 + v16 + 20.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v23 = 88.0;
  else
    v23 = 28.0;
  v24 = v5 - v23;
  -[UILabel text](self->_descriptionLabel, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAExplainAppleIDViewController _heightForText:constrainedToWidth:](self, "_heightForText:constrainedToWidth:", v25, v24);
  v27 = v26;

  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v19, v20, v24, v27);
}

- (double)_heightForText:(id)a3 constrainedToWidth:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BEBB360];
  v5 = (void *)MEMORY[0x24BEBB520];
  v6 = a3;
  objc_msgSend(v5, "aa_fontForPrimaryInformationLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  v10 = v9;

  return ceil(v10);
}

- (void)_updateFonts
{
  UILabel *titleLabel;
  void *v4;
  UILabel *descriptionLabel;
  void *v6;
  id v7;

  titleLabel = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPageTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v4);

  descriptionLabel = self->_descriptionLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPrimaryInformationLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](descriptionLabel, "setFont:", v6);

  -[FAExplainAppleIDViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FAExplainAppleIDViewController;
  v4 = a3;
  -[FAExplainAppleIDViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FAExplainAppleIDViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    -[FAExplainAppleIDViewController _updateFonts](self, "_updateFonts");
}

- (BOOL)shouldShowInviteeInstructions
{
  return self->_shouldShowInviteeInstructions;
}

- (void)setShouldShowInviteeInstructions:(BOOL)a3
{
  self->_shouldShowInviteeInstructions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goToSettingsButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
