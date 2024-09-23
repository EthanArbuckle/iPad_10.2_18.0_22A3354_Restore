@implementation HFLightbulbControlItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HFLightbulbControlItem;
  -[HFControlItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HFLightbulbControlItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1EA72AF60;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

- (id)readValueAndPopulateStandardResults
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFLightbulbControlItem;
  -[HFControlItem readValueAndPopulateStandardResults](&v7, sel_readValueAndPopulateStandardResults);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HFLightbulbControlItem_readValueAndPopulateStandardResults__block_invoke;
  v6[3] = &unk_1EA728350;
  v6[4] = self;
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)optionsForPrimaryStateControlItem:(id)a3 incrementalCharacteristicType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HFLightbulbControlItem;
  objc_msgSendSuper2(&v9, sel_optionsForPrimaryStateControlItem_incrementalCharacteristicType_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readOnlyCharacteristicTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optionsByAddingCharacteristicTypes:forUsage:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readOnlyCharacteristicTypes
{
  if (qword_1ED3786D0 != -1)
    dispatch_once(&qword_1ED3786D0, &__block_literal_global_134_0);
  return (id)qword_1ED3786D8;
}

id __61__HFLightbulbControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_tintColorFromResults:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v6, CFSTR("tintColor"));
  objc_msgSend(*(id *)(a1 + 32), "_tintColorForNaturalLightFromResults:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HFLightbulbControlItem_readValueAndPopulateStandardResults__block_invoke_2;
  v11[3] = &unk_1EA72AFB0;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_tintColorForNaturalLightFromResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[HFControlItem valueSource](self, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F03F48D8))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKey:", CFSTR("characteristicValuesByType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB87C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HFControlItem valueSource](self, "valueSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryServiceDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serviceType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB9A70]))
  {
    v14 = objc_msgSend(v7, "isNaturalLightingEnabled");

    if (v14)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0D519C0]);

      v16 = objc_msgSend(v9, "integerValue");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__HFLightbulbControlItem__tintColorForNaturalLightFromResults___block_invoke;
      v18[3] = &unk_1EA72AF88;
      v10 = v15;
      v19 = v10;
      objc_msgSend(v7, "fetchNaturalLightColorTemperatureForBrightness:completion:", v16, v18);

    }
  }
  else
  {

  }
  return v10;
}

- (id)_tintColorFromResults:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  float v13;
  float v14;
  double v15;
  float v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  HFTemperatureColor *v23;
  HFTemperatureColor *v24;
  void *v25;
  float v26;

  objc_msgSend(a3, "objectForKey:", CFSTR("characteristicValuesByType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB8A00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB8810]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB88E8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem valueSource](self, "valueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryServiceDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB9A70]);

  if (!v11)
    goto LABEL_15;
  if (v7)
    v12 = v5 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v7)
    {
      objc_msgSend(v7, "floatValue");
      v21 = (float)(v13 / 360.0);
      v18 = (void *)MEMORY[0x1E0CEA478];
      v17 = 1.0;
LABEL_9:
      v19 = 1.0;
      v20 = 1.0;
      goto LABEL_10;
    }
    if (v6)
    {
      v23 = [HFTemperatureColor alloc];
      objc_msgSend(v6, "floatValue");
      v24 = -[HFTemperatureColor initWithTemperatureInMired:](v23, "initWithTemperatureInMired:");
      -[HFTemperatureColor hf_RGBColorRepresentation](v24, "hf_RGBColorRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UIColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    if (v5)
    {
      objc_msgSend(v5, "floatValue");
      v17 = (float)(v26 / 100.0);
      v18 = (void *)MEMORY[0x1E0CEA478];
      v21 = 1.0;
      goto LABEL_9;
    }
LABEL_15:
    v22 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v7, "floatValue");
  v15 = (float)(v14 / 360.0);
  objc_msgSend(v5, "floatValue");
  v17 = (float)(v16 / 100.0);
  v18 = (void *)MEMORY[0x1E0CEA478];
  v19 = 1.0;
  v20 = 1.0;
  v21 = v15;
LABEL_10:
  objc_msgSend(v18, "colorWithHue:saturation:brightness:alpha:", v21, v17, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v22;
}

id __61__HFLightbulbControlItem_readValueAndPopulateStandardResults__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "na_safeSetObject:forKey:", v3, CFSTR("tintColor"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__HFLightbulbControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(WeakRetained, "valueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F03F48D8))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "lightProfiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "unionSet:", v11);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __53__HFLightbulbControlItem_readOnlyCharacteristicTypes__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB8A00], *MEMORY[0x1E0CB8810], *MEMORY[0x1E0CB88E8], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3786D8;
  qword_1ED3786D8 = v0;

}

- (BOOL)supportsRGBColor
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  if (qword_1ED3786E0 != -1)
    dispatch_once(&qword_1ED3786E0, &__block_literal_global_136);
  v3 = (id)qword_1ED3786E8;
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicTypesForUsage:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isSubsetOfSet:", v5);

  return v6;
}

void __42__HFLightbulbControlItem_supportsRGBColor__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB88E8], *MEMORY[0x1E0CB8A00], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3786E8;
  qword_1ED3786E8 = v0;

}

uint64_t __63__HFLightbulbControlItem__tintColorForNaturalLightFromResults___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithResult:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

- (id)writeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    objc_opt_class();
    -[HFControlItem valueSource](self, "valueSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_opt_class();
    objc_msgSend(v7, "valueSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "originalValueSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "percentFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v13, "stringForNormalizedObjectValue:", v4);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = CFSTR("<no value>");
      }
      -[HFControlItem valueSource](self, "valueSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allServices");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "anyObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory(0x44uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v24 = v18;
        v25 = 2112;
        v26 = v14;
        v27 = 2112;
        v28 = objc_opt_class();
        _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "User changed brightness for light \"%@\". Value: \"%@\". Value Source: %@", buf, 0x20u);
      }

    }
  }
  v22.receiver = self;
  v22.super_class = (Class)HFLightbulbControlItem;
  -[HFIncrementalStateControlItem writeValue:](&v22, sel_writeValue_, v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
