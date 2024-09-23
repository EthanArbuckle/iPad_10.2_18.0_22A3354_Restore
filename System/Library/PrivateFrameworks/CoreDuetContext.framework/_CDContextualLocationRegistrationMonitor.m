@implementation _CDContextualLocationRegistrationMonitor

- (_CDContextualLocationRegistrationMonitor)init
{
  _CDContextualLocationRegistrationMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableSet *v6;
  NSMutableSet *registrations;
  NSMutableDictionary *v8;
  NSMutableDictionary *managers;
  uint64_t v10;
  NSMapTable *effectiveBundleIDs;
  NSMutableDictionary *v12;
  NSMutableDictionary *effectiveBundleIDRegionInfos;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_CDContextualLocationRegistrationMonitor;
  v2 = -[_CDContextualLocationRegistrationMonitor init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ContextStore.location-monitor-queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registrations = v2->_registrations;
    v2->_registrations = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    managers = v2->_managers;
    v2->_managers = v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    effectiveBundleIDs = v2->_effectiveBundleIDs;
    v2->_effectiveBundleIDs = (NSMapTable *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    effectiveBundleIDRegionInfos = v2->_effectiveBundleIDRegionInfos;
    v2->_effectiveBundleIDRegionInfos = v12;

  }
  return v2;
}

- (void)addRegistration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  _CDContextualLocationRegistrationMonitor *v9;

  v4 = a3;
  -[_CDContextualLocationRegistrationMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___CDContextualLocationRegistrationMonitor_addRegistration___block_invoke;
  block[3] = &unk_1E26D46A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)removeRegistration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[_CDContextualLocationRegistrationMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___CDContextualLocationRegistrationMonitor_removeRegistration___block_invoke;
  block[3] = &unk_1E26D46A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_CDContextualLocationRegistrationMonitor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[_CDContextualLocationRegistrationMonitor effectiveBundleIDs](self, "effectiveBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_18DD73000, v10, OS_LOG_TYPE_INFO, "Authorization for %@ changed to %@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = a4;
  v7 = a3;
  -[_CDContextualLocationRegistrationMonitor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[_CDContextualLocationRegistrationMonitor effectiveBundleIDs](self, "effectiveBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_CDContextualLocationRegistrationMonitor locationManager:didStartMonitoringForRegion:].cold.1(v6, (uint64_t)v10, v11);

}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[_CDContextualLocationRegistrationMonitor queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[_CDContextualLocationRegistrationMonitor effectiveBundleIDs](self, "effectiveBundleIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v15;
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v9;
    _os_log_error_impl(&dword_18DD73000, v14, OS_LOG_TYPE_ERROR, "Failed monitoring region %@ for %@: %@", (uint8_t *)&v16, 0x20u);

  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  _CDContextualLocationRegistrationMonitor *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[2];
  _QWORD v96[2];
  _BYTE state[22];
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  void *v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _QWORD v104[3];
  _QWORD v105[3];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[_CDContextualLocationRegistrationMonitor queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v75 = v12;
    v76 = v11;
    v74 = v9;
    v77 = v8;
    v13 = _os_activity_create(&dword_18DD73000, "Duet: ContextStore Region State Change", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)state = 0;
    *(_QWORD *)&state[8] = 0;
    os_activity_scope_enter(v13, (os_activity_scope_state_t)state);
    os_activity_scope_leave((os_activity_scope_state_t)state);

    v81 = self;
    v82 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    -[_CDContextualLocationRegistrationMonitor registrations](self, "registrations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v92 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          -[_CDContextualLocationRegistrationMonitor regionInfosForRegistration:](v81, "regionInfosForRegistration:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
          {
            objc_msgSend(v19, "identifier");
            v21 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setObject:forKeyedSubscript:", v20, v21);
          }
          else
          {
            v21 = objc_alloc_init(MEMORY[0x1E0C99D20]);
            objc_msgSend(v19, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setObject:forKeyedSubscript:", v21, v22);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
      }
      while (v16);
    }

    v80 = (void *)objc_msgSend(v82, "copy");
    -[_CDContextualLocationRegistrationMonitor effectiveBundleIDs](v81, "effectiveBundleIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", v77);
    v24 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v74, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)state = 138412802;
      *(_QWORD *)&state[4] = v26;
      *(_WORD *)&state[12] = 2112;
      *(_QWORD *)&state[14] = v27;
      v98 = 2112;
      v99 = v24;
      _os_log_impl(&dword_18DD73000, v25, OS_LOG_TYPE_INFO, "Region state for region %@ changed to %@ on behalf of %@", state, 0x20u);

    }
    -[_CDContextualLocationRegistrationMonitor effectiveBundleIDRegionInfos](v81, "effectiveBundleIDRegionInfos");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");

    if (!v30)
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    +[_CDContextQueries regionIdentifierKey](_CDContextQueries, "regionIdentifierKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = v31;
    v105[0] = v75;
    +[_CDContextQueries regionStateKey](_CDContextQueries, "regionStateKey");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v104[1] = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v33;
    +[_CDContextQueries changeDateKey](_CDContextQueries, "changeDateKey");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v104[2] = v34;
    v105[2] = v76;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 3);
    v35 = objc_claimAutoreleasedReturnValue();

    v71 = (void *)v35;
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v35, v75);
    v36 = objc_msgSend(v30, "copy");
    -[_CDContextualLocationRegistrationMonitor effectiveBundleIDRegionInfos](v81, "effectiveBundleIDRegionInfos");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)v36;
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v24);

    v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    -[_CDContextualLocationRegistrationMonitor registrations](v81, "registrations");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v88 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
          -[_CDContextualLocationRegistrationMonitor regionInfosForRegistration:](v81, "regionInfosForRegistration:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v45, "count"))
          {
            objc_msgSend(v44, "identifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v45, v46);

          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
      }
      while (v41);
    }
    v72 = v30;
    v73 = (void *)v24;

    v69 = v38;
    v47 = (void *)objc_msgSend(v38, "copy");
    v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v48 = v47;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v84;
      v52 = MEMORY[0x1E0C9AA60];
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v84 != v51)
            objc_enumerationMutation(v48);
          v54 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k);
          v55 = objc_alloc(MEMORY[0x1E0C99E60]);
          objc_msgSend(v80, "objectForKeyedSubscript:", v54);
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = (void *)v56;
          if (v56)
            v58 = v56;
          else
            v58 = v52;
          v59 = (void *)objc_msgSend(v55, "initWithArray:", v58);

          v60 = objc_alloc(MEMORY[0x1E0C99E60]);
          objc_msgSend(v48, "objectForKeyedSubscript:", v54);
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = (void *)v61;
          if (v61)
            v63 = v61;
          else
            v63 = v52;
          v64 = (void *)objc_msgSend(v60, "initWithArray:", v63);

          if ((objc_msgSend(v59, "isEqualToSet:", v64) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            {
              +[_CDContextQueries keyPathForCircularLocationRegions](_CDContextQueries, "keyPathForCircularLocationRegions");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)state = 138413058;
              *(_QWORD *)&state[4] = v54;
              *(_WORD *)&state[12] = 2112;
              *(_QWORD *)&state[14] = v78;
              v98 = 2112;
              v99 = (uint64_t)v59;
              v100 = 2112;
              v101 = v64;
              _os_log_debug_impl(&dword_18DD73000, v65, OS_LOG_TYPE_DEBUG, "Registration %@ had %@ values change from %@ to %@", state, 0x2Au);

            }
            objc_msgSend(v79, "addObject:", v54);
          }

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
      }
      while (v50);
    }

    v11 = v76;
    if (objc_msgSend(v79, "count"))
    {
      objc_msgSend(v80, "dictionaryWithValuesForKeys:", v79);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v95[0] = CFSTR("previousRegistrationRegionInfos");
      v95[1] = CFSTR("regionStateChangeDate");
      v96[0] = v66;
      v96[1] = v76;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "postNotificationName:object:userInfo:", CFSTR("_CDCircularRegionsForRegistrationDidChangeNotification"), v81, v68);

    }
    v8 = v77;
    v9 = v74;
    v12 = v75;
  }

}

- (id)regionInfosForRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CDContextualLocationRegistrationMonitor effectiveBundleIDRegionInfos](self, "effectiveBundleIDRegionInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "locationManagerEffectiveBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "predicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "circularLocationRegions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18), (_QWORD)v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v9, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  v20 = (void *)objc_msgSend(v9, "copy");
  return v20;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)registrations
{
  return self->_registrations;
}

- (NSMutableDictionary)managers
{
  return self->_managers;
}

- (NSMapTable)effectiveBundleIDs
{
  return self->_effectiveBundleIDs;
}

- (NSMutableDictionary)effectiveBundleIDRegionInfos
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveBundleIDRegionInfos, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIDs, 0);
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)locationManager:(NSObject *)a3 didStartMonitoringForRegion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_18DD73000, a3, OS_LOG_TYPE_DEBUG, "Start monitoring for region %@ on behalf of %@", (uint8_t *)&v6, 0x16u);

}

@end
