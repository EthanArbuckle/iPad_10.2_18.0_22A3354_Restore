@implementation HKOverlayRoomPhysicalEffortViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HKOverlayRoomPhysicalEffortViewController *v22;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  v22 = -[HKOverlayRoomPhysicalEffortViewController initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:trendModel:factorDisplayTypes:]([HKOverlayRoomPhysicalEffortViewController alloc], "initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:trendModel:factorDisplayTypes:", v19, v20, 1, v21, a7, v17, v16);

  -[HKOverlayRoomViewController setRestorationUserActivity:](v22, "setRestorationUserActivity:", v18);
  -[HKOverlayRoomViewController setAdditionalChartOptions:](v22, "setAdditionalChartOptions:", a11);
  return v22;
}

- (HKOverlayRoomPhysicalEffortViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  HKOverlayRoomPhysicalEffortViewController *v22;
  NSNumber *preferredOverlayIndex;
  uint64_t v24;
  unsigned int v25;
  BOOL v26;
  id v29;
  objc_super v30;

  v14 = a3;
  v29 = a6;
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

  v30.receiver = self;
  v30.super_class = (Class)HKOverlayRoomPhysicalEffortViewController;
  v22 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v30, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v21, v17, v16, a5);

  if (v22)
  {
    objc_storeStrong((id *)&v22->_quantityTypeIdentifier, a6);
    v22->_preferredOverlay = a7;
    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    objc_storeStrong((id *)&v22->_trendModel, a8);
    if (a5 == 3)
    {
      v24 = 0;
    }
    else
    {
      v25 = objc_msgSend(v15, "selectTrendInitially");
      if (a5)
        v26 = a7 == 0;
      else
        v26 = 1;
      if (v26)
        v24 = v25;
      else
        v24 = 1;
    }
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v22, "setShouldSelectInitialOverlay:", v24, a7, v29);
  }

  return v22;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKOverlayRoomPhysicalEffortViewController;
  -[HKOverlayRoomViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PHYSICAL_EFFORT"), &stru_1E9C4C428, *MEMORY[0x1E0CB5138]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)supportsShowAllFilters
{
  return -[HKOverlayRoomViewController controllerMode](self, "controllerMode") != 3
      && -[HKOverlayRoomViewController healthFactorsEnabled](self, "healthFactorsEnabled");
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
  id v11;
  id v12;
  void (**v13)(void);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKOverlayRoomTrendContext *v18;
  void *v19;
  HKOverlayRoomTrendContext *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSNumber *preferredOverlayIndex;
  HKOverlayContextSectionContainer *v25;
  void *v26;
  HKOverlayContextSectionContainer *v27;
  uint64_t v28;
  void *v29;
  HKOverlayRoomTrendContext *v30;
  void (**v31)(void);
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  HKOverlayContextSectionContainer *v40;
  void *v42;
  void *v43;
  _QWORD aBlock[4];
  id v45;
  id v46;
  int64_t v47;
  void *v48;
  HKOverlayContextSectionContainer *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HKOverlayRoomPhysicalEffortViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__HKOverlayRoomPhysicalEffortViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E9C40418;
  v11 = v9;
  v45 = v11;
  v12 = v8;
  v46 = v12;
  v47 = a3;
  v13 = (void (**)(void))_Block_copy(aBlock);
  v13[2]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomPhysicalEffortViewController trendModel](self, "trendModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v11;
  if (v17)
  {
    v18 = [HKOverlayRoomTrendContext alloc];
    -[HKOverlayRoomPhysicalEffortViewController trendModel](self, "trendModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](v18, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v10, v19, v11, v12, a3);

    -[HKOverlayRoomViewController chartController](self, "chartController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTrendAccessibilityDelegate:", v20);

    objc_msgSend(v15, "arrayByAddingObject:", v20);
    v22 = objc_claimAutoreleasedReturnValue();

    -[HKOverlayRoomPhysicalEffortViewController trendModel](self, "trendModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v23, "selectTrendInitially");

    if ((_DWORD)v19)
    {
      v20 = v20;

      v15 = (void *)v22;
      v16 = v20;
    }
    else
    {
      v15 = (void *)v22;
    }
  }
  else
  {
    v20 = 0;
  }
  if ((unint64_t)(a3 - 1) < 2)
  {
    preferredOverlayIndex = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = (NSNumber *)&unk_1E9CED3B8;

    v25 = [HKOverlayContextSectionContainer alloc];
    v50 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v42, 0, v42);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v27 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    v28 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v25, "initWithContainerTitle:overlayContextSections:", 0, v27);
    v29 = v15;
    v30 = v20;
    v31 = v13;
    v32 = v16;
    v33 = v12;
    v34 = v10;
    v35 = (void *)v28;
    v52 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v34;
    v12 = v33;
    v16 = v32;
    v13 = v31;
    v20 = v30;
    v15 = v29;
    v37 = v42;
LABEL_16:

    goto LABEL_17;
  }
  if (a3 == 3)
  {
    v38 = objc_msgSend(v15, "indexOfObject:", v16);
    if (v38 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&self->_preferredOverlayIndex, v39);
    if (v38 != 0x7FFFFFFFFFFFFFFFLL)

    v40 = [HKOverlayContextSectionContainer alloc];
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v40, 0, v15);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v40, "initWithContainerTitle:overlayContextSections:", 0, v26);
    v49 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v36 = (void *)MEMORY[0x1E0C9AA60];
LABEL_17:

  return v36;
}

HKOverlayRoomViewControllerLastQuantityContext *__117__HKOverlayRoomPhysicalEffortViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(_QWORD *a1)
{
  return -[HKOverlayRoomViewControllerLastQuantityContext initWithOverlayChartController:applicationItems:mode:]([HKOverlayRoomViewControllerLastQuantityContext alloc], "initWithOverlayChartController:applicationItems:mode:", a1[4], a1[5], a1[6]);
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
    -[HKOverlayRoomPhysicalEffortViewController trendModel](self, "trendModel");
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
  v8.super_class = (Class)HKOverlayRoomPhysicalEffortViewController;
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
  HKOverlayRoomPhysicalEffortViewController *v10;
  NSString *quantityTypeIdentifier;
  int64_t preferredOverlay;
  void *v13;
  void *v14;
  HKOverlayRoomPhysicalEffortViewController *v15;

  v8 = a5;
  v9 = a4;
  v10 = [HKOverlayRoomPhysicalEffortViewController alloc];
  quantityTypeIdentifier = self->_quantityTypeIdentifier;
  preferredOverlay = self->_preferredOverlay;
  -[HKOverlayRoomPhysicalEffortViewController trendModel](self, "trendModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKOverlayRoomPhysicalEffortViewController initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:trendModel:factorDisplayTypes:](v10, "initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:trendModel:factorDisplayTypes:", v9, v8, a3, quantityTypeIdentifier, preferredOverlay, v13, v14);

  -[HKOverlayRoomViewController setAdditionalChartOptions:](v15, "setAdditionalChartOptions:", -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3));
  return v15;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_quantityTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

@end
