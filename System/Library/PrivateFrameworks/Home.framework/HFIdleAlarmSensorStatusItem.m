@implementation HFIdleAlarmSensorStatusItem

+ (id)statusItemClasses
{
  if (_MergedGlobals_269 != -1)
    dispatch_once(&_MergedGlobals_269, &__block_literal_global_2_18);
  return (id)qword_1ED379220;
}

void __48__HFIdleAlarmSensorStatusItem_statusItemClasses__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379220;
  qword_1ED379220 = v2;

}

+ (id)sortKey
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyIdleAlarmSensors"), CFSTR("HFStatusSortKeyIdleAlarmSensors"), 1);
}

- (BOOL)shouldEncapsulateItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFIdleAlarmSensorStatusItem;
  if (-[HFAbstractGroupedStatusItem shouldEncapsulateItem:](&v9, sel_shouldEncapsulateItem_, v4))
  {
    objc_msgSend(v4, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priority"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue") == -1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  return -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", CFSTR("sensor.fill"));
}

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
  v10.super_class = (Class)HFIdleAlarmSensorStatusItem;
  -[HFAbstractGroupedStatusItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HFIdleAlarmSensorStatusItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1EA72AF60;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __59__HFIdleAlarmSensorStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  HFImageIconDescriptor *v30;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hidden"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      if (objc_msgSend(v9, "count") == 1)
      {
        objc_msgSend(WeakRetained, "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "anyObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "latestResults");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("title"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "items");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "anyObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "latestResults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("description"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleIdleAlarmSensors_One_Legacy"), CFSTR("HFStatusTitleIdleAlarmSensors_One_Legacy"), 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "shortTitleForFormat:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("shortTitle"));

      }
      else
      {
        v20 = objc_msgSend(v9, "count");
        HFLocalizedStringWithFormat(CFSTR("HFStatusIdleAlarm_Multiple"), CFSTR("%lu"), v21, v22, v23, v24, v25, v26, v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsSeparatedByCharactersInSet:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v29, "count") < 2)
        {
          v17 = 0;
        }
        else
        {
          objc_msgSend(v29, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("description"));
      v30 = -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", CFSTR("sensor.fill"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("icon"));

      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("title"));
    }
    else
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
