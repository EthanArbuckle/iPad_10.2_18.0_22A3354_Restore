@implementation HFLightSensorStatusItem

+ (NSSet)serviceTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A68]);
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleLightSensor"), CFSTR("HFStatusTitleLightSensor"), 1);
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  void *v3;
  HFImageIconDescriptor *v4;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", a3, 24.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("sun.max.circle.fill"), v3);

  return v4;
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
  v16[2] = __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke;
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

id __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
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
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
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
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "futureWithResult:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "servicesWithValuesPassingTest:forCharacteristicType:", &__block_literal_global_43, *MEMORY[0x1E0CB8860]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v29 = 0;
        v30 = (double *)&v29;
        v31 = 0x2020000000;
        v32 = 0;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke_3;
        v26[3] = &unk_1EA72BA10;
        v27 = v3;
        v28 = &v29;
        objc_msgSend(v14, "na_each:", v26);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30[3] / (double)(unint64_t)objc_msgSend(v14, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "luxFormatter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "numberFormatter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setUsesSignificantDigits:", 0);

        objc_msgSend(v15, "doubleValue");
        v20 = v19;
        objc_msgSend(v17, "numberFormatter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setMaximumFractionDigits:", v20 < 1.0);

        objc_msgSend(v17, "stringForObjectValue:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("description"));

        _Block_object_dispose(&v29, 8);
      }
      v23 = (void *)MEMORY[0x1E0D519C0];
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "futureWithResult:", v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D519C0];
    v33 = CFSTR("hidden");
    v34[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithResult:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

BOOL __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 != 0;
}

void __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "responseForCharacteristicType:inService:", *MEMORY[0x1E0CB8860], a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithExpectedClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

@end
