@implementation HFAccessoryBatteryLevelItem

id __59__HFAccessoryBatteryLevelItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HFMutableItemUpdateOutcome *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a2;
  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  objc_msgSend(v3, "responseForCharacteristicType:", *MEMORY[0x1E0CB8A60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C9AAA0];
  v8 = MEMORY[0x1E0C9AAB0];
  if (v6)
  {
    if (objc_msgSend(v6, "unsignedIntegerValue") == 1)
      v9 = v8;
    else
      v9 = v7;
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, CFSTR("batteryLow"));
  }
  objc_msgSend(v3, "responseForCharacteristicType:", *MEMORY[0x1E0CB8808]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithExpectedClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v11, "unsignedIntegerValue") == 1)
      v12 = v8;
    else
      v12 = v7;
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("batteryCharging"));
  }
  objc_msgSend(v3, "responseForCharacteristicType:", *MEMORY[0x1E0CB87B8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueWithExpectedClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_percentageForCharacteristicValue:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, CFSTR("batteryPercentage"));

  }
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("dependentHomeKitObjects"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __59__HFAccessoryBatteryLevelItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB99B8]);

  return v3;
}

- (HFAccessoryBatteryLevelItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  id v7;
  id v8;
  HFAccessoryBatteryLevelItem *v9;
  HFAccessoryBatteryLevelItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFAccessoryBatteryLevelItem;
  v9 = -[HFAccessoryBatteryLevelItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
  }

  return v10;
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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFAccessoryBatteryLevelItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessoryBatteryDesiredKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB87B8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || objc_msgSend(v8, "containsObject:", CFSTR("batteryPercentage")))
    objc_msgSend(v9, "na_safeAddObject:", v10);
  objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8808]);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v8 || objc_msgSend(v8, "containsObject:", CFSTR("batteryCharging")))
    objc_msgSend(v9, "na_safeAddObject:", v11);
  v30 = (void *)v11;
  v12 = *MEMORY[0x1E0CB8A60];
  objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8A60]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[HFAccessoryBatteryLevelItem accessory](self, "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "services");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v16)
    {
      v17 = v16;
      v28 = v10;
      v29 = v4;
      v18 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "hf_characteristicOfType:", v12);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v13 = (void *)v20;
            goto LABEL_20;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v17)
          continue;
        break;
      }
      v13 = 0;
LABEL_20:
      v10 = v28;
      v4 = v29;
    }
    else
    {
      v13 = 0;
    }

    if (!v8)
      goto LABEL_24;
LABEL_23:
    if (!objc_msgSend(v8, "containsObject:", CFSTR("batteryLow")))
      goto LABEL_25;
    goto LABEL_24;
  }
  if (v8)
    goto LABEL_23;
LABEL_24:
  objc_msgSend(v9, "na_safeAddObject:", v13);
LABEL_25:
  objc_msgSend(v4, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0D519C0];
    v38[0] = CFSTR("dependentHomeKitObjects");
    v38[1] = CFSTR("hidden");
    v39[0] = v9;
    v39[1] = MEMORY[0x1E0C9AAB0];
    v38[2] = CFSTR("readsSkipped");
    v39[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "futureWithResult:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFAccessoryBatteryLevelItem valueSource](self, "valueSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "readValuesForCharacteristics:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __59__HFAccessoryBatteryLevelItem__subclass_updateWithOptions___block_invoke_2;
    v31[3] = &unk_1EA727A20;
    v32 = v10;
    v33 = v9;
    objc_msgSend(v25, "flatMap:", v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFAccessoryBatteryLevelItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryBatteryLevelItem valueSource](self, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithAccessory:valueSource:", v5, v6);

  return v7;
}

@end
