@implementation HKOverlayRoomWalkingViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:trendModel:factorDisplayTypes:", v20, v21, 1, v22, a7, v18, v17);

  objc_msgSend(v23, "setRestorationUserActivity:", v19);
  objc_msgSend(v23, "setAdditionalChartOptions:", a11);
  return v23;
}

- (HKOverlayRoomWalkingViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  HKOverlayRoomWalkingViewController *v22;
  NSMutableArray *v23;
  NSMutableArray *contextDelegates;
  NSNumber *preferredOverlayIndex;
  uint64_t v26;
  unsigned int v27;
  BOOL v28;
  id v31;
  objc_super v32;

  v14 = a3;
  v31 = a6;
  v15 = a8;
  v16 = a9;
  v17 = a4;
  +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:](HKOverlayRoomTrendContext, "findInitialDateFromTrendModel:", v15);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v14;
  v21 = v20;

  v32.receiver = self;
  v32.super_class = (Class)HKOverlayRoomWalkingViewController;
  v22 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v32, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v21, v17, v16, a5);

  if (v22)
  {
    objc_storeStrong((id *)&v22->_quantityTypeIdentifier, a6);
    v22->_preferredOverlay = a7;
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contextDelegates = v22->_contextDelegates;
    v22->_contextDelegates = v23;

    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    objc_storeStrong((id *)&v22->_trendModel, a8);
    if (a5 == 3)
    {
      v26 = 0;
    }
    else
    {
      v27 = objc_msgSend(v15, "selectTrendInitially");
      if (a5)
        v28 = a7 == 0;
      else
        v28 = 1;
      if (v28)
        v26 = v27;
      else
        v26 = 1;
    }
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v22, "setShouldSelectInitialOverlay:", v26, a7, v31);
  }

  return v22;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKOverlayRoomWalkingViewController;
  -[HKOverlayRoomViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  __CFString *v9;

  if (-[NSString isEqualToString:](self->_quantityTypeIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5DC0]))
  {
    HKHealthKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *MEMORY[0x1E0CB5138];
    v8 = CFSTR("WALKING_SPEED");
  }
  else if (-[NSString isEqualToString:](self->_quantityTypeIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5DB0]))
  {
    HKHealthKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *MEMORY[0x1E0CB5138];
    v8 = CFSTR("WALKING_DOUBLE_SUPPORT_PERCENTAGE");
  }
  else if (-[NSString isEqualToString:](self->_quantityTypeIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5D68]))
  {
    HKHealthKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *MEMORY[0x1E0CB5138];
    v8 = CFSTR("STAIR_ASCENT_SPEED");
  }
  else if (-[NSString isEqualToString:](self->_quantityTypeIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5D70]))
  {
    HKHealthKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *MEMORY[0x1E0CB5138];
    v8 = CFSTR("STAIR_DESCENT_SPEED");
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_quantityTypeIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5DC8]))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomWalkingViewController.m"), 133, CFSTR("Unsupported identifier (%@)"), self->_quantityTypeIdentifier);
      v9 = &stru_1E9C4C428;
      goto LABEL_12;
    }
    HKHealthKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *MEMORY[0x1E0CB5138];
    v8 = CFSTR("WALKING_STEP_LENGTH");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v8, &stru_1E9C4C428, v7);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v9;
}

- (id)showAllFiltersButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHOW_MORE_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  void *v3;
  NSString *quantityTypeIdentifier;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB6978];
  quantityTypeIdentifier = self->_quantityTypeIdentifier;
  v5 = a3;
  objc_msgSend(v3, "quantityTypeForIdentifier:", quantityTypeIdentifier);
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
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(void *);
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HKOverlayRoomTrendContext *v26;
  void *v27;
  HKOverlayRoomTrendContext *v28;
  void *v29;
  HKOverlayRoomTrendContext *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  HKOverlayRoomTrendContext *v36;
  void (**v37)(void *);
  NSNumber *preferredOverlayIndex;
  HKOverlayContextSectionContainer *v39;
  id v40;
  HKOverlayContextSectionContainer *v41;
  void *v42;
  HKOverlayContextSectionContainer *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void (**v54)(void *);
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  int64_t v59;
  _QWORD v60[4];
  id v61;
  id v62;
  int64_t v63;
  _QWORD aBlock[4];
  id v65;
  id v66;
  int64_t v67;
  HKOverlayContextSectionContainer *v68;
  HKOverlayRoomTrendContext *v69;
  HKOverlayContextSectionContainer *v70;
  HKOverlayContextSectionContainer *v71;
  _QWORD v72[5];

  v72[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HKOverlayRoomWalkingViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E9C40418;
  v12 = v9;
  v65 = v12;
  v13 = v8;
  v66 = v13;
  v67 = a3;
  v14 = (void (**)(void *))_Block_copy(aBlock);
  v60[0] = v11;
  v60[1] = 3221225472;
  v60[2] = __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v60[3] = &unk_1E9C403F0;
  v15 = v12;
  v61 = v15;
  v16 = v13;
  v62 = v16;
  v63 = a3;
  v17 = _Block_copy(v60);
  v55[0] = v11;
  v55[1] = 3221225472;
  v55[2] = __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v55[3] = &unk_1E9C426C8;
  v55[4] = self;
  v18 = v16;
  v56 = v18;
  v19 = v10;
  v57 = v19;
  v20 = v15;
  v58 = v20;
  v59 = a3;
  v21 = _Block_copy(v55);
  v54 = v14;
  v14[2](v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v22;
  v52 = v17;
  (*((void (**)(void *, _QWORD, uint64_t))v17 + 2))(v17, 0, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v23;
  v51 = v21;
  (*((void (**)(void *, NSString *))v21 + 2))(v21, self->_quantityTypeIdentifier);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (HKOverlayRoomTrendContext *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomWalkingViewController trendModel](self, "trendModel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v18;
  v50 = v19;
  if (v27)
  {
    v28 = [HKOverlayRoomTrendContext alloc];
    -[HKOverlayRoomWalkingViewController trendModel](self, "trendModel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](v28, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v19, v29, v20, v18, a3);

    -[HKOverlayRoomViewController chartController](self, "chartController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTrendAccessibilityDelegate:", v30);

    objc_msgSend(v25, "arrayByAddingObject:", v30);
    v32 = objc_claimAutoreleasedReturnValue();

    -[HKOverlayRoomWalkingViewController trendModel](self, "trendModel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "selectTrendInitially");

    v35 = v20;
    if (v34)
    {
      v30 = v30;

      v25 = (void *)v32;
      v36 = v30;
      goto LABEL_7;
    }
    v25 = (void *)v32;
  }
  else
  {
    v30 = 0;
    v35 = v20;
  }
  v36 = v26;
LABEL_7:
  v37 = v54;
  if ((unint64_t)(a3 - 1) < 2)
  {
    preferredOverlayIndex = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = (NSNumber *)&unk_1E9CEB4E0;

    v39 = [HKOverlayContextSectionContainer alloc];
    v69 = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v40, 0, v40);
    v41 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    v70 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v39, "initWithContainerTitle:overlayContextSections:", 0, v42);
    v71 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v50;
LABEL_17:

    v37 = v54;
    goto LABEL_18;
  }
  v45 = v50;
  if (a3 == 3)
  {
    v46 = objc_msgSend(v25, "indexOfObject:", v36);
    if (v46 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v47 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&self->_preferredOverlayIndex, v47);
    if (v46 != 0x7FFFFFFFFFFFFFFFLL)

    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v40, 0, v25);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v48);

    v41 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:]([HKOverlayContextSectionContainer alloc], "initWithContainerTitle:overlayContextSections:", 0, v40);
    v68 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v44 = (void *)MEMORY[0x1E0C9AA60];
LABEL_18:

  return v44;
}

HKOverlayRoomViewControllerLastQuantityContext *__110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(_QWORD *a1)
{
  return -[HKOverlayRoomViewControllerLastQuantityContext initWithOverlayChartController:applicationItems:mode:]([HKOverlayRoomViewControllerLastQuantityContext alloc], "initWithOverlayChartController:applicationItems:mode:", a1[4], a1[5], a1[6]);
}

id __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:](HKOverlayRoomViewControllerIntegratedContext, "distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", a2, 0, a1[4], a1[5], 0, a3, a1[6]);
}

id __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _HKWalkingQuantityContextDelegate *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "unitController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_buildWalkingAverageDataSourceWithUnitController:displayType:healthStore:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_HKWalkingQuantityContextDelegate initWithCustomDataSource:primaryDisplayType:]([_HKWalkingQuantityContextDelegate alloc], "initWithCustomDataSource:primaryDisplayType:", v8, *(_QWORD *)(a1 + 48));
  if (v9)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "addObject:", v9);
  +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:](HKOverlayRoomViewControllerIntegratedContext, "quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v9, 0, *(_QWORD *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createChartOverlayViewController
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") != 3)
  {
    -[HKOverlayRoomWalkingViewController trendModel](self, "trendModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:](HKOverlayRoomTrendContext, "findStartingTimeScopeFromTrendModel:", v3);

    if (v4 != 8)
    {
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeScopeController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSelectedTimeScope:", v4);

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)HKOverlayRoomWalkingViewController;
  -[HKOverlayRoomViewController createChartOverlayViewController](&v8, sel_createChartOverlayViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  HKOverlayRoomWalkingViewController *v10;
  NSString *quantityTypeIdentifier;
  int64_t preferredOverlay;
  void *v13;
  void *v14;
  HKOverlayRoomWalkingViewController *v15;

  v8 = a5;
  v9 = a4;
  v10 = [HKOverlayRoomWalkingViewController alloc];
  quantityTypeIdentifier = self->_quantityTypeIdentifier;
  preferredOverlay = self->_preferredOverlay;
  -[HKOverlayRoomWalkingViewController trendModel](self, "trendModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKOverlayRoomWalkingViewController initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:trendModel:factorDisplayTypes:](v10, "initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:trendModel:factorDisplayTypes:", v9, v8, a3, quantityTypeIdentifier, preferredOverlay, v13, v14);

  -[HKOverlayRoomViewController setAdditionalChartOptions:](v15, "setAdditionalChartOptions:", -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3));
  return v15;
}

- (id)_buildWalkingAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKQuantityTypeDataSource *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  HKInteractiveChartOverlayNamedDataSource *v19;
  uint64_t v21;
  uint64_t v22;
  HKInteractiveChartSinglePointData *(*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:]([HKQuantityTypeDataSource alloc], "initWithUnitController:options:displayType:healthStore:", v8, 66, v9, v10);

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __111__HKOverlayRoomWalkingViewController__buildWalkingAverageDataSourceWithUnitController_displayType_healthStore___block_invoke;
  v24 = &unk_1E9C40520;
  v25 = v8;
  v26 = v9;
  v12 = v9;
  v13 = v8;
  -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v11, "setUserInfoCreationBlock:", &v21);
  -[HKOverlayRoomWalkingViewController _buildGranularAverageDataSourceTitleFromTimeScope](self, "_buildGranularAverageDataSourceTitleFromTimeScope");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@"), CFSTR("HKOverlayRoomNamedChartCacheDataSource_"), v17, v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v11, v18, v14);
  return v19;
}

HKInteractiveChartSinglePointData *__111__HKOverlayRoomWalkingViewController__buildWalkingAverageDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  HKInteractiveChartSinglePointData *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "unitForDisplayType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  objc_msgSend(v4, "averageQuantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v5);
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");

  -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v5);
  objc_msgSend(v4, "statisticsInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v6, "setStatisticsInterval:", v8);

  v9 = objc_msgSend(v4, "recordCount");
  -[HKInteractiveChartSinglePointData setRecordCount:](v6, "setRecordCount:", v9);

  return v6;
}

- (id)_buildAverageDataSourceTitleFromTimeScope
{
  return &__block_literal_global_236;
}

id __79__HKOverlayRoomWalkingViewController__buildAverageDataSourceTitleFromTimeScope__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("AVERAGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)_buildGranularAverageDataSourceTitleFromTimeScope
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__HKOverlayRoomWalkingViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E9C40548;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  v3 = _Block_copy(v2);

  return v3;
}

__CFString *__87__HKOverlayRoomWalkingViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HKOverlayRoomWalkingViewController.m"), 332, CFSTR("Unsupported zoom level (%ld)"), a2);
      v5 = &stru_1E9C4C428;
      goto LABEL_10;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("OVERLAY_AVERAGE_MONTHLY");
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("OVERLAY_AVERAGE_WEEKLY");
      goto LABEL_9;
    case 4:
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("OVERLAY_AVERAGE_DAILY");
      goto LABEL_9;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("OVERLAY_AVERAGE_HOURLY");
      goto LABEL_9;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("OVERLAY_AVERAGE_BYMINUTE");
LABEL_9:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      break;
    default:
      v5 = &stru_1E9C4C428;
      break;
  }
  return v5;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
  objc_storeStrong((id *)&self->_quantityTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

@end
