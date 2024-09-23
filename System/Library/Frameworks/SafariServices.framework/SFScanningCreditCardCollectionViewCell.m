@implementation SFScanningCreditCardCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("ScanCreditCardCell");
}

+ (double)desiredCellWidth
{
  if (desiredCellWidth_onceToken != -1)
    dispatch_once(&desiredCellWidth_onceToken, &__block_literal_global_58);
  return *(double *)&desiredCellWidth_cellWidth;
}

void __58__SFScanningCreditCardCollectionViewCell_desiredCellWidth__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v0 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard.viewfinder"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v0, "initWithImage:", v1);

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  v3 = (void *)MEMORY[0x1E0DC37E8];
  v4 = *MEMORY[0x1E0DC4A90];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:compatibleWithTraitCollection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v6);

  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v7);

  objc_msgSend(v11, "intrinsicContentSize");
  v9 = v8;
  objc_msgSend(v2, "intrinsicContentSize");
  *(double *)&desiredCellWidth_cellWidth = v9 + v10 + 4.0 + 40.0;

}

- (SFScanningCreditCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  SFScanningCreditCardCollectionViewCell *v3;
  SFScanningCreditCardCollectionViewCell *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UIImageView *scanningImageView;
  UILabel *v10;
  UILabel *scanCardLabel;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  SFScanningCreditCardCollectionViewCell *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  objc_super v37;
  _QWORD v38[3];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)SFScanningCreditCardCollectionViewCell;
  v3 = -[SFScanningCreditCardCollectionViewCell initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFScanningCreditCardCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("ScanCreditCardCell"));
    -[SFScanningCreditCardCollectionViewCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v36, "_setContinuousCornerRadius:", 12.0);
    -[SFScanningCreditCardCollectionViewCell setBackgroundView:](v4, "setBackgroundView:", v36);
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard.viewfinder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithImage:", v7);
    scanningImageView = v4->_scanningImageView;
    v4->_scanningImageView = (UIImageView *)v8;

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    scanCardLabel = v4->_scanCardLabel;
    v4->_scanCardLabel = v10;

    v12 = (void *)MEMORY[0x1E0DC37E8];
    v13 = *MEMORY[0x1E0DC4A90];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredFontForTextStyle:compatibleWithTraitCollection:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_scanCardLabel, "setFont:", v15);

    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4->_scanCardLabel, "setText:", v16);

    v17 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v39[0] = v4->_scanningImageView;
    v39[1] = v4->_scanCardLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithArrangedSubviews:", v18);

    objc_msgSend(v19, "setAxis:", 0);
    objc_msgSend(v19, "setDistribution:", 0);
    objc_msgSend(v19, "setAlignment:", 3);
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v19, "setSpacing:", 4.0);
    v20 = v5;
    objc_msgSend(v5, "addSubview:", v19);
    v31 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v19, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v32;
    objc_msgSend(v19, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v20;
    objc_msgSend(v20, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v23;
    objc_msgSend(v19, "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v28);

    v29 = v4;
  }

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[SFScanningCreditCardCollectionViewCell isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)SFScanningCreditCardCollectionViewCell;
  -[SFScanningCreditCardCollectionViewCell setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    if (v3)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFScanningCreditCardCollectionViewCell backgroundView](self, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanCardLabel, 0);
  objc_storeStrong((id *)&self->_scanningImageView, 0);
}

@end
