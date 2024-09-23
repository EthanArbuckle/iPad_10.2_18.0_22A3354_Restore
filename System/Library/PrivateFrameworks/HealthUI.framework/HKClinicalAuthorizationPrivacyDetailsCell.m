@implementation HKClinicalAuthorizationPrivacyDetailsCell

- (HKClinicalAuthorizationPrivacyDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKClinicalAuthorizationPrivacyDetailsCell *v4;
  HKClinicalAuthorizationPrivacyDetailsCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKClinicalAuthorizationPrivacyDetailsCell;
  v4 = -[HKClinicalAuthorizationPrivacyDetailsCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKClinicalAuthorizationPrivacyDetailsCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1);
    -[HKClinicalAuthorizationPrivacyDetailsCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    -[HKClinicalAuthorizationPrivacyDetailsCell _setUpSubviews](v5, "_setUpSubviews");
    -[HKClinicalAuthorizationPrivacyDetailsCell _setUpConstraints](v5, "_setUpConstraints");
    -[HKClinicalAuthorizationPrivacyDetailsCell _updateForCurrentContentSizeCategory](v5, "_updateForCurrentContentSizeCategory");
  }
  return v5;
}

- (void)setSource:(id)a3
{
  id WeakRetained;
  char v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  v5 = objc_msgSend(WeakRetained, "isEqual:", obj);

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_source, obj);
    -[HKClinicalAuthorizationPrivacyDetailsCell _updateForCurrentContentSizeCategory](self, "_updateForCurrentContentSizeCategory");
  }

}

- (void)_setUpSubviews
{
  _HKClinicalBulletedListLayoutManager *v3;
  _HKClinicalBulletedListLayoutManager *bulletLayoutManager;
  _HKClinicalBulletedListLayoutManager *v5;
  UITextView *v6;
  UITextView *contentsTextView;
  id v8;

  -[HKClinicalAuthorizationPrivacyDetailsCell contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreservesSuperviewLayoutMargins:", 1);
  v3 = objc_alloc_init(_HKClinicalBulletedListLayoutManager);
  bulletLayoutManager = self->_bulletLayoutManager;
  self->_bulletLayoutManager = v3;
  v5 = v3;

  -[HKClinicalAuthorizationPrivacyDetailsCell _createContentsTextViewWithLayoutManager:](self, "_createContentsTextViewWithLayoutManager:", v5);
  v6 = (UITextView *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v6);
  contentsTextView = self->_contentsTextView;
  self->_contentsTextView = v6;

}

- (void)_setUpConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *superviewTopToContentsTextViewFirstBaselineConstraint;
  NSLayoutConstraint *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *contentsTextViewLastBaselineToSuperviewBottomConstraint;
  id v20;

  -[HKClinicalAuthorizationPrivacyDetailsCell contentView](self, "contentView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationPrivacyDetailsCell contentsTextView](self, "contentsTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(v4, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(v4, "firstBaselineAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  -[NSLayoutConstraint setActive:](v13, "setActive:", 1);
  superviewTopToContentsTextViewFirstBaselineConstraint = self->_superviewTopToContentsTextViewFirstBaselineConstraint;
  self->_superviewTopToContentsTextViewFirstBaselineConstraint = v13;
  v15 = v13;

  objc_msgSend(v20, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastBaselineAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  -[NSLayoutConstraint setActive:](v18, "setActive:", 1);
  contentsTextViewLastBaselineToSuperviewBottomConstraint = self->_contentsTextViewLastBaselineToSuperviewBottomConstraint;
  self->_contentsTextViewLastBaselineToSuperviewBottomConstraint = v18;

}

- (id)_createContentsTextViewWithLayoutManager:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0DC1320];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "addLayoutManager:", v4);
  v6 = objc_alloc(MEMORY[0x1E0DC12C0]);
  v7 = (void *)objc_msgSend(v6, "initWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v4, "addTextContainer:", v7);

  v8 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v9 = (void *)objc_msgSend(v8, "initWithFrame:textContainer:", v7, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v11);

  objc_msgSend(v9, "setEditable:", 0);
  objc_msgSend(v9, "setScrollEnabled:", 0);
  objc_msgSend(v9, "textContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v9, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

  return v9;
}

- (id)_attributedContentsTextViewStringForCurrentContentSizeCategory
{
  id v3;
  uint64_t i;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  for (i = 0; i != 3; ++i)
  {
    -[HKClinicalAuthorizationPrivacyDetailsCell _attributedStringForBulletAtIndex:](self, "_attributedStringForBulletAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendAttributedString:", v5);

  }
  return v3;
}

- (id)_titleParagraphStyle
{
  void *v2;
  id v3;

  -[HKClinicalAuthorizationPrivacyDetailsCell _bulletContentFont](self, "_bulletContentFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v2, "_scaledValueForValue:", 8.0);
  objc_msgSend(v3, "setParagraphSpacing:");

  return v3;
}

- (id)_localizedBulletContentStringForBulletAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v10;

  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationPrivacyDetailsCell.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0 && index < _BulletCount"));

  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INTRO_PRIVACY_DETAILS_BULLET_%ld"), a3 + 1);
  HKHealthRecordsAPILocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_attributedStringForBulletAtIndex:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v14[0] = MEMORY[0x1E0C9AAB0];
  v5 = *MEMORY[0x1E0DC1138];
  v13[0] = CFSTR("_IsBulletedAttributeName");
  v13[1] = v5;
  -[HKClinicalAuthorizationPrivacyDetailsCell _bulletContentFont](self, "_bulletContentFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = *MEMORY[0x1E0DC1178];
  -[HKClinicalAuthorizationPrivacyDetailsCell _bulletContentParagraphStyle](self, "_bulletContentParagraphStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKClinicalAuthorizationPrivacyDetailsCell _localizedBulletContentStringForBulletAtIndex:](self, "_localizedBulletContentStringForBulletAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v9);

  return v11;
}

- (id)_bulletContentParagraphStyle
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;

  -[HKClinicalAuthorizationPrivacyDetailsCell _bulletContentFont](self, "_bulletContentFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationPrivacyDetailsCell _attributedStringForBullet](self, "_attributedStringForBullet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5 + 14.0;
  v7 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v7, "setFirstLineHeadIndent:", v6);
  objc_msgSend(v7, "setHeadIndent:", v6);
  objc_msgSend(v3, "_scaledValueForValue:", 34.0);
  v9 = v8;
  objc_msgSend(v3, "lineHeight");
  objc_msgSend(v7, "setParagraphSpacingBefore:", v9 - v10);

  return v7;
}

- (id)_attributedStringForBullet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0DC1138];
  -[HKClinicalAuthorizationPrivacyDetailsCell _bulletFont](self, "_bulletFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("⦁"), v4);
  return v5;
}

- (id)_bodyEmph
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
}

- (id)_bulletFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
}

- (id)_bulletContentFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (void)_updateForCurrentContentSizeCategory
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[HKClinicalAuthorizationPrivacyDetailsCell _bodyEmph](self, "_bodyEmph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 36.0);
  v5 = v4;
  -[HKClinicalAuthorizationPrivacyDetailsCell superviewTopToContentsTextViewFirstBaselineConstraint](self, "superviewTopToContentsTextViewFirstBaselineConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  -[HKClinicalAuthorizationPrivacyDetailsCell _bulletContentFont](self, "_bulletContentFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_scaledValueForValue:", 32.0);
  v9 = v8;
  -[HKClinicalAuthorizationPrivacyDetailsCell contentsTextViewLastBaselineToSuperviewBottomConstraint](self, "contentsTextViewLastBaselineToSuperviewBottomConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

  -[HKClinicalAuthorizationPrivacyDetailsCell _attributedStringForBullet](self, "_attributedStringForBullet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationPrivacyDetailsCell bulletLayoutManager](self, "bulletLayoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBullet:", v11);

  -[HKClinicalAuthorizationPrivacyDetailsCell _attributedContentsTextViewStringForCurrentContentSizeCategory](self, "_attributedContentsTextViewStringForCurrentContentSizeCategory");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationPrivacyDetailsCell contentsTextView](self, "contentsTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttributedText:", v14);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalAuthorizationPrivacyDetailsCell;
  -[HKClinicalAuthorizationPrivacyDetailsCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKClinicalAuthorizationPrivacyDetailsCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKClinicalAuthorizationPrivacyDetailsCell _updateForCurrentContentSizeCategory](self, "_updateForCurrentContentSizeCategory");
  }

}

- (HKSource)source
{
  return (HKSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (NSLayoutConstraint)superviewTopToContentsTextViewFirstBaselineConstraint
{
  return self->_superviewTopToContentsTextViewFirstBaselineConstraint;
}

- (NSLayoutConstraint)contentsTextViewLastBaselineToSuperviewBottomConstraint
{
  return self->_contentsTextViewLastBaselineToSuperviewBottomConstraint;
}

- (UITextView)contentsTextView
{
  return self->_contentsTextView;
}

- (_HKClinicalBulletedListLayoutManager)bulletLayoutManager
{
  return self->_bulletLayoutManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletLayoutManager, 0);
  objc_storeStrong((id *)&self->_contentsTextView, 0);
  objc_storeStrong((id *)&self->_contentsTextViewLastBaselineToSuperviewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_superviewTopToContentsTextViewFirstBaselineConstraint, 0);
  objc_destroyWeak((id *)&self->_source);
}

@end
