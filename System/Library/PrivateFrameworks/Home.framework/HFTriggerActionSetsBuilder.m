@implementation HFTriggerActionSetsBuilder

- (id)_generateSummaryInformation
{
  if (-[HFTriggerActionSetsBuilder isShortcutOwned](self, "isShortcutOwned"))
    -[HFTriggerActionSetsBuilder _generateSummaryInformationForShortcutOwnedTrigger](self, "_generateSummaryInformationForShortcutOwnedTrigger");
  else
    -[HFTriggerActionSetsBuilder _generateSummaryInformationForStandardTrigger](self, "_generateSummaryInformationForStandardTrigger");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_generateSummaryInformationForShortcutOwnedTrigger
{
  void *v3;
  HFTriggerActionsSetsUISummary *v4;
  void *v5;
  void *v6;
  HFTriggerActionsSetsUISummary *v7;

  -[HFTriggerActionSetsBuilder homeWorkflow](self, "homeWorkflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [HFTriggerActionsSetsUISummary alloc];
    objc_msgSend(v3, "summaryString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "summaryIconDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HFTriggerActionsSetsUISummary initWithSummaryText:summaryIconDescriptors:](v4, "initWithSummaryText:summaryIconDescriptors:", v5, v6);

  }
  else
  {
    -[HFTriggerActionSetsBuilder _generateSummaryInformationForStandardTrigger](self, "_generateSummaryInformationForStandardTrigger");
    v7 = (HFTriggerActionsSetsUISummary *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_generateSummaryInformationForStandardTrigger
{
  HFTriggerActionsSetsUISummary *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(HFTriggerActionsSetsUISummary);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFTriggerActionsSetsUISummary addSceneNamed:](v3, "addSceneNamed:", v10);

        objc_msgSend(v9, "actionSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hf_iconDescriptor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          -[HFTriggerActionsSetsUISummary addIconDescriptor:](v3, "addIconDescriptor:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v6);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[HFTriggerActionSetsBuilder _generateStandaloneServices:andMediaAccessories:](self, "_generateStandaloneServices:andMediaAccessories:", v13, v14);
  -[HFTriggerActionSetsBuilder _uniqueServiceGroupForServices:](self, "_uniqueServiceGroupForServices:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerActionsSetsUISummary setUniqueServiceGroupName:](v3, "setUniqueServiceGroupName:", v17);

  }
  v36 = v16;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFTriggerActionsSetsUISummary addServiceNamed:](v3, "addServiceNamed:", v24);

        objc_msgSend(v23, "hf_iconDescriptor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFTriggerActionsSetsUISummary addIconDescriptor:](v3, "addIconDescriptor:", v25);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v20);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v26 = v14;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
        objc_msgSend(v31, "hf_serviceNameComponents");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "composedString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFTriggerActionsSetsUISummary addMediaAccessoryNamed:](v3, "addMediaAccessoryNamed:", v33);

        +[HFMediaHelper mediaIconDescriptorForMediaContainer:](HFMediaHelper, "mediaIconDescriptorForMediaContainer:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFTriggerActionsSetsUISummary addIconDescriptor:](v3, "addIconDescriptor:", v34);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v28);
  }

  return v3;
}

- (void)_generateStandaloneServices:(id)a3 andMediaAccessories:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "getOrCreateAction");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_opt_class();
          v15 = v14;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
          v17 = v16;

          if (v17)
          {
            objc_msgSend(v17, "characteristic");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "service");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              objc_msgSend(v17, "characteristic");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog(CFSTR("Unexpectedly got nil service from HMCharacteristicWriteAction: %@, characteristic: %@"), v17, v20);

            }
            objc_msgSend(v6, "na_safeAddObject:", v19);
          }
          else
          {
            objc_opt_class();
            objc_msgSend(v13, "action");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v21 = v19;
            else
              v21 = 0;
            v22 = v21;

            if (v22)
            {
              -[HFTriggerActionSetsBuilder mediaAccessoriesForPlaybackAction:](self, "mediaAccessoriesForPlaybackAction:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "unionSet:", v23);

            }
            else
            {
              v19 = 0;
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

}

- (id)_uniqueServiceGroupForServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "hf_isSupported"))
        {
          v14 = objc_alloc(MEMORY[0x1E0C99E60]);
          objc_msgSend(v13, "services");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithArray:", v15);

          if (objc_msgSend(v16, "intersectsSet:", v4))
          {
            if (v10 || !objc_msgSend(v16, "isEqualToSet:", v4))
            {

              v17 = 0;
              goto LABEL_18;
            }
            v10 = v13;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }

  v10 = v10;
  v17 = v10;
LABEL_18:

  return v17;
}

- (id)mediaAccessoriesForPlaybackAction:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a3, "mediaProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke;
  v7[3] = &unk_1EA72E358;
  v7[4] = self;
  objc_msgSend(v4, "na_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "anonymousActionSetBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaSystems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke_2;
  v12[3] = &unk_1EA72CE40;
  v13 = v3;
  v7 = v3;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = v7;
  v10 = v9;

  return v10;
}

uint64_t __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke_3;
  v6[3] = &unk_1EA727840;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_mediaRouteIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_mediaRouteIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (void)updateActionSetsInTriggerBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HFTriggerActionSetsBuilder namedActionSetsDiff](self, "namedActionSetsDiff");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_78);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setActionSets:", v10);
  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerOwnedActionSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updateActionsInBuilder:", v9);
}

uint64_t __83__HFTriggerActionSetsBuilder_AutomationBuilders__updateActionSetsInTriggerBuilder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionSet");
}

- (HFTriggerActionSetsBuilder)initWithActionSets:(id)a3 inHome:(id)a4
{
  return -[HFTriggerActionSetsBuilder initWithActionSets:inHome:filterEmptyActionSets:](self, "initWithActionSets:inHome:filterEmptyActionSets:", a3, a4, 0);
}

- (HFTriggerActionSetsBuilder)initWithActionSets:(id)a3 inHome:(id)a4 filterEmptyActionSets:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  HFTriggerActionSetsBuilder *v10;
  HFTriggerActionSetsBuilder *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  HFMutableSetDiff *v25;
  void *v26;
  HFMutableSetDiff *v27;
  HFTriggerAnonymousActionSetBuilder *v28;
  uint64_t v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)HFTriggerActionSetsBuilder;
  v10 = -[HFTriggerActionSetsBuilder init](&v38, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_home, a4);
    -[HFTriggerActionSetsBuilder _removeDuplicateActionSets:](v11, "_removeDuplicateActionSets:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HFTriggerActionSetsBuilder _removeEmptyActionSets:](v11, "_removeEmptyActionSets:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
LABEL_6:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v18), "hf_shortcutAction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFTriggerActionSetsBuilder setShortcutAction:](v11, "setShortcutAction:", v19);

        -[HFTriggerActionSetsBuilder shortcutAction](v11, "shortcutAction");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v16)
            goto LABEL_6;
          break;
        }
      }
    }

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __78__HFTriggerActionSetsBuilder_initWithActionSets_inHome_filterEmptyActionSets___block_invoke;
    v32[3] = &unk_1EA7320B8;
    v21 = v9;
    v33 = v21;
    objc_msgSend(v14, "na_map:", v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(v14, "na_firstObjectPassingTest:", &__block_literal_global_85);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [HFMutableSetDiff alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HFMutableSetDiff initWithFromSet:](v25, "initWithFromSet:", v26);
    -[HFTriggerActionSetsBuilder setActionSetBuilders:](v11, "setActionSetBuilders:", v27);

    v28 = [HFTriggerAnonymousActionSetBuilder alloc];
    if (v24)
      v29 = -[HFTriggerAnonymousActionSetBuilder initWithExistingObject:inHome:](v28, "initWithExistingObject:inHome:", v24, v21);
    else
      v29 = -[HFItemBuilder initWithHome:](v28, "initWithHome:", v21);
    v30 = (void *)v29;
    -[HFTriggerActionSetsBuilder setAnonymousActionSetBuilder:](v11, "setAnonymousActionSetBuilder:", v29);

  }
  return v11;
}

HFActionSetBuilder *__78__HFTriggerActionSetsBuilder_initWithActionSets_inHome_filterEmptyActionSets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HFActionSetBuilder *v4;

  v3 = a2;
  if ((objc_msgSend(v3, "hf_isAnonymous") & 1) != 0)
    v4 = 0;
  else
    v4 = -[HFActionSetBuilder initWithExistingObject:inHome:]([HFActionSetBuilder alloc], "initWithExistingObject:inHome:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __78__HFTriggerActionSetsBuilder_initWithActionSets_inHome_filterEmptyActionSets___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAnonymous");
}

- (id)_removeDuplicateActionSets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(v17, "uniqueIdentifier", (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v4, "containsObject:", v18);

        if (v19)
        {
          objc_msgSend(v17, "uniqueIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeObject:", v20);

          objc_msgSend(v11, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v14);
  }

  return v11;
}

- (id)_removeEmptyActionSets:(id)a3
{
  return (id)objc_msgSend(a3, "na_filter:", &__block_literal_global_7_5);
}

BOOL __53__HFTriggerActionSetsBuilder__removeEmptyActionSets___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setFromTriggerActionSetsBuilder:(id)a3
{
  id v4;
  HFMutableSetDiff *v5;
  void *v6;
  void *v7;
  HFMutableSetDiff *v8;
  HFTriggerAnonymousActionSetBuilder *v9;
  void *v10;
  HFTriggerAnonymousActionSetBuilder *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = [HFMutableSetDiff alloc];
  objc_msgSend(v4, "namedActionSetsDiff");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFMutableSetDiff initWithFromSet:](v5, "initWithFromSet:", v7);
  -[HFTriggerActionSetsBuilder setActionSetBuilders:](self, "setActionSetBuilders:", v8);

  v9 = [HFTriggerAnonymousActionSetBuilder alloc];
  -[HFTriggerActionSetsBuilder home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFItemBuilder initWithHome:](v9, "initWithHome:", v10);
  -[HFTriggerActionSetsBuilder setAnonymousActionSetBuilder:](self, "setAnonymousActionSetBuilder:", v11);

  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymousActionSetBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "actionBuilders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateActionBuildersDiff:", v13);

}

- (void)updateFromTriggerActionSetsBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "actionSetBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[HFTriggerActionSetsBuilder setActionSetBuilders:](self, "setActionSetBuilders:", v6);

  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymousActionSetBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionBuilders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateActionBuildersDiff:", v9);

  objc_msgSend(v4, "shortcutAction");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HFTriggerActionSetsBuilder setShortcutAction:](self, "setShortcutAction:", v10);
}

- (HFSetDiff)namedActionSetsDiff
{
  void *v2;
  void *v3;

  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (HFSetDiff *)v3;
}

- (BOOL)isShortcutOwned
{
  void *v3;
  BOOL v4;
  void *v5;

  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "actionSetType") == 1)
  {
    v4 = 1;
  }
  else
  {
    -[HFTriggerActionSetsBuilder shortcutAction](self, "shortcutAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (WFHomeWorkflow)homeWorkflow
{
  void *v2;
  void *v3;

  -[HFTriggerActionSetsBuilder shortcutAction](self, "shortcutAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFHomeWorkflow *)v3;
}

- (void)setHomeWorkflow:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA848]), "initWithShortcut:", v5);
    -[HFTriggerActionSetsBuilder setShortcutAction:](self, "setShortcutAction:", v4);

  }
  else
  {
    -[HFTriggerActionSetsBuilder setShortcutAction:](self, "setShortcutAction:", 0);
  }

}

- (BOOL)hasActions
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v4 = 1;
    }
    else
    {
      -[HFTriggerActionSetsBuilder shortcutAction](self, "shortcutAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7 != 0;

    }
  }

  return v4;
}

- (NSArray)namedActionSets
{
  void *v2;
  void *v3;
  void *v4;

  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)anonymousActionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[HFTriggerActionSetsBuilder shortcutAction](self, "shortcutAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFTriggerActionSetsBuilder shortcutAction](self, "shortcutAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerActionSetsBuilder home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFActionBuilder actionBuilderForAction:inHome:](HFActionBuilder, "actionBuilderForAction:inHome:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actions");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return (NSArray *)v8;
}

- (void)addActionSetBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)updateActionSetBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateObject:", v4);

}

- (void)removeActionSetBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteObject:", v4);

}

- (void)addAnonymousActionBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v4);

}

- (void)updateAnonymousActionBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAction:", v4);

}

- (void)removeAnonymousActionBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAction:", v4);

}

- (void)removeAllActionsAndActionSets
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[HFTriggerActionSetsBuilder removeActionSetBuilder:](self, "removeActionSetBuilder:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllActions");

}

- (BOOL)areActionsAffectedByEndEvents
{
  void *v3;
  void *v4;
  void *v5;

  -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "na_any:", &__block_literal_global_12_4);
  return (char)v4;
}

uint64_t __59__HFTriggerActionSetsBuilder_areActionsAffectedByEndEvents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAffectedByEndEvents");
}

- (void)resetAllActionSets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HFTriggerAnonymousActionSetBuilder *v9;
  void *v10;
  HFTriggerAnonymousActionSetBuilder *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HFTriggerActionSetsBuilder setActionSetBuilders:](self, "setActionSetBuilders:", v7);

  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [HFTriggerAnonymousActionSetBuilder alloc];
  -[HFTriggerActionSetsBuilder home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFItemBuilder initWithHome:](v9, "initWithHome:", v10);
  -[HFTriggerActionSetsBuilder setAnonymousActionSetBuilder:](self, "setAnonymousActionSetBuilder:", v11);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v8, "actions", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
        -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "copyForCreatingNewAction");
        objc_msgSend(v18, "addAction:", v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

}

- (void)resetActionSetBuilders
{
  HFMutableSetDiff *v3;
  void *v4;
  HFMutableSetDiff *v5;
  id v6;

  v3 = [HFMutableSetDiff alloc];
  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFMutableSetDiff initWithFromSet:](v3, "initWithFromSet:", v4);
  -[HFTriggerActionSetsBuilder setActionSetBuilders:](self, "setActionSetBuilders:", v5);

}

- (void)addActionSetIfNotPresent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  HFActionSetBuilder *v7;
  void *v8;
  HFActionSetBuilder *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__HFTriggerActionSetsBuilder_addActionSetIfNotPresent___block_invoke;
  v11[3] = &unk_1EA732140;
  v10 = v4;
  v12 = v10;
  v6 = objc_msgSend(v5, "na_any:", v11);

  if (v10 && (v6 & 1) == 0)
  {
    v7 = [HFActionSetBuilder alloc];
    -[HFTriggerActionSetsBuilder home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFActionSetBuilder initWithExistingObject:inHome:](v7, "initWithExistingObject:inHome:", v10, v8);

    -[HFTriggerActionSetsBuilder addActionSetBuilder:](self, "addActionSetBuilder:", v9);
  }

}

uint64_t __55__HFTriggerActionSetsBuilder_addActionSetIfNotPresent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (void)removeActionSetIfPresent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HFTriggerActionSetsBuilder_removeActionSetIfPresent___block_invoke;
  v8[3] = &unk_1EA732140;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[HFTriggerActionSetsBuilder removeActionSetBuilder:](self, "removeActionSetBuilder:", v6);
  else
    NSLog(CFSTR("Could not find existing action set builder for action set: %@"), v7);

}

uint64_t __55__HFTriggerActionSetsBuilder_removeActionSetIfPresent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (id)createActionSetsForShortcuts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_17_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "hasActions");

  if ((_DWORD)v4)
  {
    -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortcutsComponentActionSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v8);

  }
  return v5;
}

uint64_t __58__HFTriggerActionSetsBuilder_createActionSetsForShortcuts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionSet");
}

- (NSArray)allActionSets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_18_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "hasActions");

  if ((_DWORD)v5)
  {
    -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");

      objc_msgSend(v11, "setActionSet:", 0);
      v8 = v11;
    }
    objc_msgSend(v8, "getOrCreateActionSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

  }
  return (NSArray *)v6;
}

uint64_t __43__HFTriggerActionSetsBuilder_allActionSets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionSet");
}

- (NSArray)allActionBuilders
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[HFTriggerActionSetsBuilder anonymousActionBuilder](self, "anonymousActionBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "actions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (void)convertToHomeWorkflowActionSet:(id)a3
{
  -[HFTriggerActionSetsBuilder setHomeWorkflow:](self, "setHomeWorkflow:", a3);
  -[HFTriggerActionSetsBuilder convertToHomeWorkflowActionSetIfNeeded](self, "convertToHomeWorkflowActionSetIfNeeded");
}

- (void)convertToHomeWorkflowActionSetIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HFTriggerActionSetsBuilder shortcutAction](self, "shortcutAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFTriggerActionSetsBuilder shortcutAction](self, "shortcutAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerActionSetsBuilder home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFActionBuilder actionBuilderForAction:inHome:](HFActionBuilder, "actionBuilderForAction:inHome:", v4, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:actionSetType:", v7, 1);

    -[HFTriggerActionSetsBuilder _removeAllNamedActionsSets](self, "_removeAllNamedActionsSets");
  }
}

- (void)_removeAllNamedActionsSets
{
  id v2;

  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAllObjects");

}

- (void)defaultActionsForShortcut
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        v10 = v9;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        if (v12)
          objc_msgSend(v12, "defaultActionIfMediaActionInvalid");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_21_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFTriggerActionSetsBuilder home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithActionSets:inHome:", v8, v10);

  -[HFTriggerActionSetsBuilder actionSetBuilders](self, "actionSetBuilders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopyWithZone:", a3);
  objc_msgSend(v11, "setActionSetBuilders:", v13);

  -[HFTriggerActionSetsBuilder anonymousActionSetBuilder](self, "anonymousActionSetBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v11, "setAnonymousActionSetBuilder:", v15);

  -[HFTriggerActionSetsBuilder shortcutAction](self, "shortcutAction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShortcutAction:", v16);

  return v11;
}

uint64_t __43__HFTriggerActionSetsBuilder_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionSet");
}

- (HFTriggerAnonymousActionSetBuilder)anonymousActionSetBuilder
{
  return self->_anonymousActionSetBuilder;
}

- (void)setAnonymousActionSetBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousActionSetBuilder, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (HFMutableSetDiff)actionSetBuilders
{
  return self->_actionSetBuilders;
}

- (void)setActionSetBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetBuilders, a3);
}

- (HMShortcutAction)shortcutAction
{
  return self->_shortcutAction;
}

- (void)setShortcutAction:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutAction, 0);
  objc_storeStrong((id *)&self->_actionSetBuilders, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_anonymousActionSetBuilder, 0);
}

- (id)compareToObject:(id)a3
{
  id v4;
  HFComparisonResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[HFComparisonResult initWithObjectA:objectB:]([HFComparisonResult alloc], "initWithObjectA:objectB:", self, v4);
  if (!-[HFComparisonResult containsCriticalDifference](v5, "containsCriticalDifference"))
  {
    -[HFTriggerActionSetsBuilder namedActionSets](self, "namedActionSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "namedActionSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFContainedObjectListDifference containedObjectDifferenceWithKey:objectsA:objectsB:](HFContainedObjectListDifference, "containedObjectDifferenceWithKey:objectsA:objectsB:", CFSTR("actionSets"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v8);

    -[HFTriggerActionSetsBuilder anonymousActionBuilder](self, "anonymousActionBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anonymousActionBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFContainedObjectListDifference containedObjectDifferenceWithKey:objectsA:objectsB:](HFContainedObjectListDifference, "containedObjectDifferenceWithKey:objectsA:objectsB:", CFSTR("actions"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v11);

  }
  return v5;
}

- (unint64_t)hash
{
  return 0;
}

@end
