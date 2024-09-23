@implementation HFThermostatServiceItem

id __55__HFThermostatServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  HFTemperatureIconDescriptor *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8848]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithExpectedClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "standardResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "temperatureFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setInputIsCelsius:", 1);
  v28 = 0;
  v29 = 0;
  v27 = 0;
  objc_msgSend(*(id *)(a1 + 32), "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFThermostatItemUtilities getDescription:controlDescription:optionalDescriptions:forResponse:primaryService:temperatureFormatter:](HFThermostatItemUtilities, "getDescription:controlDescription:optionalDescriptions:forResponse:primaryService:temperatureFormatter:", &v29, &v28, &v27, v4, v13, v12);
  v14 = v29;
  v15 = v28;
  v16 = v27;

  if (v14)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("description"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("description"));
  }
  objc_msgSend(v10, "na_safeSetObject:forKey:", v15, CFSTR("controlDescription"));
  objc_msgSend(v10, "addEntriesFromDictionary:", v16);
  objc_msgSend(v12, "stringForObjectValue:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v6;
  v19 = -[HFTemperatureIconDescriptor initWithFormattedTemperature:heatingCoolingMode:targetHeatingCoolingMode:]([HFTemperatureIconDescriptor alloc], "initWithFormattedTemperature:heatingCoolingMode:targetHeatingCoolingMode:", v18, objc_msgSend(v25, "integerValue"), objc_msgSend(v26, "integerValue"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("icon"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("tempreatureUnitDependency"));
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v10);
  v20 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "futureWithResult:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFTemperatureThresholdControlItem *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HFSimpleIncrementalControlItem *v11;
  HFSimpleIncrementalControlItem *v12;
  HFTemperatureUnitControlItem *v13;
  void *v14;
  void *v15;
  void *v16;
  HFMultiStateValueSet *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  HFMultiStateControlItem *v29;
  void *v30;
  HFSimpleIncrementalControlItem *v31;
  void *v32;
  HFMultiStateControlItem *v33;
  uint64_t v35;
  HFTemperatureUnitControlItem *v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [HFTemperatureThresholdControlItem alloc];
  v48 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleTemperature"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFTemperatureThresholdControlItem initWithValueSource:displayResults:](v7, "initWithValueSource:displayResults:", v6, v9);

  v37 = (void *)v10;
  objc_msgSend(v5, "na_safeAddObject:", v10);
  v11 = [HFSimpleIncrementalControlItem alloc];
  v12 = -[HFSimpleIncrementalControlItem initWithValueSource:characteristicType:displayResults:](v11, "initWithValueSource:characteristicType:displayResults:", v6, *MEMORY[0x1E0CB8AF8], 0);
  objc_msgSend(v5, "addObject:", v12);
  v13 = [HFTemperatureUnitControlItem alloc];
  v36 = -[HFTemperatureUnitControlItem initWithValueSource:characteristicType:displayResults:](v13, "initWithValueSource:characteristicType:displayResults:", v6, *MEMORY[0x1E0CB8B20], 0);
  objc_msgSend(v5, "addObject:");
  -[HFServiceItem service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x1E0CB8AC0];
  objc_msgSend(v14, "hf_characteristicOfType:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HFMultiStateValueSet initWithCharacteristicMetadata:]([HFMultiStateValueSet alloc], "initWithCharacteristicMetadata:", v16);
  v46 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceThermostatModeOff"), v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v17, "addValue:displayResults:", &unk_1EA7CB770, v19);

  v44 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceThermostatModeHeat"), v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v17, "addValue:displayResults:", &unk_1EA7CB788, v21);

  v42 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceThermostatModeCool"), v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v17, "addValue:displayResults:", &unk_1EA7CB7A0, v23);

  v40 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceThermostatModeAuto"), v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v17, "addValue:displayResults:", &unk_1EA7CB7B8, v25);

  -[HFMultiStateValueSet allValues](v17, "allValues");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27 >= 2)
  {
    +[HFUtilities comparatorWithSortedObjects:](HFUtilities, "comparatorWithSortedObjects:", &unk_1EA7CDCA8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMultiStateValueSet setValueComparator:](v17, "setValueComparator:", v28);

    v29 = [HFMultiStateControlItem alloc];
    v38[0] = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleHeatingCoolingMode"), v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = CFSTR("controlItemPurpose");
    v39[0] = v30;
    v39[1] = &unk_1EA7CB7D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v31 = v12;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v29, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v6, v35, v17, v32);

    v12 = v31;
    objc_msgSend(v5, "addObject:", v33);

  }
  return v5;
}

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9B00]);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8B08];
  v16[0] = *MEMORY[0x1E0CB8890];
  v16[1] = v5;
  v6 = *MEMORY[0x1E0CB8AC0];
  v16[2] = *MEMORY[0x1E0CB8848];
  v16[3] = v6;
  v7 = *MEMORY[0x1E0CB88D8];
  v16[4] = *MEMORY[0x1E0CB8828];
  v16[5] = v7;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v16, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__HFThermostatServiceItem__subclass_updateWithOptions___block_invoke;
  v15[3] = &unk_1EA726480;
  v15[4] = self;
  objc_msgSend(v12, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
