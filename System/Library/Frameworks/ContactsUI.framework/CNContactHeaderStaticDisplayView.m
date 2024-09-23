@implementation CNContactHeaderStaticDisplayView

- (BOOL)shouldShowPoster
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;

  if (-[CNContactHeaderView showMonogramsOnly](self, "showMonogramsOnly"))
    goto LABEL_6;
  if (-[CNContactHeaderView isPad](self, "isPad"))
    goto LABEL_6;
  -[CNContactHeaderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOrientationPhoneLandscape");

  if ((v4 & 1) != 0
    || (-[CNContactHeaderView contacts](self, "contacts"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 != 1))
  {
LABEL_6:
    LOBYTE(v12) = 0;
  }
  else
  {
    -[CNContactHeaderView contacts](self, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *MEMORY[0x1E0D13818];
    objc_msgSend(v8, "wallpaper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "posterArchiveData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v11) ^ 1;

  }
  return v12;
}

- (void)updateFontSizes
{
  _BOOL4 v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = -[CNContactHeaderView isAXSize](self, "isAXSize");
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", !v3);

  if (v3)
    v5 = 0.0;
  else
    v5 = 0.7;
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinimumScaleFactor:", v5);

  -[CNContactHeaderStaticDisplayView nameFont](self, "nameFont");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)sCurrentNameFont;
  sCurrentNameFont = v7;

  -[CNContactHeaderStaticDisplayView nameFontSize](self, "nameFontSize");
  v9 = (void *)sCurrentNameFont;
  objc_msgSend((id)sCurrentNameFont, "_scaledValueForValue:");
  objc_msgSend(v9, "fontWithSize:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0DC1138];
  v11 = v26;
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v12);

  +[CNUIFontRepository contactCardStaticHeaderDefaultTaglineFont](CNUIFontRepository, "contactCardStaticHeaderDefaultTaglineFont");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)sCurrentTaglineFont;
  sCurrentTaglineFont = v13;

  v24 = v11;
  v25 = sCurrentTaglineFont;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("importantTextAttributes"), v15);

  v22 = v11;
  v23 = sCurrentTaglineFont;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("downtimeTextAttributes"), v16);

  v20 = v11;
  v21 = sCurrentTaglineFont;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("geminiTextAttributes"), v17);

  -[CNContactHeaderStaticDisplayView geminiIconProvider](self, "geminiIconProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateGeminiIcons");

  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNeedsCalculateLayout");

}

- (id)nameFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[CNUIFontRepository contactCardStaticHeaderDefaultNameFont](CNUIFontRepository, "contactCardStaticHeaderDefaultNameFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "fontDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v3;
  }

  return v10;
}

- (double)nameFontSize
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AE8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3 + 6.0;

  return v4;
}

- (CNContactGeminiIconProvider)geminiIconProvider
{
  return self->_geminiIconProvider;
}

- (void)setMessage:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_message != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_message, a3);
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
    v5 = v6;
  }

}

- (void)setImportantMessage:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_importantMessage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_importantMessage, a3);
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
    v5 = v6;
  }

}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void)setAlternateName:(id)a3
{
  objc_storeStrong((id *)&self->_alternateName, a3);
}

- (void)setAllowsPickerActions:(BOOL)a3
{
  self->_allowsPickerActions = a3;
}

- (void)setActionsWrapperView:(id)a3
{
  CNContactActionsContainerView *v5;

  v5 = (CNContactActionsContainerView *)a3;
  if (self->_actionsWrapperView != v5)
  {
    objc_storeStrong((id *)&self->_actionsWrapperView, a3);
    -[CNContactHeaderStaticDisplayView addSubview:](self, "addSubview:", v5);
    -[CNContactHeaderStaticDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

+ (id)contactHeaderViewWithContact:(id)a3 showingNavBar:(BOOL)a4 monogramOnly:(BOOL)a5 delegate:(id)a6
{
  return (id)objc_msgSend(a1, "contactHeaderViewWithContact:allowsPhotoDrops:showingNavBar:monogramOnly:delegate:", a3, 1, a4, a5, a6);
}

- (double)bottomMargin
{
  void *v2;
  double v3;
  double v4;

  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerBottomMargin");
  v4 = v3;

  return v4;
}

- (double)height
{
  double v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  double v20;
  double v21;

  -[CNContactHeaderStaticDisplayView labelsHeight](self, "labelsHeight");
  if (v3 == 0.0)
    -[CNContactHeaderStaticDisplayView calculateLabelSizesIfNeeded](self, "calculateLabelSizesIfNeeded");
  v4 = -[CNContactHeaderView isAXSize](self, "isAXSize");
  -[CNContactHeaderStaticDisplayView staticHeaderPhotoMinTopMargin](self, "staticHeaderPhotoMinTopMargin");
  v6 = v5;
  -[CNContactHeaderStaticDisplayView staticHeaderPhotoMinHeight](self, "staticHeaderPhotoMinHeight");
  v8 = v7;
  -[CNContactHeaderStaticDisplayView staticHeaderPhotoMinBottomMargin](self, "staticHeaderPhotoMinBottomMargin");
  v10 = v9;
  -[CNContactHeaderStaticDisplayView labelsHeight](self, "labelsHeight");
  v12 = v11;
  -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;

  -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = v4;
  else
    v17 = 1;
  if (v17)
    v18 = 0.0;
  else
    v18 = v15;

  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "headerBottomMargin");
  v21 = v20;

  return v6 + v8 + v10 + v12 + v18 + v21;
}

- (double)labelsHeight
{
  return self->_labelsHeight;
}

- (double)staticHeaderPhotoMinTopMargin
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  if (-[CNContactHeaderView isPadRegularHorizontalSize](self, "isPadRegularHorizontalSize"))
  {
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoMinTopMargin");
    v5 = v4;
    goto LABEL_9;
  }
  if (-[CNContactHeaderView isPadCompactHorizontalSize](self, "isPadCompactHorizontalSize"))
  {
    -[CNContactHeaderStaticDisplayView staticHeaderPhotoTopMarginOffset](self, "staticHeaderPhotoTopMarginOffset");
    v7 = v6;
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoMinTopMarginPadCompact");
  }
  else
  {
    if (-[CNContactHeaderView isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
    {
      -[CNContactHeaderStaticDisplayView superview](self, "superview");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "frame");
      v5 = v9 * 0.1;
      goto LABEL_9;
    }
    -[CNContactHeaderStaticDisplayView staticHeaderPhotoTopMarginOffset](self, "staticHeaderPhotoTopMarginOffset");
    v7 = v10;
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoMinTopMargin");
  }
  v5 = v7 + v8;
LABEL_9:

  result = 0.0;
  if (((*(_QWORD *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF)
    return v5;
  return result;
}

- (double)staticHeaderPhotoTopMarginOffset
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[CNContactHeaderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBarHeight");
  v5 = v4;

  -[CNContactHeaderView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerViewSafeAreaInsets");
  v8 = v7;

  return v5 + v8;
}

- (double)staticHeaderPhotoMinBottomMargin
{
  void *v3;
  double v4;
  BOOL v5;
  void *v6;
  double v7;

  if (-[CNContactHeaderView isPadCompactHorizontalSize](self, "isPadCompactHorizontalSize"))
  {
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoMinBottomMarginPadCompact");
  }
  else if (-[CNContactHeaderView isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
  {
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoMinBottomMarginPhoneLandscape");
  }
  else
  {
    v5 = -[CNContactHeaderStaticDisplayView shouldUseFixedHeight](self, "shouldUseFixedHeight");
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6;
    if (v5)
      objc_msgSend(v6, "photoMinBottomMarginLowQuality");
    else
      objc_msgSend(v6, "photoMinBottomMargin");
  }
  v7 = v4;

  return v7;
}

- (double)staticHeaderPhotoMinHeight
{
  double v3;
  double v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  if (-[CNContactHeaderView isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
  {
    -[CNContactHeaderStaticDisplayView avatarHeightPhoneLandscape](self, "avatarHeightPhoneLandscape");
    v4 = v3;
  }
  else
  {
    v5 = -[CNContactHeaderView isPadCompactHorizontalSize](self, "isPadCompactHorizontalSize");
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "photoMaxHeightPadCompact");
    else
      objc_msgSend(v6, "photoMinHeight");
    v4 = v8;

  }
  if (-[CNContactHeaderView isPhotoLowQuality](self, "isPhotoLowQuality"))
  {
    if (!-[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster"))
    {
      -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "photoMaxHeightLowQuality");
      v11 = v10;

      if (v4 >= v11)
        return v11;
    }
  }
  return v4;
}

- (BOOL)shouldUseFixedHeight
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int v6;

  if (-[CNContactHeaderView isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
    return 1;
  if (-[CNContactHeaderView isPadCompactHorizontalSize](self, "isPadCompactHorizontalSize"))
    return 1;
  v3 = -[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster");
  if (-[CNContactHeaderView isPhotoLowQuality](self, "isPhotoLowQuality"))
  {
    if (!v3)
      return 1;
  }
  if (-[CNContactHeaderView isAXSize](self, "isAXSize") && !v3)
    return 1;
  -[CNContactHeaderView contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "imageDataAvailable") | v3;

  return v6 ^ 1;
}

- (void)calculateLabelSizesIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderStaticDisplayView;
  -[CNContactHeaderView calculateLabelSizesIfNeeded](&v3, sel_calculateLabelSizesIfNeeded);
  -[CNContactHeaderStaticDisplayView calculateLabelSizes](self, "calculateLabelSizes");
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
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  id v38;

  if (-[CNContactHeaderView needsLabelSizeCalculation](self, "needsLabelSizeCalculation"))
  {
    -[CNContactHeaderStaticDisplayView frame](self, "frame");
    v4 = v3;
    if (v3 == 0.0)
    {
      -[CNContactHeaderStaticDisplayView superview](self, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[CNContactHeaderStaticDisplayView superview](self, "superview");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "frame");
        v4 = v7;

      }
    }
    if (v4 != 0.0)
    {
      -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 0);
      -[CNContactHeaderStaticDisplayView layoutMargins](self, "layoutMargins");
      v9 = v8;
      -[CNContactHeaderStaticDisplayView layoutMargins](self, "layoutMargins");
      v11 = v4 - (v9 + v10);
      -[CNContactHeaderStaticDisplayView updateFontSizes](self, "updateFontSizes");
      -[CNContactHeaderView nameLabel](self, "nameLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sizeThatFits:", v11, 1000.0);
      v14 = v13;

      -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sizeThatFits:", v11, 1000.0);
      v17 = v16;

      -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sizeThatFits:", v11, 1000.0);
      v20 = v19;

      -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isHidden");
      v23 = MEMORY[0x1E0C9D820];
      if (v22)
      {
        v24 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      else
      {
        -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sizeThatFits:", v11, 1000.0);
        v24 = v26;

      }
      -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "calculateLayoutIfNeeded");

      if (-[CNContactHeaderStaticDisplayView shouldShowGemini](self, "shouldShowGemini"))
      {
        -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sizeThatFits:", v11, 1000.0);
        v30 = v29;

      }
      else
      {
        v30 = *(double *)(v23 + 8);
      }
      v31 = v14 + v17 + v20 + v24 + v30;
      -[CNContactHeaderStaticDisplayView _screen](self, "_screen");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "scale");
      if (v33 == 0.0)
      {
        if (RoundToScale_onceToken != -1)
          dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
        v33 = *(double *)&RoundToScale___s;
      }
      v34 = v33 == 1.0;
      v35 = round(v33 * v31) / v33;
      v36 = round(v31);
      if (v34)
        v37 = v36;
      else
        v37 = v35;

      -[CNContactHeaderStaticDisplayView setLabelsHeight:](self, "setLabelsHeight:", v37);
      -[CNContactHeaderView delegate](self, "delegate");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "headerViewDidUpdateLabelSizes");

    }
  }
}

- (CNContactDowntimeView)downtimeView
{
  return self->_downtimeView;
}

- (void)updateSizeDependentAttributes
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isMenuVisible"))
    objc_msgSend(v2, "hideMenu");

}

- (void)setLabelsHeight:(double)a3
{
  self->_labelsHeight = a3;
}

- (void)setImportantTextAttributes:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_importantTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_importantTextAttributes, a3);
    -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAb_textAttributes:", v6);

  }
}

- (void)updateConstraints
{
  _BOOL4 v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
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
  void *v78;
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
  double v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  uint64_t v111;
  id v112;
  void (**v113)(void *, void *);
  void *v114;
  void *v115;
  void *v116;
  double v117;
  void *v118;
  double v119;
  void *v120;
  double v121;
  void *v122;
  double v123;
  void *v124;
  void *v125;
  int v126;
  void *v127;
  void *v128;
  int v129;
  _BOOL4 v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  double v150;
  void *v151;
  double v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  double v179;
  void *v180;
  void *v181;
  _BOOL4 v182;
  _QWORD v183[5];
  id v184;
  _QWORD aBlock[5];
  id v186;
  objc_super v187;
  uint64_t v188;
  _QWORD v189[3];

  v189[1] = *MEMORY[0x1E0C80C00];
  v187.receiver = self;
  v187.super_class = (Class)CNContactHeaderStaticDisplayView;
  -[CNContactHeaderView updateConstraints](&v187, sel_updateConstraints);
  v3 = -[CNContactHeaderView isAXSize](self, "isAXSize");
  -[CNContactHeaderStaticDisplayView bottomMargin](self, "bottomMargin");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[CNContactHeaderView activatedConstraints](self, "activatedConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactHeaderView photoHeightConstraint](self, "photoHeightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v189[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deactivateConstraints:", v11);

  -[CNContactHeaderView photoHeightConstraint](self, "photoHeightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
  v14 = objc_claimAutoreleasedReturnValue();
  v188 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v188, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deactivateConstraints:", v15);

  -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v16);

  -[CNContactHeaderView posterView](self, "posterView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v17, "isHidden");

  if ((v14 & 1) == 0)
  {
    -[CNContactHeaderView posterView](self, "posterView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView topAnchor](self, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v21);

    -[CNContactHeaderView posterView](self, "posterView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView leadingAnchor](self, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v25);

    -[CNContactHeaderView posterView](self, "posterView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView trailingAnchor](self, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v29);

    -[CNContactHeaderView posterView](self, "posterView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v34);

    }
    else
    {
      -[CNContactHeaderStaticDisplayView bottomAnchor](self, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -v5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v33);
    }

    -[CNContactHeaderStaticDisplayView blurView](self, "blurView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView posterView](self, "posterView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v39);

    -[CNContactHeaderStaticDisplayView blurView](self, "blurView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView posterView](self, "posterView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v44);

    -[CNContactHeaderStaticDisplayView blurView](self, "blurView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView posterView](self, "posterView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v49);

    -[CNContactHeaderStaticDisplayView blurView](self, "blurView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView posterView](self, "posterView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v54);

  }
  -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView topAnchor](self, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v58);

  -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView leadingAnchor](self, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v62);

  -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView trailingAnchor](self, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v66);

  -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "bottomAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView bottomAnchor](self, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, -v5);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v70);

  -[CNContactHeaderView photoView](self, "photoView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView centerXAnchor](self, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v74);

  -[CNContactHeaderView photoView](self, "photoView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView layoutMarginsGuide](self, "layoutMarginsGuide");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintGreaterThanOrEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v79);

  -[CNContactHeaderView photoView](self, "photoView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView layoutMarginsGuide](self, "layoutMarginsGuide");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintLessThanOrEqualToAnchor:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v84);

  -[CNContactHeaderView photoView](self, "photoView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView staticHeaderPhotoMinBottomMargin](self, "staticHeaderPhotoMinBottomMargin");
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v88, -v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v90);

  -[CNContactHeaderStaticDisplayView staticHeaderPhotoMaxHeight](self, "staticHeaderPhotoMaxHeight");
  v92 = v91;
  LODWORD(v87) = -[CNContactHeaderView isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape");
  -[CNContactHeaderView photoView](self, "photoView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "heightAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v94;
  if ((_DWORD)v87)
    objc_msgSend(v94, "constraintEqualToConstant:", v92);
  else
    objc_msgSend(v94, "constraintLessThanOrEqualToConstant:", v92);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView setPhotoHeightConstraint:](self, "setPhotoHeightConstraint:", v96);

  -[CNContactHeaderView photoHeightConstraint](self, "photoHeightConstraint");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v97);

  -[CNContactHeaderView photoView](self, "photoView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView topAnchor](self, "topAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView staticHeaderPhotoMinTopMargin](self, "staticHeaderPhotoMinTopMargin");
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView setPhotoTopConstraint:](self, "setPhotoTopConstraint:", v101);

  if (-[CNContactHeaderView isPadRegularHorizontalSize](self, "isPadRegularHorizontalSize"))
  {
    -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v103) = 1148829696;
    objc_msgSend(v102, "setPriority:", v103);

    -[CNContactHeaderView photoView](self, "photoView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "topAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView topAnchor](self, "topAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView staticHeaderPhotoMinTopMargin](self, "staticHeaderPhotoMinTopMargin");
    objc_msgSend(v105, "constraintGreaterThanOrEqualToAnchor:constant:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v107);

  }
  -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v108);

  -[CNContactHeaderView photoView](self, "photoView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v110) = 1132068864;
  objc_msgSend(v109, "setContentHuggingPriority:forAxis:", 1, v110);

  v111 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__CNContactHeaderStaticDisplayView_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E2049068;
  aBlock[4] = self;
  v112 = v8;
  v186 = v112;
  v113 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2](v113, v114);

  -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2](v113, v115);

  -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v117) = 1148846080;
  objc_msgSend(v116, "setContentHuggingPriority:forAxis:", 1, v117);

  -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v119) = 1148846080;
  objc_msgSend(v118, "setContentCompressionResistancePriority:forAxis:", 1, v119);

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v121) = 1148846080;
  objc_msgSend(v120, "setContentHuggingPriority:forAxis:", 1, v121);

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v123) = 1148846080;
  objc_msgSend(v122, "setContentCompressionResistancePriority:forAxis:", 1, v123);

  -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (v124)
  {
    -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v125, "isHidden") ^ 1;

  }
  else
  {
    v126 = 0;
  }
  v182 = v3;

  -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (v127)
  {
    -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "isHidden") ^ 1;

  }
  else
  {
    v129 = 0;
  }

  v130 = -[CNContactHeaderStaticDisplayView shouldShowGemini](self, "shouldShowGemini");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v126)
  {
    -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "addObject:", v164);

    if (!v129)
    {
LABEL_19:
      if (!v130)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if (!v129)
  {
    goto LABEL_19;
  }
  -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "addObject:", v165);

  if (v130)
  {
LABEL_20:
    -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "addObject:", v132);

  }
LABEL_21:
  -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "bottomAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  v183[0] = v111;
  v183[1] = 3221225472;
  v183[2] = __53__CNContactHeaderStaticDisplayView_updateConstraints__block_invoke_2;
  v183[3] = &unk_1E2049090;
  v183[4] = self;
  v135 = v112;
  v184 = v135;
  objc_msgSend(v131, "_cn_reduce:initialValue:", v183, v134);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "topAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:", v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "addObject:", v139);

  -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  if (v140)
  {
    v181 = v134;
    -[CNContactHeaderStaticDisplayView leadingAnchor](self, "leadingAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "leadingAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "constraintEqualToAnchor:", v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "addObject:", v144);

    -[CNContactHeaderStaticDisplayView trailingAnchor](self, "trailingAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "trailingAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintEqualToAnchor:", v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "addObject:", v148);

    -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v150) = 1148846080;
    objc_msgSend(v149, "setContentHuggingPriority:forAxis:", 1, v150);

    -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v152) = 1148846080;
    objc_msgSend(v151, "setContentCompressionResistancePriority:forAxis:", 1, v152);

    if (!v182)
    {
      -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "topAnchor");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderView nameLabel](self, "nameLabel");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "bottomAnchor");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "constraintEqualToAnchor:", v169);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "addObject:", v170);

      -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "bottomAnchor");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderStaticDisplayView bottomAnchor](self, "bottomAnchor");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "constraintEqualToAnchor:constant:", v173, -v5);
      v174 = objc_claimAutoreleasedReturnValue();
LABEL_33:
      v180 = (void *)v174;
      objc_msgSend(v135, "addObject:", v174);

      v134 = v181;
      goto LABEL_34;
    }
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "text");
    v154 = objc_claimAutoreleasedReturnValue();
    if (v154)
    {
      v155 = (void *)v154;
      -[CNContactHeaderView nameLabel](self, "nameLabel");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "text");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = objc_msgSend(v157, "length");

      if (v158)
      {
        -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "topAnchor");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderView nameLabel](self, "nameLabel");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "bottomAnchor");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "constraintEqualToAnchor:constant:", v162, v5);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "addObject:", v163);

LABEL_32:
        -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "bottomAnchor");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderStaticDisplayView bottomAnchor](self, "bottomAnchor");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "constraintEqualToAnchor:", v173);
        v174 = objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
    }
    else
    {

    }
    -[CNContactHeaderStaticDisplayView actionsWrapperView](self, "actionsWrapperView");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "topAnchor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "topAnchor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "constraintEqualToAnchor:", v178);
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v179) = 1132068864;
    objc_msgSend(v159, "setPriority:", v179);
    objc_msgSend(v135, "addObject:", v159);
    goto LABEL_32;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v135);
  -[CNContactHeaderView setActivatedConstraints:](self, "setActivatedConstraints:", v135);

}

- (CNContactActionsContainerView)actionsWrapperView
{
  return self->_actionsWrapperView;
}

- (UILabel)taglineLabel
{
  return (UILabel *)objc_getProperty(self, a2, 688, 1);
}

- (UIView)avatarBackgroundView
{
  return self->_avatarBackgroundView;
}

void __53__CNContactHeaderStaticDisplayView_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  objc_msgSend(v3, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutMarginsGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  LODWORD(v11) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v11);

}

- (UILabel)importantLabel
{
  return self->_importantLabel;
}

- (BOOL)shouldShowGemini
{
  return self->_shouldShowGemini;
}

- (double)staticHeaderPhotoMaxHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  if (-[CNContactHeaderView isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
  {
    -[CNContactHeaderStaticDisplayView avatarHeightPhoneLandscape](self, "avatarHeightPhoneLandscape");
    v4 = v3;
  }
  else
  {
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoMaxHeight");
    v4 = v6;

  }
  if (-[CNContactHeaderView isPhotoLowQuality](self, "isPhotoLowQuality"))
  {
    if (!-[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster"))
    {
      -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoMaxHeightLowQuality");
      v9 = v8;

      if (v4 >= v9)
        return v9;
    }
  }
  return v4;
}

uint64_t __85__CNContactHeaderStaticDisplayView_assignImageColorsToAvatarBackgroundView_animated___block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

- (NSDictionary)importantTextAttributes
{
  return self->_importantTextAttributes;
}

- (id)geminiTextAttributes
{
  return self->_geminiTextAttributes;
}

- (id)downtimeTextAttributes
{
  return self->_downtimeTextAttributes;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
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
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CNContactHeaderStaticDisplayView;
  -[CNContactHeaderView layoutSubviews](&v25, sel_layoutSubviews);
  -[CNContactHeaderStaticDisplayView calculateLabelSizes](self, "calculateLabelSizes");
  -[CNContactHeaderStaticDisplayView setBlurViewGradient](self, "setBlurViewGradient");
  -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CNContactHeaderStaticDisplayView avatarBackgroundGradientLayer](self, "avatarBackgroundGradientLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[CNContactHeaderStaticDisplayView staticHeaderPhotoMinTopMargin](self, "staticHeaderPhotoMinTopMargin");
  v14 = v13;
  -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constant");
  v17 = v16;

  if (v17 != v14)
  {
    -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setConstant:", v14);

  }
  if (-[CNContactHeaderView isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
  {
    -[CNContactHeaderStaticDisplayView staticHeaderPhotoMaxHeight](self, "staticHeaderPhotoMaxHeight");
    v20 = v19;
    -[CNContactHeaderView photoHeightConstraint](self, "photoHeightConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constant");
    v23 = v22;

    if (v23 != v20)
    {
      -[CNContactHeaderView photoHeightConstraint](self, "photoHeightConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setConstant:", v20);

    }
  }
}

- (void)setBlurViewGradient
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[CNContactHeaderView contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster")
    || (v6 != (void *)*MEMORY[0x1E0C97180] ? (v7 = v6 == (void *)*MEMORY[0x1E0C97188]) : (v7 = 1), v7))
  {
    -[CNContactHeaderView posterView](self, "posterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", MEMORY[0x1E0C9AA60]);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "blurGradient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F00]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v10);
    objc_msgSend(v11, "setValue:forKey:", objc_msgSend(v12, "CGImage"), CFSTR("inputMaskImage"));
    v13 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v11, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v11, "setValue:forKey:", v13, CFSTR("inputDither"));
    objc_msgSend(v11, "setValue:forKey:", &unk_1E20D2C88, CFSTR("inputRadius"));
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView posterView](self, "posterView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFilters:", v14);

  }
}

- (void)setPosterViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[CNContactHeaderView posterView](self, "posterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[CNContactHeaderStaticDisplayView blurView](self, "blurView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3);

  if (v3)
  {
    -[CNContactHeaderView posterView](self, "posterView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", 0);

    -[CNContactHeaderStaticDisplayView updateSensitiveContentBlurVisibility:](self, "updateSensitiveContentBlurVisibility:", 0);
  }
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)assignImageColorsToAvatarBackgroundView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *lastBackgroundColors;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  id v33;
  id v34;

  v4 = a4;
  v33 = a3;
  v6 = objc_msgSend(MEMORY[0x1E0D13CD8], "colorArraySize");
  if (objc_msgSend(v33, "count") == v6)
  {
    v7 = v33;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v33, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "_cn_arrayWithObject:count:", v10, v6);
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v9)
    v4 = 0;
    v7 = (void *)v11;
  }
  v34 = v7;
  objc_msgSend(v7, "_cn_map:", &__block_literal_global_11359);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_cn_reversed");
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();

  lastBackgroundColors = self->_lastBackgroundColors;
  if (lastBackgroundColors != v13 && (!lastBackgroundColors || !-[NSArray isEqualToArray:](v13, "isEqualToArray:")))
  {
    objc_storeStrong((id *)&self->_lastBackgroundColors, v13);
    -[CNContactHeaderStaticDisplayView avatarBackgroundGradientLayer](self, "avatarBackgroundGradientLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAnimationForKey:", CFSTR("gradientAnimation"));

    if (v4
      && (-[CNContactHeaderStaticDisplayView avatarBackgroundGradientLayer](self, "avatarBackgroundGradientLayer"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "colors"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v16,
          v17))
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("colors"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setToValue:", v13);
      objc_msgSend(v18, "setDuration:", 0.2);
      objc_msgSend(v18, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v18, "setRemovedOnCompletion:", 0);
      -[CNContactHeaderStaticDisplayView avatarBackgroundGradientLayer](self, "avatarBackgroundGradientLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAnimation:forKey:", v18, CFSTR("gradientAnimation"));

    }
    else
    {
      -[CNContactHeaderStaticDisplayView avatarBackgroundGradientLayer](self, "avatarBackgroundGradientLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setColors:", v13);
    }

    -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[CNContactHeaderStaticDisplayView avatarBackgroundGradientLayer](self, "avatarBackgroundGradientLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  }
  -[CNContactHeaderView delegate](self, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0)
  {
    -[CNContactHeaderView delegate](self, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "headerView:didSetBackgroundAsGradientColors:", self, v34);

  }
}

- (CAGradientLayer)avatarBackgroundGradientLayer
{
  return self->_avatarBackgroundGradientLayer;
}

- (void)setDefaultLabelColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor](CNUIColorRepository, "contactCardStaticAvatarHeaderDefaultTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIColorRepository contactCardStaticHeaderDefaultTaglineTextColor](CNUIColorRepository, "contactCardStaticHeaderDefaultTaglineTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1140];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v5);

  -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v4);

}

- (void)updateLabelColorsForImageColors:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (+[CNImageDerivedColorBackgroundUtilities backgroundColorsPreferWhiteForegroundText:](CNImageDerivedColorBackgroundUtilities, "backgroundColorsPreferWhiteForegroundText:", a3))
  {
    +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor](CNUIColorRepository, "contactCardStaticAvatarHeaderDefaultTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIColorRepository contactCardStaticHeaderDefaultTaglineTextColor](CNUIColorRepository, "contactCardStaticHeaderDefaultTaglineTextColor");
  }
  else
  {
    +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultDarkTextColor](CNUIColorRepository, "contactCardStaticAvatarHeaderDefaultDarkTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIColorRepository contactCardStaticHeaderDefaultTaglineDarkTextColor](CNUIColorRepository, "contactCardStaticHeaderDefaultTaglineDarkTextColor");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC1140];
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v6);

  -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v5);

  -[CNContactHeaderView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CNContactHeaderView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "headerView:didSetNameLabelColor:", self, v4);

  }
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderStaticDisplayView;
  -[CNContactHeaderStaticDisplayView tintColorDidChange](&v7, sel_tintColorDidChange);
  -[CNContactHeaderStaticDisplayView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlightedTextColor:", v3);

  -[CNContactHeaderStaticDisplayView tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightedColor:", v5);

}

- (void)setGeminiTextAttributes:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_geminiTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_geminiTextAttributes, a3);
    -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAb_textAttributes:", v6);

  }
}

- (void)setIsEmergencyContact:(BOOL)a3
{
  if (self->_isEmergencyContact != a3)
  {
    self->_isEmergencyContact = a3;
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
  }
}

- (void)updateGeminiResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  _QWORD block[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "isFeatureEnabled:", 7);

  v8 = -[CNContactHeaderStaticDisplayView allowsPickerActions](self, "allowsPickerActions");
  v9 = v8;
  if ((_DWORD)v7)
  {
    -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsPickerActions:", v9);
LABEL_8:

    goto LABEL_9;
  }
  if (v8)
  {
    -[CNContactHeaderView contacts](self, "contacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "hasBeenPersisted");
  }
  else
  {
    v10 = 0;
  }
  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsPickerActions:", v10);

  if (v9)
  {

    goto LABEL_8;
  }
LABEL_9:
  -[CNContactHeaderStaticDisplayView setGeminiResult:](self, "setGeminiResult:", v4);
  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGeminiResult:", v4);

  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
  -[CNContactHeaderView contacts](self, "contacts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasBeenPersisted");

  if (v15)
  {
    -[CNContactHeaderStaticDisplayView geminiPicker](self, "geminiPicker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGeminiResult:", v4);

  }
  else
  {
    -[CNContactHeaderStaticDisplayView geminiIconProvider](self, "geminiIconProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setGeminiResult:", v4);

    -[CNContactHeaderStaticDisplayView _geminiViewBehaviorForUnknownContact](self, "_geminiViewBehaviorForUnknownContact");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__CNContactHeaderStaticDisplayView_updateGeminiResult___block_invoke;
    block[3] = &unk_1E204F648;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (CNContactGeminiView)geminiView
{
  return (CNContactGeminiView *)objc_getProperty(self, a2, 776, 1);
}

- (void)setShouldShowGemini:(BOOL)a3
{
  void *v5;

  if (self->_shouldShowGemini != a3)
  {
    if (a3)
    {
      -[CNContactHeaderStaticDisplayView createGeminiViewIfNeeded](self, "createGeminiViewIfNeeded");
      -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderStaticDisplayView addSubview:](self, "addSubview:", v5);
    }
    else
    {
      -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");
    }

    -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
    self->_shouldShowGemini = a3;
    -[CNContactHeaderStaticDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setGeminiResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (CNGeminiPickerController)geminiPicker
{
  return self->_geminiPicker;
}

- (BOOL)allowsPickerActions
{
  return self->_allowsPickerActions;
}

uint64_t __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLabelColorsForImageColors:", *(_QWORD *)(a1 + 40));
}

- (void)setUpPosterView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  v8 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("ContactPosterView"));
  -[CNContactHeaderStaticDisplayView addSubview:](self, "addSubview:", v8);
  -[CNContactHeaderStaticDisplayView sendSubviewToBack:](self, "sendSubviewToBack:", v8);
  -[CNContactHeaderView setPosterView:](self, "setPosterView:", v8);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v5);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v6, v7);

  -[CNContactHeaderStaticDisplayView setBlurView:](self, "setBlurView:", v6);
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  if (a3)
    +[CNContactHeaderViewSizeAttributes staticDisplayAttributesWithNavBar](CNContactHeaderViewSizeAttributes, "staticDisplayAttributesWithNavBar");
  else
    +[CNContactHeaderViewSizeAttributes staticDisplayAttributes](CNContactHeaderViewSizeAttributes, "staticDisplayAttributes");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateWithContacts:(id)a3
{
  CNPRSPosterConfiguration *cachedPosterConfiguration;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactHeaderStaticDisplayView;
  -[CNContactHeaderView updateWithContacts:](&v5, sel_updateWithContacts_, a3);
  cachedPosterConfiguration = self->_cachedPosterConfiguration;
  self->_cachedPosterConfiguration = 0;

}

- (void)setIsRestrictedContact:(BOOL)a3
{
  if (self->_isRestrictedContact != a3)
  {
    self->_isRestrictedContact = a3;
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setIsDowntimeContact:(BOOL)a3
{
  if (self->_isDowntimeContact != a3)
  {
    self->_isDowntimeContact = a3;
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
  }
}

- (CNContactHeaderStaticDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowImageDrops:(BOOL)a5 showingNavBar:(BOOL)a6 monogramOnly:(BOOL)a7 delegate:(id)a8
{
  CNContactHeaderStaticDisplayView *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UILabel *taglineLabel;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UITraitChangeRegistration *traitChangeRegistration;
  CNContactGeminiIconProvider *v37;
  CNContactGeminiIconProvider *geminiIconProvider;
  CNMetricsUIReporter *v39;
  CNMetricsUIReporter *metricsReporter;
  uint64_t v41;
  CNSensitiveContentAnalysisManager *sensitiveContentManager;
  objc_super v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)CNContactHeaderStaticDisplayView;
  v8 = -[CNContactHeaderView initWithContact:frame:shouldAllowTakePhotoAction:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](&v44, sel_initWithContact_frame_shouldAllowTakePhotoAction_shouldAllowImageDrops_showingNavBar_monogramOnly_delegate_, a3, 0, a5, a6, a7, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v8, sel_handleNameLabelTap_);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v8, sel_handleNameLabelLongPress_);
    v11 = objc_alloc(MEMORY[0x1E0DC3990]);
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    -[CNContactHeaderView setNameLabel:](v8, "setNameLabel:", v16);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextAlignment:", 1);

    if (-[CNContactHeaderView isAXSize](v8, "isAXSize"))
      v19 = 0;
    else
      v19 = 2;
    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNumberOfLines:", v19);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUserInteractionEnabled:", 1);

    -[CNContactHeaderStaticDisplayView tintColor](v8, "tintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHighlightedTextColor:", v22);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addGestureRecognizer:", v9);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addGestureRecognizer:", v10);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_cnui_applyContactStyle");

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView addSubview:](v8, "addSubview:", v27);

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v12, v13, v14, v15);
    taglineLabel = v8->_taglineLabel;
    v8->_taglineLabel = (UILabel *)v28;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_taglineLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v8->_taglineLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v8->_taglineLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v8->_taglineLabel, "setLineBreakMode:", 0);
    -[CNContactHeaderView contactStyle](v8, "contactStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "taglineTextColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8->_taglineLabel, "setTextColor:", v31);

    -[UILabel _cnui_applyContactStyle](v8->_taglineLabel, "_cnui_applyContactStyle");
    -[CNContactHeaderStaticDisplayView addSubview:](v8, "addSubview:", v8->_taglineLabel);
    -[CNContactHeaderStaticDisplayView updateFontSizes](v8, "updateFontSizes");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v8, sel_menuWillHide_, *MEMORY[0x1E0DC5048], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v8, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    v8->_allowsPickerActions = 1;
    -[CNContactHeaderStaticDisplayView setUpPosterView](v8, "setUpPosterView");
    -[CNContactHeaderStaticDisplayView setUpAvatarBackgroundView](v8, "setUpAvatarBackgroundView");
    -[CNContactHeaderStaticDisplayView setDefaultLabelColors](v8, "setDefaultLabelColors");
    v45[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView registerForTraitChanges:withTarget:action:](v8, "registerForTraitChanges:withTarget:action:", v34, v8, sel_traitEnvironment_didChangeTraitCollection_);
    v35 = objc_claimAutoreleasedReturnValue();
    traitChangeRegistration = v8->_traitChangeRegistration;
    v8->_traitChangeRegistration = (UITraitChangeRegistration *)v35;

    v37 = objc_alloc_init(CNContactGeminiIconProvider);
    geminiIconProvider = v8->_geminiIconProvider;
    v8->_geminiIconProvider = v37;

    v39 = (CNMetricsUIReporter *)objc_alloc_init(MEMORY[0x1E0D13C28]);
    metricsReporter = v8->_metricsReporter;
    v8->_metricsReporter = v39;

    +[CNSensitiveContentAnalysisManager defaultManager](CNSensitiveContentAnalysisManager, "defaultManager");
    v41 = objc_claimAutoreleasedReturnValue();
    sensitiveContentManager = v8->_sensitiveContentManager;
    v8->_sensitiveContentManager = (CNSensitiveContentAnalysisManager *)v41;

  }
  return v8;
}

- (void)setNameTextAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactHeaderStaticDisplayView;
  v4 = a3;
  -[CNContactHeaderView setNameTextAttributes:](&v6, sel_setNameTextAttributes_, v4);
  -[CNContactHeaderView nameLabel](self, "nameLabel", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAb_textAttributes:", v4);

}

- (void)setUpAvatarBackgroundView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v10 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNContactHeaderStaticDisplayView addSubview:](self, "addSubview:", v10);
  -[CNContactHeaderStaticDisplayView sendSubviewToBack:](self, "sendSubviewToBack:", v10);
  -[CNContactHeaderStaticDisplayView setAvatarBackgroundView:](self, "setAvatarBackgroundView:", v10);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", v7);

  -[CNContactHeaderStaticDisplayView setAvatarBackgroundGradientLayer:](self, "setAvatarBackgroundGradientLayer:", v7);
}

- (void)setAvatarBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarBackgroundView, a3);
}

- (void)setAvatarBackgroundGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarBackgroundGradientLayer, a3);
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CNContactHeaderStaticDisplayView;
  -[CNContactHeaderView reloadDataPreservingChanges:](&v24, sel_reloadDataPreservingChanges_, a3);
  -[CNContactHeaderStaticDisplayView _assignActionToGeminiView](self, "_assignActionToGeminiView");
  -[CNContactHeaderView contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView _headerStringForContacts:](self, "_headerStringForContacts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderView contacts](self, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView attributedTaglineForContacts:](self, "attributedTaglineForContacts:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderStaticDisplayView _importantString](self, "_importantString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView _updateImportantLabel](self, "_updateImportantLabel");
  -[CNContactHeaderStaticDisplayView _updateDowntimeView](self, "_updateDowntimeView");
  objc_msgSend(v7, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView message](self, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v10))
  {
    v11 = objc_msgSend(v5, "length");

    if (v11)
      goto LABEL_5;
    objc_msgSend(v7, "string");
    v10 = v5;
    v9 = v7;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }

LABEL_5:
  if (!objc_msgSend(v7, "length"))
  {

    v7 = 0;
  }
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v5)
  {
    if (!v13)
      goto LABEL_17;
  }
  else if (v13)
  {
    goto LABEL_16;
  }
  -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v7)
  {
    if (!v16)
      goto LABEL_18;

    if (!v5)
    {
LABEL_17:

LABEL_25:
      -[CNContactHeaderStaticDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      goto LABEL_26;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (!v16)
  {
    v18 = 1;
    goto LABEL_21;
  }
LABEL_18:
  -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v20)
    {

      v18 = 0;
      if (!v7)
        goto LABEL_22;
      goto LABEL_21;
    }

    v18 = 1;
    if (v7)
LABEL_21:

  }
  else
  {
    v18 = v20 != 0;

    if (v7)
      goto LABEL_21;
  }
LABEL_22:

  if (v5)
  if (v18)
    goto LABEL_25;
LABEL_26:
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAb_text:", v5);

  -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAttributedText:", v7);

  -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAb_text:", v8);

  -[CNContactHeaderStaticDisplayView _updatePhotoView](self, "_updatePhotoView");
  -[CNContactHeaderStaticDisplayView updatePosterViewImage](self, "updatePosterViewImage");
  -[CNContactHeaderStaticDisplayView updateAvatarBackgroundViewVisibility](self, "updateAvatarBackgroundViewVisibility");
  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
  -[CNContactHeaderStaticDisplayView calculateLabelSizes](self, "calculateLabelSizes");
  -[CNContactHeaderStaticDisplayView setNeedsLayout](self, "setNeedsLayout");

}

- (void)updatePosterViewImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNPRSPosterConfiguration *v14;
  id v15;
  CNPRSPosterConfiguration *cachedPosterConfiguration;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CNPRUISPosterSnapshotController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  CNPRUISIncomingCallPosterContext *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!-[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster"))
  {
    -[CNContactHeaderStaticDisplayView setPosterViewHidden:](self, "setPosterViewHidden:", 1);
    return;
  }
  -[CNContactHeaderView posterView](self, "posterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[CNContactHeaderStaticDisplayView blurView](self, "blurView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[CNContactHeaderView contacts](self, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView currentlyDisplayedPosterContactIdentifier](self, "currentlyDisplayedPosterContactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    -[CNContactHeaderView posterView](self, "posterView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", 0);

  }
  -[CNContactHeaderStaticDisplayView cachedPosterConfiguration](self, "cachedPosterConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v6, "wallpaper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "posterArchiveData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", v13, &v40);
    v14 = (CNPRSPosterConfiguration *)objc_claimAutoreleasedReturnValue();
    v15 = v40;
    cachedPosterConfiguration = self->_cachedPosterConfiguration;
    self->_cachedPosterConfiguration = v14;

    if (!self->_cachedPosterConfiguration)
    {
      CNUILogPosters();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "localizedDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v31;
        _os_log_error_impl(&dword_18AC56000, v17, OS_LOG_TYPE_ERROR, "Unable to unarchive poster configuration from data, %@", buf, 0xCu);

      }
    }

  }
  -[CNContactHeaderStaticDisplayView cachedPosterConfiguration](self, "cachedPosterConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v6, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView setCurrentlyDisplayedPosterContactIdentifier:](self, "setCurrentlyDisplayedPosterContactIdentifier:", v19);

    v33 = -[CNPRUISIncomingCallPosterContext initWithContact:showName:]([CNPRUISIncomingCallPosterContext alloc], "initWithContact:showName:", v6, 0);
    +[CNPRUISIncomingCallSnapshotDefinition contentsOnlySnapshotDefinitionWithContext:attachmentIdentifiers:](CNPRUISIncomingCallSnapshotDefinition, "contentsOnlySnapshotDefinitionWithContext:attachmentIdentifiers:", v33, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPRUISPosterSnapshotRequest requestForConfiguration:definition:interfaceOrientation:](CNPRUISPosterSnapshotRequest, "requestForConfiguration:definition:interfaceOrientation:", v18, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(CNPRUISPosterSnapshotController);
    v39 = 0;
    -[CNPRUISPosterSnapshotController latestSnapshotBundleForRequest:error:](v22, "latestSnapshotBundleForRequest:error:", v21, &v39);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v39;
    if (v23)
    {
      objc_msgSend(v20, "levelSets", v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "snapshotForLevelSet:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      CNUILogPosters();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18AC56000, v27, OS_LOG_TYPE_DEBUG, "Returning cached snapshot", buf, 2u);
      }

      if (v26)
      {
        objc_msgSend(v6, "wallpaper");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderStaticDisplayView assignSnapshotImageToPosterView:configuration:contentIsSensitive:](self, "assignSnapshotImageToPosterView:configuration:contentIsSensitive:", v26, v18, objc_msgSend(v28, "contentIsSensitive"));

        -[CNContactHeaderStaticDisplayView updateLabelColorsForPosterSnapshot:](self, "updateLabelColorsForPosterSnapshot:", v26);
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      CNUILogPosters();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v29, OS_LOG_TYPE_DEFAULT, "No snapshot found in cache", buf, 2u);
      }

    }
    CNUILogPosters();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v30, OS_LOG_TYPE_DEFAULT, "Requesting poster snapshot", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __57__CNContactHeaderStaticDisplayView_updatePosterViewImage__block_invoke;
    v34[3] = &unk_1E20490E0;
    objc_copyWeak(&v38, (id *)buf);
    v35 = v20;
    v36 = v18;
    v37 = v6;
    -[CNPRUISPosterSnapshotController executeSnapshotRequest:completion:](v22, "executeSnapshotRequest:completion:", v21, v34);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
    goto LABEL_23;
  }
LABEL_24:

}

- (void)updateAvatarBackgroundViewVisibility
{
  _BOOL8 v3;
  void *v4;
  float v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  uint64_t *v24;
  CNContactHeaderStaticDisplayView *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id v39;
  id v40;
  char v41;
  _QWORD aBlock[5];
  id v43;

  v3 = -[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster");
  -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  if (-[CNContactHeaderView isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
    v5 = 0.0;
  else
    v5 = 1.0;
  -[CNContactHeaderStaticDisplayView avatarBackgroundGradientLayer](self, "avatarBackgroundGradientLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = v5;
  objc_msgSend(v6, "setOpacity:", v7);

  if (!-[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster"))
  {
    -[CNContactHeaderStaticDisplayView setPosterViewHidden:](self, "setPosterViewHidden:", 1);
    -[CNContactHeaderView contacts](self, "contacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundColors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactHeaderView contacts](self, "contacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke;
    aBlock[3] = &unk_1E2049130;
    aBlock[4] = self;
    v16 = v14;
    v43 = v16;
    v17 = _Block_copy(aBlock);
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
    {
      v41 = 0;
      v40 = 0;
      -[CNContactHeaderStaticDisplayView imageDataForColorFetchingIsImageDataOrThumbnail:bitmapFormat:](self, "imageDataForColorFetchingIsImageDataOrThumbnail:bitmapFormat:", &v41, &v40);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v40;
      if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
      {
        objc_storeStrong((id *)&self->_lastBackgroundColorsContactIdentifier, v14);
        -[CNContactHeaderView backgroundGradientDefaultGrayColors](self, "backgroundGradientDefaultGrayColors");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void *, _QWORD, _QWORD))v17 + 2))(v17, v20, 0, 0);
      }
      else
      {
        if (!-[CNContactHeaderStaticDisplayView identifierForBackgroundColorIsCurrent:](self, "identifierForBackgroundColorIsCurrent:", v16))
        {
          objc_storeStrong((id *)&self->_lastBackgroundColorsContactIdentifier, v14);
          -[CNContactHeaderView backgroundGradientDefaultGrayColors](self, "backgroundGradientDefaultGrayColors");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, void *, _QWORD, uint64_t))v17 + 2))(v17, v21, 0, 1);

        }
        -[CNContactHeaderView contacts](self, "contacts");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend((id)objc_opt_class(), "_colorCachingEnabledForProcess") && v41)
        {
          v30 = v15;
          v31 = 3221225472;
          v32 = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_5;
          v33 = &unk_1E204B5E8;
          v23 = &v34;
          v34 = v17;
          v24 = &v30;
          v25 = self;
          v26 = v18;
          v27 = v19;
          v28 = v20;
          v29 = 1;
        }
        else
        {
          v35 = v15;
          v36 = 3221225472;
          v37 = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_4;
          v38 = &unk_1E204B5E8;
          v23 = &v39;
          v39 = v17;
          v24 = &v35;
          v25 = self;
          v26 = v18;
          v27 = v19;
          v28 = v20;
          v29 = 0;
        }
        -[CNContactHeaderView fetchColorsForContactImageData:bitmapFormat:isPoster:forContact:cacheResult:withCompletionHandler:](v25, "fetchColorsForContactImageData:bitmapFormat:isPoster:forContact:cacheResult:withCompletionHandler:", v26, v27, 0, v28, v29, v24, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);

      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastBackgroundColorsContactIdentifier, v14);
      (*((void (**)(void *, void *, _QWORD, uint64_t))v17 + 2))(v17, v11, 0, 1);
    }

  }
}

void __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  void *v15;
  _QWORD v16[5];
  void *v17;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "identifierForBackgroundColorIsCurrent:", *(_QWORD *)(a1 + 40)))
  {
    if ((a4 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D13CD8], "tintedUIColorsFromUIColors:isLight:", v7, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v7;
    }
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "assignImageColorsToAvatarBackgroundView:animated:", v8, a3);
    v10 = (void *)MEMORY[0x1E0DC3F10];
    if ((_DWORD)a3)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_2;
      v16[3] = &unk_1E2050400;
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v9;
      v11 = v9;
      objc_msgSend(v10, "animateWithDuration:animations:", v16, 0.2);
      v12 = v17;
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_3;
      v14[3] = &unk_1E2050400;
      v14[4] = *(_QWORD *)(a1 + 32);
      v15 = v9;
      v13 = v9;
      objc_msgSend(v10, "performWithoutAnimation:", v14);
      v12 = v15;
    }

  }
}

- (BOOL)identifierForBackgroundColorIsCurrent:(id)a3
{
  NSString *v4;
  NSString *lastBackgroundColorsContactIdentifier;
  char v6;

  v4 = (NSString *)a3;
  lastBackgroundColorsContactIdentifier = self->_lastBackgroundColorsContactIdentifier;
  if (lastBackgroundColorsContactIdentifier == v4)
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = -[NSString isEqualToString:](lastBackgroundColorsContactIdentifier, "isEqualToString:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)attributedTaglineForContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "count") != 1)
  {
    v7 = objc_msgSend(v4, "count");

    +[CNNumberFormatting localizedStringWithInteger:](CNNumberFormatting, "localizedStringWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_GROUP_MEMBERS_COUNT-%@"), &stru_1E20507A8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cnui_appendTaglineString:", v12);

    v13 = *MEMORY[0x1E0D13850];
    goto LABEL_39;
  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "contactType") == 1)
  {
    if (-[CNContactHeaderStaticDisplayView usesBrandedCallFormat](self, "usesBrandedCallFormat"))
      objc_msgSend(v6, "organizationName");
    else
      objc_msgSend(v6, "personName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D13850];
    if (!(*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13850] + 16))(*MEMORY[0x1E0D13850], v17))
      goto LABEL_38;
    goto LABEL_11;
  }
  v13 = *MEMORY[0x1E0D13850];
  objc_msgSend(v6, "personName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14) & 1) == 0)
  {

LABEL_13:
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v6, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v17))
      objc_msgSend(v5, "cnui_appendTaglineString:", v17);
    objc_msgSend(v6, "nickname");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v18))
    {
      -[CNContactHeaderView delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isNicknameProhibited");

      if ((v20 & 1) != 0)
        goto LABEL_19;
      objc_msgSend(v6, "nickname");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIFontRepository contactCardStaticHeaderNicknameTaglineFont](CNUIFontRepository, "contactCardStaticHeaderNicknameTaglineFont");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cnui_appendTaglineString:withFont:", v18, v21);

    }
LABEL_19:
    objc_msgSend(v6, "previousFamilyName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v22);

    if (v23)
    {
      objc_msgSend(v6, "previousFamilyName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cnui_appendTaglineString:", v24);

    }
    objc_msgSend(v6, "jobTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v25);

    objc_msgSend(v6, "departmentName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v27);

    if (v26)
    {
      if (v28)
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "jobTitle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        CNContactsUIBundle();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_JOB_TITLE_DEPARMENT_SEPARATOR"), &stru_1E20507A8, CFSTR("Localized"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "departmentName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%@%@%@"), v30, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cnui_appendTaglineString:", v34);

LABEL_28:
LABEL_29:
        objc_msgSend(v6, "organizationName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v36);

        if (v37)
        {
          objc_msgSend(v6, "organizationName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "cnui_appendTaglineString:", v38);

        }
        objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "featureFlags");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "isFeatureEnabled:", 12)
          && (objc_msgSend(v6, "isKeyAvailable:", *MEMORY[0x1E0C96668]) & 1) != 0)
        {
          v41 = *MEMORY[0x1E0D137F8];
          objc_msgSend(v6, "termsOfAddress");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v41) = (*(uint64_t (**)(uint64_t, void *))(v41 + 16))(v41, v42);

          if ((v41 & 1) != 0)
            goto LABEL_38;
          v43 = (void *)MEMORY[0x1E0CB3960];
          objc_msgSend(v6, "termsOfAddress");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "localizedDescriptionForAddressingGrammars:uppercased:", v44, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v39))
            objc_msgSend(v5, "cnui_appendTaglineString:uppercased:", v39, 0);
        }
        else
        {

        }
        goto LABEL_38;
      }
      objc_msgSend(v6, "jobTitle");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v28)
        goto LABEL_29;
      objc_msgSend(v6, "departmentName");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v35;
    objc_msgSend(v5, "cnui_appendTaglineString:", v35);
    goto LABEL_28;
  }
  -[CNContactHeaderStaticDisplayView alternateName](self, "alternateName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

  if (!v16)
    goto LABEL_13;
  -[CNContactHeaderStaticDisplayView alternateName](self, "alternateName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(v5, "cnui_appendTaglineString:", v17);
LABEL_38:

LABEL_39:
  -[CNContactHeaderStaticDisplayView message](self, "message");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v45);

  if (v46)
  {
    -[CNContactHeaderStaticDisplayView message](self, "message");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cnui_appendTaglineString:", v47);

  }
  return v5;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)_updatePhotoView
{
  void *v2;
  void *v3;
  unint64_t v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  -[CNContactHeaderView contacts](self, "contacts");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "count");
  v6 = v5 <= 1
    && (-[CNContactHeaderView contacts](self, "contacts"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v3, "imageDataAvailable") & 1) == 0)
    && !-[CNContactHeaderView alwaysShowsMonogram](self, "alwaysShowsMonogram")
    || -[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster");
  -[CNContactHeaderView photoView](self, "photoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  if (v5 <= 1)
  {

  }
}

- (void)_updateImportantLabel
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

  }
  else
  {
    v5 = 1;
  }

  -[CNContactHeaderStaticDisplayView _importantString](self, "_importantString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = *MEMORY[0x1E0DC4B10];
      v9 = *MEMORY[0x1E0DC1140];
      v22[0] = CFSTR("ABTextStyleAttributeName");
      v22[1] = v9;
      v23[0] = v8;
      +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderStaticDisplayView setImportantTextAttributes:](self, "setImportantTextAttributes:", v11);

      v12 = objc_alloc(MEMORY[0x1E0DC3990]);
      v13 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CNContactHeaderStaticDisplayView setImportantLabel:](self, "setImportantLabel:", v13);

      -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTextAlignment:", 1);

      -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNumberOfLines:", 0);

      -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_setUseShortcutIntrinsicContentSize:", 1);

      -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_cnui_applyContactStyle");

      -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderStaticDisplayView addSubview:](self, "addSubview:", v19);

    }
  }
  -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v6 == 0);

  -[CNContactHeaderStaticDisplayView importantLabel](self, "importantLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v21, "isHidden");

  if (v5 != (_DWORD)v20)
    -[CNContactHeaderStaticDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (id)_importantString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CNContactHeaderStaticDisplayView importantMessage](self, "importantMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactHeaderStaticDisplayView isEmergencyContact](self, "isEmergencyContact"))
  {
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_EMERGENCY_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    {
      objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n%@"), v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v5;
    }
    v7 = v6;

    v3 = v7;
  }
  return v3;
}

- (BOOL)isEmergencyContact
{
  return self->_isEmergencyContact;
}

- (NSString)importantMessage
{
  return self->_importantMessage;
}

- (void)_updateDowntimeView
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  CNContactDowntimeView *v9;
  CNContactDowntimeView *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

  }
  else
  {
    v5 = 1;
  }

  if (-[CNContactHeaderStaticDisplayView isDowntimeContact](self, "isDowntimeContact")
    || -[CNContactHeaderStaticDisplayView isRestrictedContact](self, "isRestrictedContact"))
  {
    -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }
  if (!-[CNContactHeaderStaticDisplayView isDowntimeContact](self, "isDowntimeContact"))
  {
    v8 = -[CNContactHeaderStaticDisplayView isRestrictedContact](self, "isRestrictedContact") ^ 1;
    if (!v7)
      goto LABEL_13;
    goto LABEL_12;
  }
  v8 = 0;
  if (v7)
  {
LABEL_12:
    v9 = [CNContactDowntimeView alloc];
    v10 = -[CNContactDowntimeView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNContactHeaderStaticDisplayView setDowntimeView:](self, "setDowntimeView:", v10);

    -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v22[0] = *MEMORY[0x1E0DC4B10];
    v12 = *MEMORY[0x1E0DC1140];
    v21[0] = CFSTR("ABTextStyleAttributeName");
    v21[1] = v12;
    -[CNContactHeaderView contactStyle](self, "contactStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "taglineTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView setDowntimeTextAttributes:](self, "setDowntimeTextAttributes:", v15);

    -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView addSubview:](self, "addSubview:", v16);

  }
LABEL_13:
  if (-[CNContactHeaderStaticDisplayView isDowntimeContact](self, "isDowntimeContact"))
    v17 = 2;
  else
    v17 = 0;
  v18 = v17 | -[CNContactHeaderStaticDisplayView isRestrictedContact](self, "isRestrictedContact");
  -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setElements:", v18);

  -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v8);

  if (v5)
    -[CNContactHeaderStaticDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (BOOL)isRestrictedContact
{
  return self->_isRestrictedContact;
}

- (BOOL)isDowntimeContact
{
  return self->_isDowntimeContact;
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
    if (-[CNContactHeaderStaticDisplayView usesBrandedCallFormat](self, "usesBrandedCallFormat"))
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
    -[CNContactHeaderStaticDisplayView contactFormatter](self, "contactFormatter");
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
    -[CNContactHeaderStaticDisplayView alternateName](self, "alternateName");
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

- (void)_geminiViewBehaviorForSavedContact
{
  void *v3;
  void *v4;
  id v5;

  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMenu:", 0);

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_handleGeminiViewTouch_);
  objc_msgSend(v5, "setMinimumPressDuration:", 0.001);
  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v5);

}

- (void)_assignActionToGeminiView
{
  void *v3;
  void *v4;
  int v5;

  -[CNContactHeaderView contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasBeenPersisted");

  if (v5)
    -[CNContactHeaderStaticDisplayView _geminiViewBehaviorForSavedContact](self, "_geminiViewBehaviorForSavedContact");
  else
    -[CNContactHeaderStaticDisplayView _geminiViewBehaviorForUnknownContact](self, "_geminiViewBehaviorForUnknownContact");
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

- (void)setDowntimeTextAttributes:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_downtimeTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_downtimeTextAttributes, a3);
    -[CNContactHeaderStaticDisplayView downtimeView](self, "downtimeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAb_textAttributes:", v6);

  }
}

- (void)updatePosterImageViewForScrollOffset:(CGPoint)a3
{
  double y;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  CGAffineTransform *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  _OWORD v23[3];
  _OWORD v24[2];
  __int128 v25;

  y = a3.y;
  if (-[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster", a3.x))
    -[CNContactHeaderView posterView](self, "posterView");
  else
    -[CNContactHeaderStaticDisplayView avatarBackgroundView](self, "avatarBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (y >= 0.0)
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v24[0] = *MEMORY[0x1E0C9BAA8];
    v13 = v24[0];
    v24[1] = v14;
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v12 = v25;
    objc_msgSend(v5, "setTransform:", v24);
    -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v23[0] = v13;
    v23[1] = v14;
    v23[2] = v12;
    v11 = (CGAffineTransform *)v23;
  }
  else
  {
    objc_msgSend(v5, "bounds");
    memset(&v22, 0, sizeof(v22));
    v8 = fmax(fabs(y) / v7 + 1.0, 1.0);
    CGAffineTransformMakeScale(&v22, v8, v8);
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, 0.0, y * 0.5);
    t1 = v22;
    memset(&v20, 0, sizeof(v20));
    t2 = v21;
    CGAffineTransformConcat(&v20, &t1, &t2);
    v17 = v20;
    objc_msgSend(v6, "setTransform:", &v17);
    v16 = v20;
    -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v15 = v16;
    v11 = &v15;
  }
  objc_msgSend(v9, "setTransform:", v11);

}

- (void)updateSensitiveContentBlurVisibility:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  CNSensitiveContentBlurView *v15;
  void *v16;
  CNSensitiveContentBlurView *v17;
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
  _QWORD v47[6];

  v47[4] = *MEMORY[0x1E0C80C00];
  -[CNContactHeaderStaticDisplayView configureSensitiveContentHelpButtonHidden:](self, "configureSensitiveContentHelpButtonHidden:", !a3);
  if (!a3)
  {
    -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[CNContactHeaderView setSensitiveContentBlurView:](self, "setSensitiveContentBlurView:", 0);
    return;
  }
  -[CNContactHeaderView contacts](self, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderStaticDisplayView sensitiveContentManager](self, "sensitiveContentManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldShowUIForPosterWithSensitiveContent:forContact:", 1, v6);

  -[CNContactHeaderView posterView](self, "posterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isHidden"))
  {

  }
  else
  {
    -[CNContactHeaderView posterView](self, "posterView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v8;
    else
      v13 = 0;
    if ((v13 & 1) != 0)
    {
      -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = [CNSensitiveContentBlurView alloc];
        -[CNContactHeaderStaticDisplayView sensitiveContentManager](self, "sensitiveContentManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[CNSensitiveContentBlurView initWithManager:](v15, "initWithManager:", v16);
        -[CNContactHeaderView setSensitiveContentBlurView:](self, "setSensitiveContentBlurView:", v17);

        -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setCanRevealContent:", 1);

        -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setDelegate:", self);

        -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderView nameLabel](self, "nameLabel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderStaticDisplayView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v21, v22);

        v37 = (void *)MEMORY[0x1E0CB3718];
        -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "topAnchor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderView posterView](self, "posterView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "topAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "constraintEqualToAnchor:", v43);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v42;
        -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "bottomAnchor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderView posterView](self, "posterView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "bottomAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "constraintEqualToAnchor:", v38);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v47[1] = v36;
        -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "trailingAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderView posterView](self, "posterView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "trailingAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "constraintEqualToAnchor:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v47[2] = v24;
        -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "leadingAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderView posterView](self, "posterView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "leadingAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v47[3] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "activateConstraints:", v30);

      }
      -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "resetRevealState");

      goto LABEL_13;
    }
  }
  -[CNContactHeaderView sensitiveContentBlurView](self, "sensitiveContentBlurView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "removeFromSuperview");

  -[CNContactHeaderView setSensitiveContentBlurView:](self, "setSensitiveContentBlurView:", 0);
LABEL_13:

}

- (void)setSensitiveContentHelpButton:(id)a3
{
  objc_storeStrong((id *)&self->_sensitiveContentHelpButton, a3);
}

- (void)configureSensitiveContentHelpButtonHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  CNSensitiveContentHelpButtonView *v9;
  void *v10;
  CNSensitiveContentHelpButtonView *v11;
  CNSensitiveContentHelpButtonView *sensitiveContentHelpButton;
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
  _QWORD v25[3];

  v3 = a3;
  v25[2] = *MEMORY[0x1E0C80C00];
  -[CNContactHeaderStaticDisplayView sensitiveContentManager](self, "sensitiveContentManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldShowUIForPosterWithSensitiveContent:forContact:", !v3, 0);

  -[CNContactHeaderStaticDisplayView sensitiveContentHelpButton](self, "sensitiveContentHelpButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {

    if (!v8)
    {
      v9 = [CNSensitiveContentHelpButtonView alloc];
      -[CNContactHeaderStaticDisplayView sensitiveContentManager](self, "sensitiveContentManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CNSensitiveContentHelpButtonView initWithManager:](v9, "initWithManager:", v10);
      sensitiveContentHelpButton = self->_sensitiveContentHelpButton;
      self->_sensitiveContentHelpButton = v11;

      -[CNSensitiveContentHelpButtonView setDelegate:](self->_sensitiveContentHelpButton, "setDelegate:", self);
      -[CNSensitiveContentHelpButtonView setTranslatesAutoresizingMaskIntoConstraints:](self->_sensitiveContentHelpButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    -[CNContactHeaderStaticDisplayView sensitiveContentHelpButton](self, "sensitiveContentHelpButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView addSubview:](self, "addSubview:", v13);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactHeaderStaticDisplayView sensitiveContentHelpButton](self, "sensitiveContentHelpButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView taglineLabel](self, "taglineLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -10.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    -[CNContactHeaderStaticDisplayView sensitiveContentHelpButton](self, "sensitiveContentHelpButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView centerXAnchor](self, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v23);

  }
  else
  {
    objc_msgSend(v7, "removeFromSuperview");

    -[CNContactHeaderStaticDisplayView setSensitiveContentHelpButton:](self, "setSensitiveContentHelpButton:", 0);
  }
}

- (CNSensitiveContentAnalysisManager)sensitiveContentManager
{
  return self->_sensitiveContentManager;
}

- (CNSensitiveContentHelpButtonView)sensitiveContentHelpButton
{
  return self->_sensitiveContentHelpButton;
}

+ (id)contactHeaderViewWithContact:(id)a3 allowsPhotoDrops:(BOOL)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v19;
  uint64_t v20;
  void *v21;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a7;
  objc_msgSend((id)sStaticDisplayContactHeaderView, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

LABEL_4:
    v15 = objc_alloc((Class)a1);
    v16 = (id)objc_msgSend(v15, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", v12, v10, v9, v8, v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    goto LABEL_5;
  }
  if (objc_msgSend((id)sStaticDisplayContactHeaderView, "showMonogramsOnly") != v8)
    goto LABEL_4;
  if (sStaticDisplayContactHeaderView)
  {
    v17 = (id)sStaticDisplayContactHeaderView;
    objc_msgSend(v17, "setDelegate:", v13);
    objc_msgSend(v17, "prepareForReuse");
    objc_msgSend(v17, "updateForShowingNavBar:", v9);
    objc_msgSend(v17, "updateWithNewContact:", v12);
    goto LABEL_6;
  }
  v19 = objc_alloc((Class)a1);
  v20 = objc_msgSend(v19, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", v12, v10, v9, v8, v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v21 = (void *)sStaticDisplayContactHeaderView;
  sStaticDisplayContactHeaderView = v20;

  v16 = (id)sStaticDisplayContactHeaderView;
LABEL_5:
  v17 = v16;
LABEL_6:

  return v17;
}

+ (id)descriptorForRequiredKeysForContactFormatter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CNContactHeaderStaticDisplayView;
  objc_msgSendSuper2(&v13, sel_descriptorForRequiredKeys);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "descriptorForRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  v9 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactHeaderStaticDisplayView descriptorForRequiredKeysForContactFormatter:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptorWithKeyDescriptors:description:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)_colorCachingEnabledForProcess
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CNContactHeaderStaticDisplayView__colorCachingEnabledForProcess__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_colorCachingEnabledForProcess_cn_once_token_9 != -1)
    dispatch_once(&_colorCachingEnabledForProcess_cn_once_token_9, block);
  return objc_msgSend((id)_colorCachingEnabledForProcess_cn_once_object_9, "BOOLValue");
}

+ (BOOL)_bundleIDIsInAllowListForColorCaching
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E20D3760, "containsObject:", v3);

  return v4;
}

+ (id)blurGradient
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CNContactHeaderStaticDisplayView_blurGradient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blurGradient_cn_once_token_19 != -1)
    dispatch_once(&blurGradient_cn_once_token_19, block);
  return (id)blurGradient_cn_once_object_19;
}

+ (id)makeBlurGradient
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[5];
  CGSize v37;

  v36[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CD2790]);
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, 1.0, 500.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36[0] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36[1] = objc_msgSend(v6, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.1);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36[2] = objc_msgSend(v8, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 1.0);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36[3] = objc_msgSend(v10, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setColors:", v11);

  objc_msgSend(v2, "setLocations:", &unk_1E20D3778);
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v15 = v14;

  v16 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(v2, "bounds");
  v19 = (void *)objc_msgSend(v16, "initWithSize:", v17, v18);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __52__CNContactHeaderStaticDisplayView_makeBlurGradient__block_invoke;
  v30[3] = &unk_1E2049178;
  v20 = v2;
  v31 = v20;
  objc_msgSend(v19, "imageWithActions:", v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timestamp");
  v25 = v24;

  CNUILogPosters();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v21, "size");
    NSStringFromCGSize(v37);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v25 - v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v28;
    v34 = 2112;
    v35 = v29;
    _os_log_debug_impl(&dword_18AC56000, v26, OS_LOG_TYPE_DEBUG, "Time to draw %@ variable blur image: %@", buf, 0x16u);

  }
  return v21;
}

uint64_t __52__CNContactHeaderStaticDisplayView_makeBlurGradient__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderInContext:", objc_msgSend(a2, "CGContext"));
}

void __48__CNContactHeaderStaticDisplayView_blurGradient__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeBlurGradient");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)blurGradient_cn_once_object_19;
  blurGradient_cn_once_object_19 = v1;

}

void __66__CNContactHeaderStaticDisplayView__colorCachingEnabledForProcess__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_bundleIDIsInAllowListForColorCaching"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_colorCachingEnabledForProcess_cn_once_object_9;
  _colorCachingEnabledForProcess_cn_once_object_9 = v1;

}

- (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CNContactHeaderStaticDisplayView contactFormatter](self, "contactFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorForRequiredKeysForContactFormatter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNContactHeaderStaticDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7
{
  return -[CNContactHeaderStaticDisplayView initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](self, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", a3, 1, a5, a6, a7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)didFinishUsing
{
  if ((CNContactHeaderStaticDisplayView *)sStaticDisplayContactHeaderView == self)
  {
    sStaticDisplayContactHeaderView = 0;

  }
}

- (void)updateImageViewVisiblity
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  -[CNContactHeaderStaticDisplayView _updatePhotoView](self, "_updatePhotoView");
  -[CNContactHeaderStaticDisplayView updateAvatarBackgroundViewVisibility](self, "updateAvatarBackgroundViewVisibility");
  v3 = -[CNContactHeaderStaticDisplayView shouldShowPoster](self, "shouldShowPoster") ^ 1;
  -[CNContactHeaderStaticDisplayView setPosterViewHidden:](self, "setPosterViewHidden:", v3);
  if ((v3 & 1) == 0)
  {
    -[CNContactHeaderView posterView](self, "posterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNContactHeaderView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        -[CNContactHeaderView delegate](self, "delegate");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderView posterView](self, "posterView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "headerView:didSetBackgroundAsPosterSnapshotImage:", self, v9);

      }
    }
    else
    {
      -[CNContactHeaderStaticDisplayView updatePosterViewImage](self, "updatePosterViewImage");
    }
  }
}

- (void)assignSnapshotImageToPosterView:(id)a3 configuration:(id)a4 contentIsSensitive:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__CNContactHeaderStaticDisplayView_assignSnapshotImageToPosterView_configuration_contentIsSensitive___block_invoke;
  v13[3] = &unk_1E2049108;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v16 = a5;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)updateLabelColorsForPosterSnapshot:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CNContactHeaderStaticDisplayView_updateLabelColorsForPosterSnapshot___block_invoke;
  v7[3] = &unk_1E2050400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (CGRect)layerContentsRectForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  CNPhotosPosterConfigurationReader *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C97408], "wallpaperTypeFromConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNIncomingCallSnapshotViewController horizontalNameLabelBoundingRectForName:window:](CNIncomingCallSnapshotViewController, "horizontalNameLabelBoundingRectForName:window:", &stru_1E20507A8, v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = (v8 + v10) * 0.125 / v12;

  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C97190]))
  {
    v14 = -[CNPhotosPosterConfigurationReader initWithPosterConfiguration:]([CNPhotosPosterConfigurationReader alloc], "initWithPosterConfiguration:", v4);
    if (-[CNPhotosPosterConfigurationReader hasFaceRectInPosterSnapshot](v14, "hasFaceRectInPosterSnapshot"))
    {
      -[CNPhotosPosterConfigurationReader faceRectInPosterSnapshotPercentFromTop](v14, "faceRectInPosterSnapshotPercentFromTop");
      v13 = v15 + -0.35;
    }
    v16 = 1.0;

    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C97180]) & 1) == 0)
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C97188]))
    {
      v13 = -v13;
      v16 = 1.0;
    }
    else
    {
      v16 = 1.0;
      v13 = 0.0;
    }
LABEL_10:
    v17 = 1.0;
    goto LABEL_11;
  }
  v16 = 1.0;
  v17 = 0.65;
  v13 = 0.12;
LABEL_11:

  v18 = 0.0;
  v19 = v13;
  v20 = v16;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)imageDataForColorFetchingIsImageDataOrThumbnail:(BOOL *)a3 bitmapFormat:(id *)a4
{
  void *MmappedBitmapContext;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  CGImage *v18;
  size_t Width;
  CGFloat Height;
  void *v21;
  void *v22;
  void *Data;
  size_t BytesPerRow;
  size_t v25;
  NSObject *v26;
  void *v27;
  CGRect v29;

  MmappedBitmapContext = self;
  -[CNContactHeaderView contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isKeyAvailable:", *MEMORY[0x1E0C96890]))
  {
    v9 = *MEMORY[0x1E0D13818];
    objc_msgSend(v8, "thumbnailImageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v8, "thumbnailImageData");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  if (objc_msgSend(v8, "isKeyAvailable:", *MEMORY[0x1E0C96708]))
  {
    objc_msgSend(v8, "imageData");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v22 = (void *)v11;
    objc_msgSend(MmappedBitmapContext, "dataForBackgroundColorService:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(MmappedBitmapContext) = 1;
    goto LABEL_12;
  }
  objc_msgSend(MmappedBitmapContext, "photoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "avatarView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "displayedImageState");

  if (v14 != 2)
  {
    v27 = 0;
    LOBYTE(MmappedBitmapContext) = 1;
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend(MmappedBitmapContext, "photoView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "avatarView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentImage");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (CGImage *)objc_msgSend(v17, "CGImage");

  Width = CGImageGetWidth(v18);
  Height = (double)CGImageGetHeight(v18);
  CGImageGetBitsPerComponent(v18);
  MmappedBitmapContext = (void *)CNImageUtilsCreateMmappedBitmapContext();
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = (double)Width;
  v29.size.height = Height;
  CGContextDrawImage((CGContextRef)MmappedBitmapContext, v29, v18);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97328]), "initWithBitmapContext:", MmappedBitmapContext);
  v22 = v21;
  if (a4)
    *a4 = objc_retainAutorelease(v21);
  Data = CGBitmapContextGetData((CGContextRef)MmappedBitmapContext);
  BytesPerRow = CGBitmapContextGetBytesPerRow((CGContextRef)MmappedBitmapContext);
  v25 = CGBitmapContextGetHeight((CGContextRef)MmappedBitmapContext) * BytesPerRow;
  dispatch_get_global_queue(0, 0);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = dispatch_data_create(Data, v25, v26, (dispatch_block_t)*MEMORY[0x1E0C80CE8]);

  if (MmappedBitmapContext)
  {
    CFRelease(MmappedBitmapContext);
    LOBYTE(MmappedBitmapContext) = 0;
  }
LABEL_12:

  if (a3)
LABEL_13:
    *a3 = (char)MmappedBitmapContext;
LABEL_14:

  return v27;
}

- (void)createGeminiViewIfNeeded
{
  CNContactGeminiView *v3;
  CNContactGeminiView *v4;
  CNContactGeminiView *geminiView;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (!self->_geminiView)
  {
    v3 = [CNContactGeminiView alloc];
    v4 = -[CNContactGeminiView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    geminiView = self->_geminiView;
    self->_geminiView = v4;

    -[CNContactGeminiView setTranslatesAutoresizingMaskIntoConstraints:](self->_geminiView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactGeminiView setUserInteractionEnabled:](self->_geminiView, "setUserInteractionEnabled:", 1);
    -[CNContactHeaderStaticDisplayView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView setHighlightedColor:](self->_geminiView, "setHighlightedColor:", v6);

    +[CNUIColorRepository contactCardStaticHeaderGeminiTextColor](CNUIColorRepository, "contactCardStaticHeaderGeminiTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView setBackgroundColor:](self->_geminiView, "setBackgroundColor:", v7);

    v12[0] = *MEMORY[0x1E0DC4B10];
    v8 = *MEMORY[0x1E0DC1140];
    v11[0] = CFSTR("ABTextStyleAttributeName");
    v11[1] = v8;
    +[CNUIColorRepository contactCardStaticHeaderGeminiTextColor](CNUIColorRepository, "contactCardStaticHeaderGeminiTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView setGeminiTextAttributes:](self, "setGeminiTextAttributes:", v10);

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

- (double)avatarHeightPhoneLandscape
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
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;

  -[CNContactHeaderStaticDisplayView frame](self, "frame");
  v4 = v3;
  if (v3 == 0.0)
  {
    -[CNContactHeaderStaticDisplayView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNContactHeaderStaticDisplayView superview](self, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v4 = v7;

    }
  }
  if (v4 == 0.0)
    return 0.0;
  -[CNContactHeaderStaticDisplayView layoutMargins](self, "layoutMargins");
  v9 = v8;
  -[CNContactHeaderStaticDisplayView layoutMargins](self, "layoutMargins");
  v11 = v4 - (v9 + v10);
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", v11, 3.40282347e38);
  v14 = v13;

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lineHeight");
  v18 = ceil(v17);

  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v14 <= v18)
    objc_msgSend(v19, "photoMaxHeightPhoneLandscape");
  else
    objc_msgSend(v19, "photoMinHeight");
  v22 = v21;

  return v22;
}

- (void)disablePhotoTapGesture
{
  id v2;

  -[CNContactHeaderView photoView](self, "photoView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disablePhotoTapGesture");

}

- (void)didTapSensitiveContentHelpButton
{
  id v3;

  -[CNContactHeaderView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView:didUpdateSensitiveContentOverride:", self, 0);

}

- (void)setUsesBrandedCallFormat:(BOOL)a3
{
  if (self->_usesBrandedCallFormat != a3)
  {
    self->_usesBrandedCallFormat = a3;
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
  }
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

- (void)handleNameLabelTap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  v10 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v10;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    if (objc_msgSend(v6, "state") == 3)
    {
      -[CNContactHeaderView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[CNContactHeaderView delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "headerViewDidTapNameLabel:", self);

      }
    }
  }

}

- (void)handleNameLabelLongPress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;

  v4 = a3;
  objc_opt_class();
  v29 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v29;
  else
    v5 = 0;
  v6 = v5;

  if (v6
    && objc_msgSend(v6, "state") == 1
    && -[CNContactHeaderStaticDisplayView becomeFirstResponder](self, "becomeFirstResponder"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v18, "numberOfLines"), v11, v13, v15, v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showMenuFromView:rect:", v27, v20, v22, v24, v26);

    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHighlighted:", 1);

  }
}

- (void)menuWillHide:(id)a3
{
  id v3;

  -[CNContactHeaderView nameLabel](self, "nameLabel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", 0);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = -[CNContactHeaderView isAXSize](self, "isAXSize", a3);
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v4)
    v6 = 0;
  else
    v6 = 2;
  objc_msgSend(v5, "setNumberOfLines:", v6);

}

- (void)_geminiViewBehaviorForUnknownContact
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 7);

  if (v5)
  {
    -[CNContactHeaderStaticDisplayView _unknownContactActionForGeminiView](self, "_unknownContactActionForGeminiView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E20507A8, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMenu:", v6);

    -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowsMenuAsPrimaryAction:", 1);

  }
}

- (id)_unknownContactActionForGeminiView
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD aBlock[5];
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[CNContactHeaderStaticDisplayView geminiResult](self, "geminiResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableChannels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v5);
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__CNContactHeaderStaticDisplayView__unknownContactActionForGeminiView__block_invoke;
        aBlock[3] = &unk_1E20490B8;
        objc_copyWeak(&v25, &location);
        aBlock[4] = v6;
        v7 = _Block_copy(aBlock);
        v8 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v6, "localizedLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "senderIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderStaticDisplayView geminiResult](self, "geminiResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "channel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "senderIdentity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setState:", v11 == v14);

        -[CNContactHeaderStaticDisplayView geminiIconProvider](self, "geminiIconProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "channelIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "geminiIconForGeminiChannelIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setImage:", v17);

        objc_msgSend(v22, "addObject:", v10);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
        ++v5;
      }
      while (v23 != v5);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v23);
  }

  v18 = (void *)objc_msgSend(v22, "copy");
  return v18;
}

- (void)geminiViewDidPickPreferredChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsCalculateLayout");

  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calculateLayoutIfNeeded");

  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
  -[CNContactHeaderStaticDisplayView setNeedsLayout](self, "setNeedsLayout");
  -[CNContactHeaderView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerViewDidPickPreferredChannel:", v4);

}

- (void)handleGeminiViewTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  CNGeminiPickerController *v20;
  void *v21;
  CNGeminiPickerController *v22;
  void *v23;
  id v24;
  CGPoint v25;
  CGRect v26;

  v4 = a3;
  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v25.x = v7;
  v25.y = v9;
  v11 = CGRectContainsPoint(v26, v25);

  v12 = objc_msgSend(v4, "state");
  switch(v12)
  {
    case 4:
LABEL_12:
      -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v16;
      v17 = 0;
      goto LABEL_13;
    case 3:
      if ((_DWORD)v11)
      {
        -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "allowsPickerActions");

        if (v19)
        {
          v20 = [CNGeminiPickerController alloc];
          -[CNContactHeaderStaticDisplayView geminiResult](self, "geminiResult");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[CNGeminiPickerController initWithGeminiResult:](v20, "initWithGeminiResult:", v21);

          -[CNContactHeaderStaticDisplayView setGeminiPicker:](self, "setGeminiPicker:", v22);
          -[CNGeminiPickerController setDelegate:](v22, "setDelegate:", self);
          -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "sender:presentViewController:", self, v22);

        }
      }
      goto LABEL_12;
    case 2:
      if ((_DWORD)v11)
      {
        -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v13, "allowsPickerActions");

      }
      -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isHighlighted");

      if ((_DWORD)v11 != v15)
      {
        -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v16;
        v17 = v11;
LABEL_13:
        objc_msgSend(v16, "setHighlighted:", v17);

      }
      break;
  }
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsCalculateLayout");

  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calculateLayoutIfNeeded");

  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
  -[CNContactHeaderStaticDisplayView setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0C97310], "channelStringFromSenderIdentity:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "headerViewDidPickPreferredChannel:", v13);

  -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sender:dismissViewController:", self, v7);

  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighlighted:", 0);

  -[CNContactHeaderStaticDisplayView setGeminiPicker:](self, "setGeminiPicker:", 0);
}

- (void)pickerDidCancel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender:dismissViewController:", self, v4);

  -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlighted:", 0);

  -[CNContactHeaderStaticDisplayView setGeminiPicker:](self, "setGeminiPicker:", 0);
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  -[CNContactHeaderStaticDisplayView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
  {
    -[CNContactHeaderView contacts](self, "contacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasBeenPersisted");

    if ((v11 & 1) == 0)
    {
      -[CNContactHeaderStaticDisplayView geminiView](self, "geminiView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contextMenuInteraction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dismissMenu");

      -[CNContactHeaderStaticDisplayView geminiIconProvider](self, "geminiIconProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateGeminiIcons");

      -[CNContactHeaderStaticDisplayView _geminiViewBehaviorForUnknownContact](self, "_geminiViewBehaviorForUnknownContact");
    }
    -[CNContactHeaderStaticDisplayView updateAvatarBackgroundViewVisibility](self, "updateAvatarBackgroundViewVisibility");
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNContactHeaderStaticDisplayView traitChangeRegistration](self, "traitChangeRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderStaticDisplayView unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v3);

  v4.receiver = self;
  v4.super_class = (Class)CNContactHeaderStaticDisplayView;
  -[CNContactHeaderView dealloc](&v4, sel_dealloc);
}

- (void)sensitiveContentBlurView:(id)a3 wantsToPresentInterventionController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sender:presentViewController:", self, v5);

}

- (void)sensitiveContentBlurView:(id)a3 didSetContentHidden:(BOOL)a4
{
  -[CNContactHeaderStaticDisplayView notifyDelegateOfUpdatedHiddenSensitiveContent:](self, "notifyDelegateOfUpdatedHiddenSensitiveContent:", a4);
}

- (void)sensitiveContentHelpButtonView:(id)a3 didSetContentHidden:(BOOL)a4
{
  -[CNContactHeaderStaticDisplayView notifyDelegateOfUpdatedHiddenSensitiveContent:](self, "notifyDelegateOfUpdatedHiddenSensitiveContent:", a4);
}

- (void)sensitiveContentHelpButtonView:(id)a3 didRequestToPresentMenu:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sender:presentViewController:", self, v5);

}

- (BOOL)canSensitiveContentHelpButtonViewHidePhoto:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[CNContactHeaderView contacts](self, "contacts", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "overrideSensitiveContent");

  return v5;
}

- (BOOL)canSensitiveContentHelpButtonBlockContact:(id)a3
{
  CNContactHeaderStaticDisplayView *v3;
  void *v4;

  v3 = self;
  -[CNContactHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isHeaderViewContactBlocked:", v3);

  return (char)v3;
}

- (void)sensitiveContentHelpButtonView:(id)a3 didRequestToPresentMoreHelp:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sender:presentViewController:", self, v5);

}

- (void)notifyDelegateOfUpdatedHiddenSensitiveContent:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  v4 = !a3;
  -[CNContactHeaderView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerView:didUpdateSensitiveContentOverride:", self, v4);

}

- (void)sensitiveContentHelpButtonView:(id)a3 didRequestToBlockContact:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[CNContactHeaderView delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerView:didRequestToBlockContact:", self, v4);

}

- (NSDictionary)taglineTextAttributes
{
  return self->_taglineTextAttributes;
}

- (void)setTaglineTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (UIView)personHeaderView
{
  return self->_personHeaderView;
}

- (void)setPersonHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_personHeaderView, a3);
}

- (void)setTaglineLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 688);
}

- (void)setImportantLabel:(id)a3
{
  objc_storeStrong((id *)&self->_importantLabel, a3);
}

- (void)setDowntimeView:(id)a3
{
  objc_storeStrong((id *)&self->_downtimeView, a3);
}

- (NSString)currentlyDisplayedPosterContactIdentifier
{
  return self->_currentlyDisplayedPosterContactIdentifier;
}

- (void)setCurrentlyDisplayedPosterContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyDisplayedPosterContactIdentifier, a3);
}

- (CNPRSPosterConfiguration)cachedPosterConfiguration
{
  return self->_cachedPosterConfiguration;
}

- (void)setCachedPosterConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPosterConfiguration, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return (UITraitChangeRegistration *)objc_getProperty(self, a2, 768, 1);
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (void)setGeminiView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 776);
}

- (CNGeminiResult)geminiResult
{
  return (CNGeminiResult *)objc_getProperty(self, a2, 784, 1);
}

- (void)setGeminiPicker:(id)a3
{
  objc_storeStrong((id *)&self->_geminiPicker, a3);
}

- (CNMetricsUIReporter)metricsReporter
{
  return self->_metricsReporter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveContentManager, 0);
  objc_storeStrong((id *)&self->_metricsReporter, 0);
  objc_storeStrong((id *)&self->_geminiIconProvider, 0);
  objc_storeStrong((id *)&self->_geminiPicker, 0);
  objc_storeStrong((id *)&self->_geminiResult, 0);
  objc_storeStrong((id *)&self->_geminiView, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_cachedPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_currentlyDisplayedPosterContactIdentifier, 0);
  objc_storeStrong((id *)&self->_sensitiveContentHelpButton, 0);
  objc_storeStrong((id *)&self->_avatarBackgroundGradientLayer, 0);
  objc_storeStrong((id *)&self->_avatarBackgroundView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_downtimeView, 0);
  objc_storeStrong((id *)&self->_importantLabel, 0);
  objc_storeStrong((id *)&self->_taglineLabel, 0);
  objc_storeStrong((id *)&self->_personHeaderView, 0);
  objc_storeStrong((id *)&self->_actionsWrapperView, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_importantTextAttributes, 0);
  objc_storeStrong((id *)&self->_taglineTextAttributes, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_lastBackgroundColorsContactIdentifier, 0);
  objc_storeStrong((id *)&self->_lastBackgroundColors, 0);
  objc_storeStrong((id *)&self->_geminiTextAttributes, 0);
  objc_storeStrong((id *)&self->_downtimeTextAttributes, 0);
}

void __70__CNContactHeaderStaticDisplayView__unknownContactActionForGeminiView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "metricsReporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "geminiResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logUnknownContactGeminiViewDifferentChannelSelected:", objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1);

  objc_msgSend(*(id *)(a1 + 32), "senderIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97310], "channelStringFromSenderIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "geminiViewDidPickPreferredChannel:", v6);

}

uint64_t __55__CNContactHeaderStaticDisplayView_updateGeminiResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
}

id __53__CNContactHeaderStaticDisplayView_updateConstraints__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "leadingAnchor");
  v20 = a1;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutMarginsGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(v5, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutMarginsGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(v5, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v23[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v20 + 40), "addObjectsFromArray:", v15);
  LODWORD(v16) = 1148846080;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 1, v16);
  LODWORD(v17) = 1148846080;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 1, v17);
  objc_msgSend(v5, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLabelColorsForImageColors:", *(_QWORD *)(a1 + 40));
}

void __71__CNContactHeaderStaticDisplayView_updateLabelColorsForPosterSnapshot___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D13CD8], "colorsForUIImage:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateLabelColorsForImageColors:", v2);

}

void __101__CNContactHeaderStaticDisplayView_assignSnapshotImageToPosterView_configuration_contentIsSensitive___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "posterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentMode:", 2);

  objc_msgSend(*(id *)(a1 + 32), "posterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  objc_msgSend(*(id *)(a1 + 32), "layerContentsRectForConfiguration:", *(_QWORD *)(a1 + 40));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "posterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentsRect:", v5, v7, v9, v11);

  v14 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "posterView");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v15, "setImage:", v14);

  objc_msgSend(*(id *)(a1 + 32), "updateSensitiveContentBlurVisibility:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "headerView:didSetBackgroundAsPosterSnapshotImage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

void __57__CNContactHeaderStaticDisplayView_updatePosterViewImage__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v4, "snapshotBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "levelSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotForLevelSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "wallpaper");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject assignSnapshotImageToPosterView:configuration:contentIsSensitive:](WeakRetained, "assignSnapshotImageToPosterView:configuration:contentIsSensitive:", v9, v10, objc_msgSend(v11, "contentIsSensitive"));

      -[NSObject updateLabelColorsForPosterSnapshot:](WeakRetained, "updateLabelColorsForPosterSnapshot:", v9);
    }
    else
    {
      CNUILogPosters();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "Snapshot result returned a nil image", buf, 2u);
      }

    }
  }
  else
  {
    CNUILogPosters();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_18AC56000, WeakRetained, OS_LOG_TYPE_ERROR, "Snapshot request returned no result", v13, 2u);
    }
  }

}

@end
