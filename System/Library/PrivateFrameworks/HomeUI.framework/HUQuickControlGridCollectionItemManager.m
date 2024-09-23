@implementation HUQuickControlGridCollectionItemManager

- (HUQuickControlGridCollectionItemManager)initWithDelegate:(id)a3 controlItems:(id)a4
{
  id v6;
  HUQuickControlGridCollectionItemManager *v7;
  uint64_t v8;
  NSSet *controlItems;
  void *v10;
  uint64_t v11;
  HFAccessoryControlItem *accessoryControlItem;
  uint64_t v13;
  NSMapTable *controlItemToQuickControlContextTable;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUQuickControlGridCollectionItemManager;
  v7 = -[HFItemManager initWithDelegate:sourceItem:](&v22, sel_initWithDelegate_sourceItem_, a3, 0);
  if (v7)
  {
    objc_msgSend(v6, "na_map:", &__block_literal_global_56);
    v8 = objc_claimAutoreleasedReturnValue();
    controlItems = v7->_controlItems;
    v7->_controlItems = (NSSet *)v8;

    objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_2_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    accessoryControlItem = v7->_accessoryControlItem;
    v7->_accessoryControlItem = (HFAccessoryControlItem *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithWeakToStrongObjects");
    v13 = objc_claimAutoreleasedReturnValue();
    controlItemToQuickControlContextTable = v7->_controlItemToQuickControlContextTable;
    v7->_controlItemToQuickControlContextTable = (NSMapTable *)v13;

    objc_opt_class();
    -[HFItemManager delegate](v7, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v7->_isRTL = objc_msgSend(v18, "effectiveUserInterfaceLayoutDirection") == 1;
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accessorySettingsDataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:", v7);

  }
  return v7;
}

id __73__HUQuickControlGridCollectionItemManager_initWithDelegate_controlItems___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

uint64_t __73__HUQuickControlGridCollectionItemManager_initWithDelegate_controlItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HUQuickControlGridCollectionItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_controlItems_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlGridCollectionItemManager.m"), 88, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUQuickControlGridCollectionItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (void)tearDown
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessorySettingsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  return 0;
}

- (id)configuration
{
  HUQuickControlViewControllerConfiguration *v3;
  void *v4;
  HUQuickControlViewControllerConfiguration *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = [HUQuickControlViewControllerConfiguration alloc];
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlViewControllerConfiguration initWithHome:](v3, "initWithHome:", v4);

  -[HUQuickControlViewControllerConfiguration setCopyItems:](v5, "setCopyItems:", 0);
  -[HFItemManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2B08B0))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  -[HUQuickControlViewControllerConfiguration setItemUpdater:](v5, "setItemUpdater:", v8);

  return v5;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridCollectionItemManager accessoryControlItem](self, "accessoryControlItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUQuickControlGridCollectionItemManager accessoryControlItem](self, "accessoryControlItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0D310A8]);
    -[HUQuickControlGridCollectionItemManager accessoryControlItem](self, "accessoryControlItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithAccessory:valueSource:", v12, v9);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31070]), "initWithAccessoryItem:", v13);
    -[HUQuickControlGridCollectionItemManager setControlItemProvider:](self, "setControlItemProvider:", v14);

    -[HUQuickControlGridCollectionItemManager accessoryControlItem](self, "accessoryControlItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317D8]), "initWithHome:", v4);
    -[HUQuickControlGridCollectionItemManager setServiceItemProvider:](self, "setServiceItemProvider:", v17);

    -[HUQuickControlGridCollectionItemManager serviceItemProvider](self, "serviceItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValueSource:", v9);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __70__HUQuickControlGridCollectionItemManager__buildItemProvidersForHome___block_invoke;
    v27[3] = &unk_1E6F4F118;
    v28 = v16;
    v19 = v16;
    -[HUQuickControlGridCollectionItemManager serviceItemProvider](self, "serviceItemProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSourceServiceGenerator:", v27);

  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0D31848]);
    -[HUQuickControlGridCollectionItemManager controlItems](self, "controlItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithItems:", v22);
    -[HUQuickControlGridCollectionItemManager setControlItemProvider:](self, "setControlItemProvider:", v23);

  }
  -[HUQuickControlGridCollectionItemManager controlItemProvider](self, "controlItemProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v24);

  -[HUQuickControlGridCollectionItemManager serviceItemProvider](self, "serviceItemProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v25);

  return v5;
}

id __70__HUQuickControlGridCollectionItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_visibleServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  HUQuickControlGridCollectionItemManager *v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  HUQuickControlGridCollectionItemManager *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  void *v105;
  uint64_t v106;
  HUQuickControlGridCollectionItemManager *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  HUQuickControlGridCollectionItemManager *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  id v140;
  id obj;
  id v142;
  void (**v143)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v144;
  void *v145;
  HUQuickControlGridCollectionItemManager *v146;
  void *v147;
  void *v148;
  _QWORD v149[4];
  id v150;
  id v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _QWORD aBlock[5];
  id v161;
  id v162;
  id v163;
  _BYTE v164[128];
  _BYTE v165[128];
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUQuickControlGridCollectionItemManager controlItemProvider](self, "controlItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlGridCollectionItemManager serviceItemProvider](self, "serviceItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v4;
  objc_msgSend(v9, "na_setByIntersectingWithSet:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceItemComparator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingComparator:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "setWithCapacity:", objc_msgSend(v13, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "setWithCapacity:", objc_msgSend(v13, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke;
  aBlock[3] = &unk_1E6F507B8;
  aBlock[4] = self;
  v134 = v18;
  v161 = v134;
  v140 = v20;
  v162 = v140;
  v139 = v21;
  v163 = v139;
  v23 = _Block_copy(aBlock);
  -[HUQuickControlGridCollectionItemManager accessoryControlItem](self, "accessoryControlItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v143 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v23;
  v144 = v19;
  v146 = self;
  v137 = v13;
  v138 = v7;
  v135 = v16;
  if (v24)
  {
    -[HUQuickControlGridCollectionItemManager accessoryControlItem](self, "accessoryControlItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "accessory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hf_primaryService");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v147 = v27;
    objc_msgSend(v27, "serviceType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlGridCollectionItemManager controlItemProvider](self, "controlItemProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "items");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v31 = v16;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v156, v165, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v157;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v157 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * i);
          -[HFItemManager childItemsForItem:ofClass:](v146, "childItemsForItem:ofClass:", v36, objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlGridCollectionItemManager _generateQuickControlGroupContextForControlItems:](v146, "_generateQuickControlGroupContextForControlItems:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *, void *, void *, uint64_t))v143)[2](v143, v38, v37, v28, v30, v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "addObject:", v39);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v156, v165, 16);
      }
      while (v33);
    }

    v40 = -[HUQuickControlGridCollectionItemManager _catchAllLayoutForGridViewProfiles:supplementaryViewProfiles:](v146, "_catchAllLayoutForGridViewProfiles:supplementaryViewProfiles:", v140, v139);
    v7 = v138;
    v19 = v144;
    v17 = 0x1E0C99000;
    v22 = MEMORY[0x1E0C809B0];
    v41 = v147;
  }
  else
  {
    -[HUQuickControlGridCollectionItemManager _generateQuickControlGroupContextForControlItems:](self, "_generateQuickControlGroupContextForControlItems:", v7);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *, void *, _QWORD, _QWORD, _QWORD))v23 + 2))(v23, v41, v7, 0, 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v28);
    v40 = 0;
  }

  objc_msgSend(*(id *)(v17 + 3560), "array");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
    objc_msgSend(*(id *)(v17 + 3560), "array");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v17 + 3560), "array");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v149[0] = v22;
    v149[1] = 3221225472;
    v149[2] = __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_4;
    v149[3] = &unk_1E6F507E0;
    v79 = v77;
    v150 = v79;
    v142 = v78;
    v151 = v142;
    objc_msgSend(v19, "na_each:", v149);
    v145 = v79;
    if (objc_msgSend(v79, "count"))
    {
      objc_msgSend(v79, "na_firstObjectPassingTest:", &__block_literal_global_81);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "valueSource");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "allServices");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "anyObject");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v83, "accessory");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "hf_siriEndpointProfile");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v86 = v85 != 0;
      v87 = v146;
      if (v85)
      {
        objc_msgSend(v83, "accessory");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlGridCollectionItemManager setIsSpeakerAccessory:](v146, "setIsSpeakerAccessory:", objc_msgSend(v88, "hf_isDumbSpeaker"));

        if (!-[HUQuickControlGridCollectionItemManager isSpeakerAccessory](v146, "isSpeakerAccessory"))
        {
          -[HUQuickControlGridCollectionItemManager airPlayEnabledSettingNumberValue](v146, "airPlayEnabledSettingNumberValue");
          v89 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v89)
          {
            objc_msgSend(v83, "accessory");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "mediaProfile");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "hf_mediaAccessoryCommonSettingsManager");
            v92 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v92, "settingValueForKeyPath:", *MEMORY[0x1E0D301A8]);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUQuickControlGridCollectionItemManager setAirPlayEnabledSettingNumberValue:](v146, "setAirPlayEnabledSettingNumberValue:", v93);

          }
        }
        objc_msgSend(v79, "na_filter:", &__block_literal_global_82_0);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlGridCollectionItemManager mediaControlItems](v146, "mediaControlItems");
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v95)
          -[HUQuickControlGridCollectionItemManager setMediaControlItems:](v146, "setMediaControlItems:", v94);
        objc_msgSend(v79, "removeObjectsInArray:", v94);

      }
      v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("grid"));
      objc_msgSend(v96, "setItems:", v79);
      objc_msgSend(v148, "addObject:", v96);

    }
    else
    {
      v86 = 0;
      v87 = v146;
    }
    -[HUQuickControlGridCollectionItemManager _mediaAlarmsAndTimerItemsFromControlItems:](v87, "_mediaAlarmsAndTimerItemsFromControlItems:", v142);
    v106 = objc_claimAutoreleasedReturnValue();
    v107 = v87;
    v108 = (void *)v106;
    -[HUQuickControlGridCollectionItemManager mediaControlItems](v107, "mediaControlItems");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v109, "count");

    v111 = 0;
    if (v86 && v110)
    {
      v112 = objc_alloc(MEMORY[0x1E0D31570]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media-%@"), CFSTR("grid"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = (void *)objc_msgSend(v112, "initWithIdentifier:", v113);

      objc_msgSend(v111, "setItems:", MEMORY[0x1E0C9AA60]);
      if (-[HUQuickControlGridCollectionItemManager isSpeakerAccessory](v146, "isSpeakerAccessory")
        || (-[HUQuickControlGridCollectionItemManager airPlayEnabledSettingNumberValue](v146, "airPlayEnabledSettingNumberValue"), v114 = (void *)objc_claimAutoreleasedReturnValue(), v115 = objc_msgSend(v114, "BOOLValue"), v114, v115))
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSectionTitle"), CFSTR("HUMediaSectionTitle"), 1);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlGridCollectionItemManager mediaControlItems](v146, "mediaControlItems");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "setItems:", v117);

      }
      else
      {
        v116 = 0;
      }
      objc_msgSend(v111, "setHeaderTitle:", v116);
      objc_msgSend(v148, "addObject:", v111);

    }
    if (objc_msgSend(v108, "count"))
    {
      objc_msgSend(v142, "removeObjectsInArray:", v108);
      -[HUQuickControlGridCollectionItemManager _addMediaAlarmsAndTimers:toSections:](v146, "_addMediaAlarmsAndTimers:toSections:", v108, v148);
    }
    v97 = v144;
    if (!objc_msgSend(v142, "count"))
      goto LABEL_87;
    v121 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("supplementary"));
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "sortedArrayUsingComparator:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setItems:", v123);

    if (-[HUQuickControlGridCollectionItemManager isSpeakerAccessory](v146, "isSpeakerAccessory"))
    {
      v124 = objc_msgSend(v148, "indexOfObject:", v111);
    }
    else
    {
      -[HUQuickControlGridCollectionItemManager airPlayEnabledSettingNumberValue](v146, "airPlayEnabledSettingNumberValue");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v125, "BOOLValue"))
        v124 = objc_msgSend(v148, "indexOfObject:", v111);
      else
        v124 = 0x7FFFFFFFFFFFFFFFLL;

      v97 = v144;
    }
    if (v124 != 0x7FFFFFFFFFFFFFFFLL && v86)
    {
      v127 = v148;
      v128 = v121;
      v129 = v124;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v148, "count") < 2)
      {
        objc_msgSend(v148, "addObject:", v121);
        goto LABEL_86;
      }
      v127 = v148;
      v128 = v121;
      v129 = 1;
    }
    objc_msgSend(v127, "insertObject:atIndex:", v128, v129);
LABEL_86:

LABEL_87:
    v98 = v150;
LABEL_88:
    v118 = v135;
    goto LABEL_89;
  }
  -[HUQuickControlGridCollectionItemManager accessoryControlItem](v146, "accessoryControlItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "accessory");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "hf_primaryService");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "accessory");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "hf_siriEndpointProfile");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "accessory");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridCollectionItemManager setIsSpeakerAccessory:](v146, "setIsSpeakerAccessory:", objc_msgSend(v47, "hf_isDumbSpeaker"));

  if (!-[HUQuickControlGridCollectionItemManager isSpeakerAccessory](v146, "isSpeakerAccessory"))
  {
    -[HUQuickControlGridCollectionItemManager airPlayEnabledSettingNumberValue](v146, "airPlayEnabledSettingNumberValue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v48)
    {
      objc_msgSend(v44, "accessory");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "mediaProfile");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "hf_mediaAccessoryCommonSettingsManager");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "settingValueForKeyPath:", *MEMORY[0x1E0D301A8]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlGridCollectionItemManager setAirPlayEnabledSettingNumberValue:](v146, "setAirPlayEnabledSettingNumberValue:", v52);

    }
  }
  v133 = v44;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  obj = v19;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v152, v164, 16);
  if (v53)
  {
    v54 = v53;
    v142 = 0;
    v145 = 0;
    v55 = *(_QWORD *)v153;
    v56 = v146;
    do
    {
      for (j = 0; j != v54; ++j)
      {
        if (*(_QWORD *)v153 != v55)
          objc_enumerationMutation(obj);
        v58 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * j);
        objc_msgSend(v58, "serviceItem");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "service");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          v61 = (uint64_t)v145;
          if (!v145)
          {
            -[HUQuickControlGridCollectionItemManager _findAndRemoveMediaControlItemsFromSection:](v56, "_findAndRemoveMediaControlItemsFromSection:", v58);
            v61 = objc_claimAutoreleasedReturnValue();
          }
          v145 = (void *)v61;
          if (!v142)
          {
            -[HUQuickControlGridCollectionItemManager _findAndRemoveMediaAlarmsAndTimerItemsFromSection:](v56, "_findAndRemoveMediaAlarmsAndTimerItemsFromSection:", v58);
            v142 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        objc_msgSend(v58, "gridControlItems");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "count");

        if (v63)
        {
          v64 = objc_alloc(MEMORY[0x1E0D31570]);
          -[HUQuickControlGridCollectionItemManager _composeIdentifierForService:section:](v56, "_composeIdentifierForService:section:", v60, 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (void *)objc_msgSend(v64, "initWithIdentifier:", v65);

          objc_msgSend(v58, "gridControlItems");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setItems:", v67);

          if (v46 && objc_msgSend(v148, "count"))
          {
            objc_msgSend(v58, "serviceItem");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "namingComponentForHomeKitObject");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "name");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "setHeaderTitle:", v70);

            v56 = v146;
          }
          objc_msgSend(v148, "addObject:", v66);

        }
        objc_msgSend(v58, "supplementaryControlItems");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "count");

        if (v72)
        {
          v73 = objc_alloc(MEMORY[0x1E0D31570]);
          -[HUQuickControlGridCollectionItemManager _composeIdentifierForService:section:](v56, "_composeIdentifierForService:section:", v60, 2);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = (void *)objc_msgSend(v73, "initWithIdentifier:", v74);

          objc_msgSend(v58, "supplementaryControlItems");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setItems:", v76);

          objc_msgSend(v148, "addObject:", v75);
        }

      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v152, v164, 16);
    }
    while (v54);
  }
  else
  {
    v142 = 0;
    v145 = 0;
    v56 = v146;
  }

  v13 = v137;
  v7 = v138;
  v97 = v144;
  v98 = v133;
  if (objc_msgSend(v145, "count") && v46)
  {
    v99 = objc_alloc(MEMORY[0x1E0D31570]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media-%@"), CFSTR("grid"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = (void *)objc_msgSend(v99, "initWithIdentifier:", v100);

    objc_msgSend(v101, "setItems:", v145);
    objc_msgSend(v101, "setItems:", MEMORY[0x1E0C9AA60]);
    if (-[HUQuickControlGridCollectionItemManager isSpeakerAccessory](v56, "isSpeakerAccessory")
      || (-[HUQuickControlGridCollectionItemManager airPlayEnabledSettingNumberValue](v56, "airPlayEnabledSettingNumberValue"), v102 = (void *)objc_claimAutoreleasedReturnValue(), v103 = objc_msgSend(v102, "BOOLValue"), v102, v103))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSectionTitle"), CFSTR("HUMediaSectionTitle"), 1);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (v145)
        -[HUQuickControlGridCollectionItemManager setMediaControlItems:](v56, "setMediaControlItems:");
      -[HUQuickControlGridCollectionItemManager mediaControlItems](v56, "mediaControlItems");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setItems:", v105);

    }
    else
    {
      v104 = 0;
    }
    objc_msgSend(v101, "setHeaderTitle:", v104);
    objc_msgSend(v148, "addObject:", v101);

  }
  if (!v142)
    goto LABEL_88;
  v118 = v135;
  if (v46)
  {
    v119 = v56;
    v120 = v148;
    -[HUQuickControlGridCollectionItemManager _addMediaAlarmsAndTimers:toSections:](v119, "_addMediaAlarmsAndTimers:toSections:");
    goto LABEL_90;
  }
LABEL_89:
  v120 = v148;
LABEL_90:

  if (objc_msgSend(v134, "count"))
  {
    v130 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("sensors"));
    objc_msgSend(v134, "sortedArrayUsingComparator:", &__block_literal_global_85_1);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setItems:", v131);

    objc_msgSend(v120, "addObject:", v130);
  }

  return v120;
}

HUQuickControlGridServiceSection *__76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HUQuickControlGridServiceSection *v21;
  uint64_t v22;
  HUQuickControlGridServiceSection *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  HUQuickControlGridServiceSection *v29;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  HUQuickControlGridServiceSection *v37;
  id v38;
  id v39;
  id v40;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a2;
  objc_msgSend(a3, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31328], "hf_controlItemComparator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "primaryQuickControlContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alternateQuickControlContexts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "na_setWithSafeObject:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unionSet:", v19);
  v21 = objc_alloc_init(HUQuickControlGridServiceSection);
  -[HUQuickControlGridServiceSection setServiceItem:](v21, "setServiceItem:", v13);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
  v31[3] = &unk_1E6F50790;
  v22 = *(_QWORD *)(a1 + 32);
  v32 = v20;
  v33 = v22;
  v34 = v17;
  v35 = v12;
  v36 = v11;
  v23 = v21;
  v37 = v23;
  v38 = *(id *)(a1 + 40);
  v39 = *(id *)(a1 + 48);
  v40 = *(id *)(a1 + 56);
  v24 = v11;
  v25 = v12;
  v26 = v17;
  v27 = v20;
  objc_msgSend(v26, "na_each:", v31);
  v28 = v40;
  v29 = v23;

  return v29;
}

void __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  id *v25;
  int v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v3 = a2;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30538]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = *(void **)(a1 + 32);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v28[3] = &unk_1E6F50768;
  v27 = v3;
  v29 = v27;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "controlItemToQuickControlContextTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v27);

    objc_msgSend(v27, "valueSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allServices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "anyObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isPrimaryService");

      v14 = v13 ^ 1;
    }
    else
    {
      v14 = 1;
    }
    v15 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", v27);
    v16 = objc_msgSend((id)objc_opt_class(), "specialCaseSectionSortingForControlItem:quickControlContext:fromControlItems:primaryServiceType:", v27, v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    if (v16 == 2)
      v17 = 1;
    else
      v17 = (v6 >> 2) & 1;
    v18 = 1;
    if (v14 && (v6 & 2) == 0)
    {
      if (v15)
        v19 = v16 == 1;
      else
        v19 = 1;
      v18 = v19;
    }
    if (v17)
    {
      v20 = *(void **)(a1 + 72);
    }
    else
    {
      if (v16 == 3)
      {
        objc_msgSend(*(id *)(a1 + 80), "addObject:", v27);
        v21 = 0;
        v22 = 0;
        goto LABEL_23;
      }
      v20 = *(void **)(a1 + 72);
      if (v18)
      {
        objc_msgSend(v20, "gridControlItems");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v27);

        v21 = 0;
        v22 = 1;
        goto LABEL_23;
      }
    }
    objc_msgSend(v20, "supplementaryControlItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v27);

    v22 = 0;
    v21 = 1;
LABEL_23:
    objc_msgSend(v8, "setPreferredControl:", objc_msgSend((id)objc_opt_class(), "preferredControlForControlItem:allControlItems:isSupplementary:", v27, *(_QWORD *)(a1 + 56), v21));
    if (v22)
    {
      v25 = (id *)(a1 + 88);
    }
    else
    {
      if (!(_DWORD)v21)
        goto LABEL_28;
      v25 = (id *)(a1 + 96);
    }
    objc_msgSend(*v25, "na_safeAddObject:", objc_msgSend(v8, "viewProfileClass"));
LABEL_28:
    v26 = objc_msgSend((id)objc_msgSend(v8, "viewProfileClass"), "isEqual:", objc_opt_class());
    if (v26)
    {
      if ((objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", *MEMORY[0x1E0CB9B00]) & 1) != 0)
      {
LABEL_33:

        goto LABEL_34;
      }
      v26 = objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", *MEMORY[0x1E0CB9A30]);
    }
    if (((v22 | v26) & 1) == 0)
      objc_msgSend(v8, "setControlOrientation:", 1);
    goto LABEL_33;
  }
LABEL_34:

}

uint64_t __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "controlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "gridControlItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v4, "supplementaryControlItems");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

}

BOOL __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "valueSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

uint64_t __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  uint64_t v25;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v8, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D30D00];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D00]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedLowercaseString");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (__CFString *)v15;
  else
    v17 = &stru_1E6F60E80;
  v18 = v17;

  objc_msgSend(v11, "latestResults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedLowercaseString");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (__CFString *)v21;
  else
    v23 = &stru_1E6F60E80;
  v24 = v23;

  v25 = -[__CFString compare:](v18, "compare:", v24);
  return v25;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlGridCollectionItemManager;
  -[HFItemManager _itemsToHideInSet:](&v11, sel__itemsToHideInSet_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HUQuickControlGridCollectionItemManager mediaControlItems](self, "mediaControlItems");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HUQuickControlGridCollectionItemManager airPlayEnabledSettingNumberValue](self, "airPlayEnabledSettingNumberValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "BOOLValue"))
    {

LABEL_6:
      return v5;
    }
    v9 = -[HUQuickControlGridCollectionItemManager isSpeakerAccessory](self, "isSpeakerAccessory");

    if (!v9)
    {
      -[HUQuickControlGridCollectionItemManager mediaControlItems](self, "mediaControlItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v7);
      goto LABEL_6;
    }
  }
  return v5;
}

- (id)_generateQuickControlGroupContextForControlItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HUQuickControlGridCollectionItemManager configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31328], "hu_preferredQuickControlGroupContextForControlItems:configuration:ignoringGrid:", v4, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_addMediaAlarmsAndTimers:(id)a3 toSections:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  id obj;
  void *v30;
  void *v31;
  uint64_t v32;
  _BOOL4 v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = a4;
  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hostProcess") == 100)
  {
    v33 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v8, "hostProcess") == 3;

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v31 = (void *)*MEMORY[0x1E0D306F0];
    v32 = *(_QWORD *)v36;
    v30 = (void *)*MEMORY[0x1E0D30788];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v11);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v14 = v31;
        if ((isKindOfClass & 1) == 0)
          v14 = v30;
        v15 = (objc_class *)MEMORY[0x1E0D31570];
        v16 = v14;
        v17 = (void *)objc_msgSend([v15 alloc], "initWithIdentifier:", v16);

        v18 = (void *)MEMORY[0x1E0CB3498];
        _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlAlarmsDetailsButtonTitle"), CFSTR("HUQuickControlAlarmsDetailsButtonTitle"), 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hf_attributedStringWithSystemImageNamed:title:isRTL:", CFSTR("alarm.fill"), v19, -[HUQuickControlGridCollectionItemManager isRTL](self, "isRTL"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)MEMORY[0x1E0CB3498];
        _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTimersDetailsButtonTitle"), CFSTR("HUQuickControlTimersDetailsButtonTitle"), 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hf_attributedStringWithSystemImageNamed:title:isRTL:", CFSTR("timer"), v22, -[HUQuickControlGridCollectionItemManager isRTL](self, "isRTL"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if ((isKindOfClass & 1) != 0)
          v25 = v20;
        else
          v25 = (void *)v23;

        objc_msgSend(v17, "setAttributedHeaderTitle:", v25);
        if (!v33 || objc_msgSend(MEMORY[0x1E0D319D0], "isDeviceUnlocked"))
        {
          if ((isKindOfClass & 1) != 0)
            v26 = CFSTR("HUHomePodAlarmsNew");
          else
            v26 = CFSTR("HUHomePodTimersNew");
          _HULocalizedStringWithDefaultValue(v26, v26, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setHeaderAccessoryButtonTitle:", v27);

        }
        v39 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setItems:", v28);

        objc_msgSend(v34, "addObject:", v17);
        ++v11;
      }
      while (v10 != v11);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v10);
  }

}

- (id)_mediaAlarmsAndTimerItemsFromControlItems:(id)a3
{
  return (id)objc_msgSend(a3, "na_filter:", &__block_literal_global_108);
}

uint64_t __85__HUQuickControlGridCollectionItemManager__mediaAlarmsAndTimerItemsFromControlItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  int v4;
  char v5;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = _os_feature_enabled_impl();
  if (v4)
  {
    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();
  }
  v5 = isKindOfClass | v4;

  return v5 & 1;
}

- (id)_findAndRemoveMediaControlItemsFromSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "gridControlItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_112);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "supplementaryControlItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_filter:", &__block_literal_global_113);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "gridControlItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsInArray:", v5);

    objc_msgSend(v3, "supplementaryControlItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectsInArray:", v5);

  }
  if (objc_msgSend(v5, "count"))
    v10 = v5;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

uint64_t __86__HUQuickControlGridCollectionItemManager__findAndRemoveMediaControlItemsFromSection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __86__HUQuickControlGridCollectionItemManager__findAndRemoveMediaControlItemsFromSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_findAndRemoveMediaAlarmsAndTimerItemsFromSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "gridControlItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridCollectionItemManager _mediaAlarmsAndTimerItemsFromControlItems:](self, "_mediaAlarmsAndTimerItemsFromControlItems:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v4, "supplementaryControlItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridCollectionItemManager _mediaAlarmsAndTimerItemsFromControlItems:](self, "_mediaAlarmsAndTimerItemsFromControlItems:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)v13;
  if (v13)
  {
LABEL_3:
    objc_msgSend(v4, "gridControlItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectsInArray:", v6);

    objc_msgSend(v4, "supplementaryControlItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsInArray:", v6);

  }
LABEL_4:
  if (objc_msgSend(v6, "count"))
    v9 = v6;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (id)quickControlContextForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUQuickControlGridCollectionItemManager controlItemToQuickControlContextTable](self, "controlItemToQuickControlContextTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)titleForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "latestResults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  -[HUQuickControlGridCollectionItemManager controlItemProvider](self, "controlItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (v9)
  {
    objc_opt_class();
    v10 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v5 = v11;

    objc_msgSend(v5, "valueSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allServices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "anyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlGridCollectionItemManager serviceItemProvider](self, "serviceItemProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __56__HUQuickControlGridCollectionItemManager_titleForItem___block_invoke;
      v24[3] = &unk_1E6F508C8;
      v17 = v14;
      v25 = v17;
      objc_msgSend(v16, "na_firstObjectPassingTest:", v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v18;
      if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EF2AC3F8))
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      if (v21)
      {
        objc_msgSend(v21, "namingComponentForHomeKitObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "name");
      }
      else
      {
        objc_msgSend(v19, "latestResults");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_17;
  }
  v6 = 0;
LABEL_18:

  return v6;
}

uint64_t __56__HUQuickControlGridCollectionItemManager_titleForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 32));

  return v8;
}

- (id)headerAccessoryButtonTitleForSection:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[HFItemManager itemSectionForSectionIndex:](self, "itemSectionForSectionIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerAccessoryButtonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)headerAccessoryButtonTargetForSection:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[HFItemManager itemSectionForSectionIndex:](self, "itemSectionForSectionIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerAccessoryButtonDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unint64_t)preferredControlForControlItem:(id)a3 allControlItems:(id)a4 isSupplementary:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _QWORD v13[5];

  v8 = a3;
  objc_msgSend(a4, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__HUQuickControlGridCollectionItemManager_preferredControlForControlItem_allControlItems_isSupplementary___block_invoke;
  v13[3] = &__block_descriptor_40_e23_B16__0__HFControlItem_8l;
  v13[4] = a1;
  objc_msgSend(v9, "na_filter:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(a1) = objc_msgSend((id)objc_opt_class(), "isPrimaryOrBinaryStateControlItem:", v8);
  if (!(_DWORD)a1 || (v11 = 1, (unint64_t)objc_msgSend(v10, "count") <= 2) && !a5)
    v11 = 0;

  return v11;
}

uint64_t __106__HUQuickControlGridCollectionItemManager_preferredControlForControlItem_allControlItems_isSupplementary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "isPrimaryOrBinaryStateControlItem:", v2);

  return v3;
}

+ (BOOL)isPrimaryOrBinaryStateControlItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  char v10;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "possibleValueSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 2;

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EF347E50) | v9;

  return v10;
}

+ (unint64_t)specialCaseSectionSortingForControlItem:(id)a3 quickControlContext:(id)a4 fromControlItems:(id)a5 primaryServiceType:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "valueSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") != 1)
  {
    v15 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v13, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serviceType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v11 && v15)
  {
    if ((objc_msgSend((id)objc_msgSend(v9, "quickControlClass"), "isEqual:", objc_opt_class()) & 1) != 0)
    {
      v16 = 3;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_fanServiceTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", v11);

    if (v19)
    {
      v20 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB9A70]);
      v21 = objc_msgSend((id)objc_msgSend(v9, "quickControlClass"), "isEqual:", objc_opt_class());
      v22 = objc_msgSend(v10, "na_any:", &__block_literal_global_131);
      if ((v20 & v21) == 1 && (v22 & 1) != 0)
      {
        v16 = 2;
        goto LABEL_8;
      }
      if ((v20 & v21 ^ 1 | v22) != 1)
      {
        v16 = 1;
        goto LABEL_8;
      }
    }
LABEL_7:
    v16 = 0;
  }
LABEL_8:

  return v16;
}

uint64_t __139__HUQuickControlGridCollectionItemManager_specialCaseSectionSortingForControlItem_quickControlContext_fromControlItems_primaryServiceType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCharacteristicTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB89E8]);

  return v4;
}

- (BOOL)_catchAllLayoutForGridViewProfiles:(id)a3 supplementaryViewProfiles:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  BOOL v15;
  int v17;
  char v18;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "countForObject:", objc_opt_class());
  v8 = objc_msgSend(v5, "countForObject:", objc_opt_class());
  v9 = objc_msgSend(v5, "countForObject:", objc_opt_class());
  v10 = objc_msgSend(v6, "countForObject:", objc_opt_class());
  v11 = objc_msgSend(v6, "countForObject:", objc_opt_class());
  v12 = objc_msgSend(v6, "countForObject:", objc_opt_class());
  if (v9)
    LODWORD(v9) = objc_msgSend(v5, "count") != v9;
  if (v8 < 2)
  {
    v13 = 0;
    if (!v11)
      goto LABEL_8;
    goto LABEL_7;
  }
  v13 = (unint64_t)objc_msgSend(v5, "count") > 1;
  if (v11)
LABEL_7:
    LODWORD(v11) = objc_msgSend(v6, "count") != v11;
LABEL_8:
  if (v10)
  {
    v14 = objc_msgSend(v6, "count") != v10;
    if (v12)
    {
LABEL_10:
      v15 = objc_msgSend(v6, "count") != v12;
      goto LABEL_13;
    }
  }
  else
  {
    v14 = 0;
    if (v12)
      goto LABEL_10;
  }
  v15 = 0;
LABEL_13:
  if (v7 > 2 || v10 > 1)
    v17 = 1;
  else
    v17 = v9;
  v18 = ((v17 | v14 | v11) & 1) != 0 || v13 || v15;

  return v18;
}

- (id)_composeIdentifierForService:(id)a3 section:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString **v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = HUQuickControlCollectionItemGridSectionID;
  if (a4 != 1)
    v8 = HUQuickControlCollectionItemSupplementarySectionID;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v6, *v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)serviceItemComparator
{
  return &__block_literal_global_140;
}

uint64_t __64__HUQuickControlGridCollectionItemManager_serviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPrimaryService");

  if ((v7 & 1) != 0)
  {
    v8 = -1;
  }
  else
  {
    objc_msgSend(v5, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isPrimaryService");

    if ((v10 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v4, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "compare:", v14);

    }
  }

  return v8;
}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D301A8]))
  {
    -[HUQuickControlGridCollectionItemManager setAirPlayEnabledSettingNumberValue:](self, "setAirPlayEnabledSettingNumberValue:", v8);
    v7 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
  }

}

- (HFItemProvider)supplementaryItemProvider
{
  return self->_supplementaryItemProvider;
}

- (HFItemProvider)overflowItemProvider
{
  return self->_overflowItemProvider;
}

- (HFAccessoryControlItem)accessoryControlItem
{
  return self->_accessoryControlItem;
}

- (void)setAccessoryControlItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (HFServiceLikeItem)sourceServiceLikeItem
{
  return self->_sourceServiceLikeItem;
}

- (void)setSourceServiceLikeItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceServiceLikeItem, a3);
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (void)setControlItems:(id)a3
{
  objc_storeStrong((id *)&self->_controlItems, a3);
}

- (HFServiceItemProvider)serviceItemProvider
{
  return self->_serviceItemProvider;
}

- (void)setServiceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_serviceItemProvider, a3);
}

- (HFItemProvider)controlItemProvider
{
  return self->_controlItemProvider;
}

- (void)setControlItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_controlItemProvider, a3);
}

- (NSMapTable)controlItemToQuickControlContextTable
{
  return self->_controlItemToQuickControlContextTable;
}

- (void)setControlItemToQuickControlContextTable:(id)a3
{
  objc_storeStrong((id *)&self->_controlItemToQuickControlContextTable, a3);
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (NSArray)mediaControlItems
{
  return self->_mediaControlItems;
}

- (void)setMediaControlItems:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControlItems, a3);
}

- (NSNumber)airPlayEnabledSettingNumberValue
{
  return self->_airPlayEnabledSettingNumberValue;
}

- (void)setAirPlayEnabledSettingNumberValue:(id)a3
{
  objc_storeStrong((id *)&self->_airPlayEnabledSettingNumberValue, a3);
}

- (BOOL)isSpeakerAccessory
{
  return self->_isSpeakerAccessory;
}

- (void)setIsSpeakerAccessory:(BOOL)a3
{
  self->_isSpeakerAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airPlayEnabledSettingNumberValue, 0);
  objc_storeStrong((id *)&self->_mediaControlItems, 0);
  objc_storeStrong((id *)&self->_controlItemToQuickControlContextTable, 0);
  objc_storeStrong((id *)&self->_controlItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceItemProvider, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_sourceServiceLikeItem, 0);
  objc_storeStrong((id *)&self->_accessoryControlItem, 0);
  objc_storeStrong((id *)&self->_overflowItemProvider, 0);
  objc_storeStrong((id *)&self->_supplementaryItemProvider, 0);
}

@end
