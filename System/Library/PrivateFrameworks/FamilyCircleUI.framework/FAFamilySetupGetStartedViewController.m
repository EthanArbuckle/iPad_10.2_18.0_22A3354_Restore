@implementation FAFamilySetupGetStartedViewController

- (FAFamilySetupGetStartedViewController)initWithAccount:(id)a3 store:(id)a4 familyEligibilityResponse:(id)a5
{
  id v9;
  id v10;
  id v11;
  FAFamilySetupGetStartedViewController *v12;
  FAFamilySetupGetStartedViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FAFamilySetupGetStartedViewController;
  v12 = -[FAFamilySetupGetStartedViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_accountStore, a4);
    objc_storeStrong((id *)&v13->_familyEligibilityResponse, a5);
  }

  return v13;
}

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
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  UILabel *descriptionLabel;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  UIImageView *v33;
  UIImageView *familySharingLogo;
  UIButton *v35;
  UIButton *getStartedButton;
  UIButton *v37;
  void *v38;
  void *v39;
  UIButton *v40;
  void *v41;
  void *v42;
  void *v43;
  FAFamilySharingFeaturesView *v44;
  FAFamilySharingFeaturesView *familyFeaturesView;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)FAFamilySetupGetStartedViewController;
  -[FAFamilySetupGetStartedViewController loadView](&v46, sel_loadView);
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
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("FAMILY_SETUP_FIRST_PAGE_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v18, "setText:", v20);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v21 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPageTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v21, "setFont:", v22);

  v23 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v23, "setTextColor:", v24);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_titleLabel);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FAMILY_SETUP_SHORT_DESCRIPTION"), &stru_24C8A3000, CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilySetupGetStartedViewController _createDescriptionLabelForText:](self, "_createDescriptionLabelForText:", v26);
  v27 = (UILabel *)objc_claimAutoreleasedReturnValue();
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v27;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_descriptionLabel);
  v29 = objc_alloc(MEMORY[0x24BEBD668]);
  v30 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageNamed:inBundle:", CFSTR("FamilySharingLogo"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (UIImageView *)objc_msgSend(v29, "initWithImage:", v32);
  familySharingLogo = self->_familySharingLogo;
  self->_familySharingLogo = v33;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_familySharingLogo);
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v35 = (UIButton *)objc_claimAutoreleasedReturnValue();
  getStartedButton = self->_getStartedButton;
  self->_getStartedButton = v35;

  v37 = self->_getStartedButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("GET_STARTED_BUTTON_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v37, "setTitle:forState:", v39, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_getStartedButton, "addTarget:action:forControlEvents:", self, sel__getStartedButtonWasTapped_, 64);
  v40 = self->_getStartedButton;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](v40, "setTintColor:", v41);

  -[UIButton setEnabled:](self->_getStartedButton, "setEnabled:", 1);
  -[UIButton setUserInteractionEnabled:](self->_getStartedButton, "setUserInteractionEnabled:", 1);
  -[UIButton titleLabel](self->_getStartedButton, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForLargeButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFont:", v43);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_getStartedButton);
  v44 = -[FAFamilySharingFeaturesView initWithContext:hideLocationSharing:]([FAFamilySharingFeaturesView alloc], "initWithContext:hideLocationSharing:", 0, MGGetBoolAnswer() ^ 1);
  familyFeaturesView = self->_familyFeaturesView;
  self->_familyFeaturesView = v44;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_familyFeaturesView);
  -[FAFamilySetupGetStartedViewController setView:](self, "setView:", self->_scrollView);
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
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)FAFamilySetupGetStartedViewController;
  -[FAFamilySetupGetStartedViewController viewWillLayoutSubviews](&v34, sel_viewWillLayoutSubviews);
  -[FAFamilySetupGetStartedViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  v8 = 88.0;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v8 = 28.0;
  v9 = v5 - v8;
  -[UILabel frame](self->_titleLabel, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = 44.0;
  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v13 = 44.0;
  else
    v13 = 14.0;
  UIRoundToViewScale();
  v15 = v14;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, 0.0);
  v17 = v16;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v13, v15, v9, v16);
  -[UIImageView sizeToFit](self->_familySharingLogo, "sizeToFit");
  -[UIImageView frame](self->_familySharingLogo, "frame");
  v19 = v18;
  -[UIImageView size](self->_familySharingLogo, "size");
  UIRoundToViewScale();
  -[UIImageView setFrame:](self->_familySharingLogo, "setFrame:");
  -[UILabel frame](self->_descriptionLabel, "frame");
  UIRoundToViewScale();
  v21 = v15 + v17 + 24.0 + v19 + v20;
  -[UILabel text](self->_descriptionLabel, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilySetupGetStartedViewController _heightForText:constrainedToWidth:](self, "_heightForText:constrainedToWidth:", v22, v5 + -60.0);
  v24 = v23;

  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", 30.0, v21, v5 + -60.0, v24);
  -[UIButton sizeToFit](self->_getStartedButton, "sizeToFit");
  -[UIButton frame](self->_getStartedButton, "frame");
  v26 = v25;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceIdiom");

  if ((v28 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v12 = 14.0;
  UIRoundToViewScale();
  v30 = v21 + v24 + v29;
  -[UIButton setFrame:](self->_getStartedButton, "setFrame:", v12, v30, v9, v26);
  -[FAFamilySharingFeaturesView frame](self->_familyFeaturesView, "frame");
  v31 = v26 + v30 + 20.0;
  -[FAFamilySharingFeaturesView systemLayoutSizeFittingSize:](self->_familyFeaturesView, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  v33 = v32;
  -[FAFamilySharingFeaturesView setFrame:](self->_familyFeaturesView, "setFrame:", 30.0, v31, v5 + -60.0, v32);
  -[UIView frame](self->_contentView, "frame");
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v31 + v33 + 30.0);
}

- (void)_updateFonts
{
  UILabel *titleLabel;
  void *v4;
  UILabel *descriptionLabel;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  titleLabel = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPageTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v4);

  descriptionLabel = self->_descriptionLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForLargerInformationLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](descriptionLabel, "setFont:", v6);

  -[UIButton titleLabel](self->_getStartedButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForLargeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[FAFamilySetupGetStartedViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

}

- (id)_createDescriptionLabelForText:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BEBD708];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v6, "setText:", v4);

  objc_msgSend(v6, "setTextAlignment:", 1);
  objc_msgSend(v6, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForLargerInformationLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  return v6;
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
  objc_msgSend(v5, "aa_fontForLargerInformationLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  v10 = v9;

  return ceil(v10);
}

- (void)_getStartedButtonWasTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "familySetupPage:didCompleteWithSuccess:", self, 1);

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
  v9.super_class = (Class)FAFamilySetupGetStartedViewController;
  v4 = a3;
  -[FAFamilySetupGetStartedViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FAFamilySetupGetStartedViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    -[FAFamilySetupGetStartedViewController _updateFonts](self, "_updateFonts");
}

- (FAFamilySetupPageDelegate)delegate
{
  return (FAFamilySetupPageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyFeaturesView, 0);
  objc_storeStrong((id *)&self->_getStartedButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_familySharingLogo, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_familyEligibilityResponse, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
