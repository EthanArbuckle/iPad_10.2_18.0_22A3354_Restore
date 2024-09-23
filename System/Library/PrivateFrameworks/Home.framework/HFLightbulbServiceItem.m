@implementation HFLightbulbServiceItem

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFPowerStateControlItem *v7;
  void *v8;
  void *v9;
  HFPowerStateControlItem *v10;
  void *v11;
  void *v12;
  HFColorControlItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HFLightbulbControlItem *v21;
  HFLightbulbControlItem *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [HFPowerStateControlItem alloc];
  v26 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFControlShortTitlePower"), CFSTR("HFControlShortTitlePower"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFPowerStateControlItem initWithValueSource:displayResults:](v7, "initWithValueSource:displayResults:", v6, v9);

  objc_msgSend(v5, "na_safeAddObject:", v10);
  v24[0] = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleColor"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = CFSTR("controlItemPurpose");
  v25[0] = v11;
  v25[1] = &unk_1EA7CD1E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HFColorControlItem initWithValueSource:displayResults:]([HFColorControlItem alloc], "initWithValueSource:displayResults:", v6, v12);
  v14 = (void *)MEMORY[0x1E0C99E08];
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleBrightness"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "dictionaryWithObject:forKey:", v15, CFSTR("title"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFControlItem characteristicOptions](v13, "characteristicOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allCharacteristicTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("tintColor"));

    objc_msgSend(v5, "na_safeAddObject:", v13);
  }
  v21 = [HFLightbulbControlItem alloc];
  v22 = -[HFIncrementalStateControlItem initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:](v21, "initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:", v6, v10, *MEMORY[0x1E0CB87C0], v16);
  objc_msgSend(v5, "na_safeAddObject:", v22);

  return v5;
}

id __54__HFLightbulbServiceItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "readResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseForCharacteristicType:", *MEMORY[0x1E0CB89C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseForCharacteristicType:", *MEMORY[0x1E0CB87C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characteristic");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  if (+[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics"))
  {
    HFLogForCategory(0x38uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v38 = v11;
      v39 = 2112;
      v40 = v34;
      v41 = 2112;
      v42 = v8;
      v43 = 2112;
      v44 = v12;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "%@ read power state %@, brightness %@ in item: %@", buf, 0x2Au);

      v6 = v34;
    }

  }
  if (v8 && !objc_msgSend(v8, "intValue") && objc_msgSend(v6, "BOOLValue"))
  {
    HFLogForCategory(0x38uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v38 = v15;
      v39 = 2112;
      v40 = v8;
      v41 = 2112;
      v42 = &unk_1EA7CD1C8;
      v43 = 2112;
      v44 = v16;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "%@ overriding brightness from %@ to %@ in item: %@", buf, 0x2Au);

      v6 = v34;
    }

    v8 = &unk_1EA7CD1C8;
  }
  objc_msgSend(v2, "standardResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v2, "displayMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "primaryState");
  if (v8)
  {
    v21 = &unk_1EA7CD1F8;
    if (v20 == 2)
      v21 = v8;
    v22 = v21;
    objc_msgSend(v35, "metadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hf_percentageForCharacteristicValue:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("subPriority"));
    objc_msgSend(*(id *)(a1 + 32), "descriptionForCharacteristic:withValue:", v35, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("description"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      if (v25 && v20 == 2)
      {
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("description"));
        goto LABEL_22;
      }
      if (v34)
      {
        objc_msgSend(*(id *)(a1 + 32), "descriptionForCharacteristic:withValue:", v5);
        v32 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "na_safeSetObject:forKey:", v32, CFSTR("description"));
        v25 = (void *)v32;
      }
    }
    if (v20 == 1)
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicTitleIncrementalStateOff"), CFSTR("HFCharacteristicTitleIncrementalStateOff"), 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:
    objc_msgSend(*(id *)(a1 + 32), "controlDescriptionForCharacteristic:withValue:", v35, v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (!v6)
  {
    v27 = 0;
    v24 = 0;
    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 32), "controlDescriptionForCharacteristic:withValue:", v5, v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "descriptionForCharacteristic:withValue:", v5, v6);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_safeSetObject:forKey:", v22, CFSTR("description"));
  v24 = 0;
LABEL_24:

  v6 = v34;
LABEL_25:
  objc_msgSend(v18, "na_safeSetObject:forKey:", v27, CFSTR("controlDescription"));
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v18);
  v28 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "futureWithResult:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)supportedServiceTypes
{
  if (_MergedGlobals_308 != -1)
    dispatch_once(&_MergedGlobals_308, &__block_literal_global_3_16);
  return (id)qword_1ED379C28;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  if (qword_1ED379C30 != -1)
    dispatch_once(&qword_1ED379C30, &__block_literal_global_19_13);
  v5 = (id)qword_1ED379C38;
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HFLightbulbServiceItem__subclass_updateWithOptions___block_invoke_3;
  v9[3] = &unk_1EA726480;
  v9[4] = self;
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__HFLightbulbServiceItem_supportedServiceTypes__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A70]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379C28;
  qword_1ED379C28 = v0;

}

void __54__HFLightbulbServiceItem__subclass_updateWithOptions___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB89C8], *MEMORY[0x1E0CB87C0], *MEMORY[0x1E0CB8A00], *MEMORY[0x1E0CB8810], *MEMORY[0x1E0CB88E8], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379C38;
  qword_1ED379C38 = v0;

}

- (BOOL)containsActions
{
  return 1;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  HFNaturalLightingActionBuilder *v9;
  void *v10;
  HFNaturalLightingActionBuilder *v11;
  void *v12;
  _QWORD v14[4];
  HFNaturalLightingActionBuilder *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFLightbulbServiceItem;
  -[HFServiceItem currentStateActionBuildersForHome:](&v16, sel_currentStateActionBuildersForHome_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFLightbulbServiceItem lightProfile](self, "lightProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportedFeatures");

  if ((v8 & 1) != 0)
  {
    v9 = -[HFItemBuilder initWithHome:]([HFNaturalLightingActionBuilder alloc], "initWithHome:", v4);
    -[HFNaturalLightingActionBuilder setLightProfile:](v9, "setLightProfile:", v6);
    objc_msgSend(v6, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNaturalLightingActionBuilder setNaturalLightEnabled:](v9, "setNaturalLightEnabled:", objc_msgSend(v10, "isNaturalLightingEnabled"));

  }
  else
  {
    v9 = 0;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__HFLightbulbServiceItem_currentStateActionBuildersForHome___block_invoke;
  v14[3] = &unk_1EA736180;
  v15 = v9;
  v11 = v9;
  objc_msgSend(v5, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __60__HFLightbulbServiceItem_currentStateActionBuildersForHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "na_safeAddObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lightProfile
{
  void *v2;
  void *v3;
  void *v4;

  -[HFServiceItem service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_lightProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    NSLog(CFSTR("Only expected one light profile per service. %@"), v3);
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
