@implementation DMCEnrollmentTableViewPromotionCell

- (DMCEnrollmentTableViewPromotionCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_class *v11;
  void *v12;
  DMCEnrollmentTableViewPromotionCell *v13;
  void *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *subtitle;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)DMCEnrollmentTableViewPromotionCell;
  v13 = -[DMCEnrollmentTableViewPromotionCell initWithStyle:reuseIdentifier:](&v25, sel_initWithStyle_reuseIdentifier_, 0, v12);

  if (v13)
  {
    -[DMCEnrollmentTableViewPromotionCell setSelectionStyle:](v13, "setSelectionStyle:", 0);
    -[DMCEnrollmentTableViewPromotionCell setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewPromotionCell setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[DMCEnrollmentTableViewPromotionCell _setupContentConfigurationWithIcon:title:subtitle:](v13, "_setupContentConfigurationWithIcon:title:subtitle:", v10, v8, v9);
    objc_storeStrong((id *)&v13->_icon, a5);
    v15 = objc_msgSend(v8, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v15;

    v17 = objc_msgSend(v9, "copy");
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v17;

    objc_initWeak(&location, v13);
    v26[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __67__DMCEnrollmentTableViewPromotionCell_initWithTitle_subtitle_icon___block_invoke;
    v22[3] = &unk_24D52E2D0;
    objc_copyWeak(&v23, &location);
    v20 = (id)-[DMCEnrollmentTableViewPromotionCell registerForTraitChanges:withHandler:](v13, "registerForTraitChanges:withHandler:", v19, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __67__DMCEnrollmentTableViewPromotionCell_initWithTitle_subtitle_icon___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "icon");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setupContentConfigurationWithIcon:title:subtitle:", v1, v2, v3);

}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)DMCEnrollmentTableViewPromotionCell;
  -[DMCEnrollmentTableViewPromotionCell layoutSubviews](&v3, sel_layoutSubviews);
  -[DMCEnrollmentTableViewPromotionCell bounds](self, "bounds");
  -[DMCEnrollmentTableViewPromotionCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v4), 0.0, 0.0);
}

- (double)cellHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (double)estimatedCellHeight
{
  return 64.0;
}

- (double)gapToNextSection
{
  return 12.0;
}

- (void)_setupContentConfigurationWithIcon:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  DMCEnrollmentTableViewPromotionCell *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  DMCEnrollmentTableViewPromotionCell *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDF6B80];
  v10 = a4;
  v31 = a3;
  objc_msgSend(v9, "cellConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BDD1458]);
  v13 = *MEMORY[0x24BEBB360];
  v34[0] = *MEMORY[0x24BEBB360];
  v14 = self;
  -[DMCEnrollmentTableViewPromotionCell _titleFont](self, "_titleFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v15;
  v16 = *MEMORY[0x24BEBB368];
  v34[1] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v12, "initWithString:attributes:", v10, v18);

  if (v8)
  {
    v20 = objc_alloc(MEMORY[0x24BDD1458]);
    v32[0] = v13;
    -[DMCEnrollmentTableViewPromotionCell _subtitleFont](v14, "_subtitleFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v16;
    v33[0] = v21;
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v20, "initWithString:attributes:", v8, v23);

  }
  else
  {
    v24 = 0;
  }
  v25 = v14;
  objc_msgSend(v11, "directionalLayoutMargins");
  v27 = v26;
  v29 = v28;
  objc_msgSend(v11, "setImage:", v31);

  objc_msgSend(v11, "imageProperties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMaximumSize:", 32.0, 32.0);

  objc_msgSend(v11, "setAttributedText:", v19);
  objc_msgSend(v11, "setSecondaryAttributedText:", v24);
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 13.0, v27, 13.0, v29);
  -[DMCEnrollmentTableViewPromotionCell setContentConfiguration:](v25, "setContentConfiguration:", v11);

}

- (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_subtitleFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
