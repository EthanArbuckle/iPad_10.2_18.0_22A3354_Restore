@implementation HFMediaAccessoryItemUpdateRequest

- (HFMediaAccessoryItemUpdateRequest)initWithMediaProfileContainer:(id)a3 valueSource:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HFMediaAccessoryItemUpdateRequest *v11;
  HFMediaAccessoryItemUpdateRequest *v12;
  uint64_t v13;
  HFMediaValueSource *mediaValueSource;
  uint64_t v15;
  HMHome *home;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryLikeItem.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  objc_msgSend(v8, "hf_mediaValueSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v9)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryLikeItem.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer.hf_mediaValueSource"));

    if (v9)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryLikeItem.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueSource"));

LABEL_5:
  v21.receiver = self;
  v21.super_class = (Class)HFMediaAccessoryItemUpdateRequest;
  v11 = -[HFMediaAccessoryItemUpdateRequest init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_valueSource, a4);
    objc_msgSend(v8, "hf_mediaValueSource");
    v13 = objc_claimAutoreleasedReturnValue();
    mediaValueSource = v12->_mediaValueSource;
    v12->_mediaValueSource = (HFMediaValueSource *)v13;

    objc_storeStrong((id *)&v12->_mediaProfile, a3);
    objc_msgSend(v8, "hf_home");
    v15 = objc_claimAutoreleasedReturnValue();
    home = v12->_home;
    v12->_home = (HMHome *)v15;

  }
  return v12;
}

- (HFMediaAccessoryItemUpdateRequest)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaProfileContainer_valueSource_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryLikeItem.m"), 80, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMediaAccessoryItemUpdateRequest init]",
    v5);

  return 0;
}

- (id)updateWithOptions:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  HFMediaAccessoryItemUpdateResponse *v42;
  HFMediaAccessoryItemUpdateResponse *v43;
  void *v45;
  void *v46;
  id obj;
  uint64_t v48;
  void *v49;
  HFMediaAccessoryItemUpdateRequest *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  HFMediaAccessoryItemUpdateRequest *v70;
  _QWORD v71[5];
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  -[HFMediaAccessoryItemUpdateRequest home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessoryItemUpdateRequest mediaProfile](self, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessoryItemUpdateRequest mediaProfile](self, "mediaProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:withContextProvider:](HFCharacteristicValueDisplayMetadata, "displayMetadataForMediaProfile:withContextProvider:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMediaAccessoryItemUpdateRequest valueSource](self, "valueSource");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessoryItemUpdateRequest mediaProfile](self, "mediaProfile");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hf_isMediaAccessoryProfileValid:") & 1) != 0)
  {
    v45 = v8;
    v46 = v4;
    -[HFMediaAccessoryItemUpdateRequest _parentMediaSystem](self, "_parentMediaSystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_opt_new();
    v50 = self;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    -[HFMediaAccessoryItemUpdateRequest accessories](self, "accessories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    v11 = MEMORY[0x1E0C809B0];
    v52 = v10;
    if (v10)
    {
      v48 = *(_QWORD *)v74;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v74 != v48)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v12);
          objc_msgSend(v13, "mediaProfile");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "hf_home");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:withContextProvider:](HFCharacteristicValueDisplayMetadata, "displayMetadataForMediaProfile:withContextProvider:", v14, v15);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "mediaProfile");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v17 = v16;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = v17;
          else
            v18 = 0;
          v19 = v18;

          objc_msgSend(v19, "components");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = v11;
          v72[1] = 3221225472;
          v72[2] = __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke;
          v72[3] = &unk_1EA72E690;
          v72[4] = v13;
          objc_msgSend(v20, "na_firstObjectPassingTest:", v72);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "role");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            v23 = 1;
          else
            v23 = v9 == 0;
          if (!v23)
          {
            objc_msgSend(v9, "components");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v71[0] = v11;
            v71[1] = 3221225472;
            v71[2] = __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_2;
            v71[3] = &unk_1EA72E690;
            v71[4] = v13;
            objc_msgSend(v24, "na_firstObjectPassingTest:", v71);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "role");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v17, "settings");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "mediaSession");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v11;
          v29 = (void *)MEMORY[0x1E0D519C0];
          v59[0] = v28;
          v59[1] = 3221225472;
          v59[2] = __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_3;
          v59[3] = &unk_1EA738598;
          v60 = v55;
          v61 = v13;
          v62 = v54;
          v63 = v51;
          v64 = v26;
          v65 = v27;
          v66 = v19;
          v67 = v9;
          v68 = v17;
          v69 = v22;
          v70 = v50;
          v30 = v22;
          v53 = v17;
          v31 = v19;
          v32 = v27;
          v33 = v26;
          v34 = v54;
          objc_msgSend(v29, "futureWithBlock:", v59);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v35);

          v11 = v28;
          ++v12;
        }
        while (v52 != v12);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      }
      while (v52);
    }

    v36 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "combineAllFutures:ignoringErrors:scheduler:", v49, 1, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v11;
    v56[1] = 3221225472;
    v56[2] = __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_4;
    v56[3] = &unk_1EA728A30;
    v56[4] = v50;
    v57 = v9;
    v8 = v45;
    v58 = v45;
    v39 = v9;
    objc_msgSend(v38, "flatMap:", v56);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v46;
  }
  else
  {
    v41 = (void *)MEMORY[0x1E0D519C0];
    v42 = [HFMediaAccessoryItemUpdateResponse alloc];
    v43 = -[HFMediaAccessoryItemUpdateResponse initWithDisplayMetadata:standardResults:](v42, "initWithDisplayMetadata:standardResults:", v8, MEMORY[0x1E0C9AA70]);
    objc_msgSend(v41, "futureWithResult:", v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v40;
}

uint64_t __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v13 = (id)objc_opt_new();
  +[HFServiceLikeItemResultFactory populateStandardResultsForHomeKitObject:withBackingAccessory:displayMetadata:readResponse:batteryLevelResults:valueSource:updateOptions:](HFServiceLikeItemResultFactory, "populateStandardResultsForHomeKitObject:withBackingAccessory:displayMetadata:readResponse:batteryLevelResults:valueSource:updateOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, *(_QWORD *)(a1 + 56), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addEntriesFromDictionary:", v4);
  objc_msgSend(v13, "objectForKey:", CFSTR("dependentHomeKitObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  objc_msgSend(v9, "na_safeAddObject:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v9, "na_safeAddObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v9, "na_safeAddObject:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v9, "na_safeAddObject:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v9, "na_safeAddObject:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v9, "na_safeAddObject:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 40), "hf_softwareUpdateDependentObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v10);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("dependentHomeKitObjects"));
  v11 = *(void **)(a1 + 104);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("HFMediaAccessoryItemSpeakerRoleKey"));

  }
  objc_msgSend(*(id *)(a1 + 112), "_appendSplitMediaAccountWarningIfNeededForAccessory:toResults:", *(_QWORD *)(a1 + 40), v13);
  objc_msgSend(*(id *)(a1 + 112), "_appendRestartStatusMessageForAccessory:toResults:", *(_QWORD *)(a1 + 40), v13);
  objc_msgSend(v3, "finishWithResult:", v13);

}

id __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  HFMediaAccessoryItemUpdateResponse *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_disambiguateMultipleAccessoryResponses:forMediaSystem:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_opt_new();
  v4 = -[HFMediaAccessoryItemUpdateResponse initWithDisplayMetadata:standardResults:]([HFMediaAccessoryItemUpdateResponse alloc], "initWithDisplayMetadata:standardResults:", *(_QWORD *)(a1 + 48), v3);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_disambiguateMultipleAccessoryResponses:(id)a3 forMediaSystem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  int v41;
  void *v42;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _QWORD v63[8];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    if ((unint64_t)objc_msgSend(v6, "count") < 3)
    {
      objc_msgSend(v7, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:withContextProvider:](HFCharacteristicValueDisplayMetadata, "displayMetadataForMediaProfile:withContextProvider:", v7, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      -[HFMediaAccessoryItemUpdateRequest valueSource](self, "valueSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFServiceLikeItemResultFactory populateStandardResultsForHomeKitObject:withBackingAccessory:displayMetadata:readResponse:batteryLevelResults:valueSource:updateOptions:](HFServiceLikeItemResultFactory, "populateStandardResultsForHomeKitObject:withBackingAccessory:displayMetadata:readResponse:batteryLevelResults:valueSource:updateOptions:", v7, 0, v17, 0, 0, v18, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v49 = (void *)v17;
      v50 = v7;
      if (_MergedGlobals_281 != -1)
        dispatch_once(&_MergedGlobals_281, &__block_literal_global_45_2);
      v20 = (id)qword_1ED3795B0;
      v21 = (void *)objc_opt_new();
      v47 = v20;
      objc_msgSend(v21, "setKeysToSkip:", v20);
      objc_msgSend(v6, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v21;
      objc_msgSend(v21, "combineResultDictionary:withResultDictionary:reconcilationHandler:", v22, v23, &__block_literal_global_50_6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v24, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v6;
      objc_msgSend(v6, "arrayByAddingObject:", v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v59 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("underlyingError"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "na_safeAddObject:", v31);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
        }
        while (v28);
      }
      v48 = (void *)v19;
      +[HFCharacteristicValueDisplayError mostEgregiousError:](HFCharacteristicValueDisplayError, "mostEgregiousError:", v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __92__HFMediaAccessoryItemUpdateRequest__disambiguateMultipleAccessoryResponses_forMediaSystem___block_invoke_52;
      v56[3] = &unk_1EA726FA0;
      v44 = v32;
      v45 = v26;
      v57 = v44;
      objc_msgSend(v26, "na_firstObjectPassingTest:", v56);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = CFSTR("descriptionStyle");
      v63[1] = CFSTR("description");
      v63[2] = CFSTR("errorDescription");
      v63[3] = CFSTR("longErrorDescription");
      v63[4] = CFSTR("badge");
      v63[5] = CFSTR("priority");
      v63[6] = CFSTR("errorMessageButtonTitle");
      v63[7] = CFSTR("errorMessageTitle");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 8);
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v53 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
            objc_msgSend(v13, "removeObjectForKey:", v39);
            objc_msgSend(v33, "allKeys");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "containsObject:", v39);

            if (v41)
            {
              objc_msgSend(v33, "objectForKeyedSubscript:", v39);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v42, v39);

            }
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        }
        while (v36);
      }

      v7 = v50;
      v6 = v51;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[HFMediaAccessoryItemUpdateRequest _disambiguateMultipleAccessoryResponses:forMediaSystem:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("HFMediaAccessoryLikeItem.m"), 179, CFSTR("HFMediaAccessoryItem only accepts speaker pairs at this time. %@"), v6);

      v13 = (void *)MEMORY[0x1E0C9AA70];
    }
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("symptom"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    -[HFMediaAccessoryItemUpdateRequest _parentMediaSystem](self, "_parentMediaSystem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && objc_msgSend(v11, "type") == 11)
    {
      v13 = (void *)MEMORY[0x1E0C9AA70];
    }
    else
    {
      objc_msgSend(v6, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v13;
}

void __92__HFMediaAccessoryItemUpdateRequest__disambiguateMultipleAccessoryResponses_forMediaSystem___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("serviceNameComponents");
  v4[1] = CFSTR("HFMediaAccessoryItemSpeakerRoleKey");
  v4[2] = CFSTR("errorDescription");
  v4[3] = CFSTR("longErrorDescription");
  v4[4] = CFSTR("badge");
  v4[5] = CFSTR("priority");
  v4[6] = CFSTR("errorMessageButtonTitle");
  v4[7] = CFSTR("errorMessageTitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED3795B0;
  qword_1ED3795B0 = v2;

}

id __92__HFMediaAccessoryItemUpdateRequest__disambiguateMultipleAccessoryResponses_forMediaSystem___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("symptom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11 && objc_msgSend(v11, "type") == 11)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorHandlerURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 138412802;
      v16 = v8;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_INFO, "Unable to reconcile key '%@' for firstResult '%@' / secondResult '%@'", (uint8_t *)&v15, 0x20u);
    }

    v12 = 0;
  }

  return v12;
}

BOOL __92__HFMediaAccessoryItemUpdateRequest__disambiguateMultipleAccessoryResponses_forMediaSystem___block_invoke_52(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("underlyingError"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)accessories
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItemUpdateRequest mediaProfile](self, "mediaProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_parentMediaSystem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFMediaAccessoryItemUpdateRequest mediaProfile](self, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isItemGroup"))
  {
    v4 = v3;
  }
  else
  {
    -[HFMediaAccessoryItemUpdateRequest home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_mediaSystemForAccessory:", v7);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_appendSplitMediaAccountWarningIfNeededForAccessory:(id)a3 toResults:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23[2];
  uint8_t buf[4];
  HFMediaAccessoryItemUpdateRequest *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "mediaProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_homePodIsCapableOfShowingSplitAccountError");

  objc_msgSend(v7, "mediaProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_settingsValueManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "valueForSettingAtKeyPath:", CFSTR("root.home.dismissedHomePodHasNonMemberMediaAccountWarning"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  HFLogForCategory(5uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = self;
    v26 = 2112;
    v27 = v16;
    v28 = 1024;
    v29 = v14;
    _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Was the Split Account warning dismissed? [%d]", buf, 0x1Cu);

  }
  if (((v10 ^ 1 | v14) & 1) == 0)
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend(v7, "mediaProfile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hf_homePodSupportsMultiUserLanguage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __99__HFMediaAccessoryItemUpdateRequest__appendSplitMediaAccountWarningIfNeededForAccessory_toResults___block_invoke;
      v20[3] = &unk_1EA7324F0;
      objc_copyWeak(v23, (id *)buf);
      v21 = v7;
      v22 = v8;
      v23[1] = (id)a2;
      v19 = (id)objc_msgSend(v18, "addCompletionBlock:", v20);

      objc_destroyWeak(v23);
    }

    objc_destroyWeak((id *)buf);
  }

}

void __99__HFMediaAccessoryItemUpdateRequest__appendSplitMediaAccountWarningIfNeededForAccessory_toResults___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v4)
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = WeakRetained;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = v4;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%@:%@ Other Error returned %@", (uint8_t *)&v23, 0x20u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_appleMusicCurrentLoggedInAccount");
    v6 = objc_claimAutoreleasedReturnValue();

    +[HFAppleMusicHomeAccountManager sharedInstance](HFAppleMusicHomeAccountManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaAccountForHomeIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "mediaProfile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v15, "hf_supportsPreferredMediaUser");

    if ((v10 & 1) == 0)
    {
      if (v14 && v6)
      {
        objc_opt_class();
        v16 = v14;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        -[NSObject ams_altDSID](v18, "ams_altDSID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject ams_altDSID](v6, "ams_altDSID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if ((v21 & 1) == 0)
          objc_msgSend(WeakRetained, "_appendSplitMediaAccountWarningForAccessory:toResults:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      else
      {
        HFLogForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138413058;
          v24 = WeakRetained;
          v25 = 2112;
          v26 = v22;
          v27 = 2112;
          v28 = v6;
          v29 = 2112;
          v30 = v14;
          _os_log_debug_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEBUG, "%@:%@ HomePod [%@] and Home Media [%@] Accounts a nil", (uint8_t *)&v23, 0x2Au);

        }
      }

    }
  }

}

- (void)_appendSplitMediaAccountWarningForAccessory:(id)a3 toResults:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HFMediaAccessoryItemUpdateRequest *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory(5uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Displaying Split Account Badge", (uint8_t *)&v10, 0x16u);

  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessorySplitMediaAccountErrorDescription"), CFSTR("HFMediaAccessorySplitMediaAccountErrorDescription"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("detailedControlDescription"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA7CC790, CFSTR("badge"));
}

- (void)_appendRestartStatusMessageForAccessory:(id)a3 toResults:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  dispatch_time_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HFMediaAccessoryItemUpdateRequest *v38;
  HFMediaAccessoryItemUpdateRequest *v39;
  _QWORD block[4];
  id v41;
  HFMediaAccessoryItemUpdateRequest *v42;
  uint8_t buf[4];
  HFMediaAccessoryItemUpdateRequest *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  _BYTE v48[10];
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "hf_isHomePod"))
  {
    v39 = self;
    objc_msgSend(v7, "mediaProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_settingsAdapterManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adapterForIdentifier:", CFSTR("DeviceOptions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "isHomePodRestartingCurrently:", v15);

    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v7, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "isHomePodRestartInitiated:", v20);

    }
    else
    {
      v21 = 0;
    }

    HFLogForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v44 = v39;
      v45 = 2112;
      v46 = v35;
      v47 = 1024;
      *(_DWORD *)v48 = v21;
      *(_WORD *)&v48[4] = 1024;
      *(_DWORD *)&v48[6] = v16;
      v49 = 1024;
      v50 = objc_msgSend(v11, "isAccessoryReachableOverRapport");
      _os_log_debug_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEBUG, "%@:%@ isHomePodRestartInitiated=[%d], isHomePodRestarting[%d], isAccessoryReachableOverRapport [%d]", buf, 0x28u);

    }
    HFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v44 = v39;
      v45 = 2112;
      v46 = v36;
      v47 = 2112;
      *(_QWORD *)v48 = v8;
      _os_log_debug_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEBUG, "%@:%@ Existing results = [%@]", buf, 0x20u);

    }
    if (v16 && !objc_msgSend(v11, "isAccessoryReachableOverRapport"))
    {
      if (!v21)
      {
LABEL_24:
        _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory"), CFSTR("HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory"), 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, CFSTR("detailedControlDescription"));

LABEL_25:
        goto LABEL_26;
      }
    }
    else if (!v21 || (objc_msgSend(v11, "isAccessoryReachableOverRapport") & 1) == 0)
    {
      if ((objc_msgSend(v11, "isAccessoryReachableOverRapport") & v16) == 1)
      {
        HFLogForCategory(0);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v7, "uniqueIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "UUIDString");
          v38 = (HFMediaAccessoryItemUpdateRequest *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v44 = v38;
          _os_log_debug_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEBUG, "*** Solo Accessory is reachable over Rapport..%@", buf, 0xCu);

        }
        +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uniqueIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "UUIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "markUUIDReachableViaRapport:", v27);

        +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uniqueIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "updateHomePodAccessoryRestartState:with:", 3, v30);

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("longErrorDescription"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory"), CFSTR("HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory"), 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v30) = objc_msgSend(v31, "isEqualToString:", v32);

        if ((_DWORD)v30)
        {
          objc_msgSend(v8, "removeObjectForKey:", CFSTR("detailedControlDescription"));
          objc_msgSend(v8, "removeObjectForKey:", CFSTR("badge"));
        }
      }
      goto LABEL_25;
    }
    if (objc_msgSend(v11, "isAccessoryReachableOverRapport"))
    {
      v33 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __87__HFMediaAccessoryItemUpdateRequest__appendRestartStatusMessageForAccessory_toResults___block_invoke;
      block[3] = &unk_1EA727188;
      v41 = v7;
      v42 = v39;
      dispatch_after(v33, MEMORY[0x1E0C80D38], block);

    }
    goto LABEL_24;
  }
LABEL_26:

}

id __87__HFMediaAccessoryItemUpdateRequest__appendRestartStatusMessageForAccessory_toResults___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markUUIDUnreachableViaRapport:", v4);

  +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateHomePodAccessoryRestartState:with:", 2, v7);

  return (id)objc_msgSend(*(id *)(a1 + 40), "updateWithOptions:", MEMORY[0x1E0C9AA70]);
}

- (HFMediaValueSource)mediaValueSource
{
  return self->_mediaValueSource;
}

- (HMHome)home
{
  return self->_home;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFMediaProfileContainer)mediaProfile
{
  return self->_mediaProfile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfile, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_mediaValueSource, 0);
}

@end
