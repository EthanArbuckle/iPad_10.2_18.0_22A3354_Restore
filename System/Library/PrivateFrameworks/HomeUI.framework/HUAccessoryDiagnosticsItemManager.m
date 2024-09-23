@implementation HUAccessoryDiagnosticsItemManager

- (HUAccessoryDiagnosticsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HUAccessoryDiagnosticsItemManager *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMAccessory *sourceAccessory;
  void *v15;
  char v16;
  uint64_t v17;
  id v18;
  HUAccessoryDiagnosticsItemManager *v19;
  uint64_t v20;
  HFStaticItem *fetchManufacturerSnapshotButtonItem;
  HUInstructionsItem *v22;
  HUAccessoryDiagnosticsItemManager *v23;
  uint64_t v24;
  HFStaticItem *logCollectionFailedItem;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  HFAccessoryDiagnosticsControlItem *diagnosticsModesItem;
  id v45;
  void *v46;
  uint64_t v47;
  HFItem *enableVerboseLoggingItem;
  id v49;
  void *v50;
  uint64_t v51;
  HFItem *enableAudioClipLoggingItem;
  uint64_t v53;
  void *v54;
  int v55;
  id v56;
  id *v57;
  HUAccessoryDiagnosticsItemManager *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  HUAccessoryDiagnosticsItemManager *v69;
  _QWORD v70[4];
  HUAccessoryDiagnosticsItemManager *v71;
  _QWORD v72[4];
  HUAccessoryDiagnosticsItemManager *v73;
  _QWORD v74[4];
  HUAccessoryDiagnosticsItemManager *v75;
  objc_super v76;
  uint64_t v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessoryDiagnosticsItemManager.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceItem"));

  }
  v9 = (void *)objc_msgSend(v8, "copy");
  v76.receiver = self;
  v76.super_class = (Class)HUAccessoryDiagnosticsItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v76, sel_initWithDelegate_sourceItem_, v7, v9);

  if (v10)
  {
    -[HFItemManager sourceItem](v10, "sourceItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "anyObject");
    v13 = objc_claimAutoreleasedReturnValue();
    sourceAccessory = v10->_sourceAccessory;
    v10->_sourceAccessory = (HMAccessory *)v13;

    if (!v10->_sourceAccessory)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("HUAccessoryDiagnosticsItemManager.m"), 69, CFSTR("Could not get source accessory!"));

    }
    -[HUAccessoryDiagnosticsItemManager sourceAccessory](v10, "sourceAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsCHIP");

    v17 = MEMORY[0x1E0C809B0];
    if ((v16 & 1) == 0)
    {
      v18 = objc_alloc(MEMORY[0x1E0D31840]);
      v74[0] = v17;
      v74[1] = 3221225472;
      v74[2] = __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke;
      v74[3] = &unk_1E6F4C518;
      v19 = v10;
      v75 = v19;
      v20 = objc_msgSend(v18, "initWithResultsBlock:", v74);
      fetchManufacturerSnapshotButtonItem = v19->_fetchManufacturerSnapshotButtonItem;
      v19->_fetchManufacturerSnapshotButtonItem = (HFStaticItem *)v20;

    }
    v22 = [HUInstructionsItem alloc];
    v72[0] = v17;
    v72[1] = 3221225472;
    v72[2] = __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_2;
    v72[3] = &unk_1E6F4C518;
    v23 = v10;
    v73 = v23;
    v24 = -[HFStaticItem initWithResultsBlock:](v22, "initWithResultsBlock:", v72);
    logCollectionFailedItem = v23->_logCollectionFailedItem;
    v23->_logCollectionFailedItem = (HFStaticItem *)v24;

    if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
    {
      objc_opt_class();
      -[HFItemManager sourceItem](v23, "sourceItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
      v28 = v27;

      v67 = v12;
      if (v28)
      {
        v29 = v17;
        objc_msgSend(v28, "accessories");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "count") != 1)
          NSLog(CFSTR("Expected one accessory %@"), v30);
        objc_msgSend(v30, "anyObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "services");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "na_firstObjectPassingTest:", &__block_literal_global_219);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "valueSource");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v29;
      }
      else
      {
        -[HFItemManager sourceItem](v23, "sourceItem");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "conformsToProtocol:", &unk_1EF2AC470))
          v37 = v36;
        else
          v37 = 0;
        v30 = v37;

        objc_msgSend(v30, "valueSource");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "services");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (v35)
      {
        v38 = objc_alloc(MEMORY[0x1E0D31800]);
        objc_msgSend(v34, "anyObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "hf_serviceDescriptor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)objc_msgSend(v38, "initWithValueSource:services:primaryServiceDescriptor:", v35, v34, v40);

        v41 = objc_alloc(MEMORY[0x1E0D31080]);
        v77 = *MEMORY[0x1E0D30D70];
        v78[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "initWithValueSource:displayResults:", v66, v42);
        diagnosticsModesItem = v23->_diagnosticsModesItem;
        v23->_diagnosticsModesItem = (HFAccessoryDiagnosticsControlItem *)v43;

        v45 = objc_alloc(MEMORY[0x1E0D31920]);
        v46 = (void *)-[HFAccessoryDiagnosticsControlItem copy](v23->_diagnosticsModesItem, "copy");
        v47 = objc_msgSend(v45, "initWithSourceItem:transformationBlock:", v46, &__block_literal_global_109_6);
        enableVerboseLoggingItem = v23->_enableVerboseLoggingItem;
        v23->_enableVerboseLoggingItem = (HFItem *)v47;

        v49 = objc_alloc(MEMORY[0x1E0D31920]);
        v50 = (void *)-[HFAccessoryDiagnosticsControlItem copy](v23->_diagnosticsModesItem, "copy");
        v51 = objc_msgSend(v49, "initWithSourceItem:transformationBlock:", v50, &__block_literal_global_112_1);
        enableAudioClipLoggingItem = v23->_enableAudioClipLoggingItem;
        v23->_enableAudioClipLoggingItem = (HFItem *)v51;

        v17 = MEMORY[0x1E0C809B0];
      }

      v12 = v67;
    }
    v53 = HFPreferencesBooleanValueForKey();
    -[HUAccessoryDiagnosticsItemManager sourceAccessory](v23, "sourceAccessory");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "supportsCHIP");

    if (v55)
    {
      v56 = objc_alloc(MEMORY[0x1E0D31840]);
      v70[0] = v17;
      v70[1] = 3221225472;
      v70[2] = __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_4;
      v70[3] = &unk_1E6F4C518;
      v57 = (id *)&v71;
      v58 = v23;
      v71 = v58;
      v59 = objc_msgSend(v56, "initWithResultsBlock:", v70);
      v60 = 248;
    }
    else
    {
      if (v53 != 2)
      {
LABEL_28:
        -[HUAccessoryDiagnosticsItemManager _loadDownloadedLogs](v23, "_loadDownloadedLogs");

        goto LABEL_29;
      }
      v61 = objc_alloc(MEMORY[0x1E0D31840]);
      v68[0] = v17;
      v68[1] = 3221225472;
      v68[2] = __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_5;
      v68[3] = &unk_1E6F4C518;
      v57 = (id *)&v69;
      v58 = v23;
      v69 = v58;
      v59 = objc_msgSend(v61, "initWithResultsBlock:", v68);
      v60 = 240;
    }
    v62 = *(Class *)((char *)&v58->super.super.isa + v60);
    *(Class *)((char *)&v58->super.super.isa + v60) = (Class)v59;

    goto LABEL_28;
  }
LABEL_29:

  return v10;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsGenerateButtonTitle"), CFSTR("HUAccessoryDiagnosticsGenerateButtonTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(*(id *)(a1 + 32), "sourceAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedDiagnostics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "supportedTypes") & 1) == 0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "collectionInProgress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("HUAccessoryDiagnosticsInProgress"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E70415F0, CFSTR("instructionsStyle"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsDownloadFailedMessage"), CFSTR("HUAccessoryDiagnosticsDownloadFailedMessage"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "collectionFailed") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_26(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB99F8]);

  return v3;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_2_107(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = a2;
  objc_msgSend(v2, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30550]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "integerValue") & 2) == 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D70]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsLoggingOptionVerboseLabel"), CFSTR("HUAccessoryDiagnosticsLoggingOptionVerboseLabel"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "integerValue") & 2) != 0)
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30E20]);

  return v4;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30550]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "integerValue") & 1) == 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D70]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsLoggingOptionIncludeAudioClipsLabel"), CFSTR("HUAccessoryDiagnosticsLoggingOptionIncludeAudioClipsLabel"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "integerValue") & 1) != 0)
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30E20]);

  return v3;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsFetchMatterSnapshotButtonTitle"), CFSTR("HUAccessoryDiagnosticsFetchMatterSnapshotButtonTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30D70]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "collectionInProgress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("HUAccessoryDiagnosticsInProgress"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsFetchADKSnapshotButtonTitle"), CFSTR("HUAccessoryDiagnosticsFetchADKSnapshotButtonTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(*(id *)(a1 + 32), "sourceAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedDiagnostics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "supportedTypes") & 2) == 0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "collectionInProgress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("HUAccessoryDiagnosticsInProgress"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HUAccessoryDiagnosticsItemProvider *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsItemManager fetchManufacturerSnapshotButtonItem](self, "fetchManufacturerSnapshotButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v5);

  -[HUAccessoryDiagnosticsItemManager logCollectionFailedItem](self, "logCollectionFailedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v6);

  -[HUAccessoryDiagnosticsItemManager fetchADKSnapshotButtonItem](self, "fetchADKSnapshotButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v7);

  -[HUAccessoryDiagnosticsItemManager fetchMatterSnapshotButtonItem](self, "fetchMatterSnapshotButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v8);

  -[HUAccessoryDiagnosticsItemManager diagnosticsModesItem](self, "diagnosticsModesItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v9);

  -[HUAccessoryDiagnosticsItemManager enableVerboseLoggingItem](self, "enableVerboseLoggingItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v10);

  -[HUAccessoryDiagnosticsItemManager enableAudioClipLoggingItem](self, "enableAudioClipLoggingItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v4);
  v16[0] = v12;
  v13 = -[HUAccessoryDiagnosticsItemProvider initWithItemManager:]([HUAccessoryDiagnosticsItemProvider alloc], "initWithItemManager:", self);
  v16[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  _QWORD v36[4];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v35 = a3;
  objc_msgSend(v35, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HUAccessoryDiagnosticsItemManager fetchManufacturerSnapshotButtonItem](self, "fetchManufacturerSnapshotButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v8);

  -[HUAccessoryDiagnosticsItemManager logCollectionFailedItem](self, "logCollectionFailedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v9);

  -[HUAccessoryDiagnosticsItemManager enableVerboseLoggingItem](self, "enableVerboseLoggingItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v10);

  -[HUAccessoryDiagnosticsItemManager enableAudioClipLoggingItem](self, "enableAudioClipLoggingItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v11);

  -[HUAccessoryDiagnosticsItemManager fetchADKSnapshotButtonItem](self, "fetchADKSnapshotButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v12);

  -[HUAccessoryDiagnosticsItemManager fetchMatterSnapshotButtonItem](self, "fetchMatterSnapshotButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v13);

  objc_msgSend(v6, "removeObjectsInArray:", v7);
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortUsingComparator:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("Logs"));
  objc_msgSend(v15, "setItems:", v6);
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryAvailableDiagnosticForShareFooter"), CFSTR("HUAccessoryAvailableDiagnosticForShareFooter"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFooterTitle:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("GenerateButton"));
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HUAccessoryDiagnosticsItemManager fetchManufacturerSnapshotButtonItem](self, "fetchManufacturerSnapshotButtonItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_safeAddObject:", v19);

  -[HUAccessoryDiagnosticsItemManager fetchADKSnapshotButtonItem](self, "fetchADKSnapshotButtonItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_safeAddObject:", v20);

  -[HUAccessoryDiagnosticsItemManager fetchMatterSnapshotButtonItem](self, "fetchMatterSnapshotButtonItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_safeAddObject:", v21);

  objc_msgSend(v17, "setItems:", v18);
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsGenerateButtonFooter"), CFSTR("HUAccessoryDiagnosticsGenerateButtonFooter"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFooterTitle:", v22);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("CollectionFailed"));
  -[HUAccessoryDiagnosticsItemManager logCollectionFailedItem](self, "logCollectionFailedItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setItems:", v25);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("LoggingOptions"));
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsInternalSettingsHeader"), CFSTR("HUAccessoryDiagnosticsInternalSettingsHeader"), 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHeaderTitle:", v27);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsInternalSettingsFooter"), CFSTR("HUAccessoryDiagnosticsInternalSettingsFooter"), 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFooterTitle:", v28);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDiagnosticsItemManager enableVerboseLoggingItem](self, "enableVerboseLoggingItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "na_safeAddObject:", v30);

    -[HUAccessoryDiagnosticsItemManager enableAudioClipLoggingItem](self, "enableAudioClipLoggingItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "na_safeAddObject:", v31);

    objc_msgSend(v26, "setItems:", v29);
  }
  v36[0] = v15;
  v36[1] = v17;
  v36[2] = v23;
  v36[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v32, v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAccessoryDiagnosticsItemManager;
  -[HFItemManager _registerForExternalUpdates](&v5, sel__registerForExternalUpdates);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didChangeNotification_, CFSTR("HUAccessoryDiagnosticsDidChange"), v4);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAccessoryDiagnosticsItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v5, sel__unregisterForExternalUpdates);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("HUAccessoryDiagnosticsDidChange"), v4);

}

- (void)didChangeNotification:(id)a3
{
  id v5;

  -[HUAccessoryDiagnosticsItemManager _loadDownloadedLogs](self, "_loadDownloadedLogs", a3);
  v5 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
}

- (BOOL)collectionInProgress
{
  void *v2;
  void *v3;

  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v2, "hu_diagnosticLogsInProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (void)setCollectionInProgress:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id object;

  v3 = a3;
  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  object = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(object, "hu_diagnosticLogsInProgress", v4, (void *)0x301);

}

- (BOOL)collectionFailed
{
  void *v2;
  void *v3;

  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v2, "hu_diagnosticLogsLastDownloadFailed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (void)setCollectionFailed:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id object;

  v3 = a3;
  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  object = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(object, "hu_diagnosticLogsLastDownloadFailed", v4, (void *)0x301);

}

- (void)beginDiagnosticCollection:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v15;
  uint8_t buf[16];

  v5 = a3;
  -[HUAccessoryDiagnosticsItemManager fetchManufacturerSnapshotButtonItem](self, "fetchManufacturerSnapshotButtonItem");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if ((id)v6 == v5)
    goto LABEL_6;
  v8 = (void *)v6;
  -[HUAccessoryDiagnosticsItemManager fetchADKSnapshotButtonItem](self, "fetchADKSnapshotButtonItem");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v5)
  {

    v7 = v8;
LABEL_6:

    goto LABEL_7;
  }
  v10 = (void *)v9;
  -[HUAccessoryDiagnosticsItemManager fetchMatterSnapshotButtonItem](self, "fetchMatterSnapshotButtonItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v5)
  {
    NSStringFromSelector(a2);
    v12 = objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ called with unexpected item: %@"), v12, v5);
LABEL_10:

    goto LABEL_14;
  }
LABEL_7:
  if (-[HUAccessoryDiagnosticsItemManager collectionInProgress](self, "collectionInProgress"))
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring request to begin diagnostic collection because a collection is already in progress", buf, 2u);
    }
    goto LABEL_10;
  }
  -[HUAccessoryDiagnosticsItemManager setCollectionInProgress:](self, "setCollectionInProgress:", 1);
  v13 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsCHIP");

  if (v15)
    -[HUAccessoryDiagnosticsItemManager _beginMatterDiagnosticCollection](self, "_beginMatterDiagnosticCollection");
  else
    -[HUAccessoryDiagnosticsItemManager _beginHAPDiagnosticCollection:](self, "_beginHAPDiagnosticCollection:", v5);
LABEL_14:

}

- (void)_beginHAPDiagnosticCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUAccessoryDiagnosticsItemManager fetchADKSnapshotButtonItem](self, "fetchADKSnapshotButtonItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA238]), "initWithLogSizeBytes:delaySeconds:snapshotType:recordAudio:enableAudioClips:cloudkitMetadataRequired:", 0, 0, 2, 0, 0, 0);
  else
    v6 = 0;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Starting diagnostic collection with options %@", buf, 0xCu);
  }

  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HUAccessoryDiagnosticsItemManager__beginHAPDiagnosticCollection___block_invoke;
  v9[3] = &unk_1E6F5B928;
  v9[4] = self;
  objc_msgSend(v8, "initiateDiagnosticsTransferWithOptions:completionHandler:", v6, v9);

}

void __67__HUAccessoryDiagnosticsItemManager__beginHAPDiagnosticCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Diagnostic collection completed with error: %@\n %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setCollectionInProgress:", 0);
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v8, "setCollectionFailed:", 1);
  }
  else
  {
    objc_msgSend(v8, "setCollectionFailed:", 0);
    objc_msgSend(*(id *)(a1 + 32), "recordDownloadedLog:", v6);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("HUAccessoryDiagnosticsDidChange"), v10);

}

- (void)_beginMatterDiagnosticCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  NSObject *v25;
  _QWORD v26[5];
  id v27;
  NSObject *v28;
  _QWORD block[5];
  id v30;
  NSObject *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HUAccessoryDiagnosticsItemManager setCollectionInProgress:](self, "setCollectionInProgress:", 1);
  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CC1B18];
  objc_msgSend(v4, "matterControllerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matterControllerXPCConnectBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedControllerWithID:xpcConnectBlock:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = dispatch_queue_create("com.apple.Home.MatterLogsQueue", 0);
  v10 = (void *)MEMORY[0x1E0CC1B10];
  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "matterNodeID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceWithNodeID:controller:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[HUAccessoryDiagnosticsItemManager _beginMatterDiagnosticCollection]";
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%s: device: %@", buf, 0x16u);
  }

  v15 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke;
  block[3] = &unk_1E6F4E020;
  block[4] = self;
  v16 = v13;
  v30 = v16;
  v17 = v9;
  v31 = v17;
  dispatch_async(v17, block);
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke_2;
  v26[3] = &unk_1E6F4E020;
  v26[4] = self;
  v18 = v16;
  v27 = v18;
  v19 = v17;
  v28 = v19;
  dispatch_async(v19, v26);
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke_3;
  v23[3] = &unk_1E6F4E020;
  v23[4] = self;
  v24 = v18;
  v25 = v19;
  v20 = v19;
  v21 = v18;
  dispatch_async(v20, v23);
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke_4;
  v22[3] = &unk_1E6F4D988;
  v22[4] = self;
  dispatch_async(v20, v22);

}

uint64_t __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginMatterDiagnosticCollectionForDevice:type:dispatchQueue:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

uint64_t __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HUAccessoryDiagnosticsDidChange"), v3);

  return objc_msgSend(*(id *)(a1 + 32), "_beginMatterDiagnosticCollectionForDevice:type:dispatchQueue:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HUAccessoryDiagnosticsDidChange"), v3);

  return objc_msgSend(*(id *)(a1 + 32), "_beginMatterDiagnosticCollectionForDevice:type:dispatchQueue:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

void __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setCollectionInProgress:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("HUAccessoryDiagnosticsDidChange"), v2);

}

- (void)_beginMatterDiagnosticCollectionForDevice:(id)a3 type:(int64_t)a4 dispatchQueue:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  int64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v12 = a4;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "collecting logs of type: %ld for device: %@", buf, 0x16u);
  }

  dispatch_get_global_queue(2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollectionForDevice_type_dispatchQueue___block_invoke;
  v10[3] = &unk_1E6F5B950;
  v10[4] = self;
  v10[5] = a4;
  objc_msgSend(v7, "downloadLogOfType:timeout:queue:completion:", a4, v9, v10, 600.0);

}

void __98__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollectionForDevice_type_dispatchQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCollectionFailed:", 1);
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v12 = 134218242;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "error collecting logs of type: %ld error: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  if (v5)
  {
    v9 = objc_alloc(MEMORY[0x1E0CBA230]);
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithSnapshotPath:urlParameters:privacyPolicyURL:uploadDestination:consentVersion:uploadType:", v10, 0, 0, 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "recordDownloadedLog:", v11);
  }

}

- (void)_loadDownloadedLogs
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableArray *downloadedLogs;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v2, "hu_diagnosticLogs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Loading diagnostic logs: %@.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "snapshotPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

        if (v14)
        {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }
        else
        {
          HFLogForCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v12;
            _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Removing diagnostic log because it no longer exists: %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v16 = objc_msgSend(v6, "count");
  if (v16 != -[NSMutableArray count](v5, "count"))
  {
    v17 = (void *)-[NSMutableArray copy](v5, "copy");
    -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v18, "hu_diagnosticLogs", v17, (void *)0x301);

  }
  downloadedLogs = self->_downloadedLogs;
  self->_downloadedLogs = v5;

}

- (void)recordDownloadedLog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id value;

  v4 = a3;
  -[HUAccessoryDiagnosticsItemManager downloadedLogs](self, "downloadedLogs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[HUAccessoryDiagnosticsItemManager downloadedLogs](self, "downloadedLogs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  value = (id)objc_msgSend(v6, "copy");

  -[HUAccessoryDiagnosticsItemManager sourceAccessory](self, "sourceAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v7, "hu_diagnosticLogs", value, (void *)0x301);

}

- (id)availableLogs
{
  void *v2;
  void *v3;

  -[HUAccessoryDiagnosticsItemManager downloadedLogs](self, "downloadedLogs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)_setLoggingOption:(int64_t)a3 enable:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  int64_t v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  -[HUAccessoryDiagnosticsItemManager diagnosticsModesItem](self, "diagnosticsModesItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  if (((a3 & ~v10) == 0) != v4)
  {
    if (v4)
      v11 = v10 | a3;
    else
      v11 = v10 & ~a3;
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v11;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to write accessory diagnostic options: %lx", (uint8_t *)&v16, 0xCu);
    }

    -[HUAccessoryDiagnosticsItemManager diagnosticsModesItem](self, "diagnosticsModesItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "writeValue:", v14);

  }
}

- (void)setVerboseLoggingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to set accessory diagnostic verbose logging to: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  -[HUAccessoryDiagnosticsItemManager _setLoggingOption:enable:](self, "_setLoggingOption:enable:", 2, v3);
}

- (void)setAudioClipLoggingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to set accessory diagnostic audio clip logging to: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  -[HUAccessoryDiagnosticsItemManager _setLoggingOption:enable:](self, "_setLoggingOption:enable:", 1, v3);
}

- (HFStaticItem)fetchManufacturerSnapshotButtonItem
{
  return self->_fetchManufacturerSnapshotButtonItem;
}

- (HFStaticItem)fetchADKSnapshotButtonItem
{
  return self->_fetchADKSnapshotButtonItem;
}

- (HFStaticItem)fetchMatterSnapshotButtonItem
{
  return self->_fetchMatterSnapshotButtonItem;
}

- (HFStaticItem)logCollectionFailedItem
{
  return self->_logCollectionFailedItem;
}

- (HFItem)enableVerboseLoggingItem
{
  return self->_enableVerboseLoggingItem;
}

- (HFItem)enableAudioClipLoggingItem
{
  return self->_enableAudioClipLoggingItem;
}

- (HMAccessory)sourceAccessory
{
  return self->_sourceAccessory;
}

- (NSMutableArray)downloadedLogs
{
  return self->_downloadedLogs;
}

- (void)setDownloadedLogs:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedLogs, a3);
}

- (HFAccessoryDiagnosticsControlItem)diagnosticsModesItem
{
  return self->_diagnosticsModesItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsModesItem, 0);
  objc_storeStrong((id *)&self->_downloadedLogs, 0);
  objc_storeStrong((id *)&self->_sourceAccessory, 0);
  objc_storeStrong((id *)&self->_enableAudioClipLoggingItem, 0);
  objc_storeStrong((id *)&self->_enableVerboseLoggingItem, 0);
  objc_storeStrong((id *)&self->_logCollectionFailedItem, 0);
  objc_storeStrong((id *)&self->_fetchMatterSnapshotButtonItem, 0);
  objc_storeStrong((id *)&self->_fetchADKSnapshotButtonItem, 0);
  objc_storeStrong((id *)&self->_fetchManufacturerSnapshotButtonItem, 0);
}

@end
