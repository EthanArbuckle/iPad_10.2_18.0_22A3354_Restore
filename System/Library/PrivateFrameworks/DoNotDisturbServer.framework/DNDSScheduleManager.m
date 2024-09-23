@implementation DNDSScheduleManager

- (DNDSScheduleManager)initWithModeAssertionManager:(id)a3
{
  id v5;
  DNDSScheduleManager *v6;
  DNDSScheduleManager *v7;
  uint64_t v8;
  NSMutableDictionary *currentScheduleSettingsByModeIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSScheduleManager;
  v6 = -[DNDSScheduleManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modeAssertionManager, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    currentScheduleSettingsByModeIdentifier = v7->_currentScheduleSettingsByModeIdentifier;
    v7->_currentScheduleSettingsByModeIdentifier = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)refresh
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Unable to update assertions for schedule: error=%{public}@, settings=%{public}@", (uint8_t *)&v4, 0x16u);
}

uint64_t __30__DNDSScheduleManager_refresh__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleSettingsByModeIdentifierForScheduleManager:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 32), "_refreshWithScheduleSettingsByModeIdentifier:context:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  return 1;
}

- (void)_refreshWithScheduleSettingsByModeIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  DNDSScheduleManager *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  void *v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __76__DNDSScheduleManager__refreshWithScheduleSettingsByModeIdentifier_context___block_invoke;
  v36[3] = &unk_1E86A75C0;
  v9 = self;
  v36[4] = self;
  objc_msgSend(v8, "bs_map:", v36);
  v10 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0D1D5F8], "predicateForModeAssertionsWithClientIdentifiers:", v10);
  v11 = v7;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modeAssertionsMatchingPredicate:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v6;
  v13 = (void *)objc_msgSend(v6, "mutableCopy");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    v17 = *MEMORY[0x1E0D1D4C8];
    v27 = (void *)*MEMORY[0x1E0D1D3C0];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v19, "details");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "modeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v21, "isEqualToString:", v17))
        {
          v22 = v27;

          v21 = v22;
        }
        objc_msgSend(v29, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSScheduleManager _refreshWithScheduleSettings:modeIdentifier:currentScheduleAssertion:context:](v9, "_refreshWithScheduleSettings:modeIdentifier:currentScheduleAssertion:context:", v23, v21, v19, v11);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v21);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v15);
  }

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __76__DNDSScheduleManager__refreshWithScheduleSettingsByModeIdentifier_context___block_invoke_2;
  v30[3] = &unk_1E86A75E8;
  v30[4] = v9;
  v31 = v11;
  v24 = v11;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v30);

}

uint64_t __76__DNDSScheduleManager__refreshWithScheduleSettingsByModeIdentifier_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleManagerClientIdentifierForModeIdentifier:", a2);
}

uint64_t __76__DNDSScheduleManager__refreshWithScheduleSettingsByModeIdentifier_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshWithScheduleSettings:modeIdentifier:currentScheduleAssertion:context:", a3, a2, 0, *(_QWORD *)(a1 + 40));
}

- (void)_refreshWithScheduleSettings:(id)a3 modeIdentifier:(id)a4 currentScheduleAssertion:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  id v69;
  void *v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v61 = a4;
  v62 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v65;
    v17 = 1;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v65 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v19, "scheduleEnabledSetting");
        if (DNDResolvedScheduleEnabledSetting() == 2)
          v17 = 2;
        objc_msgSend(v19, "creationDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "compare:", v12) == -1)
        {
          v21 = v20;

          v12 = v21;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    }
    while (v15);
  }
  else
  {
    v17 = 1;
  }

  v22 = v61;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentScheduleSettingsByModeIdentifier, "objectForKeyedSubscript:", v61);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v23, "isEqual:", v13) || !v62 && v17 == 2 || v62 && v17 == 1)
  {
    v24 = (void *)objc_msgSend(v13, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentScheduleSettingsByModeIdentifier, "setObject:forKeyedSubscript:", v24, v61);

    -[DNDSScheduleManager _scheduleManagerClientIdentifierForModeIdentifier:](self, "_scheduleManagerClientIdentifierForModeIdentifier:", v61);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", v25, 0);
    v27 = (void *)v26;
    if (v17 == 2)
    {
      v56 = v26;
      v28 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
      objc_msgSend(v28, "setIdentifier:", CFSTR("schedule"));
      objc_msgSend(MEMORY[0x1E0D1D630], "lifetimeMatchingScheduleWithIdentifier:", *MEMORY[0x1E0D1D3C8]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setLifetime:", v29);

      v30 = (void *)*MEMORY[0x1E0D1D3C0];
      v60 = v25;
      if ((id)*MEMORY[0x1E0D1D3C0] == v61 || v61 && v30 && objc_msgSend(v61, "isEqual:", v30))
      {
        objc_msgSend(v13, "firstObject", v56);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bedtimeBehaviorEnabledSetting");
        v32 = DNDResolvedBedtimeBehaviorEnabledSetting();

        v33 = (void *)*MEMORY[0x1E0D1D4C8];
        if (v32 != 2)
          v33 = v30;
        v22 = v33;

      }
      v61 = v22;
      objc_msgSend(v28, "setModeIdentifier:", v22, v56);
      objc_msgSend(v28, "setReason:", 2);
      v34 = v12;
      objc_msgSend(v62, "details");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v35, "isEqual:", v28) & 1) != 0)
      {
        objc_msgSend(v62, "startDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqual:", v34);

        if ((v37 & 1) != 0)
        {
          v38 = v62;
          v27 = v57;
LABEL_37:

          v25 = v60;
          v22 = v61;
          goto LABEL_38;
        }
      }
      else
      {

      }
      v59 = v23;
      v46 = (void *)MEMORY[0x1E0D1D628];
      v71 = v60;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "predicateForModeAssertionInvalidationsWithAssertionClientIdentifiers:", v47);
      v63 = v28;
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = 0;
      v27 = v57;
      do
      {
        v49 = v34;
        v50 = v44;
        objc_msgSend(v11, "takeAssertionWithDetails:source:startDate:", v63, v57, v34);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "modeAssertionInvalidationsMatchingPredicate:", v48);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "firstObject");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "invalidationDate");
        v34 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "assertions");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "count");

      }
      while (!v54);

      v38 = v62;
      v28 = v63;
      v23 = v59;
    }
    else
    {
      v38 = v62;
      if (!v62)
      {
LABEL_38:

        goto LABEL_39;
      }
      v60 = v25;
      v58 = v23;
      v39 = v12;
      objc_msgSend(v62, "UUID");
      v40 = v11;
      v41 = v27;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionUUIDs:", v43);
      v34 = (id)objc_claimAutoreleasedReturnValue();

      v27 = v41;
      v11 = v40;
      v28 = v39;
      v23 = v58;
      +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:source:reason:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:source:reason:", v34, v28, v27, 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (id)objc_msgSend(v11, "invalidateAssertionsForRequest:", v44);
    }

    goto LABEL_37;
  }
  v55 = DNDSLogSchedule;
  if (os_log_type_enabled((os_log_t)DNDSLogSchedule, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v69 = v13;
    _os_log_impl(&dword_1CB895000, v55, OS_LOG_TYPE_DEFAULT, "Existing schedule assertion does not need to change: settings=%{public}@", buf, 0xCu);
  }
  v38 = v62;
LABEL_39:

}

- (id)_scheduleManagerClientIdentifierForModeIdentifier:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  v4 = v3;
  if ((id)*MEMORY[0x1E0D1D3C0] == v3 || v3 && *MEMORY[0x1E0D1D3C0] && (objc_msgSend(v3, "isEqual:") & 1) != 0)
  {
    v5 = CFSTR("com.apple.donotdisturb.private.schedule");
  }
  else
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".private.schedule"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (DNDSScheduleManagerDataSource)dataSource
{
  return (DNDSScheduleManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentScheduleSettingsByModeIdentifier, 0);
  objc_storeStrong((id *)&self->_modeAssertionManager, 0);
}

@end
