@implementation CARScreenInfo

- (CARScreenInfo)initWithPropertySupplier:(id)a3 screenType:(unint64_t)a4
{
  return -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:](self, "initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:", a3, a4, 0, 0, *MEMORY[0x1E0CB2990], *(double *)(MEMORY[0x1E0CB2990] + 8), *(double *)(MEMORY[0x1E0CB2990] + 16), *(double *)(MEMORY[0x1E0CB2990] + 24));
}

- (CARScreenInfo)initWithPropertySupplier:(id)a3 screenType:(unint64_t)a4 additionalInsets:(NSEdgeInsets)a5 displayDictionary:(id)a6 physicalDisplay:(id)a7
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  void (**v15)(id, _QWORD);
  id v16;
  id v17;
  CARScreenInfo *v18;
  CARScreenInfo *v19;
  uint64_t v20;
  NSDictionary *screenInfoResponse;
  uint64_t v22;
  NSString *identifier;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  unint64_t v33;
  NSObject *v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  unint64_t systemAvailableInteractionModels;
  void *v51;
  id v52;
  id v53;
  const __CFDictionary *v54;
  const __CFDictionary *v55;
  const __CFDictionary *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  CARScreenInfo *v77;
  void *v78;
  id v79;
  NSURL *v80;
  NSURL *initialURL;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  BOOL v90;
  char v91;
  void *v92;
  id v93;
  id v94;
  BOOL v95;
  char v96;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  unint64_t v109;
  _QWORD v110[4];
  id v111;
  CARScreenInfo *v112;
  id v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  _QWORD v118[4];
  id v119;
  objc_super v120;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v15 = (void (**)(id, _QWORD))a3;
  v16 = a6;
  v17 = a7;
  v120.receiver = self;
  v120.super_class = (Class)CARScreenInfo;
  v18 = -[CARScreenInfo init](&v120, sel_init);
  v19 = v18;
  if (!v15 || !v18)
    goto LABEL_86;
  v20 = objc_msgSend(v16, "copy");
  screenInfoResponse = v19->_screenInfoResponse;
  v19->_screenInfoResponse = (NSDictionary *)v20;

  objc_storeStrong((id *)&v19->_physicalDisplay, a7);
  v15[2](v15, *MEMORY[0x1E0CA4588]);
  v22 = objc_claimAutoreleasedReturnValue();
  identifier = v19->_identifier;
  v19->_identifier = (NSString *)v22;

  v19->_screenType = a4;
  v19->_systemAvailableInteractionModels = 0;
  v19->_supportsLayerTracking = -[CARDisplayInfo supportsDDPContent](v19->_physicalDisplay, "supportsDDPContent");
  ((void (**)(id, const __CFString *))v15)[2](v15, CFSTR("cornerMasks"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v25 = v24;
  v26 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;

  v107 = v26;
  v19->_wantsCornerMasks = objc_msgSend(v26, "BOOLValue");
  objc_msgSend(v16, "objectForKey:", CFSTR("accessoryGiveFocus"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v28 = v27;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;

  v106 = v29;
  v19->_initialFocusOwner = objc_msgSend(v29, "BOOLValue");
  objc_msgSend(v16, "objectForKey:", CFSTR("features"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v31 = v30;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = v31;
  else
    v32 = 0;

  v105 = v32;
  if (v32)
  {
    v33 = objc_msgSend(v32, "unsignedIntegerValue");
    if ((v33 & 0xFFFFFFFFFFFFFFC1) != 0)
    {
      CarGeneralLogging();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:].cold.3(v33 & 0xFFFFFFFFFFFFFFC1, v34);

    }
    v35 = (v33 >> 1) & 2;
    if ((v33 & 8) != 0)
      v35 = 2;
    v36 = ((2 * v33) | (v33 >> 3)) & 4 | (v33 >> 1) & 8 | v35;
    if (v36 <= 1)
      v36 = 1;
    v19->_systemAvailableInteractionModels = v36;
    v19->_supportsHighFidelityTouch = (v33 & 8) != 0;
  }
  else
  {
    if (!a4)
    {
      CarGeneralLogging();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:].cold.2((uint64_t)&v19->_identifier, v37, v38, v39, v40, v41, v42, v43);

    }
    v19->_systemAvailableInteractionModels = 1;
    v19->_supportsHighFidelityTouch = 0;
  }
  objc_msgSend(v16, "objectForKey:", CFSTR("primaryInputDevice"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v45 = v44;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v45;
  else
    v46 = 0;

  v104 = v46;
  if (v46)
  {
    v47 = objc_msgSend(v46, "unsignedIntegerValue");
    v48 = 2;
    switch(v47)
    {
      case 0:
        break;
      case 1:
        goto LABEL_40;
      case 2:
        goto LABEL_37;
      case 3:
      case 4:
        goto LABEL_38;
      default:
        CarGeneralLogging();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:].cold.1(v47, v49);

        break;
    }
  }
  v19->_systemPrimaryInteractionModel = 1;
  systemAvailableInteractionModels = v19->_systemAvailableInteractionModels;
  if ((systemAvailableInteractionModels & 2) != 0)
  {
    v48 = 2;
    goto LABEL_40;
  }
  if ((systemAvailableInteractionModels & 4) != 0)
  {
LABEL_38:
    v48 = 4;
    goto LABEL_40;
  }
  if ((systemAvailableInteractionModels & 8) != 0)
  {
LABEL_37:
    v48 = 8;
LABEL_40:
    v19->_systemPrimaryInteractionModel = v48;
  }
  v15[2](v15, *MEMORY[0x1E0CA45B8]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v52 = v51;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v53 = v52;
  else
    v53 = 0;

  v19->_maxFramesPerSecond = objc_msgSend(v53, "unsignedIntegerValue");
  v54 = (const __CFDictionary *)((uint64_t (*)(id, _QWORD))v15[2])(v15, *MEMORY[0x1E0CA45C0]);
  CRSizeFromDictionary(v54, &v19->_physicalSize);
  v55 = (const __CFDictionary *)((uint64_t (*)(id, _QWORD))v15[2])(v15, *MEMORY[0x1E0CA45C8]);
  CRSizeFromDictionary(v55, &v19->_pixelSize);
  v56 = (const __CFDictionary *)((uint64_t (*)(id, _QWORD))v15[2])(v15, *MEMORY[0x1E0CA45D8]);
  CRSizeFromDictionary(v56, &v19->_squaredPixelSize);
  v15[2](v15, *MEMORY[0x1E0CA45A0]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v58 = v57;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v59 = v58;
  else
    v59 = 0;

  v102 = v59;
  v19->_limitedUI = objc_msgSend(v59, "BOOLValue");
  v15[2](v15, *MEMORY[0x1E0CA45A8]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v61 = v60;
  v103 = v53;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v62 = v61;
  else
    v62 = 0;

  v101 = v62;
  v19->_nightMode = objc_msgSend(v62, "BOOLValue");
  v15[2](v15, *MEMORY[0x1E0CA45B0]);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v64 = v63;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v65 = v64;
  else
    v65 = 0;

  v100 = v65;
  v19->_limitedUIElements = +[CARSessionConfiguration _limitableUserInterfacesFromLimitedUIValues:](CARSessionConfiguration, "_limitableUserInterfacesFromLimitedUIValues:", v65);
  v15[2](v15, *MEMORY[0x1E0CA45E0]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v67 = v66;
  v108 = v17;
  v109 = a4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v68 = v67;
  else
    v68 = 0;

  v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v118[0] = MEMORY[0x1E0C809B0];
  v118[1] = 3221225472;
  v118[2] = __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke;
  v118[3] = &unk_1E5428C68;
  v71 = v69;
  v119 = v71;
  objc_msgSend(v68, "enumerateObjectsUsingBlock:", v118);
  objc_msgSend(v16, "objectForKey:", CFSTR("viewAreas"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v73 = v72;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v74 = v73;
  else
    v74 = 0;
  v75 = MEMORY[0x1E0C809B0];

  v110[0] = v75;
  v110[1] = 3221225472;
  v110[2] = __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke_2;
  v110[3] = &unk_1E5428CB8;
  v114 = top;
  v115 = left;
  v116 = bottom;
  v117 = right;
  v76 = v74;
  v111 = v76;
  v77 = v19;
  v112 = v77;
  v98 = v70;
  v113 = v98;
  objc_msgSend(v71, "enumerateObjectsUsingBlock:", v110);
  objc_storeStrong((id *)&v77->_viewAreas, v70);
  if (v109 == 1)
  {
    v15[2](v15, *MEMORY[0x1E0CA4590]);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = v78;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v80 = (NSURL *)v79;
    else
      v80 = 0;

    initialURL = v77->_initialURL;
    v77->_initialURL = v80;

  }
  objc_msgSend(v16, "objectForKey:", CFSTR("uiAppearanceMode"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v83 = v82;
  v99 = v71;
  v84 = v76;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v85 = v83;
  else
    v85 = 0;

  v77->_supportsAppearanceMode = v85 != 0;
  v86 = v16;
  objc_msgSend(v16, "objectForKey:", CFSTR("mapAppearanceMode"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v88 = v87;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v89 = v88;
  else
    v89 = 0;

  if (v109)
    v90 = v89 == 0;
  else
    v90 = 1;
  v91 = !v90;
  v77->_supportsMapAppearanceMode = v91;
  objc_msgSend(v86, "objectForKey:", CFSTR("nightMode"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v93 = v92;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v94 = v93;
  else
    v94 = 0;

  if (v109)
    v95 = v94 == 0;
  else
    v95 = 0;
  v96 = !v95;
  v77->_supportsPerDisplayNightMode = v96;

  v16 = v86;
  v17 = v108;
LABEL_86:

  return v19;
}

void __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
LABEL_4:

  }
}

void __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  CARScreenViewArea *v6;
  void *v7;
  id v8;
  void *v9;
  CARScreenViewArea *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = [CARScreenViewArea alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke_3;
  v11[3] = &unk_1E5428C90;
  v12 = v5;
  v7 = *(void **)(a1 + 32);
  v8 = v5;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CARScreenViewArea initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:](v6, "initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:", v11, v9, *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 11), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
}

uint64_t __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
}

- (id)descriptionForAvailableInteractionModels
{
  return -[CARScreenInfo _descriptionForInteractionModel:](self, "_descriptionForInteractionModel:", -[CARScreenInfo systemAvailableInteractionModels](self, "systemAvailableInteractionModels"));
}

- (id)descriptionForPrimaryInteractionModel
{
  return -[CARScreenInfo _descriptionForInteractionModel:](self, "_descriptionForInteractionModel:", -[CARScreenInfo systemPrimaryInteractionModel](self, "systemPrimaryInteractionModel"));
}

- (id)_descriptionForInteractionModel:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 2) != 0)
  {
    objc_msgSend(v4, "arrayByAddingObject:", CFSTR("Touch"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "arrayByAddingObject:", CFSTR("Knob"));
  v7 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v7;
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 1) != 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_8:
  objc_msgSend(v5, "arrayByAddingObject:", CFSTR("Touchpad"));
  v8 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v8;
  if ((v3 & 1) != 0)
  {
LABEL_10:
    objc_msgSend(v5, "arrayByAddingObject:", CFSTR("Unknown"));
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
    goto LABEL_11;
  }
LABEL_9:
  if (!objc_msgSend(v5, "count"))
    goto LABEL_10;
LABEL_11:
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_currentProcessHasEntitlement
{
  if (_currentProcessHasEntitlement_onceToken != -1)
    dispatch_once(&_currentProcessHasEntitlement_onceToken, &__block_literal_global_15);
  return _currentProcessHasEntitlement___appHasEntitlement;
}

void __46__CARScreenInfo__currentProcessHasEntitlement__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v0, "containingBundle");
    v1 = objc_claimAutoreleasedReturnValue();

    v0 = (void *)v1;
  }
  v2 = (void *)MEMORY[0x1E0C99E60];
  CARInteractionModelEntitlements();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  CARInteractionModelEntitlements();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(v5, "BOOLForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), (_QWORD)v11))
          _currentProcessHasEntitlement___appHasEntitlement = 1;
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (unint64_t)primaryInteractionModel
{
  if (-[CARScreenInfo _currentProcessHasEntitlement](self, "_currentProcessHasEntitlement"))
    return 1;
  else
    return -[CARScreenInfo systemPrimaryInteractionModel](self, "systemPrimaryInteractionModel");
}

- (unint64_t)availableInteractionModels
{
  if (-[CARScreenInfo _currentProcessHasEntitlement](self, "_currentProcessHasEntitlement"))
    return 1;
  else
    return -[CARScreenInfo systemAvailableInteractionModels](self, "systemAvailableInteractionModels");
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v23 = (void *)MEMORY[0x1E0CB3940];
  v24.receiver = self;
  v24.super_class = (Class)CARScreenInfo;
  -[CARScreenInfo description](&v24, sel_description);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARScreenInfo identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARScreenInfo descriptionForAvailableInteractionModels](self, "descriptionForAvailableInteractionModels");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARScreenInfo descriptionForPrimaryInteractionModel](self, "descriptionForPrimaryInteractionModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("YES");
  if (-[CARScreenInfo isLimitedUI](self, "isLimitedUI"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v19 = v5;
  if (-[CARScreenInfo isNightMode](self, "isNightMode"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[CARScreenInfo supportsHighFidelityTouch](self, "supportsHighFidelityTouch"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = -[CARScreenInfo maxFramesPerSecond](self, "maxFramesPerSecond");
  -[CARScreenInfo physicalSize](self, "physicalSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{w: %f, h: %f}"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARScreenInfo pixelSize](self, "pixelSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{w: %f, h: %f}"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CARScreenInfo wantsCornerMasks](self, "wantsCornerMasks"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (!-[CARScreenInfo initialFocusOwner](self, "initialFocusOwner"))
    v4 = CFSTR("NO");
  -[CARScreenInfo viewAreas](self, "viewAreas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@, identifier: %@, availableInteractionModels: %@, primaryInteractionModel: %@, isLimited: %@, isNightMode: %@, supportsHiFi: %@, maxFPS: %lu, physicalSize: %@, pixelSize: %@, wantsCornerMasks: %@, initialFocusOwner: %@, viewAreas: %@"), v22, v21, v20, v3, v19, v6, v7, v8, v11, v14, v15, v4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)nightModeChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[CARScreenInfo identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Updating night mode on screen %@ to %{public}@", (uint8_t *)&v8, 0x16u);

  }
  self->_nightMode = v3;
}

- (void)limitedUIChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[CARScreenInfo identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Updating limited UI on screen %@ to %{public}@", (uint8_t *)&v8, 0x16u);

  }
  self->_limitedUI = v3;
}

- (void)setPhysicalDisplay:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_physicalDisplay, a3);
  -[CARScreenInfo viewAreas](self, "viewAreas");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_226);

}

uint64_t __36__CARScreenInfo_setPhysicalDisplay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateEffectiveSafeFrame");
}

- (CGPoint)originInDisplay
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[CARScreenInfo physicalDisplay](self, "physicalDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARScreenInfo identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originForScreenInfoIdentifier:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGSize)displayPixelSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CARScreenInfo physicalDisplay](self, "physicalDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pixelSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)screenType
{
  return self->_screenType;
}

- (BOOL)isLimitedUI
{
  return self->_limitedUI;
}

- (unint64_t)limitedUIElements
{
  return self->_limitedUIElements;
}

- (BOOL)isNightMode
{
  return self->_nightMode;
}

- (BOOL)supportsHighFidelityTouch
{
  return self->_supportsHighFidelityTouch;
}

- (unint64_t)maxFramesPerSecond
{
  return self->_maxFramesPerSecond;
}

- (CGSize)physicalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_physicalSize.width;
  height = self->_physicalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)squaredPixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_squaredPixelSize.width;
  height = self->_squaredPixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)viewAreas
{
  return self->_viewAreas;
}

- (CARScreenViewArea)currentViewArea
{
  return self->_currentViewArea;
}

- (void)setCurrentViewArea:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewArea, a3);
}

- (CARScreenViewArea)adjacentViewArea
{
  return self->_adjacentViewArea;
}

- (void)setAdjacentViewArea:(id)a3
{
  objc_storeStrong((id *)&self->_adjacentViewArea, a3);
}

- (unint64_t)currentViewAreaTransitionControlType
{
  return self->_currentViewAreaTransitionControlType;
}

- (void)setCurrentViewAreaTransitionControlType:(unint64_t)a3
{
  self->_currentViewAreaTransitionControlType = a3;
}

- (NSURL)initialURL
{
  return self->_initialURL;
}

- (unint64_t)systemAvailableInteractionModels
{
  return self->_systemAvailableInteractionModels;
}

- (void)setSystemAvailableInteractionModels:(unint64_t)a3
{
  self->_systemAvailableInteractionModels = a3;
}

- (unint64_t)systemPrimaryInteractionModel
{
  return self->_systemPrimaryInteractionModel;
}

- (void)setSystemPrimaryInteractionModel:(unint64_t)a3
{
  self->_systemPrimaryInteractionModel = a3;
}

- (BOOL)wantsCornerMasks
{
  return self->_wantsCornerMasks;
}

- (void)setWantsCornerMasks:(BOOL)a3
{
  self->_wantsCornerMasks = a3;
}

- (BOOL)initialFocusOwner
{
  return self->_initialFocusOwner;
}

- (void)setInitialFocusOwner:(BOOL)a3
{
  self->_initialFocusOwner = a3;
}

- (BOOL)supportsAppearanceMode
{
  return self->_supportsAppearanceMode;
}

- (void)setSupportsAppearanceMode:(BOOL)a3
{
  self->_supportsAppearanceMode = a3;
}

- (BOOL)supportsPerDisplayNightMode
{
  return self->_supportsPerDisplayNightMode;
}

- (void)setSupportsPerDisplayNightMode:(BOOL)a3
{
  self->_supportsPerDisplayNightMode = a3;
}

- (BOOL)supportsMapAppearanceMode
{
  return self->_supportsMapAppearanceMode;
}

- (void)setSupportsMapAppearanceMode:(BOOL)a3
{
  self->_supportsMapAppearanceMode = a3;
}

- (NSDictionary)screenInfoResponse
{
  return self->_screenInfoResponse;
}

- (BOOL)supportsLayerTracking
{
  return self->_supportsLayerTracking;
}

- (void)setSupportsLayerTracking:(BOOL)a3
{
  self->_supportsLayerTracking = a3;
}

- (CARDisplayInfo)physicalDisplay
{
  return self->_physicalDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalDisplay, 0);
  objc_storeStrong((id *)&self->_screenInfoResponse, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_adjacentViewArea, 0);
  objc_storeStrong((id *)&self->_currentViewArea, 0);
  objc_storeStrong((id *)&self->_viewAreas, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithPropertySupplier:(uint64_t)a1 screenType:(NSObject *)a2 additionalInsets:displayDictionary:physicalDisplay:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, a2, v4, "Unknown primary input device: %@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)initWithPropertySupplier:(uint64_t)a3 screenType:(uint64_t)a4 additionalInsets:(uint64_t)a5 displayDictionary:(uint64_t)a6 physicalDisplay:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "Missing interaction model on screen: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithPropertySupplier:(uint64_t)a1 screenType:(NSObject *)a2 additionalInsets:displayDictionary:physicalDisplay:.cold.3(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, a2, v4, "Unknown display input methods: %@", v5);

  OUTLINED_FUNCTION_6();
}

@end
