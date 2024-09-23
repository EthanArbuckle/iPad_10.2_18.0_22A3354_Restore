@implementation CNContactGeminiView

- (CNContactGeminiView)initWithFrame:(CGRect)a3
{
  CNContactGeminiView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *typeLabel;
  double v11;
  double v12;
  uint64_t v13;
  CNGeminiBadge *geminiBadge;
  uint64_t v15;
  UILabel *geminiLabel;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  UIImageView *chevronView;
  double v23;
  double v24;
  UILayoutGuide *v25;
  UILayoutGuide *layoutGuide;
  UILayoutGuide *v27;
  UILayoutGuide *geminiLabelLayoutGuide;
  CNContactGeminiView *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CNContactGeminiView;
  v3 = -[CNContactGeminiView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    typeLabel = v3->_typeLabel;
    v3->_typeLabel = (UILabel *)v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_typeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v3->_typeLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_typeLabel, "setNumberOfLines:", 1);
    LODWORD(v11) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_typeLabel, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    LODWORD(v12) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_typeLabel, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    -[CNContactGeminiView addSubview:](v3, "addSubview:", v3->_typeLabel);
    +[CNGeminiBadge geminiBadgeWithText:](CNGeminiBadge, "geminiBadgeWithText:", CFSTR("-"));
    v13 = objc_claimAutoreleasedReturnValue();
    geminiBadge = v3->_geminiBadge;
    v3->_geminiBadge = (CNGeminiBadge *)v13;

    -[CNContactGeminiView addSubview:](v3, "addSubview:", v3->_geminiBadge);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    geminiLabel = v3->_geminiLabel;
    v3->_geminiLabel = (UILabel *)v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_geminiLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v3->_geminiLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_geminiLabel, "setNumberOfLines:", 1);
    LODWORD(v17) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_geminiLabel, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    LODWORD(v18) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_geminiLabel, "setContentHuggingPriority:forAxis:", 0, v18);
    LODWORD(v19) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_geminiLabel, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    -[CNContactGeminiView addSubview:](v3, "addSubview:", v3->_geminiLabel);
    objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageForContactCardChevron");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v20);
    chevronView = v3->_chevronView;
    v3->_chevronView = (UIImageView *)v21;

    -[UIImageView setContentMode:](v3->_chevronView, "setContentMode:", 4);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_chevronView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v23) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_chevronView, "setContentCompressionResistancePriority:forAxis:", 0, v23);
    LODWORD(v24) = 1144750080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_chevronView, "setContentHuggingPriority:forAxis:", 0, v24);
    -[CNContactGeminiView addSubview:](v3, "addSubview:", v3->_chevronView);
    v25 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    layoutGuide = v3->_layoutGuide;
    v3->_layoutGuide = v25;

    -[CNContactGeminiView addLayoutGuide:](v3, "addLayoutGuide:", v3->_layoutGuide);
    v27 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    geminiLabelLayoutGuide = v3->_geminiLabelLayoutGuide;
    v3->_geminiLabelLayoutGuide = v27;

    -[CNContactGeminiView addLayoutGuide:](v3, "addLayoutGuide:", v3->_geminiLabelLayoutGuide);
    v29 = v3;

  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v17;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNContactGeminiView;
  -[CNContactGeminiView setHighlighted:](&v17, sel_setHighlighted_);
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlighted:", v3);

  -[CNContactGeminiView chevronView](self, "chevronView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlighted:", v3);

  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
  {
    objc_msgSend(v8, "setAlpha:", 0.5);

    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.5);

    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 0.5);

    -[CNContactGeminiView chevronView](self, "chevronView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0.5;
  }
  else
  {
    objc_msgSend(v8, "setAlpha:", 1.0);

    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 1.0);

    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlpha:", 1.0);

    -[CNContactGeminiView chevronView](self, "chevronView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1.0;
  }
  objc_msgSend(v12, "setAlpha:", v14);

}

- (void)setHighlightedColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedColor, a3);
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_backgroundColor, a3);
  v5 = a3;
  v6 = -[CNContactGeminiView geminiViewChevronImage](self, "geminiViewChevronImage");
  -[CNContactGeminiView geminiBadge](self, "geminiBadge");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_textEncapsulation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[CNContactGeminiView isUsingTwoLineLayout](self, "isUsingTwoLineLayout"))
    -[CNContactGeminiView sizeForTwoLineLayoutFittingSize:](self, "sizeForTwoLineLayoutFittingSize:", width, height);
  else
    -[CNContactGeminiView sizeForSingleLineLayoutFittingSize:](self, "sizeForSingleLineLayoutFittingSize:", width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeForSingleLineLayoutFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  _BOOL4 v24;
  double v25;
  double v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v31 = v7;
  v9 = v8;

  v10 = MEMORY[0x1E0C9D820];
  v11 = *MEMORY[0x1E0C9D820];
  if (-[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge"))
  {
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeThatFits:", width, height);
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v16 = *(double *)(v10 + 8);
    v14 = v11;
  }
  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", width, height);
  v19 = v18;
  v21 = v20;

  if (-[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron"))
  {
    -[CNContactGeminiView chevronView](self, "chevronView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sizeThatFits:", width, height);
    v11 = v23;

  }
  v24 = -[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge");
  v25 = 6.0;
  if (v24)
    v25 = v14 + 6.0 + 6.0;
  v26 = v31 + v19 + v25;
  v27 = -[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron");
  v28 = v11 + 4.0;
  if (!v27)
    v28 = -0.0;
  v29 = v28 + v26;
  if (v9 >= v21)
    v30 = v9;
  else
    v30 = v21;
  if (v16 >= v30)
    v30 = v16;
  if (width < v29)
    v29 = width;
  result.height = v30;
  result.width = v29;
  return result;
}

- (CGSize)sizeForTwoLineLayoutFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v33 = v9;

  v10 = MEMORY[0x1E0C9D820];
  v11 = *MEMORY[0x1E0C9D820];
  if (-[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge"))
  {
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeThatFits:", width, height);
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v16 = *(double *)(v10 + 8);
    v14 = v11;
  }
  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", width, height);
  v19 = v18;
  v21 = v20;

  if (-[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron"))
  {
    -[CNContactGeminiView chevronView](self, "chevronView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sizeThatFits:", width, height);
    v11 = v23;

  }
  v24 = -[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge");
  v25 = v14 + 6.0;
  if (!v24)
    v25 = -0.0;
  v26 = v19 + v25;
  if (v8 >= v26)
    v27 = v8;
  else
    v27 = v26;
  v28 = -[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron");
  v29 = v11 + 4.0;
  if (!v28)
    v29 = -0.0;
  v30 = v29 + v27;
  if (v16 >= v21)
    v31 = v16;
  else
    v31 = v21;
  v32 = v33 + v31 + 5.0;
  if (width < v30)
    v30 = width;
  result.height = v32;
  result.width = v30;
  return result;
}

- (BOOL)shouldDisplayBadge
{
  void *v2;
  void *v3;
  char v4;

  -[CNContactGeminiView geminiResult](self, "geminiResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAvailable");

  return v4;
}

- (void)setAb_textAttributes:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_ab_textAttributes, a3);
  v5 = a3;
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAb_textAttributes:", v5);

  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAb_textAttributes:", v5);

}

- (void)setNeedsCalculateLayout
{
  -[CNContactGeminiView setDidCalculateLayout:](self, "setDidCalculateLayout:", 0);
}

- (void)calculateLayoutIfNeeded
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  _BOOL4 v7;

  if (!-[CNContactGeminiView didCalculateLayout](self, "didCalculateLayout"))
  {
    -[CNContactGeminiView geminiResult](self, "geminiResult");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[CNContactGeminiView bounds](self, "bounds");
      v6 = v5;

      if (v6 > 0.0)
      {
        v7 = -[CNContactGeminiView isUsingTwoLineLayout](self, "isUsingTwoLineLayout");
        -[CNContactGeminiView setIsUsingTwoLineLayout:](self, "setIsUsingTwoLineLayout:", -[CNContactGeminiView doesLayoutRequireTwoLines](self, "doesLayoutRequireTwoLines"));
        -[CNContactGeminiView setDidCalculateLayout:](self, "setDidCalculateLayout:", 1);
        if (v7 != -[CNContactGeminiView isUsingTwoLineLayout](self, "isUsingTwoLineLayout"))
        {
          -[CNContactGeminiView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
          -[CNContactGeminiView updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
        }
      }
    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  -[CNContactGeminiView calculateLayoutIfNeeded](self, "calculateLayoutIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)CNContactGeminiView;
  -[CNContactGeminiView layoutSubviews](&v3, sel_layoutSubviews);
}

- (BOOL)doesLayoutRequireTwoLines
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;

  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView bounds](self, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  v7 = v6;

  -[CNContactGeminiView geminiBadge](self, "geminiBadge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView bounds](self, "bounds");
  objc_msgSend(v8, "sizeThatFits:", v9, v10);
  v12 = v11;

  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView bounds](self, "bounds");
  objc_msgSend(v13, "sizeThatFits:", v14, v15);
  v17 = v16;

  v18 = v7 + 12.0 + v12 + v17;
  if (-[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron"))
  {
    -[CNContactGeminiView chevronView](self, "chevronView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView bounds](self, "bounds");
    objc_msgSend(v19, "sizeThatFits:", v20, v21);
    v18 = v18 + v22 + 4.0;

  }
  -[CNContactGeminiView bounds](self, "bounds");
  return v18 >= v23;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactGeminiView;
  -[CNContactGeminiView updateConstraints](&v6, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView activatedConstraints](self, "activatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  if (-[CNContactGeminiView isUsingTwoLineLayout](self, "isUsingTwoLineLayout"))
    -[CNContactGeminiView twoLineLayoutConstraints](self, "twoLineLayoutConstraints");
  else
    -[CNContactGeminiView singleLineLayoutConstraints](self, "singleLineLayoutConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView setActivatedConstraints:](self, "setActivatedConstraints:", v5);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);

}

- (id)singleLineLayoutConstraints
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
  void *v15;
  void *v16;
  void *v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron"))
    -[CNContactGeminiView chevronView](self, "chevronView");
  else
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView layoutGuide](self, "layoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, v6, 8, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView layoutGuide](self, "layoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 5, 0, v10, 5, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v12 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView layoutGuide](self, "layoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 6, 0, v4, 6, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView layoutGuide](self, "layoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 9, 0, v16, 9, 1.0, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, v19, 8, 1.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, v22, 8, 1.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  v24 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 10, 0, v25, 10, 1.0, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  v27 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 10, 0, v28, 10, 1.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  if (-[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron"))
  {
    v30 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView chevronView](self, "chevronView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 10, 0, v31, 10, 1.0, 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v32);

  }
  if (-[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge"))
  {
    v33 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView typeLabel](self, "typeLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 10, 0, v35, 10, 1.0, 0.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v36);

  }
  v37 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 5, -1, v38, 5, 1.0, 0.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v39);

  LODWORD(v38) = -[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge");
  v40 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v38)
  {
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 6, 0, v42, 5, 1.0, -6.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v43);

    v40 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 6, 0, v44, 5, 1.0, -6.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v45);

  if (-[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron"))
  {
    v46 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView chevronView](self, "chevronView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, 5, 0, v48, 6, 1.0, 4.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v49);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 6, 1, v4, 6, 1.0, 0.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v50);

  return v3;
}

- (id)twoLineLayoutConstraints
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
  void *v15;
  void *v16;
  void *v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView layoutGuide](self, "layoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, v5, 8, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView layoutGuide](self, "layoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 9, 0, v8, 9, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView geminiLabelLayoutGuide](self, "geminiLabelLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 8, 1, v12, 8, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  if (-[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge"))
  {
    v14 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView geminiLabelLayoutGuide](self, "geminiLabelLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 8, 1, v16, 8, 1.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  v18 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView geminiLabelLayoutGuide](self, "geminiLabelLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 9, 0, self, 9, 1.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 3, 0, v22, 3, 1.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  v24 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 3, 0, v26, 4, 1.0, 5.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 4, 0, self, 4, 1.0, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  if (-[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron"))
  {
    v31 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView chevronView](self, "chevronView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 10, 0, v32, 10, 1.0, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v33);

  }
  if (-[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge"))
  {
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 10, 0, v36, 10, 1.0, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v37);

  }
  v38 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView layoutGuide](self, "layoutGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v40 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 5, -1, v40, 5, 1.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v41);

  v42 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 9, 0, v43, 9, 1.0, 0.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v44);

  LOBYTE(v40) = -[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron");
  v45 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView layoutGuide](self, "layoutGuide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v40 & 1) != 0)
    -[CNContactGeminiView chevronView](self, "chevronView");
  else
    -[CNContactGeminiView typeLabel](self, "typeLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v46, 6, 1, v47, 6, 1.0, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v48);

  v49 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 5, -1, v50, 5, 1.0, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v51);

  if (-[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge"))
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
  else
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView layoutGuide](self, "layoutGuide");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 5, -1, v52, 5, 1.0, 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v55);

  if (!-[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron"))
  {
    v56 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView layoutGuide](self, "layoutGuide");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 6, 1, v58, 6, 1.0, 0.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v59);

  }
  v60 = -[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge");
  v61 = (void *)MEMORY[0x1E0CB3718];
  if (v60)
  {
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 5, -1, v62, 5, 1.0, 0.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v63);

    v64 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v65, 6, 0, v66, 5, 1.0, -6.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v67);

    v68 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView geminiLabelLayoutGuide](self, "geminiLabelLayoutGuide");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView geminiBadge](self, "geminiBadge");
  }
  else
  {
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 5, -1, v70, 5, 1.0, 0.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v71);

    v68 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView geminiLabelLayoutGuide](self, "geminiLabelLayoutGuide");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  }
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v69, 5, 0, v72, 5, 1.0, 0.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v73);

  v74 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGeminiView geminiLabelLayoutGuide](self, "geminiLabelLayoutGuide");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v75, 6, 0, v76, 6, 1.0, 0.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v77);

  v78 = -[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron");
  v79 = (void *)MEMORY[0x1E0CB3718];
  if (v78)
  {
    -[CNContactGeminiView chevronView](self, "chevronView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v80, 6, -1, self, 6, 1.0, 0.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v81);

    v82 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView typeLabel](self, "typeLabel");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView chevronView](self, "chevronView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v83, 6, -1, v84, 5, 1.0, -4.0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v85);

    v86 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView chevronView](self, "chevronView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v87, 6, -1, v88, 5, 1.0, -4.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v89);

  }
  else
  {
    -[CNContactGeminiView typeLabel](self, "typeLabel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v90, 6, -1, self, 6, 1.0, 0.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v91);

    v92 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGeminiView geminiLabel](self, "geminiLabel");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v87, 6, -1, self, 6, 1.0, 0.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v88);
  }

  return v3;
}

- (id)localizedChannelUsageFromGeminiResult:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_msgSend(a3, "usage");
  switch(v3)
  {
    case 4:
      CNContactsUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("PREFERRED_LINE_CONTACT_HEADER_UNKNOWN_CONTACT_SIM_LINE");
      break;
    case 2:
      CNContactsUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("PREFERRED_LINE_CONTACT_HEADER_LAST_USED_LABEL");
      break;
    case 1:
      CNContactsUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("PREFERRED_LINE_CONTACT_HEADER_ALWAYS_USE_LABEL");
      break;
    default:
      CNContactsUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("PREFERRED_LINE_CONTACT_HEADER_DEFAULT_LABEL");
      break;
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E20507A8, CFSTR("Localized-GEMINI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedLabelFromGeminiResult:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAvailable");

  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("PREFERRED_LINE_CONTACT_HEADER_VALUE-%@");
  else
    v8 = CFSTR("PREFERRED_LINE_CONTACT_HEADER_VALUE_UNAVAILBLE-%@");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E20507A8, CFSTR("Localized-GEMINI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "channel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localizedLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setGeminiResult:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  CNGeminiResult *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  int v28;
  id v29;

  v29 = a3;
  -[CNContactGeminiView chevronView](self, "chevronView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  -[CNContactGeminiView geminiBadge](self, "geminiBadge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  v9 = self->_geminiResult;
  objc_storeStrong((id *)&self->_geminiResult, a3);
  -[CNContactGeminiView localizedChannelUsageFromGeminiResult:](self, "localizedChannelUsageFromGeminiResult:", v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge"))
  {
    objc_msgSend(v29, "channel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedBadgeLabel");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("-");
  }
  -[CNContactGeminiView localizedLabelFromGeminiResult:](self, "localizedLabelFromGeminiResult:", v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView typeLabel](self, "typeLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v10);

  v15 = -[CNContactGeminiView shouldDisplayBadge](self, "shouldDisplayBadge") ^ 1;
  -[CNContactGeminiView geminiBadge](self, "geminiBadge");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v15);

  -[CNContactGeminiView geminiBadge](self, "geminiBadge");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v12);

  -[CNContactGeminiView geminiLabel](self, "geminiLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v13);

  -[CNContactGeminiView backgroundColor](self, "backgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView geminiBadge](self, "geminiBadge");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v19);

  -[CNContactGeminiView geminiViewChevronImage](self, "geminiViewChevronImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGeminiView chevronView](self, "chevronView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setImage:", v21);

  v23 = -[CNContactGeminiView shouldDisplayChevron](self, "shouldDisplayChevron") ^ 1;
  -[CNContactGeminiView chevronView](self, "chevronView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", v23);

  if (v9 != self->_geminiResult)
  {
    -[CNContactGeminiView setNeedsCalculateLayout](self, "setNeedsCalculateLayout");
    -[CNContactGeminiView bounds](self, "bounds");
    if (v25 > 0.0)
      -[CNContactGeminiView calculateLayoutIfNeeded](self, "calculateLayoutIfNeeded");
  }
  -[CNContactGeminiView chevronView](self, "chevronView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != objc_msgSend(v26, "isHidden"))
  {

LABEL_10:
    -[CNContactGeminiView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    goto LABEL_11;
  }
  -[CNContactGeminiView geminiBadge](self, "geminiBadge");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isHidden");

  if (v8 != v28)
    goto LABEL_10;
LABEL_11:

}

- (id)geminiViewChevronImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNContactGeminiView geminiResult](self, "geminiResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usage");

  v5 = (void *)MEMORY[0x1E0DC3870];
  -[CNContactGeminiView backgroundColor](self, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == 4)
    objc_msgSend(v5, "cnui_symbolImageForUnknownNumberContactCardChevronWithColor:", v6);
  else
    objc_msgSend(v5, "cnui_symbolImageForDynamicallySizedContactCardChevronWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_hasBaseline
{
  void *v2;
  BOOL v3;

  -[CNContactGeminiView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 3;

  return v3;
}

- (BOOL)allowsPickerActions
{
  return self->_allowsPickerActions;
}

- (void)setAllowsPickerActions:(BOOL)a3
{
  self->_allowsPickerActions = a3;
}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (UIColor)highlightedColor
{
  return self->_highlightedColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSDictionary)ab_textAttributes
{
  return self->_ab_textAttributes;
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuide, a3);
}

- (UILayoutGuide)geminiLabelLayoutGuide
{
  return self->_geminiLabelLayoutGuide;
}

- (void)setGeminiLabelLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_geminiLabelLayoutGuide, a3);
}

- (CNGeminiBadge)geminiBadge
{
  return self->_geminiBadge;
}

- (void)setGeminiBadge:(id)a3
{
  objc_storeStrong((id *)&self->_geminiBadge, a3);
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_typeLabel, a3);
}

- (UILabel)geminiLabel
{
  return self->_geminiLabel;
}

- (void)setGeminiLabel:(id)a3
{
  objc_storeStrong((id *)&self->_geminiLabel, a3);
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setActivatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConstraints, a3);
}

- (BOOL)didCalculateLayout
{
  return self->_didCalculateLayout;
}

- (void)setDidCalculateLayout:(BOOL)a3
{
  self->_didCalculateLayout = a3;
}

- (BOOL)isUsingTwoLineLayout
{
  return self->_isUsingTwoLineLayout;
}

- (void)setIsUsingTwoLineLayout:(BOOL)a3
{
  self->_isUsingTwoLineLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_geminiLabel, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_geminiBadge, 0);
  objc_storeStrong((id *)&self->_geminiLabelLayoutGuide, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_ab_textAttributes, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_geminiResult, 0);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end
