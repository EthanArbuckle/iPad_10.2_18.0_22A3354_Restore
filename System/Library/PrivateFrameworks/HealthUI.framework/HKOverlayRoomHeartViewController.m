@implementation HKOverlayRoomHeartViewController

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

- (HKOverlayRoomHeartViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  HKOverlayRoomHeartViewController *v22;
  NSNumber *preferredOverlayIndex;
  uint64_t v24;
  unsigned int v25;
  BOOL v26;
  objc_super v28;

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

  v28.receiver = self;
  v28.super_class = (Class)HKOverlayRoomHeartViewController;
  v22 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v28, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v21, v17, v16, a5);

  if (v22)
  {
    v22->_preferredOverlay = a6;
    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    objc_storeStrong((id *)&v22->_trendModel, a7);
    if (a5 == 3)
    {
      v24 = 0;
    }
    else
    {
      v25 = objc_msgSend(v15, "selectTrendInitially");
      if (a5)
        v26 = a6 == 0;
      else
        v26 = 1;
      if (v26)
        v24 = v25;
      else
        v24 = 1;
    }
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v22, "setShouldSelectInitialOverlay:", v24);
  }

  return v22;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKOverlayRoomHeartViewController;
  -[HKOverlayRoomViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEART_RATE"), &stru_1E9C4C428, *MEMORY[0x1E0CB5138]);
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
  v4 = *MEMORY[0x1E0CB5CB0];
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
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(void *, _QWORD, uint64_t);
  id v13;
  id v14;
  void (**v15)(void *, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HKOverlayRoomHeartViewController *v25;
  void (*v26)(void *, uint64_t, uint64_t);
  void (**v27)(void *, _QWORD, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int64_t v32;
  void *v33;
  void *v34;
  HKOverlayRoomTrendContext *v35;
  void *v36;
  HKOverlayRoomTrendContext *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  HKOverlayRoomTrendContext *v42;
  uint64_t v43;
  NSNumber *preferredOverlayIndex;
  void *v45;
  HKOverlayContextSectionContainer *v46;
  id v47;
  HKOverlayContextSectionContainer *v48;
  void *v49;
  HKOverlayContextSectionContainer *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v56;
  id v57;
  void *v59;
  void *v60;
  void (**v61)(void);
  int64_t v62;
  _QWORD v63[4];
  id v64;
  id v65;
  int64_t v66;
  _QWORD v67[4];
  id v68;
  id v69;
  int64_t v70;
  _QWORD aBlock[4];
  id v72;
  id v73;
  int64_t v74;
  HKOverlayContextSectionContainer *v75;
  void *v76;
  HKOverlayContextSectionContainer *v77;
  HKOverlayContextSectionContainer *v78;
  _QWORD v79[11];

  v79[9] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E9C403F0;
  v10 = v8;
  v72 = v10;
  v11 = v7;
  v73 = v11;
  v74 = a3;
  v12 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
  v67[0] = v9;
  v67[1] = 3221225472;
  v67[2] = __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v67[3] = &unk_1E9C450A0;
  v13 = v10;
  v68 = v13;
  v14 = v11;
  v69 = v14;
  v70 = a3;
  v15 = (void (**)(void *, _QWORD))_Block_copy(v67);
  v63[0] = v9;
  v63[1] = 3221225472;
  v63[2] = __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v63[3] = &unk_1E9C40418;
  v57 = v13;
  v64 = v57;
  v56 = v14;
  v65 = v56;
  v66 = a3;
  v62 = a3;
  v61 = (void (**)(void))_Block_copy(v63);
  v61[2]();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v16;
  v12[2](v12, 0, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v17;
  v15[2](v15, *MEMORY[0x1E0CB5D28]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v18;
  v60 = v15;
  v15[2](v15, *MEMORY[0x1E0CB5DB8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v19;
  v12[2](v12, 2, 32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v79[4] = v20;
  v12[2](v12, 6, 128);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v79[5] = v21;
  v12[2](v12, 1, 64);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v79[6] = v22;
  v12[2](v12, 3, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v79[7] = v23;
  v12[2](v12, 4, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v79[8] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 9);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = self;
  switch(-[HKOverlayRoomHeartViewController _initialPillForPreference:](self, "_initialPillForPreference:", -[HKOverlayRoomHeartViewController preferredOverlay](self, "preferredOverlay")))
  {
    case 1:
      v26 = v12[2];
      v27 = v12;
      v28 = 4;
      goto LABEL_5;
    case 2:
      v26 = v12[2];
      v27 = v12;
      v28 = 3;
LABEL_5:
      v30 = 0;
      goto LABEL_8;
    case 3:
      v12[2](v12, 6, 128);
      goto LABEL_9;
    case 4:
      v26 = v12[2];
      v27 = v12;
      v28 = 2;
      v30 = 32;
LABEL_8:
      v26(v27, v28, v30);
LABEL_9:
      v29 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v61[2]();
      v29 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v31 = (void *)v29;
  v32 = v62;
  -[HKOverlayRoomHeartViewController trendModel](self, "trendModel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[HKOverlayRoomHeartViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v56);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = [HKOverlayRoomTrendContext alloc];
    -[HKOverlayRoomHeartViewController trendModel](self, "trendModel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](v35, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v34, v36, v57, v56, v62);

    -[HKOverlayRoomViewController chartController](self, "chartController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTrendAccessibilityDelegate:", v37);

    objc_msgSend(v59, "arrayByAddingObject:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKOverlayRoomHeartViewController trendModel](self, "trendModel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "selectTrendInitially");

    if (v41)
    {
      v42 = v37;

      v31 = v42;
    }

    v25 = self;
    v32 = v62;
  }
  else
  {
    v39 = v59;
  }
  if ((unint64_t)(v32 - 1) < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
    v43 = objc_claimAutoreleasedReturnValue();
    preferredOverlayIndex = v25->_preferredOverlayIndex;
    v25->_preferredOverlayIndex = (NSNumber *)v43;

    v45 = v39;
    v46 = [HKOverlayContextSectionContainer alloc];
    v76 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v47, 0, v47);
    v48 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    v77 = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v46, "initWithContainerTitle:overlayContextSections:", 0, v49);
    v78 = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v45;
LABEL_25:

    goto LABEL_26;
  }
  if (v32 == 3)
  {
    v52 = objc_msgSend(v39, "indexOfObject:", v31);
    if (v52 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v53 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v25->_preferredOverlayIndex, v53);
    if (v52 != 0x7FFFFFFFFFFFFFFFLL)

    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v47, 0, v39);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v54);

    v48 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:]([HKOverlayContextSectionContainer alloc], "initWithContainerTitle:overlayContextSections:", 0, v47);
    v75 = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v51 = (void *)MEMORY[0x1E0C9AA60];
LABEL_26:

  return v51;
}

id __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:](HKOverlayRoomViewControllerIntegratedContext, "distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", a2, 0, a1[4], a1[5], 0, a3, a1[6]);
}

id __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  return +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:](HKOverlayRoomViewControllerIntegratedContext, "quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:", a2, a1[4], a1[5], 0, 0, a1[6]);
}

HKOverlayRoomViewControllerLastQuantityContext *__108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(_QWORD *a1)
{
  return -[HKOverlayRoomViewControllerLastQuantityContext initWithOverlayChartController:applicationItems:mode:]([HKOverlayRoomViewControllerLastQuantityContext alloc], "initWithOverlayChartController:applicationItems:mode:", a1[4], a1[5], a1[6]);
}

- (int64_t)_initialPillForPreference:(int64_t)a3
{
  NSObject *v4;

  if ((unint64_t)a3 < 0xC && ((0xE0Du >> a3) & 1) != 0)
    return qword_1D7B82808[a3];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEBUG))
    -[HKOverlayRoomHeartViewController _initialPillForPreference:].cold.1(a3, v4);
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
  HKOverlayRoomHeartViewController *v10;
  int64_t v11;
  void *v12;
  void *v13;
  HKOverlayRoomHeartViewController *v14;

  v8 = a5;
  v9 = a4;
  v10 = [HKOverlayRoomHeartViewController alloc];
  v11 = -[HKOverlayRoomHeartViewController preferredOverlay](self, "preferredOverlay");
  -[HKOverlayRoomHeartViewController trendModel](self, "trendModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKOverlayRoomHeartViewController initWithDisplayDate:applicationItems:mode:preferredOverlay:trendModel:factorDisplayTypes:](v10, "initWithDisplayDate:applicationItems:mode:preferredOverlay:trendModel:factorDisplayTypes:", v9, v8, a3, v11, v12, v13);

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
  v8.super_class = (Class)HKOverlayRoomHeartViewController;
  -[HKOverlayRoomViewController createChartOverlayViewController](&v8, sel_createChartOverlayViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendModel, 0);
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
  _os_log_debug_impl(&dword_1D7813000, a2, OS_LOG_TYPE_DEBUG, "HKOverlayRoomHeartViewController received invalid secondary type: %ld", (uint8_t *)&v2, 0xCu);
}

@end
