@implementation SUUIFamilySettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0], a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scaledValueForValue:", 48.0);
  v8 = v7;

  v9 = a3;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  uint64_t v8;

  objc_storeStrong((id *)&self->_layoutContext, a5);
  v7 = a3;
  v8 = objc_msgSend(v7, "viewState");

  -[SUUIFamilySettingDescriptionView _setViewState:](self, "_setViewState:", v8);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  int64_t viewState;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIFamilySettingDescriptionView;
  -[SUUIFamilySettingDescriptionView layoutSubviews](&v4, sel_layoutSubviews);
  viewState = self->_viewState;
  if ((unint64_t)(viewState - 1) >= 3)
  {
    if (viewState == -1)
      -[SUUIFamilySettingDescriptionView _layoutWithActivityIndicator](self, "_layoutWithActivityIndicator");
  }
  else
  {
    -[SUUIFamilySettingDescriptionView _layoutWithLockup](self, "_layoutWithLockup");
  }
}

- (id)_attributedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[SUUISettingsFamilyViewElement style](self->_viewElement, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext clientContext](self->_layoutContext, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "localizedStringForKey:inTable:", v4, CFSTR("Settings"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v4, 0, CFSTR("Settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "textShadow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIFamilySettingDescriptionView tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  SUUIViewElementFontWithStyle(v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDBCE70]);
  v14 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v11, *MEMORY[0x24BEBB368], v12, *MEMORY[0x24BEBB360], v9, *MEMORY[0x24BEBB3C8], 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v8, v14);

  return v15;
}

- (id)_attributedStringForViewState
{
  int64_t viewState;
  const __CFString *v3;
  const __CFString *v4;

  viewState = self->_viewState;
  v3 = CFSTR("SETTINGS_FAMILY_SETUP");
  if (viewState == 2)
    v3 = CFSTR("SETTINGS_FAMILY_ADD");
  if (viewState == 3)
    v4 = CFSTR("SETTINGS_FAMILY_MANAGE");
  else
    v4 = v3;
  -[SUUIFamilySettingDescriptionView _attributedStringForKey:](self, "_attributedStringForKey:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_layoutWithActivityIndicator
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicator;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIActivityIndicatorView *v9;
  double MidX;
  CGRect v11;
  CGRect v12;

  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", 1);
  -[UILabel setHidden:](self->_labelView, "setHidden:", 1);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  if (!self->_activityIndicator)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 2);
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v3;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    -[SUUIFamilySettingDescriptionView addSubview:](self, "addSubview:", self->_activityIndicator);
  }
  -[SUUIFamilySettingDescriptionView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v9 = self->_activityIndicator;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  -[UIActivityIndicatorView setCenter:](v9, "setCenter:", MidX, CGRectGetMidY(v12));
}

- (void)_layoutWithLockup
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  UIImageView *iconImageView;
  id v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UILabel *labelView;
  UILabel *v26;
  UILabel *v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", 0);
  -[UILabel setHidden:](self->_labelView, "setHidden:", 0);
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  -[SUUISettingDescriptionView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v36 = v5;
  -[SUUIFamilySettingDescriptionView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  iconImageView = self->_iconImageView;
  if (!iconImageView)
  {
    v15 = objc_alloc(MEMORY[0x24BEBD668]);
    SUUIImageWithResourceName(CFSTR("familySharing"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (UIImageView *)objc_msgSend(v15, "initWithImage:", v16);
    v18 = self->_iconImageView;
    self->_iconImageView = v17;

    -[SUUIFamilySettingDescriptionView addSubview:](self, "addSubview:", self->_iconImageView);
    iconImageView = self->_iconImageView;
  }
  -[UIImageView image](iconImageView, "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "size");
  v21 = v20;
  v23 = v22;

  v38.origin.x = v7;
  v38.origin.y = v9;
  v38.size.width = v11;
  v38.size.height = v13;
  v24 = floor((CGRectGetHeight(v38) - v23) * 0.5);
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v4, v24, v21, v23);
  labelView = self->_labelView;
  if (!labelView)
  {
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    v27 = self->_labelView;
    self->_labelView = v26;

    -[UILabel _setTextColorFollowsTintColor:](self->_labelView, "_setTextColorFollowsTintColor:", 1);
    -[SUUIFamilySettingDescriptionView addSubview:](self, "addSubview:", self->_labelView);
    labelView = self->_labelView;
  }
  -[SUUIFamilySettingDescriptionView _attributedStringForViewState](self, "_attributedStringForViewState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](labelView, "setAttributedText:", v28);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v39.origin.x = v4;
  v39.origin.y = v24;
  v39.size.width = v21;
  v39.size.height = v23;
  v29 = CGRectGetMaxX(v39) + 8.0;
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  v30 = CGRectGetWidth(v40) - v29 - v36;
  -[UILabel sizeThatFits:](self->_labelView, "sizeThatFits:", v30, 1.79769313e308);
  v32 = v31;
  objc_msgSend(v37, "_scaledValueForValue:", 30.0);
  v34 = v33;
  -[UILabel _firstBaselineOffsetFromTop](self->_labelView, "_firstBaselineOffsetFromTop");
  -[UILabel setFrame:](self->_labelView, "setFrame:", v29, v34 - v35, v30, v32);

}

- (void)_setViewState:(int64_t)a3
{
  self->_viewState = a3;
  -[SUUIFamilySettingDescriptionView setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
