@implementation HMDBackingStore

- (HMDCoreData)coreData
{
  void *v2;
  void *v3;

  +[HMDMainDriver driver](HMDMainDriver, "driver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coreData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCoreData *)v3;
}

- (void)handleCoreDataWillSaveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDBackingStore *v10;
  objc_class *v11;
  id v12;
  void *v13;
  uint64_t v14;
  HMDBackingStore *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location[4];
  HMDBackingStore *v24;
  id v25;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (-[HMDBackingStore shouldHandleNotificationFromContext:](self, v7))
  {
    objc_msgSend(v7, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deletedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = self;
      v11 = (objc_class *)MEMORY[0x24BDBCEB8];
      v12 = v9;
      v13 = (void *)objc_msgSend([v11 alloc], "initWithCapacity:", objc_msgSend(v12, "count"));
      v14 = MEMORY[0x24BDAC760];
      location[0] = (id)MEMORY[0x24BDAC760];
      location[1] = (id)3221225472;
      location[2] = ____createLegacyDeletes_block_invoke;
      location[3] = &unk_24E784340;
      v24 = v10;
      v25 = v13;
      v15 = v10;
      v16 = v13;
      objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", location);

      v17 = (void *)objc_msgSend(v16, "copy");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("HMD.deletes"));
      objc_initWeak(location, v7);
      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __64__HMDBackingStore_CoreData__handleCoreDataWillSaveNotification___block_invoke;
      v20[3] = &unk_24E7972B0;
      objc_copyWeak(&v22, location);
      v18 = v17;
      v21 = v18;
      objc_msgSend(v7, "performWithOptions:andBlock:", 1, v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak(location);

    }
    else
    {
      objc_msgSend(v7, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", CFSTR("HMD.deletes"));

    }
  }

}

- (void)handleCoreDataDidSaveNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (-[HMDBackingStore shouldHandleNotificationFromContext:](self, v6))
  {
    v7 = (void *)MEMORY[0x227676638]();
    -[HMDBackingStore handleCoreDataDidSaveNotification:sourceContext:](self, "handleCoreDataDidSaveNotification:sourceContext:", v8, v6);
    objc_autoreleasePoolPop(v7);
  }

}

- (void)handleCoreDataDidSaveNotification:(id)a3 sourceContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HMDCoreDataWorkingStoreTransactionLogEvent *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  HMDBackingStore *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  HMDBackingStore *v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  HMDBackingStore *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  HMDBackingStore *v58;
  void *v59;
  HMDBackingStore *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  const char *v64;
  void *v65;
  HMDBackingStore *v66;
  void *v67;
  void *v68;
  HMDBackingStore *v69;
  NSObject *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[5];
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  void *v110;
  uint8_t v111[4];
  void *v112;
  __int16 v113;
  const char *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBB598]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v83 = v9;

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBB430]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBB400]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_msgSend(v6, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("HMD.deletes"));
  v84 = v16;
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", CFSTR("HMD.deletes"));
  if (objc_msgSend(v12, "count")
    || objc_msgSend(v83, "count")
    || objc_msgSend(v15, "count")
    || objc_msgSend(v85, "count"))
  {
    v81 = v7;
    v82 = v12;
    v79 = v15;
    objc_msgSend(v6, "name");
    v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transactionAuthor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCoreDataContextTransactionAuthor contextAuthorWithString:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "type");
    v22 = [HMDCoreDataWorkingStoreTransactionLogEvent alloc];
    objc_msgSend(v20, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMDCoreDataWorkingStoreTransactionLogEvent initWithTransactionAuthor:](v22, "initWithTransactionAuthor:", v23);

    -[HMDBackingStore homeManager](self, "homeManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "metricsManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logEventSubmitter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)v24;
    objc_msgSend(v27, "submitLogEvent:", v24);

    v28 = self;
    -[HMDBackingStore context](self, "context");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "managedObjectContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = v17;
    if (!objc_msgSend(v17, "isEqual:", v30))
    {
      -[HMDBackingStore context](self, "context");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = MEMORY[0x24BDAC760];
      v91[1] = 3221225472;
      v91[2] = __77__HMDBackingStore_CoreData__handleCoreDataDidSaveNotification_sourceContext___block_invoke;
      v91[3] = &unk_24E77B8A8;
      v91[4] = self;
      v92 = v18;
      v93 = v20;
      v94 = v30;
      v95 = v5;
      v57 = v83;
      v96 = v83;
      v12 = v82;
      v97 = v82;
      v15 = v79;
      v98 = v79;
      v99 = v85;
      v100 = v21;
      objc_msgSend(v56, "performBlock:", v91);

      v7 = v81;
LABEL_45:

      v67 = v84;
      v6 = v80;
      goto LABEL_46;
    }
    v77 = v30;
    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("HMD.v4txn"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v82;
    if (v31)
      objc_msgSend(v84, "removeObjectForKey:", CFSTR("HMD.v4txn"));
    objc_msgSend(v31, "objects");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v85;
    v7 = v81;
    if (self)
    {
      if (objc_msgSend(v32, "count") || objc_msgSend(v33, "count"))
      {
        if (objc_msgSend(v33, "count"))
        {
          if (objc_msgSend(v32, "count"))
          {
            v75 = v31;
            v76 = v5;
            v34 = v33;
            v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v33, "count") + objc_msgSend(v32, "count"));
            objc_msgSend(v88, "addObjectsFromArray:", v32);
            v35 = (void *)MEMORY[0x24BDBCF20];
            v74 = v32;
            objc_msgSend(v32, "na_map:", &__block_literal_global_9);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setWithArray:", v36);
            v37 = objc_claimAutoreleasedReturnValue();

            v38 = (void *)v37;
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v73 = v34;
            v39 = v34;
            v40 = self;
            v90 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
            if (v90)
            {
              v89 = *(_QWORD *)v102;
              v86 = v39;
              do
              {
                for (i = 0; i != v90; ++i)
                {
                  v42 = v20;
                  v43 = v18;
                  if (*(_QWORD *)v102 != v89)
                    objc_enumerationMutation(v39);
                  v44 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
                  objc_msgSend(v44, "change");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "uuid");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v38, "containsObject:", v46);

                  if (v47)
                  {
                    v48 = (void *)MEMORY[0x227676638]();
                    v49 = v40;
                    HMFGetOSLogHandle();
                    v50 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v51 = v38;
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "uuid");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v106 = v52;
                      v107 = 2112;
                      v108 = v45;
                      v109 = 2112;
                      v110 = v53;
                      _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_DEBUG, "%{public}@Skipping merging transaction item for change %@/%@ as one already exists", buf, 0x20u);

                      v38 = v51;
                      v39 = v86;
                      v40 = self;
                    }

                    objc_autoreleasePoolPop(v48);
                  }
                  else
                  {
                    objc_msgSend(v88, "addObject:", v44);
                  }

                  v18 = v43;
                  v20 = v42;
                }
                v90 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
              }
              while (v90);
            }

            v54 = objc_msgSend(v88, "copy");
            v55 = v38;
            v28 = (HMDBackingStore *)v54;

            v31 = v75;
            v5 = v76;
            v7 = v81;
            v12 = v82;
            v33 = v73;
            v32 = v74;
            goto LABEL_40;
          }
          v58 = (HMDBackingStore *)v33;
        }
        else
        {
          v58 = (HMDBackingStore *)v32;
        }
        v28 = v58;
      }
      else
      {
        v28 = 0;
      }
    }
LABEL_40:

    v59 = (void *)MEMORY[0x227676638]();
    v60 = self;
    HMFGetOSLogHandle();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v62 = v31;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = "legacy";
      *(_DWORD *)v111 = 138544130;
      v113 = 2080;
      v112 = v63;
      if (!v62)
        v64 = "native";
      v114 = v64;
      v115 = 2112;
      v116 = v18;
      v117 = 2112;
      v118 = v20;
      _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_INFO, "%{public}@Processing %s Core Data save from this backing store's context: %@ / %@", v111, 0x2Au);

      v31 = v62;
      v12 = v82;
    }

    objc_autoreleasePoolPop(v59);
    objc_msgSend(v31, "options");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v60;
    v57 = v83;
    __broadcastChanges(v66, v83, v12, v79, v28, v65);

    v15 = v79;
    v30 = v77;
    goto LABEL_45;
  }
  v68 = (void *)MEMORY[0x227676638]();
  v69 = self;
  HMFGetOSLogHandle();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v71 = v15;
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v111 = 138543362;
    v112 = v72;
    _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_DEBUG, "%{public}@No changes actually saved, skipping further processing", v111, 0xCu);

    v15 = v71;
  }

  objc_autoreleasePoolPop(v68);
  v57 = v83;
  v67 = v84;
LABEL_46:

}

- (void)dmKickClients
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HMDBackingStore *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDBackingStore home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = (id)v4;

    v5 = v14;
LABEL_4:
    v16 = v5;
    objc_msgSend(v5, "dmKickClients");

    return;
  }
  -[HMDBackingStore homeManager](self, "homeManager");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v15;
  if (v15)
    goto LABEL_4;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStore context](v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStore context](v7, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transactionAuthor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v9;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Warning: HMDBackingStore with context %@.%@ does not have a homeManager", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
}

- (id)cdlsFetchObjectWithUUID:(id)a3 ofModelType:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _Unwind_Exception *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  Class v17;
  id *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  if ((HMDModelClassIsCDRepresentable((uint64_t)a4) & 1) == 0)
  {
    v13 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v13);
  }
  if (v8)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__46076;
    v23 = __Block_byref_object_dispose__46077;
    v24 = 0;
    -[HMDBackingStore context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __71__HMDBackingStore_CoreData__cdlsFetchObjectWithUUID_ofModelType_error___block_invoke;
    v14[3] = &unk_24E77B8D0;
    v16 = &v19;
    v15 = v8;
    v17 = a4;
    v18 = a5;
    objc_msgSend(v10, "performBlockAndWait:", v14);

    v11 = (id)v20[5];
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)cdlsReplayAllModelsStartingAt:(id)a3 isInitialGraphLoad:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v6 = a3;
  -[HMDBackingStore context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__HMDBackingStore_CoreData__cdlsReplayAllModelsStartingAt_isInitialGraphLoad___block_invoke;
  v10[3] = &unk_24E796150;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v13 = a4;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "performBlockAndWaitWithPinnedQueryGeneration:", v10);

}

- (void)_cdlsReplayAllModelsStartingAt:(id)a3 fromContext:(id)a4 isInitialGraphLoad:(BOOL)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  HMDBackingStore *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HMDBackingStore *v26;
  NSObject *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  char *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  HMDBackingStore *v40;
  NSObject *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  double v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  double v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofModelType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofModelType:error:", v12, objc_opt_class(), &v54);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = COERCE_DOUBLE(v54);

  if (v13)
  {
    HMDCastIfManagedObjectBSORepresentable(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v14;
    objc_msgSend(v15, "hmd_modelsWithChangeType:detached:error:", 0, 0, &v53);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v47 = COERCE_DOUBLE(*(id *)&v53);

    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v16)
    {
      v44 = v15;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v56 = v21;
        v57 = 2112;
        v58 = v22;
        v23 = v22;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Begin replaying models from CoreData: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
        +[HMDBackingStoreTransactionOptions defaultCloudOptionsForInitialGraphLoad](HMDBackingStoreTransactionOptions, "defaultCloudOptionsForInitialGraphLoad");
      else
        +[HMDBackingStoreTransactionOptions defaultCloudOptions](HMDBackingStoreTransactionOptions, "defaultCloudOptions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v13;
      v32 = 0;
      if (objc_msgSend(v16, "count", v44))
      {
        v33 = v16;
        do
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x24BDAC760];
          v48[1] = 3221225472;
          v48[2] = __91__HMDBackingStore_CoreData___cdlsReplayAllModelsStartingAt_fromContext_isInitialGraphLoad___block_invoke;
          v48[3] = &unk_24E77B8F8;
          v48[4] = v18;
          v49 = v24;
          v50 = v34;
          v51 = v9;
          v36 = v35;
          v52 = v36;
          v37 = v34;
          objc_msgSend(v33, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v48);
          __dependencySort(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          __lookup(v18, v38, v31);
          v32 += objc_msgSend(v38, "count");
          v16 = v36;

          v33 = v16;
        }
        while (objc_msgSend(v16, "count"));
      }
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v18;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        *(_DWORD *)buf = 138543874;
        v56 = v42;
        v57 = 2048;
        v58 = v32;
        v59 = 2048;
        v60 = v43 - v11;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Replayed %zd models from CoreData in %.3lf seconds", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v39);
      -[HMDBackingStore dmKickClients](v40, "dmKickClients");

      v15 = v45;
      v13 = v46;
      v29 = v47;
    }
    else
    {
      v29 = v47;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = v30;
        v57 = 2112;
        v58 = v13;
        v59 = 2112;
        v60 = v47;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode managed object %@ into model objects: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
    }

    v14 = v29;
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v56 = v28;
      v57 = 2112;
      v58 = v8;
      v59 = 2112;
      v60 = v14;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to find root model to start replay at %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (void)cdlsCommit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 coreDataBlock:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a6;
  v12 = a7;
  -[HMDBackingStore home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStore context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke;
  v21[3] = &unk_24E77FDB0;
  v21[4] = self;
  v22 = v10;
  v23 = v13;
  v24 = v15;
  v25 = v11;
  v26 = v12;
  v16 = v12;
  v17 = v11;
  v18 = v15;
  v19 = v13;
  v20 = v10;
  objc_msgSend(v14, "performBlock:", v21);

}

- (void)cdlsUpdate:(id)a3 destination:(unint64_t)a4
{
  __updateRegistration(self, 1, a3);
}

- (void)cdlsDelete:(id)a3 destination:(unint64_t)a4
{
  __updateRegistration(self, 3, a3);
}

void __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void (**v46)(void *, void *);
  void *v47;
  id v48;
  id obj;
  _QWORD v50[5];
  id v51;
  uint64_t *v52;
  _QWORD v53[4];
  id v54;
  uint64_t v55;
  __CFString *v56;
  id v57;
  id v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__46076;
  v72 = __Block_byref_object_dispose__46077;
  v73 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__46076;
  v66 = __Block_byref_object_dispose__46077;
  v67 = 0;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("<no message>");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 40), "objects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke_2;
  v53[3] = &unk_24E77B920;
  v59 = &v68;
  v11 = *(id *)(a1 + 48);
  v60 = &v74;
  v12 = *(_QWORD *)(a1 + 32);
  v54 = v11;
  v55 = v12;
  v13 = v8;
  v56 = v13;
  v57 = *(id *)(a1 + 56);
  v61 = &v62;
  v14 = v3;
  v58 = v14;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v53);

  if (v63[5])
  {
    v15 = _Block_copy(*(const void **)(a1 + 64));
    v16 = v15;
    if (v15)
      (*((void (**)(void *, id, uint64_t, _QWORD))v15 + 2))(v15, v14, v63[5], 0);

    objc_msgSend(*(id *)(a1 + 32), "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rollback");

    v18 = _Block_copy(*(const void **)(a1 + 72));
    v19 = v18;
    if (v18)
      (*((void (**)(void *, uint64_t))v18 + 2))(v18, v63[5]);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v10;
    v50[1] = 3221225472;
    v50[2] = __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke_43;
    v50[3] = &unk_24E77B948;
    v50[4] = *(_QWORD *)(a1 + 32);
    v21 = v14;
    v51 = v21;
    v52 = &v62;
    objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v50);

    v22 = v63[5] == 0;
    v23 = _Block_copy(*(const void **)(a1 + 64));
    v24 = v23;
    if (v22)
    {
      if (v23)
      {
        v28 = (id *)(v63 + 5);
        obj = (id)v63[5];
        (*((void (**)(void *, id, _QWORD, id *))v23 + 2))(v23, v21, 0, &obj);
        objc_storeStrong(v28, obj);
      }

      if (v63[5])
      {
        objc_msgSend(*(id *)(a1 + 32), "context");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "rollback");

        v30 = _Block_copy(*(const void **)(a1 + 72));
        v27 = v30;
        if (v30)
          (*((void (**)(void *, uint64_t))v30 + 2))(v30, v63[5]);
      }
      else
      {
        objc_msgSend(v21, "userInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("HMD.v4txn"));
        objc_msgSend(*(id *)(a1 + 40), "options");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "clientIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          objc_msgSend(v31, "clientIdentifier");
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)v69[5];
          v69[5] = v33;
        }
        else
        {
          v35 = v69;
          v36 = (id)v69[5];
          v34 = (void *)v35[5];
          v35[5] = (uint64_t)v36;
        }

        v37 = objc_msgSend(v31, "cdTransactionAuthor");
        v38 = v69[5];
        v39 = *((unsigned __int8 *)v75 + 24);
        v40 = (id *)(v63 + 5);
        v48 = (id)v63[5];
        objc_msgSend(v21, "hmd_saveWithTransactionAuthor:clientIdentifier:allowQoSEscalation:error:", v37, v38, v39, &v48);
        objc_storeStrong(v40, v48);
        objc_msgSend(v21, "reset");
        removeDictionaryEntry(v27, CFSTR("HMD.v4txn"), *(void **)(a1 + 40));
        if (v63[5])
        {
          v41 = (void *)MEMORY[0x227676638]();
          v42 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v43 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v63[5];
            *(_DWORD *)buf = 138543618;
            v79 = v44;
            v80 = 2112;
            v81 = v45;
            _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Context save failed: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v41);
        }
        v46 = (void (**)(void *, void *))_Block_copy(*(const void **)(a1 + 72));
        if (v46)
        {
          HMDSanitizeCoreDataError((void *)v63[5]);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v46[2](v46, v47);

        }
      }
    }
    else
    {
      if (v23)
        (*((void (**)(void *, id, uint64_t, _QWORD))v23 + 2))(v23, v21, v63[5], 0);

      objc_msgSend(*(id *)(a1 + 32), "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "rollback");

      v26 = _Block_copy(*(const void **)(a1 + 72));
      v27 = v26;
      if (v26)
        (*((void (**)(void *, uint64_t))v26 + 2))(v26, v63[5]);
    }

  }
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);
}

void __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id obj;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  __CFString *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  -[__CFString message](v5, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_msgSend(v6, "untrustedClientIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = *(_QWORD *)(a1 + 32);

      if (v16)
      {
        objc_msgSend(v7, "untrustedClientIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

        objc_msgSend(v7, "userForHome:", *(_QWORD *)(a1 + 32));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v20, "isOwner");

      }
    }
  }
  -[__CFString change](v5, "change");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMDCastIfModelCDRepresentable(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v63 = v10;
    HMFGetLogIdentifier();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString change](v5, "change");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v61, "objectChangeType");
    if ((unint64_t)(v13 - 1) > 2)
      v14 = CFSTR("unknown");
    else
      v14 = off_24E78EE30[v13 - 1];
    v21 = v14;
    v65 = v7;
    objc_msgSend(v7, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
      v23 = *(void **)(a1 + 48);
    -[__CFString change](v5, "change");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "debugString:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v71 = v62;
    v72 = 2112;
    v73 = v21;
    v74 = 2112;
    v75 = v23;
    v76 = 2112;
    v77 = v25;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@COREDATA LEGACY PROCESSING: %@ (%@)\n%@", buf, 0x2Au);

    v7 = v65;
    v10 = v63;
  }

  objc_autoreleasePoolPop(v10);
  -[__CFString change](v5, "change");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "objectChangeType");

  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v31 = *(void **)(v28 + 40);
  v30 = (id *)(v28 + 40);
  v29 = v31;
  if (v27 == 3)
  {
    v32 = *(_QWORD *)(a1 + 56);
    obj = v29;
    objc_msgSend(v9, "cd_fetchManagedObjectInContext:error:", v32, &obj);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v30, obj);

    if (v33)
    {
      objc_msgSend(v9, "managedObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v35 = *(void **)(a1 + 64);
        objc_msgSend(v9, "managedObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "deleteObject:", v36);

        goto LABEL_29;
      }
      v67 = v9;
      v39 = (void *)MEMORY[0x227676638]();
      v54 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString change](v5, "change");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "bsoType");
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString change](v5, "change");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "uuid");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v71 = v56;
        v72 = 2112;
        v73 = v58;
        v74 = 2112;
        v75 = v60;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch succeeded for %@.%@ but no managed object actually found", buf, 0x20u);

      }
    }
    else
    {
      v67 = v9;
      v39 = (void *)MEMORY[0x227676638]();
      v40 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString change](v5, "change");
        v66 = v7;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "bsoType");
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString change](v5, "change");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "uuid");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        *(_DWORD *)buf = 138544130;
        v71 = v42;
        v72 = 2112;
        v73 = v44;
        v74 = 2112;
        v75 = v46;
        v76 = 2112;
        v77 = v47;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to find %@.%@ for deletion: %@", buf, 0x2Au);

        v7 = v66;
      }

    }
    objc_autoreleasePoolPop(v39);
    v9 = v67;
    goto LABEL_29;
  }
  v37 = *(_QWORD *)(a1 + 64);
  v68 = v29;
  objc_msgSend(v9, "cd_currentManagedObjectInContext:error:", v37, &v68);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v30, v68);
  if (v38)
  {

  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    v48 = v9;
    v49 = (void *)MEMORY[0x227676638]();
    v50 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v71 = v52;
      v72 = 2112;
      v73 = v5;
      v74 = 2112;
      v75 = v53;
      _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unable to find current managed object for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v49);
    *a4 = 1;
    v9 = v48;
  }
LABEL_29:

}

void __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "change");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "objectChangeType");

  if (v5 != 3)
  {
    objc_msgSend(v3, "change");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMDCastIfModelCDRepresentable(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v9 + 40);
      v10 = objc_msgSend(v7, "cd_updateManagedObjectInContext:error:", v8, &obj);
      objc_storeStrong((id *)(v9 + 40), obj);
      if ((v10 & 1) != 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "change");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138543874;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to update managed object for %@: %@", buf, 0x20u);

      }
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "change");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v17;
        v22 = 2112;
        v23 = v18;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Got a %@ but don't know how to represent it as a NSManagedObject", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v11);
    goto LABEL_9;
  }
LABEL_10:

}

void __91__HMDBackingStore_CoreData___cdlsReplayAllModelsStartingAt_fromContext_isInitialGraphLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDBackingStoreTransactionItem *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bsoType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v7;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@COREDATA: Replaying %@.%@.%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "setObjectChangeType:", 2);
  v11 = *(void **)(a1 + 40);
  objc_msgSend(v3, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  v13 = *(void **)(a1 + 48);
  v14 = -[HMDBackingStoreTransactionItem initWithChange:message:]([HMDBackingStoreTransactionItem alloc], "initWithChange:message:", v3, 0);
  objc_msgSend(v3, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, v15);

  HMDCastIfModelCDRepresentable(v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 56);
  v27 = 0;
  objc_msgSend(v16, "cd_childrenExcluding:fromContext:error:", v17, v18, &v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v27;

  if (v19)
  {
    v21 = *(void **)(a1 + 64);
    objc_msgSend(v19, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v22);

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v26;
      v30 = 2112;
      v31 = v3;
      v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch children of %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
  }

}

void __78__HMDBackingStore_CoreData__cdlsReplayAllModelsStartingAt_isInitialGraphLoad___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cdlsReplayAllModelsStartingAt:fromContext:isInitialGraphLoad:", v3, v4, *(unsigned __int8 *)(a1 + 56));

}

void __71__HMDBackingStore_CoreData__cdlsFetchObjectWithUUID_ofModelType_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[HMDBackingStore cdlsFetchObjectWithUUID:ofModelType:error:](HMDBackingStore, "cdlsFetchObjectWithUUID:ofModelType:error:", a1[4], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77__HMDBackingStore_CoreData__handleCoreDataDidSaveNotification_sourceContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v14 = 138543874;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Processing Core Data save from a different context: %@ / %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 56), "mergeChangesFromContextDidSaveNotification:", *(_QWORD *)(a1 + 64));
  v8 = *(void **)(a1 + 32);
  __mirrorForeignObjects(*(void **)(a1 + 56), *(void **)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __mirrorForeignObjects(*(void **)(a1 + 56), *(void **)(a1 + 80));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __mirrorForeignObjects(*(void **)(a1 + 56), *(void **)(a1 + 88));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 96);
  v12 = *(_QWORD *)(a1 + 104);
  if (v12 <= 0xB)
  {
    +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", qword_2226A0608[v12], 0, 0, 0);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  __broadcastChanges(v8, v9, v10, v11, v13, (void *)a1);

}

id __62__HMDBackingStore_CoreData____mergeLegacyChanges_intoDeletes___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "change");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "objectChangeType");

  if (v4 == 3)
  {
    objc_msgSend(v2, "change");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)shouldHandleNotificationFromContext:(void *)a1
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "coreData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRelatedContext:", v3);

    if (v5 && objc_msgSend(v3, "hmd_transactionAuthor") != 7)
    {
      objc_msgSend(v3, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "contextName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (void *)objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __64__HMDBackingStore_CoreData__handleCoreDataWillSaveNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    removeDictionaryEntry(v3, CFSTR("HMD.deletes"), *(void **)(a1 + 32));

    WeakRetained = v4;
  }

}

+ (id)cdlsActiveBackingStores
{
  if (cdlsActiveBackingStores_onceToken != -1)
    dispatch_once(&cdlsActiveBackingStores_onceToken, &__block_literal_global_46136);
  return (id)cdlsActiveBackingStores_activeBackingStores;
}

+ (id)cdlsBackingStoreWithHandle:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "backingStoreUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __backingStoreWithUUID(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)cdlsBackingStoreForHomeManagerWithError:(id *)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("030440CB-974B-44F3-8786-7191F302252E"));
  __backingStoreWithUUID(v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dependencySortTestInterface:(id)a3
{
  return __dependencySort(a3);
}

+ (id)cdlsFetchManagedObjectWithUUID:(id)a3 ofModelType:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v11;
  SEL v12;
  id v13;
  Class v14;
  id *v15;

  v8 = a3;
  if ((HMDModelClassIsCDRepresentable((uint64_t)a4) & 1) != 0)
  {
    objc_msgSend(a1, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v8, -[objc_class cd_entityClass](a4, "cd_entityClass"), a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v11 = (void *)_HMFPreconditionFailure();
    return +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](v11, v12, v13, v14, v15);
  }
}

+ (id)cdlsFetchManagedObjectWithUUID:(id)a3 ofManagedObjectType:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  -[objc_class fetchRequest](a4, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreModelObject fetchByModelID](HMDBackingStoreModelObject, "fetchByModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = CFSTR("MODELID");
  v34[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithSubstitutionVariables:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v12);

  objc_msgSend(v9, "execute:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((unint64_t)objc_msgSend(v13, "count") < 2)
    {
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        v17 = v15;

      goto LABEL_10;
    }
LABEL_12:
    _HMFPreconditionFailure();
  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = a1;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *a5;
    v25 = 138544130;
    v26 = v21;
    v27 = 2112;
    v28 = v22;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v23;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Fetch of model %@.%@ failed: %@", (uint8_t *)&v25, 0x2Au);

  }
  objc_autoreleasePoolPop(v18);
  v16 = 0;
LABEL_10:

  return v16;
}

+ (id)cdlsFetchObjectWithUUID:(id)a3 ofModelType:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v12;
  SEL v13;
  id v14;

  v8 = a3;
  if ((HMDModelClassIsCDRepresentable((uint64_t)a4) & 1) != 0)
  {
    objc_msgSend(a1, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v8, -[objc_class cd_entityClass](a4, "cd_entityClass"), a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = (void *)objc_msgSend([a4 alloc], "initWithManagedObject:changeType:detached:error:", v9, 0, 0, a5);
    else
      v10 = 0;

    return v10;
  }
  else
  {
    v12 = (void *)_HMFPreconditionFailure();
    return +[HMDBackingStore cdlsModelIDStringsForManagedObjects:](v12, v13, v14);
  }
}

+ (id)cdlsModelIDStringsForManagedObjects:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "modelID", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v13 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v13;
}

+ (id)cdlsFetchManagedObjectsWithUUIDStrings:(id)a3 ofManagedObjectType:(Class)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  Class aClass;
  void *v30;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  const __CFString *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    aClass = a4;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    v30 = v6;
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v11);
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            v13 = (void *)MEMORY[0x227676638]();
            v14 = a1;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = v16;
              v40 = 2112;
              v41 = v11;
              _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid UUID string '%@'", buf, 0x16u);

              v6 = v30;
            }

            objc_autoreleasePoolPop(v13);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v6, "count"))
    {
      -[objc_class fetchRequest](aClass, "fetchRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("modelID"), v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPredicate:", v18);

      v44 = CFSTR("modelID");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPropertiesToFetch:", v19);

      v33 = 0;
      objc_msgSend(v17, "execute:", &v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v33;
      if (v20)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = (void *)MEMORY[0x227676638]();
        v24 = a1;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(aClass);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v39 = v26;
          v40 = 2112;
          v41 = v27;
          v42 = 2112;
          v43 = v21;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Fetch of %@ models failed: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v23);
        v22 = 0;
        v6 = v30;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

void __52__HMDBackingStore_CoreData__cdlsActiveBackingStores__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cdlsActiveBackingStores_activeBackingStores;
  cdlsActiveBackingStores_activeBackingStores = v0;

}

- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4 home:(id)a5 dataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDBackingStore *v15;
  uint64_t v16;
  HMDBackingStoreLocal *local;
  id v18;
  void *v19;
  uint64_t v20;
  CKRecordID *root;
  HMDHomeManagerObjectLookup *v22;
  HMDObjectLookup *lookup;
  HMDBackingStore *v24;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMDBackingStore;
  v15 = -[HMDBackingStore init](&v26, sel_init);
  if (v15)
  {
    objc_msgSend(v14, "localBackingStore");
    v16 = objc_claimAutoreleasedReturnValue();
    local = v15->_local;
    v15->_local = (HMDBackingStoreLocal *)v16;

    objc_storeStrong((id *)&v15->_uuid, a3);
    v18 = objc_alloc(MEMORY[0x24BDB91E8]);
    objc_msgSend(v11, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithRecordName:", v19);
    root = v15->_root;
    v15->_root = (CKRecordID *)v20;

    objc_storeWeak((id *)&v15->_home, v13);
    objc_storeWeak((id *)&v15->_homeManager, v12);
    objc_storeWeak((id *)&v15->_dataSource, v14);
    if (v13)
    {
      objc_msgSend(v14, "createHomeObjectLookupWithHome:", v13);
      v22 = (HMDHomeManagerObjectLookup *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v12)
      {
LABEL_7:
        v24 = v15;
        goto LABEL_8;
      }
      v22 = -[HMDHomeManagerObjectLookup initWithHomeManager:]([HMDHomeManagerObjectLookup alloc], "initWithHomeManager:", v12);
    }
    lookup = v15->_lookup;
    v15->_lookup = &v22->super;

    goto LABEL_7;
  }
LABEL_8:

  return v15;
}

- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4
{
  if (self)
    return -[HMDBackingStore initWithUUID:homeManager:home:dataSource:](self, "initWithUUID:homeManager:home:dataSource:", a3, a4, 0, self);
  return self;
}

- (HMDBackingStore)initWithUUID:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = -[HMDBackingStore initWithUUID:homeManager:home:dataSource:](self, "initWithUUID:homeManager:home:dataSource:", v6, v8, v7, self);

  return self;
}

- (HMDBackingStore)initWithUUID:(id)a3
{
  if (self)
    return -[HMDBackingStore initWithUUID:homeManager:home:dataSource:](self, "initWithUUID:homeManager:home:dataSource:", a3, 0, 0, self);
  return self;
}

- (void)setContext:(id)a3
{
  HMCContext *v4;
  NSString *v5;
  NSString *contextName;
  NSString *v7;
  NSString *contextTransactionAuthor;
  HMCContext *context;

  v4 = (HMCContext *)a3;
  -[HMCContext name](v4, "name");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  contextName = self->_contextName;
  self->_contextName = v5;

  -[HMCContext transactionAuthor](v4, "transactionAuthor");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  contextTransactionAuthor = self->_contextTransactionAuthor;
  self->_contextTransactionAuthor = v7;

  context = self->_context;
  self->_context = v4;

}

- (id)transaction:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  HMDBackingStoreTransactionBlock *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HMDBackingStoreTransactionBlock initWithBackingStore:options:label:]([HMDBackingStoreTransactionBlock alloc], "initWithBackingStore:options:label:", self, v6, v7);

  return v8;
}

- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 coreDataBlock:(id)a6 completionHandler:(id)a7
{
  -[HMDBackingStore commit:run:save:archiveInline:coreDataBlock:completionHandler:](self, "commit:run:save:archiveInline:coreDataBlock:completionHandler:", a3, a4, a5, 0, a6, a7);
}

- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 archiveInline:(BOOL)a6 coreDataBlock:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  HMDBackingStore *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  HMDBackingStore *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void (**v28)(void *, void *);
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  id v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  HMDBackingStore *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  os_log_type_t v50;
  HMDBackingStore *v51;
  void *v52;
  uint64_t v53;
  HMDBackingStore *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v10 = a5;
  v11 = a4;
  v84 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a7;
  v15 = (void (**)(id, void *))a8;
  if (objc_msgSend(v13, "committed"))
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "options");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v19;
      v80 = 2112;
      v81 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@double-committing a transaction probably indicates a bad state (ignoring this commit) for %@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    goto LABEL_30;
  }
  objc_msgSend(v13, "setCommitted:", 1);
  objc_msgSend(v13, "objects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hmf_isEmpty");

  if (!v22)
  {
    objc_msgSend(v13, "options");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "source");

    v32 = v31 & 0xFFFFFFFFFFFFFFFELL;
    if (commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_t4 != -1)
      dispatch_once(&commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_t4, &__block_literal_global_81_216637);
    v70 = (id)commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_v5;
    -[HMDBackingStore home](self, "home");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = MEMORY[0x24BDAC760];
    v75[1] = 3221225472;
    v75[2] = __81__HMDBackingStore_commit_run_save_archiveInline_coreDataBlock_completionHandler___block_invoke_2;
    v75[3] = &unk_24E793EF0;
    v35 = v33;
    v76 = v35;
    v36 = objc_msgSend(v34, "na_any:", v75);

    if (v32 == 2)
      goto LABEL_28;
    if (!v35)
      goto LABEL_28;
    objc_msgSend(v35, "administratorHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "shouldRelayMessages");

    if (!v38)
      goto LABEL_28;
    v69 = v35;
    objc_msgSend(v13, "options");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "label");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v70, "containsObject:", v40);

    if (v41)
    {
      v42 = (void *)MEMORY[0x227676638]();
      v43 = self;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v68 = v42;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "options");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "label");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v45;
        v80 = 2112;
        v81 = v47;
        v48 = "%{public}@Transaction '%@' is temporarily allowed even while not the designated writer";
        v49 = v44;
        v50 = OS_LOG_TYPE_DEBUG;
LABEL_26:
        _os_log_impl(&dword_2218F0000, v49, v50, v48, buf, 0x16u);

        v42 = v68;
      }
LABEL_27:
      v35 = v69;

      objc_autoreleasePoolPop(v42);
LABEL_28:
      -[HMDBackingStore cdlsCommit:run:save:coreDataBlock:completionHandler:](self, "cdlsCommit:run:save:coreDataBlock:completionHandler:", v13, v11, v10, v14, v15);
LABEL_29:

      goto LABEL_30;
    }
    if (v36)
    {
      v42 = (void *)MEMORY[0x227676638]();
      v51 = self;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        goto LABEL_27;
      HMFGetLogIdentifier();
      v68 = v42;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "options");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "label");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v45;
      v80 = 2112;
      v81 = v47;
      v48 = "%{public}@Transaction '%@' is allowed even while not the designated writer because it is an allowed local fallback";
    }
    else
    {
      objc_msgSend(v13, "options");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "cdTransactionAuthor");

      v42 = (void *)MEMORY[0x227676638]();
      v54 = self;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      v44 = v55;
      if (v53 != 10)
      {
        v35 = v69;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "options");
          v57 = v42;
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "enabledResidents");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "na_map:", &__block_literal_global_89_216641);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v79 = v56;
          v80 = 2112;
          v81 = v58;
          v82 = 2114;
          v83 = v60;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Rejecting transaction commit while not designated writer: %@, residents: %{public}@", buf, 0x20u);

          v35 = v69;
          v42 = v57;

        }
        objc_autoreleasePoolPop(v42);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v15[2](v15, v61);
        }
        else
        {
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          objc_msgSend(v13, "objects");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
          if (v63)
          {
            v64 = v63;
            v65 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v64; ++i)
              {
                if (*(_QWORD *)v72 != v65)
                  objc_enumerationMutation(v62);
                objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "message");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "respondWithError:", v61);

              }
              v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
            }
            while (v64);
          }

          v35 = v69;
        }

        goto LABEL_29;
      }
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        goto LABEL_27;
      HMFGetLogIdentifier();
      v68 = v42;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "options");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "label");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v45;
      v80 = 2112;
      v81 = v47;
      v48 = "%{public}@Transaction '%@' is allowed even while not the designated writer because it is a force push";
    }
    v49 = v44;
    v50 = OS_LOG_TYPE_INFO;
    goto LABEL_26;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "options");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v79 = v26;
    v80 = 2112;
    v81 = v27;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Rejecting empty transaction: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v23);
  v28 = (void (**)(void *, void *))_Block_copy(v15);
  if (v28)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, v29);

  }
LABEL_30:

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<HMFBackingStore>"));
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackingStore uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)submitBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  HMDBackingStore *v10;
  SEL v11;
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  -[HMDBackingStore home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;

LABEL_4:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__HMDBackingStore_submitBlock___block_invoke;
    block[3] = &unk_24E799CC8;
    v14 = v4;
    v9 = v4;
    dispatch_async(v7, block);

    return;
  }
  -[HMDBackingStore homeManager](self, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  v10 = (HMDBackingStore *)_HMFPreconditionFailure();
  -[HMDBackingStore createBackingStoreLogAddTransactionOperationWithTransaction:](v10, v11, v12);
}

- (id)createBackingStoreLogAddTransactionOperationWithTransaction:(id)a3
{
  id v3;
  HMDBackingStoreLogAddTransactionOperation *v4;

  v3 = a3;
  v4 = -[HMDBackingStoreLogAddTransactionOperation initWithTransaction:]([HMDBackingStoreLogAddTransactionOperation alloc], "initWithTransaction:", v3);

  return v4;
}

- (id)createBackingStoreOperation
{
  return objc_alloc_init(HMDBackingStoreOperation);
}

- (id)localBackingStore
{
  void *v2;
  void *v3;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)backingStoreOperationQueue
{
  void *v2;
  void *v3;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createHomeObjectLookupWithHome:(id)a3
{
  id v3;
  HMDHomeObjectLookup *v4;

  v3 = a3;
  v4 = -[HMDHomeObjectLookup initWithHome:]([HMDHomeObjectLookup alloc], "initWithHome:", v3);

  return v4;
}

- (id)dataForPersistentStoreIncrementingGeneration:(BOOL)a3 reason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = a4;
  -[HMDBackingStore homeManager](self, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_dataForPersistentStoreIncrementingGeneration:reason:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)activeControllerKeyUsername
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeControllerPairingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (BOOL)isAtomicSaveFeatureEnabled
{
  isWatch();
  return 1;
}

- (CKRecordID)root
{
  return self->_root;
}

- (HMDBackingStoreLocal)local
{
  return self->_local;
}

- (void)setLocal:(id)a3
{
  objc_storeStrong((id *)&self->_local, a3);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (HMDObjectLookup)lookup
{
  return self->_lookup;
}

- (void)setLookup:(id)a3
{
  objc_storeStrong((id *)&self->_lookup, a3);
}

- (HMCContext)context
{
  return self->_context;
}

- (HMDBackingStoreObjectProtocol)delegate
{
  return (HMDBackingStoreObjectProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMBLocalZone)localZone
{
  return self->_localZone;
}

- (void)setLocalZone:(id)a3
{
  objc_storeStrong((id *)&self->_localZone, a3);
}

- (NSString)contextName
{
  return self->_contextName;
}

- (NSString)contextTransactionAuthor
{
  return self->_contextTransactionAuthor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextTransactionAuthor, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_local, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

uint64_t __31__HMDBackingStore_submitBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__HMDBackingStore_commit_run_save_archiveInline_coreDataBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "administratorHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "allowLocalFallbackForMessage:", v5);
  return v6;
}

uint64_t __81__HMDBackingStore_commit_run_save_archiveInline_coreDataBlock_completionHandler___block_invoke_87(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortDescription");
}

void __81__HMDBackingStore_commit_run_save_archiveInline_coreDataBlock_completionHandler___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E971240);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_v5;
  commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_v5 = v0;

}

+ (NSSet)allowedTypes
{
  if (allowedTypes_onceToken_216690 != -1)
    dispatch_once(&allowedTypes_onceToken_216690, &__block_literal_global_216691);
  return (NSSet *)(id)allowedTypes__allowedTypes_216692;
}

+ (NSSet)deeplyProblematicObjectTypes
{
  if (deeplyProblematicObjectTypes_onceToken != -1)
    dispatch_once(&deeplyProblematicObjectTypes_onceToken, &__block_literal_global_66_216682);
  return (NSSet *)(id)deeplyProblematicObjectTypes__neverAllowedTypes;
}

+ (NSSet)internalAllowedTypes
{
  if (internalAllowedTypes_onceToken != -1)
    dispatch_once(&internalAllowedTypes_onceToken, &__block_literal_global_73);
  return (NSSet *)(id)internalAllowedTypes__internalAllowedTypes;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_216675 != -1)
    dispatch_once(&logCategory__hmf_once_t10_216675, &__block_literal_global_92_216676);
  return (id)logCategory__hmf_once_v11_216677;
}

+ (void)saveToPersistentStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __127__HMDBackingStore_saveToPersistentStoreWithReason_homeManager_shouldIncrementGenerationCounter_backingStore_completionHandler___block_invoke;
  v20[3] = &unk_24E793F78;
  v24 = v15;
  v25 = a1;
  v21 = v12;
  v22 = v13;
  v26 = a5;
  v23 = v14;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  objc_msgSend(v17, "submitBlock:", v20);

}

+ (id)_saveToLocalStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id *v12;
  _BOOL8 v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id WeakRetained;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id *v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v7 = a5;
  v79 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (id *)a6;
  v13 = isWatch();
  v14 = (void *)MEMORY[0x227676638](v13);
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v74 = v17;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Running HMDBackingStoreSaveToPersistentStore operation to save.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeControllerPairingIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");

  if (v20)
  {
    v21 = v10;
    if (v12)
    {
      WeakRetained = objc_loadWeakRetained(v12 + 10);
      objc_msgSend(WeakRetained, "activeControllerKeyUsername");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v69 = v11;
        v70 = v23;
        v68 = v21;
        v24 = v21;
        v25 = objc_loadWeakRetained(v12 + 10);
        v26 = (void *)MEMORY[0x227676638]();
        v67 = v24;
        objc_msgSend(v25, "dataForPersistentStoreIncrementingGeneration:reason:", v7, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27 && objc_msgSend(v27, "length"))
        {
          v65 = v25;
          v29 = (void *)MEMORY[0x227676638]();
          v30 = v12;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v64 = v29;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v28, "length"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v74 = v32;
            v75 = 2112;
            v76 = v70;
            v77 = 2112;
            v78 = v33;
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Controller User Name : [%@], Saving home data size: %@", buf, 0x20u);

            v29 = v64;
          }

          objc_autoreleasePoolPop(v29);
          objc_msgSend(v30, "local");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 0;
          objc_msgSend(v34, "_insertArchive:identifier:controllerUserName:error:", v28, CFSTR("homedata"), v70, &v71);
          v35 = v71;

          objc_autoreleasePoolPop(v26);
          v11 = v69;
          v25 = v65;
          if (!v35)
          {
            if (((_BYTE)v30[1] & 1) == 0)
            {
              v36 = (void *)MEMORY[0x227676638]();
              v37 = v30;
              HMFGetOSLogHandle();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v74 = v39;
                _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Will attempt to remove legacy archive", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v36);
              objc_msgSend(v37, "homeManager");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = 0;
              v41 = objc_msgSend(v40, "_removeLegacyHomeArchive:", &v72);
              v42 = v72;

              if ((v41 & 1) != 0)
              {
                *((_BYTE *)v37 + 8) = 1;
              }
              else
              {
                v61 = (void *)MEMORY[0x227676638]();
                HMFGetOSLogHandle();
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v74 = v63;
                  v75 = 2112;
                  v76 = v42;
                  _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove home data error:%@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v61);
              }
              v25 = v65;

            }
            v35 = 0;
          }
        }
        else
        {
          v47 = (void *)MEMORY[0x227676638]();
          v48 = v12;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v66 = v20;
            v50 = v23;
            v51 = v10;
            v52 = v26;
            v53 = v25;
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v74 = v54;
            _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@No home data to save.", buf, 0xCu);

            v25 = v53;
            v26 = v52;
            v10 = v51;
            v23 = v50;
            v20 = v66;
          }

          objc_autoreleasePoolPop(v47);
          objc_autoreleasePoolPop(v26);
          v35 = 0;
          v11 = v69;
        }

        v21 = v68;
      }
      else
      {
        v55 = (void *)MEMORY[0x227676638]();
        v56 = v12;
        HMFGetOSLogHandle();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v58 = v21;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v74 = v59;
          _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_ERROR, "%{public}@Could not find controller key when trying to save home archive", buf, 0xCu);

          v21 = v58;
        }

        objc_autoreleasePoolPop(v55);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    v43 = (void *)MEMORY[0x227676638]();
    v44 = v15;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v46;
      _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not find controller key when trying to run transaction", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v35;
}

void __127__HMDBackingStore_saveToPersistentStoreWithReason_homeManager_shouldIncrementGenerationCounter_backingStore_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_saveToLocalStoreWithReason:homeManager:shouldIncrementGenerationCounter:backingStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

void __30__HMDBackingStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_216677;
  logCategory__hmf_once_v11_216677 = v0;

}

void __39__HMDBackingStore_internalAllowedTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDBCF20];
  +[HMDBackingStore allowedTypes](HMDBackingStore, "allowedTypes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithSet:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObject:", objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)internalAllowedTypes__internalAllowedTypes;
  internalAllowedTypes__internalAllowedTypes = v2;

}

void __47__HMDBackingStore_deeplyProblematicObjectTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)deeplyProblematicObjectTypes__neverAllowedTypes;
  deeplyProblematicObjectTypes__neverAllowedTypes = v2;

}

void __31__HMDBackingStore_allowedTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowedTypes__allowedTypes_216692;
  allowedTypes__allowedTypes_216692 = v2;

}

@end
