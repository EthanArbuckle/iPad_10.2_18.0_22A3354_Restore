@implementation HKInteractiveChartDisplayType

- (id)_initWithDisplayName:(id)a3 unitDisplayNameOverrides:(id)a4 localizationTableOverride:(id)a5 chartingRules:(id)a6 unitName:(id)a7 valueFormatter:(id)a8 dataTypeCode:(int64_t)a9 baseDisplayType:(id)a10 mainGraphSeries:(id)a11 seriesForTimeScopeMapping:(id)a12
{
  id v17;
  id v18;
  HKDisplayTypeChartingRules *v19;
  id v20;
  HKDisplayTypeBehavior *v21;
  void *v22;
  HKDisplayTypePresentationConfiguration *v23;
  HKDisplayTypePresentation *v24;
  HKDisplayTypePresentation *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  HKDisplayTypeLocalization *v29;
  void *v30;
  void *v31;
  id v32;
  HKDisplayTypeLocalization *v33;
  HKDisplayTypeChartingRules *v34;
  void *v35;
  void *v36;
  HKDisplayTypeLocalization *v37;
  id v38;
  int64_t v39;
  void *v40;
  HKInteractiveChartDisplayType *v41;
  void *v42;
  NSDictionary *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v57;
  id v58;
  void *v60;
  HKDisplayTypePresentationConfiguration *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  HKDisplayTypeChartingRules *v67;
  id v68;
  HKDisplayTypeBehavior *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v17 = a4;
  v18 = a5;
  v19 = (HKDisplayTypeChartingRules *)a6;
  v57 = a7;
  v66 = a7;
  v65 = a8;
  v20 = a10;
  v63 = a11;
  v62 = a12;
  if (!v19)
    v19 = -[HKDisplayTypeChartingRules initWithDefaultChartStyle:]([HKDisplayTypeChartingRules alloc], "initWithDefaultChartStyle:", 1);
  v67 = v19;
  v21 = [HKDisplayTypeBehavior alloc];
  objc_msgSend(v20, "behavior");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v53) = 0;
  LOWORD(v53) = 256;
  v69 = -[HKDisplayTypeBehavior initWithStatisticsMergeStrategy:preferredCalendaryDayAlignment:allowsSourceReordering:unitPreferenceChangeConfirmation:chartsRelativeData:appearsInDataTypeSearch:supportsAssociatedSamples:canBecomeFavorite:hidden:](v21, "initWithStatisticsMergeStrategy:preferredCalendaryDayAlignment:allowsSourceReordering:unitPreferenceChangeConfirmation:chartsRelativeData:appearsInDataTypeSearch:supportsAssociatedSamples:canBecomeFavorite:hidden:", 0, 0, 1, 0, objc_msgSend(v22, "chartsRelativeData"), 1, v53);

  v23 = -[HKDisplayTypePresentationConfiguration initWithCurrentValue:secondaryValue:detailChart:singleDailyValue:]([HKDisplayTypePresentationConfiguration alloc], "initWithCurrentValue:secondaryValue:detailChart:singleDailyValue:", 0, 0, 0, 0);
  v24 = [HKDisplayTypePresentation alloc];
  v25 = v24;
  v64 = v20;
  v61 = v23;
  if (v20)
  {
    objc_msgSend(v20, "presentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scaleFactor");
    LOBYTE(v54) = 0;
    v27 = (void *)MEMORY[0x1E0C9AA70];
    v28 = -[HKDisplayTypePresentation initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:](v25, "initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:", v23, MEMORY[0x1E0C9AA70], 0, 0, 0, 0, v54, 0, 0, 0);

    v29 = [HKDisplayTypeLocalization alloc];
    objc_msgSend(v20, "localization");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "displayNameKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v32 = v17;
    else
      v32 = v27;
    v33 = -[HKDisplayTypeLocalization initWithDisplayNameKey:labelDisplayNameKey:localizationTableNameOverride:localizedKeySuffix:unitNameKeyOverrides:](v29, "initWithDisplayNameKey:labelDisplayNameKey:localizationTableNameOverride:localizedKeySuffix:unitNameKeyOverrides:", v31, 0, v18, 0, v32);

    v34 = v67;
    v35 = v68;
  }
  else
  {
    LOBYTE(v54) = 0;
    v36 = (void *)MEMORY[0x1E0C9AA70];
    v28 = -[HKDisplayTypePresentation initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:](v24, "initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:", v23, MEMORY[0x1E0C9AA70], 0, 0, 0, 0, 1.0, v54, 0, 0, 0);
    v37 = [HKDisplayTypeLocalization alloc];
    if (v17)
      v38 = v17;
    else
      v38 = v36;
    v35 = v68;
    v33 = -[HKDisplayTypeLocalization initWithDisplayNameKey:labelDisplayNameKey:localizationTableNameOverride:localizedKeySuffix:unitNameKeyOverrides:](v37, "initWithDisplayNameKey:labelDisplayNameKey:localizationTableNameOverride:localizedKeySuffix:unitNameKeyOverrides:", v68, 0, v18, 0, v38);
    v34 = v67;
  }
  v39 = -[HKInteractiveChartDisplayType _internalDisplayTypeIdentifier](self, "_internalDisplayTypeIdentifier");
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", a9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v74.receiver = self;
  v74.super_class = (Class)HKInteractiveChartDisplayType;
  v60 = (void *)v28;
  v41 = -[HKDisplayType initWithDisplayTypeIdentifier:categoryIdentifier:secondaryCategoryIdentifiers:objectType:behavior:presentation:localization:chartingRules:defaultChartingPredicate:chartingPredicatesByTimeScope:](&v74, sel_initWithDisplayTypeIdentifier_categoryIdentifier_secondaryCategoryIdentifiers_objectType_behavior_presentation_localization_chartingRules_defaultChartingPredicate_chartingPredicatesByTimeScope_, v39, 0, MEMORY[0x1E0C9AA60], v40, v69, v28, v33, v34, 0, 0);

  if (v41)
  {
    v55 = v18;
    v58 = v17;
    objc_storeStrong((id *)&v41->_specifiedDisplayName, a3);
    objc_storeStrong((id *)&v41->_specifiedUnitName, v57);
    objc_storeStrong((id *)&v41->_specifiedValueFormatter, a8);
    objc_storeStrong((id *)&v41->_baseDisplayType, a10);
    objc_storeStrong((id *)&v41->_mainGraphSeries, a11);
    objc_storeStrong((id *)&v41->_seriesForTimeScopeMapping, a12);
    -[HKDisplayType presentation](v41, "presentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeries setIsCriticalForAutoscale:](v41->_mainGraphSeries, "setIsCriticalForAutoscale:", objc_msgSend(v42, "isCriticalForAutoscale"));

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v43 = v41->_seriesForTimeScopeMapping;
    v44 = -[NSDictionary countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v71 != v46)
            objc_enumerationMutation(v43);
          v48 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          -[HKDisplayType presentation](v41, "presentation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "isCriticalForAutoscale");
          -[NSDictionary objectForKeyedSubscript:](v41->_seriesForTimeScopeMapping, "objectForKeyedSubscript:", v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setIsCriticalForAutoscale:", v50);

        }
        v45 = -[NSDictionary countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      }
      while (v45);
    }

    v34 = v67;
    v35 = v68;
    v17 = v58;
    v18 = v55;
  }

  return v41;
}

- (int64_t)_internalDisplayTypeIdentifier
{
  int64_t v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_internalDisplayTypeIdentifier__identifierLock);
  if (_internalDisplayTypeIdentifier__currentIdentifier)
    v2 = _internalDisplayTypeIdentifier__currentIdentifier;
  else
    v2 = HKDisplayTypeIdentifierEnding;
  _internalDisplayTypeIdentifier__currentIdentifier = v2 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&_internalDisplayTypeIdentifier__identifierLock);
  return v2;
}

- (HKInteractiveChartDisplayType)initWithGraphSeries:(id)a3 displayName:(id)a4 unitName:(id)a5 valueFormatter:(id)a6 dataTypeCode:(int64_t)a7
{
  return (HKInteractiveChartDisplayType *)-[HKInteractiveChartDisplayType _initWithDisplayName:unitDisplayNameOverrides:localizationTableOverride:chartingRules:unitName:valueFormatter:dataTypeCode:baseDisplayType:mainGraphSeries:seriesForTimeScopeMapping:](self, "_initWithDisplayName:unitDisplayNameOverrides:localizationTableOverride:chartingRules:unitName:valueFormatter:dataTypeCode:baseDisplayType:mainGraphSeries:seriesForTimeScopeMapping:", a4, 0, 0, 0, a5, a6, a7, 0, a3, 0);
}

- (HKInteractiveChartDisplayType)initWithGraphSeries:(id)a3 baseDisplayType:(id)a4 dataTypeCode:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HKInteractiveChartDisplayType *v16;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "localization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unitNameKeyOverrides");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizationTableNameOverride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chartingRules");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKInteractiveChartDisplayType _initWithDisplayName:unitDisplayNameOverrides:localizationTableOverride:chartingRules:unitName:valueFormatter:dataTypeCode:baseDisplayType:mainGraphSeries:seriesForTimeScopeMapping:](self, "_initWithDisplayName:unitDisplayNameOverrides:localizationTableOverride:chartingRules:unitName:valueFormatter:dataTypeCode:baseDisplayType:mainGraphSeries:seriesForTimeScopeMapping:", v10, v12, v14, v15, &stru_1E9C4C428, 0, a5, v7, v8, 0);

  return v16;
}

- (HKInteractiveChartDisplayType)initWithGraphSeries:(id)a3 baseDisplayType:(id)a4 valueFormatter:(id)a5 dataTypeCode:(int64_t)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKInteractiveChartDisplayType *v17;
  void *v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "localization");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unitNameKeyOverrides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localization");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizationTableNameOverride");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chartingRules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKInteractiveChartDisplayType _initWithDisplayName:unitDisplayNameOverrides:localizationTableOverride:chartingRules:unitName:valueFormatter:dataTypeCode:baseDisplayType:mainGraphSeries:seriesForTimeScopeMapping:](self, "_initWithDisplayName:unitDisplayNameOverrides:localizationTableOverride:chartingRules:unitName:valueFormatter:dataTypeCode:baseDisplayType:mainGraphSeries:seriesForTimeScopeMapping:", v11, v13, v15, v16, &stru_1E9C4C428, v8, a6, v9, v10, 0);

  return v17;
}

- (HKInteractiveChartDisplayType)initWithBaseDisplayType:(id)a3 valueFormatter:(id)a4 dataTypeCode:(int64_t)a5 seriesForTimeScopeMapping:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKInteractiveChartDisplayType *v17;
  void *v21;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "localization");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unitNameKeyOverrides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localization");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizationTableNameOverride");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chartingRules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKInteractiveChartDisplayType _initWithDisplayName:unitDisplayNameOverrides:localizationTableOverride:chartingRules:unitName:valueFormatter:dataTypeCode:baseDisplayType:mainGraphSeries:seriesForTimeScopeMapping:](self, "_initWithDisplayName:unitDisplayNameOverrides:localizationTableOverride:chartingRules:unitName:valueFormatter:dataTypeCode:baseDisplayType:mainGraphSeries:seriesForTimeScopeMapping:", v11, v13, v15, v16, &stru_1E9C4C428, v9, a5, v10, 0, v8);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKInteractiveChartDisplayType;
  v4 = -[HKDisplayType copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_specifiedDisplayName, "copy");
  v6 = (void *)*((_QWORD *)v4 + 18);
  *((_QWORD *)v4 + 18) = v5;

  v7 = -[NSString copy](self->_specifiedUnitName, "copy");
  v8 = (void *)*((_QWORD *)v4 + 19);
  *((_QWORD *)v4 + 19) = v7;

  v9 = -[NSDictionary copy](self->_seriesForTimeScopeMapping, "copy");
  v10 = (void *)*((_QWORD *)v4 + 21);
  *((_QWORD *)v4 + 21) = v9;

  objc_storeStrong((id *)v4 + 20, self->_specifiedValueFormatter);
  objc_storeStrong((id *)v4 + 17, self->_mainGraphSeries);
  objc_storeStrong((id *)v4 + 16, self->_baseDisplayType);
  objc_storeStrong((id *)v4 + 15, self->_color);
  return v4;
}

- (id)graphSeriesForTimeScope:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKInteractiveChartDisplayType mainGraphSeries](self, "mainGraphSeries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HKInteractiveChartDisplayType mainGraphSeries](self, "mainGraphSeries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKInteractiveChartDisplayType seriesForTimeScopeMapping](self, "seriesForTimeScopeMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)displayName
{
  return self->_specifiedDisplayName;
}

- (id)unitNameForValue:(id)a3 unitPreferenceController:(id)a4
{
  return self->_specifiedUnitName;
}

- (UIColor)color
{
  UIColor *color;
  objc_super v4;

  color = self->_color;
  if (color)
    return color;
  v4.receiver = self;
  v4.super_class = (Class)HKInteractiveChartDisplayType;
  -[HKDisplayType color](&v4, sel_color);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)hk_interactiveChartsFormatterForTimeScope:(int64_t)a3
{
  HKInteractiveChartDataFormatter *specifiedValueFormatter;
  HKDisplayType *baseDisplayType;

  specifiedValueFormatter = self->_specifiedValueFormatter;
  if (specifiedValueFormatter)
    return specifiedValueFormatter;
  baseDisplayType = self->_baseDisplayType;
  if (!baseDisplayType)
    return specifiedValueFormatter;
  -[HKDisplayType hk_interactiveChartsFormatterForTimeScope:](baseDisplayType, "hk_interactiveChartsFormatterForTimeScope:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKInteractiveChartDisplayType displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKInteractiveChartInternalDisplayType(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (HKGraphSeries)mainGraphSeries
{
  return self->_mainGraphSeries;
}

- (NSString)specifiedDisplayName
{
  return self->_specifiedDisplayName;
}

- (NSString)specifiedUnitName
{
  return self->_specifiedUnitName;
}

- (HKInteractiveChartDataFormatter)specifiedValueFormatter
{
  return self->_specifiedValueFormatter;
}

- (NSDictionary)seriesForTimeScopeMapping
{
  return self->_seriesForTimeScopeMapping;
}

- (void)setSeriesForTimeScopeMapping:(id)a3
{
  objc_storeStrong((id *)&self->_seriesForTimeScopeMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesForTimeScopeMapping, 0);
  objc_storeStrong((id *)&self->_specifiedValueFormatter, 0);
  objc_storeStrong((id *)&self->_specifiedUnitName, 0);
  objc_storeStrong((id *)&self->_specifiedDisplayName, 0);
  objc_storeStrong((id *)&self->_mainGraphSeries, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
