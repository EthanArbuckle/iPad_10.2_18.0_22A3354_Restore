@implementation DNDSExplicitRegionLocationLifetimeMonitor

- (DNDSExplicitRegionLocationLifetimeMonitor)initWithAggregateMonitor:(id)a3
{
  id v4;
  DNDSExplicitRegionLocationLifetimeMonitor *v5;
  DNDSExplicitRegionLocationLifetimeMonitor *v6;
  NSArray *activeLifetimeAssertionUUIDs;
  uint64_t v8;
  DNDSLocationTriggerConfiguration *currentConfiguration;
  uint64_t v10;
  NSMutableSet *enteredRegionIdentifiers;
  uint64_t v12;
  NSMutableSet *enteredRegionIdentifiersPendingExit;
  DNDSJSONBackingStore *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  DNDSBackingStore *backingStore;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DNDSExplicitRegionLocationLifetimeMonitor;
  v5 = -[DNDSExplicitRegionLocationLifetimeMonitor init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_aggregateMonitor, v4);
    activeLifetimeAssertionUUIDs = v6->_activeLifetimeAssertionUUIDs;
    v6->_activeLifetimeAssertionUUIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    +[DNDSLocationTriggerConfiguration emptyConfiguration](DNDSLocationTriggerConfiguration, "emptyConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
    currentConfiguration = v6->_currentConfiguration;
    v6->_currentConfiguration = (DNDSLocationTriggerConfiguration *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    enteredRegionIdentifiers = v6->_enteredRegionIdentifiers;
    v6->_enteredRegionIdentifiers = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    enteredRegionIdentifiersPendingExit = v6->_enteredRegionIdentifiersPendingExit;
    v6->_enteredRegionIdentifiersPendingExit = (NSMutableSet *)v12;

    v14 = [DNDSJSONBackingStore alloc];
    v15 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_locationAssertionExplicitRegionFileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:versionNumber:](v14, "initWithRecordClass:fileURL:versionNumber:", v15, v16, 0);
    backingStore = v6->_backingStore;
    v6->_backingStore = (DNDSBackingStore *)v17;

    -[DNDSExplicitRegionLocationLifetimeMonitor _loadDataFromBackingStore](v6, "_loadDataFromBackingStore");
  }

  return v6;
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  v12 = v9;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v14)
  {
    -[DNDSLocationTriggerConfiguration regionIdentifiers](self->_currentConfiguration, "regionIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "containsObject:", v16);

    if (v17)
    {
      v18 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 134218498;
        v20 = v8;
        v21 = 2112;
        v22 = v12;
        v23 = 2114;
        v24 = v10;
        _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Explicit region monitoring failed for region; manager=%p, region=%@, error=%{public}@",
          (uint8_t *)&v19,
          0x20u);
      }
    }
  }

}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  NSMutableSet *v20;
  void *v21;
  NSMutableSet *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  NSMutableSet *enteredRegionIdentifiers;
  void *v27;
  NSMutableSet *enteredRegionIdentifiersPendingExit;
  void *v29;
  int v30;
  NSObject *v31;
  _BOOL4 v32;
  NSMutableSet *v33;
  void *v34;
  NSMutableSet *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  NSObject *v40;
  NSObject *v41;
  NSMutableSet *v42;
  void *v43;
  NSMutableSet *v44;
  void *v45;
  _BYTE v46[24];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 > 2)
      v11 = CFSTR("<invalid>");
    else
      v11 = off_1E86A6458[a4];
    *(_DWORD *)v46 = 134218498;
    *(_QWORD *)&v46[4] = v8;
    *(_WORD *)&v46[12] = 2114;
    *(_QWORD *)&v46[14] = v11;
    *(_WORD *)&v46[22] = 2112;
    v47 = v9;
    v12 = v10;
    _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Explicit region region state was determined; manager=%p, state=%{public}@, region=%@",
      v46,
      0x20u);

  }
  v13 = objc_opt_class();
  v14 = v9;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  if (v16)
  {
    -[DNDSLocationTriggerConfiguration regionIdentifiers](self->_currentConfiguration, "regionIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "containsObject:", v18);

    if (v19)
    {
      if (a4 == 2)
      {
        enteredRegionIdentifiers = self->_enteredRegionIdentifiers;
        objc_msgSend(v16, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(enteredRegionIdentifiers) = -[NSMutableSet containsObject:](enteredRegionIdentifiers, "containsObject:", v27);

        if ((_DWORD)enteredRegionIdentifiers)
        {
          enteredRegionIdentifiersPendingExit = self->_enteredRegionIdentifiersPendingExit;
          objc_msgSend(v16, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[NSMutableSet containsObject:](enteredRegionIdentifiersPendingExit, "containsObject:", v29);

          v31 = DNDSLogLocationLifetimeMonitor;
          v32 = os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT);
          if (v30)
          {
            if (v32)
            {
              *(_DWORD *)v46 = 138412290;
              *(_QWORD *)&v46[4] = v14;
              _os_log_impl(&dword_1CB895000, v31, OS_LOG_TYPE_DEFAULT, "Confirmed explicit region exit for a region pending exit following early invalidation of the assertion associated with prior entry, will note exit; region=%@",
                v46,
                0xCu);
            }
            v33 = self->_enteredRegionIdentifiers;
            objc_msgSend(v16, "identifier", *(_OWORD *)v46, *(_QWORD *)&v46[16], v47);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet removeObject:](v33, "removeObject:", v34);

            v35 = self->_enteredRegionIdentifiersPendingExit;
            objc_msgSend(v16, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet removeObject:](v35, "removeObject:", v36);

            -[DNDSExplicitRegionLocationLifetimeMonitor _saveDataToBackingStoreWithError:](self, "_saveDataToBackingStoreWithError:", 0);
          }
          else
          {
            if (v32)
            {
              *(_DWORD *)v46 = 138412290;
              *(_QWORD *)&v46[4] = v14;
              _os_log_impl(&dword_1CB895000, v31, OS_LOG_TYPE_DEFAULT, "Confirmed explicit region exit, will invalidate all assertions; region=%@",
                v46,
                0xCu);
            }
            v44 = self->_enteredRegionIdentifiers;
            objc_msgSend(v16, "identifier", *(_QWORD *)v46, *(_OWORD *)&v46[8], v47);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet removeObject:](v44, "removeObject:", v45);

            -[DNDSExplicitRegionLocationLifetimeMonitor _queue_invalidateAssertionOnExitFromRegion:](self, "_queue_invalidateAssertionOnExitFromRegion:", v16);
          }
        }
        else
        {
          v24 = DNDSLogLocationLifetimeMonitor;
          if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v46 = 138412290;
            *(_QWORD *)&v46[4] = v14;
            v25 = "Received unexpected explicit region exit, region=%@";
            goto LABEL_33;
          }
        }
      }
      else if (a4 == 1)
      {
        v20 = self->_enteredRegionIdentifiers;
        objc_msgSend(v16, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v20) = -[NSMutableSet containsObject:](v20, "containsObject:", v21);

        if ((v20 & 1) != 0)
        {
          v22 = self->_enteredRegionIdentifiersPendingExit;
          objc_msgSend(v16, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v22) = -[NSMutableSet containsObject:](v22, "containsObject:", v23);

          if ((_DWORD)v22)
          {
            v24 = DNDSLogLocationLifetimeMonitor;
            if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v46 = 138412290;
              *(_QWORD *)&v46[4] = v14;
              v25 = "Confirmed explicit region entry, not taking assertion until explicit exit following early invalidati"
                    "on of the assertion associated with prior entry; region=%@";
LABEL_33:
              _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, v25, v46, 0xCu);
            }
          }
        }
        else
        {
          v41 = DNDSLogLocationLifetimeMonitor;
          if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v46 = 138412290;
            *(_QWORD *)&v46[4] = v14;
            _os_log_impl(&dword_1CB895000, v41, OS_LOG_TYPE_DEFAULT, "Confirmed explicit region entry; region=%@",
              v46,
              0xCu);
          }
          v42 = self->_enteredRegionIdentifiers;
          objc_msgSend(v16, "identifier", *(_QWORD *)v46, *(_OWORD *)&v46[8], v47);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v42, "addObject:", v43);

          -[DNDSExplicitRegionLocationLifetimeMonitor _queue_takeAssertionOnEntryIntoRegion:](self, "_queue_takeAssertionOnEntryIntoRegion:", v16);
        }
      }
      else
      {
        v37 = (void *)DNDSLogLocationLifetimeMonitor;
        if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
        {
          v38 = CFSTR("<invalid>");
          if (!a4)
            v38 = CFSTR("unknown");
          v39 = v38;
          *(_DWORD *)v46 = 138543618;
          *(_QWORD *)&v46[4] = v39;
          *(_WORD *)&v46[12] = 2112;
          *(_QWORD *)&v46[14] = v14;
          v40 = v37;
          _os_log_impl(&dword_1CB895000, v40, OS_LOG_TYPE_DEFAULT, "Did not handle explicit region state %{public}@; region=%@",
            v46,
            0x16u);

        }
      }
    }
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Explicit region monitoring encountered a failure; manager=%p, error=%{public}@",
      (uint8_t *)&v8,
      0x16u);
  }

}

- (void)_queue_refreshMonitor
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  DNDSLocationTriggerConfiguration *v7;
  DNDSLocationTriggerConfiguration *v8;
  DNDSLocationTriggerConfiguration *currentConfiguration;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSArray *v42;
  NSArray *activeLifetimeAssertionUUIDs;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  DNDSLocationTriggerConfiguration *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[16];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  -[DNDSExplicitRegionLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(v3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Refreshing explicit region monitor", buf, 2u);
  }
  v7 = self->_currentConfiguration;
  objc_msgSend(v5, "locationTriggerConfigurationForLifetimeMonitor:", v3);
  v8 = (DNDSLocationTriggerConfiguration *)objc_claimAutoreleasedReturnValue();
  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v8;

  v49 = v7;
  -[DNDSLocationTriggerConfiguration regions](v7, "regions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[DNDSLocationTriggerConfiguration regions](self->_currentConfiguration, "regions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v18 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v18, "minusSet:", v17);
  v47 = v17;
  v19 = (void *)objc_msgSend(v17, "mutableCopy");
  v48 = v13;
  objc_msgSend(v19, "minusSet:", v13);
  v50 = v5;
  v51 = v3;
  objc_msgSend(v5, "lifetimeMonitor:modeAssertionsWithLifetimeClass:", v3, objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v21 = v18;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v64 != v24)
          objc_enumerationMutation(v21);
        -[DNDSExplicitRegionLocationLifetimeMonitor _queue_stopMonitoringForRegion:](self, "_queue_stopMonitoringForRegion:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v23);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v26 = v19;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v60 != v29)
          objc_enumerationMutation(v26);
        -[DNDSExplicitRegionLocationLifetimeMonitor _queue_startMonitoringForRegion:](self, "_queue_startMonitoringForRegion:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v28);
  }
  v46 = v26;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v31 = v20;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v56 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
        objc_msgSend(v36, "details");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lifetime");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "region");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v37) = objc_msgSend(v21, "containsObject:", v39);
        objc_msgSend(v36, "UUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_DWORD)v37)
        {
          v41 = v53;
        }
        else
        {
          objc_msgSend(v52, "addObject:", v40);

          objc_msgSend(v39, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v54;
        }
        objc_msgSend(v41, "addObject:", v40);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    }
    while (v33);
  }

  -[DNDSExplicitRegionLocationLifetimeMonitor _queue_resolveEnteredRegionIdentifiersWithAssertionRegionIdentifiers:](self, "_queue_resolveEnteredRegionIdentifiersWithAssertionRegionIdentifiers:", v54);
  if ((-[NSArray isEqual:](self->_activeLifetimeAssertionUUIDs, "isEqual:", v52) & 1) == 0)
  {
    v42 = (NSArray *)objc_msgSend(v52, "copy");
    activeLifetimeAssertionUUIDs = self->_activeLifetimeAssertionUUIDs;
    self->_activeLifetimeAssertionUUIDs = v42;

  }
  objc_msgSend(v51, "delegate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "lifetimeMonitor:lifetimeDidExpireForAssertionUUIDs:expirationDate:", v51, v53, v45);

}

- (void)_queue_resolveEnteredRegionIdentifiersWithAssertionRegionIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DNDSExplicitRegionLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)-[NSMutableSet mutableCopy](self->_enteredRegionIdentifiers, "mutableCopy");
  objc_msgSend(v7, "minusSet:", v4);

  if ((objc_msgSend(v7, "isEqualToSet:", self->_enteredRegionIdentifiersPendingExit) & 1) == 0)
  {
    v8 = (void *)DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v7, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Assertion(s) for region(s) invalidated without exit from region(s); regions=%{public}@",
        (uint8_t *)&v11,
        0xCu);

    }
    objc_storeStrong((id *)&self->_enteredRegionIdentifiersPendingExit, v7);
    -[DNDSExplicitRegionLocationLifetimeMonitor _saveDataToBackingStoreWithError:](self, "_saveDataToBackingStoreWithError:", 0);
  }

}

- (void)_queue_startMonitoringForRegion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DNDSExplicitRegionLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Start monitoring for region; region=%@",
      (uint8_t *)&v9,
      0xCu);
  }
  objc_msgSend(v5, "locationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startMonitoringForRegion:", v4);

}

- (void)_queue_stopMonitoringForRegion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSMutableSet *enteredRegionIdentifiers;
  void *v9;
  NSObject *v10;
  NSMutableSet *v11;
  void *v12;
  NSMutableSet *enteredRegionIdentifiersPendingExit;
  void *v14;
  NSObject *v15;
  NSMutableSet *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DNDSExplicitRegionLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Stop monitoring for region; region=%@",
      (uint8_t *)&v19,
      0xCu);
  }
  enteredRegionIdentifiers = self->_enteredRegionIdentifiers;
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(enteredRegionIdentifiers) = -[NSMutableSet containsObject:](enteredRegionIdentifiers, "containsObject:", v9);

  if ((_DWORD)enteredRegionIdentifiers)
  {
    v10 = DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Monitoring stopped for an entered region, associated assertion will be invalidated and entrance reset; region=%@",
        (uint8_t *)&v19,
        0xCu);
    }
    v11 = self->_enteredRegionIdentifiers;
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v11, "removeObject:", v12);

    enteredRegionIdentifiersPendingExit = self->_enteredRegionIdentifiersPendingExit;
    objc_msgSend(v4, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(enteredRegionIdentifiersPendingExit) = -[NSMutableSet containsObject:](enteredRegionIdentifiersPendingExit, "containsObject:", v14);

    if ((_DWORD)enteredRegionIdentifiersPendingExit)
    {
      v15 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v4;
        _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Monitoring stopped for an entered region pending exit following early invalidation of the assertion associated with prior entry, entrance will be reset; region=%@",
          (uint8_t *)&v19,
          0xCu);
      }
      v16 = self->_enteredRegionIdentifiersPendingExit;
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](v16, "removeObject:", v17);

      -[DNDSExplicitRegionLocationLifetimeMonitor _saveDataToBackingStoreWithError:](self, "_saveDataToBackingStoreWithError:", 0);
    }
  }
  objc_msgSend(v5, "locationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stopMonitoringForRegion:", v4);

}

- (void)_queue_takeAssertionOnEntryIntoRegion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  -[DNDSExplicitRegionLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[DNDSLocationTriggerConfiguration modeIdentifierForRegion:](self->_currentConfiguration, "modeIdentifierForRegion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSExplicitRegionLocationLifetimeMonitor _queue_locationMonitorClientIdentifierForModeIdentifier:region:](self, "_queue_locationMonitorClientIdentifierForModeIdentifier:region:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
  objc_msgSend(v8, "setIdentifier:", v7);
  objc_msgSend(MEMORY[0x1E0D1D630], "lifetimeWithExplicitRegion:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLifetime:", v9);
  objc_msgSend(v8, "setModeIdentifier:", v6);
  objc_msgSend(v8, "setReason:", 3);
  objc_msgSend(v12, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "lifetimeMonitor:takeModeAssertionWithDetails:clientIdentifier:error:", v12, v8, v7, 0);

}

- (void)_queue_invalidateAssertionOnExitFromRegion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[DNDSExplicitRegionLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v12, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lifetimeMonitor:modeAssertionsWithLifetimeClass:", self, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__DNDSExplicitRegionLocationLifetimeMonitor__queue_invalidateAssertionOnExitFromRegion___block_invoke;
  v13[3] = &unk_1E86A6398;
  v14 = v4;
  v8 = v4;
  objc_msgSend(v7, "bs_mapNoNulls:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lifetimeMonitor:lifetimeDidExpireForAssertionUUIDs:expirationDate:", v12, v9, v11);

}

id __88__DNDSExplicitRegionLocationLifetimeMonitor__queue_invalidateAssertionOnExitFromRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lifetime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_queue_locationMonitorClientIdentifierForModeIdentifier:(id)a3 region:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.private.region.%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_loadDataFromBackingStore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to load current explicit region database, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)_saveDataToBackingStoreWithError:(id *)a3
{
  void *v5;
  DNDSBackingStore *backingStore;
  uint64_t v7;
  id v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[DNDSExplicitRegionStore mutableCopy](self->_store, "mutableCopy");
  objc_msgSend(v5, "setEnteredRegionIdentifiersPendingExit:", self->_enteredRegionIdentifiersPendingExit);
  backingStore = self->_backingStore;
  v15 = 0;
  v7 = -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v5, &v15);
  v8 = v15;
  if (v7)
  {
    if (v7 == 1)
    {
      v13 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v8;
        v10 = "Failed to write explicit region store, but error can be ignored; error=%{public}@";
        v11 = v13;
        v12 = 12;
        goto LABEL_11;
      }
    }
    else if (v7 == 2)
    {
      v9 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v10 = "Wrote out explicit region store to file";
        v11 = v9;
        v12 = 2;
LABEL_11:
        _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_ERROR))
      -[DNDSExplicitRegionLocationLifetimeMonitor _saveDataToBackingStoreWithError:].cold.1();
    _DNDSRequestRadar(CFSTR("Failed to write store"), v8, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLocationLifetimeMonitor.m"), 498);
  }
  if (a3 && v8)
    *a3 = objc_retainAutorelease(v8);

  return v7 == 2;
}

- (DNDSAggregateLocationLifetimeMonitor)aggregateMonitor
{
  return (DNDSAggregateLocationLifetimeMonitor *)objc_loadWeakRetained((id *)&self->_aggregateMonitor);
}

- (void)setAggregateMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_aggregateMonitor, a3);
}

- (NSArray)activeLifetimeAssertionUUIDs
{
  return self->_activeLifetimeAssertionUUIDs;
}

- (DNDSLifetimeMonitorDataSource)dataSource
{
  return (DNDSLifetimeMonitorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (DNDSLifetimeMonitorDelegate)delegate
{
  return (DNDSLifetimeMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_activeLifetimeAssertionUUIDs, 0);
  objc_destroyWeak((id *)&self->_aggregateMonitor);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_enteredRegionIdentifiersPendingExit, 0);
  objc_storeStrong((id *)&self->_enteredRegionIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
}

- (void)_saveDataToBackingStoreWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to write explicit region store, will request radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

@end
