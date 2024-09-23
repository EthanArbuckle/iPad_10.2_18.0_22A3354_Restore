@implementation HUGridLayoutOptions

- (void)setContentColorStyle:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_contentColorStyle = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HUGridLayoutOptions _childDisplayOptions](self, "_childDisplayOptions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setContentColorStyle:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (double)rowSpacing
{
  return self->_rowSpacing;
}

- (double)pointWidthForNumberOfColumns:(int64_t)a3
{
  double result;

  -[HUGridLayoutOptions _pointWidthForFractionalNumberOfColumns:](self, "_pointWidthForFractionalNumberOfColumns:", (double)a3);
  return result;
}

- (double)_pointWidthForFractionalNumberOfColumns:(double)a3
{
  unint64_t v5;
  double result;
  int64_t v7;
  double v8;

  v5 = -[HUGridLayoutOptions columnStyle](self, "columnStyle");
  if (v5)
  {
    if (v5 == 1)
      -[HUGridLayoutOptions _pointWidthForFixedColumnStyleWithFractionalNumberOfColumns:](self, "_pointWidthForFixedColumnStyleWithFractionalNumberOfColumns:", a3);
  }
  else
  {
    v7 = -[HUGridLayoutOptions numberOfColumns](self, "numberOfColumns");
    -[HUGridLayoutOptions viewSize](self, "viewSize");
    -[HUGridLayoutOptions _pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:totalNumberOfColumns:totalWidth:useDefaultSectionMargin:](self, "_pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:totalNumberOfColumns:totalWidth:useDefaultSectionMargin:", v7, 0, a3, v8);
  }
  return result;
}

- (int64_t)viewSizeSubclass
{
  void *v3;
  void *v4;
  int64_t v5;
  double v7;
  double v8;

  -[HUGridLayoutOptions overrideViewSizeSubclass](self, "overrideViewSizeSubclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUGridLayoutOptions overrideViewSizeSubclass](self, "overrideViewSizeSubclass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    return v5;
  }
  else if (-[HUGridLayoutOptions columnStyle](self, "columnStyle"))
  {
    return 7;
  }
  else
  {
    -[HUGridLayoutOptions viewSize](self, "viewSize");
    return HUViewSizeSubclassForViewSize(v7, v8);
  }
}

- (unint64_t)columnStyle
{
  return self->_columnStyle;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSNumber)overrideViewSizeSubclass
{
  return self->_overrideViewSizeSubclass;
}

- (int64_t)numberOfColumns
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  int64_t result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int64_t v16;

  -[HUGridLayoutOptions overrideNumberOfColumns](self, "overrideNumberOfColumns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUGridLayoutOptions overrideNumberOfColumns](self, "overrideNumberOfColumns");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");
LABEL_3:
    v6 = v5;

    return v6;
  }
  result = -[HUGridLayoutOptions columnStyle](self, "columnStyle");
  if (!result)
  {
    v15 = (void *)objc_opt_class();
    v16 = -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass");
    -[HUGridLayoutOptions contentSizeCategory](self, "contentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v15, "_numberOfColumnsForFlexibleWidthStyleWithSizeSubclass:contentSizeCategory:", v16, v4);
    goto LABEL_3;
  }
  if (result == 1)
  {
    -[HUGridLayoutOptions pointWidthForFullWidthCell](self, "pointWidthForFullWidthCell");
    v9 = v8;
    -[HUGridLayoutOptions pointWidthForNumberOfColumns:](self, "pointWidthForNumberOfColumns:", 1);
    v11 = v10;
    -[HUGridLayoutOptions columnSpacing](self, "columnSpacing");
    v13 = v11 + v12;
    -[HUGridLayoutOptions columnSpacing](self, "columnSpacing");
    return vcvtmd_s64_f64((v9 + v14) / v13);
  }
  return result;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (NSNumber)overrideNumberOfColumns
{
  return self->_overrideNumberOfColumns;
}

+ (unint64_t)_numberOfNormalColumnsForFlexibleWidthStyleWithSizeSubclass:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;

  result = 8;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeUIService", v3, v4))
        result = 3;
      else
        result = 4;
      break;
    case 6:
      result = 18;
      break;
    case 7:
    case 8:
      result = 10;
      break;
    case 10:
      result = 12;
      break;
    default:
      return result;
  }
  return result;
}

+ (unint64_t)_numberOfColumnsForFlexibleWidthStyleWithSizeSubclass:(int64_t)a3 contentSizeCategory:(id)a4
{
  NSComparisonResult v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;

  v5 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E0CEB3E0], (UIContentSizeCategory)a4);
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nativeScale");
    v6 = v9 < v11;

  }
  v12 = (void *)objc_opt_class();
  if (v5 == NSOrderedDescending && !v6)
    return objc_msgSend(v12, "_numberOfNormalColumnsForFlexibleWidthStyleWithSizeSubclass:", a3);
  else
    return objc_msgSend(v12, "_numberOfAccessibilityColumnsForFlexibleWidthStyleWithSizeSubclass:", a3);
}

- (double)sectionBottomMargin
{
  return self->_sectionBottomMargin;
}

- (double)sectionTopMargin
{
  return self->_sectionTopMargin;
}

- (HUFilterCategoryCellLayoutOptions)filterCategoryCellOptions
{
  return self->_filterCategoryCellOptions;
}

- (void)setContentSizeCategory:(id)a3
{
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  self->_contentSizeCategory = v4;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HUGridLayoutOptions _childDisplayOptions](self, "_childDisplayOptions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setContentSizeCategory:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_childDisplayOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  -[HUGridLayoutOptions cameraCellOptions](self, "cameraCellOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridLayoutOptions headlineCellOptions](self, "headlineCellOptions", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  -[HUGridLayoutOptions statusCellOptions](self, "statusCellOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  -[HUGridLayoutOptions sceneCellOptions](self, "sceneCellOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  -[HUGridLayoutOptions placeholderSceneCellOptions](self, "placeholderSceneCellOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  -[HUGridLayoutOptions serviceCellOptions](self, "serviceCellOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  -[HUGridLayoutOptions placeholderServiceCellOptions](self, "placeholderServiceCellOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HUGridSceneCellLayoutOptions)sceneCellOptions
{
  return self->_sceneCellOptions;
}

- (HUGridHeadlineCellLayoutOptions)headlineCellOptions
{
  return self->_headlineCellOptions;
}

- (HUGridStatusCellLayoutOptions)statusCellOptions
{
  return self->_statusCellOptions;
}

- (HUGridServiceCellLayoutOptions)serviceCellOptions
{
  return self->_serviceCellOptions;
}

- (HUGridPlaceholderServiceCellLayoutOptions)placeholderServiceCellOptions
{
  return self->_placeholderServiceCellOptions;
}

- (HUGridScenePlaceholderLayoutOptions)placeholderSceneCellOptions
{
  return self->_placeholderSceneCellOptions;
}

- (HUGridCameraCellLayoutOptions)cameraCellOptions
{
  return self->_cameraCellOptions;
}

- (double)sectionHeaderCellHeight
{
  double v3;
  double v4;
  double v5;

  -[HUGridLayoutOptions sectionBottomToNextSectionTitleBaselineDistance](self, "sectionBottomToNextSectionTitleBaselineDistance");
  v4 = v3;
  -[HUGridLayoutOptions sectionBottomMargin](self, "sectionBottomMargin");
  return v4 - v5;
}

- (double)sectionBottomToNextSectionTitleBaselineDistance
{
  return self->_sectionBottomToNextSectionTitleBaselineDistance;
}

- (void)setStatusHidden:(BOOL)a3
{
  self->_statusHidden = a3;
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_editing = a3;
  -[HUGridLayoutOptions headlineCellOptions](self, "headlineCellOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", v3);

}

+ (id)defaultOptionsForViewSize:(CGSize)a3 columnStyle:(unint64_t)a4 overrideSizeSubclass:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[6];
  _QWORD v62[8];

  height = a3.height;
  width = a3.width;
  v62[6] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithViewSize:columnStyle:overrideSizeSubclass:", a4, v9, width, height);

  v11 = objc_msgSend(v10, "viewSizeSubclass");
  v12 = objc_msgSend(v10, "cellSizeSubclass");
  +[HUGridCameraCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridCameraCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCameraCellOptions:", v13);

  +[HUGridStatusCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridStatusCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStatusCellOptions:", v14);

  +[HUGridSceneCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridSceneCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSceneCellOptions:", v15);

  +[HUGridScenePlaceholderLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridScenePlaceholderLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlaceholderSceneCellOptions:", v16);

  +[HUGridServiceCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridServiceCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setServiceCellOptions:", v17);

  +[HUGridPlaceholderServiceCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridPlaceholderServiceCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlaceholderServiceCellOptions:", v18);

  +[HUGridBannerCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridBannerCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBannerCellOptions:", v19);

  +[HUGridWelcomeUIBannerCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridWelcomeUIBannerCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWelcomeUIBannerCellOptions:", v20);

  +[HUFilterCategoryCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUFilterCategoryCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilterCategoryCellOptions:", v21);

  +[HUGridMediaPlatterCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridMediaPlatterCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediaPlatterCellOptions:", v22);

  objc_msgSend(v10, "setScrollDirection:", 0);
  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB580], 32770);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHeadlineFont:", v23);

  objc_msgSend(MEMORY[0x1E0CEA718], "prominentInsetGroupedHeaderConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "font");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v10, "setSectionHeaderFont:", v27);

  v61[0] = &unk_1E7041A10;
  v61[1] = &unk_1E70419F8;
  v62[0] = &unk_1E7043688;
  v62[1] = &unk_1E7043698;
  v61[2] = &unk_1E7041A28;
  v61[3] = &unk_1E7041A40;
  v62[2] = &unk_1E70436A8;
  v62[3] = &unk_1E70436B8;
  v61[4] = &unk_1E7041A58;
  v61[5] = &unk_1E7041A70;
  v62[4] = &unk_1E70436C8;
  v62[5] = &unk_1E70436D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHeadlineBaselineToSceneHeaderBaselineDistance:", HUConstantFloatForViewSizeSubclass(v11, v28));

  objc_msgSend(v10, "sectionHeaderFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  v31 = 10.0;
  if (v11 == 6)
    v31 = 8.0;
  objc_msgSend(v29, "_scaledValueForValue:", v31);
  objc_msgSend(v10, "setSectionTopMargin:");

  objc_msgSend(v10, "sectionTopMargin");
  objc_msgSend(v10, "setSectionBottomMargin:");
  v59[0] = &unk_1E7041A10;
  v59[1] = &unk_1E70419F8;
  v60[0] = &unk_1E70436E8;
  v60[1] = &unk_1E70436F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSectionLeadingMargin:", HUConstantFloatForViewSizeSubclass(v11, v32));

  objc_msgSend(v10, "sectionLeadingMargin");
  objc_msgSend(v10, "setSectionTrailingMargin:");
  objc_msgSend(v10, "sectionLeadingMargin");
  v34 = v33;
  objc_msgSend(v10, "sectionTrailingMargin");
  +[HUGridHeadlineCellLayoutOptions defaultOptionsForCellSizeSubclass:viewSizeSubclass:viewWidth:containerLeadingMargin:containerTrailingMargin:](HUGridHeadlineCellLayoutOptions, "defaultOptionsForCellSizeSubclass:viewSizeSubclass:viewWidth:containerLeadingMargin:containerTrailingMargin:", v12, v11, width, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHeadlineCellOptions:", v36);

  v57[0] = &unk_1E70419F8;
  v57[1] = &unk_1E7041A40;
  v58[0] = &unk_1E7043708;
  v58[1] = &unk_1E7043708;
  v57[2] = &unk_1E7041A70;
  v58[2] = &unk_1E7043718;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = HUConstantFloatForViewSizeSubclass(v11, v37);

  objc_msgSend(v10, "sectionHeaderFont");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_scaledValueForValue:", v38);
  objc_msgSend(v10, "setSectionBottomToNextSectionTitleBaselineDistance:");

  objc_msgSend(v10, "sectionLeadingMargin");
  v41 = v40;
  objc_msgSend(v10, "sectionTrailingMargin");
  objc_msgSend(v10, "setSectionTitleMargin:", 0.0, v41, 0.0, v42);
  v55[0] = &unk_1E7041A10;
  v55[1] = &unk_1E70419F8;
  v56[0] = &unk_1E7043728;
  v56[1] = &unk_1E7043738;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = HUConstantFloatForViewSizeSubclass(v11, v43);

  objc_msgSend(v10, "setRowSpacing:", v44);
  objc_msgSend(v10, "setColumnSpacing:", v44);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v10, "setSectionTopMargin:", 0.0);
      objc_msgSend(v10, "setSectionBottomMargin:", 0.0);
      objc_msgSend(v10, "setSectionLeadingMargin:", 0.0);
      objc_msgSend(v10, "setSectionTrailingMargin:", 0.0);
      CCUILayoutGutter();
      objc_msgSend(v10, "setRowSpacing:");
      CCUILayoutGutter();
      objc_msgSend(v10, "setColumnSpacing:");
    }
    else
    {
      objc_msgSend(v10, "setSectionTopMargin:", v44);
      v45 = v44 + v44;
      objc_msgSend(v10, "setSectionBottomMargin:", v45);
      objc_msgSend(v10, "setSectionLeadingMargin:", v45);
      objc_msgSend(v10, "setSectionTrailingMargin:", v45);
    }
    objc_msgSend(v10, "sectionTopMargin");
    v47 = v46;
    objc_msgSend(v10, "sectionLeadingMargin");
    v49 = v48;
    objc_msgSend(v10, "sectionBottomMargin");
    v51 = v50;
    objc_msgSend(v10, "sectionTrailingMargin");
    objc_msgSend(v10, "setSectionTitleMargin:", v47, v49, v51, v52);
    objc_msgSend(v10, "sectionBottomToNextSectionTitleBaselineDistance");
    objc_msgSend(v10, "setSectionBottomToNextSectionTitleBaselineDistance:", v53 * 1.5);
  }
  objc_msgSend(v10, "setOverrideNumberOfColumns:", 0);
  objc_msgSend(v10, "setContentColorStyle:", 0);
  objc_msgSend(v10, "setContentSizeCategory:", *MEMORY[0x1E0CEB440]);
  objc_msgSend(v10, "setMinimumMarginBelowHeadline:", 20.0);

  return v10;
}

- (double)_pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:(double)a3 totalNumberOfColumns:(int64_t)a4 totalWidth:(double)a5 useDefaultSectionMargin:(BOOL)a6
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v25;

  if (a6)
  {
    v10 = 40.0;
  }
  else
  {
    -[HUGridLayoutOptions sectionLeadingMargin](self, "sectionLeadingMargin");
    v12 = v11;
    -[HUGridLayoutOptions sectionTrailingMargin](self, "sectionTrailingMargin");
    v10 = v12 + v13;
  }
  v25 = v10;
  v14 = a5 - v10;
  v15 = (double)a4 + -1.0;
  -[HUGridLayoutOptions columnSpacing](self, "columnSpacing");
  v17 = (v14 - v15 * v16) / (double)a4 * a3;
  -[HUGridLayoutOptions columnSpacing](self, "columnSpacing");
  v19 = HUFloorToScreenScale(v17 + (a3 + -1.0) * v18);
  if (v19 >= 0.0)
    v20 = v19;
  else
    v20 = 0.0;
  -[HUGridLayoutOptions columnSpacing](self, "columnSpacing");
  v22 = (floor(v20 * 1000.0 + 1.0) / 1000.0 - (a3 + -1.0) * v21) / a3 * (double)a4;
  -[HUGridLayoutOptions columnSpacing](self, "columnSpacing");
  if (v25 + v22 + v15 * v23 > a5 && v20 != 0.0)
    return floor(v20 * 1000.0) / 1000.0;
  return v20;
}

- (double)columnSpacing
{
  return self->_columnSpacing;
}

- (double)sectionLeadingMargin
{
  return self->_sectionLeadingMargin;
}

- (double)sectionTrailingMargin
{
  return self->_sectionTrailingMargin;
}

- (UIFont)sectionHeaderFont
{
  return self->_sectionHeaderFont;
}

- (void)setSectionTrailingMargin:(double)a3
{
  self->_sectionTrailingMargin = a3;
}

- (void)setSectionLeadingMargin:(double)a3
{
  self->_sectionLeadingMargin = a3;
}

- (void)setWelcomeUIBannerCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setStatusCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setServiceCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setSectionTopMargin:(double)a3
{
  self->_sectionTopMargin = a3;
}

- (void)setSectionTitleMargin:(UIEdgeInsets)a3
{
  self->_sectionTitleMargin = a3;
}

- (void)setSectionHeaderFont:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderFont, a3);
}

- (void)setSectionBottomToNextSectionTitleBaselineDistance:(double)a3
{
  self->_sectionBottomToNextSectionTitleBaselineDistance = a3;
}

- (void)setSectionBottomMargin:(double)a3
{
  self->_sectionBottomMargin = a3;
}

- (void)setScrollDirection:(int64_t)a3
{
  self->_scrollDirection = a3;
}

- (void)setSceneCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setRowSpacing:(double)a3
{
  self->_rowSpacing = a3;
}

- (void)setPlaceholderServiceCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setPlaceholderSceneCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setOverrideNumberOfColumns:(id)a3
{
  objc_storeStrong((id *)&self->_overrideNumberOfColumns, a3);
}

- (void)setMinimumMarginBelowHeadline:(double)a3
{
  self->_minimumMarginBelowHeadline = a3;
}

- (void)setMediaPlatterCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setHeadlineFont:(id)a3
{
  objc_storeStrong((id *)&self->_headlineFont, a3);
}

- (void)setHeadlineCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setHeadlineBaselineToSceneHeaderBaselineDistance:(double)a3
{
  self->_headlineBaselineToSceneHeaderBaselineDistance = a3;
}

- (void)setFilterCategoryCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setColumnSpacing:(double)a3
{
  self->_columnSpacing = a3;
}

- (void)setCameraCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setBannerCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (HUGridLayoutOptions)initWithViewSize:(CGSize)a3 columnStyle:(unint64_t)a4 overrideSizeSubclass:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  HUGridLayoutOptions *v11;
  HUGridLayoutOptions *v12;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUGridLayoutOptions;
  v11 = -[HUGridLayoutOptions init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_viewSize.width = width;
    v11->_viewSize.height = height;
    objc_storeStrong((id *)&v11->_overrideViewSizeSubclass, a5);
    v12->_columnStyle = a4;
  }

  return v12;
}

- (int64_t)cellSizeSubclass
{
  unint64_t v2;

  v2 = -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass");
  if (v2 > 0xA)
    return 1;
  else
    return qword_1B9442EA0[v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideViewSizeSubclass, 0);
  objc_storeStrong((id *)&self->_mosaicCameraCellOptions, 0);
  objc_storeStrong((id *)&self->_mediaPlatterCellOptions, 0);
  objc_storeStrong((id *)&self->_filterCategoryCellOptions, 0);
  objc_storeStrong((id *)&self->_welcomeUIBannerCellOptions, 0);
  objc_storeStrong((id *)&self->_bannerCellOptions, 0);
  objc_storeStrong((id *)&self->_placeholderServiceCellOptions, 0);
  objc_storeStrong((id *)&self->_serviceCellOptions, 0);
  objc_storeStrong((id *)&self->_placeholderSceneCellOptions, 0);
  objc_storeStrong((id *)&self->_sceneCellOptions, 0);
  objc_storeStrong((id *)&self->_statusCellOptions, 0);
  objc_storeStrong((id *)&self->_headlineCellOptions, 0);
  objc_storeStrong((id *)&self->_cameraCellOptions, 0);
  objc_storeStrong((id *)&self->_overrideNumberOfColumns, 0);
  objc_storeStrong((id *)&self->_sectionHeaderFont, 0);
  objc_storeStrong((id *)&self->_headlineFont, 0);
}

+ (id)defaultOptionsForViewSize:(CGSize)a3
{
  return (id)objc_msgSend(a1, "defaultOptionsForViewSize:columnStyle:", 0, a3.width, a3.height);
}

+ (id)defaultOptionsForViewSize:(CGSize)a3 overrideSizeSubclass:(int64_t)a4
{
  double height;
  double width;
  void *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", 0, v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)defaultOptionsForViewSize:(CGSize)a3 columnStyle:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", a4, &unk_1E70419F8, a3.width, a3.height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
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

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUGridLayoutOptions viewSize](self, "viewSize");
  v6 = v5;
  v8 = v7;
  v9 = -[HUGridLayoutOptions columnStyle](self, "columnStyle");
  -[HUGridLayoutOptions overrideViewSizeSubclass](self, "overrideViewSizeSubclass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithViewSize:columnStyle:overrideSizeSubclass:", v9, v10, v6, v8);

  objc_msgSend(v11, "setScrollDirection:", -[HUGridLayoutOptions scrollDirection](self, "scrollDirection"));
  objc_msgSend(v11, "setStatusHidden:", -[HUGridLayoutOptions statusHidden](self, "statusHidden"));
  objc_msgSend(v11, "setHeadlineHidden:", -[HUGridLayoutOptions headlineHidden](self, "headlineHidden"));
  objc_msgSend(v11, "setEditing:", -[HUGridLayoutOptions isEditing](self, "isEditing"));
  -[HUGridLayoutOptions headlineFont](self, "headlineFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHeadlineFont:", v12);

  -[HUGridLayoutOptions sectionHeaderFont](self, "sectionHeaderFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSectionHeaderFont:", v13);

  -[HUGridLayoutOptions headlineBaselineToSceneHeaderBaselineDistance](self, "headlineBaselineToSceneHeaderBaselineDistance");
  objc_msgSend(v11, "setHeadlineBaselineToSceneHeaderBaselineDistance:");
  -[HUGridLayoutOptions sectionTopMargin](self, "sectionTopMargin");
  objc_msgSend(v11, "setSectionTopMargin:");
  -[HUGridLayoutOptions sectionBottomMargin](self, "sectionBottomMargin");
  objc_msgSend(v11, "setSectionBottomMargin:");
  -[HUGridLayoutOptions sectionLeadingMargin](self, "sectionLeadingMargin");
  objc_msgSend(v11, "setSectionLeadingMargin:");
  -[HUGridLayoutOptions sectionTrailingMargin](self, "sectionTrailingMargin");
  objc_msgSend(v11, "setSectionTrailingMargin:");
  -[HUGridLayoutOptions sectionBottomToNextSectionTitleBaselineDistance](self, "sectionBottomToNextSectionTitleBaselineDistance");
  objc_msgSend(v11, "setSectionBottomToNextSectionTitleBaselineDistance:");
  -[HUGridLayoutOptions sectionTitleMargin](self, "sectionTitleMargin");
  objc_msgSend(v11, "setSectionTitleMargin:");
  -[HUGridLayoutOptions headlineBaselineToSceneHeaderBaselineDistance](self, "headlineBaselineToSceneHeaderBaselineDistance");
  objc_msgSend(v11, "setHeadlineBaselineToSceneHeaderBaselineDistance:");
  -[HUGridLayoutOptions minimumMarginBelowHeadline](self, "minimumMarginBelowHeadline");
  objc_msgSend(v11, "setMinimumMarginBelowHeadline:");
  -[HUGridLayoutOptions rowSpacing](self, "rowSpacing");
  objc_msgSend(v11, "setRowSpacing:");
  -[HUGridLayoutOptions columnSpacing](self, "columnSpacing");
  objc_msgSend(v11, "setColumnSpacing:");
  -[HUGridLayoutOptions overrideNumberOfColumns](self, "overrideNumberOfColumns");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOverrideNumberOfColumns:", v14);

  -[HUGridLayoutOptions cameraCellOptions](self, "cameraCellOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCameraCellOptions:", v15);

  -[HUGridLayoutOptions headlineCellOptions](self, "headlineCellOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHeadlineCellOptions:", v16);

  -[HUGridLayoutOptions statusCellOptions](self, "statusCellOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStatusCellOptions:", v17);

  -[HUGridLayoutOptions sceneCellOptions](self, "sceneCellOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSceneCellOptions:", v18);

  -[HUGridLayoutOptions placeholderSceneCellOptions](self, "placeholderSceneCellOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaceholderSceneCellOptions:", v19);

  -[HUGridLayoutOptions serviceCellOptions](self, "serviceCellOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setServiceCellOptions:", v20);

  -[HUGridLayoutOptions placeholderServiceCellOptions](self, "placeholderServiceCellOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaceholderServiceCellOptions:", v21);

  -[HUGridLayoutOptions bannerCellOptions](self, "bannerCellOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBannerCellOptions:", v22);

  -[HUGridLayoutOptions welcomeUIBannerCellOptions](self, "welcomeUIBannerCellOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWelcomeUIBannerCellOptions:", v23);

  objc_msgSend(v11, "setContentColorStyle:", -[HUGridLayoutOptions contentColorStyle](self, "contentColorStyle"));
  -[HUGridLayoutOptions contentSizeCategory](self, "contentSizeCategory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentSizeCategory:", v24);

  return v11;
}

- (double)gutter
{
  -[HUGridLayoutOptions cellSizeSubclass](self, "cellSizeSubclass");
  return 10.0;
}

+ (unint64_t)_numberOfAccessibilityColumnsForFlexibleWidthStyleWithSizeSubclass:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;

  result = 4;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeUIService", v3, v4))
        result = 3;
      else
        result = 2;
      break;
    case 4:
    case 5:
    case 9:
      return result;
    case 6:
      result = 8;
      break;
    case 7:
    case 8:
    case 10:
      result = 6;
      break;
    default:
      result = objc_msgSend((id)4, "_numberOfNormalColumnsForFlexibleWidthStyleWithSizeSubclass:");
      break;
  }
  return result;
}

- (double)pointWidthForCurrentViewSizeSubclass
{
  double result;
  double v4;
  double v5;
  double v6;

  if (!-[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass")
    || -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass") == 1
    || -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass") == 2
    || -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass") == 6)
  {
    -[HUGridLayoutOptions pointWidthForFullWidthCell](self, "pointWidthForFullWidthCell");
  }
  else
  {
    -[HUGridLayoutOptions columnSpacing](self, "columnSpacing");
    v5 = v4;
    -[HUGridLayoutOptions pointWidthForNumberOfColumns:](self, "pointWidthForNumberOfColumns:", 2);
    return v5 + v6 * 2.0;
  }
  return result;
}

- (double)fixedWidthForCell
{
  unint64_t v3;
  double v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  double result;

  v3 = -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass") - 1;
  if (v3 > 9)
    v4 = 320.0;
  else
    v4 = dbl_1B9442EF8[v3];
  v5 = (void *)objc_opt_class();
  v6 = -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass");
  -[HUGridLayoutOptions contentSizeCategory](self, "contentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "_numberOfColumnsForFlexibleWidthStyleWithSizeSubclass:contentSizeCategory:", v6, v7);

  -[HUGridLayoutOptions _pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:totalNumberOfColumns:totalWidth:useDefaultSectionMargin:](self, "_pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:totalNumberOfColumns:totalWidth:useDefaultSectionMargin:", v8, 1, 1.0, v4);
  return result;
}

- (double)pointWidthForFullWidthCell
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[HUGridLayoutOptions viewSize](self, "viewSize");
  v4 = v3;
  -[HUGridLayoutOptions sectionLeadingMargin](self, "sectionLeadingMargin");
  v6 = v4 - v5;
  -[HUGridLayoutOptions sectionTrailingMargin](self, "sectionTrailingMargin");
  return v6 - v7;
}

- (double)_pointWidthForFixedColumnStyleWithFractionalNumberOfColumns:(double)a3
{
  unint64_t v5;
  double v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  double result;

  v5 = -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass") - 1;
  if (v5 > 9)
    v6 = 320.0;
  else
    v6 = dbl_1B9442EF8[v5];
  v7 = (void *)objc_opt_class();
  v8 = -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass");
  -[HUGridLayoutOptions contentSizeCategory](self, "contentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "_numberOfColumnsForFlexibleWidthStyleWithSizeSubclass:contentSizeCategory:", v8, v9);

  -[HUGridLayoutOptions _pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:totalNumberOfColumns:totalWidth:useDefaultSectionMargin:](self, "_pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:totalNumberOfColumns:totalWidth:useDefaultSectionMargin:", v10, 0, a3, v6);
  return result;
}

- (double)cameraCellWidth
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  double result;

  v3 = -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass");
  v4 = -[HUGridLayoutOptions numberOfColumns](self, "numberOfColumns");
  v5 = (float)v4;
  if (v3 > 2)
    v5 = (float)v4 * 0.5;
  -[HUGridLayoutOptions _pointWidthForFractionalNumberOfColumns:](self, "_pointWidthForFractionalNumberOfColumns:", v5);
  return result;
}

- (double)cameraCellHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[HUGridLayoutOptions cameraCellOptions](self, "cameraCellOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerViewHeight");
  v5 = v4;
  -[HUGridLayoutOptions cameraCellWidth](self, "cameraCellWidth");
  v7 = v6;
  -[HUGridLayoutOptions cameraCellOptions](self, "cameraCellOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraViewAspectRatio");
  v10 = HURoundToScreenScale(v5 + v7 / v9);

  return v10;
}

- (double)headlineCellHeight
{
  void *v3;
  double v4;
  double v5;
  _BOOL4 v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double result;

  -[HUGridLayoutOptions headlineCellOptions](self, "headlineCellOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headlineBaselineOffset");
  v5 = v4;

  v6 = -[HUGridLayoutOptions statusHidden](self, "statusHidden");
  v7 = 0.0;
  if (v6)
    -[HUGridLayoutOptions headlineBaselineToSceneHeaderBaselineDistance](self, "headlineBaselineToSceneHeaderBaselineDistance", 0.0);
  v8 = v5 + v7;
  v9 = -[HUGridLayoutOptions isEditing](self, "isEditing");
  result = v8 + 26.0;
  if (!v9)
    return v8;
  return result;
}

- (double)statusListCellHeight
{
  void *v2;
  double v3;
  double v4;

  -[HUGridLayoutOptions statusCellOptions](self, "statusCellOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellHeight");
  UICeilToViewScale();
  v4 = v3;

  return v4;
}

- (double)statusListCellTopMargin
{
  int v3;
  double result;

  v3 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  -[HUGridLayoutOptions gutter](self, "gutter");
  if (v3)
    return result + result;
  return result;
}

- (double)statusListCellBottomMargin
{
  double v2;

  -[HUGridLayoutOptions gutter](self, "gutter");
  return v2 + v2;
}

- (double)largeTitleCellTopMargin
{
  return 40.0;
}

- (double)preferredSectionHeightForNumberOfSceneRows:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;

  -[HUGridLayoutOptions sceneCellOptions](self, "sceneCellOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellHeight");
  -[HUGridLayoutOptions _preferredSectionHeightForNumberOfRows:withCellHeight:](self, "_preferredSectionHeightForNumberOfRows:withCellHeight:", a3);
  v7 = v6;

  return v7;
}

- (double)preferredSectionHeightForNumberOfServiceRows:(unint64_t)a3 spanningColumns:(unint64_t)a4
{
  double result;

  -[HUGridLayoutOptions pointWidthForNumberOfColumns:](self, "pointWidthForNumberOfColumns:", a4);
  -[HUGridLayoutOptions _preferredSectionHeightForNumberOfRows:withCellHeight:](self, "_preferredSectionHeightForNumberOfRows:withCellHeight:", a3);
  return result;
}

- (double)_preferredSectionHeightForNumberOfRows:(unint64_t)a3 withCellHeight:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[HUGridLayoutOptions sectionTopMargin](self, "sectionTopMargin");
  v8 = v7;
  -[HUGridLayoutOptions sectionBottomMargin](self, "sectionBottomMargin");
  v10 = v8 + v9 + (double)a3 * a4;
  -[HUGridLayoutOptions rowSpacing](self, "rowSpacing");
  return v10 + (double)(a3 - 1) * v11;
}

- (double)pointWidthForWelcomeUIBanner
{
  double result;
  double v4;
  double v5;
  double v6;

  if (!-[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass")
    || -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass") == 1
    || -[HUGridLayoutOptions viewSizeSubclass](self, "viewSizeSubclass") == 2)
  {
    -[HUGridLayoutOptions pointWidthForFullWidthCell](self, "pointWidthForFullWidthCell");
  }
  else
  {
    -[HUGridLayoutOptions columnSpacing](self, "columnSpacing");
    v5 = v4;
    -[HUGridLayoutOptions pointWidthForNumberOfColumns:](self, "pointWidthForNumberOfColumns:", 2);
    return v5 + v6 * 1.5;
  }
  return result;
}

- (id)_columnStyleToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = &stru_1E6F60E80;
  if (!a3)
    v3 = CFSTR("HUGridLayoutColumnStyleFlexibleWidth");
  if (a3 == 1)
    return CFSTR("HUGridLayoutColumnStyleFixedWidth");
  else
    return (id)v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HUGridLayoutOptions viewSize](self, "viewSize");
  v6 = v5;
  -[HUGridLayoutOptions viewSize](self, "viewSize");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(%f, %f)"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("viewSize"));
  -[HUGridLayoutOptions _columnStyleToString:](self, "_columnStyleToString:", -[HUGridLayoutOptions columnStyle](self, "columnStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("columnStyle"));

  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[HUGridLayoutOptions isEditing](self, "isEditing"), CFSTR("editing"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (unint64_t)contentColorStyle
{
  return self->_contentColorStyle;
}

- (int64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (void)setColumnStyle:(unint64_t)a3
{
  self->_columnStyle = a3;
}

- (BOOL)headlineHidden
{
  return self->_headlineHidden;
}

- (void)setHeadlineHidden:(BOOL)a3
{
  self->_headlineHidden = a3;
}

- (BOOL)statusHidden
{
  return self->_statusHidden;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UIFont)headlineFont
{
  return self->_headlineFont;
}

- (double)headlineBaselineToSceneHeaderBaselineDistance
{
  return self->_headlineBaselineToSceneHeaderBaselineDistance;
}

- (UIEdgeInsets)sectionTitleMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionTitleMargin.top;
  left = self->_sectionTitleMargin.left;
  bottom = self->_sectionTitleMargin.bottom;
  right = self->_sectionTitleMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)minimumMarginBelowHeadline
{
  return self->_minimumMarginBelowHeadline;
}

- (HUGridBannerCellLayoutOptions)bannerCellOptions
{
  return self->_bannerCellOptions;
}

- (HUGridWelcomeUIBannerCellLayoutOptions)welcomeUIBannerCellOptions
{
  return self->_welcomeUIBannerCellOptions;
}

- (HUGridMediaPlatterCellLayoutOptions)mediaPlatterCellOptions
{
  return self->_mediaPlatterCellOptions;
}

- (HUMosaicCameraCellLayoutOptions)mosaicCameraCellOptions
{
  return self->_mosaicCameraCellOptions;
}

- (void)setMosaicCameraCellOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (int64_t)numberOfCameraCellsPerRow
{
  return self->_numberOfCameraCellsPerRow;
}

- (void)setOverrideViewSizeSubclass:(id)a3
{
  objc_storeStrong((id *)&self->_overrideViewSizeSubclass, a3);
}

@end
