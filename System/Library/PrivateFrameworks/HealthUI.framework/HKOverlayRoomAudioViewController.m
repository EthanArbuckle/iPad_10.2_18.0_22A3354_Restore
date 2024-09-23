@implementation HKOverlayRoomAudioViewController

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

- (HKOverlayRoomAudioViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 audioExposureDeviceDataSource:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  HKOverlayRoomAudioViewController *v24;
  NSMutableArray *v25;
  NSMutableArray *contextDelegates;
  NSNumber *preferredOverlayIndex;
  uint64_t v28;
  unsigned int v29;
  BOOL v30;
  void *v32;
  id v35;
  void *v36;
  objc_super v37;

  v15 = a3;
  v16 = a6;
  v35 = a8;
  v17 = a9;
  v18 = a10;
  v19 = a4;
  +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:](HKOverlayRoomTrendContext, "findInitialDateFromTrendModel:", v17);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v36 = v15;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = v15;
  v23 = v22;

  v37.receiver = self;
  v37.super_class = (Class)HKOverlayRoomAudioViewController;
  v24 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v37, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, v23, v19, v18, a5);

  if (v24)
  {
    if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB5C78]) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB5CA8]) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB5C80]) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v24, CFSTR("HKOverlayRoomAudioViewController.m"), 108, CFSTR("Invalid audio type identifier passed into audio room: %@"), v16);

    }
    v24->_isShowingUnattenuatedOverlayPill = 0;
    v24->_quantityTypeIdentifier = (NSString *)v16;
    v24->_preferredOverlay = a7;
    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contextDelegates = v24->_contextDelegates;
    v24->_contextDelegates = v25;

    objc_storeStrong((id *)&v24->_audioExposureDevicesDataSource, a8);
    -[HKOverlayRoomAudioViewController _setupAudioExposureDataSourceIfNeeded](v24, "_setupAudioExposureDataSourceIfNeeded");
    objc_storeStrong((id *)&v24->_trendModel, a9);
    preferredOverlayIndex = v24->_preferredOverlayIndex;
    v24->_preferredOverlayIndex = 0;

    v28 = 0;
    if (a5 != 3)
    {
      v29 = objc_msgSend(v17, "selectTrendInitially", 0);
      if (a5)
        v30 = a7 == 0;
      else
        v30 = 1;
      if (v30)
        v28 = v29;
      else
        v28 = 1;
    }
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v24, "setShouldSelectInitialOverlay:", v28);
  }

  return v24;
}

- (HKOverlayRoomAudioViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9
{
  return -[HKOverlayRoomAudioViewController initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:audioExposureDeviceDataSource:trendModel:factorDisplayTypes:](self, "initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:audioExposureDeviceDataSource:trendModel:factorDisplayTypes:", a3, a4, a5, a6, a7, 0, a8, a9);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKOverlayRoomAudioViewController;
  -[HKOverlayRoomViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HKOverlayRoomAudioViewController _registerForAudioExposureDeviceUpdates](self, "_registerForAudioExposureDeviceUpdates");
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  _BOOL4 v8;
  void *v9;

  if (-[HKOverlayRoomAudioViewController _isEnvironmentalAudioExposureRoom](self, "_isEnvironmentalAudioExposureRoom", a3))
  {
    HKHealthKitFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *MEMORY[0x1E0CB5138];
    v7 = CFSTR("ENVIRONMENTAL_AUDIO_EXPOSURE");
  }
  else
  {
    v8 = -[HKOverlayRoomAudioViewController _isHeadphoneAudioExposureRoom](self, "_isHeadphoneAudioExposureRoom");
    HKHealthKitFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *MEMORY[0x1E0CB5138];
    if (v8)
      v7 = CFSTR("HEADPHONE_AUDIO_EXPOSURE");
    else
      v7 = CFSTR("ENVIRONMENTAL_SOUND_REDUCTION");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)supportsShowAllFilters
{
  _BOOL4 v3;
  objc_super v5;

  if (-[HKOverlayRoomAudioViewController _isHeadphoneAudioExposureRoom](self, "_isHeadphoneAudioExposureRoom")
    || -[HKOverlayRoomAudioViewController _isEnvironmentalAudioExposureRoom](self, "_isEnvironmentalAudioExposureRoom")
    || (v3 = -[HKOverlayRoomViewController healthFactorsEnabled](self, "healthFactorsEnabled")))
  {
    v5.receiver = self;
    v5.super_class = (Class)HKOverlayRoomAudioViewController;
    LOBYTE(v3) = -[HKOverlayRoomViewController supportsShowAllFilters](&v5, sel_supportsShowAllFilters);
  }
  return v3;
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
  void (**v14)(void *, uint64_t, _QWORD);
  id v15;
  id v16;
  id v17;
  void (**v18)(void *, NSString *, _QWORD);
  id v19;
  id v20;
  id v21;
  void (**v22)(void);
  _BOOL4 v23;
  int64_t v24;
  void *v25;
  void *v26;
  HKOverlayRoomTrendContext *v27;
  void *v28;
  HKOverlayRoomTrendContext *v29;
  void *v30;
  void *v31;
  NSNumber *v32;
  NSNumber *preferredOverlayIndex;
  void *v34;
  void *v35;
  HKOverlayContextSectionContainer *v36;
  void *v37;
  NSNumber *v38;
  NSNumber *v39;
  HKOverlayContextSectionContainer *v40;
  id v41;
  HKOverlayContextSectionContainer *v42;
  HKOverlayContextSectionContainer *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  HKOverlayRoomTrendContext *v54;
  void *v55;
  void *v56;
  void *v57;
  NSNumber *v58;
  NSNumber *v59;
  HKOverlayContextSectionContainer *v60;
  void *v61;
  uint64_t v62;
  HKOverlayContextSectionContainer *v63;
  void *v64;
  HKOverlayContextSectionContainer *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  HKOverlayContextSectionContainer *v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void (**v87)(void *, uint64_t, _QWORD);
  void (**v88)(void *, uint64_t, _QWORD);
  id v89;
  id v90;
  void *v91;
  void *v92;
  void (**v93)(void);
  id v94;
  _QWORD v95[4];
  HKOverlayContextSectionContainer *v96;
  _QWORD v97[4];
  id v98;
  id v99;
  int64_t v100;
  _QWORD v101[4];
  id v102;
  id v103;
  int64_t v104;
  _QWORD v105[5];
  id v106;
  id v107;
  id v108;
  int64_t v109;
  _QWORD aBlock[4];
  id v111;
  id v112;
  int64_t v113;
  HKOverlayContextSectionContainer *v114;
  void *v115;
  HKOverlayContextSectionContainer *v116;
  _QWORD v117[5];
  void *v118;
  void *v119;
  HKOverlayContextSectionContainer *v120;
  HKOverlayContextSectionContainer *v121;
  _QWORD v122[4];
  void *v123;
  id v124;
  _QWORD v125[3];

  v125[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HKOverlayRoomAudioViewController primaryDisplayTypeWithApplicationItems:](self, "primaryDisplayTypeWithApplicationItems:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E9C403F0;
  v12 = v9;
  v111 = v12;
  v13 = v8;
  v112 = v13;
  v113 = a3;
  v14 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v105[0] = v11;
  v105[1] = 3221225472;
  v105[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v105[3] = &unk_1E9C41978;
  v105[4] = self;
  v15 = v13;
  v106 = v15;
  v16 = v10;
  v107 = v16;
  v17 = v12;
  v108 = v17;
  v109 = a3;
  v18 = (void (**)(void *, NSString *, _QWORD))_Block_copy(v105);
  v101[0] = v11;
  v101[1] = 3221225472;
  v101[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v101[3] = &unk_1E9C419A0;
  v19 = v17;
  v102 = v19;
  v20 = v15;
  v103 = v20;
  v104 = a3;
  v92 = _Block_copy(v101);
  v97[0] = v11;
  v97[1] = 3221225472;
  v97[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_5;
  v97[3] = &unk_1E9C40418;
  v21 = v19;
  v98 = v21;
  v94 = v20;
  v99 = v94;
  v100 = a3;
  v22 = (void (**)(void))_Block_copy(v97);
  v93 = v22;
  v91 = v21;
  if (!-[HKOverlayRoomAudioViewController _isEnvironmentalAudioExposureRoom](self, "_isEnvironmentalAudioExposureRoom"))
  {
    v23 = -[HKOverlayRoomAudioViewController _isHeadphoneAudioExposureRoom](self, "_isHeadphoneAudioExposureRoom");
    v24 = -[HKOverlayRoomAudioViewController _initialPillForPreference:](self, "_initialPillForPreference:", -[HKOverlayRoomAudioViewController preferredOverlay](self, "preferredOverlay"));
    if (!v23)
    {
      ((void (*)(void (**)(void)))v22[2])(v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      preferredOverlayIndex = self->_preferredOverlayIndex;
      self->_preferredOverlayIndex = v32;

      v29 = (HKOverlayRoomTrendContext *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v115 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v34, 0, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomTrendContext addObject:](v29, "addObject:", v35);

      v36 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:]([HKOverlayContextSectionContainer alloc], "initWithContainerTitle:overlayContextSections:", 0, v29);
      v114 = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

      goto LABEL_48;
    }
    if (v24 == 2)
      v14[2](v14, 7, 0);
    else
      v18[2](v18, self->_quantityTypeIdentifier, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomAudioViewController trendModel](self, "trendModel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      v54 = [HKOverlayRoomTrendContext alloc];
      -[HKOverlayRoomAudioViewController trendModel](self, "trendModel");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](v54, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v16, v55, v21, v94, a3);

      -[HKOverlayRoomViewController chartController](self, "chartController");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setTrendAccessibilityDelegate:", v29);

      -[HKOverlayRoomAudioViewController trendModel](self, "trendModel");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v55) = objc_msgSend(v57, "selectTrendInitially");

      if ((_DWORD)v55)
      {
        v29 = v29;

        v25 = v29;
      }
    }
    else
    {
      v29 = 0;
    }
    if ((unint64_t)(a3 - 1) >= 2)
    {
      if (a3 != 3)
        goto LABEL_34;
      v90 = v16;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v36 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
      v84 = (void *)MEMORY[0x1E0C99DE8];
      v18[2](v18, self->_quantityTypeIdentifier, 0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v117[0] = v85;
      v14[2](v14, 7, 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v117[1] = v83;
      v18[2](v18, self->_quantityTypeIdentifier, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v117[2] = v82;
      v93[2]();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v117[3] = v66;
      v88 = v14;
      v14[2](v14, 0, 2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v117[4] = v67;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 5);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "arrayWithArray:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        v70 = objc_msgSend(v69, "addObject:", v29);
      v61 = v69;
      __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(v70, 0, v69);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "overlayContextItems");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "indexOfObject:", v25);

      if (v72 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v73 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&self->_preferredOverlayIndex, v73);
      if (v72 != 0x7FFFFFFFFFFFFFFFLL)

      -[HKOverlayContextSectionContainer addObject:](v36, "addObject:", v86);
      v95[0] = v11;
      v95[1] = 3221225472;
      v95[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_6;
      v95[3] = &unk_1E9C419C8;
      v96 = v92;
      -[HKOverlayRoomAudioViewController _makeHeadphoneDeviceFiltersUsingContextCreator:](self, "_makeHeadphoneDeviceFiltersUsingContextCreator:", v95);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v88;
      if (objc_msgSend(v75, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("AUDIO_OVERLAY_HEADPHONES_FILTER_SECTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(v78, v77, v75);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOverlayContextSectionContainer addObject:](v36, "addObject:", v79);

      }
      v80 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:]([HKOverlayContextSectionContainer alloc], "initWithContainerTitle:overlayContextSections:", 0, v36);
      v116 = v80;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = v96;
      v64 = v86;
    }
    else
    {
      v90 = v16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v58 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v59 = self->_preferredOverlayIndex;
      self->_preferredOverlayIndex = v58;

      v60 = [HKOverlayContextSectionContainer alloc];
      v118 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
      v36 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
      __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v36, 0, v36);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = v61;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = v60;
      v64 = (void *)v62;
      v65 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v63, "initWithContainerTitle:overlayContextSections:", 0, v62);
      v120 = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v16 = v90;
    goto LABEL_47;
  }
  if (-[HKOverlayRoomAudioViewController _initialPillForPreference:](self, "_initialPillForPreference:", -[HKOverlayRoomAudioViewController preferredOverlay](self, "preferredOverlay")) == 1)v14[2](v14, 5, 0);
  else
    v18[2](v18, self->_quantityTypeIdentifier, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomAudioViewController trendModel](self, "trendModel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = [HKOverlayRoomTrendContext alloc];
    -[HKOverlayRoomAudioViewController trendModel](self, "trendModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](v27, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v16, v28, v21, v94, a3);

    -[HKOverlayRoomViewController chartController](self, "chartController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTrendAccessibilityDelegate:", v29);

    -[HKOverlayRoomAudioViewController trendModel](self, "trendModel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = objc_msgSend(v31, "selectTrendInitially");

    if ((_DWORD)v28)
    {
      v29 = v29;

      v25 = v29;
    }
  }
  else
  {
    v29 = 0;
  }
  if ((unint64_t)(a3 - 1) < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
    v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v39 = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = v38;

    v40 = [HKOverlayContextSectionContainer alloc];
    v123 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
    v36 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v36, 0, v36);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v124 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
    v42 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    v43 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:](v40, "initWithContainerTitle:overlayContextSections:", 0, v42);
    v125[0] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
    goto LABEL_47;
  }
  if (a3 == 3)
  {
    v89 = v16;
    v36 = (HKOverlayContextSectionContainer *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18[2](v18, self->_quantityTypeIdentifier, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayContextSectionContainer addObject:](v36, "addObject:", v44);

    if (-[HKOverlayRoomAudioViewController _shouldShowUnattenuatedOverlayPill](self, "_shouldShowUnattenuatedOverlayPill"))
    {
      v18[2](v18, self->_quantityTypeIdentifier, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayContextSectionContainer addObject:](v36, "addObject:", v45);

      self->_isShowingUnattenuatedOverlayPill = 1;
    }
    v18[2](v18, self->_quantityTypeIdentifier, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v46;
    v93[2]();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v47;
    v14[2](v14, 0, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v122[2] = v48;
    v87 = v14;
    v14[2](v14, 5, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v122[3] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 4);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayContextSectionContainer addObjectsFromArray:](v36, "addObjectsFromArray:", v50);

    if (v29)
      -[HKOverlayContextSectionContainer addObject:](v36, "addObject:", v29);
    v51 = -[HKOverlayContextSectionContainer indexOfObject:](v36, "indexOfObject:", v25);
    if (v51 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v52 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v87;
    objc_storeStrong((id *)&self->_preferredOverlayIndex, v52);
    if (v51 != 0x7FFFFFFFFFFFFFFFLL)

    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v41, 0, v36);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v74);

    v42 = -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:]([HKOverlayContextSectionContainer alloc], "initWithContainerTitle:overlayContextSections:", 0, v41);
    v121 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v89;
    goto LABEL_39;
  }
LABEL_34:
  v37 = (void *)MEMORY[0x1E0C9AA60];
LABEL_48:

  return v37;
}

id __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:](HKOverlayRoomViewControllerIntegratedContext, "distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", a2, 0, a1[4], a1[5], 0, a3, a1[6]);
}

id __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _HKAudioVisibleRangeQuantityContextDelegate *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a2;
  if (a3 == 2)
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "unitController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "healthStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_buildAudioAverageDataSourceWithUnitController:displayType:healthStore:averageOverVisibleRange:attenuated:", v14, v15, v16, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[_HKAudioVisibleRangeQuantityContextDelegate initWithCustomDataSource:primaryDisplayType:]([_HKAudioVisibleRangeQuantityContextDelegate alloc], "initWithCustomDataSource:primaryDisplayType:", v10, *(_QWORD *)(a1 + 48));
    goto LABEL_7;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      v17 = 0;
      v11 = 0;
      v12 = 0;
      goto LABEL_13;
    }
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "unitController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "healthStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_buildAudioAverageDataSourceWithUnitController:displayType:healthStore:averageOverVisibleRange:attenuated:", v7, v8, v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[_HKAudioVisibleRangeQuantityContextDelegate initWithCustomDataSource:primaryDisplayType:]([_HKAudioVisibleRangeQuantityContextDelegate alloc], "initWithCustomDataSource:primaryDisplayType:", v10, *(_QWORD *)(a1 + 48));
    if (objc_msgSend(*(id *)(a1 + 32), "_isEnvironmentalAudioExposureRoom"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_unattenuatedBaseDisplayTypeForPrimaryDisplayType:applicationItems:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v17 = 16;
      goto LABEL_10;
    }
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "primaryDisplayTypeWithApplicationItems:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "unitController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "healthStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_buildAudioAverageDataSourceWithUnitController:displayType:healthStore:averageOverVisibleRange:attenuated:", v19, v10, v20, 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_HKAudioStandardQuantityContextDelegate initWithCustomDataSource:primaryDisplayType:]([_HKAudioStandardQuantityContextDelegate alloc], "initWithCustomDataSource:primaryDisplayType:", v21, v10);
  v12 = 0;
  v17 = 0;
LABEL_10:

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "contextDelegates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v11);

  }
LABEL_13:
  +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:optionalBaseDisplayType:](HKOverlayRoomViewControllerIntegratedContext, "quantityContextWithIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:optionalBaseDisplayType:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v11, v17, *(_QWORD *)(a1 + 64), v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(_QWORD *a1, uint64_t a2)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:](HKOverlayRoomViewControllerIntegratedContext, "distributionContextWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", 0, a2, a1[4], a1[5], 0, 0, a1[6]);
}

HKOverlayRoomViewControllerLastQuantityContext *__108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_5(_QWORD *a1)
{
  return -[HKOverlayRoomViewControllerLastQuantityContext initWithOverlayChartController:applicationItems:mode:attenuated:]([HKOverlayRoomViewControllerLastQuantityContext alloc], "initWithOverlayChartController:applicationItems:mode:attenuated:", a1[4], a1[5], a1[6], 1);
}

uint64_t __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_unattenuatedBaseDisplayTypeForPrimaryDisplayType:(id)a3 applicationItems:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HKInteractiveChartOverlayNamedDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = *MEMORY[0x1E0CB5C78];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unitController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_audioLevelDataSourceForTypeIdentifier:withHealthStore:attenuatesExposureData:unitController:", v6, v9, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v11, CFSTR("HKAudioExposureUnattenuatedData"), 0);
  objc_msgSend(v8, "hk_interactiveChartsFormatterForTimeScope:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unitController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chartDataCacheController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", 5, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewController chartController](self, "chartController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayTypeForGraphSeries:namedDataSource:templateDisplayType:timeScope:formatter:", v17, v12, v8, 5, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)_shouldShowUnattenuatedOverlayPill
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleDateRangeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateRangesBySampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C80]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateRangeForSampleType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_6;
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "maxValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = 1;
LABEL_7:

  return v10;
}

- (void)sampleTypeDateRangeController:(id)a3 didUpdateDateRanges:(id)a4
{
  _BOOL4 isShowingUnattenuatedOverlayPill;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKOverlayRoomAudioViewController;
  -[HKOverlayRoomViewController sampleTypeDateRangeController:didUpdateDateRanges:](&v6, sel_sampleTypeDateRangeController_didUpdateDateRanges_, a3, a4);
  isShowingUnattenuatedOverlayPill = self->_isShowingUnattenuatedOverlayPill;
  if (isShowingUnattenuatedOverlayPill != -[HKOverlayRoomAudioViewController _shouldShowUnattenuatedOverlayPill](self, "_shouldShowUnattenuatedOverlayPill"))-[HKOverlayRoomViewController reloadOverlayContextItems](self, "reloadOverlayContextItems");
}

- (id)_makeHeadphoneDeviceFiltersUsingContextCreator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  id obj;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[HKOverlayRoomAudioViewController audioExposureDevicesDataSource](self, "audioExposureDevicesDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devicesByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HKOverlayRoomAudioViewController audioExposureDevicesDataSource](self, "audioExposureDevicesDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devicesByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1D829F904]();
        -[HKOverlayRoomAudioViewController audioExposureDevicesDataSource](self, "audioExposureDevicesDataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "devicesByName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[HKOverlayRoomAudioViewController _headphonePredicateForDevices:withName:](self, "_headphonePredicateForDevices:withName:", v18, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v19);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("localizedNameKey"), 1, sel_localizedStandardCompare_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __83__HKOverlayRoomAudioViewController__makeHeadphoneDeviceFiltersUsingContextCreator___block_invoke;
  v28[3] = &unk_1E9C419F0;
  v29 = v26;
  v23 = v26;
  objc_msgSend(v22, "hk_map:", v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __83__HKOverlayRoomAudioViewController__makeHeadphoneDeviceFiltersUsingContextCreator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)_initialPillForPreference:(int64_t)a3
{
  int64_t result;
  NSObject *v5;

  result = 0;
  if (a3 > 3)
  {
    if (a3 == 4)
      return 2;
    if (a3 == 11)
      return result;
  }
  else
  {
    if (!a3)
      return result;
    if (a3 == 1)
      return 1;
  }
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEBUG))
    -[HKOverlayRoomAudioViewController _initialPillForPreference:].cold.1(a3, v5);
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
  HKOverlayRoomAudioViewController *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HKOverlayRoomAudioViewController *v16;

  v8 = a5;
  v9 = a4;
  v10 = [HKOverlayRoomAudioViewController alloc];
  -[HKOverlayRoomAudioViewController quantityTypeIdentifier](self, "quantityTypeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKOverlayRoomAudioViewController preferredOverlay](self, "preferredOverlay");
  -[HKOverlayRoomAudioViewController audioExposureDevicesDataSource](self, "audioExposureDevicesDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomAudioViewController trendModel](self, "trendModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKOverlayRoomAudioViewController initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:audioExposureDeviceDataSource:trendModel:factorDisplayTypes:](v10, "initWithDisplayDate:applicationItems:mode:identifier:preferredOverlay:audioExposureDeviceDataSource:trendModel:factorDisplayTypes:", v9, v8, a3, v11, v12, v13, v14, v15);

  -[HKOverlayRoomViewController setAdditionalChartOptions:](v16, "setAdditionalChartOptions:", -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3));
  return v16;
}

- (BOOL)_isEnvironmentalAudioExposureRoom
{
  return -[NSString isEqualToString:](self->_quantityTypeIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5C78]);
}

- (BOOL)_isHeadphoneAudioExposureRoom
{
  return -[NSString isEqualToString:](self->_quantityTypeIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5CA8]);
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
  v8.super_class = (Class)HKOverlayRoomAudioViewController;
  -[HKOverlayRoomViewController createChartOverlayViewController](&v8, sel_createChartOverlayViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isAudioExposureDevicesSupported
{
  return !-[HKOverlayRoomAudioViewController _isEnvironmentalAudioExposureRoom](self, "_isEnvironmentalAudioExposureRoom");
}

- (void)_setupAudioExposureDataSourceIfNeeded
{
  void *v3;
  HKAudioExposureDevicesDataSource *v4;
  void *v5;
  void *v6;
  HKAudioExposureDevicesDataSource *v7;

  if (-[HKOverlayRoomAudioViewController _isAudioExposureDevicesSupported](self, "_isAudioExposureDevicesSupported"))
  {
    -[HKOverlayRoomAudioViewController audioExposureDevicesDataSource](self, "audioExposureDevicesDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = [HKAudioExposureDevicesDataSource alloc];
      -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "healthStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HKAudioExposureDevicesDataSource initWithDeviceType:healthStore:](v4, "initWithDeviceType:healthStore:", 0, v6);

      -[HKAudioExposureDevicesDataSource startQuery](v7, "startQuery");
      -[HKOverlayRoomAudioViewController setAudioExposureDevicesDataSource:](self, "setAudioExposureDevicesDataSource:", v7);

    }
  }
}

- (void)_registerForAudioExposureDeviceUpdates
{
  void *v3;
  id v4;

  if (-[HKOverlayRoomAudioViewController _isAudioExposureDevicesSupported](self, "_isAudioExposureDevicesSupported"))
  {
    -[HKOverlayRoomAudioViewController audioExposureDevicesDataSource](self, "audioExposureDevicesDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HKOverlayRoomAudioViewController audioExposureDevicesDataSource](self, "audioExposureDevicesDataSource");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:", self);

    }
  }
}

- (void)_reloadAudioExposureDevices
{
  void *v3;
  char v4;
  int64_t v5;
  id v6;

  if (-[HKOverlayRoomAudioViewController _isAudioExposureDevicesSupported](self, "_isAudioExposureDevicesSupported"))
  {
    -[HKOverlayRoomAudioViewController audioExposureDevicesDataSource](self, "audioExposureDevicesDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3
      && (v6 = v3, v4 = -[HKOverlayRoomAudioViewController isViewLoaded](self, "isViewLoaded"), v3 = v6, (v4 & 1) != 0))
    {
      v5 = -[HKOverlayRoomViewController controllerMode](self, "controllerMode");

      if (v5 == 3)
        -[HKOverlayRoomViewController reloadOverlayContextItems](self, "reloadOverlayContextItems");
    }
    else
    {

    }
  }
}

- (id)_headphonePredicateForDevices:(id)a3 withName:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  HKInteractiveChartOverlayPredicate *v8;

  v5 = (void *)MEMORY[0x1E0CB6A78];
  v6 = a4;
  objc_msgSend(v5, "predicateForObjectsFromDevices:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKInteractiveChartOverlayPredicate initWithPredicate:name:]([HKInteractiveChartOverlayPredicate alloc], "initWithPredicate:name:", v7, v6);

  return v8;
}

- (id)_buildAudioAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 averageOverVisibleRange:(BOOL)a6 attenuated:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  HKQuantityTypeDataSource *v17;
  void *v18;
  void *v19;
  HKInteractiveChartOverlayNamedDataSource *v20;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v7)
  {
    v15 = _HKStatisticsOptionAttenuateSamples() | 0x42;
    v16 = CFSTR("HKOverlayRoomNamedChartCacheDataSource_AttenuatedLEQ");
  }
  else
  {
    v16 = CFSTR("HKOverlayRoomNamedChartCacheDataSource_LEQ");
    v15 = 66;
  }
  v17 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:]([HKQuantityTypeDataSource alloc], "initWithUnitController:options:displayType:healthStore:", v12, v15, v13, v14);
  -[HKOverlayRoomAudioViewController _userInfoCreationBlockForLEQ](self, "_userInfoCreationBlockForLEQ");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v17, "setUserInfoCreationBlock:", v18);

  if (v8)
    -[HKOverlayRoomAudioViewController _buildAverageDataSourceTitleFromTimeScope:](self, "_buildAverageDataSourceTitleFromTimeScope:", v7);
  else
    -[HKOverlayRoomAudioViewController _buildGranularAverageDataSourceTitleFromTimeScope](self, "_buildGranularAverageDataSourceTitleFromTimeScope");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v17, v16, v19);

  return v20;
}

- (id)_buildAverageDataSourceTitleFromTimeScope:(BOOL)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  BOOL v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__HKOverlayRoomAudioViewController__buildAverageDataSourceTitleFromTimeScope___block_invoke;
  v6[3] = &unk_1E9C41A18;
  v6[4] = self;
  v7 = a3;
  v3 = _Block_copy(v6);
  v4 = _Block_copy(v3);

  return v4;
}

id __78__HKOverlayRoomAudioViewController__buildAverageDataSourceTitleFromTimeScope___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isEnvironmentalAudioExposureRoom")
    && objc_msgSend(*(id *)(a1 + 32), "_shouldShowUnattenuatedOverlayPill")
    && !*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("OVERLAY_AVERAGE_AUDIO_EXPOSURE_WITHOUT_ATTENUATION");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("OVERLAY_AVERAGE_AUDIO_EXPOSURE");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_buildGranularAverageDataSourceTitleFromTimeScope
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__HKOverlayRoomAudioViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E9C40548;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  v3 = _Block_copy(v2);

  return v3;
}

__CFString *__85__HKOverlayRoomAudioViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HKOverlayRoomAudioViewController.m"), 707, CFSTR("Unsupported zoom level (%ld)"), a2);
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

- (id)_userInfoCreationBlockForLEQ
{
  return &__block_literal_global_264;
}

HKInteractiveChartAudioData *__64__HKOverlayRoomAudioViewController__userInfoCreationBlockForLEQ__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  HKInteractiveChartAudioData *v12;

  v2 = (void *)MEMORY[0x1E0CB6CD0];
  v3 = a2;
  objc_msgSend(v2, "decibelAWeightedSoundPressureLevelUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v4);
  v7 = v6;

  objc_msgSend(v3, "durationQuantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValueForUnit:", v9);
    v11 = v10;

  }
  else
  {
    v11 = 0.0;
  }
  v12 = objc_alloc_init(HKInteractiveChartAudioData);
  -[HKInteractiveChartAudioData setAverageLEQ:](v12, "setAverageLEQ:", v7);
  -[HKInteractiveChartAudioData setDuration:](v12, "setDuration:", v11);
  -[HKInteractiveChartAudioData setOverviewData:](v12, "setOverviewData:", 0);

  return v12;
}

- (NSString)quantityTypeIdentifier
{
  return self->_quantityTypeIdentifier;
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

- (HKAudioExposureDevicesDataSource)audioExposureDevicesDataSource
{
  return self->_audioExposureDevicesDataSource;
}

- (void)setAudioExposureDevicesDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_audioExposureDevicesDataSource, a3);
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (BOOL)isShowingUnattenuatedOverlayPill
{
  return self->_isShowingUnattenuatedOverlayPill;
}

- (void)setIsShowingUnattenuatedOverlayPill:(BOOL)a3
{
  self->_isShowingUnattenuatedOverlayPill = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_audioExposureDevicesDataSource, 0);
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
  _os_log_debug_impl(&dword_1D7813000, a2, OS_LOG_TYPE_DEBUG, "HKOverlayRoomAudioViewController received invalid secondary type: %ld", (uint8_t *)&v2, 0xCu);
}

@end
