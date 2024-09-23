@implementation HKElectrocardiogramTableViewCell

- (HKElectrocardiogramTableViewCell)initWithSample:(id)a3 dateCache:(id)a4 onboarding:(BOOL)a5 activeAlgorithmVersion:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  HKElectrocardiogramTableViewCell *v13;
  objc_super v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend((id)objc_opt_class(), "defaultReuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramTableViewCell;
  v13 = -[HKElectrocardiogramTableViewCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, 0, v12);

  if (v13)
  {
    -[HKElectrocardiogramTableViewCell _setupUIWithSample:dateCache:onboarding:activeAlgorithmVersion:](v13, "_setupUIWithSample:dateCache:onboarding:activeAlgorithmVersion:", v10, v11, v7, a6);
    -[HKElectrocardiogramTableViewCell _setupConstraints](v13, "_setupConstraints");
  }

  return v13;
}

- (void)setActiveAlgorithmVersion:(int64_t)a3
{
  id v4;

  -[HKElectrocardiogramTableViewCell cardView](self, "cardView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveAlgorithmVersion:", a3);

}

- (void)setSample:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKElectrocardiogramTableViewCell cardView](self, "cardView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSample:", v4);

}

- (HKElectrocardiogram)sample
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramTableViewCell cardView](self, "cardView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKElectrocardiogram *)v3;
}

- (void)setBottomPaddingDisabled:(BOOL)a3
{
  double v3;
  id v4;

  self->_bottomPaddingDisabled = a3;
  if (a3)
    v3 = 0.0;
  else
    v3 = 16.0;
  -[HKElectrocardiogramTableViewCell bottomPaddingConstraint](self, "bottomPaddingConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", v3);

}

+ (id)defaultReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramTableViewCell;
  -[HKElectrocardiogramTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HKElectrocardiogramTableViewCell cardView](self, "cardView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSample:", 0);

}

+ (double)estimatedHeight
{
  double result;

  +[HKElectrocardiogramCardView estimatedHeight](HKElectrocardiogramCardView, "estimatedHeight");
  return result;
}

- (void)_setupUIWithSample:(id)a3 dateCache:(id)a4 onboarding:(BOOL)a5 activeAlgorithmVersion:(int64_t)a6
{
  _BOOL8 v7;
  void *v10;
  id v11;
  id v12;
  void *v13;
  HKElectrocardiogramCardView *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a5;
  v10 = (void *)MEMORY[0x1E0DC3658];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v13);

  v14 = -[HKElectrocardiogramCardView initWithSample:dateCache:onboarding:activeAlgorithmVersion:isSampleInteractive:]([HKElectrocardiogramCardView alloc], "initWithSample:dateCache:onboarding:activeAlgorithmVersion:isSampleInteractive:", v12, v11, v7, a6, 1);
  -[HKElectrocardiogramTableViewCell setCardView:](self, "setCardView:", v14);

  -[HKElectrocardiogramTableViewCell cardView](self, "cardView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramTableViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramTableViewCell cardView](self, "cardView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[HKElectrocardiogramTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
}

- (void)_setupConstraints
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
  void *v13;
  void *v14;
  id v15;

  -[HKElectrocardiogramTableViewCell cardView](self, "cardView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  -[HKElectrocardiogramTableViewCell cardView](self, "cardView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HKElectrocardiogramTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramTableViewCell cardView](self, "cardView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 16.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramTableViewCell setBottomPaddingConstraint:](self, "setBottomPaddingConstraint:", v14);

  -[HKElectrocardiogramTableViewCell bottomPaddingConstraint](self, "bottomPaddingConstraint");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

}

- (BOOL)bottomPaddingDisabled
{
  return self->_bottomPaddingDisabled;
}

- (HKElectrocardiogramCardView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
  objc_storeStrong((id *)&self->_cardView, a3);
}

- (NSLayoutConstraint)bottomPaddingConstraint
{
  return self->_bottomPaddingConstraint;
}

- (void)setBottomPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomPaddingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
}

@end
