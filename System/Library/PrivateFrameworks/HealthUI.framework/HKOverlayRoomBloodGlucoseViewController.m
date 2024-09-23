@implementation HKOverlayRoomBloodGlucoseViewController

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

- (HKOverlayRoomBloodGlucoseViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  HKOverlayRoomBloodGlucoseViewController *v22;
  NSNumber *preferredOverlayIndex;
  NSMutableArray *v24;
  NSMutableArray *contextDelegates;
  uint64_t v26;
  HKChartCache *percentInRangeChartCache;
  uint64_t v28;
  unsigned int v29;
  BOOL v30;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:](HKOverlayRoomTrendContext, "findInitialDateFromTrendModel:", v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v14;
  v21 = v20;

  v32.receiver = self;
  v32.super_class = (Class)HKOverlayRoomBloodGlucoseViewController;
  v22 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v32, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v21, v15, v17, a5);

  if (v22)
  {
    v22->_preferredOverlay = a6;
    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contextDelegates = v22->_contextDelegates;
    v22->_contextDelegates = v24;

    +[HKOverlayRoomBloodGlucoseViewController _buildPercentInRangeChartCacheWithApplicationItems:](HKOverlayRoomBloodGlucoseViewController, "_buildPercentInRangeChartCacheWithApplicationItems:", v15);
    v26 = objc_claimAutoreleasedReturnValue();
    percentInRangeChartCache = v22->_percentInRangeChartCache;
    v22->_percentInRangeChartCache = (HKChartCache *)v26;

    objc_storeStrong((id *)&v22->_trendModel, a7);
    if (a5 == 3)
    {
      v28 = 0;
    }
    else
    {
      v29 = objc_msgSend(v16, "selectTrendInitially");
      if (a5)
        v30 = a6 == 0;
      else
        v30 = 1;
      if (v30)
        v28 = v29;
      else
        v28 = 1;
    }
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v22, "setShouldSelectInitialOverlay:", v28);
  }

  return v22;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BLOOD_GLUCOSE"), &stru_1E9C4C428, *MEMORY[0x1E0CB5138]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  v4 = *MEMORY[0x1E0CB5A98];
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
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(void *, _QWORD, uint64_t);
  id v15;
  id v16;
  void *v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  void *v32;
  HKOverlayRoomTrendContext *v33;
  void *v34;
  uint64_t v35;
  HKOverlayRoomTrendContext *v36;
  NSNumber *v37;
  NSNumber *preferredOverlayIndex;
  HKOverlayContextSectionContainer *v39;
  void *v40;
  void *v41;
  HKOverlayContextSectionContainer *v42;
  HKOverlayContextSectionContainer *v43;
  void *v44;
  HKOverlayContextSectionContainer **v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  HKOverlayContextSectionContainer *v50;
  HKOverlayContextSectionContainer *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;
  int64_t v61;
  _QWORD v62[4];
  id v63;
  id v64;
  int64_t v65;
  _QWORD aBlock[4];
  id v67;
  id v68;
  int64_t v69;
  void *v70;
  HKOverlayContextSectionContainer *v71;
  _QWORD v72[2];
  HKOverlayContextSectionContainer *v73;
  void *v74;
  void *v75;
  HKOverlayContextSectionContainer *v76;
  _QWORD v77[2];
  _QWORD v78[5];

  v78[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HKOverlayRoomBloodGlucoseViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E9C403F0;
  v12 = v9;
  v67 = v12;
  v13 = v8;
  v68 = v13;
  v69 = a3;
  v14 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
  v62[0] = v11;
  v62[1] = 3221225472;
  v62[2] = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v62[3] = &unk_1E9C40418;
  v15 = v12;
  v63 = v15;
  v16 = v13;
  v64 = v16;
  v65 = a3;
  v17 = _Block_copy(v62);
  v57[0] = v11;
  v57[1] = 3221225472;
  v57[2] = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v57[3] = &unk_1E9C40440;
  v57[4] = self;
  v18 = v16;
  v58 = v18;
  v54 = v10;
  v59 = v54;
  v55 = v15;
  v60 = v55;
  v61 = a3;
  v19 = (void (**)(_QWORD))_Block_copy(v57);
  v53 = v17;
  (*((void (**)(void *))v17 + 2))(v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v20;
  v14[2](v14, 0, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v21;
  v19[2](v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v18;
  objc_msgSend(v18, "healthStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HKOverlayRoomBloodGlucoseViewController _isEnhancedChartingEnabledWithHealthStore:](self, "_isEnhancedChartingEnabledWithHealthStore:", v24);

  if (v25)
  {
    v14[2](v14, 2, 32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v26;
    v14[2](v14, 6, 128);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v29;
  }
  v30 = -[HKOverlayRoomBloodGlucoseViewController _initialPillForPreference:](self, "_initialPillForPreference:", -[HKOverlayRoomBloodGlucoseViewController preferredOverlay](self, "preferredOverlay"));
  if (v30 == 2)
  {
    v14[2](v14, 2, 32);
    goto LABEL_7;
  }
  if (v30 == 1)
  {
    v14[2](v14, 6, 128);
LABEL_7:
    v31 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v19[2](v19);
  v31 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v32 = (void *)v31;
  if (self->_trendModel)
  {
    v33 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:]([HKOverlayRoomTrendContext alloc], "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v54, self->_trendModel, v55, v56, a3);
    -[HKOverlayRoomViewController chartController](self, "chartController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTrendAccessibilityDelegate:", v33);

    objc_msgSend(v23, "arrayByAddingObject:", v33);
    v35 = objc_claimAutoreleasedReturnValue();

    if (-[HKChartSummaryTrendModel selectTrendInitially](self->_trendModel, "selectTrendInitially"))
    {
      v36 = v33;

      v32 = v36;
    }

    v23 = (void *)v35;
  }
  if ((unint64_t)(a3 - 1) < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
    v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    preferredOverlayIndex = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = v37;

    v39 = [HKOverlayContextSectionContainer alloc];
    v74 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v40, 0, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v42 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    v43 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v39, "initWithContainerTitle:overlayContextSections:", 0, v42);
    v76 = v43;
    v44 = (void *)MEMORY[0x1E0C99D20];
    v45 = &v76;
    goto LABEL_24;
  }
  if (a3 == 3)
  {
    v46 = objc_msgSend(v23, "indexOfObject:", v32);
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

    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(v49, 0, v23);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v52 = [HKOverlayContextSectionContainer alloc];
      v70 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v52, "initWithContainerTitle:overlayContextSections:", 0, v41);
      v71 = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    -[HKOverlayRoomBloodGlucoseViewController _buildPercentInRangeOverlayContextSectionWithApplicationItems:overlayChartController:](self, "_buildPercentInRangeOverlayContextSectionWithApplicationItems:overlayChartController:", v56, v55);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = [HKOverlayContextSectionContainer alloc];
    v72[0] = v40;
    v72[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v42 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    v43 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v50, "initWithContainerTitle:overlayContextSections:", 0, v42);
    v73 = v43;
    v44 = (void *)MEMORY[0x1E0C99D20];
    v45 = &v73;
LABEL_24:
    objc_msgSend(v44, "arrayWithObjects:count:", v45, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
    goto LABEL_26;
  }
  v48 = (void *)MEMORY[0x1E0C9AA60];
LABEL_26:

  return v48;
}

HKOverlayContextSection *__115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKOverlayContextSection *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:]([HKOverlayContextSection alloc], "initWithSectionTitle:overlayContextItems:", v5, v4);

  return v6;
}

id __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:](HKOverlayRoomViewControllerIntegratedContext, "distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", a2, 0, a1[4], a1[5], 0, a3, a1[6]);
}

HKOverlayRoomViewControllerLastQuantityContext *__115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(_QWORD *a1)
{
  return -[HKOverlayRoomViewControllerLastQuantityContext initWithOverlayChartController:applicationItems:mode:]([HKOverlayRoomViewControllerLastQuantityContext alloc], "initWithOverlayChartController:applicationItems:mode:", a1[4], a1[5], a1[6]);
}

id __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _HKBloodGlucoseQuantityContextDelegate *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "unitController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_buildBloodGlucoseAverageDataSourceWithUnitController:displayType:healthStore:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_HKBloodGlucoseQuantityContextDelegate initWithCustomDataSource:primaryDisplayType:]([_HKBloodGlucoseQuantityContextDelegate alloc], "initWithCustomDataSource:primaryDisplayType:", v6, *(_QWORD *)(a1 + 48));
  if (v7)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1352), "addObject:", v7);
  +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:](HKOverlayRoomViewControllerIntegratedContext, "quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:", *MEMORY[0x1E0CB5A98], *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v7, 0, *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_isEnhancedChartingEnabledWithHealthStore:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  unsigned int v12;
  void *v13;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB6708]);
    v8 = (void *)objc_msgSend(v7, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x1E0CB5028], v4);
    v15 = 0;
    objc_msgSend(v8, "onboardedCountryCodeSupportedStateWithError:", &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    if (v9)
    {
      v11 = objc_msgSend(v9, "integerValue");
      if (v11 <= 5)
        v12 = (5u >> v11) & 1;
      else
        LOBYTE(v12) = 1;
    }
    else
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        -[HKOverlayRoomBloodGlucoseViewController _isEnhancedChartingEnabledWithHealthStore:].cold.1(v13, (uint64_t)self, (uint64_t)v10);
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (int64_t)_initialPillForPreference:(int64_t)a3
{
  int64_t result;
  NSObject *v5;

  result = 0;
  if (a3 > 9)
  {
    if (a3 == 11)
      return result;
    if (a3 == 10)
      return 2;
  }
  else
  {
    if (!a3)
      return result;
    if (a3 == 9)
      return 1;
  }
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    -[HKOverlayRoomBloodGlucoseViewController _initialPillForPreference:].cold.1(a3, v5);
  return 0;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  HKOverlayRoomBloodGlucoseViewController *v10;
  int64_t v11;
  HKChartSummaryTrendModel *trendModel;
  void *v13;
  HKOverlayRoomBloodGlucoseViewController *v14;

  v8 = a5;
  v9 = a4;
  v10 = [HKOverlayRoomBloodGlucoseViewController alloc];
  v11 = -[HKOverlayRoomBloodGlucoseViewController preferredOverlay](self, "preferredOverlay");
  trendModel = self->_trendModel;
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKOverlayRoomBloodGlucoseViewController initWithDisplayDate:applicationItems:mode:preferredOverlay:trendModel:factorDisplayTypes:](v10, "initWithDisplayDate:applicationItems:mode:preferredOverlay:trendModel:factorDisplayTypes:", v9, v8, a3, v11, trendModel, v13);

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
  v8.super_class = (Class)HKOverlayRoomBloodGlucoseViewController;
  -[HKOverlayRoomViewController createChartOverlayViewController](&v8, sel_createChartOverlayViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getChartSummaryTrendModelToModify
{
  return self->_trendModel;
}

- (id)_buildPercentInRangeOverlayContextSectionWithApplicationItems:(id)a3 overlayChartController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void (**v9)(void *, uint64_t);
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
  void *v25;
  id v26;
  void (**v27)(void *, void *, void *, void *, void *);
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD aBlock[5];
  _QWORD v33[6];

  v33[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke;
  aBlock[3] = &unk_1E9C40490;
  aBlock[4] = self;
  v27 = (void (**)(void *, void *, void *, void *, void *))_Block_copy(aBlock);
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke_3;
  v29[3] = &unk_1E9C404B8;
  v29[4] = self;
  v30 = v6;
  v31 = v7;
  v28 = v7;
  v26 = v6;
  v9 = (void (**)(void *, uint64_t))_Block_copy(v29);
  v9[2](v9, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v10;
  v9[2](v9, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v11;
  v9[2](v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v12;
  v9[2](v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("GLUCOSE_OVERLAY_PERCENT_IN_RANGE_DESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomBloodGlucoseViewController _buildEuglycemicRangeStringWithApplicationItems:](self, "_buildEuglycemicRangeStringWithApplicationItems:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("GLUCOSE_OVERLAY_PERCENT_IN_RANGE_SECTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("GLUCOSE_OVERLAY_LEARN_MORE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2](v27, v20, v18, v22, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

HKOverlayContextSection *__128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  HKOverlayContextSection *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  HKOverlayContextSection *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id location;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v13 = [HKOverlayContextSection alloc];
  v14 = (void *)MEMORY[0x1E0DC3428];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke_2;
  v21[3] = &unk_1E9C40468;
  objc_copyWeak(&v25, &location);
  v15 = v9;
  v22 = v15;
  v16 = v10;
  v17 = *(_QWORD *)(a1 + 32);
  v23 = v16;
  v24 = v17;
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HKOverlayContextSection initWithSectionTitle:overlayContextItems:accessoryButtonAction:](v13, "initWithSectionTitle:overlayContextItems:accessoryButtonAction:", v15, v12, v18);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v19;
}

void __128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HKInfographicContentItem *v14;
  HKInfographicViewController *v15;
  void *v16;
  HKInfographicViewController *v17;
  void *v18;
  void *v19;
  HKModalNavigationController *v20;
  HKInfographicContentItem *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B58], 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    v6 = *(_QWORD *)(a1 + 32);
    v24 = *MEMORY[0x1E0DC1138];
    v7 = v24;
    v25[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v8);

    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    v11 = *(_QWORD *)(a1 + 40);
    v22 = v7;
    v23 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v12);

    v14 = -[HKInfographicContentItem initWithTitle:description:]([HKInfographicContentItem alloc], "initWithTitle:description:", v9, v13);
    v15 = [HKInfographicViewController alloc];
    v21 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKInfographicViewController initWithContentItems:](v15, "initWithContentItems:", v16);

    HKHealthKitFrameworkBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("BLOOD_GLUCOSE"), &stru_1E9C4C428, *MEMORY[0x1E0CB5138]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicViewController setTitle:](v17, "setTitle:", v19);

    v20 = -[HKModalNavigationController initWithRootViewController:]([HKModalNavigationController alloc], "initWithRootViewController:", v17);
    objc_msgSend(*(id *)(a1 + 48), "hk_presentModalCardViewController:fullScreen:animated:completion:", v20, 0, 1, 0);

  }
}

_HKBloodGlucosePercentInRangeContext *__128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  _HKBloodGlucosePercentInRangeContext *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _HKBloodGlucosePercentInRangeContext *v9;

  objc_msgSend(*(id *)(a1 + 32), "_buildPercentInRangeDisplayTypeWithApplicationItems:classification:", *(_QWORD *)(a1 + 40), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [_HKBloodGlucosePercentInRangeContext alloc];
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "displayTypeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_HKBloodGlucosePercentInRangeContext initWithBaseDisplayType:classification:overlayChartController:unitController:displayTypeController:](v5, "initWithBaseDisplayType:classification:overlayChartController:unitController:displayTypeController:", v4, a2, v6, v7, v8);

  return v9;
}

- (id)_buildEuglycemicRangeStringWithApplicationItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  -[HKOverlayRoomBloodGlucoseViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitForDisplayType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedDisplayNameForDisplayType:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A38], "ATTDEuglycemicRangeWithUnit:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimum");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v7);
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unitController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValue(v14, v5, v15, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "maximum");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValueForUnit:", v7);
  v19 = v18;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unitController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  HKFormattedStringFromValue(v20, v5, v21, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OVERLAY_RANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", v25, v16, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  HKFormatValueAndUnit(v26, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_buildPercentInRangeDisplayTypeWithApplicationItems:(id)a3 classification:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKInteractiveChartBloodGlucosePercentInRangeFormatter *v13;
  HKInteractiveChartDisplayType *v14;

  v6 = (void *)MEMORY[0x1E0CB6978];
  v7 = *MEMORY[0x1E0CB5A98];
  v8 = a3;
  objc_msgSend(v6, "quantityTypeForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayTypeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayTypeForObjectType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomBloodGlucoseViewController _buildPercentInRangeStackedBarSeriesForClassification:](self, "_buildPercentInRangeStackedBarSeriesForClassification:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(HKInteractiveChartBloodGlucosePercentInRangeFormatter);
  -[HKInteractiveChartBloodGlucosePercentInRangeFormatter setHighlightedClassification:](v13, "setHighlightedClassification:", a4);
  v14 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:]([HKInteractiveChartDisplayType alloc], "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v12, v11, v13, 15);

  return v14;
}

- (id)_buildPercentInRangeStackedBarSeriesForClassification:(int64_t)a3
{
  HKStackedBarSeries *v5;
  HKStrokeStyle *v6;
  void *v7;
  void *v8;
  void *v9;
  HKSolidFillStyle *v10;
  void *v11;
  HKSolidFillStyle *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKNumericAxisConfiguration *v18;
  _HKAxisLabelDimensionBloodGlucosePercentInRange *v19;
  void *v20;
  HKCacheBackedChartSeriesDataSource *v21;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(HKStackedBarSeries);
  v6 = objc_alloc_init(HKStrokeStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStrokeStyle setStrokeColor:](v6, "setStrokeColor:", v7);

  -[HKStrokeStyle setLineWidth:](v6, "setLineWidth:", 3.0);
  -[HKStrokeStyle setBlendMode:](v6, "setBlendMode:", 22);
  -[HKBarSeries setUnselectedStrokeStyle:](v5, "setUnselectedStrokeStyle:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v8, 3.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBarSeries setTiledStrokeStyle:](v5, "setTiledStrokeStyle:", v9);

  -[HKBarSeries setCornerRadii:](v5, "setCornerRadii:", 1.5, 1.5);
  -[HKStackedBarSeries setShouldRoundBottomCorners:](v5, "setShouldRoundBottomCorners:", 1);
  v10 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_stackedBarSeriesUnselectedColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v10, "setColor:", v11);

  v12 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsKeyColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v12, "setColor:", v13);

  v14 = (void *)MEMORY[0x1E0C99DE8];
  v23[0] = v10;
  v23[1] = v10;
  v23[2] = v10;
  v23[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:atIndexedSubscript:", v12, a3);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    objc_msgSend(v16, "setObject:atIndexedSubscript:", v12, 0);
    objc_msgSend(v17, "addIndex:", 0);
  }
  -[HKStackedBarSeries setUnseparatedSegmentIndices:](v5, "setUnseparatedSegmentIndices:", v17);
  -[HKStackedBarSeries setUnselectedFillStyles:](v5, "setUnselectedFillStyles:", v16);
  v18 = objc_alloc_init(HKNumericAxisConfiguration);
  v19 = objc_alloc_init(_HKAxisLabelDimensionBloodGlucosePercentInRange);
  -[HKNumericAxisConfiguration setLabelDimension:](v18, "setLabelDimension:", v19);

  +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:](HKNumericAxis, "standardNumericYAxisWithConfigurationOverrides:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries setYAxis:](v5, "setYAxis:", v20);

  v21 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  -[HKCacheBackedChartSeriesDataSource setChartCache:](v21, "setChartCache:", self->_percentInRangeChartCache);
  -[HKGraphSeries setDataSource:](v5, "setDataSource:", v21);

  return v5;
}

+ (id)_buildPercentInRangeChartCacheWithApplicationItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKChartCache *v9;
  HKBloodGlucosePercentInRangeDataSource *v10;
  void *v11;
  void *v12;
  HKBloodGlucosePercentInRangeDataSource *v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeForObjectType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "chartDataCacheController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findCustomCachesForDisplayType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hk_firstObjectPassingTest:", &__block_literal_global_241);
  v9 = (HKChartCache *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(HKChartCache);
    v10 = [HKBloodGlucosePercentInRangeDataSource alloc];
    objc_msgSend(v3, "healthStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unitController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKBloodGlucosePercentInRangeDataSource initWithHealthStore:unitController:](v10, "initWithHealthStore:unitController:", v11, v12);

    -[HKChartCache setDataSource:](v9, "setDataSource:", v13);
    +[HKOutstandingFetchOperationManager sharedOperationManager](HKOutstandingFetchOperationManager, "sharedOperationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKChartCache setOperationManager:](v9, "setOperationManager:", v14);

    objc_msgSend(v3, "chartDataCacheController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addCustomChartCache:forDisplayType:", v9, v6);

  }
  return v9;
}

uint64_t __94__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeChartCacheWithApplicationItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_buildBloodGlucoseAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSingleDailyValueQuantityTypeDataSource *v11;
  id v12;
  id v13;
  void *v14;
  HKInteractiveChartOverlayNamedDataSource *v15;
  uint64_t v17;
  uint64_t v18;
  HKInteractiveChartSinglePointData *(*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:]([HKSingleDailyValueQuantityTypeDataSource alloc], "initWithUnitController:options:displayType:healthStore:", v8, 2, v9, v10);

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __121__HKOverlayRoomBloodGlucoseViewController__buildBloodGlucoseAverageDataSourceWithUnitController_displayType_healthStore___block_invoke;
  v20 = &unk_1E9C40520;
  v21 = v8;
  v22 = v9;
  v12 = v9;
  v13 = v8;
  -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v11, "setUserInfoCreationBlock:", &v17);
  -[HKOverlayRoomBloodGlucoseViewController _buildGranularAverageDataSourceTitleFromTimeScope](self, "_buildGranularAverageDataSourceTitleFromTimeScope", v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v11, CFSTR("HKOverlayRoomNamedChartCacheDataSource_BloodGlucose"), v14);

  return v15;
}

HKInteractiveChartSinglePointData *__121__HKOverlayRoomBloodGlucoseViewController__buildBloodGlucoseAverageDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  HKInteractiveChartSinglePointData *v6;
  void *v7;
  void *v8;

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
  -[HKInteractiveChartSinglePointData setRecordCount:](v6, "setRecordCount:", objc_msgSend(v4, "recordCount"));
  objc_msgSend(v4, "statisticsInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v6, "setStatisticsInterval:", v8);
  return v6;
}

- (id)_buildGranularAverageDataSourceTitleFromTimeScope
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__HKOverlayRoomBloodGlucoseViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E9C40548;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  v3 = _Block_copy(v2);

  return v3;
}

__CFString *__92__HKOverlayRoomBloodGlucoseViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;

  switch(a2)
  {
    case 0:
    case 1:
    case 7:
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HKOverlayRoomBloodGlucoseViewController.m"), 549, CFSTR("Unsupported zoom level (%ld)"), a2);
      v5 = &stru_1E9C4C428;
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("OVERLAY_AVERAGE_MONTHLY");
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("OVERLAY_AVERAGE_WEEKLY");
      goto LABEL_7;
    case 4:
    case 5:
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      v7 = CFSTR("OVERLAY_AVERAGE_DAILY");
LABEL_7:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      break;
    default:
      v5 = &stru_1E9C4C428;
      break;
  }
  return v5;
}

- (id)chartOverlayVersion
{
  HKOverlayRoomBloodGlucoseViewController *v2;
  void *v3;
  void *v4;
  __CFString **v5;

  v2 = self;
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = -[HKOverlayRoomBloodGlucoseViewController _isEnhancedChartingEnabledWithHealthStore:](v2, "_isEnhancedChartingEnabledWithHealthStore:", v4);

  v5 = &HKChartOverlayVersionEnhancedOverlays;
  if (!(_DWORD)v2)
    v5 = HKChartOverlayVersionOverlays;
  return *v5;
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (NSMutableArray)contextDelegates
{
  return self->_contextDelegates;
}

- (void)setContextDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_contextDelegates, a3);
}

- (HKChartCache)percentInRangeChartCache
{
  return self->_percentInRangeChartCache;
}

- (void)setPercentInRangeChartCache:(id)a3
{
  objc_storeStrong((id *)&self->_percentInRangeChartCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentInRangeChartCache, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

- (void)_isEnhancedChartingEnabledWithHealthStore:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_1D7813000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Error determining enhanced glucose charting availability: %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)_initialPillForPreference:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "HKOverlayRoomBloodGlucoseViewController received invalid secondary type: %ld", (uint8_t *)&v2, 0xCu);
}

@end
