@implementation HKPopulationNormsClassificationCollectionViewCell

- (HKPopulationNormsClassificationCollectionViewCell)initWithFrame:(CGRect)a3
{
  HKPopulationNormsClassificationCollectionViewCell *v3;
  UILabel *v4;
  UILabel *classificationLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKPopulationNormsClassificationCollectionViewCell;
  v3 = -[HKPopulationNormsClassificationCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    classificationLabel = v3->_classificationLabel;
    v3->_classificationLabel = v4;

    -[HKPopulationNormsClassificationCollectionViewCell addSubview:](v3, "addSubview:", v3->_classificationLabel);
    -[UILabel hk_constrainToSuperviewAlongEdges:constant:](v3->_classificationLabel, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CE9E48, 6.0);
    -[UILabel hk_constrainToSuperviewAlongEdges:constant:](v3->_classificationLabel, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CE9E60, 12.0);
    -[HKPopulationNormsClassificationCollectionViewCell widthAnchor](v3, "widthAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintGreaterThanOrEqualToConstant:", 90.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    -[HKPopulationNormsClassificationCollectionViewCell heightAnchor](v3, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintGreaterThanOrEqualToConstant:", 28.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

    -[HKPopulationNormsClassificationCollectionViewCell _setupFonts](v3, "_setupFonts");
  }
  return v3;
}

- (void)setTitle:(id)a3 classificationIdentifier:(id)a4 highlighted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v5 = a5;
  v13[4] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  self->_isHighlighted = v5;
  v9 = a3;
  -[HKPopulationNormsClassificationCollectionViewCell setSoftHighlightState:](self, "setSoftHighlightState:", v5);
  if (v5)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_populationChartTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_classificationLabel, "setTextColor:", v10);

  -[UILabel setText:](self->_classificationLabel, "setText:", v9);
  -[UILabel setTextAlignment:](self->_classificationLabel, "setTextAlignment:", 1);
  if (v8)
  {
    v13[0] = CFSTR("Cell");
    v13[1] = CFSTR("PopulationNorms");
    v13[2] = CFSTR("Classification");
    v13[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsClassificationCollectionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v12);

  }
  else
  {
    -[HKPopulationNormsClassificationCollectionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
  }
  -[UILabel sizeToFit](self->_classificationLabel, "sizeToFit");

}

- (void)setSoftHighlightState:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (self->_isHighlighted || a3)
  {
    -[HKPopulationNormsClassificationCollectionViewCell highlightColor](self, "highlightColor", a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_populationChartLevelBackgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[HKPopulationNormsClassificationCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKPopulationNormsClassificationCollectionViewCell;
  -[HKPopulationNormsClassificationCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HKPopulationNormsClassificationCollectionViewCell setTitle:classificationIdentifier:highlighted:](self, "setTitle:classificationIdentifier:highlighted:", &stru_1E9C4C428, 0, 0);
}

- (void)layoutSubviews
{
  CGFloat Height;
  double v4;
  void *v5;
  void *v6;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)HKPopulationNormsClassificationCollectionViewCell;
  -[HKPopulationNormsClassificationCollectionViewCell layoutSubviews](&v7, sel_layoutSubviews);
  -[HKPopulationNormsClassificationCollectionViewCell frame](self, "frame");
  Height = CGRectGetHeight(v8);
  v4 = HKUIFloorToScreenScale(Height * 0.5);
  -[HKPopulationNormsClassificationCollectionViewCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  -[HKPopulationNormsClassificationCollectionViewCell layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 1);

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
  v9.super_class = (Class)HKPopulationNormsClassificationCollectionViewCell;
  -[HKPopulationNormsClassificationCollectionViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKPopulationNormsClassificationCollectionViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKPopulationNormsClassificationCollectionViewCell _setupFonts](self, "_setupFonts");
  }

}

- (void)_setupFonts
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], 32770, *MEMORY[0x1E0DC48D8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_classificationLabel, "setFont:", v3);

}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (UILabel)classificationLabel
{
  return self->_classificationLabel;
}

- (void)setClassificationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_classificationLabel, a3);
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setIsHighlighted:(BOOL)a3
{
  self->_isHighlighted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end
