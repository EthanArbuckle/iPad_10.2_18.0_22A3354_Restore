@implementation HFServiceItem

- (HMService)service
{
  return self->_service;
}

uint64_t __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_characteristicOfType:", *(_QWORD *)(a1 + 32));
}

uint64_t __28__HFServiceItem_accessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

uint64_t __83__HFServiceItem_characteristicsToReadWithCharacteristicTypes_options_controlItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_allRepresentedServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "supportsItemRepresentingServices:", v4);

  return v5;
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "servicesToReadForCharacteristicType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_2;
  v8[3] = &unk_1EA72DFA0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_allRepresentedServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFServiceItem service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_childServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[HFServiceItem _descriptionBuilder](self, "_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCharacteristicsForCharacteristicType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;

  v3 = a2;
  objc_msgSend(v3, "characteristicOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCharacteristicTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_4;
  v20[3] = &unk_1EA726AB8;
  v7 = v3;
  v21 = v7;
  objc_msgSend(v5, "na_flatMap:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_opt_class();
  v10 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_msgSend(v12, "childServiceFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "parentService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredChildServicesForParentService:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_5;
    v19[3] = &unk_1EA72DFA0;
    v19[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v15, "na_map:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "na_flatMap:", &__block_literal_global_72_4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionSet:", v17);

  }
  return v9;
}

- (id)_descriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("service"));

  -[HFServiceItem service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_childServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v9, CFSTR("childServices"), 1, &__block_literal_global_38_2);

  return v3;
}

- (id)performStandardUpdateWithCharacteristicTypes:(id)a3 options:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  HFServiceLikeItemUpdateRequest *v13;
  void *v14;
  void *v15;
  HFServiceLikeItemUpdateRequest *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  HFServiceItem *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a3;
  objc_msgSend(v8, "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  -[HFServiceItem characteristicsToReadWithCharacteristicTypes:options:controlItems:](self, "characteristicsToReadWithCharacteristicTypes:options:controlItems:", v9, v7, &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v26;
  v13 = [HFServiceLikeItemUpdateRequest alloc];
  -[HFServiceItem service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem valueSource](self, "valueSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HFServiceLikeItemUpdateRequest initWithService:valueSource:characteristics:](v13, "initWithService:valueSource:characteristics:", v14, v15, v11);

  if (v16)
  {
    -[HFServiceLikeItemUpdateRequest updateWithOptions:](v16, "updateWithOptions:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __70__HFServiceItem_performStandardUpdateWithCharacteristicTypes_options___block_invoke;
    v24[3] = &unk_1EA72A770;
    v24[4] = self;
    v25 = v12;
    objc_msgSend(v17, "flatMap:", v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory(0x29uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceItem service](self, "service");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = self;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v23;
      _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "%@:%@ Failed to create HFServiceLikeItemUpdateRequest. Service: %@ ", buf, 0x20u);

    }
    v20 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)controlItemValueSourceForPrimaryService
{
  HFSimpleAggregatedCharacteristicValueSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HFSimpleAggregatedCharacteristicValueSource *v11;

  v3 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  -[HFServiceItem valueSource](self, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HFServiceItem service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_serviceDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:characteristics:primaryServiceDescriptor:](v3, "initWithValueSource:characteristics:primaryServiceDescriptor:", v4, v8, v10);

  return v11;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)characteristicsToReadWithCharacteristicTypes:(id)a3 options:(id)a4 controlItems:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char **v15;
  uint64_t i;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HFMediaControlItem *v23;
  char **v24;
  HFHomePodAlarmControlItem *v25;
  HFHomePodTimerControlItem *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id *v44;
  id v45;
  id v46;
  void *v47;
  HFServiceItem *v48;
  id obj;
  void *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HFServiceItem createControlItemsWithOptions:](self, "createControlItemsWithOptions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __83__HFServiceItem_characteristicsToReadWithCharacteristicTypes_options_controlItems___block_invoke;
  v56[3] = &unk_1EA740730;
  v56[4] = self;
  objc_msgSend(v10, "na_filter:", v56);
  v11 = objc_claimAutoreleasedReturnValue();

  v47 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v11);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self;
  -[HFServiceItem service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v12, "isPrimaryService");

  if (!(_DWORD)self)
    goto LABEL_20;
  v44 = a5;
  v45 = v9;
  v46 = v8;
  -[HFServiceItem _siriEndPointProfiles](v48, "_siriEndPointProfiles");
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (!v13)
    goto LABEL_19;
  v14 = v13;
  v15 = &selRef_home_didRemoveResidentDevice_;
  v51 = *(_QWORD *)v53;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v53 != v51)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      v18 = v15[45];
      objc_msgSend(v17, "mediaProfile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "conformsToProtocol:", v18))
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      objc_msgSend(v21, "hf_mediaValueSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = -[HFMediaControlItem initWithValueSource:mediaProfileContainer:mediaAccessoryItemType:displayResults:]([HFMediaControlItem alloc], "initWithValueSource:mediaProfileContainer:mediaAccessoryItemType:displayResults:", v22, v21, 6, 0);
        objc_msgSend(v50, "addObject:", v23);
        if (_os_feature_enabled_impl())
        {
          v24 = v15;
          +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
          v25 = (HFHomePodAlarmControlItem *)objc_claimAutoreleasedReturnValue();
          -[HFHomePodAlarmControlItem home](v25, "home");
          v26 = (HFHomePodTimerControlItem *)objc_claimAutoreleasedReturnValue();
          if (!-[HFHomePodTimerControlItem hf_currentUserIsAdministrator](v26, "hf_currentUserIsAdministrator"))goto LABEL_15;
          objc_msgSend(v17, "hf_siriEndpointProfile");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "supportsOnboarding");

          v15 = v24;
          if (v28)
          {
            v25 = -[HFHomePodAlarmControlItem initWithMediaProfileContainer:displayResults:]([HFHomePodAlarmControlItem alloc], "initWithMediaProfileContainer:displayResults:", v21, 0);
            objc_msgSend(v50, "addObject:", v25);
            v26 = -[HFHomePodTimerControlItem initWithMediaProfileContainer:displayResults:]([HFHomePodTimerControlItem alloc], "initWithMediaProfileContainer:displayResults:", v21, 0);
            objc_msgSend(v50, "addObject:", v26);
LABEL_15:

            v15 = v24;
          }
        }

      }
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  }
  while (v14);
LABEL_19:

  v9 = v45;
  v8 = v46;
  a5 = v44;
LABEL_20:
  v29 = (void *)objc_msgSend(v50, "copy");

  objc_msgSend(v9, "objectForKeyedSubscript:", HFItemUpdateOptionPreviousResults);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("childItems"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    v33 = v31;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  v34 = v33;

  objc_msgSend(v34, "na_setByDiffingWithSet:", v29);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](v48, "service");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "hf_serviceDescriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = +[HFServiceState stateClassForServiceDescriptor:](HFServiceState, "stateClassForServiceDescriptor:", v36);

  if (v37)
  {
    -[objc_class requiredCharacteristicTypes](v37, "requiredCharacteristicTypes");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class optionalCharacteristicTypes](v37, "optionalCharacteristicTypes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setByAddingObjectsFromSet:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setByAddingObjectsFromSet:", v40);
    v41 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v41;
  }
  -[HFServiceItem characteristicsToReadForCharacteristicTypes:controlItems:](v48, "characteristicsToReadForCharacteristicTypes:controlItems:", v8, *a5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)_siriEndPointProfiles
{
  void *v2;
  void *v3;

  -[HFServiceItem accessories](self, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_67_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessories
{
  void *v2;
  void *v3;

  -[HFServiceItem services](self, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_65_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSet)services
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFServiceItem service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  if (v3)
  {
    -[HFServiceItem service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v6;
}

- (id)characteristicsToReadForCharacteristicTypes:(id)a3 controlItems:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke;
  v13[3] = &unk_1EA726AB8;
  v13[4] = self;
  v7 = a4;
  objc_msgSend(a3, "na_flatMap:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_3;
  v12[3] = &unk_1EA740708;
  v12[4] = self;
  objc_msgSend(v7, "na_flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unionSet:", v10);
  return v9;
}

- (void)applyInflectionToDescriptions:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[HFServiceItem service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_serviceNameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("description"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, CFSTR("description"));

  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("controlDescription"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("controlDescription"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("controlDescription"));

  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("detailedControlDescription"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("detailedControlDescription"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("detailedControlDescription"));

  }
}

id __70__HFServiceItem_performStandardUpdateWithCharacteristicTypes_options___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  HFServiceLikeItemUpdateResponse *v6;
  void *v7;
  void *v8;
  HFServiceLikeItemUpdateResponse *v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_augmentedStandardResultsForUpdateResponse:controlItems:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HFServiceLikeItemUpdateResponse alloc];
  objc_msgSend(v4, "displayMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HFServiceLikeItemUpdateResponse initWithDisplayMetadata:readResponse:standardResults:](v6, "initWithDisplayMetadata:readResponse:standardResults:", v7, v8, v5);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_augmentedStandardResultsForUpdateResponse:(id)a3 controlItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  HFServiceStateDescriptionFormatter *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString **v27;
  __CFString *v28;
  void *v29;
  void *v30;
  HFCAPackageIconDescriptor *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HFPrimaryStateIconDescriptor *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "standardResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[HFServiceItem service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_serviceNameComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("serviceNameComponents"));
    objc_msgSend(v11, "composedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("title"));

  }
  -[HFServiceItem service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_parentRoom");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v14;
  objc_msgSend(v14, "uniqueIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("roomIdentifier"));
  v43 = (void *)v15;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("childItems"));
  objc_msgSend(v6, "displayMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "serviceState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc_init(HFServiceStateDescriptionFormatter);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("description"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[HFServiceStateDescriptionFormatter stringForObjectValue:](v18, "stringForObjectValue:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "na_safeSetObject:forKey:", v20, CFSTR("description"));

    }
    -[HFServiceStateDescriptionFormatter setDescriptionContext:](v18, "setDescriptionContext:", 1);
    -[HFServiceStateDescriptionFormatter stringForObjectValue:](v18, "stringForObjectValue:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeSetObject:forKey:", v21, CFSTR("controlDescription"));

  }
  objc_msgSend(v6, "displayMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "transitioningPrimaryState");

  if (v23)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isInStateTransition"));
  }
  else
  {
    objc_msgSend(v6, "displayMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v24, "primaryState");

  }
  -[HFServiceItem service](self, "service");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hf_iconDescriptor");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v45 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = &HFCAPackageStateOn;
    if (v23 != 2)
      v27 = &HFCAPackageStateOff;
    v28 = *v27;
    -[HFServiceItem service](self, "service");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFServiceIconFactory iconModifiersForService:](HFServiceIconFactory, "iconModifiersForService:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = [HFCAPackageIconDescriptor alloc];
    -[__CFString identifier](v26, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:modifiers:](v31, "initWithPackageIdentifier:state:modifiers:", v32, v28, v30);

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[__CFString iconDescriptorForPrimaryState:](v26, "iconDescriptorForPrimaryState:", v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v28 = v34;

      v26 = v28;
    }
    else
    {
      v28 = 0;
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = [HFPrimaryStateIconDescriptor alloc];
    -[__CFString identifier](v26, "identifier");
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = -[HFPrimaryStateIconDescriptor initWithIdentifier:primaryState:](v35, "initWithIdentifier:primaryState:", v28, v23);

LABEL_23:
    v26 = (__CFString *)v33;
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HFServiceItem incrementalStateIconDescriptorForPrimaryState:incrementalValue:](self, "incrementalStateIconDescriptorForPrimaryState:incrementalValue:", v23, 0);
    v28 = v26;
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(v9, "na_safeSetObject:forKey:", v26, CFSTR("icon"));
  -[HFServiceItem service](self, "service");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "hf_dateAdded");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeSetObject:forKey:", v37, CFSTR("dateAdded"));

  -[HFServiceItem service](self, "service");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = objc_msgSend(v38, "hf_hasSetFavorite");

  if ((_DWORD)v37)
  {
    v39 = (void *)MEMORY[0x1E0CB37E8];
    -[HFServiceItem service](self, "service");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "numberWithBool:", objc_msgSend(v40, "hf_isFavorite"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v41, CFSTR("isFavorite"));

  }
  return v9;
}

- (id)descriptionForCharacteristic:(id)a3 withValue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3658];
  v15 = CFSTR("serviceType");
  v7 = a4;
  v8 = a3;
  -[HFServiceItem service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_valueFormatterForCharacteristic:options:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringForObjectValue:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

BOOL __38__HFServiceItem__siriEndPointProfiles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hf_siriEndpointProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend(v7, "hf_homeKitObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (!v10)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v10;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

LABEL_7:
    v12 = 0;
  }

  objc_msgSend(a1, "serviceItemForService:valueSource:", v12, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)serviceItemForService:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "itemClassForService:", v7)), "initWithValueSource:service:", v6, v7);

  return v8;
}

+ (Class)itemClassForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_serviceTypeToServiceItemClassMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

+ (NSDictionary)_serviceTypeToServiceItemClassMap
{
  if (qword_1ED378678 != -1)
    dispatch_once(&qword_1ED378678, &__block_literal_global_228);
  return (NSDictionary *)(id)_MergedGlobals_3_3;
}

- (HFServiceItem)initWithValueSource:(id)a3 service:(id)a4
{
  id v7;
  id v8;
  HFServiceItem *v9;
  HFOverrideCharacteristicValueSource *v10;
  void *v11;
  void *v12;
  HFOverrideCharacteristicValueSource *v13;
  HFCharacteristicValueSource *valueSource;
  HFOverrideCharacteristicValueSource *v15;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (-[HFServiceItem isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceItem.m"), 119, CFSTR("HFServiceItem is an abstract base class. It must be instantiated using +serviceItemForService:valueSource: or using one of its concrete subclasses directly."));

  }
  v18.receiver = self;
  v18.super_class = (Class)HFServiceItem;
  v9 = -[HFServiceItem init](&v18, sel_init);
  if (v9)
  {
    v10 = [HFOverrideCharacteristicValueSource alloc];
    objc_msgSend(v8, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_suspendedStateOverrideValueProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HFOverrideCharacteristicValueSource initWithOriginalValueSource:overrideValueProvider:](v10, "initWithOriginalValueSource:overrideValueProvider:", v7, v12);

    valueSource = v9->_valueSource;
    v9->_valueSource = (HFCharacteristicValueSource *)v13;
    v15 = v13;

    objc_storeStrong((id *)&v9->_service, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

void __50__HFServiceItem__serviceTypeToServiceItemClassMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  Class v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  Class v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint64_t v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("HFServiceItems"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = (uint64_t)v1;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Loading HFServiceItems.plist at URL %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v52 = (uint64_t)v1;
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Error finding HFServiceItems.plist at URL %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v1);
  v7 = objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v7;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Loaded HFServiceItems.plist data %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v52 = 0;
    _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Error loading HFServiceItems.plist data %@", buf, 0xCu);
  }

  v48 = 0;
  v49 = 200;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, &v49, &v48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v48;
  if (v11)
  {
    HFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = (uint64_t)v11;
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "Error deserializing HFServiceItems.plist %@", buf, 0xCu);
    }

  }
  v40 = v1;
  objc_opt_class();
  v13 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;
  v38 = v13;

  objc_opt_class();
  v37 = v15;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ServiceItems"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  v19 = objc_msgSend(v18, "count");
  HFLogForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v39 = (void *)v7;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Read services from HFServiceItems.plist", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_ERROR, "Error reading services from HFServiceItems.plist", buf, 2u);
  }

  v22 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v22, "addObject:", CFSTR("HFTelevisionServiceItem"));
  objc_msgSend(v22, "addObject:", CFSTR("HFInputSourceServiceItem"));
  v36 = v22;
  v23 = (void *)objc_msgSend(v22, "copy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v25 = v23;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v45;
    v29 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(v25);
        v31 = NSClassFromString(*(NSString **)(*((_QWORD *)&v44 + 1) + 8 * i));
        if (-[objc_class isSubclassOfClass:](v31, "isSubclassOfClass:", objc_opt_class()))
          v32 = v31 == 0;
        else
          v32 = 1;
        if (!v32)
        {
          -[objc_class supportedServiceTypes](v31, "supportedServiceTypes");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = v29;
          v41[1] = 3221225472;
          v41[2] = __50__HFServiceItem__serviceTypeToServiceItemClassMap__block_invoke_23;
          v41[3] = &unk_1EA7405E0;
          v42 = v24;
          v43 = v31;
          objc_msgSend(v33, "enumerateObjectsUsingBlock:", v41);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v27);
  }

  v34 = objc_msgSend(v24, "copy");
  v35 = (void *)_MergedGlobals_3_3;
  _MergedGlobals_3_3 = v34;

}

- (id)controlDescriptionForCharacteristic:(id)a3 withValue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeSetObject:forKey:", v11, CFSTR("serviceType"));

  -[HFServiceItem service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "room");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeSetObject:forKey:", v15, CFSTR("roomName"));

  objc_msgSend(MEMORY[0x1E0CB3658], "hf_controlDescriptionFormatterForCharacteristic:options:", v8, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringForObjectValue:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (NSSet)supportedServiceTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFServiceItem.m"), 48, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFServiceItem supportedServiceTypes]", objc_opt_class());

  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

uint64_t __50__HFServiceItem__serviceTypeToServiceItemClassMap__block_invoke_23(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), a2);
}

- (HFServiceItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_service_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceItem.m"), 131, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFServiceItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFServiceItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFServiceItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFServiceItem service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithValueSource:service:", v4, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

uint64_t __36__HFServiceItem__descriptionBuilder__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyDescription");
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[HFServiceItem _descriptionBuilder](self, "_descriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", v4, CFSTR("results:"), 0);

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 36);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createControlItemsWithOptions:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

- (id)controlItemValueSourceForServices:(id)a3
{
  id v5;
  void *v6;
  char v7;
  HFSimpleAggregatedCharacteristicValueSource *v8;
  void *v9;
  void *v10;
  void *v11;
  HFSimpleAggregatedCharacteristicValueSource *v12;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceItem.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("services.count > 0"));

  }
  -[HFServiceItem _allRepresentedServices](self, "_allRepresentedServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isSubsetOfSet:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceItem.m"), 196, CFSTR("An HFServiceItem can only create a value source for its main service (self.service) and its child services (self.service.hf_childServices). But the client requested a value source for some other services: %@"), v16);

  }
  v8 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  -[HFServiceItem valueSource](self, "valueSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_serviceDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:services:primaryServiceDescriptor:](v8, "initWithValueSource:services:primaryServiceDescriptor:", v9, v5, v11);

  return v12;
}

- (id)_actionableCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = HFItemUpdateOptionDisableOptionalData;
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem createControlItemsWithOptions:](self, "createControlItemsWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_flatMap:", &__block_literal_global_51_6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_filter:", &__block_literal_global_56_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __43__HFServiceItem__actionableCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v2 = a2;
  objc_msgSend(v2, "characteristicOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1EA7CD600);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__HFServiceItem__actionableCharacteristics__block_invoke_53;
  v8[3] = &unk_1EA726AB8;
  v9 = v2;
  v5 = v2;
  objc_msgSend(v4, "na_flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __43__HFServiceItem__actionableCharacteristics__block_invoke_53(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCharacteristicsForCharacteristicType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __43__HFServiceItem__actionableCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldCaptureInActionSets");
}

- (BOOL)containsActions
{
  void *v2;
  BOOL v3;

  -[HFServiceItem _actionableCharacteristics](self, "_actionableCharacteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  void *v2;
  char v3;

  -[HFServiceItem _actionableCharacteristics](self, "_actionableCharacteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_57_4);

  return v3;
}

uint64_t __46__HFServiceItem_actionsMayRequireDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresDeviceUnlock");
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[HFServiceItem service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(CFSTR("Can't find service"));
  -[HFServiceItem service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HFServiceItem _actionableCharacteristics](self, "_actionableCharacteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceItem valueSource](self, "valueSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readValuesForCharacteristics:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__HFServiceItem_currentStateActionBuildersForHome___block_invoke;
    v13[3] = &unk_1EA727A20;
    v14 = v7;
    v15 = v4;
    v10 = v7;
    objc_msgSend(v9, "flatMap:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id __51__HFServiceItem_currentStateActionBuildersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HFCharacteristicWriteActionBuilder *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  HFCharacteristicWriteActionBuilder *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = *(id *)(a1 + 32);
  v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v29)
  {
    v27 = 0;
    v28 = *(_QWORD *)v31;
    v26 = v5;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v5);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        objc_msgSend(v7, "characteristicType", v26);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "responseForCharacteristicType:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10
          || (objc_msgSend(v7, "value"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
          || (objc_msgSend(v7, "hf_defaultValue"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v11 = -[HFItemBuilder initWithHome:]([HFCharacteristicWriteActionBuilder alloc], "initWithHome:", *(_QWORD *)(a1 + 40));
          -[HFCharacteristicWriteActionBuilder setCharacteristic:](v11, "setCharacteristic:", v7);
          -[HFCharacteristicWriteActionBuilder setTargetValue:](v11, "setTargetValue:", v10);
          objc_msgSend(v4, "addObject:", v11);
          objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "characteristicType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v12, "containsObject:", v13) || objc_msgSend(v10, "BOOLValue"))
          {

            goto LABEL_12;
          }
          v14 = a1;
          v15 = v4;
          v16 = v3;
          objc_msgSend(v7, "service");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "hf_isVisible");

          if (v18)
          {
            v12 = v27;
            v27 = v11;
            v3 = v16;
            v4 = v15;
            a1 = v14;
            v5 = v26;
LABEL_12:

          }
          else
          {
            v3 = v16;
            v4 = v15;
            a1 = v14;
            v5 = v26;
          }

        }
        ++v6;
      }
      while (v29 != v6);
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v29 = v19;
      if (!v19)
        goto LABEL_22;
    }
  }
  v27 = 0;
LABEL_22:

  v20 = (void *)objc_opt_new();
  v21 = v20;
  if (v27)
  {
    objc_msgSend(v20, "addObject:", v27);
    v22 = v4;
  }
  else
  {
    objc_msgSend(v4, "allObjects");
    v22 = v4;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v23);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HFServiceItem service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v3;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4;
  HFServiceBuilder *v5;
  void *v6;
  HFServiceBuilder *v7;

  v4 = a3;
  v5 = [HFServiceBuilder alloc];
  -[HFServiceItem homeKitObject](self, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFServiceBuilder initWithExistingObject:inHome:](v5, "initWithExistingObject:inHome:", v6, v4);

  return v7;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;

  -[HFServiceItem service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromService:](HFNamingComponents, "namingComponentFromService:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceItem serviceItemForService:valueSource:](HFServiceItem, "serviceItemForService:valueSource:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = a2;
  objc_msgSend(v2, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HFItemUpdateOptionDisableOptionalData;
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createControlItemsWithOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicsToReadForCharacteristicTypes:controlItems:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)incrementalStateIconDescriptorForPrimaryState:(int64_t)a3 incrementalValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HFIncrementalStateIconDescriptor *v12;
  void *v13;
  HFIncrementalStateIconDescriptor *v14;

  v6 = a4;
  -[HFServiceItem service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_iconDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  v10 = v9;
  if (a3 == 2)
  {
    if (v9)
      v11 = v9;
    else
      v11 = &unk_1EA7CD930;
  }
  else
  {

    v11 = 0;
  }
  v12 = [HFIncrementalStateIconDescriptor alloc];
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HFIncrementalStateIconDescriptor initWithIdentifier:incrementalState:](v12, "initWithIdentifier:incrementalState:", v13, v11);

  return v14;
}

@end
