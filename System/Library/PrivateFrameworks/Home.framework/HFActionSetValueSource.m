@implementation HFActionSetValueSource

- (BOOL)isNaturalLightingSupportedForProfile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x38uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFActionSetValueSource actionSet](self, "actionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Checking if natural light is supported for action set: '%@'  profile:%@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v4, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportedFeatures");

  return v9 & 1;
}

- (BOOL)isNaturalLightingEnabledForProfile:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFActionSetValueSource _existingActionBuilderForLightProfile:](self, "_existingActionBuilderForLightProfile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x38uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HFActionSetValueSource actionSet](self, "actionSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    v15 = 1024;
    v16 = objc_msgSend(v5, "naturalLightEnabled");
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Checking if natural light is enabled for action set: '%@'  profile:%@ actionBuilder: %{BOOL}d", (uint8_t *)&v11, 0x1Cu);

  }
  v9 = objc_msgSend(v5, "naturalLightEnabled");

  return v9;
}

- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D519C0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__HFActionSetValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke;
  v11[3] = &unk_1EA729138;
  v11[4] = self;
  v12 = v6;
  v13 = a3;
  v8 = v6;
  objc_msgSend(v7, "futureWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __94__HFActionSetValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  HFNaturalLightingActionBuilder *v6;
  HFNaturalLightingActionBuilder *v7;
  void *v8;
  HFNaturalLightingActionBuilder *v9;
  HFNaturalLightingActionBuilder *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  HFNaturalLightingActionBuilder *v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_existingActionBuilderForLightProfile:", v4);
  v6 = (HFNaturalLightingActionBuilder *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[HFNaturalLightingActionBuilder setNaturalLightEnabled:](v6, "setNaturalLightEnabled:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "actionSetBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateAction:", v7);
    v9 = v7;
  }
  else
  {
    v10 = [HFNaturalLightingActionBuilder alloc];
    objc_msgSend(*(id *)(a1 + 32), "actionSetBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFItemBuilder initWithHome:](v10, "initWithHome:", v12);

    -[HFNaturalLightingActionBuilder setLightProfile:](v9, "setLightProfile:", *(_QWORD *)(a1 + 40));
    -[HFNaturalLightingActionBuilder setNaturalLightEnabled:](v9, "setNaturalLightEnabled:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "actionSetBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v9);
  }

  HFLogForCategory(0x38uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v7 == 0;
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(unsigned __int8 *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    v23 = v16;
    v24 = 1024;
    v25 = v17;
    v26 = 2112;
    v27 = v18;
    v28 = 2112;
    v29 = v9;
    v30 = 1024;
    v31 = v14;
    _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Updating natural light state for action set '%@' to %{BOOL}d for profile: %@ actionBuilder: %@ newAction: %{BOOL}d", buf, 0x2Cu);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__HFActionSetValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_76;
  v20[3] = &unk_1EA7291D8;
  v21 = *(id *)(a1 + 40);
  objc_msgSend(v19, "dispatchLightObserverMessage:sender:", v20, 0);

  objc_msgSend(v5, "finishWithNoResult");
}

void __94__HFActionSetValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_76(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "settings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lightProfile:didUpdateSettings:", v2, v4);

}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 lightProfile:(id)a4 completion:(id)a5
{
  FetchNaturalLightColorTemperatureForBrightness(a3, a4, a5);
}

- (id)_existingActionBuilderForLightProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__HFActionSetValueSource_HFLightProfileValueSource___existingActionBuilderForLightProfile___block_invoke;
  v10[3] = &unk_1EA729200;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __91__HFActionSetValueSource_HFLightProfileValueSource___existingActionBuilderForLightProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "lightProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HFActionSetValueSource)initWithActionSetBuilder:(id)a3
{
  id v4;
  HFActionSetValueSource *v5;
  HFActionSetValueSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFActionSetValueSource;
  v5 = -[HFActionSetValueSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HFActionSetValueSource setActionSetBuilder:](v5, "setActionSetBuilder:", v4);

  return v6;
}

- (HFActionSetValueSource)initWithActionSet:(id)a3
{
  id v4;
  HFActionSetValueSource *v5;
  HFActionSetValueSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFActionSetValueSource;
  v5 = -[HFActionSetValueSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HFActionSetValueSource setActionSet:](v5, "setActionSet:", v4);

  return v6;
}

- (id)readValuesForCharacteristics:(id)a3
{
  void *v3;
  HFCharacteristicBatchReadResponse *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HFActionSetValueSource_readValuesForCharacteristics___block_invoke;
  v7[3] = &unk_1EA737030;
  v7[4] = self;
  objc_msgSend(a3, "na_map:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFCharacteristicBatchReadResponse initWithReadResponses:contextProvider:]([HFCharacteristicBatchReadResponse alloc], "initWithReadResponses:contextProvider:", v3, 0);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

HFCharacteristicReadResponse *__55__HFActionSetValueSource_readValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  HFCharacteristicReadResponse *v5;
  void *v6;
  HFCharacteristicReadResponse *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_targetValueForCharacteristic:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HFCharacteristicReadResponse alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFCharacteristicReadResponse initWithCharacteristic:readTraits:value:error:](v5, "initWithCharacteristic:readTraits:value:error:", v3, v6, v4, 0);

  return v7;
}

- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HFCharacteristicBatchReadResponse *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  HFActionSetValueSource *v18;

  v6 = a3;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke;
  v16 = &unk_1EA7343A8;
  v17 = v6;
  v18 = self;
  v7 = v6;
  objc_msgSend(a4, "na_map:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_setByFlattening", v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HFCharacteristicBatchReadResponse initWithReadResponses:contextProvider:]([HFCharacteristicBatchReadResponse alloc], "initWithReadResponses:contextProvider:", v9, 0);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2;
  v11[3] = &unk_1EA72BB50;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v5, "na_filter:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_3;
  v10[3] = &unk_1EA737030;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "na_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

HFCharacteristicReadResponse *__70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  HFCharacteristicReadResponse *v5;
  void *v6;
  HFCharacteristicReadResponse *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_targetValueForCharacteristic:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HFCharacteristicReadResponse alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFCharacteristicReadResponse initWithCharacteristic:readTraits:value:error:](v5, "initWithCharacteristic:readTraits:value:error:", v3, v6, v4, 0);

  return v7;
}

- (id)writeValuesForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HFCharacteristicWriteActionBuilder *v18;
  void *v19;
  HFCharacteristicWriteActionBuilder *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(&CFSTR("Request to write without an actionSetBuilder. Note that writing to a HMActionSet directly with a HFActionSetV"
                 "alueSource is not supported").isa);
  -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __56__HFActionSetValueSource_writeValuesForCharacteristics___block_invoke;
    v68[3] = &unk_1EA7277C8;
    v68[4] = self;
    v47 = v4;
    v8 = v4;
    v69 = v8;
    objc_msgSend(v7, "dispatchHomeObserverMessage:sender:", v68, 0);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v53 = v8;
    objc_msgSend(v8, "allCharacteristics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v65;
      do
      {
        v14 = 0;
        v51 = v12;
        do
        {
          if (*(_QWORD *)v65 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v14);
          objc_msgSend(v53, "valueForCharacteristic:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            -[HFActionSetValueSource _existingActionBuilderForCharacteristic:](self, "_existingActionBuilderForCharacteristic:", v15);
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = (HFCharacteristicWriteActionBuilder *)v17;
              -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "updateAction:", v18);
            }
            else
            {
              v20 = [HFCharacteristicWriteActionBuilder alloc];
              -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "home");
              v22 = v13;
              v23 = v10;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[HFItemBuilder initWithHome:](v20, "initWithHome:", v24);

              v10 = v23;
              v13 = v22;
              v12 = v51;

              -[HFCharacteristicWriteActionBuilder setCharacteristic:](v18, "setCharacteristic:", v15);
              -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addAction:", v18);
            }

            -[HFCharacteristicWriteActionBuilder setTargetValue:](v18, "setTargetValue:", v16);
            objc_msgSend(v9, "addObject:", v18);
          }
          else
          {
            objc_msgSend(v15, "hf_prettyDescription");
            v18 = (HFCharacteristicWriteActionBuilder *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("No value set for characteristic: %@"), v18);
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      }
      while (v12);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v53, "allCharacteristics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    if (v50)
    {
      v26 = *(_QWORD *)v61;
      v27 = 0x1E0CBA000uLL;
      v48 = *(_QWORD *)v61;
      v49 = v25;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v61 != v26)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v53, "valueForCharacteristic:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v27 + 1112), "hf_powerStateCharacteristicTypes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "characteristicType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v30;
          if (objc_msgSend(v31, "containsObject:", v32))
          {
            v33 = objc_msgSend(v30, "isEqual:", MEMORY[0x1E0C9AAA0]);

            if (!v33)
              goto LABEL_38;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            objc_msgSend(v29, "service");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "characteristics");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v57;
              do
              {
                for (j = 0; j != v36; ++j)
                {
                  if (*(_QWORD *)v57 != v37)
                    objc_enumerationMutation(v31);
                  if (*(void **)(*((_QWORD *)&v56 + 1) + 8 * j) != v29)
                  {
                    -[HFActionSetValueSource _existingActionBuilderForCharacteristic:](self, "_existingActionBuilderForCharacteristic:");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v39)
                    {
                      -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "removeAction:", v39);

                      objc_msgSend(v9, "addObject:", v39);
                    }

                  }
                }
                v36 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
              }
              while (v36);
              v26 = v48;
              v25 = v49;
              v27 = 0x1E0CBA000;
            }
          }
          else
          {

          }
LABEL_38:

        }
        v50 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      }
      while (v50);
    }

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __56__HFActionSetValueSource_writeValuesForCharacteristics___block_invoke_2;
    v54[3] = &unk_1EA7277C8;
    v54[4] = self;
    v55 = v53;
    objc_msgSend(v41, "dispatchHomeObserverMessage:sender:", v54, 0);

    if (objc_msgSend(v9, "count"))
    {
      -[HFActionSetValueSource delegate](self, "delegate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_opt_respondsToSelector();

      if ((v43 & 1) != 0)
      {
        -[HFActionSetValueSource delegate](self, "delegate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "actionSetValueSource:didUpdateValuesForActionBuilders:", self, v9);

      }
    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v47;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v45;
}

void __56__HFActionSetValueSource_writeValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionSetBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allCharacteristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home:willWriteValuesForCharacteristics:", v4, v5);

  }
}

void __56__HFActionSetValueSource_writeValuesForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionSetBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allCharacteristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home:didWriteValuesForCharacteristics:failedCharacteristics:", v4, v5, v6);

  }
}

- (void)mediaValueUpdated:(id)a3 playbackState:(int64_t)a4 playbackArchive:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a5;
  objc_msgSend(a3, "hf_mediaRouteIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetValueSource _existingActionBuilderForMediaProfile:](self, "_existingActionBuilderForMediaProfile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "setTargetPlayState:", a4);
    if (a4 == 1)
      v10 = v16;
    else
      v10 = 0;
    objc_msgSend(v9, "setPlaybackArchive:", v10);
    -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateAction:", v9);

    -[HFActionSetValueSource delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[HFActionSetValueSource delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "actionSetValueSource:didUpdateValuesForActionBuilders:", self, v15);

    }
  }

}

- (id)cachedPlaybackStateWriteErrorForRouteID:(id)a3
{
  return 0;
}

- (BOOL)hasPendingWritesForRouteID:(id)a3
{
  return 0;
}

- (int64_t)lastPlaybackStateForProfileForRouteID:(id)a3
{
  void *v3;
  int64_t v4;

  if (!a3)
    return 0;
  -[HFActionSetValueSource _existingActionBuilderForMediaProfile:](self, "_existingActionBuilderForMediaProfile:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "targetPlayState");

  return v4;
}

- (id)mediaProfileContainerForRouteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    -[HFActionSetValueSource _existingActionBuilderForMediaProfile:](self, "_existingActionBuilderForMediaProfile:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__HFActionSetValueSource_mediaProfileContainerForRouteID___block_invoke;
    v9[3] = &unk_1EA72B900;
    v10 = v4;
    objc_msgSend(v6, "na_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __58__HFActionSetValueSource_mediaProfileContainerForRouteID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_mediaRouteIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)writePlaybackState:(int64_t)a3 playbackArchive:(id)a4 forRouteID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0D519C0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__HFActionSetValueSource_writePlaybackState_playbackArchive_forRouteID___block_invoke;
    v13[3] = &unk_1EA736BF0;
    objc_copyWeak(v16, &location);
    v14 = v9;
    v16[1] = (id)a3;
    v15 = v8;
    objc_msgSend(v10, "futureWithBlock:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __72__HFActionSetValueSource_writePlaybackState_playbackArchive_forRouteID___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_existingActionBuilderForMediaProfile:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mediaProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HFActionSetValueSource_writePlaybackState_playbackArchive_forRouteID___block_invoke_2;
  v10[3] = &unk_1EA72B900;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "mediaValueUpdated:playbackState:playbackArchive:", v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "finishWithNoResult");
}

uint64_t __72__HFActionSetValueSource_writePlaybackState_playbackArchive_forRouteID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_mediaRouteIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_existingActionBuilderForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HFActionSetValueSource__existingActionBuilderForCharacteristic___block_invoke;
  v10[3] = &unk_1EA729200;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __66__HFActionSetValueSource__existingActionBuilderForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "characteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_existingActionBuilderForMediaProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFActionSetValueSource actionSetBuilder](self, "actionSetBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HFActionSetValueSource__existingActionBuilderForMediaProfile___block_invoke;
  v10[3] = &unk_1EA729200;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __64__HFActionSetValueSource__existingActionBuilderForMediaProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "mediaProfiles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__HFActionSetValueSource__existingActionBuilderForMediaProfile___block_invoke_2;
    v7[3] = &unk_1EA72B900;
    v8 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "na_any:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __64__HFActionSetValueSource__existingActionBuilderForMediaProfile___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_mediaRouteIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_actionForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFActionSetValueSource actionSet](self, "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HFActionSetValueSource__actionForCharacteristic___block_invoke;
  v10[3] = &unk_1EA72BC40;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __51__HFActionSetValueSource__actionForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "characteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_targetValueForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  HFActionSetValueSource *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFActionSetValueSource _existingActionBuilderForCharacteristic:](self, "_existingActionBuilderForCharacteristic:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "targetValue"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[HFActionSetValueSource _actionForCharacteristic:](self, "_actionForCharacteristic:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "targetValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  v10 = *MEMORY[0x1E0CB8880];
  v27[0] = *MEMORY[0x1E0CB8890];
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v4, "characteristicType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "containsObject:", v13);

    if (!v14)
      goto LABEL_13;
    objc_msgSend(v4, "service");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56__HFActionSetValueSource__targetValueForCharacteristic___block_invoke;
    v24[3] = &unk_1EA737058;
    v25 = v11;
    v26 = self;
    +[HFTargetRangeUtilities targetValueForService:valueProvider:](HFTargetRangeUtilities, "targetValueForService:valueProvider:", v15, v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v4, "hf_defaultValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v7)
    {
LABEL_13:
      v16 = (void *)MEMORY[0x1E0CBA458];
      objc_msgSend(v4, "characteristicType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hf_targetStateCharacteristicTypeForCurrentStateCharacteristicType:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18
        && (objc_msgSend(v4, "service"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v19, "hf_characteristicOfType:", v18),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v19,
            v20))
      {
        -[HFActionSetValueSource _targetValueForCharacteristic:](self, "_targetValueForCharacteristic:", v20);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "characteristicType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CB8848]))
        {
          v22 = objc_msgSend(v7, "integerValue");

          if (v22 == 3)
          {

            v7 = &unk_1EA7CC580;
            goto LABEL_8;
          }
        }
        else
        {

        }
        if (v7)
          goto LABEL_8;
      }
      else
      {

      }
      if (!-[HFActionSetValueSource _isCurrentStateCharacteristic:](self, "_isCurrentStateCharacteristic:", v4)
        || (-[HFActionSetValueSource _valueForCurrentStateCharacteristic:](self, "_valueForCurrentStateCharacteristic:", v4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v4, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          objc_msgSend(v4, "value");
        else
          objc_msgSend(v4, "hf_defaultValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
LABEL_8:

  return v7;
}

id __56__HFActionSetValueSource__targetValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_targetValueForCharacteristic:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)_isCurrentStateCharacteristic:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB8840];
  v9 = *MEMORY[0x1E0CB8830];
  v10 = v3;
  v11 = *MEMORY[0x1E0CB8858];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristicType", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "containsObject:", v7);
  return (char)v4;
}

- (id)_valueForCurrentStateCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  _QWORD *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  uint64_t v24;
  void *v25;

  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicOfType:", *MEMORY[0x1E0CB8790]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    -[HFActionSetValueSource _targetValueForCharacteristic:](self, "_targetValueForCharacteristic:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v4, "characteristicType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8830]);

  if (v11)
  {
    v12 = &unk_1EA7CC580;
    if (v9)
      v12 = &unk_1EA7CC598;
    v13 = v12;
  }
  else
  {
    objc_msgSend(v4, "characteristicType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB8840]);

    if (v15)
    {
      v16 = (_QWORD *)MEMORY[0x1E0CB8AB8];
    }
    else
    {
      objc_msgSend(v4, "characteristicType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB8858]);

      if (!v18)
      {
        v13 = 0;
        goto LABEL_30;
      }
      v16 = (_QWORD *)MEMORY[0x1E0CB8AD0];
    }
    objc_msgSend(v5, "hf_characteristicOfType:", *v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HFActionSetValueSource _targetValueForCharacteristic:](self, "_targetValueForCharacteristic:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    if (v22)
      v23 = v9;
    else
      v23 = 0;
    if (v23 == 1)
    {
      v24 = objc_msgSend(v22, "integerValue");
      v25 = &unk_1EA7CC5B0;
      if (v24 == 1)
        v25 = &unk_1EA7CC598;
      if (v24 == 2)
        v13 = &unk_1EA7CC5C8;
      else
        v13 = v25;
    }
    else
    {
      v13 = &unk_1EA7CC580;
    }

  }
LABEL_30:

  return v13;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_272 != -1)
    dispatch_once(&_MergedGlobals_272, &__block_literal_global_35_3);
  return (NAIdentity *)(id)qword_1ED3792E0;
}

void __37__HFActionSetValueSource_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_40_5);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_41_1);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED3792E0;
  qword_1ED3792E0 = v3;

}

uint64_t __37__HFActionSetValueSource_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionSet");
}

uint64_t __37__HFActionSetValueSource_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionSetBuilder");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (HFActionSetBuilderProtocol)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (void)setActionSetBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetBuilder, a3);
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (void)setActionSet:(id)a3
{
  objc_storeStrong((id *)&self->_actionSet, a3);
}

- (HFActionSetValueSourceDelegate)delegate
{
  return (HFActionSetValueSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);
}

@end
