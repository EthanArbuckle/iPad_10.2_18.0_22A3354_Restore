@implementation CCUISensorAttributionGameModeFooterView

- (CCUISensorAttributionGameModeFooterView)initWithLabel:(id)a3
{
  id v4;
  CCUISensorAttributionGameModeFooterView *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  UILabel *label;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  objc_super v31;
  _QWORD v32[4];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CCUISensorAttributionGameModeFooterView;
  v5 = -[CCUISensorAttributionGameModeFooterView init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionGameModeFooterView layer](v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v7);

    -[SBFView setAnimatedLayerProperties:](v5, "setAnimatedLayerProperties:", &unk_1E8D188A8);
    -[CCUISensorAttributionGameModeFooterView setClipsToBounds:](v5, "setClipsToBounds:", 0);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AB8], 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v8, "setFont:", v28);
    -[UILabel setLineBreakMode:](v8, "setLineBreakMode:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v8, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v8, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setNumberOfLines:](v8, "setNumberOfLines:", 0);
    -[UILabel setMaximumContentSizeCategory:](v8, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
    -[UILabel setMinimumScaleFactor:](v8, "setMinimumScaleFactor:", 0.5);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v10);

    -[UILabel setText:](v8, "setText:", v4);
    -[CCUISensorAttributionGameModeFooterView addSubview:](v5, "addSubview:", v8);
    label = v5->_label;
    v5->_label = v8;
    v12 = v8;

    v22 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v12, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionGameModeFooterView topAnchor](v5, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v25;
    -[UILabel bottomAnchor](v12, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionGameModeFooterView bottomAnchor](v5, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v13;
    -[UILabel leadingAnchor](v12, "leadingAnchor");
    v30 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionGameModeFooterView leadingAnchor](v5, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v16;
    -[UILabel trailingAnchor](v12, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionGameModeFooterView trailingAnchor](v5, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v20);

    v4 = v30;
  }

  return v5;
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[CCUISensorAttributionGameModeFooterView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (CGRect)cachedExpandedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->cachedExpandedRect.origin.x;
  y = self->cachedExpandedRect.origin.y;
  width = self->cachedExpandedRect.size.width;
  height = self->cachedExpandedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
