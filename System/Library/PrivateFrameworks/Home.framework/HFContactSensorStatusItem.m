@implementation HFContactSensorStatusItem

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleContactSensor_One"), CFSTR("HFStatusTitleContactSensor_One"), 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v5 = objc_msgSend(v3, "count");
    HFLocalizedStringWithFormat(CFSTR("HFStatusTitleContactSensor_Multiple"), CFSTR("%lu"), v6, v7, v8, v9, v10, v11, v5);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v4;
LABEL_7:

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "serviceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "characteristicTypesForServiceType:includingAssociatedTypes:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem filteredServicesOfTypes:containingCharacteristicTypes:](self, "filteredServicesOfTypes:containingCharacteristicTypes:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HFStatusItem valueSource](self, "valueSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "readValuesForCharacteristicTypes:inServices:", v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__HFContactSensorStatusItem__subclass_updateWithOptions___block_invoke;
  v16[3] = &unk_1EA72BA38;
  objc_copyWeak(&v18, &location);
  v13 = v6;
  v17 = v13;
  objc_msgSend(v12, "flatMap:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

+ (NSSet)serviceTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB99F0]);
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  return -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", CFSTR("contact.sensor.fill"));
}

id __57__HFContactSensorStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
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
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "standardResultsForBatchReadResponse:serviceTypes:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hidden"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v8, "BOOLValue");

    if ((_DWORD)v6)
    {
      v9 = (void *)MEMORY[0x1E0D519C0];
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "futureWithResult:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

      goto LABEL_23;
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v3, "allServices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __57__HFContactSensorStatusItem__subclass_updateWithOptions___block_invoke_2;
    v37[3] = &unk_1EA737C50;
    v38 = v3;
    v10 = v15;
    v39 = v10;
    v18 = v16;
    v40 = v18;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v37);

    if (objc_msgSend(v10, "count"))
    {
      if (objc_msgSend(v10, "count") == 1)
        v19 = CFSTR("HFStatusTitleContactSensor_One");
      else
        v19 = CFSTR("HFStatusTitleContactSensor_Multiple");
      _HFLocalizedStringWithDefaultValue(v19, v19, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("HFStatusDescriptionContactSensor_Open");
      v22 = v10;
    }
    else
    {
      if (!objc_msgSend(v18, "count"))
      {
        v20 = 0;
        v32 = 0;
        v31 = 0;
        goto LABEL_16;
      }
      if (objc_msgSend(v18, "count") == 1)
        v23 = CFSTR("HFStatusTitleContactSensor_One");
      else
        v23 = CFSTR("HFStatusTitleContactSensor_Multiple");
      _HFLocalizedStringWithDefaultValue(v23, v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("HFStatusDescriptionContactSensor_Closed");
      v22 = v18;
    }
    v24 = objc_msgSend(v22, "count");
    HFLocalizedStringWithFormat(v21, CFSTR("%lu"), v25, v26, v27, v28, v29, v30, v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v22;
LABEL_16:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("openServices"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("closedServices"));
    if (v20)
    {
      if (objc_msgSend(v32, "count") == 1)
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("title"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%lu"), 0, objc_msgSend(v32, "count"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("title"));

      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("description"));
    }
    v34 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "futureWithResult:", v35);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  v12 = (void *)MEMORY[0x1E0D519C0];
  v41 = CFSTR("hidden");
  v42[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v11;
}

void __57__HFContactSensorStatusItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a1[4], "batchResponseForService:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCharacteristicValueDisplayMetadata displayMetadataForService:characteristicReadResponse:](HFCharacteristicValueDisplayMetadata, "displayMetadataForService:characteristicReadResponse:", v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "primaryState") == 2)
  {
    v5 = a1 + 5;
LABEL_5:
    objc_msgSend(*v5, "addObject:", v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "primaryState") == 1)
  {
    v5 = a1 + 6;
    goto LABEL_5;
  }
LABEL_6:

}

@end
