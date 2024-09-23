@implementation HKOverlayRoomOxygenSaturationViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDisplayDate:applicationItems:mode:preferredOverlay:trendModel:factorDisplayTypes:", v19, v20, 1, a7, v17, v16);

  objc_msgSend(v21, "setRestorationUserActivity:", v18);
  objc_msgSend(v21, "setAdditionalChartOptions:", a11);
  return v21;
}

- (HKOverlayRoomOxygenSaturationViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  HKOverlayRoomOxygenSaturationViewController *v22;
  NSMutableArray *v23;
  NSMutableArray *contextDelegates;
  NSNumber *preferredOverlayIndex;
  uint64_t v26;
  unsigned int v27;
  BOOL v28;
  objc_super v30;

  v14 = a3;
  v15 = a7;
  v16 = a8;
  v17 = a4;
  +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:](HKOverlayRoomTrendContext, "findInitialDateFromTrendModel:", v15);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v14;
  v21 = v20;

  v30.receiver = self;
  v30.super_class = (Class)HKOverlayRoomOxygenSaturationViewController;
  v22 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v30, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v21, v17, v16, a5);

  if (v22)
  {
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contextDelegates = v22->_contextDelegates;
    v22->_contextDelegates = v23;

    v22->_preferredOverlay = a6;
    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    objc_storeStrong((id *)&v22->_trendModel, a7);
    if (a5 == 3)
    {
      v26 = 0;
    }
    else
    {
      v27 = objc_msgSend(v15, "selectTrendInitially");
      if (a5)
        v28 = a6 == 0;
      else
        v28 = 1;
      if (v28)
        v26 = v27;
      else
        v26 = 1;
    }
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v22, "setShouldSelectInitialOverlay:", v26);
  }

  return v22;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OXYGEN_SATURATION"), &stru_1E9C4C428, *MEMORY[0x1E0CB5138]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKOverlayRoomOxygenSaturationViewController;
  -[HKOverlayRoomOxygenSaturationViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    -[HKOverlayRoomOxygenSaturationViewController _installOverrideOnboardingGestureRecognizer](self, "_installOverrideOnboardingGestureRecognizer");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    -[HKOverlayRoomOxygenSaturationViewController _uninstallOverrideOnboardingGestureRecognizer](self, "_uninstallOverrideOnboardingGestureRecognizer");
  v5.receiver = self;
  v5.super_class = (Class)HKOverlayRoomOxygenSaturationViewController;
  -[HKOverlayRoomOxygenSaturationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)_installOverrideOnboardingGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HKOverlayRoomOxygenSaturationViewController _createOverrideOnboardingGestureRecognizer](self, "_createOverrideOnboardingGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomOxygenSaturationViewController setOverrideOnboardingRecognizer:](self, "setOverrideOnboardingRecognizer:", v3);

  -[HKOverlayRoomOxygenSaturationViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomOxygenSaturationViewController overrideOnboardingRecognizer](self, "overrideOnboardingRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v5);

}

- (void)_uninstallOverrideOnboardingGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;

  -[HKOverlayRoomOxygenSaturationViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomOxygenSaturationViewController overrideOnboardingRecognizer](self, "overrideOnboardingRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v5);

  -[HKOverlayRoomOxygenSaturationViewController setOverrideOnboardingRecognizer:](self, "setOverrideOnboardingRecognizer:", 0);
}

- (id)_createOverrideOnboardingGestureRecognizer
{
  return -[_HKOxygenSaturationOverrideTapGestureRecognizer initWithTarget:action:]([_HKOxygenSaturationOverrideTapGestureRecognizer alloc], "initWithTarget:action:", self, sel__overrideOnboardingAction_);
}

- (void)_overrideOnboardingAction:(id)a3
{
  void *v4;
  HKFeatureAvailabilityInternalSettingsConfiguration *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  HKFeatureAvailabilityInternalSettingsConfiguration *v9;
  HKFeatureAvailabilityInternalSettingsViewController *v10;
  void *v11;
  void *v12;
  HKFeatureAvailabilityInternalSettingsViewController *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CF0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HKFeatureAvailabilityInternalSettingsConfiguration alloc];
  v6 = *MEMORY[0x1E0CB5080];
  v7 = *MEMORY[0x1E0CB5E30];
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKFeatureAvailabilityInternalSettingsConfiguration initWithFeatureIdentifier:userDefaultsDomain:userDefaultsFeatureEnabledKey:userDefaultsDisabledOverrideKey:options:samplesTypesToDelete:](v5, "initWithFeatureIdentifier:userDefaultsDomain:userDefaultsFeatureEnabledKey:userDefaultsDisabledOverrideKey:options:samplesTypesToDelete:", v6, v7, CFSTR("HKRPBloodOxygenSaturationEnabled"), CFSTR("OverrideIsRemoteDisabled"), 15, v8);

  v10 = [HKFeatureAvailabilityInternalSettingsViewController alloc];
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "healthStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKFeatureAvailabilityInternalSettingsViewController initWithHealthStore:configuration:](v10, "initWithHealthStore:configuration:", v12, v9);

  -[HKOverlayRoomOxygenSaturationViewController showViewController:sender:](self, "showViewController:sender:", v13, self);
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB6978];
  v4 = *MEMORY[0x1E0CB5CF0];
  v5 = a3;
  objc_msgSend(v3, "quantityTypeForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayTypeForObjectType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8;
  id v9;
  HKOverlayContextSectionContainer *v10;
  void *v11;
  HKOverlayContextSectionContainer *v12;
  HKOverlayContextSectionContainer **v13;
  HKOverlayContextSectionContainer *v14;
  void *v15;
  HKOverlayContextSectionContainer *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3 != 3)
    {
      v15 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_7;
    }
    v14 = [HKOverlayContextSectionContainer alloc];
    -[HKOverlayRoomOxygenSaturationViewController _configureContextSectionsForFullMode:applicationItems:overlayChartController:](self, "_configureContextSectionsForFullMode:applicationItems:overlayChartController:", 3, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v14, "initWithContainerTitle:overlayContextSections:", 0, v11);
    v17 = v12;
    v13 = &v17;
  }
  else
  {
    v10 = [HKOverlayContextSectionContainer alloc];
    -[HKOverlayRoomOxygenSaturationViewController _configureContextSectionsForSingleOverlayMode:applicationItems:overlayChartController:](self, "_configureContextSectionsForSingleOverlayMode:applicationItems:overlayChartController:", a3, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v10, "initWithContainerTitle:overlayContextSections:", 0, v11);
    v18[0] = v12;
    v13 = (HKOverlayContextSectionContainer **)v18;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v15;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  HKOverlayRoomOxygenSaturationViewController *v10;
  int64_t v11;
  HKChartSummaryTrendModel *trendModel;
  void *v13;
  HKOverlayRoomOxygenSaturationViewController *v14;

  v8 = a5;
  v9 = a4;
  v10 = [HKOverlayRoomOxygenSaturationViewController alloc];
  v11 = -[HKOverlayRoomOxygenSaturationViewController preferredOverlay](self, "preferredOverlay");
  trendModel = self->_trendModel;
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKOverlayRoomOxygenSaturationViewController initWithDisplayDate:applicationItems:mode:preferredOverlay:trendModel:factorDisplayTypes:](v10, "initWithDisplayDate:applicationItems:mode:preferredOverlay:trendModel:factorDisplayTypes:", v9, v8, a3, v11, trendModel, v13);

  -[HKOverlayRoomViewController setAdditionalChartOptions:](v14, "setAdditionalChartOptions:", -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3));
  return v14;
}

- (id)createChartOverlayViewController
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") != 3)
  {
    v3 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:](HKOverlayRoomTrendContext, "findStartingTimeScopeFromTrendModel:", self->_trendModel);
    if (v3 != 8)
    {
      v4 = v3;
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeScopeController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSelectedTimeScope:", v4);

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)HKOverlayRoomOxygenSaturationViewController;
  -[HKOverlayRoomViewController createChartOverlayViewController](&v8, sel_createChartOverlayViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getChartSummaryTrendModelToModify
{
  return self->_trendModel;
}

- (id)_configureContextSectionsForSingleOverlayMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSNumber *preferredOverlayIndex;
  HKChartSummaryTrendModel *trendModel;
  void *v13;
  HKOverlayRoomTrendContext *v14;
  void *v15;
  HKOverlayContextSection *v16;
  void *v17;
  HKOverlayContextSection *v18;
  void *v19;
  HKOverlayContextSection *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HKOverlayRoomOxygenSaturationViewController _makeLatestContextForMode:applicationItems:overlayChartController:](self, "_makeLatestContextForMode:applicationItems:overlayChartController:", a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  preferredOverlayIndex = self->_preferredOverlayIndex;
  self->_preferredOverlayIndex = (NSNumber *)&unk_1E9CEB0F0;

  trendModel = self->_trendModel;
  if (trendModel && -[HKChartSummaryTrendModel selectTrendInitially](trendModel, "selectTrendInitially"))
  {
    -[HKOverlayRoomOxygenSaturationViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:]([HKOverlayRoomTrendContext alloc], "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v13, self->_trendModel, v9, v8, a3);
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTrendAccessibilityDelegate:", v14);

    v10 = v14;
  }
  v16 = [HKOverlayContextSection alloc];
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:](v16, "initWithSectionTitle:overlayContextItems:", 0, v17);

  v21 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_configureContextSectionsForFullMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HKOverlayRoomTrendContext *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HKOverlayRoomTrendContext *v20;
  void *v21;
  HKOverlayRoomTrendContext *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HKOverlayContextSection *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKOverlayRoomOxygenSaturationViewController _makeLatestContextForMode:applicationItems:overlayChartController:](self, "_makeLatestContextForMode:applicationItems:overlayChartController:", a3, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);
  v12 = v11;
  -[HKOverlayRoomOxygenSaturationViewController _makeRangeContextForMode:applicationItems:overlayChartController:](self, "_makeRangeContextForMode:applicationItems:overlayChartController:", a3, v8, v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:");
  v31 = 0;
  -[HKOverlayRoomOxygenSaturationViewController _makeAverageContextForMode:applicationItems:overlayChartController:contextDelegate:](self, "_makeAverageContextForMode:applicationItems:overlayChartController:contextDelegate:", a3, v8, v9, &v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v31;
  objc_msgSend(v10, "addObject:", v13);
  if (v14)
  {
    -[HKOverlayRoomOxygenSaturationViewController contextDelegates](self, "contextDelegates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v14);

  }
  if (HKFeatureFlagBloodOxygenSaturationEnabled())
  {
    v30 = 0;
    -[HKOverlayRoomOxygenSaturationViewController _makePressureOverlayContextForMode:applicationItems:overlayChartController:context:contextDelegate:](self, "_makePressureOverlayContextForMode:applicationItems:overlayChartController:context:contextDelegate:", a3, v8, v9, 1, &v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v30;
    objc_msgSend(v10, "addObject:", v16);
    if (v17)
    {
      -[HKOverlayRoomOxygenSaturationViewController contextDelegates](self, "contextDelegates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v17);

    }
  }
  -[HKOverlayRoomOxygenSaturationViewController _makeSleepContextForMode:applicationItems:overlayChartController:](self, "_makeSleepContextForMode:applicationItems:overlayChartController:", a3, v8, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v19);
  v20 = v12;
  if (self->_trendModel)
  {
    -[HKOverlayRoomOxygenSaturationViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:]([HKOverlayRoomTrendContext alloc], "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v21, self->_trendModel, v9, v8, a3);
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTrendAccessibilityDelegate:", v22);

    objc_msgSend(v10, "addObject:", v22);
    v20 = v12;
    if (-[HKChartSummaryTrendModel selectTrendInitially](self->_trendModel, "selectTrendInitially"))
    {
      v20 = v22;

    }
  }
  v24 = objc_msgSend(v10, "indexOfObject:", v20);
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_preferredOverlayIndex, v25);
  if (v24 != 0x7FFFFFFFFFFFFFFFLL)

  v26 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:]([HKOverlayContextSection alloc], "initWithSectionTitle:overlayContextItems:", 0, v10);
  v32[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_makePressureOverlayContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 context:(unint64_t)a6 contextDelegate:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  HKInteractiveChartOverlayPredicate *v17;
  void *v18;
  void *v19;
  HKInteractiveChartOverlayPredicate *v20;
  _HKOxygenSaturationIntegratedContextDelegate *v21;
  void *v22;
  _HKOxygenSaturationIntegratedContextDelegate *v23;
  void *v24;

  v13 = a4;
  v14 = a5;
  HKOxygenSaturationLowBarometricPressureThresholdQuantity();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    if (a6 != 1)
    {
      v23 = 0;
      v20 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectsWithMetadataKey:operatorType:value:", *MEMORY[0x1E0CB54C0], 1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [HKInteractiveChartOverlayPredicate alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SCANDIUM_OVERLAY_LOW_AIR_PRESSURE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Scandium"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HKInteractiveChartOverlayPredicate initWithPredicate:name:](v17, "initWithPredicate:name:", v16, v19);

    v21 = [_HKOxygenSaturationIntegratedContextDelegate alloc];
    -[HKOverlayRoomViewController primaryDisplayType](self, "primaryDisplayType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[_HKOxygenSaturationIntegratedContextDelegate initWithCustomDataSource:primaryDisplayType:context:](v21, "initWithCustomDataSource:primaryDisplayType:context:", 0, v22, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomOxygenSaturationViewController.m"), 338, CFSTR("unsupported context"));
    v23 = 0;
    v20 = 0;
  }

LABEL_7:
  +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:](HKOverlayRoomViewControllerIntegratedContext, "distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", 0, v20, v14, v13, v23, 0, a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7 && v23)
    *a7 = objc_retainAutorelease(v23);

  return v24;
}

- (id)_makeLatestContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v7;
  id v8;
  HKOverlayRoomViewControllerLastQuantityContext *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[HKOverlayRoomViewControllerLastQuantityContext initWithOverlayChartController:applicationItems:mode:]([HKOverlayRoomViewControllerLastQuantityContext alloc], "initWithOverlayChartController:applicationItems:mode:", v7, v8, a3);

  return v9;
}

- (id)_makeRangeContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:](HKOverlayRoomViewControllerIntegratedContext, "distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", 0, 0, a5, a4, 0, 2, a3);
}

- (id)_makeAverageContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 contextDelegate:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _HKOxygenSaturationIntegratedContextDelegate *v16;
  _HKOxygenSaturationIntegratedContextDelegate *v17;
  void *v18;

  v10 = a5;
  v11 = a4;
  -[HKOverlayRoomOxygenSaturationViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unitController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "healthStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomOxygenSaturationViewController _buildAverageDataSourceWithUnitController:displayType:healthStore:](self, "_buildAverageDataSourceWithUnitController:displayType:healthStore:", v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[_HKOxygenSaturationIntegratedContextDelegate initWithCustomDataSource:primaryDisplayType:context:]([_HKOxygenSaturationIntegratedContextDelegate alloc], "initWithCustomDataSource:primaryDisplayType:context:", v15, v12, 0);
  v17 = v16;
  if (a6)
    *a6 = objc_retainAutorelease(v16);
  +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:](HKOverlayRoomViewControllerIntegratedContext, "quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:", *MEMORY[0x1E0CB5CF0], v10, v11, v17, 0, a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_makeSleepContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:](HKOverlayRoomViewControllerIntegratedContext, "distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", 6, 0, a5, a4, 0, 128, a3);
}

- (id)_buildAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKQuantityTypeDataSource *v11;
  void *v12;
  HKInteractiveChartOverlayNamedDataSource *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:]([HKQuantityTypeDataSource alloc], "initWithUnitController:options:displayType:healthStore:", v10, 2, v9, v8);

  -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v11, "setUserInfoCreationBlock:", &__block_literal_global_19);
  -[HKOverlayRoomOxygenSaturationViewController _buildGranularAverageDataSourceTitleFromTimeScope](self, "_buildGranularAverageDataSourceTitleFromTimeScope");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v11, CFSTR("HKOverlayRoomNamedChartCacheDataSource_OxygenSaturation"), v12);

  return v13;
}

HKInteractiveChartSinglePointData *__113__HKOverlayRoomOxygenSaturationViewController__buildAverageDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  HKInteractiveChartSinglePointData *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB6CD0];
  v3 = a2;
  objc_msgSend(v2, "percentUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(HKInteractiveChartSinglePointData);
  objc_msgSend(v3, "averageQuantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v4);
  -[HKInteractiveChartSinglePointData setValue:](v5, "setValue:");

  -[HKInteractiveChartSinglePointData setUnit:](v5, "setUnit:", v4);
  objc_msgSend(v3, "statisticsInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v5, "setStatisticsInterval:", v7);

  v8 = objc_msgSend(v3, "recordCount");
  -[HKInteractiveChartSinglePointData setRecordCount:](v5, "setRecordCount:", v8);

  return v5;
}

- (id)_buildGranularAverageDataSourceTitleFromTimeScope
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __96__HKOverlayRoomOxygenSaturationViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E9C40548;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  v3 = _Block_copy(v2);

  return v3;
}

__CFString *__96__HKOverlayRoomOxygenSaturationViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;

  switch(a2)
  {
    case 0:
    case 1:
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HKOverlayRoomOxygenSaturationViewController.m"), 479, CFSTR("Unsupported zoom level (%ld)"), a2);
      v5 = &stru_1E9C4C428;
      goto LABEL_10;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("SCANDIUM_OVERLAY_AVERAGE_MONTHLY");
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("SCANDIUM_OVERLAY_AVERAGE_WEEKLY");
      goto LABEL_9;
    case 4:
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("SCANDIUM_OVERLAY_AVERAGE_DAILY");
      goto LABEL_9;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("SCANDIUM_OVERLAY_AVERAGE_HOURLY");
      goto LABEL_9;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("SCANDIUM_OVERLAY_AVERAGE_BYMINUTE");
LABEL_9:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Scandium"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      break;
    default:
      v5 = &stru_1E9C4C428;
      break;
  }
  return v5;
}

- (NSMutableArray)contextDelegates
{
  return self->_contextDelegates;
}

- (void)setContextDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_contextDelegates, a3);
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (UITapGestureRecognizer)overrideOnboardingRecognizer
{
  return self->_overrideOnboardingRecognizer;
}

- (void)setOverrideOnboardingRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_overrideOnboardingRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideOnboardingRecognizer, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

@end
