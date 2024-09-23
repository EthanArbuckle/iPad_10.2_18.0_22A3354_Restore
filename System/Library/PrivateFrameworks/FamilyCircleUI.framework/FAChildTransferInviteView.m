@implementation FAChildTransferInviteView

- (FAChildTransferInviteView)initWithInvite:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  FAChildTransferInviteView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UILabel *titleLabel;
  UILabel *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UILabel *primaryLabel;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UILabel *detailsLabel;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FAChildTransferInviteView;
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = -[FAChildTransferInviteView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x24BDBF090], v6, v7, v8);
  if (v9)
  {
    objc_msgSend(v4, "organizerFirstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organizerLastName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AAUICopyCompositeName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "childFirstName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "childLastName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AAUICopyCompositeName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = (UILabel *)v16;

    v18 = v9->_titleLabel;
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHILD_TRANSFER_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v21, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v18, "setText:", v22);

    -[UILabel setTextAlignment:](v9->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v9->_titleLabel, "setNumberOfLines:", 0);
    v23 = v9->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPageTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v23, "setFont:", v24);

    -[FAChildTransferInviteView addSubview:](v9, "addSubview:", v9->_titleLabel);
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHILD_TRANSFER_MESSAGE"), &stru_24C8A3000, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v27, v12, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[FAChildTransferInviteView _labelWithCenteredText:](v9, "_labelWithCenteredText:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    primaryLabel = v9->_primaryLabel;
    v9->_primaryLabel = (UILabel *)v29;

    -[FAChildTransferInviteView addSubview:](v9, "addSubview:", v9->_primaryLabel);
    v31 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHILD_TRANSFER_DETAILS"), &stru_24C8A3000, CFSTR("Localizable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", v33, v15, v12, v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[FAChildTransferInviteView _labelWithCenteredText:](v9, "_labelWithCenteredText:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    detailsLabel = v9->_detailsLabel;
    v9->_detailsLabel = (UILabel *)v35;

    -[FAChildTransferInviteView addSubview:](v9, "addSubview:", v9->_detailsLabel);
  }

  return v9;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)FAChildTransferInviteView;
  -[FAChildTransferInviteView layoutSubviews](&v33, sel_layoutSubviews);
  -[FAChildTransferInviteView frame](self, "frame");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 56.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 176.0;
  v8 = v4 - v7;
  -[UILabel frame](self->_titleLabel, "frame");
  v10 = v9;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v13 = 88.0;
  else
    v13 = 28.0;
  -[UILabel text](self->_titleLabel, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChildTransferInviteView _heightForTitle:width:](self, "_heightForTitle:width:", v14, v8);
  v16 = v15;

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v13, v10, v8, v16);
  -[UILabel frame](self->_primaryLabel, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v19 = 88.0;
  else
    v19 = 28.0;
  UIRoundToViewScale();
  v21 = v10 + v16 + v20;
  -[UILabel text](self->_primaryLabel, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChildTransferInviteView _heightForText:width:](self, "_heightForText:width:", v22, v8);
  v24 = v23;

  -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v19, v21, v8, v24);
  -[UILabel frame](self->_detailsLabel, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userInterfaceIdiom");

  if ((v26 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v27 = 88.0;
  else
    v27 = 28.0;
  UIRoundToViewScale();
  v29 = v21 + v24 + v28;
  -[UILabel text](self->_detailsLabel, "text");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChildTransferInviteView _heightForText:width:](self, "_heightForText:width:", v30, v8);
  v32 = v31;

  -[UILabel setFrame:](self->_detailsLabel, "setFrame:", v27, v29, v8, v32);
}

- (double)desiredHeightForWidth:(double)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 56.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 176.0;
  v8 = a3 - v7;
  -[UILabel text](self->_titleLabel, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChildTransferInviteView _heightForTitle:width:](self, "_heightForTitle:width:", v9, v8);
  v11 = v10;

  -[UILabel text](self->_primaryLabel, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChildTransferInviteView _heightForText:width:](self, "_heightForText:width:", v12, v8);
  v14 = v13;

  -[UILabel text](self->_detailsLabel, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChildTransferInviteView _heightForText:width:](self, "_heightForText:width:", v15, v8);
  v17 = v16;

  UIRoundToViewScale();
  return v11 + v14 + v17 + v18 * 2.0;
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
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPrimaryInformationLabel");
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
  objc_msgSend(v5, "aa_fontForPrimaryInformationLabel");
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
  objc_storeStrong((id *)&self->_detailsLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
