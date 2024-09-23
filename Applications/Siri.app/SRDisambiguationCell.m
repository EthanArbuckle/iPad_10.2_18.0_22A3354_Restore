@implementation SRDisambiguationCell

- (SRDisambiguationCell)initWithFrame:(CGRect)a3
{
  SRDisambiguationCell *v3;
  uint64_t v4;
  SiriSharedUIContentLabel *titleLabel;
  SiriSharedUIContentLabel *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  SiriSharedUIContentLabel *secondaryTitleLabel;
  double v12;
  void *v13;
  uint64_t v14;
  SiriSharedUIContentLabel *extraDisambiguationLabel;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  SiriSharedUIContentLabel *extraDisambiguationSubTextLabel;
  double v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIImageView *v32;
  UIImageView *starView;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)SRDisambiguationCell;
  v3 = -[SRDisambiguationCell initWithFrame:](&v36, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel label](SiriSharedUIContentLabel, "label"));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (SiriSharedUIContentLabel *)v4;

    v6 = v3->_titleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_lightWeightFontWithSize:](UIFont, "siriui_lightWeightFontWithSize:", 18.0));
    -[SiriSharedUIContentLabel setFont:](v6, "setFont:", v7);

    LODWORD(v8) = 1132068864;
    -[SiriSharedUIContentLabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    objc_msgSend(v9, "addSubview:", v3->_titleLabel);

    v10 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel labelWithMediumWeightSubtextFont](SiriSharedUIContentLabel, "labelWithMediumWeightSubtextFont"));
    secondaryTitleLabel = v3->_secondaryTitleLabel;
    v3->_secondaryTitleLabel = (SiriSharedUIContentLabel *)v10;

    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_secondaryTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1132068864;
    -[SiriSharedUIContentLabel setContentCompressionResistancePriority:forAxis:](v3->_secondaryTitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    objc_msgSend(v13, "addSubview:", v3->_secondaryTitleLabel);

    v14 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel labelWithLightWeightRegularFont](SiriSharedUIContentLabel, "labelWithLightWeightRegularFont"));
    extraDisambiguationLabel = v3->_extraDisambiguationLabel;
    v3->_extraDisambiguationLabel = (SiriSharedUIContentLabel *)v14;

    -[SiriSharedUIContentLabel setTextAlignment:](v3->_extraDisambiguationLabel, "setTextAlignment:", 2);
    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_extraDisambiguationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1144766464;
    -[SiriSharedUIContentLabel setContentCompressionResistancePriority:forAxis:](v3->_extraDisambiguationLabel, "setContentCompressionResistancePriority:forAxis:", 0, v16);
    LODWORD(v17) = 1144750080;
    -[SiriSharedUIContentLabel setContentHuggingPriority:forAxis:](v3->_extraDisambiguationLabel, "setContentHuggingPriority:forAxis:", 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    objc_msgSend(v18, "addSubview:", v3->_extraDisambiguationLabel);

    v19 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel labelWithMediumWeightSubtextFont](SiriSharedUIContentLabel, "labelWithMediumWeightSubtextFont"));
    extraDisambiguationSubTextLabel = v3->_extraDisambiguationSubTextLabel;
    v3->_extraDisambiguationSubTextLabel = (SiriSharedUIContentLabel *)v19;

    -[SiriSharedUIContentLabel setTextAlignment:](v3->_extraDisambiguationSubTextLabel, "setTextAlignment:", 2);
    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_extraDisambiguationSubTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v21) = 1144766464;
    -[SiriSharedUIContentLabel setContentCompressionResistancePriority:forAxis:](v3->_extraDisambiguationSubTextLabel, "setContentCompressionResistancePriority:forAxis:", 0, v21);
    LODWORD(v22) = 1144750080;
    -[SiriSharedUIContentLabel setContentHuggingPriority:forAxis:](v3->_extraDisambiguationSubTextLabel, "setContentHuggingPriority:forAxis:", 0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    objc_msgSend(v23, "addSubview:", v3->_extraDisambiguationSubTextLabel);

    v24 = objc_alloc((Class)UIImageView);
    *(_QWORD *)&v26 = objc_opt_class(v3, v25).n128_u64[0];
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v27, v26));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("VIP"), v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_maskingColor](UIColor, "siriui_maskingColor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_flatImageWithColor:", v30));
    v32 = (UIImageView *)objc_msgSend(v24, "initWithImage:", v31);
    starView = v3->_starView;
    v3->_starView = v32;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_starView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    objc_msgSend(v34, "addSubview:", v3->_starView);

  }
  return v3;
}

- (void)layoutSubviews
{
  SRDisambiguationCell *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SRDisambiguationCell;
  -[SRDisambiguationCell layoutSubviews](&v10, "layoutSubviews");
  -[UIImageView setHidden:](self->_starView, "setHidden:", -[SiriUIDisambiguationItem showsFavoriteStar](self->_item, "showsFavoriteStar") ^ 1);
  if (-[SRDisambiguationCell isLastRow](self, "isLastRow"))
  {
    v3 = self;
    v4 = 0;
LABEL_7:
    -[SRDisambiguationCell setKeylineType:](v3, "setKeylineType:", v4);
    return;
  }
  if (!-[SRDisambiguationCell hasStarColumn](self, "hasStarColumn"))
  {
    v3 = self;
    v4 = 1;
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
  objc_msgSend(v5, "setKeylineType:", 4);

  v6 = -[SRDisambiguationCell semanticContentAttribute](self, "semanticContentAttribute");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
  v8 = v7;
  if (v6 == (id)4)
  {
    objc_msgSend(v7, "setCustomRightPadding:", 35.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    objc_msgSend(v9, "setCustomLeftPadding:", 0.0);
  }
  else
  {
    objc_msgSend(v7, "setCustomLeftPadding:", 35.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    objc_msgSend(v9, "setCustomRightPadding:", 0.0);
  }

}

- (void)updateConstraints
{
  NSDictionary *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *titleBaselineConstraint;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *secondaryTitleBaselineConstraint;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *titleLeadingOffsetConstraint;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *extraTitleBaselineConstraint;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SRDisambiguationCell;
  -[SRDisambiguationCell updateConstraints](&v31, "updateConstraints");
  if (!self->_constraintsCreated)
  {
    v3 = _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _secondaryTitleLabel, _extraDisambiguationLabel, _extraDisambiguationSubTextLabel, _starView"), self->_titleLabel, self->_secondaryTitleLabel, self->_extraDisambiguationLabel, self->_extraDisambiguationSubTextLabel, self->_starView, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-starTop-[_starView(==starHeight)]-(>=0)-|"), 0, &off_100128DD0, v4));
    objc_msgSend(v5, "addConstraints:", v6);

    v7 = (void *)v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-starLeft-[_starView(==starWidth)]-(>=0)-|"), 0, &off_100128DD0, v4));
    objc_msgSend(v5, "addConstraints:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 4, 0, v5, 4, 1.0, 0.0));
    objc_msgSend(v5, "addConstraint:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 5, 0, v5, 5, 1.0, 0.0));
    objc_msgSend(v5, "addConstraint:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 6, 0, v5, 6, 1.0, 0.0));
    objc_msgSend(v5, "addConstraint:", v14);

    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 11, 0, v5, 3, 1.0, 28.5));
    titleBaselineConstraint = self->_titleBaselineConstraint;
    self->_titleBaselineConstraint = v15;

    objc_msgSend(v5, "addConstraint:", self->_titleBaselineConstraint);
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_secondaryTitleLabel, 11, 0, v5, 3, 1.0, 41.0));
    secondaryTitleBaselineConstraint = self->_secondaryTitleBaselineConstraint;
    self->_secondaryTitleBaselineConstraint = v17;

    objc_msgSend(v5, "addConstraint:", self->_secondaryTitleBaselineConstraint);
    v19 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_titleLabel]-[_extraDisambiguationLabel]-edgePadding-|"), 0, &off_100128DD0, v7));
    objc_msgSend(v5, "addConstraints:", v20);

    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 5, 0, v5, 5, 1.0, 35.0));
    titleLeadingOffsetConstraint = self->_titleLeadingOffsetConstraint;
    self->_titleLeadingOffsetConstraint = v21;

    LODWORD(v23) = 1144750080;
    -[NSLayoutConstraint setPriority:](self->_titleLeadingOffsetConstraint, "setPriority:", v23);
    objc_msgSend(v5, "addConstraint:", self->_titleLeadingOffsetConstraint);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 5, 0, self->_secondaryTitleLabel, 5, 1.0, 0.0));
    objc_msgSend(v5, "addConstraint:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_extraDisambiguationLabel, 5, 0, self->_extraDisambiguationSubTextLabel, 5, 1.0, 0.0));
    objc_msgSend(v5, "addConstraint:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 6, 0, self->_secondaryTitleLabel, 6, 1.0, 0.0));
    objc_msgSend(v5, "addConstraint:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_extraDisambiguationLabel, 6, 0, self->_extraDisambiguationSubTextLabel, 6, 1.0, 0.0));
    objc_msgSend(v5, "addConstraint:", v27);

    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_extraDisambiguationLabel, 11, 0, v5, 3, 1.0, 28.5));
    extraTitleBaselineConstraint = self->_extraTitleBaselineConstraint;
    self->_extraTitleBaselineConstraint = v28;

    objc_msgSend(v5, "addConstraint:", self->_extraTitleBaselineConstraint);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_extraDisambiguationSubTextLabel, 11, 0, v5, 3, 1.0, 41.0));
    objc_msgSend(v5, "addConstraint:", v30);

    self->_constraintsCreated = 1;
  }
  -[SRDisambiguationCell updateConstraintConstants](self, "updateConstraintConstants");
}

- (void)updateConstraintConstants
{
  NSLayoutConstraint *titleLeadingOffsetConstraint;
  double v4;
  double v5;
  UIImageView *imageView;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  titleLeadingOffsetConstraint = self->_titleLeadingOffsetConstraint;
  if (self->_hasStarColumn)
    v4 = 35.0;
  else
    v4 = 15.0;
  -[NSLayoutConstraint setConstant:](titleLeadingOffsetConstraint, "setConstant:", v4);
  if (self->_hasStarColumn)
    v5 = 35.0;
  else
    v5 = 15.0;
  -[NSLayoutConstraint setConstant:](self->_imageLeadingOffsetConstraint, "setConstant:", v5);
  imageView = self->_imageView;
  if (imageView)
    v7 = 46.0;
  else
    v7 = 28.5;
  if (imageView)
    v8 = 56.0;
  else
    v8 = 41.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell item](self, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subtitle"));
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    if (imageView)
      v12 = 34.0;
    else
      v12 = 21.0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell item](self, "item"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "headingText"));
    v15 = objc_msgSend(v14, "length");

    if (v15)
      v12 = 40.5;
    else
      v12 = v7;
    if (v15)
      v8 = 19.0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell item](self, "item"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "extraDisambiguationSubText"));
  v18 = objc_msgSend(v17, "length");

  if (v18)
    v7 = 21.0;
  -[NSLayoutConstraint setConstant:](self->_titleBaselineConstraint, "setConstant:", v12);
  -[NSLayoutConstraint setConstant:](self->_secondaryTitleBaselineConstraint, "setConstant:", v8);
  -[NSLayoutConstraint setConstant:](self->_extraTitleBaselineConstraint, "setConstant:", v7);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRDisambiguationCell;
  -[SRDisambiguationCell prepareForReuse](&v3, "prepareForReuse");
  -[SRDisambiguationCell setItem:](self, "setItem:", 0);
}

- (void)setItem:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  SiriSharedUIContentLabel *secondaryTitleLabel;
  uint64_t v14;
  void *v15;
  SiriSharedUIContentLabel *extraDisambiguationLabel;
  void *v17;
  SiriSharedUIContentLabel *extraDisambiguationSubTextLabel;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
  v6 = objc_msgSend(v21, "titleBoldedRange");
  if (v7)
  {
    v8 = v6;
    v9 = v7;
    v10 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_mediumWeightFontWithSize:](UIFont, "siriui_mediumWeightFontWithSize:", 18.0));
    objc_msgSend(v10, "addAttribute:value:range:", NSFontAttributeName, v11, v8, v9);
    -[SiriSharedUIContentLabel setAttributedText:](self->_titleLabel, "setAttributedText:", v10);

  }
  else
  {
    -[SiriSharedUIContentLabel setText:](self->_titleLabel, "setText:", v5);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "subtitle"));

  secondaryTitleLabel = self->_secondaryTitleLabel;
  if (v12)
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "subtitle"));
  else
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "headingText"));
  v15 = (void *)v14;
  -[SiriSharedUIContentLabel setText:](secondaryTitleLabel, "setText:", v14);

  extraDisambiguationLabel = self->_extraDisambiguationLabel;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "extraDisambiguationText"));
  -[SiriSharedUIContentLabel setText:](extraDisambiguationLabel, "setText:", v17);

  extraDisambiguationSubTextLabel = self->_extraDisambiguationSubTextLabel;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "extraDisambiguationSubText"));
  -[SiriSharedUIContentLabel setText:](extraDisambiguationSubTextLabel, "setText:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "imageView"));
  -[SRDisambiguationCell setImageView:](self, "setImageView:", v20);

  -[SRDisambiguationCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[SRDisambiguationCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setImageView:(id)a3
{
  UIImageView **p_imageView;
  NSLayoutConstraint *imageLeadingOffsetConstraint;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *v19;
  id v20;

  v20 = a3;
  p_imageView = &self->_imageView;
  -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
  imageLeadingOffsetConstraint = self->_imageLeadingOffsetConstraint;
  self->_imageLeadingOffsetConstraint = 0;

  objc_storeStrong((id *)&self->_imageView, a3);
  if (self->_imageView)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", *p_imageView);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](*p_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
    v9 = _NSDictionaryOfVariableBindings(CFSTR("_imageView"), *p_imageView, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_imageView(==imageWidth)]"), 0, &off_100128DF8, v10));
    objc_msgSend(v8, "addConstraints:", v11);

    v12 = _NSDictionaryOfVariableBindings(CFSTR("_imageView, _titleLabel"), *p_imageView, self->_titleLabel, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-imageTop-[_imageView(==imageHeight)]"), 0, &off_100128DF8, v13));
    objc_msgSend(v8, "addConstraints:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 5, 0, *p_imageView, 6, 1.0, 15.0));
    LODWORD(v16) = 1144766464;
    objc_msgSend(v15, "setPriority:", v16);
    objc_msgSend(v8, "addConstraint:", v15);
    if (self->_hasStarColumn)
      v17 = 35.0;
    else
      v17 = 15.0;
    v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *p_imageView, 5, 0, v8, 5, 1.0, v17));
    v19 = self->_imageLeadingOffsetConstraint;
    self->_imageLeadingOffsetConstraint = v18;

    objc_msgSend(v8, "addConstraint:", self->_imageLeadingOffsetConstraint);
  }

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
  objc_msgSend(v7, "removeConstraints:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SRDisambiguationCell;
  -[SRDisambiguationCell setSemanticContentAttribute:](&v9, "setSemanticContentAttribute:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
  objc_msgSend(v8, "addConstraints:", v6);

}

+ (double)defaultHeight
{
  return 44.0;
}

+ (double)defaultHeightWithHeading
{
  return 50.0;
}

+ (double)defaultHeightWithSubtitle
{
  return 55.0;
}

+ (double)defaultHeightWithImageView
{
  return 76.0;
}

- (SiriUIDisambiguationItem)item
{
  return self->_item;
}

- (BOOL)hasStarColumn
{
  return self->_hasStarColumn;
}

- (void)setHasStarColumn:(BOOL)a3
{
  self->_hasStarColumn = a3;
}

- (BOOL)isLastRow
{
  return self->_lastRow;
}

- (void)setLastRow:(BOOL)a3
{
  self->_lastRow = a3;
}

- (SiriSharedUIContentLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (SiriSharedUIContentLabel)secondaryTitleLabel
{
  return self->_secondaryTitleLabel;
}

- (void)setSecondaryTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitleLabel, a3);
}

- (SiriSharedUIContentLabel)extraDisambiguationLabel
{
  return self->_extraDisambiguationLabel;
}

- (void)setExtraDisambiguationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_extraDisambiguationLabel, a3);
}

- (SiriSharedUIContentLabel)extraDisambiguationSubTextLabel
{
  return self->_extraDisambiguationSubTextLabel;
}

- (void)setExtraDisambiguationSubTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_extraDisambiguationSubTextLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)starView
{
  return self->_starView;
}

- (void)setStarView:(id)a3
{
  objc_storeStrong((id *)&self->_starView, a3);
}

- (NSLayoutConstraint)titleLeadingOffsetConstraint
{
  return self->_titleLeadingOffsetConstraint;
}

- (void)setTitleLeadingOffsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLeadingOffsetConstraint, a3);
}

- (NSLayoutConstraint)imageLeadingOffsetConstraint
{
  return self->_imageLeadingOffsetConstraint;
}

- (void)setImageLeadingOffsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageLeadingOffsetConstraint, a3);
}

- (NSLayoutConstraint)titleBaselineConstraint
{
  return self->_titleBaselineConstraint;
}

- (void)setTitleBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleBaselineConstraint, a3);
}

- (NSLayoutConstraint)secondaryTitleBaselineConstraint
{
  return self->_secondaryTitleBaselineConstraint;
}

- (void)setSecondaryTitleBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitleBaselineConstraint, a3);
}

- (NSLayoutConstraint)extraTitleBaselineConstraint
{
  return self->_extraTitleBaselineConstraint;
}

- (void)setExtraTitleBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_extraTitleBaselineConstraint, a3);
}

- (BOOL)constraintsCreated
{
  return self->_constraintsCreated;
}

- (void)setConstraintsCreated:(BOOL)a3
{
  self->_constraintsCreated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_imageLeadingOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_starView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_extraDisambiguationSubTextLabel, 0);
  objc_storeStrong((id *)&self->_extraDisambiguationLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
