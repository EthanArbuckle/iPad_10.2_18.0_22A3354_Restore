@implementation AXAssistiveTouchLayoutView

+ (double)defaultSideLength
{
  int IsPad;
  double result;

  IsPad = AXDeviceIsPad();
  result = 295.0;
  if (IsPad)
    return 390.0;
  return result;
}

+ (double)minimumOuterPadding
{
  return 10.0;
}

+ (double)layoutViewSideLengthScaledFromDefaultLength:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(a1, "labelMinimumContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "labelMaximumContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_preferredContentSizeCategoryCappedByMinimumContentSizeCategory:maximumContentSizeCategory:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_layoutViewSideLengthScaledFromDefaultLength:labelContentSizeCategory:", v7, a3);
  v9 = v8;

  return v9;
}

+ (double)_layoutViewSideLengthScaledFromDefaultLength:(double)a3 labelContentSizeCategory:(id)a4
{
  NSString *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSString *v11;
  NSComparisonResult v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  v6 = (NSString *)a4;
  objc_msgSend(a1, "fontMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledValueForValue:compatibleWithTraitCollection:", v8, a3);
  v10 = v9;

  objc_msgSend(a1, "_imageMaximumContentSizeCategoryIndependentOfLabel");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = UIContentSizeCategoryCompareToCategory(v6, v11);

  if (v12 == NSOrderedDescending)
  {
    objc_msgSend(a1, "fontMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scaledValueForValue:compatibleWithTraitCollection:", v14, a3);
    v16 = v15;

    v10 = v16 + (v10 - v16) / 3.0;
  }

  return v10;
}

+ (UIFontMetrics)fontMetrics
{
  return (UIFontMetrics *)objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
}

+ (NSString)labelMinimumContentSizeCategory
{
  return (NSString *)(id)*MEMORY[0x1E0DC4918];
}

+ (NSString)labelMaximumContentSizeCategory
{
  id v3;
  double Width;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  NSObject *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[9];
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (id)*MEMORY[0x1E0DC4938];
  AXDeviceGetMainScreenBounds();
  Width = CGRectGetWidth(v32);
  if (Width > 0.0)
  {
    v5 = Width;
    objc_msgSend(a1, "minimumOuterPadding");
    v7 = (void *)labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory;
    if (!labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory)
    {
      v8 = v6;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = (void *)*MEMORY[0x1E0DC4918];
      v10 = *MEMORY[0x1E0DC4900];
      v29[0] = *MEMORY[0x1E0DC4918];
      v29[1] = v10;
      v11 = *MEMORY[0x1E0DC48F0];
      v29[2] = *MEMORY[0x1E0DC48F8];
      v29[3] = v11;
      v12 = *MEMORY[0x1E0DC48D0];
      v29[4] = *MEMORY[0x1E0DC48D8];
      v29[5] = v12;
      v13 = *MEMORY[0x1E0DC48C0];
      v29[6] = *MEMORY[0x1E0DC48C8];
      v29[7] = v13;
      v29[8] = *MEMORY[0x1E0DC48B8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v15)
      {
        v16 = v15;
        v17 = v5 + v8 * -2.0;
        v18 = *(_QWORD *)v26;
LABEL_5:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
          objc_msgSend(a1, "defaultSideLength");
          objc_msgSend(a1, "_layoutViewSideLengthScaledFromDefaultLength:labelContentSizeCategory:", v20);
          if (v21 > v17)
            break;
          objc_storeStrong((id *)&labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory, v20);
          if (v16 == ++v19)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
            if (v16)
              goto LABEL_5;
            break;
          }
        }
      }

      v7 = (void *)labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory;
      if (!labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory)
      {
        ASTLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          +[AXAssistiveTouchLayoutView labelMaximumContentSizeCategory].cold.1(v22, v5);

        objc_storeStrong((id *)&labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory, v9);
        v7 = (void *)labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory;
      }
    }
    v23 = v7;

    v3 = v23;
  }
  return (NSString *)v3;
}

+ (NSString)imageMinimumContentSizeCategory
{
  return (NSString *)(id)*MEMORY[0x1E0DC4918];
}

+ (NSString)imageMaximumContentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "labelMaximumContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageMaximumContentSizeCategoryIndependentOfLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXUIContentSizeCategoryMin(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (id)_imageMaximumContentSizeCategoryIndependentOfLabel
{
  return (id)*MEMORY[0x1E0DC48F0];
}

+ (id)_preferredContentSizeCategoryCappedByMinimumContentSizeCategory:(id)a3 maximumContentSizeCategory:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0DC3470];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AXUIContentSizeCategoryMax(v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  AXUIContentSizeCategoryMin(v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_traitCollectionForMinimumContentSizeCategory:(id)a3 maximumContentSizeCategory:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(a1, "_preferredContentSizeCategoryCappedByMinimumContentSizeCategory:maximumContentSizeCategory:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollectionWithPreferredContentSizeCategory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (UITraitCollection)traitCollectionForLabelPreferredContentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "labelMinimumContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "labelMaximumContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_traitCollectionForMinimumContentSizeCategory:maximumContentSizeCategory:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v5;
}

+ (UITraitCollection)traitCollectionForImagePreferredContentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "imageMinimumContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageMaximumContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_traitCollectionForMinimumContentSizeCategory:maximumContentSizeCategory:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v5;
}

+ (UIFont)labelFont
{
  _BOOL4 IsBoldTextEnabled;
  void *v4;
  int IsPad;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v4 = (void *)MEMORY[0x1E0DC37E8];
  IsPad = AXDeviceIsPad();
  v6 = 14.0;
  if (IsPad)
    v6 = 16.0;
  if (IsBoldTextEnabled)
    objc_msgSend(v4, "systemFontOfSize:", v6);
  else
    objc_msgSend(v4, "_lightSystemFontOfSize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fontMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "traitCollectionForLabelPreferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scaledFontForFont:compatibleWithTraitCollection:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v10;
}

- (void)layoutItemsByLocation:(id)a3 hasBackButton:(BOOL)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void **v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  void *v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[2];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[2];
  uint64_t v71;
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v45 = a4;
  v77 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  objc_msgSend(v55, "count");
  v4 = AXAssistiveTouchNamedLayout();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  AXAssistiveTouchLocationsForLayout();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB3B18];
        AXAssitiveTouchPosition();
        objc_msgSend(v12, "valueWithCGPoint:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
    }
    while (v8);
  }

  v58 = (void *)*MEMORY[0x1E0CF4A00];
  v15 = *MEMORY[0x1E0CF4A00];
  v74[0] = *MEMORY[0x1E0CF49F8];
  v14 = (void *)v74[0];
  v74[1] = v15;
  v75 = (void *)*MEMORY[0x1E0CF4A08];
  v16 = v75;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v16;
  v57 = v14;
  if ((unint64_t)(v4 - 5) <= 1)
  {
    v73[0] = v14;
    v73[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  v20 = (void *)*MEMORY[0x1E0CF49F0];
  v72[0] = *MEMORY[0x1E0CF49E0];
  v19 = (void *)v72[0];
  v72[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
  v21 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)*MEMORY[0x1E0CF49D0];
  v70[0] = *MEMORY[0x1E0CF49C8];
  v22 = v70[0];
  v70[1] = v23;
  v71 = *MEMORY[0x1E0CF49D8];
  v24 = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
  v25 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v21;
  v53 = v17;
  v69[0] = v17;
  v69[1] = v21;
  v49 = (void *)v25;
  v69[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v57;
  v68[1] = v19;
  v68[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v58;
  v67[0] = v58;
  v67[1] = v23;
  v46 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v56;
  v66[1] = v20;
  v29 = v20;
  v66[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
  v30 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v26;
  v65[0] = v26;
  v65[1] = v28;
  v48 = (void *)v30;
  v65[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if ((unint64_t)(v4 - 3) > 1)
  {
    v37 = v19;
    if ((unint64_t)(v4 - 5) > 1)
    {
      v40 = 0;
      v41 = v53;
      v27 = v58;
      v36 = v46;
      goto LABEL_16;
    }
    v47 = (void *)v31;
    v33 = v28;
    v38 = v57;
    v27 = v58;
    v63 = v58;
    v34 = &v63;
    v39 = v53;
    v36 = v46;
    v35 = v56;
  }
  else
  {
    v47 = (void *)v31;
    v33 = v28;
    v64 = v58;
    v34 = &v64;
    v35 = v20;
    v37 = v19;
    v36 = v46;
    v38 = v19;
    v39 = v53;
  }
  v34[1] = v27;
  v34[2] = v35;
  v34[3] = v29;
  v34[4] = v36;
  v34[5] = v36;
  v34[6] = v37;
  v34[7] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v39;
  v28 = v33;
  v32 = v47;
LABEL_16:
  v42 = 0;
  switch(v4)
  {
    case 1:
      v43 = (void *)*MEMORY[0x1E0CF49E8];
      if (v45)
        v43 = v36;
      v42 = v43;
      goto LABEL_25;
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
      v42 = v27;
      goto LABEL_18;
    case 7:
      v42 = v36;
      goto LABEL_24;
    default:
LABEL_18:
      if (v4 != 7)
        goto LABEL_25;
LABEL_24:
      v44 = v36;

      v42 = v44;
LABEL_25:
      -[AXAssistiveTouchLayoutView layoutItemsByLocation:positions:rows:columns:clockwiseOctagonalLocations:horizontallyCenteredLocation:](self, "layoutItemsByLocation:positions:rows:columns:clockwiseOctagonalLocations:horizontallyCenteredLocation:", v55, v5, v51, v32, v40, v42);

      return;
  }
}

- (void)layoutItemsByLocation:(id)a3 positions:(id)a4 rows:(id)a5 columns:(id)a6 clockwiseOctagonalLocations:(id)a7 horizontallyCenteredLocation:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
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
  id v32;

  v32 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  objc_msgSend(v32, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssistiveTouchLayoutView _enableAutoLayoutForAllItems:](self, "_enableAutoLayoutForAllItems:", v19);

  -[AXAssistiveTouchLayoutView itemConstraints](self, "itemConstraints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB3718];
    -[AXAssistiveTouchLayoutView itemConstraints](self, "itemConstraints");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deactivateConstraints:", v22);

    -[AXAssistiveTouchLayoutView setItemConstraints:](self, "setItemConstraints:", 0);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssistiveTouchLayoutView _setUpConstraintsForPreferredPositionsForItems:positions:](self, "_setUpConstraintsForPreferredPositionsForItems:positions:", v32, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "addObjectsFromArray:", v24);
  -[AXAssistiveTouchLayoutView _setUpConstraintsToAlignItems:rows:columns:](self, "_setUpConstraintsToAlignItems:rows:columns:", v32, v17, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObjectsFromArray:", v25);

  -[AXAssistiveTouchLayoutView _setUpConstraintsToAvoidCollisions:rows:columns:clockwiseOctagonalLocations:](self, "_setUpConstraintsToAvoidCollisions:rows:columns:clockwiseOctagonalLocations:", v32, v17, v16, v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "addObjectsFromArray:", v26);
  if (v14)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "centerXAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAssistiveTouchLayoutView centerXAnchor](self, "centerXAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v31);

    }
    else
    {
      _AXAssert();
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
  -[AXAssistiveTouchLayoutView setItemConstraints:](self, "setItemConstraints:", v23);

}

- (id)_setUpConstraintsForPreferredPositionsForItems:(id)a3 positions:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  AXAssistiveTouchLayoutView *v42;
  id v43;
  id v44;
  uint64_t v45;
  id obj;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[6];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44 = a4;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[AXAssistiveTouchLayoutView positioningLayoutGuides](self, "positioningLayoutGuides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v62;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v62 != v10)
          objc_enumerationMutation(v7);
        -[AXAssistiveTouchLayoutView removeLayoutGuide:](self, "removeLayoutGuide:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssistiveTouchLayoutView setPositioningLayoutGuides:](self, "setPositioningLayoutGuides:", v12);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v6;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v45)
  {
    v41 = *(_QWORD *)v58;
    v42 = self;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v58 != v41)
          objc_enumerationMutation(obj);
        v56 = v13;
        v14 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v13);
        v15 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
        -[AXAssistiveTouchLayoutView addLayoutGuide:](self, "addLayoutGuide:", v15);
        -[AXAssistiveTouchLayoutView positioningLayoutGuides](self, "positioningLayoutGuides");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v15);

        objc_msgSend(obj, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "CGPointValue");
        v20 = v19;
        v22 = v21;

        objc_msgSend(v15, "widthAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAssistiveTouchLayoutView widthAnchor](self, "widthAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:multiplier:", v24, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v26) = 1131937792;
        objc_msgSend(v25, "setPriority:", v26);
        objc_msgSend(v15, "heightAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAssistiveTouchLayoutView heightAnchor](self, "heightAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "constraintEqualToAnchor:multiplier:", v28, v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = v29;
        LODWORD(v30) = 1131937792;
        objc_msgSend(v29, "setPriority:", v30);
        objc_msgSend(v15, "topAnchor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAssistiveTouchLayoutView topAnchor](self, "topAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "constraintEqualToAnchor:", v54);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = v53;
        objc_msgSend(v15, "bottomAnchor");
        v49 = v17;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v17;
        objc_msgSend(v17, "imageView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "centerYAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "constraintEqualToAnchor:", v48);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v65[1] = v47;
        v65[2] = v29;
        objc_msgSend(v15, "leftAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAssistiveTouchLayoutView leftAnchor](self, "leftAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "constraintEqualToAnchor:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v65[3] = v34;
        objc_msgSend(v15, "rightAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "imageView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "centerXAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "constraintEqualToAnchor:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v65[4] = v38;
        v65[5] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 6);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObjectsFromArray:", v39);

        self = v42;
        v13 = v56 + 1;
      }
      while (v45 != v56 + 1);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v45);
  }

  return v43;
}

- (void)_enumerateListsOfLocations:(id)a3 items:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, uint64_t);
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, uint64_t))a5;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v7;
  v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (!v13)
        {
          v15 = 0;
          goto LABEL_22;
        }
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v12);
            objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            if (v18)
              v20 = v15 == 0;
            else
              v20 = 1;
            if (v20)
            {
              if (!v18)
                goto LABEL_18;
            }
            else
            {
              v9[2](v9, v15, v18);
            }
            v21 = v19;

            v15 = v21;
LABEL_18:

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v14);
LABEL_22:

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v24);
  }

}

- (id)_setUpConstraintsToAlignItems:(id)a3 rows:(id)a4 columns:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__AXAssistiveTouchLayoutView__setUpConstraintsToAlignItems_rows_columns___block_invoke;
  v21[3] = &unk_1E76ABEB8;
  v14 = v12;
  v22 = v14;
  -[AXAssistiveTouchLayoutView _enumerateListsOfLocations:items:withBlock:](self, "_enumerateListsOfLocations:items:withBlock:", v10, v11, v21);

  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __73__AXAssistiveTouchLayoutView__setUpConstraintsToAlignItems_rows_columns___block_invoke_2;
  v19[3] = &unk_1E76ABEB8;
  v15 = v14;
  v20 = v15;
  -[AXAssistiveTouchLayoutView _enumerateListsOfLocations:items:withBlock:](self, "_enumerateListsOfLocations:items:withBlock:", v9, v11, v19);

  v16 = v20;
  v17 = v15;

  return v17;
}

void __73__AXAssistiveTouchLayoutView__setUpConstraintsToAlignItems_rows_columns___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "imageView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

}

void __73__AXAssistiveTouchLayoutView__setUpConstraintsToAlignItems_rows_columns___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "imageView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

}

- (id)_setUpConstraintsToAvoidCollisions:(id)a3 rows:(id)a4 columns:(id)a5 clockwiseOctagonalLocations:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
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
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[4];
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v108 = a4;
  v107 = a5;
  v110 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v111 = v10;
  objc_msgSend(v10, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v121 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
        objc_msgSend(v17, "leadingAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAssistiveTouchLayoutView leadingAnchor](self, "leadingAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v19, 1.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v20);

        -[AXAssistiveTouchLayoutView trailingAnchor](self, "trailingAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "trailingAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v22, 1.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v23);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
    }
    while (v14);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  objc_msgSend(v111, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v117;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v117 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * j);
        objc_msgSend(v29, "topAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAssistiveTouchLayoutView topAnchor](self, "topAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v31, 1.0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v32);

        -[AXAssistiveTouchLayoutView bottomAnchor](self, "bottomAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "bottomAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v34, 1.0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v35);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
    }
    while (v26);
  }

  v36 = MEMORY[0x1E0C809B0];
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __106__AXAssistiveTouchLayoutView__setUpConstraintsToAvoidCollisions_rows_columns_clockwiseOctagonalLocations___block_invoke;
  v114[3] = &unk_1E76ABEB8;
  v37 = v11;
  v115 = v37;
  -[AXAssistiveTouchLayoutView _enumerateListsOfLocations:items:withBlock:](self, "_enumerateListsOfLocations:items:withBlock:", v108, v111, v114);
  v112[0] = v36;
  v112[1] = 3221225472;
  v112[2] = __106__AXAssistiveTouchLayoutView__setUpConstraintsToAvoidCollisions_rows_columns_clockwiseOctagonalLocations___block_invoke_2;
  v112[3] = &unk_1E76ABEB8;
  v109 = v37;
  v113 = v109;
  -[AXAssistiveTouchLayoutView _enumerateListsOfLocations:items:withBlock:](self, "_enumerateListsOfLocations:items:withBlock:", v107, v111, v112);
  v38 = v110;
  if (v110)
  {
    if (objc_msgSend(v110, "count") != 8)
      _AXAssert();
    objc_msgSend(v110, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", v39);
    v40 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "objectAtIndexedSubscript:", 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", v41);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "objectAtIndexedSubscript:", 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", v42);
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "objectAtIndexedSubscript:", 3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", v43);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "objectAtIndexedSubscript:", 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", v44);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "objectAtIndexedSubscript:", 5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", v45);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "objectAtIndexedSubscript:", 6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", v46);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "objectAtIndexedSubscript:", 7);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)v40;
    objc_msgSend(v111, "objectForKeyedSubscript:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v99 = v49;
    v100 = v48;
    if (v48 && v49)
    {
      objc_msgSend(v48, "label");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "leftAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "imageViewContainerView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "rightAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v127[0] = v53;
      objc_msgSend(v100, "label");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "bottomAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "label");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "topAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v127[1] = v58;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "addObjectsFromArray:", v59);

      v38 = v110;
    }
    if (v106 && v104)
    {
      objc_msgSend(v106, "label");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "rightAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "imageViewContainerView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "leftAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "constraintLessThanOrEqualToAnchor:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = v63;
      objc_msgSend(v106, "label");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "bottomAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "label");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "topAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintLessThanOrEqualToAnchor:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v126[1] = v68;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 2);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "addObjectsFromArray:", v69);

      v38 = v110;
    }
    if (v105 && v103)
    {
      objc_msgSend(v103, "label");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "rightAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "imageViewContainerView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "leftAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintLessThanOrEqualToAnchor:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v125[0] = v73;
      objc_msgSend(v103, "label");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "bottomAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "label");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "topAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "constraintLessThanOrEqualToAnchor:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v125[1] = v78;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 2);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "addObjectsFromArray:", v79);

      v38 = v110;
    }
    v81 = v101;
    v80 = v102;
    if (v101 && v102)
    {
      objc_msgSend(v102, "label");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "leftAnchor");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "imageViewContainerView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "rightAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "constraintGreaterThanOrEqualToAnchor:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v124[0] = v85;
      objc_msgSend(v102, "label");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "bottomAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "label");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "topAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "constraintLessThanOrEqualToAnchor:", v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v124[1] = v90;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 2);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "addObjectsFromArray:", v91);

      v81 = v101;
      v80 = v102;

      v38 = v110;
    }

  }
  v92 = v113;
  v93 = v109;

  return v93;
}

void __106__AXAssistiveTouchLayoutView__setUpConstraintsToAvoidCollisions_rows_columns_clockwiseOctagonalLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "leftAnchor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v6, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

}

void __106__AXAssistiveTouchLayoutView__setUpConstraintsToAvoidCollisions_rows_columns_clockwiseOctagonalLocations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v6, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v9, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  objc_msgSend(v6, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "lastBaselineAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v13, 1.0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = 1131937792;
  objc_msgSend(v15, "setPriority:", v14);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

}

- (void)centerItems:(id)a3
{
  -[AXAssistiveTouchLayoutView centerItems:withView:](self, "centerItems:withView:", a3, self);
}

- (void)centerItems:(id)a3 withView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
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
  AXAssistiveTouchLayoutView *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AXAssistiveTouchLayoutView _enableAutoLayoutForAllItems:](self, "_enableAutoLayoutForAllItems:", v6);
  -[AXAssistiveTouchLayoutView itemConstraints](self, "itemConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3718];
    -[AXAssistiveTouchLayoutView itemConstraints](self, "itemConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    -[AXAssistiveTouchLayoutView setItemConstraints:](self, "setItemConstraints:", 0);
  }
  v27 = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v17, "window");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v17, "centerXAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "centerXAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "constraintEqualToAnchor:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v21);

          objc_msgSend(v17, "centerYAnchor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "centerYAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "constraintEqualToAnchor:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v24);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  -[AXAssistiveTouchLayoutView setItemConstraints:](v27, "setItemConstraints:", v11);
  v25 = (void *)MEMORY[0x1E0CB3718];
  -[AXAssistiveTouchLayoutView itemConstraints](v27, "itemConstraints");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v26);

}

- (void)_enableAutoLayoutForAllItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v8, "imageView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = 1148846080;
        objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v10);

        objc_msgSend(v8, "imageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = 1148846080;
        objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 1, v12);

        objc_msgSend(v8, "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = 1148846080;
        objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 1, v14);

        objc_msgSend(v8, "imageView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = 1148846080;
        objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 0, v16);

        objc_msgSend(v8, "imageView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = 1148846080;
        objc_msgSend(v17, "setContentHuggingPriority:forAxis:", 1, v18);

        objc_msgSend(v8, "label");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = 1148846080;
        objc_msgSend(v19, "setContentHuggingPriority:forAxis:", 0, v20);

        objc_msgSend(v8, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = 1148846080;
        objc_msgSend(v21, "setContentHuggingPriority:forAxis:", 1, v22);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

}

- (NSArray)itemConstraints
{
  return self->_itemConstraints;
}

- (void)setItemConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_itemConstraints, a3);
}

- (NSMutableArray)positioningLayoutGuides
{
  return self->_positioningLayoutGuides;
}

- (void)setPositioningLayoutGuides:(id)a3
{
  objc_storeStrong((id *)&self->_positioningLayoutGuides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positioningLayoutGuides, 0);
  objc_storeStrong((id *)&self->_itemConstraints, 0);
}

+ (void)labelMaximumContentSizeCategory
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_error_impl(&dword_1BD892000, log, OS_LOG_TYPE_ERROR, "Unable to find any content size category >= Large that would fit the AssistiveTouch menu. Device width: %f", (uint8_t *)&v2, 0xCu);
}

@end
