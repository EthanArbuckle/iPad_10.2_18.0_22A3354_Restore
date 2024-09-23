@implementation HKOverlayRoomViewControllerDistributionContext

- (HKOverlayRoomViewControllerDistributionContext)initWithStyle:(int64_t)a3 namedPredicate:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 optionalDelegate:(id)a7 options:(int64_t)a8 mode:(int64_t)a9
{
  id v16;
  id v17;
  HKOverlayRoomViewControllerDistributionContext *v18;
  HKOverlayRoomViewControllerDistributionContext *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *styleToMetricColors;
  id v31;
  objc_super v32;
  _QWORD v33[8];
  _QWORD v34[10];

  v34[8] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)HKOverlayRoomViewControllerDistributionContext;
  v18 = -[HKOverlayRoomViewControllerIntegratedContext initWithOverlayChartController:applicationItems:mode:](&v32, sel_initWithOverlayChartController_applicationItems_mode_, a5, a6, a9);
  v19 = v18;
  if (v18)
  {
    v18->_distributionStyle = a3;
    objc_storeWeak((id *)&v18->_optionalDelegate, v17);
    v19->_options = a8;
    objc_storeStrong((id *)&v19->_namedPredicate, a4);
    v33[0] = &unk_1E9CEADF0;
    v31 = v16;
    +[HKUIMetricColors vitalsColors](HKUIMetricColors, "vitalsColors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v20;
    v33[1] = &unk_1E9CEAE08;
    +[HKUIMetricColors mindfulnessColors](HKUIMetricColors, "mindfulnessColors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v21;
    v33[2] = &unk_1E9CEAE20;
    +[HKUIMetricColors workoutContextViewColors](HKUIMetricColors, "workoutContextViewColors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v22;
    v33[3] = &unk_1E9CEAE38;
    +[HKUIMetricColors vitalsColors](HKUIMetricColors, "vitalsColors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v23;
    v33[4] = &unk_1E9CEAE50;
    +[HKUIMetricColors vitalsColors](HKUIMetricColors, "vitalsColors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v24;
    v33[5] = &unk_1E9CEAE68;
    +[HKUIMetricColors hearingHealthColors](HKUIMetricColors, "hearingHealthColors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v25;
    v33[6] = &unk_1E9CEAE80;
    +[HKUIMetricColors hearingHealthColors](HKUIMetricColors, "hearingHealthColors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[6] = v26;
    v33[7] = &unk_1E9CEAE98;
    +[HKUIMetricColors sleepColors](HKUIMetricColors, "sleepColors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[7] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 8);
    v28 = objc_claimAutoreleasedReturnValue();
    styleToMetricColors = v19->_styleToMetricColors;
    v19->_styleToMetricColors = (NSDictionary *)v28;

    v16 = v31;
  }

  return v19;
}

- (id)representativeDisplayType
{
  return -[HKOverlayRoomViewControllerDistributionContext _representativeDisplayTypeForStyle:](self, "_representativeDisplayTypeForStyle:", -[HKOverlayRoomViewControllerDistributionContext distributionStyle](self, "distributionStyle"));
}

- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5 isUnitIncludedInValue:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v34.receiver = self;
    v34.super_class = (Class)HKOverlayRoomViewControllerDistributionContext;
    -[HKOverlayRoomViewControllerIntegratedContext valueString:applicationItems:representativeDisplayType:isUnitIncludedInValue:](&v34, sel_valueString_applicationItems_representativeDisplayType_isUnitIncludedInValue_, v10, v11, v12, a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v33 = v11;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v17)
  {

    goto LABEL_19;
  }
  v18 = v17;
  v31 = v12;
  v32 = v10;
  v19 = 0;
  v20 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v36 != v20)
        objc_enumerationMutation(v16);
      v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_msgSend(v22, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v22, "userInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifiers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          continue;
        if (!v19)
          v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v22, "userInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifiers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObjectsFromArray:", v26);

      }
    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  }
  while (v18);

  v12 = v31;
  v10 = v32;
  if (v19)
  {
    v27 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringFromNumber:numberStyle:", v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  v11 = v33;

LABEL_21:
  return v29;
}

- (id)unitString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HKOverlayRoomViewControllerDistributionContext optionalDelegate](self, "optionalDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[HKOverlayRoomViewControllerDistributionContext optionalDelegate](self, "optionalDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unitString:applicationItems:representativeDisplayType:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HKOverlayRoomViewControllerDistributionContext;
    -[HKOverlayRoomViewControllerIntegratedContext unitString:applicationItems:representativeDisplayType:](&v16, sel_unitString_applicationItems_representativeDisplayType_, v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6 isUnitIncludedInValue:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  HKDisplayTypeContextItem *v15;
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

  v7 = a7;
  v11 = a4;
  v12 = a5;
  v13 = a3;
  -[HKOverlayRoomViewControllerDistributionContext representativeDisplayType](self, "representativeDisplayType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(HKDisplayTypeContextItem);
  -[HKOverlayRoomViewControllerDistributionContext _computeTitleAndIdentifierFromStyleAndPredicate](self, "_computeTitleAndIdentifierFromStyleAndPredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v15, "setTitle:", v17);

  objc_msgSend(v16, "accessibilityIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", v18);

  -[HKDisplayTypeContextItem setInfoHidden:](v15, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setValue:](v15, "setValue:", v13);

  -[HKDisplayTypeContextItem setValueContext:](v15, "setValueContext:", v12);
  if ((objc_msgSend(v14, "contextItemShouldDisplayEventCountForDistributionStyle:", -[HKOverlayRoomViewControllerDistributionContext distributionStyle](self, "distributionStyle")) & 1) == 0)
  {
    objc_msgSend(v14, "objectType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "healthStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_metadataValueDisplayTypeInStore:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HKDisplayTypeContextItem setUnit:](v15, "setUnit:", v11);
    }
    else
    {
      -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "unitController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedDisplayNameForDisplayType:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayTypeContextItem setUnit:](v15, "setUnit:", v25);

    }
    -[HKDisplayTypeContextItem setUseTightSpacingBetweenValueAndUnit:](v15, "setUseTightSpacingBetweenValueAndUnit:", objc_msgSend(v22, "contextItemShouldUseTightSpacingBetweenValueAndUnit"));
    -[HKDisplayTypeContextItem setIsUnitIncludedInValue:](v15, "setIsUnitIncludedInValue:", v7);

  }
  +[HKOverlayContextUtilities defaultMetricColorsForOverlayMode:](HKOverlayContextUtilities, "defaultMetricColorsForOverlayMode:", -[HKOverlayRoomViewControllerIntegratedContext overlayMode](self, "overlayMode"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v15, "setMetricColors:", v26);

  -[HKOverlayRoomViewControllerDistributionContext _selectedMetricColorsForDistributionStyle:](self, "_selectedMetricColorsForDistributionStyle:", -[HKOverlayRoomViewControllerDistributionContext distributionStyle](self, "distributionStyle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v15, "setSelectedMetricColors:", v27);

  return v15;
}

- (id)buildOverlayDisplayTypeForTimeScope:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;

  -[HKOverlayRoomViewControllerDistributionContext optionalDelegate](self, "optionalDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HKOverlayRoomViewControllerDistributionContext optionalDelegate](self, "optionalDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formatterForTimescope:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[HKOverlayRoomViewControllerDistributionContext _selectedMetricColorsForDistributionStyle:](self, "_selectedMetricColorsForDistributionStyle:", -[HKOverlayRoomViewControllerDistributionContext distributionStyle](self, "distributionStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewControllerIntegratedContext overlayChartController](self, "overlayChartController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKOverlayRoomViewControllerDistributionContext distributionStyle](self, "distributionStyle");
  v13 = -[HKOverlayRoomViewControllerDistributionContext options](self, "options");
  -[HKOverlayRoomViewControllerDistributionContext namedPredicate](self, "namedPredicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayTypeForQuantityDistributionStyle:timeScope:overlayColor:options:alternateFormatter:namedPredicate:", v12, a3, v10, v13, v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)fetchCachedDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 dateInterval:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = a5;
  -[HKOverlayRoomViewControllerIntegratedContext overlayChartController](self, "overlayChartController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKOverlayRoomViewControllerDistributionContext distributionStyle](self, "distributionStyle");
  objc_msgSend(v11, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewControllerDistributionContext namedPredicate](self, "namedPredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__HKOverlayRoomViewControllerDistributionContext_fetchCachedDataForTimeScope_resolution_dateInterval_completion___block_invoke;
  v18[3] = &unk_1E9C40198;
  v19 = v10;
  v17 = v10;
  objc_msgSend(v12, "cachedDataForQuantityDistributionStyle:timeScope:resolution:startDate:endDate:namedPredicate:completion:", v13, a3, a4, v14, v15, v16, v18);

}

uint64_t __113__HKOverlayRoomViewControllerDistributionContext_fetchCachedDataForTimeScope_resolution_dateInterval_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return a3 == 5 && a4 == 1;
}

- (id)_representativeDisplayTypeForStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 6:
      -[HKOverlayRoomViewControllerIntegratedContext overlayChartController](self, "overlayChartController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "primaryDisplayType");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayTypeController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_1E9CEAEB0;
      goto LABEL_8;
    case 4:
      -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayTypeController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_1E9CEAEC8;
      goto LABEL_8;
    case 5:
      -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayTypeController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_1E9CEAEE0;
      goto LABEL_8;
    case 7:
      -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayTypeController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_1E9CEAEF8;
LABEL_8:
      objc_msgSend(v5, "displayTypeWithIdentifier:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)_computeTitleAndIdentifierFromStyleAndPredicate
{
  void *v3;
  _HKContextTitleAndIdentifier *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _HKContextTitleAndIdentifier *v13;
  _HKContextTitleAndIdentifier *v14;
  void *v15;
  const __CFString *v16;

  switch(-[HKOverlayRoomViewControllerDistributionContext distributionStyle](self, "distributionStyle"))
  {
    case 0:
      -[HKOverlayRoomViewControllerDistributionContext namedPredicate](self, "namedPredicate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v4 = [_HKContextTitleAndIdentifier alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOverlayRoomViewControllerDistributionContext namedPredicate](self, "namedPredicate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedNameKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CB3940];
        -[HKOverlayRoomViewControllerDistributionContext namedPredicate](self, "namedPredicate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedNameKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hk_chartOverlayAccessibilityIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[_HKContextTitleAndIdentifier initWithTitle:accessibilityIdentifier:](v4, "initWithTitle:accessibilityIdentifier:", v8, v12);

        goto LABEL_12;
      }
      if ((self->_options & 2) == 0)
        goto LABEL_15;
      v14 = [_HKContextTitleAndIdentifier alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OVERLAY_RANGE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = CFSTR("Range");
      goto LABEL_11;
    case 1:
      v14 = [_HKContextTitleAndIdentifier alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BREATHE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = CFSTR("Breathe");
      goto LABEL_11;
    case 2:
      v14 = [_HKContextTitleAndIdentifier alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WORKOUT_SINGULAR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = CFSTR("Workouts");
      goto LABEL_11;
    case 3:
      v14 = [_HKContextTitleAndIdentifier alloc];
      HKHealthKitFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TACHYCARDIA"), &stru_1E9C4C428, *MEMORY[0x1E0CB5138]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = CFSTR("HighHeartRate");
      goto LABEL_11;
    case 4:
      v14 = [_HKContextTitleAndIdentifier alloc];
      HKHealthKitFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BRADYCARDIA"), &stru_1E9C4C428, CFSTR("Localizable-Tortuga"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = CFSTR("LowHeartRate");
      goto LABEL_11;
    case 5:
      v14 = [_HKContextTitleAndIdentifier alloc];
      HKHealthKitFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUDIO_EXPOSURE_EVENT"), &stru_1E9C4C428, *MEMORY[0x1E0CB5138]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = CFSTR("NoiseNotification");
      goto LABEL_11;
    case 6:
      v14 = [_HKContextTitleAndIdentifier alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = CFSTR("Sleep");
      goto LABEL_11;
    case 7:
      v14 = [_HKContextTitleAndIdentifier alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUDIO_OVERLAY_HEADPHONES_NOTIFICATIONS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = CFSTR("HeadphoneNotification");
LABEL_11:
      objc_msgSend(v15, "hk_chartOverlayAccessibilityIdentifier:", v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_HKContextTitleAndIdentifier initWithTitle:accessibilityIdentifier:](v14, "initWithTitle:accessibilityIdentifier:", v6, v7);
LABEL_12:

      break;
    default:
LABEL_15:
      v13 = 0;
      break;
  }
  return v13;
}

- (id)_selectedMetricColorsForDistributionStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    -[HKOverlayRoomViewControllerDistributionContext styleToMetricColors](self, "styleToMetricColors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKOverlayRoomViewControllerDistributionContext representativeDisplayType](self, "representativeDisplayType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKOverlayContextUtilities selectedMetricColorsForCategory:](HKOverlayContextUtilities, "selectedMetricColorsForCategory:", objc_msgSend(v4, "categoryIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKOverlayRoomViewControllerDistributionContext *v4;
  HKOverlayRoomViewControllerDistributionContext *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = (HKOverlayRoomViewControllerDistributionContext *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HKOverlayRoomViewControllerDistributionContext distributionStyle](self, "distributionStyle");
      if (v6 == -[HKOverlayRoomViewControllerDistributionContext distributionStyle](v5, "distributionStyle")
        && (v7 = -[HKOverlayRoomViewControllerDistributionContext options](self, "options"),
            v7 == -[HKOverlayRoomViewControllerDistributionContext options](v5, "options")))
      {
        -[HKOverlayRoomViewControllerDistributionContext optionalDelegate](self, "optionalDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cacheDataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOverlayRoomViewControllerDistributionContext optionalDelegate](v5, "optionalDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cacheDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v10 == v13;

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (int64_t)distributionStyle
{
  return self->_distributionStyle;
}

- (void)setDistributionStyle:(int64_t)a3
{
  self->_distributionStyle = a3;
}

- (HKOverlayRoomViewControllerIntegratedContextDelegate)optionalDelegate
{
  return (HKOverlayRoomViewControllerIntegratedContextDelegate *)objc_loadWeakRetained((id *)&self->_optionalDelegate);
}

- (void)setOptionalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_optionalDelegate, a3);
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (HKInteractiveChartOverlayPredicate)namedPredicate
{
  return self->_namedPredicate;
}

- (void)setNamedPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_namedPredicate, a3);
}

- (NSDictionary)styleToMetricColors
{
  return self->_styleToMetricColors;
}

- (void)setStyleToMetricColors:(id)a3
{
  objc_storeStrong((id *)&self->_styleToMetricColors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleToMetricColors, 0);
  objc_storeStrong((id *)&self->_namedPredicate, 0);
  objc_destroyWeak((id *)&self->_optionalDelegate);
}

@end
