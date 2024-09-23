@implementation ASVPercentLozenge

- (ASVPercentLozenge)init
{
  ASVPercentLozenge *v2;
  NSNumberFormatter *v3;
  NSNumberFormatter *percentageFormatter;
  id v5;
  float v6;
  uint64_t v7;
  UIViewPropertyAnimator *percentLozengeAnimator;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ASVPercentLozenge;
  v2 = -[ASVPercentLozenge initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    percentageFormatter = v2->_percentageFormatter;
    v2->_percentageFormatter = v3;

    -[NSNumberFormatter setNumberStyle:](v2->_percentageFormatter, "setNumberStyle:", 3);
    v5 = objc_alloc(MEMORY[0x1E0DC3F38]);
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingPercentLozengeFadeOutDuration"));
    v7 = objc_msgSend(v5, "initWithDuration:curve:animations:", 0, 0, v6);
    percentLozengeAnimator = v2->_percentLozengeAnimator;
    v2->_percentLozengeAnimator = (UIViewPropertyAnimator *)v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVPercentLozenge setTextColor:](v2, "setTextColor:", v9);

    -[ASVPercentLozenge setTextAlignment:](v2, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVPercentLozenge setBackgroundColor:](v2, "setBackgroundColor:", v10);

    -[ASVPercentLozenge lozengeFont](v2, "lozengeFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVPercentLozenge setFont:](v2, "setFont:", v11);

    -[ASVPercentLozenge setAdjustsFontForContentSizeCategory:](v2, "setAdjustsFontForContentSizeCategory:", 1);
    -[ASVPercentLozenge layer](v2, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 1);

  }
  return v2;
}

- (void)setPercentage:(float)a3
{
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[ASVPercentLozenge percentageFormatter](self, "percentageFormatter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPercentLozenge setText:](self, "setText:", v7);

}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASVPercentLozenge;
  -[ASVPercentLozenge setText:](&v4, sel_setText_, a3);
  -[ASVPercentLozenge sizeToFit](self, "sizeToFit");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASVPercentLozenge;
  v4 = a3;
  -[ASVPercentLozenge traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[ASVPercentLozenge traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[ASVPercentLozenge sizeToFit](self, "sizeToFit");
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[ASVPercentLozenge intrinsicContentSize](self, "intrinsicContentSize");
  -[ASVPercentLozenge setBounds:](self, "setBounds:", v3, v4, v5, v6);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASVPercentLozenge;
  -[ASVPercentLozenge layoutSubviews](&v9, sel_layoutSubviews);
  -[ASVPercentLozenge bounds](self, "bounds");
  v4 = v3;
  -[ASVPercentLozenge bounds](self, "bounds");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6 * 0.5;
  -[ASVPercentLozenge layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)ASVPercentLozenge;
  -[ASVPercentLozenge intrinsicContentSize](&v6, sel_intrinsicContentSize);
  v3 = v2 + 20.0;
  v5 = v4 + 10.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  float v7;
  double v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  id location;

  v4 = a3;
  if (a4)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0DC3F10];
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingPercentLozengeFadeOutDuration"));
    v8 = v7;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__ASVPercentLozenge_setHidden_animated___block_invoke;
    v10[3] = &unk_1E9F0CE10;
    objc_copyWeak(&v11, &location);
    v12 = v4;
    objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 0, v10, &__block_literal_global_9, v8, 0.0);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ASVPercentLozenge percentLozengeAnimator](self, "percentLozengeAnimator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAnimation:", 1);

    -[ASVPercentLozenge setAlpha:](self, "setAlpha:", (double)!v4);
  }
}

void __40__ASVPercentLozenge_setHidden_animated___block_invoke(uint64_t a1)
{
  double v1;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", v1);

}

- (id)lozengeFont
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[ASVPercentLozenge traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)*MEMORY[0x1E0DC48D8];
  if ((UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D8]) & 0x8000000000000000) == 0)
  {
    v5 = v4;

    v3 = v5;
  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AA0], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x1E0DC1380];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6, *MEMORY[0x1E0DC13D8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v18[1] = *MEMORY[0x1E0DC13D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontDescriptorByAddingAttributes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v15, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void)setPercentageFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_percentageFormatter, a3);
}

- (UIViewPropertyAnimator)percentLozengeAnimator
{
  return self->_percentLozengeAnimator;
}

- (void)setPercentLozengeAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_percentLozengeAnimator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentLozengeAnimator, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
}

@end
