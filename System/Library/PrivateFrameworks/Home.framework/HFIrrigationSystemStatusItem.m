@implementation HFIrrigationSystemStatusItem

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
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (id)*MEMORY[0x1E0CB9A50];
  objc_msgSend((id)objc_opt_class(), "characteristicTypesForServiceType:includingAssociatedTypes:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem filteredServicesOfTypes:containingCharacteristicTypes:](self, "filteredServicesOfTypes:containingCharacteristicTypes:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFStatusItem valueSource](self, "valueSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readValuesForCharacteristicTypes:inServices:", v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__HFIrrigationSystemStatusItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_1EA727A20;
  v13[4] = self;
  v14 = v4;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __60__HFIrrigationSystemStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v2, "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResultsForBatchReadResponse:serviceTypes:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hidden"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "BOOLValue");

  if ((_DWORD)v6)
  {
    v10 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithResult:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if ((unint64_t)objc_msgSend(v11, "count") > 1)
    {
      v15 = objc_msgSend(v11, "count");
      HFLocalizedStringWithFormat(CFSTR("HFStatusTitleIrrigationSystem_Multiple"), CFSTR("%lu"), v16, v17, v18, v19, v20, v21, v15);
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleIrrigationSystem_One"), CFSTR("HFStatusTitleIrrigationSystem_One"), 1);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("title"));

    if (v14 == 2)
      v23 = CFSTR("HFStatusDescriptionIrrigationSystem_Watering");
    else
      v23 = CFSTR("HFStatusDescriptionIrrigationSystem_Idle");
    _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("description"));

    v25 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "futureWithResult:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (NSSet)serviceTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A50]);
}

@end
