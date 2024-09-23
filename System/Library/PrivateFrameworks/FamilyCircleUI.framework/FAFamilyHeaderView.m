@implementation FAFamilyHeaderView

- (FAFamilyHeaderView)initWithCoder:(id)a3
{
  -[FAFamilyHeaderView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (FAFamilyHeaderView)initWithFrame:(CGRect)a3
{
  -[FAFamilyHeaderView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (FAFamilyHeaderView)initWithFamilyCircle:(id)a3 profilePictureStore:(id)a4
{
  id v6;
  id v7;
  FAFamilyHeaderView *v8;
  UILabel *v9;
  UILabel *familyHeaderLabel;
  UILabel *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  FAMugshotMarqueeView *v16;
  FAMugshotMarqueeView *mugShots;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
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
  objc_super v41;
  _QWORD v42[9];

  v42[7] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)FAFamilyHeaderView;
  v8 = -[FAFamilyHeaderView initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    familyHeaderLabel = v8->_familyHeaderLabel;
    v8->_familyHeaderLabel = v9;

    -[UILabel setTextAlignment:](v8->_familyHeaderLabel, "setTextAlignment:", 1);
    v11 = v8->_familyHeaderLabel;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FAMILY_SETTINGS_PAGE_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v11, "setText:", v13);

    v14 = v8->_familyHeaderLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 24.0, *MEMORY[0x24BEBB610]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v15);

    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_familyHeaderLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_familyHeaderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FAFamilyHeaderView addSubview:](v8, "addSubview:", v8->_familyHeaderLabel);
    v16 = -[FAMugshotMarqueeView initWithFamilyCircle:profilePictureStore:]([FAMugshotMarqueeView alloc], "initWithFamilyCircle:profilePictureStore:", v6, v7);
    mugShots = v8->_mugShots;
    v8->_mugShots = v16;

    -[FAMugshotMarqueeView setTranslatesAutoresizingMaskIntoConstraints:](v8->_mugShots, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FAFamilyHeaderView addSubview:](v8, "addSubview:", v8->_mugShots);
    -[FAMugshotMarqueeView leftAnchor](v8->_mugShots, "leftAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyHeaderView leftAnchor](v8, "leftAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 8.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v38;
    -[FAMugshotMarqueeView rightAnchor](v8->_mugShots, "rightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyHeaderView rightAnchor](v8, "rightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -8.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v35;
    -[FAMugshotMarqueeView topAnchor](v8->_mugShots, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyHeaderView topAnchor](v8, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 24.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v32;
    -[UILabel firstBaselineAnchor](v8->_familyHeaderLabel, "firstBaselineAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAMugshotMarqueeView bottomAnchor](v8->_mugShots, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 40.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v29;
    -[UILabel leadingAnchor](v8->_familyHeaderLabel, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyHeaderView leadingAnchor](v8, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v26, 8.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v18;
    -[UILabel trailingAnchor](v8->_familyHeaderLabel, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyHeaderView trailingAnchor](v8, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -8.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v21;
    -[UILabel firstBaselineAnchor](v8->_familyHeaderLabel, "firstBaselineAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyHeaderView bottomAnchor](v8, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -24.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v27);
  }

  return v8;
}

- (UILabel)familyHeaderLabel
{
  return self->_familyHeaderLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyHeaderLabel, 0);
  objc_storeStrong((id *)&self->_mugShots, 0);
}

@end
