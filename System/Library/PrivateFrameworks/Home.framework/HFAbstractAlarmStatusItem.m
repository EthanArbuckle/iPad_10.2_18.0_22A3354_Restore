@implementation HFAbstractAlarmStatusItem

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
  v16[2] = __57__HFAbstractAlarmStatusItem__subclass_updateWithOptions___block_invoke;
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

id __57__HFAbstractAlarmStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
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
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_sensorCharacteristicTypeForServiceType:", *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "servicesWithValuesPassingTest:forCharacteristicType:", &__block_literal_global_165, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "iconDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("description"));

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA7CCBC8, CFSTR("badge"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA7CCBE0, CFSTR("statusItemCategory"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("statusRepresentedHomeKitObjects"));
      objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_roomsForServices:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count") == 1)
      {
        objc_msgSend(WeakRetained, "room");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(WeakRetained, "statusDescriptionOneTriggered");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v17, "anyObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        objc_msgSend(WeakRetained, "statusDescriptionMultipleTriggered:", objc_msgSend(v17, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("description"));

    }
    else
    {
      if (objc_msgSend(v10, "count"))
      {
LABEL_16:
        v21 = (void *)MEMORY[0x1E0D519C0];
        +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "futureWithResult:", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      objc_msgSend(WeakRetained, "statusDescriptionAllNormal");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("description"));
    }

    goto LABEL_16;
  }
  v12 = (void *)MEMORY[0x1E0D519C0];
  v24 = CFSTR("hidden");
  v25[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v11;
}

BOOL __57__HFAbstractAlarmStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "integerValue") > 0;
}

+ (NSSet)serviceTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAlarmStatusItem.m"), 80, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractAlarmStatusItem serviceTypes]", objc_opt_class());

  return 0;
}

- (id)iconDescription
{
  return 0;
}

- (id)statusDescriptionAllNormal
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAlarmStatusItem.m"), 91, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractAlarmStatusItem statusDescriptionAllNormal]", objc_opt_class());

  return 0;
}

- (id)statusDescriptionOneTriggered
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAlarmStatusItem.m"), 97, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractAlarmStatusItem statusDescriptionOneTriggered]", objc_opt_class());

  return 0;
}

- (id)statusDescriptionMultipleTriggered:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAlarmStatusItem.m"), 103, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractAlarmStatusItem statusDescriptionMultipleTriggered:]", objc_opt_class());

  return 0;
}

@end
