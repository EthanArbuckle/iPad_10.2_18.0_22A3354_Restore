@implementation FAStandardInviteView

- (FAStandardInviteView)initWithInvite:(id)a3 hideLocationSharing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  FAStandardInviteView *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UILabel *titleLabel;
  UILabel *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIImageView *familySharingLogo;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  UILabel *inviteHeaderLabel;
  FAFamilySharingFeaturesView *v36;
  FAFamilySharingFeaturesView *featuresView;
  _BOOL4 v39;
  objc_super v40;

  v4 = a4;
  v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FAStandardInviteView;
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v11 = -[FAStandardInviteView initWithFrame:](&v40, sel_initWithFrame_, *MEMORY[0x24BDBF090], v8, v9, v10);
  if (v11)
  {
    v39 = v4;
    objc_msgSend(v6, "organizerFirstName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "organizerLastName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AAUICopyCompositeName();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v15;

    v17 = v11->_titleLabel;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FAMILY_INVITATION_PAGE_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v17, "setText:", v19);

    -[UILabel setTextAlignment:](v11->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v11->_titleLabel, "setNumberOfLines:", 0);
    v20 = v11->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPageTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[FAStandardInviteView addSubview:](v11, "addSubview:", v11->_titleLabel);
    v22 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageNamed:inBundle:", CFSTR("FamilySharingLogo"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v24);
    familySharingLogo = v11->_familySharingLogo;
    v11->_familySharingLogo = (UIImageView *)v25;

    -[FAStandardInviteView addSubview:](v11, "addSubview:", v11->_familySharingLogo);
    objc_msgSend(v6, "organizerEmail");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v27)
    {
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FAMILY_INVITATION_DESCRIPTION_WITH_EMAIL"), &stru_24C8A3000, CFSTR("Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "organizerEmail");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", v31, v14, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FAMILY_INVITATION_DESCRIPTION"), &stru_24C8A3000, CFSTR("Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", v31, v14);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[FAStandardInviteView _labelWithCenteredText:](v11, "_labelWithCenteredText:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    inviteHeaderLabel = v11->_inviteHeaderLabel;
    v11->_inviteHeaderLabel = (UILabel *)v34;

    -[FAStandardInviteView addSubview:](v11, "addSubview:", v11->_inviteHeaderLabel);
    v36 = -[FAFamilySharingFeaturesView initWithContext:hideLocationSharing:]([FAFamilySharingFeaturesView alloc], "initWithContext:hideLocationSharing:", 1, v39);
    featuresView = v11->_featuresView;
    v11->_featuresView = v36;

    -[FAStandardInviteView addSubview:](v11, "addSubview:", v11->_featuresView);
  }

  return v11;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)FAStandardInviteView;
  -[FAStandardInviteView layoutSubviews](&v39, sel_layoutSubviews);
  -[FAStandardInviteView frame](self, "frame");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 88.0;
  else
    v7 = 28.0;
  v8 = v4 - v7;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  v11 = 56.0;
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v11 = 176.0;
  v12 = v4 - v11;
  -[UILabel frame](self->_titleLabel, "frame");
  v14 = v13;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v17 = 44.0;
  else
    v17 = 14.0;
  -[UILabel text](self->_titleLabel, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAStandardInviteView _heightForTitle:width:](self, "_heightForTitle:width:", v18, v8);
  v20 = v19;

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v17, v14, v8, v20);
  -[UIImageView sizeToFit](self->_familySharingLogo, "sizeToFit");
  -[UIImageView frame](self->_familySharingLogo, "frame");
  v22 = v21;
  v24 = v23;
  -[UIImageView size](self->_familySharingLogo, "size");
  UIRoundToViewScale();
  v26 = v25;
  UIRoundToViewScale();
  v28 = v14 + v20 + v27;
  -[UIImageView setFrame:](self->_familySharingLogo, "setFrame:", v26, v28, v22, v24);
  -[UILabel frame](self->_inviteHeaderLabel, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "userInterfaceIdiom");

  if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v31 = 88.0;
  else
    v31 = 28.0;
  v32 = v24 + v28 + 29.0;
  -[UILabel text](self->_inviteHeaderLabel, "text");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAStandardInviteView _heightForText:width:](self, "_heightForText:width:", v33, v12);
  v35 = v34;

  -[UILabel setFrame:](self->_inviteHeaderLabel, "setFrame:", v31, v32, v12, v35);
  -[FAFamilySharingFeaturesView frame](self->_featuresView, "frame");
  -[FAStandardInviteView frame](self, "frame");
  v37 = v36 + -60.0;
  -[FAFamilySharingFeaturesView systemLayoutSizeFittingSize:](self->_featuresView, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  -[FAFamilySharingFeaturesView setFrame:](self->_featuresView, "setFrame:", 30.0, v32 + v35 + 18.0, v37, v38);
}

- (double)desiredHeightForWidth:(double)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 88.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v7 = 28.0;
  v8 = a3 - v7;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  v11 = 56.0;
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v11 = 176.0;
  v12 = a3 - v11;
  -[UILabel text](self->_titleLabel, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAStandardInviteView _heightForTitle:width:](self, "_heightForTitle:width:", v13, v8);
  v15 = v14;

  -[UIImageView size](self->_familySharingLogo, "size");
  v17 = v16;
  -[UILabel text](self->_inviteHeaderLabel, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAStandardInviteView _heightForText:width:](self, "_heightForText:width:", v18, v12);
  v20 = v19;

  -[FAFamilySharingFeaturesView systemLayoutSizeFittingSize:](self->_featuresView, "systemLayoutSizeFittingSize:", a3 + -60.0, *(double *)(MEMORY[0x24BEBE588] + 8));
  v22 = v15 + v17 + v20 + v21;
  UIRoundToViewScale();
  return v23 + v22 + 18.0 + 29.0 + 10.0;
}

- (id)_labelWithCenteredText:(id)a3
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
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  return v6;
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
  objc_msgSend(v5, "systemFontOfSize:", 16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  v10 = v9;

  return v10;
}

- (double)_heightForTitle:(id)a3 width:(double)a4
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
  objc_msgSend(v5, "aa_fontForPageTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  v10 = v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresView, 0);
  objc_storeStrong((id *)&self->_inviteHeaderLabel, 0);
  objc_storeStrong((id *)&self->_familySharingLogo, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
