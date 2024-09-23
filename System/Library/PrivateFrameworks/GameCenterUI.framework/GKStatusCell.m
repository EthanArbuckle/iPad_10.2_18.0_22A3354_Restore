@implementation GKStatusCell

- (GKStatusCell)initWithFrame:(CGRect)a3
{
  GKStatusCell *v3;
  GKStatusCell *v4;
  uint64_t v5;
  UILabel *statusLabel;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKStatusCell;
  v3 = -[GKCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[UICollectionReusableView _gkNewStandardInfoLabel](v3, "_gkNewStandardInfoLabel");
    statusLabel = v4->_statusLabel;
    v4->_statusLabel = (UILabel *)v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKStatusCell addSubview:](v4, "addSubview:", v4->_statusLabel);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_statusLabel, 10, 0, v4, 10, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKStatusCell addConstraint:](v4, "addConstraint:", v7);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_statusLabel, 9, 0, v4, 9, 1.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKStatusCell addConstraint:](v4, "addConstraint:", v8);

    -[GKStatusCell setStatus:](v4, "setStatus:", &stru_1E59EB978);
  }
  return v4;
}

- (void)setStatus:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D25B28];
  v5 = a3;
  objc_msgSend(v4, "textStyle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "caption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkAttributedStringByApplyingStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setAttributedText:](self->_statusLabel, "setAttributedText:", v7);
}

- (BOOL)canRemoveItem
{
  return 0;
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKStatusCell;
  -[GKCollectionViewCell prepareForReuse](&v2, sel_prepareForReuse);
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusLabel, 0);
}

@end
