@implementation CNContactHeaderCollapsedView

uint64_t __83__CNContactHeaderCollapsedView_assignImageColorsToAvatarBackgroundView_horizontal___block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

- (double)height
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  v5 = 0.0;
  if (v3)
  {
    -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v5 = v7;

  }
  -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "headerBottomMargin");
    v4 = v10;

  }
  v15.receiver = self;
  v15.super_class = (Class)CNContactHeaderCollapsedView;
  -[CNContactHeaderView minHeight](&v15, sel_minHeight);
  v12 = v11;
  -[CNContactHeaderCollapsedView labelsHeight](self, "labelsHeight");
  return v4 + v5 + v12 + v13;
}

- (CNContactActionsContainerView)actionsWrapperView
{
  return self->_actionsWrapperView;
}

- (double)labelsHeight
{
  return self->_labelsHeight;
}

- (void)calculateLabelSizesIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderCollapsedView;
  -[CNContactHeaderView calculateLabelSizesIfNeeded](&v3, sel_calculateLabelSizesIfNeeded);
  -[CNContactHeaderCollapsedView calculateLabelSizes](self, "calculateLabelSizes");
}

- (void)calculateLabelSizes
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  id v21;

  if (-[CNContactHeaderView needsLabelSizeCalculation](self, "needsLabelSizeCalculation"))
  {
    -[CNContactHeaderCollapsedView frame](self, "frame");
    v4 = v3;
    if (v3 == 0.0)
    {
      -[CNContactHeaderCollapsedView superview](self, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[CNContactHeaderCollapsedView superview](self, "superview");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "frame");
        v4 = v7;

      }
    }
    if (v4 != 0.0)
    {
      -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 0);
      -[CNContactHeaderCollapsedView layoutMargins](self, "layoutMargins");
      v9 = v8;
      -[CNContactHeaderCollapsedView layoutMargins](self, "layoutMargins");
      v11 = v4 - (v9 + v10);
      -[CNContactHeaderCollapsedView updateFontSizes](self, "updateFontSizes");
      -[CNContactHeaderView nameLabel](self, "nameLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sizeThatFits:", v11, 1000.0);
      v14 = v13;

      -[CNContactHeaderCollapsedView _screen](self, "_screen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      if (v16 == 0.0)
      {
        if (RoundToScale_onceToken != -1)
          dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
        v16 = *(double *)&RoundToScale___s;
      }
      v17 = v16 == 1.0;
      v18 = round(v16 * v14) / v16;
      v19 = round(v14);
      if (v17)
        v20 = v19;
      else
        v20 = v18;

      -[CNContactHeaderCollapsedView setLabelsHeight:](self, "setLabelsHeight:", v20);
      -[CNContactHeaderView delegate](self, "delegate");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "headerViewDidUpdateLabelSizes");

    }
  }
}

- (void)updateSizeDependentAttributes
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[CNContactHeaderCollapsedView bounds](self, "bounds");
  if (v3 > 0.0)
  {
    v4 = 0.0;
    if (-[CNContactHeaderView shouldShowBelowNavigationTitle](self, "shouldShowBelowNavigationTitle"))
    {
      -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "minNavbarTitleOffset");
      v4 = v6;

    }
    -[CNContactHeaderView safeAreaPhotoOffset](self, "safeAreaPhotoOffset");
    v8 = v4 + v7;
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoMinTopMargin");
    v10 = v8 + v9;
    -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", v10);

  }
}

- (void)setLabelsHeight:(double)a3
{
  self->_labelsHeight = a3;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void)setAlternateName:(id)a3
{
  objc_storeStrong((id *)&self->_alternateName, a3);
}

- (void)setActionsWrapperView:(id)a3
{
  CNContactActionsContainerView *v5;

  v5 = (CNContactActionsContainerView *)a3;
  if (self->_actionsWrapperView != v5)
  {
    objc_storeStrong((id *)&self->_actionsWrapperView, a3);
    -[CNContactHeaderCollapsedView addSubview:](self, "addSubview:", v5);
    -[CNContactHeaderCollapsedView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setUpNameLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNContactHeaderView setNameLabel:](self, "setNameLabel:", v4);

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 2);

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cnui_applyContactStyle");

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderCollapsedView addSubview:](self, "addSubview:", v9);

}

- (void)updateConstraints
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
  id v16;
  void (**v17)(void *, void *);
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
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *);
  void *v48;
  id v49;
  CNContactHeaderCollapsedView *v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)CNContactHeaderCollapsedView;
  -[CNContactHeaderView updateConstraints](&v51, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CNContactHeaderView activatedConstraints](self, "activatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderView photoView](self, "photoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderCollapsedView centerXAnchor](self, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView photoView](self, "photoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoMinBottomMargin");
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15);

  v45 = MEMORY[0x1E0C809B0];
  v46 = 3221225472;
  v47 = __49__CNContactHeaderCollapsedView_updateConstraints__block_invoke;
  v48 = &unk_1E2049068;
  v16 = v5;
  v49 = v16;
  v50 = self;
  v17 = (void (**)(void *, void *))_Block_copy(&v45);
  -[CNContactHeaderView nameLabel](self, "nameLabel", v45, v46, v47, v48);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2](v17, v18);

  -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CNContactHeaderCollapsedView leadingAnchor](self, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v23);

    -[CNContactHeaderCollapsedView trailingAnchor](self, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v27);

    -[CNContactHeaderCollapsedView bottomAnchor](self, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v31);

    -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v36);

    -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 1148846080;
    objc_msgSend(v37, "setContentHuggingPriority:forAxis:", 1, v38);

    -[CNContactHeaderCollapsedView actionsWrapperView](self, "actionsWrapperView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = 1148846080;
    objc_msgSend(v39, "setContentCompressionResistancePriority:forAxis:", 1, v40);
  }
  else
  {
    -[CNContactHeaderCollapsedView bottomAnchor](self, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "headerBottomMargin");
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v44);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
  -[CNContactHeaderView setActivatedConstraints:](self, "setActivatedConstraints:", v16);

}

void __49__CNContactHeaderCollapsedView_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(v4, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = 1148829696;
  objc_msgSend(v18, "setPriority:", v11);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
  objc_msgSend(v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "layoutMarginsGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v16) = 1148829696;
  objc_msgSend(v15, "setPriority:", v16);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
  LODWORD(v17) = 1148846080;
  objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v17);

}

+ (id)collapsedContactHeaderViewWithContact:(id)a3 showingNavBar:(BOOL)a4 monogramOnly:(BOOL)a5 delegate:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v17;
  uint64_t v18;
  void *v19;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  objc_msgSend((id)sCollapsedContactHeaderView, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

LABEL_4:
    v13 = objc_alloc((Class)a1);
    v14 = (id)objc_msgSend(v13, "initWithContact:frame:showingNavBar:monogramOnly:delegate:", v10, v8, v7, v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    goto LABEL_5;
  }
  if (objc_msgSend((id)sCollapsedContactHeaderView, "showMonogramsOnly") != v7)
    goto LABEL_4;
  if (sCollapsedContactHeaderView)
  {
    v15 = (id)sCollapsedContactHeaderView;
    objc_msgSend(v15, "setDelegate:", v11);
    objc_msgSend(v15, "prepareForReuse");
    objc_msgSend(v15, "updateForShowingNavBar:", v8);
    objc_msgSend(v15, "updateWithNewContact:", v10);
    goto LABEL_6;
  }
  v17 = objc_alloc((Class)a1);
  v18 = objc_msgSend(v17, "initWithContact:frame:showingNavBar:monogramOnly:delegate:", v10, v8, v7, v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v19 = (void *)sCollapsedContactHeaderView;
  sCollapsedContactHeaderView = v18;

  v14 = (id)sCollapsedContactHeaderView;
LABEL_5:
  v15 = v14;
LABEL_6:

  return v15;
}

- (CNContactHeaderCollapsedView)initWithContact:(id)a3 frame:(CGRect)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7
{
  CNContactHeaderCollapsedView *v7;
  CNContactHeaderCollapsedView *v8;
  CNContactHeaderCollapsedView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNContactHeaderCollapsedView;
  v7 = -[CNContactHeaderView initWithContact:frame:shouldAllowTakePhotoAction:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](&v11, sel_initWithContact_frame_shouldAllowTakePhotoAction_shouldAllowImageDrops_showingNavBar_monogramOnly_delegate_, a3, 0, 0, a5, a6, a7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v8 = v7;
  if (v7)
  {
    -[CNContactHeaderCollapsedView setUpNameLabel](v7, "setUpNameLabel");
    -[CNContactHeaderCollapsedView updateFontSizes](v8, "updateFontSizes");
    -[CNContactHeaderCollapsedView setupBackgroundGradientLayer](v8, "setupBackgroundGradientLayer");
    -[CNContactHeaderCollapsedView setDefaultLabelColors](v8, "setDefaultLabelColors");
    v9 = v8;
  }

  return v8;
}

- (void)updateFontSizes
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sCurrentNameFont;
  sCurrentNameFont = v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)sCurrentTaglineFont;
  sCurrentTaglineFont = v5;

  v13 = *MEMORY[0x1E0DC1138];
  v7 = (void *)sCurrentNameFont;
  objc_msgSend((id)sCurrentNameFont, "_scaledValueForValue:", 16.0);
  objc_msgSend(v7, "fontWithSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v9);

  LODWORD(v8) = -[CNContactHeaderView isAXSize](self, "isAXSize");
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", v8 ^ 1);

  if ((_DWORD)v8)
    v11 = 0.0;
  else
    v11 = 0.7;
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMinimumScaleFactor:", v11);

}

- (void)setupBackgroundGradientLayer
{
  id v3;
  UIView *v4;
  UIView *gradientLayerContainerView;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  gradientLayerContainerView = self->_gradientLayerContainerView;
  self->_gradientLayerContainerView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_gradientLayerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNContactHeaderCollapsedView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_gradientLayerContainerView, 0);
  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_gradientLayerContainerView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", v8);

  -[CNContactHeaderCollapsedView setBackgroundGradientLayer:](self, "setBackgroundGradientLayer:", v8);
  -[CNContactHeaderView backgroundGradientDefaultGrayColors](self, "backgroundGradientDefaultGrayColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderCollapsedView assignImageColorsToAvatarBackgroundView:horizontal:](self, "assignImageColorsToAvatarBackgroundView:horizontal:", v7, 0);
  -[CNContactHeaderCollapsedView updateLabelColorsForImageColors:](self, "updateLabelColorsForImageColors:", v7);

}

- (void)updateBackgroundWithGradientColors:(id)a3 horizontal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CNContactHeaderCollapsedView assignImageColorsToAvatarBackgroundView:horizontal:](self, "assignImageColorsToAvatarBackgroundView:horizontal:", v6, v4);
  -[CNContactHeaderCollapsedView updateLabelColorsForImageColors:](self, "updateLabelColorsForImageColors:", v6);

}

- (void)setDefaultLabelColors
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor](CNUIColorRepository, "contactCardStaticAvatarHeaderDefaultTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC1140];
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v4);

}

- (void)updateLabelColorsForImageColors:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (+[CNImageDerivedColorBackgroundUtilities backgroundColorsPreferWhiteForegroundText:](CNImageDerivedColorBackgroundUtilities, "backgroundColorsPreferWhiteForegroundText:", a3))
  {
    +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor](CNUIColorRepository, "contactCardStaticAvatarHeaderDefaultTextColor");
  }
  else
  {
    +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultDarkTextColor](CNUIColorRepository, "contactCardStaticAvatarHeaderDefaultDarkTextColor");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1140];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v5);

  -[CNContactHeaderView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNContactHeaderView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "headerView:didSetNameLabelColor:", self, v4);

  }
}

- (void)setBackgroundGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundGradientLayer, a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNContactHeaderCollapsedView;
  -[CNContactHeaderView layoutSubviews](&v12, sel_layoutSubviews);
  -[CNContactHeaderCollapsedView calculateLabelSizes](self, "calculateLabelSizes");
  -[CNContactHeaderCollapsedView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CNContactHeaderCollapsedView backgroundGradientLayer](self, "backgroundGradientLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)assignImageColorsToAvatarBackgroundView:(id)a3 horizontal:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;

  v4 = a4;
  v25 = a3;
  if (objc_msgSend(v25, "count") == 1)
  {
    objc_msgSend(v25, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderCollapsedView setBackgroundColor:](self, "setBackgroundColor:", v6);

    -[CNContactHeaderCollapsedView backgroundGradientLayer](self, "backgroundGradientLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColors:", 0);
  }
  else
  {
    -[CNContactHeaderCollapsedView setBackgroundColor:](self, "setBackgroundColor:", 0);
    -[CNContactHeaderCollapsedView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[CNContactHeaderCollapsedView backgroundGradientLayer](self, "backgroundGradientLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    objc_msgSend(v25, "_cn_map:", &__block_literal_global_758);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_cn_reversed");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderCollapsedView backgroundGradientLayer](self, "backgroundGradientLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColors:", v18);

    -[CNContactHeaderCollapsedView backgroundGradientLayer](self, "backgroundGradientLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v4)
    {
      objc_msgSend(v20, "setStartPoint:", 0.0, 0.5);

      -[CNContactHeaderCollapsedView backgroundGradientLayer](self, "backgroundGradientLayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v22;
      v23 = 1.0;
      v24 = 0.5;
    }
    else
    {
      objc_msgSend(v20, "setStartPoint:", 0.5, 0.0);

      -[CNContactHeaderCollapsedView backgroundGradientLayer](self, "backgroundGradientLayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v22;
      v23 = 0.5;
      v24 = 1.0;
    }
    objc_msgSend(v22, "setEndPoint:", v23, v24);
  }

}

- (CAGradientLayer)backgroundGradientLayer
{
  return self->_backgroundGradientLayer;
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  if (a3)
    +[CNContactHeaderViewSizeAttributes staticCollapsedDisplayAttributesWithNavBar](CNContactHeaderViewSizeAttributes, "staticCollapsedDisplayAttributesWithNavBar");
  else
    +[CNContactHeaderViewSizeAttributes staticCollapsedDisplayAttributes](CNContactHeaderViewSizeAttributes, "staticCollapsedDisplayAttributes");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNContactHeaderCollapsedView;
  -[CNContactHeaderView reloadDataPreservingChanges:](&v9, sel_reloadDataPreservingChanges_, a3);
  -[CNContactHeaderView contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderCollapsedView _headerStringForContacts:](self, "_headerStringForContacts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[CNContactHeaderCollapsedView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAb_text:", v5);

  -[CNContactHeaderCollapsedView _updatePhotoView](self, "_updatePhotoView");
  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
  -[CNContactHeaderCollapsedView calculateLabelSizes](self, "calculateLabelSizes");
  -[CNContactHeaderCollapsedView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setNameTextAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactHeaderCollapsedView;
  v4 = a3;
  -[CNContactHeaderView setNameTextAttributes:](&v6, sel_setNameTextAttributes_, v4);
  -[CNContactHeaderView nameLabel](self, "nameLabel", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAb_textAttributes:", v4);

}

- (void)_updatePhotoView
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[CNContactHeaderView photoView](self, "photoView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "isHidden");
  -[CNContactHeaderView contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    objc_msgSend(v8, "setHidden:", 0);
  }
  else
  {
    -[CNContactHeaderView contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "imageDataAvailable") & 1) != 0)
      v7 = 0;
    else
      v7 = -[CNContactHeaderView alwaysShowsMonogram](self, "alwaysShowsMonogram") ^ 1;
    objc_msgSend(v8, "setHidden:", v7);

  }
  if (v3 != objc_msgSend(v8, "isHidden"))
    -[CNContactHeaderCollapsedView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (id)_headerStringForContacts:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    if (-[CNContactHeaderCollapsedView usesBrandedCallFormat](self, "usesBrandedCallFormat"))
    {
      v5 = *MEMORY[0x1E0D137F8];
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "phoneNumbers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);

      if ((v5 & 1) == 0)
      {
        objc_msgSend(v4, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "phoneNumbers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "formattedStringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
        {
          v13 = v12;

          goto LABEL_12;
        }

      }
    }
    -[CNContactHeaderCollapsedView contactFormatter](self, "contactFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromContact:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  if (!objc_msgSend(v14, "length"))
  {
    -[CNContactHeaderCollapsedView alternateName](self, "alternateName");
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }
  v13 = v14;
LABEL_12:

  return v13;
}

- (BOOL)usesBrandedCallFormat
{
  return self->_usesBrandedCallFormat;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNContactPhotoView *v13;
  CNContactPhotoView *v14;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inProcessContactStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
    objc_msgSend(v10, "cachingMonogramRenderer");
  else
    objc_msgSend(v10, "cachingLikenessRenderer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [CNContactPhotoView alloc];
  v14 = -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:](v13, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:", v7, 1, v9, v6, v12, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v14;
}

- (void)showLabelAndAvatar:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  BOOL v12;

  v4 = a4;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CNContactHeaderCollapsedView_showLabelAndAvatar_animated___block_invoke;
  aBlock[3] = &unk_1E204C4D0;
  v12 = a3;
  aBlock[4] = self;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  v7 = v6;
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __60__CNContactHeaderCollapsedView_showLabelAndAvatar_animated___block_invoke_2;
    v9[3] = &unk_1E204FB40;
    v10 = v6;
    objc_msgSend(v8, "animateWithDuration:animations:", v9, 0.3);

  }
  else
  {
    v6[2](v6);
  }

}

void __60__CNContactHeaderCollapsedView_showLabelAndAvatar_animated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "photoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "nameLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v2);

}

- (void)updateBackgroundWithPosterSnapshotImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGImage *v9;
  CGFloat Width;
  CGFloat v11;
  CGImage *v12;
  CGContext *MmappedBitmapContext;
  void *v14;
  void *Data;
  size_t BytesPerRow;
  size_t v17;
  NSObject *v18;
  dispatch_data_t v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  CGRect v23;
  CGRect v24;

  v4 = a3;
  -[CNContactHeaderView contacts](self, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactPoster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v9 = (CGImage *)objc_msgSend(v4, "cnui_CGImageSnapshot");
    Width = (double)CGImageGetWidth(v9);
    v11 = (double)CGImageGetHeight(v9) * 0.5;
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = Width;
    v23.size.height = v11;
    v12 = CGImageCreateWithImageInRect(v9, v23);
    CGImageGetBitsPerComponent(v9);
    MmappedBitmapContext = (CGContext *)CNImageUtilsCreateMmappedBitmapContext();
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = Width;
    v24.size.height = v11;
    CGContextDrawImage(MmappedBitmapContext, v24, v12);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97328]), "initWithBitmapContext:", MmappedBitmapContext);
    Data = CGBitmapContextGetData(MmappedBitmapContext);
    BytesPerRow = CGBitmapContextGetBytesPerRow(MmappedBitmapContext);
    v17 = CGBitmapContextGetHeight(MmappedBitmapContext) * BytesPerRow;
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_data_create(Data, v17, v18, (dispatch_block_t)*MEMORY[0x1E0C80CE8]);

    -[CNContactHeaderView contacts](self, "contacts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__CNContactHeaderCollapsedView_updateBackgroundWithPosterSnapshotImage___block_invoke;
    v22[3] = &unk_1E204BDA8;
    v22[4] = self;
    -[CNContactHeaderView fetchColorsForContactImageData:bitmapFormat:isPoster:forContact:cacheResult:withCompletionHandler:](self, "fetchColorsForContactImageData:bitmapFormat:isPoster:forContact:cacheResult:withCompletionHandler:", v19, v14, 1, v21, 1, v22);
    if (MmappedBitmapContext)
      CFRelease(MmappedBitmapContext);
    CGImageRelease(v12);

  }
  else
  {
    -[CNContactHeaderCollapsedView assignImageColorsToAvatarBackgroundView:horizontal:](self, "assignImageColorsToAvatarBackgroundView:horizontal:", v8, 0);
    -[CNContactHeaderCollapsedView updateLabelColorsForImageColors:](self, "updateLabelColorsForImageColors:", v8);
  }

}

- (void)didFinishUsing
{
  if ((CNContactHeaderCollapsedView *)sCollapsedContactHeaderView == self)
  {
    sCollapsedContactHeaderView = 0;

  }
}

- (void)setAvatarStyle:(unint64_t)a3
{
  void *v4;
  id v5;

  -[CNContactHeaderView photoView](self, "photoView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", a3);

}

- (unint64_t)avatarStyle
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CNContactHeaderView photoView](self, "photoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  return v4;
}

- (void)disablePhotoTapGesture
{
  id v2;

  -[CNContactHeaderView photoView](self, "photoView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disablePhotoTapGesture");

}

- (void)copy:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNContactHeaderView nameLabel](self, "nameLabel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v6);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setUsesBrandedCallFormat:(BOOL)a3
{
  self->_usesBrandedCallFormat = a3;
}

- (UIView)gradientLayerContainerView
{
  return self->_gradientLayerContainerView;
}

- (void)setGradientLayerContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayerContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundGradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayerContainerView, 0);
  objc_storeStrong((id *)&self->_actionsWrapperView, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
}

uint64_t __60__CNContactHeaderCollapsedView_showLabelAndAvatar_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__CNContactHeaderCollapsedView_updateBackgroundWithPosterSnapshotImage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = v3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    CNUILogContactCard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_18AC56000, v5, OS_LOG_TYPE_ERROR, "No background colors returned for collapsed header view", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "backgroundGradientDefaultGrayColors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "assignImageColorsToAvatarBackgroundView:horizontal:", v3, 0);
  objc_msgSend(*(id *)(a1 + 32), "updateLabelColorsForImageColors:", v3);

}

@end
