@implementation WDMedicalRecordDisplayItem

- (WDMedicalRecordDisplayItem)init
{
  WDMedicalRecordDisplayItem *v2;
  WDMedicalRecordDisplayItem *v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDMedicalRecordDisplayItem;
  v2 = -[WDMedicalRecordDisplayItem init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_separatorStyle = 1;
    v2->_separatorHidden = 1;
    +[WDMedicalRecordGroupableCell defaultGap](WDMedicalRecordGroupableCell, "defaultGap");
    v5 = v4;
    +[WDMedicalRecordGroupableCell defaultGap](WDMedicalRecordGroupableCell, "defaultGap");
    v3->_separatorInsets.top = 0.0;
    v3->_separatorInsets.left = v5;
    v3->_separatorInsets.bottom = 0.0;
    v3->_separatorInsets.right = v6;
    v3->_actionEnabled = 1;
  }
  return v3;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[WDMedicalRecordDisplayItem displayItemType](self, "displayItemType");
  -[WDMedicalRecordDisplayItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem valueString](self, "valueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem chartValueWithRange](self, "chartValueWithRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Display Item Type: %li, Title: %@, Subtitle: %@, Value: %@, Chart Value: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)recordCardItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 0);
  return v2;
}

+ (id)timelineSummaryCategoryTitleItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 2);
  return v2;
}

+ (id)timelineSummaryCategoryTitleItemWithCategoryType:(int64_t)a3
{
  WDMedicalRecordDisplayItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v4, "setDisplayItemType:", 2);
  -[WDMedicalRecordDisplayItem setPlacement:](v4, "setPlacement:", 3);
  +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType](WDMedicalRecordDisplayItemProvider, "supportedRecordCategoriesByCategoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setTitle:](v4, "setTitle:", v8);

  objc_msgSend(v7, "displayImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setImage:](v4, "setImage:", v9);

  objc_msgSend(v7, "categoryMetricColors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setMetricColors:](v4, "setMetricColors:", v10);

  -[WDMedicalRecordDisplayItem setRecordCategoryType:](v4, "setRecordCategoryType:", objc_msgSend(v7, "categoryType"));
  return v4;
}

+ (id)timelineSummaryDetailCategoryTitleItemWithMedicalRecord:(id)a3
{
  id v3;
  WDMedicalRecordDisplayItem *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v4, "setDisplayItemType:", 2);
  -[WDMedicalRecordDisplayItem setPlacement:](v4, "setPlacement:", 3);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setTitle:](v4, "setTitle:", v5);

  +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType](WDMedicalRecordDisplayItemProvider, "supportedRecordCategoriesByCategoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v3, "recordCategoryType");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setImage:](v4, "setImage:", v11);

  objc_msgSend(v10, "categoryMetricColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setMetricColors:](v4, "setMetricColors:", v12);

  -[WDMedicalRecordDisplayItem setRecordCategoryType:](v4, "setRecordCategoryType:", objc_msgSend(v10, "categoryType"));
  return v4;
}

+ (id)timelineSummaryCategoryMinimizedItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 3);
  return v2;
}

+ (id)timelineSummaryCategoryMinimizedItemWithCategoryType:(int64_t)a3
{
  WDMedicalRecordDisplayItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v4, "setDisplayItemType:", 3);
  -[WDMedicalRecordDisplayItem setPlacement:](v4, "setPlacement:", 3);
  +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType](WDMedicalRecordDisplayItemProvider, "supportedRecordCategoriesByCategoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "categoryMetricColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setMetricColors:](v4, "setMetricColors:", v8);

  -[WDMedicalRecordDisplayItem setRecordCategoryType:](v4, "setRecordCategoryType:", objc_msgSend(v7, "categoryType"));
  return v4;
}

+ (id)timelineSummarySourceTitleItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 1);
  return v2;
}

+ (id)timelineSummaryContentWithSubtitleItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 4);
  -[WDMedicalRecordDisplayItem setShowDisclosureIndicator:](v2, "setShowDisclosureIndicator:", 0);
  return v2;
}

+ (id)timelineSummaryValueItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 5);
  return v2;
}

+ (id)timelineSummaryReferenceRangeItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 6);
  return v2;
}

+ (id)timelineSummaryAppendixItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 7);
  -[WDMedicalRecordDisplayItem setSeparatorHidden:](v2, "setSeparatorHidden:", 1);
  return v2;
}

+ (id)timelineSummaryPanelTitleItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 8);
  -[WDMedicalRecordDisplayItem setPlacement:](v2, "setPlacement:", 1);
  return v2;
}

+ (id)detailTitleItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 14);
  return v2;
}

+ (id)detailSubtitleItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 15);
  return v2;
}

+ (id)detailSubtitleItemWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "detailSubtitleItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  objc_msgSend(v8, "setSubtitle:", v6);
  objc_msgSend(v8, "setSeparatorStyle:", 0);
  objc_msgSend(v8, "setSeparatorHidden:", 0);
  return v8;
}

+ (id)detailSubtitleItemWithTitle:(id)a3 subtitle:(id)a4 extraTopPadding:(BOOL)a5
{
  _BOOL8 v5;
  void *v6;

  v5 = a5;
  objc_msgSend(a1, "detailSubtitleItemWithTitle:subtitle:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExtraTopPadding:", v5);
  return v6;
}

+ (id)detailAttributedSubtitleItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 16);
  return v2;
}

+ (id)detailSpinnerItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 17);
  return v2;
}

+ (id)sectionHeaderItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 9);
  -[WDMedicalRecordDisplayItem setSeparatorStyle:](v2, "setSeparatorStyle:", 0);
  -[WDMedicalRecordDisplayItem setSeparatorHidden:](v2, "setSeparatorHidden:", 0);
  -[WDMedicalRecordDisplayItem setSeparatorInsets:](v2, "setSeparatorInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  return v2;
}

+ (id)accountSourceItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 10);
  return v2;
}

+ (id)standaloneItem
{
  WDMedicalRecordDisplayItem *v2;

  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v2, "setDisplayItemType:", 11);
  return v2;
}

+ (id)conceptHeaderItemWithCategoryType:(int64_t)a3 title:(id)a4
{
  id v5;
  WDMedicalRecordDisplayItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WDMedicalRecordDisplayItem *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a4;
  v6 = objc_alloc_init(WDMedicalRecordDisplayItem);
  +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType](WDMedicalRecordDisplayItemProvider, "supportedRecordCategoriesByCategoryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "displayImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setImage:](v6, "setImage:", v10);

  objc_msgSend(v9, "categoryMetricColors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setMetricColors:](v6, "setMetricColors:", v11);

  LODWORD(v11) = +[HRFeatures hideCategoryNameFromHeader](HRFeatures, "hideCategoryNameFromHeader");
  v12 = objc_msgSend(v5, "length");
  if ((_DWORD)v11)
  {
    if (v12)
    {
      v13 = v6;
      v14 = v5;
LABEL_8:
      -[WDMedicalRecordDisplayItem setTitle:](v13, "setTitle:", v14);
      goto LABEL_9;
    }
    objc_msgSend(v9, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordDisplayItem setTitle:](v6, "setTitle:", v19);

  }
  else
  {
    if (!v12)
    {
      v13 = v6;
      v14 = 0;
      goto LABEL_8;
    }
    v15 = (void *)MEMORY[0x1E0CB3940];
    HRLocalizedString(CFSTR("DATATYPE_HEADER_FORMAT_2_%@_%@"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v17, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordDisplayItem setTitle:](v6, "setTitle:", v18);

  }
LABEL_9:
  -[WDMedicalRecordDisplayItem setDisplayItemType:](v6, "setDisplayItemType:", 18);
  -[WDMedicalRecordDisplayItem setPlacement:](v6, "setPlacement:", 3);

  return v6;
}

+ (id)conceptCardItemWithCategoryType:(int64_t)a3
{
  WDMedicalRecordDisplayItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(WDMedicalRecordDisplayItem);
  +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType](WDMedicalRecordDisplayItemProvider, "supportedRecordCategoriesByCategoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setImage:](v4, "setImage:", v8);

  objc_msgSend(v7, "categoryMetricColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItem setMetricColors:](v4, "setMetricColors:", v9);

  -[WDMedicalRecordDisplayItem setDisplayItemType:](v4, "setDisplayItemType:", 19);
  -[WDMedicalRecordDisplayItem setPlacement:](v4, "setPlacement:", 2);

  return v4;
}

- (int64_t)displayItemType
{
  return self->_displayItemType;
}

- (void)setDisplayItemType:(int64_t)a3
{
  self->_displayItemType = a3;
}

- (BOOL)extraTopPadding
{
  return self->_extraTopPadding;
}

- (void)setExtraTopPadding:(BOOL)a3
{
  self->_extraTopPadding = a3;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  self->_separatorStyle = a3;
}

- (BOOL)separatorHidden
{
  return self->_separatorHidden;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  self->_separatorHidden = a3;
}

- (UIEdgeInsets)separatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInsets.top;
  left = self->_separatorInsets.left;
  bottom = self->_separatorInsets.bottom;
  right = self->_separatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
}

- (int64_t)placement
{
  return self->_placement;
}

- (void)setPlacement:(int64_t)a3
{
  self->_placement = a3;
}

- (int64_t)recordCategoryType
{
  return self->_recordCategoryType;
}

- (void)setRecordCategoryType:(int64_t)a3
{
  self->_recordCategoryType = a3;
}

- (BOOL)showDisclosureIndicator
{
  return self->_showDisclosureIndicator;
}

- (void)setShowDisclosureIndicator:(BOOL)a3
{
  self->_showDisclosureIndicator = a3;
}

- (BOOL)showSelection
{
  return self->_showSelection;
}

- (void)setShowSelection:(BOOL)a3
{
  self->_showSelection = a3;
}

- (BOOL)useRegularFontForSubtitle
{
  return self->_useRegularFontForSubtitle;
}

- (void)setUseRegularFontForSubtitle:(BOOL)a3
{
  self->_useRegularFontForSubtitle = a3;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_attributedTitle, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (void)setAttributedSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_attributedSubtitle, a3);
}

- (NSString)dateString
{
  return self->_dateString;
}

- (void)setDateString:(id)a3
{
  objc_storeStrong((id *)&self->_dateString, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIColor)imageColor
{
  return self->_imageColor;
}

- (void)setImageColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (HKUIMetricColors)metricColors
{
  return self->_metricColors;
}

- (void)setMetricColors:(id)a3
{
  objc_storeStrong((id *)&self->_metricColors, a3);
}

- (HKInspectableValueInRange)chartValueWithRange
{
  return self->_chartValueWithRange;
}

- (void)setChartValueWithRange:(id)a3
{
  objc_storeStrong((id *)&self->_chartValueWithRange, a3);
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
  objc_storeStrong((id *)&self->_valueString, a3);
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_unitString, a3);
}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (void)setMedicalRecord:(id)a3
{
  objc_storeStrong((id *)&self->_medicalRecord, a3);
}

- (WDMedicalRecordCategorySummary)categorySummary
{
  return (WDMedicalRecordCategorySummary *)objc_loadWeakRetained((id *)&self->_categorySummary);
}

- (void)setCategorySummary:(id)a3
{
  objc_storeWeak((id *)&self->_categorySummary, a3);
}

- (HKClinicalBrandable)brandableObject
{
  return self->_brandableObject;
}

- (void)setBrandableObject:(id)a3
{
  objc_storeStrong((id *)&self->_brandableObject, a3);
}

- (NSString)panelName
{
  return self->_panelName;
}

- (void)setPanelName:(id)a3
{
  objc_storeStrong((id *)&self->_panelName, a3);
}

- (NSString)headerString
{
  return self->_headerString;
}

- (void)setHeaderString:(id)a3
{
  objc_storeStrong((id *)&self->_headerString, a3);
}

- (HKConcept)ontologyConcept
{
  return self->_ontologyConcept;
}

- (void)setOntologyConcept:(id)a3
{
  objc_storeStrong((id *)&self->_ontologyConcept, a3);
}

- (NSNumber)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(id)a3
{
  objc_storeStrong((id *)&self->_recordCount, a3);
}

- (BOOL)actionEnabled
{
  return self->_actionEnabled;
}

- (void)setActionEnabled:(BOOL)a3
{
  self->_actionEnabled = a3;
}

- (NSString)contextString
{
  return self->_contextString;
}

- (void)setContextString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextString, 0);
  objc_storeStrong((id *)&self->_recordCount, 0);
  objc_storeStrong((id *)&self->_ontologyConcept, 0);
  objc_storeStrong((id *)&self->_headerString, 0);
  objc_storeStrong((id *)&self->_panelName, 0);
  objc_storeStrong((id *)&self->_brandableObject, 0);
  objc_destroyWeak((id *)&self->_categorySummary);
  objc_storeStrong((id *)&self->_medicalRecord, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_chartValueWithRange, 0);
  objc_storeStrong((id *)&self->_metricColors, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_imageColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
