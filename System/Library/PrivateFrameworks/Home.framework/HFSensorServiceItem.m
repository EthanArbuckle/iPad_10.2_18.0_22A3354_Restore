@implementation HFSensorServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_sensorServiceTypes");
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  HFSensorServiceItem *v16;

  v4 = (void *)MEMORY[0x1E0CBA7E0];
  v5 = a3;
  -[HFServiceItem service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_sensorCharacteristicTypeForServiceType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__HFSensorServiceItem__subclass_updateWithOptions___block_invoke;
  v14[3] = &unk_1EA72A770;
  v15 = v8;
  v16 = self;
  v11 = v8;
  objc_msgSend(v10, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __51__HFSensorServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "standardResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "displayMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "primaryState");

    if (v10 == 2)
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAbnormalSensor"), CFSTR("HFServiceDescriptionAbnormalSensor"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = *MEMORY[0x1E0CB8820];
    v28[0] = *MEMORY[0x1E0CB87B0];
    v28[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", *(_QWORD *)(a1 + 32));

    if (v14)
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend(v5, "characteristic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "descriptionForCharacteristic:withValue:", v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v18;
    }
    if (v11)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("description"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("description"));
    }
    v20 = *(void **)(a1 + 40);
    objc_msgSend(v5, "characteristic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "controlDescriptionForCharacteristic:withValue:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "na_safeSetObject:forKey:", v23, CFSTR("controlDescription"));
  }
  objc_msgSend(*(id *)(a1 + 40), "applyInflectionToDescriptions:", v7);
  v24 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "futureWithResult:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
