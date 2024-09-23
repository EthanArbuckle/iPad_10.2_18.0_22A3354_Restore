@implementation HUBadgeAndDisclosureAccessoryView

+ (id)_disclosureImage
{
  if (qword_1ED57FA78 != -1)
    dispatch_once(&qword_1ED57FA78, &__block_literal_global_6);
  return (id)_MergedGlobals_1;
}

void __53__HUBadgeAndDisclosureAccessoryView__disclosureImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, 0);
  objc_msgSend(v2, "_disclosureChevronImage:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

}

- (HUBadgeAndDisclosureAccessoryView)initWithFrame:(CGRect)a3
{
  HUBadgeAndDisclosureAccessoryView *v3;
  UIView *v4;
  UIView *badgeContainerView;
  id v6;
  void *v7;
  uint64_t v8;
  UIImageView *badgeImageView;
  UILabel *v10;
  UILabel *badgeLabel;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  UIImageView *disclosureImageView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)HUBadgeAndDisclosureAccessoryView;
  v3 = -[HUBadgeAndDisclosureAccessoryView initWithFrame:](&v62, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    badgeContainerView = v3->_badgeContainerView;
    v3->_badgeContainerView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_badgeContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setHidden:](v3->_badgeContainerView, "setHidden:", 1);
    -[HUBadgeAndDisclosureAccessoryView addSubview:](v3, "addSubview:", v3->_badgeContainerView);
    v6 = objc_alloc(MEMORY[0x1E0CEA658]);
    HUImageNamed(CFSTR("HUSoftwareUpdateBadge"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithImage:", v7);
    badgeImageView = v3->_badgeImageView;
    v3->_badgeImageView = (UIImageView *)v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_badgeImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_badgeContainerView, "addSubview:", v3->_badgeImageView);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    badgeLabel = v3->_badgeLabel;
    v3->_badgeLabel = v10;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 17.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_badgeLabel, "setFont:", v12);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_badgeLabel, "setTextColor:", v13);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_badgeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_badgeContainerView, "addSubview:", v3->_badgeLabel);
    v14 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend((id)objc_opt_class(), "_disclosureImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithImage:", v15);
    disclosureImageView = v3->_disclosureImageView;
    v3->_disclosureImageView = (UIImageView *)v16;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_disclosureImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUBadgeAndDisclosureAccessoryView addSubview:](v3, "addSubview:", v3->_disclosureImageView);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v3->_badgeImageView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_badgeContainerView, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v21);

    -[UIImageView trailingAnchor](v3->_badgeImageView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_badgeContainerView, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v24);

    -[UIImageView topAnchor](v3->_badgeImageView, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3->_badgeContainerView, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v27);

    -[UIImageView bottomAnchor](v3->_badgeImageView, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_badgeContainerView, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v30);

    -[UILabel centerXAnchor](v3->_badgeLabel, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v3->_badgeContainerView, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v33);

    -[UILabel centerYAnchor](v3->_badgeLabel, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v3->_badgeContainerView, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v36);

    -[UIView leadingAnchor](v3->_badgeContainerView, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBadgeAndDisclosureAccessoryView leadingAnchor](v3, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v39);

    -[UIView topAnchor](v3->_badgeContainerView, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBadgeAndDisclosureAccessoryView topAnchor](v3, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v42);

    -[UIView bottomAnchor](v3->_badgeContainerView, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBadgeAndDisclosureAccessoryView bottomAnchor](v3, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v45);

    -[UIImageView leadingAnchor](v3->_disclosureImageView, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_badgeContainerView, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 12.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v48);

    -[UIImageView trailingAnchor](v3->_disclosureImageView, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBadgeAndDisclosureAccessoryView trailingAnchor](v3, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v51);

    -[UIImageView centerYAnchor](v3->_disclosureImageView, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBadgeAndDisclosureAccessoryView centerYAnchor](v3, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v54);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v18);
    -[HUBadgeAndDisclosureAccessoryView bounds](v3, "bounds");
    v56 = v55;
    v58 = v57;
    -[HUBadgeAndDisclosureAccessoryView systemLayoutSizeFittingSize:](v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
    -[HUBadgeAndDisclosureAccessoryView setBounds:](v3, "setBounds:", v56, v58, v59, v60);

  }
  return v3;
}

- (void)setBadgeCount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (self->_badgeCount != a3)
  {
    self->_badgeCount = a3;
    if (a3)
    {
      v4 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBadgeAndDisclosureAccessoryView badgeLabel](self, "badgeLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v6);

      -[HUBadgeAndDisclosureAccessoryView badgeContainerView](self, "badgeContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v9 = 0;
    }
    else
    {
      -[HUBadgeAndDisclosureAccessoryView badgeContainerView](self, "badgeContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v9 = 1;
    }
    objc_msgSend(v8, "setHidden:", v9);

  }
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (UIView)badgeContainerView
{
  return self->_badgeContainerView;
}

- (void)setBadgeContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeContainerView, a3);
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageView, a3);
}

- (UILabel)badgeLabel
{
  return self->_badgeLabel;
}

- (void)setBadgeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_badgeLabel, a3);
}

- (UIImageView)disclosureImageView
{
  return self->_disclosureImageView;
}

- (void)setDisclosureImageView:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureImageView, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_badgeContainerView, 0);
}

@end
