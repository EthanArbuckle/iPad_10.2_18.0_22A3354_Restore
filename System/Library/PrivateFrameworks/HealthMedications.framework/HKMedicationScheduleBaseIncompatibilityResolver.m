@implementation HKMedicationScheduleBaseIncompatibilityResolver

- (HKMedicationScheduleBaseIncompatibilityResolver)init
{
  HKMedicationScheduleBaseIncompatibilityResolver *v2;
  uint64_t v3;
  NSDictionary *unitTestScheduleCompatibilityRanges;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMedicationScheduleBaseIncompatibilityResolver;
  v2 = -[HKMedicationScheduleBaseIncompatibilityResolver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    unitTestScheduleCompatibilityRanges = v2->_unitTestScheduleCompatibilityRanges;
    v2->_unitTestScheduleCompatibilityRanges = (NSDictionary *)v3;

  }
  return v2;
}

+ (id)computeIncompatibleSchedulesFromSchedules:(id)a3 devices:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  HKMedicationScheduleIncompatibilityResult *v18;
  id v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = a4;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isUnavailable") & 1) == 0)
        {
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v12 = v21;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v24 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                if ((objc_msgSend(v17, "isCompatibleWithSchedule:", v10) & 1) == 0)
                  objc_msgSend(v11, "addObject:", v17);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v14);
          }

          if (objc_msgSend(v11, "count"))
          {
            v18 = -[HKMedicationScheduleIncompatibilityResult initWithSchedule:incompatibleDevices:]([HKMedicationScheduleIncompatibilityResult alloc], "initWithSchedule:incompatibleDevices:", v10, v11);
            objc_msgSend(v20, "addObject:", v18);

          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  return v20;
}

- (void)_resolveIncompatibleScheduleResultsFromSchedules:(id)a3 scheduleError:(id)a4 devices:(id)a5 deviceError:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;

  v12 = a3;
  v24 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *, _QWORD))a7;
  if (v12)
  {
    if (v13)
    {
      objc_msgSend(v13, "hk_filter:", &__block_literal_global);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary allKeys](self->_unitTestScheduleCompatibilityRanges, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        -[HKMedicationScheduleBaseIncompatibilityResolver _updatedSchedules:withReplacementCompatibilityRanges:](self, v12);
        v19 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v19;
      }
      objc_msgSend((id)objc_opt_class(), "computeIncompatibleSchedulesFromSchedules:devices:", v12, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v20, 0);

    }
    else
    {
      if (v14)
      {
        v22 = v14;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 0, CFSTR("Unknown error occured while fetching Apple Account devices"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      v23 = v22;
      ((void (**)(id, void *, id))v15)[2](v15, 0, v22);

    }
  }
  else
  {
    if (v24)
    {
      v21 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 0, CFSTR("Unknown error occured while fetching schedules"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v21;
    ((void (**)(id, void *, id))v15)[2](v15, 0, v21);
  }

}

BOOL __145__HKMedicationScheduleBaseIncompatibilityResolver__resolveIncompatibleScheduleResultsFromSchedules_scheduleError_devices_deviceError_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "deviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (unint64_t)objc_msgSend(v2, "integerValue") < 3;
  else
    v4 = 0;

  return v4;
}

- (id)_updatedSchedules:(void *)a1 withReplacementCompatibilityRanges:(void *)a2
{
  _QWORD v3[5];

  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __104__HKMedicationScheduleBaseIncompatibilityResolver__updatedSchedules_withReplacementCompatibilityRanges___block_invoke;
    v3[3] = &unk_1E6CD4FD0;
    v3[4] = a1;
    objc_msgSend(a2, "hk_map:", v3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id __104__HKMedicationScheduleBaseIncompatibilityResolver__updatedSchedules_withReplacementCompatibilityRanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (id)objc_msgSend(v3, "_copyByReplacingCompatibilityVersionRange:", objc_msgSend(v6, "integerValue"), objc_msgSend(v6, "integerValue"));
  else
    v7 = v3;
  v8 = v7;

  return v8;
}

- (void)_unitTest_setScheduleCompatibilityRanges:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestScheduleCompatibilityRanges, a3);
}

- (NSDictionary)unitTestScheduleCompatibilityRanges
{
  return self->_unitTestScheduleCompatibilityRanges;
}

- (void)setUnitTestScheduleCompatibilityRanges:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestScheduleCompatibilityRanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestScheduleCompatibilityRanges, 0);
}

- (void)checkIncompatibilityForSchedule:(id)a3 completion:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
