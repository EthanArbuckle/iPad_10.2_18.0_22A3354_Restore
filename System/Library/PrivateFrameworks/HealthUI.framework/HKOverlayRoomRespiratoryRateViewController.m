@implementation HKOverlayRoomRespiratoryRateViewController

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

- (HKOverlayRoomRespiratoryRateViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  HKOverlayRoomRespiratoryRateViewController *v22;
  NSNumber *preferredOverlayIndex;
  NSMutableArray *v24;
  NSMutableArray *contextDelegates;
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
  v30.super_class = (Class)HKOverlayRoomRespiratoryRateViewController;
  v22 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v30, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v21, v17, v16, a5);

  if (v22)
  {
    v22->_preferredOverlay = a6;
    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contextDelegates = v22->_contextDelegates;
    v22->_contextDelegates = v24;

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
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RESPIRATORY_RATE"), &stru_1E9C4C428, *MEMORY[0x1E0CB5138]);
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
  v4 = *MEMORY[0x1E0CB5D20];
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
  void (**v17)(void);
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HKOverlayRoomTrendContext *v27;
  void *v28;
  HKOverlayRoomTrendContext *v29;
  void *v30;
  uint64_t v31;
  int64_t v32;
  HKOverlayRoomTrendContext *v33;
  HKOverlayRoomTrendContext *v34;
  NSNumber *v35;
  NSNumber *preferredOverlayIndex;
  HKOverlayContextSectionContainer *v37;
  HKOverlayContextSectionContainer *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  HKOverlayContextSectionContainer *v47;
  HKOverlayContextSectionContainer *v48;
  void *v49;
  HKOverlayContextSectionContainer *v50;
  HKOverlayRoomTrendContext *v52;
  void *v53;
  void (**v54)(void);
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  int64_t v60;
  _QWORD v61[4];
  id v62;
  id v63;
  int64_t v64;
  _QWORD aBlock[4];
  id v66;
  id v67;
  int64_t v68;
  void *v69;
  HKOverlayContextSectionContainer *v70;
  HKOverlayRoomTrendContext *v71;
  void *v72;
  HKOverlayContextSectionContainer *v73;
  _QWORD v74[6];

  v74[4] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HKOverlayRoomRespiratoryRateViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E9C403F0;
  v12 = v9;
  v66 = v12;
  v13 = v8;
  v67 = v13;
  v68 = a3;
  v14 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
  v61[0] = v11;
  v61[1] = 3221225472;
  v61[2] = __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v61[3] = &unk_1E9C40418;
  v15 = v12;
  v62 = v15;
  v16 = v13;
  v63 = v16;
  v64 = a3;
  v17 = (void (**)(void))_Block_copy(v61);
  v56[0] = v11;
  v56[1] = 3221225472;
  v56[2] = __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v56[3] = &unk_1E9C40440;
  v56[4] = self;
  v55 = v16;
  v57 = v55;
  v18 = v10;
  v58 = v18;
  v19 = v15;
  v59 = v19;
  v60 = a3;
  v20 = _Block_copy(v56);
  v54 = v17;
  ((void (*)(void (**)(void)))v17[2])(v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v21;
  v14[2](v14, 0, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v22;
  v53 = v20;
  (*((void (**)(void *))v20 + 2))(v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v23;
  v14[2](v14, 6, 128);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v74[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomRespiratoryRateViewController trendModel](self, "trendModel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = [HKOverlayRoomTrendContext alloc];
    -[HKOverlayRoomRespiratoryRateViewController trendModel](self, "trendModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](v27, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v18, v28, v19, v55, a3);

    -[HKOverlayRoomViewController chartController](self, "chartController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTrendAccessibilityDelegate:", v29);

    objc_msgSend(v25, "arrayByAddingObject:", v29);
    v31 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v31;
  }
  else
  {
    v29 = 0;
  }
  v32 = -[HKOverlayRoomRespiratoryRateViewController _initialPillForPreference:](self, "_initialPillForPreference:", -[HKOverlayRoomRespiratoryRateViewController preferredOverlay](self, "preferredOverlay"));
  switch(v32)
  {
    case 0:
      v54[2]();
      v33 = (HKOverlayRoomTrendContext *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      v33 = v29;
      goto LABEL_10;
    case 1:
      v14[2](v14, 6, 128);
      v33 = (HKOverlayRoomTrendContext *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v34 = v33;
      goto LABEL_12;
  }
  v34 = 0;
LABEL_12:
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3 != 3)
    {
      v44 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_28;
    }
    if (v34 && (v41 = objc_msgSend(v25, "indexOfObject:", v34), v41 != 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
    }
    else
    {
      v42 = 0;
      v43 = 1;
    }
    objc_storeStrong((id *)&self->_preferredOverlayIndex, v42);
    if ((v43 & 1) == 0)

    v48 = [HKOverlayContextSectionContainer alloc];
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v48, 0, v25);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v48, "initWithContainerTitle:overlayContextSections:", 0, v49);
    v70 = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
    goto LABEL_28;
  }
  v52 = v29;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v35 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  preferredOverlayIndex = self->_preferredOverlayIndex;
  self->_preferredOverlayIndex = v35;

  v37 = [HKOverlayContextSectionContainer alloc];
  v38 = v37;
  v39 = v19;
  if (v34)
  {
    v71 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
    v37 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    v40 = v37;
  }
  else
  {
    v40 = (void *)MEMORY[0x1E0C9AA60];
  }
  __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v37, 0, v40);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v38, "initWithContainerTitle:overlayContextSections:", 0, v46);
  v73 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v39;
  v29 = v52;
  if (v34)
    goto LABEL_27;
LABEL_28:

  return v44;
}

id __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:](HKOverlayRoomViewControllerIntegratedContext, "distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", a2, 0, a1[4], a1[5], 0, a3, a1[6]);
}

HKOverlayRoomViewControllerLastQuantityContext *__118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(_QWORD *a1)
{
  return -[HKOverlayRoomViewControllerLastQuantityContext initWithOverlayChartController:applicationItems:mode:]([HKOverlayRoomViewControllerLastQuantityContext alloc], "initWithOverlayChartController:applicationItems:mode:", a1[4], a1[5], a1[6]);
}

id __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _HKRespiratoryRateQuantityContextDelegate *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "unitController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_buildRespiratoryRateAverageDataSourceWithUnitController:displayType:healthStore:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_HKRespiratoryRateQuantityContextDelegate initWithCustomDataSource:primaryDisplayType:]([_HKRespiratoryRateQuantityContextDelegate alloc], "initWithCustomDataSource:primaryDisplayType:", v6, *(_QWORD *)(a1 + 48));
  if (v7)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "addObject:", v7);
  +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:](HKOverlayRoomViewControllerIntegratedContext, "quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:", *MEMORY[0x1E0CB5D20], *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v7, 0, *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
    -[HKOverlayRoomRespiratoryRateViewController trendModel](self, "trendModel");
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
  v8.super_class = (Class)HKOverlayRoomRespiratoryRateViewController;
  -[HKOverlayRoomViewController createChartOverlayViewController](&v8, sel_createChartOverlayViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_initialPillForPreference:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  int64_t result;
  NSObject *v10;

  -[HKOverlayRoomRespiratoryRateViewController trendModel](self, "trendModel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[HKOverlayRoomRespiratoryRateViewController trendModel](self, "trendModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "selectTrendInitially");

    if ((v8 & 1) != 0)
      return 2;
  }
  result = 0;
  if (a3)
  {
    if (a3 == 9)
    {
      return 1;
    }
    else if (a3 != 11)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
        -[HKOverlayRoomRespiratoryRateViewController _initialPillForPreference:].cold.1(a3, v10);
      return 0;
    }
  }
  return result;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  HKOverlayRoomRespiratoryRateViewController *v10;
  int64_t v11;
  void *v12;
  void *v13;
  HKOverlayRoomRespiratoryRateViewController *v14;

  v8 = a5;
  v9 = a4;
  v10 = [HKOverlayRoomRespiratoryRateViewController alloc];
  v11 = -[HKOverlayRoomRespiratoryRateViewController preferredOverlay](self, "preferredOverlay");
  -[HKOverlayRoomRespiratoryRateViewController trendModel](self, "trendModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKOverlayRoomRespiratoryRateViewController initWithDisplayDate:applicationItems:mode:preferredOverlay:trendModel:factorDisplayTypes:](v10, "initWithDisplayDate:applicationItems:mode:preferredOverlay:trendModel:factorDisplayTypes:", v9, v8, a3, v11, v12, v13);

  -[HKOverlayRoomViewController setAdditionalChartOptions:](v14, "setAdditionalChartOptions:", -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3));
  return v14;
}

- (id)_buildRespiratoryRateAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKQuantityTypeDataSource *v11;
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
  v11 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:]([HKQuantityTypeDataSource alloc], "initWithUnitController:options:displayType:healthStore:", v8, 2, v9, v10);

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __127__HKOverlayRoomRespiratoryRateViewController__buildRespiratoryRateAverageDataSourceWithUnitController_displayType_healthStore___block_invoke;
  v20 = &unk_1E9C40520;
  v21 = v8;
  v22 = v9;
  v12 = v9;
  v13 = v8;
  -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v11, "setUserInfoCreationBlock:", &v17);
  -[HKOverlayRoomRespiratoryRateViewController _buildGranularAverageDataSourceTitleFromTimeScope](self, "_buildGranularAverageDataSourceTitleFromTimeScope", v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v11, CFSTR("HKOverlayRoomNamedChartCacheDataSource_RespiratoryRate"), v14);

  return v15;
}

HKInteractiveChartSinglePointData *__127__HKOverlayRoomRespiratoryRateViewController__buildRespiratoryRateAverageDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
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
  v5[2] = __95__HKOverlayRoomRespiratoryRateViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E9C40548;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  v3 = _Block_copy(v2);

  return v3;
}

__CFString *__95__HKOverlayRoomRespiratoryRateViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HKOverlayRoomRespiratoryRateViewController.m"), 309, CFSTR("Unsupported zoom level (%ld)"), a2);
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

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (void)setTrendModel:(id)a3
{
  objc_storeStrong((id *)&self->_trendModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

- (void)_initialPillForPreference:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "HKOverlayRoomRespiratoryRateViewController received invalid secondary type: %ld", (uint8_t *)&v2, 0xCu);
}

@end
