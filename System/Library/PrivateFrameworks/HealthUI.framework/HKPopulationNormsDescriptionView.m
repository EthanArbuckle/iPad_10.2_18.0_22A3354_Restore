@implementation HKPopulationNormsDescriptionView

- (HKPopulationNormsDescriptionView)init
{
  HKPopulationNormsDescriptionView *v2;
  UILabel *v3;
  UILabel *classificationTitleLabel;
  void *v5;
  UILabel *v6;
  UILabel *classificationDescriptionLabel;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKPopulationNormsDescriptionView;
  v2 = -[HKPopulationNormsDescriptionView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    classificationTitleLabel = v2->_classificationTitleLabel;
    v2->_classificationTitleLabel = v3;

    -[UILabel setNumberOfLines:](v2->_classificationTitleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AD0], 32770);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_classificationTitleLabel, "setFont:", v5);

    -[UILabel setAdjustsFontForContentSizeCategory:](v2->_classificationTitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[HKPopulationNormsDescriptionView addSubview:](v2, "addSubview:", v2->_classificationTitleLabel);
    -[UILabel hk_constrainToSuperviewAlongEdges:constant:](v2->_classificationTitleLabel, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA4D8, 0.0);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    classificationDescriptionLabel = v2->_classificationDescriptionLabel;
    v2->_classificationDescriptionLabel = v6;

    -[UILabel setNumberOfLines:](v2->_classificationDescriptionLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_classificationDescriptionLabel, "setFont:", v8);

    -[HKPopulationNormsDescriptionView addSubview:](v2, "addSubview:", v2->_classificationDescriptionLabel);
    -[UILabel setAdjustsFontForContentSizeCategory:](v2->_classificationDescriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel hk_constrainToView:fromEdge:toEdge:constant:](v2->_classificationDescriptionLabel, "hk_constrainToView:fromEdge:toEdge:constant:", v2->_classificationTitleLabel, 3, 4, 5.0);
    -[UILabel hk_constrainToSuperviewAlongEdges:constant:](v2->_classificationDescriptionLabel, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA4F0, 0.0);
  }
  return v2;
}

- (void)updateWithTitle:(id)a3 description:(id)a4
{
  id v6;
  void *v7;
  UILabel *classificationDescriptionLabel;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  -[UILabel setText:](self->_classificationTitleLabel, "setText:", a3);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  classificationDescriptionLabel = self->_classificationDescriptionLabel;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HKPopulationNormsDescriptionView_updateWithTitle_description___block_invoke;
  v10[3] = &unk_1E9C3FC50;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", classificationDescriptionLabel, 5242880, v10, 0, 0.2);

}

uint64_t __64__HKPopulationNormsDescriptionView_updateWithTitle_description___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setText:", *(_QWORD *)(a1 + 40));
}

- (UILabel)classificationTitleLabel
{
  return self->_classificationTitleLabel;
}

- (void)setClassificationTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_classificationTitleLabel, a3);
}

- (UILabel)classificationDescriptionLabel
{
  return self->_classificationDescriptionLabel;
}

- (void)setClassificationDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_classificationDescriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_classificationTitleLabel, 0);
}

@end
