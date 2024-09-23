@implementation HKMedicationSchedule

uint64_t __101__HKMedicationSchedule_HDCodingSupport__hd_medicationSchedulesFromCodables_profile_ignoreDuplicates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  uint64_t v24;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      v24 = v4;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        if (!*(_BYTE *)(a1 + 56) || (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v6), "duplicate") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "legacySyncIdentity");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v7, "hasSyncIdentity"))
          {
            v10 = v5;
            v11 = (void *)MEMORY[0x1E0D295A0];
            objc_msgSend(v7, "syncIdentity");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 0;
            objc_msgSend(v11, "syncIdentityWithCodable:error:", v12, &v27);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v27;

            if (v13)
            {
              objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v14;
              objc_msgSend(v15, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v13, 1, v23, &v26);
              v16 = objc_claimAutoreleasedReturnValue();
              v17 = v26;

              if (v16)
              {

                v9 = (void *)v16;
                v5 = v10;
                v4 = v24;
                goto LABEL_12;
              }
              _HKInitializeLogging();
              v21 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                v33 = v17;
                _os_log_fault_impl(&dword_1B815E000, v21, OS_LOG_TYPE_FAULT, "MedicationSchedule ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
              }
              v9 = 0;
              v14 = v17;
            }
            else
            {
              _HKInitializeLogging();
              v20 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                v33 = v14;
                _os_log_fault_impl(&dword_1B815E000, v20, OS_LOG_TYPE_FAULT, "MedicationSchedule SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
              }
            }
            v5 = v10;
            v4 = v24;
          }
          else
          {
LABEL_12:
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v9);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v9);
              v14 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D2C480], "hd_medicationScheduleFromCodable:", v7);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v13);
            }
            else
            {
              v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
              objc_msgSend(MEMORY[0x1E0D2C480], "hd_medicationScheduleFromCodable:", v7);
              v14 = (id)objc_claimAutoreleasedReturnValue();
              v13 = (void *)objc_msgSend(v19, "initWithObjects:", v14, 0);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v13, v9);
            }
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v4);
  }

  return 1;
}

+ (id)_medicationScheduleIntervalDataFromCodable:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "hk_map:", &__block_literal_global);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_codableArrayForMedicationScheduleIntervalDatas:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_218);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __84__HKMedicationSchedule_HDCodingSupport___medicationScheduleIntervalDataFromCodable___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D2C4A0], "hd_medicationScheduleIntervalDataFromCodable:", a2);
}

uint64_t __89__HKMedicationSchedule_HDCodingSupport___codableArrayForMedicationScheduleIntervalDatas___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hd_codableFromIntervalData");
}

@end
