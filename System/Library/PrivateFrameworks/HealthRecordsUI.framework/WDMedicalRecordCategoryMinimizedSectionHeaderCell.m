@implementation WDMedicalRecordCategoryMinimizedSectionHeaderCell

- (void)setupSubviews
{
  id v3;
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
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WDMedicalRecordCategoryMinimizedSectionHeaderCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v17, sel_setupSubviews);
  v3 = objc_alloc_init(MEMORY[0x1E0D2F728]);
  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell setBackgroundGradientView:](self, "setBackgroundGradientView:", v3);

  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell backgroundGradientView](self, "backgroundGradientView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maskCorners:radius:", 3, 10.0);

  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell backgroundGradientView](self, "backgroundGradientView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell backgroundGradientView](self, "backgroundGradientView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell backgroundGradientView](self, "backgroundGradientView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell backgroundGradientView](self, "backgroundGradientView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_alignConstraintsWithView:", v10);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_pillBackgroundViewHeightConstraint");
  objc_msgSend(v12, "constraintEqualToConstant:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell setHeightConstraint:](self, "setHeightConstraint:", v13);

  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell heightConstraint](self, "heightConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 1144750080;
  objc_msgSend(v14, "setPriority:", v15);

  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell heightConstraint](self, "heightConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

}

- (void)setGradient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell backgroundGradientView](self, "backgroundGradientView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGradient:", v4);

}

- (HKGradient)gradient
{
  void *v2;
  void *v3;

  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell backgroundGradientView](self, "backgroundGradientView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKGradient *)v3;
}

+ (id)_titleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4A88], 1024);
}

+ (double)_pillBackgroundViewHeightConstraint
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_titleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 16.0);
  v4 = v3;

  return v4;
}

- (double)_cornerRadius
{
  return 10.0;
}

- (void)_updateForCurrentSizeCategory
{
  double v3;
  double v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "_pillBackgroundViewHeightConstraint");
  v4 = v3;
  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell heightConstraint](self, "heightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[WDMedicalRecordCategoryMinimizedSectionHeaderCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[WDMedicalRecordCategoryMinimizedSectionHeaderCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    v4 = v9;
    if ((v8 & 1) == 0)
    {
      -[WDMedicalRecordCategoryMinimizedSectionHeaderCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
      v4 = v9;
    }
  }

}

- (HKGradientView)backgroundGradientView
{
  return self->_backgroundGradientView;
}

- (void)setBackgroundGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundGradientView, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundGradientView, 0);
}

@end
