@implementation HUSceneActionEditorItemManager

- (HUSceneActionEditorItemManager)initWithActionSetBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v9;
  HUSceneActionEditorItemManager *v10;
  HUSceneActionEditorItemManager *v11;
  uint64_t v12;
  NSMutableDictionary *actionGridItemsByEditorType;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUSceneActionEditorItemManager;
  v10 = -[HFItemManager initWithDelegate:](&v15, sel_initWithDelegate_, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_actionSetBuilder, a3);
    v11->_mode = a4;
    v12 = objc_opt_new();
    actionGridItemsByEditorType = v11->_actionGridItemsByEditorType;
    v11->_actionGridItemsByEditorType = (NSMutableDictionary *)v12;

  }
  return v11;
}

+ (unint64_t)actionGridEditorTypeForSectionIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(&unk_1E7042C90, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(&unk_1E7042C90);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "sectionIdentifierForActionGridEditorType:", objc_msgSend(v10, "unsignedIntegerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v5, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v14 = objc_msgSend(v10, "unsignedIntegerValue");
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(&unk_1E7042C90, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HUSceneActionEditorItemManager.m"), 67, CFSTR("Unexpected section ID %@ for %s!"), v5, "+[HUSceneActionEditorItemManager actionGridEditorTypeForSectionIdentifier:]");

  v14 = 0;
LABEL_11:

  return v14;
}

+ (id)sectionIdentifierForActionGridEditorType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("AllAccessories");
  if (a3 == 2)
    v3 = CFSTR("OtherAccessories");
  if (a3 == 1)
    return CFSTR("PrioritizedAccessories");
  else
    return (id)v3;
}

+ (id)allActionGridEditorSectionIdentifiers
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_MergedGlobals_3_4 != -1)
    dispatch_once(&_MergedGlobals_3_4, block);
  return (id)qword_1EF226A30;
}

void __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifierForActionGridEditorType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifierForActionGridEditorType:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifierForActionGridEditorType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1EF226A30;
  qword_1EF226A30 = v7;

}

- (NSSet)actionGridItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUSceneActionEditorItemManager actionGridItemsByEditorType](self, "actionGridItemsByEditorType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSSet)itemsToHideWhenEmpty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneActionEditorItemManager actionGridItems](self, "actionGridItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[HUSceneActionEditorItemManager testSceneItem](self, "testSceneItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  -[HUSceneActionEditorItemManager showInHomeDashboardItem](self, "showInHomeDashboardItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v6);

  -[HUSceneActionEditorItemManager mediaItem](self, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v7);

  return (NSSet *)v3;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HUIncludedContextItem *v33;
  void *v34;
  void *v35;
  HUIncludedContextItem *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[5];
  _QWORD v67[4];
  id v68;
  void *v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[4];

  v75[2] = *MEMORY[0x1E0C80C00];
  v63 = a3;
  -[HUSceneActionEditorItemManager actionSetBuilder](self, "actionSetBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUSceneActionEditorItemManager mode](self, "mode") == 1
    || -[HUSceneActionEditorItemManager mode](self, "mode") == 2)
  {
    -[HFItemManager home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_filter:", &__block_literal_global_100);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = v8 < 8;
  }
  else
  {
    -[HUSceneActionEditorItemManager actionSetBuilder](self, "actionSetBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "hf_hasSetForContextType:", 0) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      -[HUSceneActionEditorItemManager actionSetBuilder](self, "actionSetBuilder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "actionSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "hf_hasSetShowInHomeDashboard") ^ 1;

    }
    -[HUSceneActionEditorItemManager actionSetBuilder](self, "actionSetBuilder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v15, "showInHomeDashboard") | v12;

  }
  -[HUSceneActionEditorItemManager actionSetBuilder](self, "actionSetBuilder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShowInHomeDashboard:", v9);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v60 = objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D31840]);
  v18 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_2;
  v67[3] = &unk_1E6F4C518;
  v62 = v4;
  v68 = v62;
  v19 = (void *)objc_msgSend(v17, "initWithResultsBlock:", v67);
  -[HUSceneActionEditorItemManager setNameAndIconItem:](self, "setNameAndIconItem:", v19);

  -[HUSceneActionEditorItemManager _createItemsForActionGridEditorType:home:](self, "_createItemsForActionGridEditorType:home:", 0, v63);
  -[HUSceneActionEditorItemManager _createItemsForActionGridEditorType:home:](self, "_createItemsForActionGridEditorType:home:", 1, v63);
  -[HUSceneActionEditorItemManager _createItemsForActionGridEditorType:home:](self, "_createItemsForActionGridEditorType:home:", 2, v63);
  v20 = -[HUSceneActionEditorItemManager mode](self, "mode")
     && -[HUSceneActionEditorItemManager mode](self, "mode") != 1
     && -[HUSceneActionEditorItemManager mode](self, "mode") != 2
     && -[HUSceneActionEditorItemManager mode](self, "mode") != 3;
  v66[0] = v18;
  v66[1] = 3221225472;
  v66[2] = __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_37;
  v66[3] = &unk_1E6F504A0;
  v66[4] = self;
  __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_37((uint64_t)v66);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0D31840]);
  v24 = *MEMORY[0x1E0D30D70];
  v74[0] = *MEMORY[0x1E0D30D18];
  v23 = v74[0];
  v74[1] = v24;
  v75[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v22, "initWithResults:", v26);
  -[HUSceneActionEditorItemManager setChangeServicesItem:](self, "setChangeServicesItem:", v27);

  v28 = objc_alloc(MEMORY[0x1E0D31840]);
  v72[0] = v23;
  _HULocalizedStringWithDefaultValue(CFSTR("HUSceneActionEditorTestSceneButtonTitle"), CFSTR("HUSceneActionEditorTestSceneButtonTitle"), 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v24;
  v73[0] = v29;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v28, "initWithResults:", v31);
  -[HUSceneActionEditorItemManager setTestSceneItem:](self, "setTestSceneItem:", v32);

  v33 = [HUIncludedContextItem alloc];
  -[HUSceneActionEditorItemManager actionSetBuilder](self, "actionSetBuilder");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "actionSet");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[HUIncludedContextItem initWithHomeKitObject:contextType:home:](v33, "initWithHomeKitObject:contextType:home:", v35, 3, v63);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIncludedContextItem setOverrideHiddenState:](v36, "setOverrideHiddenState:", v37);

  if (-[HUSceneActionEditorItemManager mode](self, "mode") == 1
    || -[HUSceneActionEditorItemManager mode](self, "mode") == 2)
  {
    -[HUSceneActionEditorItemManager actionSetBuilder](self, "actionSetBuilder", v60);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "showInHomeDashboard"))
      v39 = &unk_1E7040E58;
    else
      v39 = &unk_1E7040E70;
    -[HUIncludedContextItem setOverridePrimaryState:](v36, "setOverridePrimaryState:", v39);

  }
  -[HUSceneActionEditorItemManager setShowInHomeDashboardItem:](self, "setShowInHomeDashboardItem:", v36, v60);
  v40 = -[HUSceneActionEditorItemManager mode](self, "mode") != 0;
  v41 = objc_alloc(MEMORY[0x1E0D31840]);
  v70[0] = v23;
  _HULocalizedStringWithDefaultValue(CFSTR("HUSceneActionEditorDeleteSceneButtonTitle"), CFSTR("HUSceneActionEditorDeleteSceneButtonTitle"), 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v24;
  v71[0] = v42;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v41, "initWithResults:", v44);
  -[HUSceneActionEditorItemManager setDeleteSceneItem:](self, "setDeleteSceneItem:", v45);

  v46 = objc_alloc(MEMORY[0x1E0D31840]);
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_53;
  v64[3] = &unk_1E6F4C518;
  v65 = v62;
  v47 = v62;
  v48 = (void *)objc_msgSend(v46, "initWithResultsBlock:", v64);
  -[HUSceneActionEditorItemManager setMediaItem:](self, "setMediaItem:", v48);

  -[HUSceneActionEditorItemManager actionGridItemsByEditorType](self, "actionGridItemsByEditorType");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "allValues");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addObjectsFromArray:", v50);

  -[HUSceneActionEditorItemManager nameAndIconItem](self, "nameAndIconItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "na_safeAddObject:", v51);

  -[HUSceneActionEditorItemManager mediaItem](self, "mediaItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "na_safeAddObject:", v52);

  -[HUSceneActionEditorItemManager changeServicesItem](self, "changeServicesItem");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "na_safeAddObject:", v53);

  -[HUSceneActionEditorItemManager testSceneItem](self, "testSceneItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "na_safeAddObject:", v54);

  -[HUSceneActionEditorItemManager showInHomeDashboardItem](self, "showInHomeDashboardItem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "na_safeAddObject:", v55);

  -[HUSceneActionEditorItemManager deleteSceneItem](self, "deleteSceneItem");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "na_safeAddObject:", v56);

  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v61);
  v69 = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  return v58;
}

BOOL __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_isAnonymous") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "count") != 0;

  }
  return v3;
}

id __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6 && objc_msgSend(v6, "isSystemImage"))
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB5B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageSymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "configurationByApplyingConfiguration:", v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    v11 = objc_alloc(MEMORY[0x1E0D31460]);
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithSystemImageNamed:configuration:", v12, v7);

    v4 = (id)v13;
  }
  if (v4)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30C60]);
  }
  else
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = 138412290;
      v20 = v18;
      _os_log_error_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_ERROR, "Encountered a unexpected nil value for actionSetBuilder.iconDescriptor: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "iconTintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30D10]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_37(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "actionSetBuilder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    v4 = CFSTR("HUSceneActionEditorChangeServicesButtonTitle");
  else
    v4 = CFSTR("HUSceneActionEditorAddFirstServiceButtonTitle");
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_53(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSceneActionEditorMediaButtonTitle"), CFSTR("HUSceneActionEditorMediaButtonTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(*(id *)(a1 + 32), "mediaAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30BF8]);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "mediaAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", v7 == 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HUSceneActionEditorItemManager *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
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
  _QWORD v36[5];
  void *v37;
  _QWORD v38[3];
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSceneActionEditorNameSectionIdentifier"));
  -[HUSceneActionEditorItemManager nameAndIconItem](self, "nameAndIconItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v7);

  objc_msgSend(v4, "addObject:", v5);
  -[HUSceneActionEditorItemManager prioritizedAccessories](self, "prioritizedAccessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = self;
  if (v9)
  {
    -[HUSceneActionEditorItemManager _buildSectionForActionGridEditorType:](self, "_buildSectionForActionGridEditorType:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

    -[HUSceneActionEditorItemManager actionSetBuilder](self, "actionSetBuilder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v36[3] = &unk_1E6F4EFD8;
    v36[4] = self;
    v14 = objc_msgSend(v13, "na_any:", v36);

    if (!v14)
      goto LABEL_6;
    v10 = self;
    v15 = 2;
  }
  else
  {
    v15 = 0;
  }
  -[HUSceneActionEditorItemManager _buildSectionForActionGridEditorType:](v10, "_buildSectionForActionGridEditorType:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

LABEL_6:
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSceneActionEditorMediaSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUSceneActionEditorMediaInstructionsTitle"), CFSTR("HUSceneActionEditorMediaInstructionsTitle"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHeaderTitle:", v18);

  -[HFItemManager home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hf_currentUserIsAdministrator");

  if (v20)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSceneActionEditorMediaInstructionsDescription"), CFSTR("HUSceneActionEditorMediaInstructionsDescription"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHeaderSecondaryText:", v21);

  }
  -[HUSceneActionEditorItemManager mediaItem](self, "mediaItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setItems:", v23);

  objc_msgSend(v4, "addObject:", v17);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSceneActionEditorSettingsSectionIdentifier"));
  -[HUSceneActionEditorItemManager testSceneItem](self, "testSceneItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v25;
  -[HUSceneActionEditorItemManager changeServicesItem](self, "changeServicesItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v26;
  -[HUSceneActionEditorItemManager showInHomeDashboardItem](self, "showInHomeDashboardItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setItems:", v28);

  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsShowInHomeDashboardFooterTitle"), CFSTR("HUServiceDetailsShowInHomeDashboardFooterTitle"), 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFooterTitle:", v29);

  objc_msgSend(v4, "addObject:", v24);
  if (!-[HUSceneActionEditorItemManager mode](self, "mode")
    || -[HUSceneActionEditorItemManager mode](self, "mode") == 3)
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSceneActionEditorDeleteSectionIdentifier"));
    -[HUSceneActionEditorItemManager deleteSceneItem](self, "deleteSceneItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setItems:", v32);

    objc_msgSend(v4, "addObject:", v30);
  }
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v4, v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

uint64_t __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "prioritizedAccessories");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
    v16[3] = &unk_1E6F4F000;
    v17 = v6;
    v8 = objc_msgSend(v7, "na_any:", v16);
    v9 = v17;
  }
  else
  {
    objc_opt_class();
    v7 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v7;
    else
      v10 = 0;
    v11 = v10;

    if (!v11)
    {
      v7 = 0;
      v12 = 1;
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 32), "prioritizedAccessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
    v14[3] = &unk_1E6F4F000;
    v15 = v11;
    v8 = objc_msgSend(v9, "na_any:", v14);

  }
  v12 = v8 ^ 1u;

LABEL_12:
  return v12;
}

uint64_t __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "hf_containedCharacteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

uint64_t __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mediaProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_flatMap:", &__block_literal_global_63_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "hf_containedProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "intersectsSet:", v5);
  return v7;
}

uint64_t __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfiles");
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUSceneActionEditorItemManager;
  -[HFItemManager _itemsToHideInSet:](&v13, sel__itemsToHideInSet_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HUSceneActionEditorItemManager actionSetBuilder](self, "actionSetBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    -[HUSceneActionEditorItemManager itemsToHideWhenEmpty](self, "itemsToHideWhenEmpty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "intersectSet:", v4);
    objc_msgSend(v6, "unionSet:", v11);

  }
  return v6;
}

- (id)_buildSectionForActionGridEditorType:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0D31570]);
  objc_msgSend((id)objc_opt_class(), "sectionIdentifierForActionGridEditorType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:", v6);

  if (a3 == 2)
  {
    v8 = CFSTR("HUSceneActionEditorAccessoriesInstructionsTitleOtherServices");
  }
  else if (a3 == 1)
  {
    v8 = CFSTR("HUSceneActionEditorAccessoriesInstructionsTitleThisService");
  }
  else
  {
    if (a3)
    {
      v9 = 0;
      goto LABEL_9;
    }
    v8 = CFSTR("HUSceneActionEditorAccessoriesInstructionsTitleAllServices");
  }
  _HULocalizedStringWithDefaultValue(v8, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(v7, "setHeaderTitle:", v9);
  -[HUSceneActionEditorItemManager actionGridItemsByEditorType](self, "actionGridItemsByEditorType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v13);

  return v7;
}

- (void)_createItemsForActionGridEditorType:(unint64_t)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = objc_alloc(MEMORY[0x1E0D31840]);
  v9 = (id)objc_msgSend(v6, "initWithResults:", MEMORY[0x1E0C9AA70]);
  -[HUSceneActionEditorItemManager actionGridItemsByEditorType](self, "actionGridItemsByEditorType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

}

- (HFActionSetBuilder)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (void)setActionSetBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetBuilder, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSSet)prioritizedAccessories
{
  return self->_prioritizedAccessories;
}

- (void)setPrioritizedAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (HFStaticItem)nameAndIconItem
{
  return self->_nameAndIconItem;
}

- (void)setNameAndIconItem:(id)a3
{
  objc_storeStrong((id *)&self->_nameAndIconItem, a3);
}

- (NSSet)instructionsItems
{
  return self->_instructionsItems;
}

- (HFStaticItem)mediaInstructionsItem
{
  return self->_mediaInstructionsItem;
}

- (HFStaticItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (HFStaticItem)changeServicesItem
{
  return self->_changeServicesItem;
}

- (void)setChangeServicesItem:(id)a3
{
  objc_storeStrong((id *)&self->_changeServicesItem, a3);
}

- (HFStaticItem)testSceneItem
{
  return self->_testSceneItem;
}

- (void)setTestSceneItem:(id)a3
{
  objc_storeStrong((id *)&self->_testSceneItem, a3);
}

- (HFItem)showInHomeDashboardItem
{
  return self->_showInHomeDashboardItem;
}

- (void)setShowInHomeDashboardItem:(id)a3
{
  objc_storeStrong((id *)&self->_showInHomeDashboardItem, a3);
}

- (HFStaticItem)deleteSceneItem
{
  return self->_deleteSceneItem;
}

- (void)setDeleteSceneItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteSceneItem, a3);
}

- (NSMutableDictionary)actionGridItemsByEditorType
{
  return self->_actionGridItemsByEditorType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGridItemsByEditorType, 0);
  objc_storeStrong((id *)&self->_deleteSceneItem, 0);
  objc_storeStrong((id *)&self->_showInHomeDashboardItem, 0);
  objc_storeStrong((id *)&self->_testSceneItem, 0);
  objc_storeStrong((id *)&self->_changeServicesItem, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_mediaInstructionsItem, 0);
  objc_storeStrong((id *)&self->_instructionsItems, 0);
  objc_storeStrong((id *)&self->_nameAndIconItem, 0);
  objc_storeStrong((id *)&self->_prioritizedAccessories, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);
}

@end
