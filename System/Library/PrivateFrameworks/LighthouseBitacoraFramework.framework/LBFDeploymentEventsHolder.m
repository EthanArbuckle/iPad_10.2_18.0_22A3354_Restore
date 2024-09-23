@implementation LBFDeploymentEventsHolder

- (LBFDeploymentEventsHolder)initWithExperimentOrTaskId:(id)a3 deploymentId:(id)a4
{
  id v7;
  id v8;
  LBFDeploymentEventsHolder *v9;
  NSMutableArray *v10;
  NSMutableArray *mlruntimedEvents;
  NSMutableArray *v12;
  NSMutableArray *lighthousePluginEvents;
  NSMutableArray *v14;
  NSMutableArray *trialdEvents;
  NSMutableArray *v16;
  NSMutableArray *dprivacydEvents;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)LBFDeploymentEventsHolder;
  v9 = -[LBFDeploymentEventsHolder init](&v19, sel_init);
  if (v9)
  {
    LBFLoggingUtilsInit();
    objc_storeStrong((id *)&v9->_experimentOrTaskId, a3);
    objc_storeStrong((id *)&v9->_deploymentId, a4);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mlruntimedEvents = v9->_mlruntimedEvents;
    v9->_mlruntimedEvents = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    lighthousePluginEvents = v9->_lighthousePluginEvents;
    v9->_lighthousePluginEvents = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    trialdEvents = v9->_trialdEvents;
    v9->_trialdEvents = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    dprivacydEvents = v9->_dprivacydEvents;
    v9->_dprivacydEvents = v16;

  }
  return v9;
}

- (BOOL)appendMlruntimedEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_addObject_(self->_mlruntimedEvents, a2, (uint64_t)a3, v3, v4);
  return 1;
}

- (BOOL)appendLighthousePluginEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_addObject_(self->_lighthousePluginEvents, a2, (uint64_t)a3, v3, v4);
  return 1;
}

- (BOOL)appendTrialEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_addObject_(self->_trialdEvents, a2, (uint64_t)a3, v3, v4);
  return 1;
}

- (BOOL)appendDprivacydEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_addObject_(self->_dprivacydEvents, a2, (uint64_t)a3, v3, v4);
  return 1;
}

- (id)eventToJSONDictionary:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  uint64_t v54;
  void *v55;
  char isKindOfClass;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  _BYTE v99[128];
  _QWORD v100[4];
  _QWORD v101[6];

  v101[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v100[0] = &unk_25109D5E8;
  v100[1] = &unk_25109D600;
  v101[0] = CFSTR("Unknown");
  v101[1] = CFSTR("Allocation");
  v100[2] = &unk_25109D618;
  v100[3] = &unk_25109D630;
  v101[2] = CFSTR("Activation");
  v101[3] = CFSTR("Deactivation");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v4, (uint64_t)v101, (uint64_t)v100, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_json(v3, v6, v7, v8, v9);
  v98 = 0;
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v10, (uint64_t)v91, 0, (uint64_t)&v98);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v98;
  v90 = v11;
  v16 = (void *)objc_msgSend_mutableCopy(v11, v12, v13, v14, v15);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend_eventType(v3, v17, v18, v19, v20);
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v22, v21, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v5, v26, (uint64_t)v25, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setObject_forKey_(v16, v30, (uint64_t)v29, (uint64_t)CFSTR("eventType"), v31);
  }
  v92 = v5;
  v93 = v3;
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v18, v19, v20);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeysForObject_(v16, v33, (uint64_t)v32, v34, v35);
  v36 = objc_claimAutoreleasedReturnValue();

  v88 = (void *)v36;
  objc_msgSend_removeObjectsForKeys_(v16, v37, v36, v38, v39);
  v44 = (void *)objc_msgSend_mutableCopy(v16, v40, v41, v42, v43);
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v45 = v16;
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v94, (uint64_t)v99, 16);
  if (v47)
  {
    v51 = v47;
    v52 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v95 != v52)
          objc_enumerationMutation(v45);
        v54 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v45, v48, v54, v49, v50);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend_objectForKey_(v45, v48, v54, v49, v50);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (void *)objc_msgSend_mutableCopy(v57, v58, v59, v60, v61);

          objc_msgSend_null(MEMORY[0x24BDBCEF8], v63, v64, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allKeysForObject_(v62, v68, (uint64_t)v67, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_removeObjectsForKeys_(v62, v72, (uint64_t)v71, v73, v74);
          v79 = (void *)objc_msgSend_copy(v62, v75, v76, v77, v78);
          objc_msgSend_setObject_forKey_(v44, v80, (uint64_t)v79, v54, v81);

        }
      }
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v94, (uint64_t)v99, 16);
    }
    while (v51);
  }

  v86 = (void *)objc_msgSend_copy(v44, v82, v83, v84, v85);
  return v86;
}

- (id)eventToJSONString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v5 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend_eventToJSONDictionary_(self, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(v5, v7, (uint64_t)v6, 1, (uint64_t)&v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  v12 = (void *)objc_msgSend_initWithData_encoding_(v9, v10, (uint64_t)v8, 4, v11);

  return v12;
}

- (id)getSortedEvents
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_arrayByAddingObjectsFromArray_(self->_mlruntimedEvents, a2, (uint64_t)self->_lighthousePluginEvents, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v5, v6, (uint64_t)self->_trialdEvents, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v9, v10, (uint64_t)self->_dprivacydEvents, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x24BDD17C0]);
  v17 = (void *)objc_msgSend_initWithKey_ascending_(v14, v15, (uint64_t)CFSTR("timestamp"), 1, v16);
  v26[0] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, (uint64_t)v26, 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v13, v21, (uint64_t)v20, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)dumpFetchedEvents
{
  NSObject *v3;
  NSString *deploymentId;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSString *v14;
  NSObject *v15;
  NSString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSMutableArray *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  NSString *v31;
  NSObject *v32;
  NSString *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  NSMutableArray *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  NSString *v48;
  NSObject *v49;
  NSString *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  NSMutableArray *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  NSString *v65;
  NSObject *v66;
  NSString *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint8_t v93[128];
  uint8_t buf[4];
  NSString *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v3 = LBFLogContextEventsHolder;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
  {
    deploymentId = self->_deploymentId;
    *(_DWORD *)buf = 138412290;
    v95 = deploymentId;
    _os_log_impl(&dword_2402DE000, v3, OS_LOG_TYPE_INFO, "dumpFetchedEvents deploymentId %@", buf, 0xCu);
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v5 = self->_mlruntimedEvents;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v86, (uint64_t)v93, 16);
  if (v7)
  {
    v11 = v7;
    v12 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v87 != v12)
          objc_enumerationMutation(v5);
        objc_msgSend_eventToJSONString_(self, v8, *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i), v9, v10);
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        v15 = LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v95 = v14;
          _os_log_impl(&dword_2402DE000, v15, OS_LOG_TYPE_INFO, "Dump: MLRuntimed Event - BMLighthouseLedgerMlruntimedEvent:\n%@\n\n", buf, 0xCu);
        }
        v16 = objc_retainAutorelease(v14);
        v21 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19, v20);
        printf("Dump: MLRuntimed Event - BMLighthouseLedgerMlruntimedEvent:\n%s\n\n", v21);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v86, (uint64_t)v93, 16);
    }
    while (v11);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v22 = self->_lighthousePluginEvents;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v82, (uint64_t)v92, 16);
  if (v24)
  {
    v28 = v24;
    v29 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v83 != v29)
          objc_enumerationMutation(v22);
        objc_msgSend_eventToJSONString_(self, v25, *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j), v26, v27);
        v31 = (NSString *)objc_claimAutoreleasedReturnValue();
        v32 = LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v95 = v31;
          _os_log_impl(&dword_2402DE000, v32, OS_LOG_TYPE_INFO, "Dump: Lighthouse Event - BMLighthouseLedgerLighthousePluginEvent:\n%@\n\n", buf, 0xCu);
        }
        v33 = objc_retainAutorelease(v31);
        v38 = (const char *)objc_msgSend_UTF8String(v33, v34, v35, v36, v37);
        printf("Dump: Lighthouse Event - BMLighthouseLedgerLighthousePluginEvent:\n%s\n\n", v38);

      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v82, (uint64_t)v92, 16);
    }
    while (v28);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v39 = self->_trialdEvents;
  v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v78, (uint64_t)v91, 16);
  if (v41)
  {
    v45 = v41;
    v46 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v79 != v46)
          objc_enumerationMutation(v39);
        objc_msgSend_eventToJSONString_(self, v42, *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k), v43, v44);
        v48 = (NSString *)objc_claimAutoreleasedReturnValue();
        v49 = LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v95 = v48;
          _os_log_impl(&dword_2402DE000, v49, OS_LOG_TYPE_INFO, "Dump: Triald Event - BMLighthouseLedgerTrialdEvent:\n%@\n\n", buf, 0xCu);
        }
        v50 = objc_retainAutorelease(v48);
        v55 = (const char *)objc_msgSend_UTF8String(v50, v51, v52, v53, v54);
        printf("Dump: Triald Event - BMLighthouseLedgerTrialdEvent:\n%s\n\n", v55);

      }
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v78, (uint64_t)v91, 16);
    }
    while (v45);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v56 = self->_dprivacydEvents;
  v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v74, (uint64_t)v90, 16);
  if (v58)
  {
    v62 = v58;
    v63 = *(_QWORD *)v75;
    do
    {
      for (m = 0; m != v62; ++m)
      {
        if (*(_QWORD *)v75 != v63)
          objc_enumerationMutation(v56);
        objc_msgSend_eventToJSONString_(self, v59, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * m), v60, v61);
        v65 = (NSString *)objc_claimAutoreleasedReturnValue();
        v66 = LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v95 = v65;
          _os_log_impl(&dword_2402DE000, v66, OS_LOG_TYPE_INFO, "Dump: Dprivacyd Event - BMLighthouseLedgerDediscoPrivacyEvent:\n%@\n\n", buf, 0xCu);
        }
        v67 = objc_retainAutorelease(v65);
        v72 = (const char *)objc_msgSend_UTF8String(v67, v68, v69, v70, v71);
        printf("Dump: Dprivacyd Event - BMLighthouseLedgerDediscoPrivacyEvent:\n%s\n\n", v72);

      }
      v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v74, (uint64_t)v90, 16);
    }
    while (v62);
  }

  return 1;
}

- (id)fetchedEventsInDictionaries
{
  id v3;
  NSObject *v4;
  NSString *deploymentId;
  NSMutableArray *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableArray *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  NSString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = LBFLogContextEventsHolder;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
  {
    deploymentId = self->_deploymentId;
    *(_DWORD *)buf = 138412290;
    v62 = deploymentId;
    _os_log_impl(&dword_2402DE000, v4, OS_LOG_TYPE_INFO, "fetchedEventsInDictionaries deploymentId %@", buf, 0xCu);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v6 = self->_mlruntimedEvents;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v54, (uint64_t)v60, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v55;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v55 != v13)
          objc_enumerationMutation(v6);
        objc_msgSend_eventToJSONDictionary_(self, v9, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v14), v10, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v16, (uint64_t)v15, v17, v18);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v54, (uint64_t)v60, 16);
    }
    while (v12);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v19 = self->_lighthousePluginEvents;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v50, (uint64_t)v59, 16);
  if (v21)
  {
    v25 = v21;
    v26 = *(_QWORD *)v51;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v51 != v26)
          objc_enumerationMutation(v19);
        objc_msgSend_eventToJSONDictionary_(self, v22, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v27), v23, v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v29, (uint64_t)v28, v30, v31);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v50, (uint64_t)v59, 16);
    }
    while (v25);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v32 = self->_trialdEvents;
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v46, (uint64_t)v58, 16);
  if (v34)
  {
    v38 = v34;
    v39 = *(_QWORD *)v47;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v47 != v39)
          objc_enumerationMutation(v32);
        objc_msgSend_eventToJSONDictionary_(self, v35, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v40), v36, v37, (_QWORD)v46);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v42, (uint64_t)v41, v43, v44);

        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v46, (uint64_t)v58, 16);
    }
    while (v38);
  }

  return v3;
}

- (NSString)experimentOrTaskId
{
  return self->_experimentOrTaskId;
}

- (NSString)deploymentId
{
  return self->_deploymentId;
}

- (NSMutableArray)lighthousePluginEvents
{
  return self->_lighthousePluginEvents;
}

- (NSMutableArray)mlruntimedEvents
{
  return self->_mlruntimedEvents;
}

- (NSMutableArray)trialdEvents
{
  return self->_trialdEvents;
}

- (NSMutableArray)dprivacydEvents
{
  return self->_dprivacydEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dprivacydEvents, 0);
  objc_storeStrong((id *)&self->_trialdEvents, 0);
  objc_storeStrong((id *)&self->_mlruntimedEvents, 0);
  objc_storeStrong((id *)&self->_lighthousePluginEvents, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_experimentOrTaskId, 0);
}

@end
