@implementation DNDSStateProvider

- (DNDState)lastCalculatedState
{
  return (DNDState *)objc_getProperty(self, a2, 24, 1);
}

- (DNDSStateProvider)initWithModeConfigurationManager:(id)a3
{
  id v5;
  DNDSStateProvider *v6;
  DNDSStateProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSStateProvider;
  v6 = -[DNDSStateProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modeConfigurationManager, a3);

  return v7;
}

- (id)recalculateStateForSnapshot:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  DNDSModeResolutionService *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  int v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  NSObject *v63;
  uint64_t v65;
  DNDSModeResolutionService *v66;
  uint64_t v68;
  id v69;
  id obj;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  -[DNDSStateProvider setLastSystemSnapshot:](self, "setLastSystemSnapshot:");
  v3 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend(v77, "activeAssertionUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v89 = v5;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Calculate DND state for snapshot: activeAssertionUUIDs=%{public}@", buf, 0xCu);

  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend(v77, "assertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v83 != v9)
          objc_enumerationMutation(v6);
        v11 = DNDSLogStateProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          *(_DWORD *)buf = 138543362;
          v89 = v12;
          _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "assertion for snapshot: assertion=%{public}@", buf, 0xCu);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    }
    while (v8);
  }

  objc_msgSend(v77, "activeAssertionUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = objc_msgSend(v77, "lostModeState");

    if (v14 != 1)
    {
      if (objc_msgSend(v77, "interruptionBehaviorSetting") == 1)
        v15 = 1;
      else
        v15 = 2;
      goto LABEL_19;
    }
  }
  else
  {

  }
  v15 = 0;
LABEL_19:
  v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = objc_alloc_init(DNDSModeResolutionService);
  -[DNDSModeResolutionService recalculateModeForSnapshot:](v16, "recalculateModeForSnapshot:", v77);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "assertions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    goto LABEL_52;
  }
  v65 = v15;
  v66 = v16;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  objc_msgSend(v77, "assertions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  if (!v75)
  {
    v68 = 0;
    goto LABEL_51;
  }
  v68 = 0;
  v74 = *(_QWORD *)v79;
  v19 = v73;
  do
  {
    for (j = 0; j != v75; ++j)
    {
      if (*(_QWORD *)v79 != v74)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
      objc_msgSend(v77, "activeDateIntervalByAssertionUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "details");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "userVisibleEndDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "details");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lifetime");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "lifetimeType");

      objc_msgSend(v77, "activeAssertionUUIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "containsObject:", v31);

      if (v32)
      {
        v33 = objc_alloc(MEMORY[0x1E0D1D750]);
        objc_msgSend(v21, "source");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "clientIdentifier");
        v35 = v29;
        v36 = v26;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "details");
        v38 = v24;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "modeIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v33;
        v42 = v35;
        v43 = (void *)objc_msgSend(v41, "initWithClientIdentifier:modeIdentifier:lifetimeType:activeDateInterval:userVisibleEndDate:", v37, v40, v35, v38, v36);

        v26 = v36;
        objc_msgSend(v69, "addObject:", v43);
        if (v36)
        {
          v44 = v36;
        }
        else
        {
          objc_msgSend(v38, "endDate");
          v44 = (id)objc_claimAutoreleasedReturnValue();
        }
        v47 = v44;
        v19 = v73;
        v24 = v38;

        v29 = v42;
        if (!v73)
        {
LABEL_38:
          v55 = 1;
          if (!v47)
            goto LABEL_46;
LABEL_43:
          if (v55 && objc_msgSend(v71, "compare:", v47) == -1)
          {
            v56 = v47;

            v68 = v29;
            v71 = v56;
          }
          goto LABEL_46;
        }
      }
      else
      {
        objc_msgSend(v77, "activeAssertionUUIDs");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

        if (v46)
        {
          v47 = 0;
          if (!v19)
            goto LABEL_38;
        }
        else
        {
          objc_msgSend(v24, "startDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
            goto LABEL_38;
        }
      }
      v76 = v26;
      objc_msgSend(v21, "details");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "modeIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49 == v19)
      {
        v55 = 1;
      }
      else
      {
        v72 = v24;
        objc_msgSend(v21, "details");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "modeIdentifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          objc_msgSend(v21, "details");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "modeIdentifier");
          v53 = v29;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "isEqual:", v73);

          v29 = v53;
          v19 = v73;
        }
        else
        {
          v55 = 0;
        }

        v24 = v72;
      }

      v26 = v76;
      if (v47)
        goto LABEL_43;
LABEL_46:

    }
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  }
  while (v75);
LABEL_51:

  v15 = v65;
  v16 = v66;
  v57 = v71;
  v58 = v68;
LABEL_52:
  if (v73)
  {
    -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self->_modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", v73, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = 0;
  }
  v60 = objc_alloc(MEMORY[0x1E0D1D748]);
  objc_msgSend(v77, "lastUpdate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v60, "initWithSuppressionState:activeModeAssertionMetadata:startDate:userVisibleTransitionDate:userVisibleTransitionLifetimeType:activeModeConfiguration:", v15, v69, v61, v57, v58, v59);

  v63 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v89 = v62;
    _os_log_impl(&dword_1CB895000, v63, OS_LOG_TYPE_DEFAULT, "Current DND state was calculated: state=%{public}@", buf, 0xCu);
  }
  -[DNDSStateProvider setLastCalculatedState:](self, "setLastCalculatedState:", v62);

  return v62;
}

- (DNDSStateProviderSystemSnapshot)lastSystemSnapshot
{
  return (DNDSStateProviderSystemSnapshot *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastSystemSnapshot:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setLastCalculatedState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCalculatedState, 0);
  objc_storeStrong((id *)&self->_lastSystemSnapshot, 0);
  objc_storeStrong((id *)&self->_modeConfigurationManager, 0);
}

@end
