@implementation ACUIAppInstallCell

+ (id)specifierForAppWithDescription:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v6;
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  char v14;
  id v15;
  id v16;
  SEL v17;
  id v18;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = a5;
  v16 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E9A15E98, v18, 0, a5, 0, 13, 0);
  objc_msgSend(v16, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  v9 = (id)objc_msgSend(location[0], "name");
  objc_msgSend(v16, "setProperty:forKey:");

  v10 = (id)objc_msgSend(location[0], "publisher");
  objc_msgSend(v16, "setProperty:forKey:");

  v11 = (id)objc_msgSend(location[0], "icon");
  objc_msgSend(v16, "setProperty:forKey:");

  objc_msgSend(v16, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
  v12 = (id)objc_msgSend(location[0], "bundleID");
  v14 = 0;
  v13 = 1;
  if (v12)
  {
    v15 = (id)objc_msgSend(location[0], "persistentID");
    v14 = 1;
    v13 = v15 == 0;
  }
  if ((v14 & 1) != 0)

  if (v13)
    objc_msgSend(v16, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("ACUIAppIsAvailable"));
  else
    objc_msgSend(v16, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("ACUIAppIsAvailable"));
  objc_msgSend(v16, "setButtonAction:", v17);
  v6 = v16;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (ACUIAppInstallCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  ACUIAppInstallCell *v5;
  uint64_t v6;
  UIImageView *iconView;
  UILabel *v8;
  UILabel *nameLabel;
  UILabel *v10;
  UILabel *publisherLabel;
  SKUIItemOfferButton *v12;
  SKUIItemOfferButton *installButton;
  ACUIAppInstallCell *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id v23;
  id v24;
  id v25;
  objc_super v26;
  id v27;
  id location;
  int64_t v29;
  SEL v30;
  ACUIAppInstallCell *v31;

  v31 = self;
  v30 = a2;
  v29 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v5 = v31;
  v31 = 0;
  v26.receiver = v5;
  v26.super_class = (Class)ACUIAppInstallCell;
  v31 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v26, sel_initWithStyle_reuseIdentifier_specifier_, v29, location, v27);
  objc_storeStrong((id *)&v31, v31);
  if (v31)
  {
    v25 = (id)objc_msgSend(v27, "propertyForKey:", CFSTR("ACUIAppInstallIcon"));
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v25);
    iconView = v31->_iconView;
    v31->_iconView = (UIImageView *)v6;

    v17 = (id)-[ACUIAppInstallCell contentView](v31, "contentView");
    objc_msgSend(v17, "addSubview:", v31->_iconView);

    v24 = (id)objc_msgSend(v27, "propertyForKey:", CFSTR("ACUIAppInstallName"));
    v8 = (UILabel *)-[ACUIAppInstallCell _createLabelForAppName:](v31, "_createLabelForAppName:", v24);
    nameLabel = v31->_nameLabel;
    v31->_nameLabel = v8;

    v18 = (id)-[ACUIAppInstallCell contentView](v31, "contentView");
    objc_msgSend(v18, "addSubview:", v31->_nameLabel);

    v23 = (id)objc_msgSend(v27, "propertyForKey:", CFSTR("ACUIAppInstallPublisher"));
    v10 = (UILabel *)-[ACUIAppInstallCell _createLabelForPublisher:](v31, "_createLabelForPublisher:", v23);
    publisherLabel = v31->_publisherLabel;
    v31->_publisherLabel = v10;

    v19 = (id)-[ACUIAppInstallCell contentView](v31, "contentView");
    objc_msgSend(v19, "addSubview:", v31->_publisherLabel);

    v20 = (id)objc_msgSend(v27, "propertyForKey:", CFSTR("ACUIAppIsAvailable"));
    v21 = (objc_msgSend(v20, "BOOLValue") & 1) != 1;

    if (!v21)
    {
      v12 = (SKUIItemOfferButton *)-[ACUIAppInstallCell _createInstallButton](v31, "_createInstallButton");
      installButton = v31->_installButton;
      v31->_installButton = v12;

      v16 = (id)-[ACUIAppInstallCell contentView](v31, "contentView");
      objc_msgSend(v16, "addSubview:", v31->_installButton);

    }
    -[ACUIAppInstallCell setSelectionStyle:](v31, "setSelectionStyle:", 0);
    v31->_installState = 0;
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
  }
  v15 = v31;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v31, 0);
  return v15;
}

- (void)setInstallState:(int)a3
{
  self->_installState = a3;
  -[ACUIAppInstallCell _updateSubviewsWithInstallState:](self, "_updateSubviewsWithInstallState:", self->_installState);
}

- (void)layoutSubviews
{
  objc_super v2;
  SEL v3;
  ACUIAppInstallCell *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)ACUIAppInstallCell;
  -[PSTableCell layoutSubviews](&v2, sel_layoutSubviews);
  -[ACUIAppInstallCell _updateSubviewsWithInstallState:](v4, "_updateSubviewsWithInstallState:", v4->_installState);
}

- (id)_createLabelForAppName:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v6, "setOpaque:", 0);
  objc_msgSend(v6, "setBackgroundColor:", 0);
  objc_msgSend(v6, "setText:", location[0]);
  v4 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 18.0);
  objc_msgSend(v6, "setFont:");

  objc_msgSend(v6, "sizeToFit");
  v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_createLabelForPublisher:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v6, "setOpaque:", 0);
  objc_msgSend(v6, "setBackgroundColor:", 0);
  objc_msgSend(v6, "setText:", location[0]);
  v4 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  objc_msgSend(v6, "setFont:");

  objc_msgSend(v6, "sizeToFit");
  v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_createInstallButton
{
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init((Class)getSKUIItemOfferButtonClass());
  v3 = v6[0];
  v4 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  objc_msgSend(v3, "setBackgroundColor:");

  v5 = v6[0];
  objc_storeStrong(v6, 0);
  return v5;
}

- (void)_updateSubviewsWithInstallState:(int)a3
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
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize v26;
  double v27;
  double v28;
  double v29;
  double v30;
  char v31;
  CGRect v33;
  CGRect v34;

  -[ACUIAppInstallCell _updateInstallButtonWithState:](self, "_updateInstallButtonWithState:", a3);
  v31 = (-[ACUIAppInstallCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") ^ 1) & 1;
  v19 = (id)-[ACUIAppInstallCell contentView](self, "contentView");
  objc_msgSend(v19, "bounds");
  v28 = v3;
  v29 = v4;
  v30 = v5;

  -[UIImageView frame](self->_iconView, "frame");
  v26.width = v6;
  v26.height = v7;
  if ((v31 & 1) != 0)
    v18 = 12.0;
  else
    v18 = v29 - v6 - 12.0;
  v27 = v28 + floor((v30 - v7) / 2.0);
  -[UIImageView setFrame:](self->_iconView, "setFrame:", v18, v27, v6, v7);
  -[UILabel frame](self->_nameLabel, "frame");
  v24 = v8;
  v25 = v9;
  if ((v31 & 1) != 0)
  {
    v17 = v18 + v26.width + 8.0;
  }
  else
  {
    v33.origin.x = v18;
    v33.origin.y = v27;
    v33.size = v26;
    v17 = CGRectGetMinX(v33) - 8.0 - v24;
  }
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", v17, 22.0, v24, v25);
  -[UILabel frame](self->_publisherLabel, "frame");
  v22 = v10;
  v23 = v11;
  if ((v31 & 1) != 0)
  {
    v16 = v18 + v26.width + 8.0;
  }
  else
  {
    v34.origin.x = v18;
    v34.origin.y = v27;
    v34.size = v26;
    v16 = CGRectGetMinX(v34) - v22 - 8.0;
  }
  -[UILabel setFrame:](self->_publisherLabel, "setFrame:", v16, 44.0, v22, v23);
  -[SKUIItemOfferButton frame](self->_installButton, "frame");
  v21 = v28 + floor((v30 - v13) / 2.0);
  if ((v31 & 1) != 0)
    v15 = v29 - v12 - 12.0;
  else
    v15 = 12.0;
  v20 = v15;
  if (v12 <= 50.0)
    v14 = 50.0;
  else
    v14 = v12;
  if ((v31 & 1) != 0)
    v20 = v15 - (v14 - v12);
  -[SKUIItemOfferButton setFrame:](self->_installButton, "setFrame:", v20, v21, v14, v13);
}

- (void)_updateInstallButtonWithState:(int)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  SKUIItemOfferButton *v10;
  id v11;
  int *v12;
  SKUIItemOfferButton *installButton;
  id v14;
  id v15;
  id WeakRetained;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  SEL v22;
  ACUIAppInstallCell *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = 0;
  if (a3 == 2)
  {
    v19 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("INSTALLED"), &stru_1E9A15E98, CFSTR("Localizable"));
    v4 = v20;
    v20 = v3;

  }
  else if (v21 == 1)
  {
    v18 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("INSTALLNOW"), &stru_1E9A15E98, CFSTR("Localizable"));
    v6 = v20;
    v20 = v5;

  }
  else
  {
    v17 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("UNAVAILABLE"), &stru_1E9A15E98, CFSTR("Localizable"));
    v8 = v20;
    v20 = v7;

  }
  if (v21 == 1)
  {
    installButton = v23->_installButton;
    v12 = (int *)MEMORY[0x1E0D80600];
    WeakRetained = objc_loadWeakRetained((id *)((char *)&v23->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E0D80600]));
    v15 = (id)objc_msgSend(WeakRetained, "target");
    v14 = objc_loadWeakRetained((id *)((char *)&v23->super.super.super.super.super.isa + *v12));
    -[SKUIItemOfferButton addTarget:action:forControlEvents:](installButton, "addTarget:action:forControlEvents:", v15, objc_msgSend(v14, "buttonAction"), 64);

    -[SKUIItemOfferButton setEnabled:](v23->_installButton, "setEnabled:", 1);
  }
  else
  {
    -[SKUIItemOfferButton setEnabled:](v23->_installButton, "setEnabled:", 0);
    v10 = v23->_installButton;
    v11 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.68627451, 1.0);
    -[SKUIItemOfferButton setTintColor:](v10, "setTintColor:");

  }
  if (v21 == 3)
    -[SKUIItemOfferButton setAlpha:](v23->_installButton, "setAlpha:", 0.0);
  else
    -[SKUIItemOfferButton setAlpha:](v23->_installButton, "setAlpha:", 1.0);
  -[SKUIItemOfferButton setTitle:](v23->_installButton, "setTitle:", v20, 0x1EFF45000uLL);
  objc_msgSend(*(id *)((char *)&v23->super.super.super.super.super.isa + *(int *)(v9 + 1316)), "sizeToFit");
  objc_storeStrong(&v20, 0);
}

- (int)installState
{
  return self->_installState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installButton, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_publisherLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
