@implementation UICollectionReusableView(GKReusableView)

+ (void)registerSupplementaryViewClassesForKind:()GKReusableView withCollectionView:
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "_gkRegisterClass:forSupplementaryViewOfKind:", objc_opt_class(), v6);

}

+ (id)_gkStandardConstraintMetricsForIdiom:()GKReusableView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  if (a3 == 1)
  {
    if (_gkStandardConstraintMetricsForIdiom__onceToken_329 != -1)
      dispatch_once(&_gkStandardConstraintMetricsForIdiom__onceToken_329, &__block_literal_global_331);
    v3 = (void *)_gkStandardConstraintMetricsForIdiom__sPadMetrics;
  }
  else
  {
    if (a3)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewCell.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (__objc_no)\n[%s (%s:%d)]"), v6, "+[UICollectionReusableView(GKReusableView) _gkStandardConstraintMetricsForIdiom:]", objc_msgSend(v8, "UTF8String"), 900);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
      v4 = 0;
      return v4;
    }
    if (_gkStandardConstraintMetricsForIdiom__onceToken != -1)
      dispatch_once(&_gkStandardConstraintMetricsForIdiom__onceToken, &__block_literal_global);
    v3 = (void *)_gkStandardConstraintMetricsForIdiom__sPhoneMetrics;
  }
  v4 = v3;
  return v4;
}

+ (id)_gkStandardConstraintMetricsForIdiom:()GKReusableView withOverrides:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(a1, "_gkStandardConstraintMetricsForIdiom:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v10, "addEntriesFromDictionary:", v6);
    v9 = v10;
  }

  return v9;
}

- (void)_gkSetLeadingGuideConstraint:()GKReusableView trailingGuideConstraint:
{
  id v6;
  double v7;
  double v8;
  id v9;

  v9 = a4;
  v6 = a3;
  objc_msgSend(a1, "_contentMargin");
  v8 = v7;
  objc_msgSend(v6, "setConstant:");
  objc_msgSend(v9, "setConstant:", v8);
  objc_msgSend(v6, "setIdentifier:", CFSTR("leadingMargin"));

  objc_msgSend(v9, "setIdentifier:", CFSTR("trailingMargin"));
}

+ (void)_gkAdjustConstraintMargins:()GKReusableView leading:trailing:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  double v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("trailingMargin"));

        v15 = a2;
        if ((v14 & 1) == 0)
        {
          objc_msgSend(v12, "identifier", a2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("leadingMargin"));

          v15 = a1;
          if (!v17)
            continue;
        }
        objc_msgSend(v12, "setConstant:", v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v15);
    }
    while (v9);
  }

}

- (GKLabel)_gkNewStandardTitleLabel
{
  GKLabel *v0;
  GKLabel *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = [GKLabel alloc];
  v1 = -[GKLabel initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableCellTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel applyTextStyle:](v1, "applyTextStyle:", v3);

  -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel setHighlightedTextColor:](v1, "setHighlightedTextColor:", v5);

  -[GKLabel setOpaque:](v1, "setOpaque:", 0);
  -[GKLabel setBackgroundColor:](v1, "setBackgroundColor:", 0);

  return v1;
}

- (GKLabel)_gkNewStandardInfoLabel
{
  GKLabel *v0;
  GKLabel *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = [GKLabel alloc];
  v1 = -[GKLabel initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableCellSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel applyTextStyle:](v1, "applyTextStyle:", v3);

  -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel setHighlightedTextColor:](v1, "setHighlightedTextColor:", v5);

  -[GKLabel setOpaque:](v1, "setOpaque:", 0);
  -[GKLabel setBackgroundColor:](v1, "setBackgroundColor:", 0);

  return v1;
}

- (GKFixedSizeImageView)_gkNewStandardImageView
{
  GKFixedSizeImageView *v0;
  GKFixedSizeImageView *v1;

  v0 = [GKFixedSizeImageView alloc];
  v1 = -[GKFixedSizeImageView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[GKFixedSizeImageView setTranslatesAutoresizingMaskIntoConstraints:](v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKFixedSizeImageView setOpaque:](v1, "setOpaque:", 0);
  -[GKFixedSizeImageView setBackgroundColor:](v1, "setBackgroundColor:", 0);
  return v1;
}

+ (id)_gkSetupTwoLineLayoutWithSuperview:()GKReusableView icon:upperLabel:lowerLabel:leadingBetween:fontTextStyle:metricOverrides:
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[5];

  v49[4] = *MEMORY[0x1E0C80C00];
  v16 = (void *)MEMORY[0x1E0DC3708];
  v17 = a9;
  v48 = a8;
  v47 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  objc_msgSend(v16, "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  if (v22 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v23 = *MEMORY[0x1E0D25B68] == 0;
    else
      v23 = 0;
    v24 = !v23;
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(a1, "_gkStandardConstraintMetricsForIdiom:withOverrides:", v24, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0CB3718];
  _NSDictionaryOfVariableBindings(CFSTR("iconView"), v19, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(imageLeadingMargin)-[iconView(iconSize)]"), 0, v25, v28);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "firstObject");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setIdentifier:", CFSTR("leadingMargin"));
  objc_msgSend(v26, "addObjectsFromArray:", v43);
  objc_msgSend(v43, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIdentifier:", CFSTR("leadingMargin"));

  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", v19, v20);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v45);
  v30 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("iconSize"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  objc_msgSend(v30, "_gkConstraintForView:withConstantHeight:", v19, v32);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "addObject:", v44);
  v49[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v42 = v18;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v33;
  v49[2] = v48;
  v49[3] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKContiguousContainerView containerForViewsFontsLeadings:options:](GKContiguousContainerView, "containerForViewsFontsLeadings:options:", v34, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addSubview:", v35);
  v36 = (void *)MEMORY[0x1E0CB3718];
  _NSDictionaryOfVariableBindings(CFSTR("iconView, labelContainer"), v19, v35, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[iconView]-(spaceBetweenImageAndLabels)-[labelContainer]-(textTrailingMargin)-|"), 0, v25, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "lastObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setIdentifier:", CFSTR("trailingMargin"));
  objc_msgSend(v26, "addObjectsFromArray:", v38);
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", v35, v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "addObject:", v40);
  objc_msgSend(v20, "addConstraints:", v26);

  return v26;
}

+ (id)_gkSetupThreeLineLayoutWithSuperview:()GKReusableView icon:upperLine:middleLine:lowerLine:metricOverrides:
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[4];
  _QWORD v40[3];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v39[0] = CFSTR("icon");
  v39[1] = CFSTR("line1");
  v36 = a5;
  v37 = v14;
  v40[0] = v14;
  v40[1] = v36;
  v39[2] = CFSTR("line2");
  v39[3] = CFSTR("line3");
  v15 = a6;
  v40[2] = v15;
  v41 = a7;
  v35 = v41;
  v16 = (void *)MEMORY[0x1E0C99D80];
  v17 = a8;
  v18 = a3;
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  if (v21 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v22 = *MEMORY[0x1E0D25B68] == 0;
    else
      v22 = 0;
    v23 = !v22;
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(a1, "_gkStandardConstraintMetricsForIdiom:withOverrides:", v23, v17);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[line1][line2][line3]"), 2, 0, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-hMargin-[icon(iconSize)]-betweenMargin-[line2]-textRightMargin-|"), 0, v34, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-hMargin-[icon]-betweenMargin-[line1]-textRightMargin-|"), 0, v34, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-hMargin-[icon]-betweenMargin-[line3]-textRightMargin-|"), 0, v34, v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[icon(iconSize)]"), 1024, v34, v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", v15, v18);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", v37, v18);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setConstant:", -1.0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count")+ objc_msgSend(v25, "count")+ objc_msgSend(v26, "count")+ objc_msgSend(v27, "count")+ objc_msgSend(v28, "count")+ 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObjectsFromArray:", v24);
  objc_msgSend(v29, "addObjectsFromArray:", v25);
  objc_msgSend(v29, "addObjectsFromArray:", v26);
  objc_msgSend(v29, "addObjectsFromArray:", v27);
  objc_msgSend(v29, "addObjectsFromArray:", v28);
  v38[0] = v33;
  v38[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObjectsFromArray:", v30);

  objc_msgSend(v18, "addConstraints:", v29);
  return v29;
}

+ (void)_gkSetupSelectableTwoLineLayoutWithCell:()GKReusableView icon:selectionView:upperLine:lowerLine:metricOverrides:
{
  id v14;
  id v15;
  id v16;
  id v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  void *v48;
  float v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  float v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[5];
  _QWORD v65[7];

  v65[5] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (objc_class *)MEMORY[0x1E0DC3F10];
  v19 = a8;
  v20 = a3;
  v21 = [v18 alloc];
  v22 = (void *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v22, "setHidden:", 1);
  v64[0] = CFSTR("selection");
  v64[1] = CFSTR("icon");
  v62 = v17;
  v63 = v15;
  v65[0] = v15;
  v65[1] = v14;
  v23 = v14;
  v64[2] = CFSTR("line1");
  v64[3] = CFSTR("line2");
  v65[2] = v16;
  v65[3] = v17;
  v64[4] = CFSTR("leftSpacer");
  v24 = v22;
  v65[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "userInterfaceIdiom");

  if (v27 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v28 = *MEMORY[0x1E0D25B68] == 0;
    else
      v28 = 0;
    v29 = !v28;
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(a1, "_gkStandardConstraintMetricsForIdiom:withOverrides:", v29, v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "interactiveContentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "staticContentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "addSubview:", v24);
  v61 = v23;
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", v23, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v33);

  v34 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("iconSize"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatValue");
  objc_msgSend(v34, "_gkConstraintForView:withConstantHeight:", v23, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v37);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-imageLeadingMargin-[leftSpacer(selectionSize)]-imageLeadingMargin-[icon(iconSize)]-betweenMargin@999-[line1]-textRightMargin-|"), 0, v30, v25);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "firstObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setIdentifier:", CFSTR("leadingMargin"));

  v59 = v38;
  objc_msgSend(v38, "lastObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setIdentifier:", CFSTR("trailingMargin"));

  objc_msgSend(v31, "addObjectsFromArray:", v38);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v62, 1, 0, v16, 1, 1.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v62, 2, 0, v16, 2, 1.0, 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v42);

  v43 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("twoLineTopToFirstTop"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "floatValue");
  objc_msgSend(v43, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 3, 0, v32, 3, 1.0, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v46);

  v47 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("twoLineTopToSecondTop"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "floatValue");
  objc_msgSend(v47, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v62, 3, 0, v32, 3, 1.0, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v50);

  objc_msgSend(v32, "addConstraints:", v31);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-hMargin-[selection(selectionSize)]"), 0, v30, v25);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addConstraints:", v51);
  v52 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("selectionSize"));
  v58 = v16;
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "floatValue");
  objc_msgSend(v52, "_gkConstraintForView:withConstantHeight:", v63, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addConstraint:", v55);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v63, 10, 0, v60, 10, 1.0, 0.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addConstraint:", v56);

  objc_msgSend(v51, "firstObject");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setIdentifier:", CFSTR("leadingMargin"));

}

+ (void)_gkSetupSelectableThreeLineLayoutWithCell:()GKReusableView icon:selectionView:upperLine:middleLine:lowerLine:metricOverrides:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_class *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[4];
  _QWORD v63[6];
  _QWORD v64[8];

  v64[6] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (objc_class *)MEMORY[0x1E0DC3F10];
  v20 = a9;
  v21 = a3;
  v22 = [v19 alloc];
  v23 = (void *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "setHidden:", 1);
  v63[0] = CFSTR("selection");
  v63[1] = CFSTR("icon");
  v59 = v14;
  v60 = v15;
  v64[0] = v15;
  v64[1] = v14;
  v63[2] = CFSTR("line1");
  v63[3] = CFSTR("line2");
  v58 = v18;
  v64[2] = v16;
  v64[3] = v17;
  v24 = v17;
  v63[4] = CFSTR("line3");
  v63[5] = CFSTR("leftSpacer");
  v64[4] = v18;
  v64[5] = v23;
  v25 = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 6);
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceIdiom");

  if (v28 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v29 = *MEMORY[0x1E0D25B68] == 0;
    else
      v29 = 0;
    v30 = !v29;
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(a1, "_gkStandardConstraintMetricsForIdiom:withOverrides:", v30, v20);
  v31 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "interactiveContentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "staticContentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v25;
  objc_msgSend(v32, "addSubview:", v25);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[line1][line2][line3]"), 2, 0, v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v31;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-imageLeadingMargin-[leftSpacer(selectionSize)]-imageLeadingMargin-[icon(iconSize)]-betweenMargin@999-[line1]-textRightMargin-|"), 0, v31, v26);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setIdentifier:", CFSTR("leadingMargin"));

  objc_msgSend(v54, "lastObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setIdentifier:", CFSTR("trailingMargin"));

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 1, 0, v16, 1, 1.0, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 2, 0, v16, 2, 1.0, 0.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 1, 0, v16, 1, 1.0, 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 2, 0, v16, 2, 1.0, 0.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[icon(iconSize)]"), 1024, v31, v26);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v32;
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", v24, v32);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", v60, v47);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v26;
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", v59, v32);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setConstant:", -1.0);
  objc_msgSend(v45, "setConstant:", -1.0);
  v52 = v33;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v33, "count") + objc_msgSend(v54, "count") + objc_msgSend(v36, "count") + 5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObjectsFromArray:", v33);
  objc_msgSend(v38, "addObjectsFromArray:", v54);
  v62[0] = v51;
  v62[1] = v57;
  v62[2] = v55;
  v62[3] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObjectsFromArray:", v39);

  objc_msgSend(v38, "addObjectsFromArray:", v36);
  v61[0] = v44;
  v61[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObjectsFromArray:", v40);

  objc_msgSend(v46, "addConstraints:", v38);
  objc_msgSend(v47, "addConstraint:", v45);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[selection(selectionSize)]"), 1024, v50, v48);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addConstraints:", v41);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-hMargin-[selection(selectionSize)]"), 0, v50, v48);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setIdentifier:", CFSTR("leadingMargin"));

  objc_msgSend(v47, "addConstraints:", v42);
}

@end
