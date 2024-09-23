@implementation FAConfirmIdentityViewController

- (FAConfirmIdentityViewController)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4
{
  id v7;
  id v8;
  FAConfirmIdentityViewController *v9;
  FAConfirmIdentityViewController *v10;
  uint64_t v11;
  AAUIProfilePictureStore *profilePictureStore;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FAConfirmIdentityViewController;
  v9 = -[FAConfirmIdentityViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleAccount, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE04D48]), "initWithGrandSlamSigner:", v8);
    profilePictureStore = v10->_profilePictureStore;
    v10->_profilePictureStore = (AAUIProfilePictureStore *)v11;

    -[AAUIProfilePictureStore setPictureDiameter:](v10->_profilePictureStore, "setPictureDiameter:", 100.0);
    -[AAUIProfilePictureStore setMonogramType:](v10->_profilePictureStore, "setMonogramType:", 0);
  }

  return v10;
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
  UILabel *v20;
  void *v21;
  UILabel *v22;
  UILabel *descriptionLabel;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  uint64_t v28;
  UIView *v29;
  UIView *profilePhotoView;
  UIView *v31;
  UIView *v32;
  FAAddPhotoView *v33;
  UILabel *v34;
  UILabel *nameLabel;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  void *v40;
  void *v41;
  UILabel *v42;
  UILabel *emailLabel;
  UILabel *v44;
  void *v45;
  UILabel *v46;
  void *v47;
  UIButton *v48;
  UIButton *continueButton;
  UIButton *v50;
  void *v51;
  UIButton *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  UIButton *v58;
  UIButton *useDifferentIDButton;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  UIButton *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;

  v72.receiver = self;
  v72.super_class = (Class)FAConfirmIdentityViewController;
  -[FAConfirmIdentityViewController loadView](&v72, sel_loadView);
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

  -[FAConfirmIdentityViewController setView:](self, "setView:", self->_scrollView);
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
  -[FAConfirmIdentityViewController pageTitle](self, "pageTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v18, "setText:", v19);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v20 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPageTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v20, "setFont:", v21);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_titleLabel);
  v22 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v22;

  v24 = self->_descriptionLabel;
  -[FAConfirmIdentityViewController instructions](self, "instructions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v24, "setText:", v25);

  -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  v26 = self->_descriptionLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForLargerInformationLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v26, "setFont:", v27);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_descriptionLabel);
  -[AAUIProfilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback](self->_profilePictureStore, "profilePictureForAccountOwnerWithoutMonogramFallback");
  v28 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)v28;
  if (v28)
  {
    v29 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v28);
    profilePhotoView = self->_profilePhotoView;
    self->_profilePhotoView = v29;

    v31 = self->_profilePhotoView;
    v32 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__photoWasTapped_);
    -[UIView addGestureRecognizer:](v31, "addGestureRecognizer:", v32);
  }
  else
  {
    v33 = -[FAAddPhotoView initWithTarget:action:]([FAAddPhotoView alloc], "initWithTarget:action:", self, sel__addPhotoButtonWasTapped_);
    v32 = self->_profilePhotoView;
    self->_profilePhotoView = &v33->super;
  }

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_profilePhotoView);
  v34 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
  nameLabel = self->_nameLabel;
  self->_nameLabel = v34;

  -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", 1);
  v36 = self->_nameLabel;
  -[ACAccount aaui_compositeName](self->_appleAccount, "aaui_compositeName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v36, "setText:", v37);

  -[UILabel setNumberOfLines:](self->_nameLabel, "setNumberOfLines:", 0);
  v38 = self->_nameLabel;
  v39 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "scaledValueForValue:", 27.0);
  objc_msgSend(v39, "_lightSystemFontOfSize:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v38, "setFont:", v41);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_nameLabel);
  v42 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
  emailLabel = self->_emailLabel;
  self->_emailLabel = v42;

  -[UILabel setTextAlignment:](self->_emailLabel, "setTextAlignment:", 1);
  v44 = self->_emailLabel;
  -[ACAccount username](self->_appleAccount, "username");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v44, "setText:", v45);

  -[UILabel setNumberOfLines:](self->_emailLabel, "setNumberOfLines:", 0);
  v46 = self->_emailLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPrimaryInformationLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v46, "setFont:", v47);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_emailLabel);
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v48 = (UIButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v48;

  v50 = self->_continueButton;
  -[FAConfirmIdentityViewController titleForContinuebutton](self, "titleForContinuebutton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v50, "setTitle:forState:", v51, 0);

  v52 = self->_continueButton;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](v52, "setTintColor:", v53);

  -[UIButton titleLabel](self->_continueButton, "titleLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForLargeButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFont:", v55);

  -[UIButton titleLabel](self->_continueButton, "titleLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setNumberOfLines:", 0);

  -[UIButton titleLabel](self->_continueButton, "titleLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setTextAlignment:", 1);

  -[UIButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel_continueButtonWasTapped_, 64);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_continueButton);
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v58 = (UIButton *)objc_claimAutoreleasedReturnValue();
  useDifferentIDButton = self->_useDifferentIDButton;
  self->_useDifferentIDButton = v58;

  v60 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("FAMILY_SETUP_USE_DIFFERENT_ID_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount aa_firstName](self->_appleAccount, "aa_firstName");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "stringWithFormat:", v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setTitle:forState:](self->_useDifferentIDButton, "setTitle:forState:", v64, 0);
  v65 = self->_useDifferentIDButton;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](v65, "setTintColor:", v66);

  -[UIButton titleLabel](self->_useDifferentIDButton, "titleLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPrimaryInformationLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setFont:", v68);

  -[UIButton titleLabel](self->_useDifferentIDButton, "titleLabel");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setNumberOfLines:", 0);

  -[UIButton titleLabel](self->_useDifferentIDButton, "titleLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setTextAlignment:", 1);

  -[UIButton addTarget:action:forControlEvents:](self->_useDifferentIDButton, "addTarget:action:forControlEvents:", self, sel__useDifferentIDButtonWasTapped_, 64);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_useDifferentIDButton);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  objc_super v82;

  v82.receiver = self;
  v82.super_class = (Class)FAConfirmIdentityViewController;
  -[FAConfirmIdentityViewController viewWillLayoutSubviews](&v82, sel_viewWillLayoutSubviews);
  -[FAConfirmIdentityViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v81 = v6;

  -[UILabel frame](self->_titleLabel, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v9 = 44.0;
  else
    v9 = 14.0;
  UIRoundToViewScale();
  v11 = v10;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 28.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v14 = 88.0;
  v15 = v5 - v14;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5 - v14, 0.0);
  v17 = v16;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v9, v11, v15, v16);
  -[UILabel frame](self->_descriptionLabel, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v20 = 51.0;
  else
    v20 = 21.0;
  UIRoundToViewScale();
  v22 = v11 + v17 + v21;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v25 = 88.0;
  else
    v25 = 28.0;
  v26 = v5 - v25 + -14.0;
  -[UILabel text](self->_descriptionLabel, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAConfirmIdentityViewController _heightForText:width:](self, "_heightForText:width:", v27, v26);
  v29 = v28;

  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v20, v22, v26, v29);
  -[UIView frame](self->_profilePhotoView, "frame");
  UIRoundToViewScale();
  v31 = v22 + v29 + v30;
  -[UIView setFrame:](self->_profilePhotoView, "setFrame:", (v5 + -100.0) * 0.5, v31, 100.0, 100.0);
  -[UILabel sizeToFit](self->_nameLabel, "sizeToFit");
  -[UILabel frame](self->_nameLabel, "frame");
  v33 = v32;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v36 = 44.0;
  else
    v36 = 14.0;
  v37 = v31 + 100.0 + 10.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "userInterfaceIdiom");

  v40 = 28.0;
  if ((v39 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v40 = 88.0;
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", v36, v31 + 100.0 + 10.0, v5 - v40, v33);
  -[UILabel sizeToFit](self->_emailLabel, "sizeToFit");
  -[UILabel frame](self->_emailLabel, "frame");
  v42 = v41;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "userInterfaceIdiom");

  if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v45 = 44.0;
  else
    v45 = 14.0;
  UIRoundToViewScale();
  v47 = v37 + v33 - v46;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "userInterfaceIdiom");

  if ((v49 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v50 = 88.0;
  else
    v50 = 28.0;
  -[UILabel setFrame:](self->_emailLabel, "setFrame:", v45, v47, v5 - v50, v42);
  -[UIButton sizeToFit](self->_continueButton, "sizeToFit");
  -[UIButton frame](self->_continueButton, "frame");
  v52 = v51;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "userInterfaceIdiom");

  if ((v54 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v55 = 44.0;
  else
    v55 = 14.0;
  UIRoundToViewScale();
  v57 = v42 + v47 + v56;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "userInterfaceIdiom");

  if ((v59 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v60 = 88.0;
  else
    v60 = 28.0;
  -[UIButton setFrame:](self->_continueButton, "setFrame:", v55, v57, v5 - v60, v52);
  -[FAConfirmIdentityViewController navigationController](self, "navigationController");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "navigationBar");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "size");
  v64 = v63;

  -[UIButton frame](self->_useDifferentIDButton, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "userInterfaceIdiom");

  v67 = v66 & 0xFFFFFFFFFFFFFFFBLL;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "userInterfaceIdiom");

  v70 = v69 & 0xFFFFFFFFFFFFFFFBLL;
  -[UIButton titleLabel](self->_useDifferentIDButton, "titleLabel");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "text");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton size](self->_useDifferentIDButton, "size");
  -[FAConfirmIdentityViewController _heightForText:width:](self, "_heightForText:width:", v72);
  v74 = v73;

  UIRoundToViewScale();
  v76 = v81 - v74 - v11 - v64 - v75;
  if (v76 >= v52 + v57)
    v77 = v76;
  else
    v77 = v52 + v57 + 30.0;
  v78 = 28.0;
  if (v70 == 1)
    v78 = 88.0;
  v79 = v5 - v78;
  v80 = 14.0;
  if (v67 == 1)
    v80 = 44.0;
  -[UIButton setFrame:](self->_useDifferentIDButton, "setFrame:", v80, v77, v79, v74);
  -[UIView frame](self->_contentView, "frame");
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v74 + v77 + 20.0);
}

- (id)pageTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FAMILY_CONFIRM_ACCOUNT_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)instructions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FAMILY_CONFIRM_ACCOUNT_MESSAGE"), &stru_24C8A3000, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleForContinuebutton
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FAMILY_CONFIRM_ACCOUNT_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldShowInviteeInstructions
{
  return 1;
}

- (double)_heightForText:(id)a3 width:(double)a4
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

- (void)_updateViewsInPhotoArea:(id)a3
{
  UIView *v4;
  UIView *profilePhotoView;
  UIView *v6;
  UIView *v7;
  FAAddPhotoView *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UIView removeFromSuperview](self->_profilePhotoView, "removeFromSuperview");
  if (v10)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v10);
    profilePhotoView = self->_profilePhotoView;
    self->_profilePhotoView = v4;

    v6 = self->_profilePhotoView;
    v7 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__photoWasTapped_);
    -[UIView addGestureRecognizer:](v6, "addGestureRecognizer:", v7);
  }
  else
  {
    v8 = -[FAAddPhotoView initWithTarget:action:]([FAAddPhotoView alloc], "initWithTarget:action:", self, sel__addPhotoButtonWasTapped_);
    v7 = self->_profilePhotoView;
    self->_profilePhotoView = &v8->super;
  }

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_profilePhotoView);
  -[FAConfirmIdentityViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

}

- (void)continueButtonWasTapped:(id)a3
{
  UIImage *newProfilePicture;
  UIImage *v5;
  NSValue *newProfilePictureCropRect;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  newProfilePicture = self->_newProfilePicture;
  if (newProfilePicture)
  {
    -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:](self->_profilePictureStore, "setProfilePictureForAccountOwner:cropRect:", newProfilePicture, self->_newProfilePictureCropRect);
    v5 = self->_newProfilePicture;
    self->_newProfilePicture = 0;

    newProfilePictureCropRect = self->_newProfilePictureCropRect;
    self->_newProfilePictureCropRect = 0;

  }
  -[FAConfirmIdentityViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[FAConfirmIdentityViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "confirmIdentityViewController:didCompleteWithSuccess:", self, 1);

  }
}

- (void)_useDifferentIDButtonWasTapped:(id)a3
{
  void *v4;
  FAExplainAppleIDViewController *v5;

  v5 = objc_alloc_init(FAExplainAppleIDViewController);
  -[FAExplainAppleIDViewController setShouldShowInviteeInstructions:](v5, "setShouldShowInviteeInstructions:", -[FAConfirmIdentityViewController shouldShowInviteeInstructions](self, "shouldShowInviteeInstructions"));
  -[FAConfirmIdentityViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void)_showImagePickerForAvailableSources
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__FAConfirmIdentityViewController__showImagePickerForAvailableSources__block_invoke;
  v4[3] = &unk_24C88C148;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BE04D28], "alertControllerWithSelectionHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAConfirmIdentityViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

void __70__FAConfirmIdentityViewController__showImagePickerForAvailableSources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1056), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1064), a3);
    v7 = *(id **)(a1 + 32);
    objc_msgSend(v7[131], "profilePictureForPicture:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateViewsInPhotoArea:", v8);

  }
}

- (void)_updateFonts
{
  UILabel *titleLabel;
  void *v4;
  UILabel *descriptionLabel;
  void *v6;
  UILabel *nameLabel;
  void *v8;
  void *v9;
  void *v10;
  UILabel *emailLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  titleLabel = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPageTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v4);

  descriptionLabel = self->_descriptionLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForLargerInformationLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](descriptionLabel, "setFont:", v6);

  nameLabel = self->_nameLabel;
  v8 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scaledValueForValue:", 27.0);
  objc_msgSend(v8, "_lightSystemFontOfSize:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](nameLabel, "setFont:", v10);

  emailLabel = self->_emailLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPrimaryInformationLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](emailLabel, "setFont:", v12);

  -[UIButton titleLabel](self->_continueButton, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForLargeButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);

  -[UIButton titleLabel](self->_useDifferentIDButton, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPrimaryInformationLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v16);

  -[FAConfirmIdentityViewController view](self, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsLayout");

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
  v9.super_class = (Class)FAConfirmIdentityViewController;
  v4 = a3;
  -[FAConfirmIdentityViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FAConfirmIdentityViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    -[FAConfirmIdentityViewController _updateFonts](self, "_updateFonts");
}

- (FAConfirmIdentityViewControllerDelegate)delegate
{
  return (FAConfirmIdentityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_newProfilePictureCropRect, 0);
  objc_storeStrong((id *)&self->_newProfilePicture, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_useDifferentIDButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_emailLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_profilePhotoView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end
