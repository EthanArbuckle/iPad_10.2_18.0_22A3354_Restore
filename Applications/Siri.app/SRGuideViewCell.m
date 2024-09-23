@implementation SRGuideViewCell

- (SRGuideViewCell)initWithFrame:(CGRect)a3
{
  SRGuideViewCell *v3;
  SRGuideViewCell *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *iconImageView;
  SiriSharedUIContentLabel *v9;
  SiriSharedUIContentLabel *nameLabel;
  SiriSharedUIContentLabel *v11;
  uint64_t v12;
  double v13;
  id v14;
  void *v15;
  SiriSharedUIContentLabel *v16;
  void *v17;
  uint64_t v18;
  SiriSharedUIContentLabel *tagPhraseLabel;
  SiriSharedUIContentLabel *v20;
  uint64_t v21;
  double v22;
  id v23;
  void *v24;
  SiriSharedUIContentLabel *v25;
  void *v26;
  uint64_t v27;
  double v28;
  id v29;
  double v30;
  double v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SRGuideViewCell;
  v3 = -[SRGuideViewCell initWithFrame:](&v33, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SRGuideViewCell setKeylineType:](v3, "setKeylineType:", 0);
    -[SRGuideViewCell setHasChevron:](v4, "setHasChevron:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewCell selectedBackgroundView](v4, "selectedBackgroundView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightHighlightColor](UIColor, "siriui_lightHighlightColor"));
    objc_msgSend(v5, "setBackgroundColor:", v6);

    v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v4->_iconImageView, "setAccessibilityIgnoresInvertColors:", 1);
    v9 = objc_opt_new(SiriSharedUIContentLabel);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v9;

    v11 = v4->_nameLabel;
    *(_QWORD *)&v13 = objc_opt_class(v4, v12).n128_u64[0];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_nameLabelFont", v13));
    -[SiriSharedUIContentLabel setFont:](v11, "setFont:", v15);

    v16 = v4->_nameLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](UIColor, "siriui_lightTextColor"));
    -[SiriSharedUIContentLabel setTextColor:](v16, "setTextColor:", v17);

    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel label](SiriSharedUIContentLabel, "label"));
    tagPhraseLabel = v4->_tagPhraseLabel;
    v4->_tagPhraseLabel = (SiriSharedUIContentLabel *)v18;

    v20 = v4->_tagPhraseLabel;
    *(_QWORD *)&v22 = objc_opt_class(v4, v21).n128_u64[0];
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_tagPhraseLabelFont", v22));
    -[SiriSharedUIContentLabel setFont:](v20, "setFont:", v24);

    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_tagPhraseLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = v4->_tagPhraseLabel;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_blendEffectColor](UIColor, "siriui_blendEffectColor"));
    -[SiriSharedUIContentLabel setTextColor:](v25, "setTextColor:", v26);

    -[SRGuideViewCell addSubview:](v4, "addSubview:", v4->_nameLabel);
    -[SRGuideViewCell addSubview:](v4, "addSubview:", v4->_tagPhraseLabel);
    -[SRGuideViewCell addSubview:](v4, "addSubview:", v4->_iconImageView);
    -[SiriSharedUIContentLabel siriui_setBlendEffectEnabled:](v4->_tagPhraseLabel, "siriui_setBlendEffectEnabled:", 1);
    *(_QWORD *)&v28 = objc_opt_class(v4, v27).n128_u64[0];
    if (objc_msgSend(v29, "_allowsTextToWrap", v28))
    {
      -[SiriSharedUIContentLabel setNumberOfLines:](v4->_nameLabel, "setNumberOfLines:", 0);
      LODWORD(v30) = 1.0;
      -[SiriSharedUIContentLabel _setHyphenationFactor:](v4->_nameLabel, "_setHyphenationFactor:", v30);
      -[SiriSharedUIContentLabel setNumberOfLines:](v4->_tagPhraseLabel, "setNumberOfLines:", 0);
      LODWORD(v31) = 1.0;
      -[SiriSharedUIContentLabel _setHyphenationFactor:](v4->_tagPhraseLabel, "_setHyphenationFactor:", v31);
    }
  }
  return v4;
}

+ (id)_nameLabelFont
{
  return +[UIFont siriui_dynamicMediumWeightBodySizeFont](UIFont, "siriui_dynamicMediumWeightBodySizeFont");
}

+ (id)_tagPhraseLabelFont
{
  return +[UIFont siriui_dynamicLightWeightBodySizeFont](UIFont, "siriui_dynamicLightWeightBodySizeFont");
}

+ (BOOL)_allowsTextToWrap
{
  void *v2;
  void *v3;
  char IsAccessibilityContentSizeCategory;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  return IsAccessibilityContentSizeCategory;
}

+ (BOOL)placesImageAboveText
{
  void *v2;
  void *v3;
  char IsAccessibilityContentSizeCategory;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  return IsAccessibilityContentSizeCategory;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  void *v13;
  uint64_t v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SiriSharedUIContentLabel *nameLabel;
  void *iconImageView;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[8];
  _QWORD v35[8];

  v33.receiver = self;
  v33.super_class = (Class)SRGuideViewCell;
  -[SRGuideViewCell updateConstraints](&v33, "updateConstraints");
  if (!self->_hasCreatedConstraints)
  {
    v34[0] = CFSTR("cellHeight");
    v34[1] = CFSTR("imageHeight");
    v35[0] = &off_100128B00;
    v35[1] = &off_100128B10;
    v35[2] = &off_100128B10;
    v34[2] = CFSTR("imageWidth");
    v34[3] = CFSTR("nameLeading");
    UIFloorToViewScale(self, 66.5);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v35[3] = v3;
    v35[4] = &off_100128B20;
    v34[4] = CFSTR("nameTop");
    v34[5] = CFSTR("imageNameSpacing");
    UIFloorToViewScale(self, 14.5);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v35[5] = v4;
    v34[6] = CFSTR("leadingPadding");
    *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
    objc_msgSend(v7, "defaultInsets", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    v35[6] = v9;
    v34[7] = CFSTR("trailingPadding");
    -[SRGuideViewCell chevronTrailingMargin](self, "chevronTrailingMargin");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v35[7] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 8));

    v12 = _NSDictionaryOfVariableBindings(CFSTR("_nameLabel, _tagPhraseLabel, _iconImageView"), self->_nameLabel, self->_tagPhraseLabel, self->_iconImageView, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_QWORD *)&v15 = objc_opt_class(self, v14).n128_u64[0];
    if (objc_msgSend(v16, "placesImageAboveText", v15))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-leadingPadding-[_iconImageView(imageWidth)]"), 0, v11, v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-leadingPadding-[_nameLabel]-trailingPadding-|"), 0, v11, v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-leadingPadding-[_tagPhraseLabel]-trailingPadding-|"), 0, v11, v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconImageView, 3, 0, self, 3, 1.0, 11.0));
      -[SRGuideViewCell addConstraint:](self, "addConstraint:", v20);

      nameLabel = self->_nameLabel;
      iconImageView = self->_iconImageView;
      v23 = 1.0;
      v24 = 2.5;
      v25 = 4;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-leadingPadding-[_iconImageView(imageWidth)]-imageNameSpacing-[_nameLabel]-trailingPadding-|"), 0, v11, v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-leadingPadding-[_iconImageView(imageWidth)]-imageNameSpacing-[_tagPhraseLabel]-trailingPadding-|"), 0, v11, v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_nameLabel, 5, 0, self->_tagPhraseLabel, 5, 1.0, 0.0));
      -[SRGuideViewCell addConstraint:](self, "addConstraint:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconImageView, 10, 0, self, 10, 1.0, 0.0));
      -[SRGuideViewCell addConstraint:](self, "addConstraint:", v29);

      nameLabel = self->_nameLabel;
      v23 = 1.0;
      v24 = 19.0;
      iconImageView = self;
      v25 = 3;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", nameLabel, 3, 0, iconImageView, v25, v23, v24));
    -[SRGuideViewCell addConstraint:](self, "addConstraint:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_tagPhraseLabel, 3, 0, self->_nameLabel, 4, 1.0, 1.5));
    -[SRGuideViewCell addConstraint:](self, "addConstraint:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconImageView, 8, 0, 0, 0, 1.0, 40.0));
    -[SRGuideViewCell addConstraint:](self, "addConstraint:", v32);

    self->_hasCreatedConstraints = 1;
  }
}

+ (double)heightOfCellWithName:(id)a3 tagPhrase:(id)a4 width:(double)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  NSAttributedStringKey v38;
  void *v39;
  NSAttributedStringKey v40;
  void *v41;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(a1, "_allowsTextToWrap"))
  {
    objc_msgSend(a1, "defaultInsets");
    v11 = a5 - v10;
    objc_msgSend(a1, "chevronTrailingMargin");
    v13 = v11 - v12;
    v40 = NSFontAttributeName;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_nameLabelFont"));
    v41 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 1, v15, 0, v13, 1.79769313e308);
    v17 = v16 + 22.0;

    v38 = NSFontAttributeName;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_tagPhraseLabelFont"));
    v39 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v19, 0, v13, 1.79769313e308);
    v21 = v17 + v20;

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "preferredContentSizeCategory"));
    v24 = _UIContentSizeCategoryCompareToContentSizeCategory(v23, UIContentSizeCategoryLarge);

    if (v24 == 1)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_nameLabelFont"));
      objc_msgSend(v25, "lineHeight");
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_tagPhraseLabelFont"));
      objc_msgSend(v28, "lineHeight");
      v30 = v27 + v29;

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_mediumWeightBodySizeFont](UIFont, "siriui_mediumWeightBodySizeFont"));
      objc_msgSend(v31, "lineHeight");
      v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_lightWeightBodySubtextSizeFont](UIFont, "siriui_lightWeightBodySubtextSizeFont"));
      objc_msgSend(v34, "lineHeight");
      v36 = v33 + v35;

      v21 = UIRoundToViewScale(0, v30 - v36) + 80.0;
    }
    else
    {
      v21 = 80.0;
    }
  }
  if (objc_msgSend(a1, "placesImageAboveText"))
    v21 = v21 + 42.5;

  return v21;
}

+ (UIEdgeInsets)defaultInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "scale");

  v3 = 0.0;
  v4 = 24.0;
  v5 = 0.0;
  v6 = 24.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (BOOL)chevronBlendEffectEnabled
{
  return 1;
}

- (void)setIconImage:(id)a3
{
  UIImage *v4;
  UIImage *iconImage;

  v4 = (UIImage *)objc_msgSend(a3, "copy");
  iconImage = self->_iconImage;
  self->_iconImage = v4;

  -[UIImageView setImage:](self->_iconImageView, "setImage:", self->_iconImage);
}

- (void)setName:(id)a3
{
  -[SiriSharedUIContentLabel setText:](self->_nameLabel, "setText:", a3);
}

- (void)setTagPhrase:(id)a3
{
  -[SiriSharedUIContentLabel setText:](self->_tagPhraseLabel, "setText:", a3);
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)tagPhrase
{
  return self->_tagPhrase;
}

- (NSString)aceId
{
  return self->_aceId;
}

- (void)setAceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceId, 0);
  objc_storeStrong((id *)&self->_tagPhrase, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_tagPhraseLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
