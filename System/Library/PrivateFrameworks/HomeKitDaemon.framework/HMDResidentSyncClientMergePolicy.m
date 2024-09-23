@implementation HMDResidentSyncClientMergePolicy

- (HMDResidentSyncClientMergePolicy)init
{
  return -[HMDResidentSyncClientMergePolicy initWithFaultLogging:](self, "initWithFaultLogging:", 1);
}

- (HMDResidentSyncClientMergePolicy)initWithFaultLogging:(BOOL)a3
{
  _BOOL4 v3;
  HMDResidentSyncClientMergePolicy *result;
  unsigned __int8 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HMDResidentSyncClientMergePolicy;
  result = -[NSMergePolicy initWithMergeType:](&v6, sel_initWithMergeType_, 2);
  if (result)
  {
    if (v3)
      v5 = 17;
    else
      v5 = 16;
    result->_faultLogType = v5;
  }
  return result;
}

- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HMDResidentSyncClientMergePolicy *v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  HMDResidentSyncClientMergePolicy *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDResidentSyncClientMergePolicy *v20;
  NSObject *v21;
  void *v22;
  objc_super v24;
  id v25;
  id v26;
  _QWORD v27[6];
  uint8_t v28[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE buf[24];
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Detected %tu merge conflict(s)", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v33 = 1;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __83__HMDResidentSyncClientMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke;
  v27[3] = &unk_24E78CBC8;
  v27[4] = v8;
  v27[5] = buf;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v14 = (void *)*MEMORY[0x24BDBB410];
    v26 = 0;
    v13 = objc_msgSend(v14, "resolveOptimisticLockingVersionConflicts:error:", v6, &v26);
    v12 = v26;
    if (!a4)
      goto LABEL_14;
    goto LABEL_13;
  }
  v24.receiver = v8;
  v24.super_class = (Class)HMDResidentSyncClientMergePolicy;
  v25 = 0;
  v11 = -[NSMergePolicy resolveOptimisticLockingVersionConflicts:error:](&v24, sel_resolveOptimisticLockingVersionConflicts_error_, v6, &v25);
  v12 = v25;
  if ((v11 & 1) != 0)
  {
    v13 = 1;
    goto LABEL_14;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = v8;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v28 = 138543362;
    v29 = v18;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@NSMergeByPropertyObjectTrumpMergePolicy failed to resolve merge conflicts", v28, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  v19 = (void *)MEMORY[0x227676638]();
  v20 = v16;
  HMFGetOSLogHandle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v28 = 138543618;
    v29 = v22;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEBUG, "%{public}@%@", v28, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  v13 = 0;
  if (a4)
  {
LABEL_13:
    v12 = objc_retainAutorelease(v12);
    *a4 = v12;
  }
LABEL_14:

  _Block_object_dispose(buf, 8);
  return v13;
}

- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  HMDResidentSyncClientMergePolicy *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDResidentSyncClientMergePolicy *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)*MEMORY[0x24BDBB410];
  v19 = 0;
  v8 = objc_msgSend(v7, "resolveConstraintConflicts:error:", v6, &v19);
  v9 = v19;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Refusing to merge constraint violations", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  v14 = (void *)MEMORY[0x227676638]();
  v15 = v11;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v17;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (id)logIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __83__HMDResidentSyncClientMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _BYTE *v9;
  NSObject *v10;
  void *v11;
  os_log_type_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  BOOL v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _BYTE buf[24];
  void *v71;
  _BYTE v72[24];
  id v73;
  id v74;
  id v75;
  id v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v47 = (void *)MEMORY[0x227676638]();
  v48 = a1;
  v6 = *(void **)(a1 + 32);
  v7 = v5;
  v50 = v7;
  if (v6)
  {
    objc_msgSend(v7, "sourceObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "newVersionNumber"))
    {
      if (!objc_msgSend(v49, "isDeleted"))
      {
        objc_msgSend(v50, "objectSnapshot");
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "cachedSnapshot");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v15)
        {
          v18 = (void *)v16;
          v17 = (void *)v15;
        }
        else
        {
          objc_msgSend(v50, "persistedSnapshot");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v49, "changedValues");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = MEMORY[0x24BDAC760];
        v67[1] = 3221225472;
        v67[2] = __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke;
        v67[3] = &unk_24E78CBF0;
        v45 = v18;
        v68 = v45;
        v20 = v19;
        v69 = v20;
        objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v67);
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

        if ((_DWORD)v19)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v64[0] = MEMORY[0x24BDAC760];
          v64[1] = 3221225472;
          v64[2] = __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_2;
          v64[3] = &unk_24E78CBF0;
          v65 = v17;
          v23 = v22;
          v66 = v23;
          v24 = (void *)MEMORY[0x227676638](objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v64));
          v25 = v6;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "hmd_debugIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            *(_QWORD *)&buf[4] = v27;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = a3;
            *(_WORD *)&buf[22] = 2112;
            v71 = v28;
            *(_WORD *)v72 = 2112;
            *(_QWORD *)&v72[2] = v23;
            *(_WORD *)&v72[10] = 2112;
            *(_QWORD *)&v72[12] = v20;
            _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Conflict %tu on %@:\nnew: %@\nconflict: %@", buf, 0x34u);

          }
          objc_autoreleasePoolPop(v24);

        }
        objc_msgSend(v49, "entity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "propertiesByName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        v63 = 1;
        v31 = MEMORY[0x24BDAC760];
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_21;
        v71 = &unk_24E78CC18;
        v32 = v20;
        *(_QWORD *)v72 = v32;
        *(_QWORD *)&v72[8] = v6;
        v33 = v50;
        *(_QWORD *)&v72[16] = v33;
        v78 = a3;
        v34 = v29;
        v73 = v34;
        v35 = v30;
        v74 = v35;
        v36 = v17;
        v75 = v36;
        v37 = v45;
        v76 = v37;
        v77 = &v60;
        objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", buf);
        v51[0] = v31;
        v51[1] = 3221225472;
        v51[2] = __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_2_22;
        v51[3] = &unk_24E78CC40;
        v51[4] = v6;
        v52 = v33;
        v59 = a3;
        v38 = v34;
        v53 = v38;
        v39 = v35;
        v54 = v39;
        v40 = v46;
        v55 = v40;
        v41 = v36;
        v56 = v41;
        v42 = v37;
        v57 = v42;
        v58 = &v60;
        objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v51);
        v14 = *((_BYTE *)v61 + 24) != 0;

        _Block_object_dispose(&v60, 8);
        goto LABEL_18;
      }
      v8 = (void *)MEMORY[0x227676638]();
      v9 = v6;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a3;
        *(_WORD *)&buf[22] = 2112;
        v71 = v49;
        *(_WORD *)v72 = 2112;
        *(_QWORD *)&v72[2] = v50;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu is on %@ that is being deleted by resident sync, could have merged but refusing instead: %@", buf, 0x2Au);

      }
    }
    else
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = v6;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v12 = v9[32];
      if (os_log_type_enabled(v10, v12))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a3;
        *(_WORD *)&buf[22] = 2112;
        v71 = v49;
        *(_WORD *)v72 = 2112;
        *(_QWORD *)&v72[2] = v50;
        _os_log_impl(&dword_2218F0000, v10, v12, "%{public}@Conflict %tu is on %@ that was deleted locally: %@", buf, 0x2Au);

      }
    }

    objc_autoreleasePoolPop(v8);
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:

  v43 = *(_QWORD *)(*(_QWORD *)(v48 + 40) + 8);
  if (*(_BYTE *)(v43 + 24))
    v44 = v14;
  else
    v44 = 0;
  *(_BYTE *)(v43 + 24) = v44;
  objc_autoreleasePoolPop(v47);

}

void __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ --> %@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v8;
  if (v8)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ --> %@"), v8, v6);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v6, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v7);
}

void __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  _BYTE *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  os_log_type_t *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint32_t v54;
  int v55;
  int v56;
  int v57;
  void *v58;
  id v59;
  void *v60;
  _BYTE *v61;
  NSObject *v62;
  os_log_type_t v63;
  void *v64;
  os_log_type_t *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  int v69;
  uint64_t v70;
  void *v71;
  _BYTE *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  const char *v76;
  NSObject *v77;
  os_log_type_t v78;
  uint32_t v79;
  int v80;
  void *v81;
  os_log_type_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *context;
  void *contexta;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  id v97;
  uint8_t buf[4];
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  id v103;
  __int16 v104;
  id v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v4);
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(void **)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v9 = *(void **)(a1 + 72);
  v10 = *(void **)(a1 + 80);
  v11 = *(id *)(a1 + 48);
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = v10;
  v97 = v4;
  if (!v5)
    goto LABEL_60;
  +[MKFResidentSyncMetadata entity](MKFResidentSyncMetadata, "entity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "isEqual:", v16);

  if (v17)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v5;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v19[32];
    if (os_log_type_enabled(v20, v21))
    {
      HMFGetLogIdentifier();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v6;
      v24 = v11;
      v25 = v15;
      v26 = (void *)v22;
      *(_DWORD *)buf = 138544130;
      v99 = v22;
      v100 = 2048;
      v101 = v23;
      v102 = 2114;
      v103 = v97;
      v104 = 2112;
      v105 = v24;
      _os_log_impl(&dword_2218F0000, v20, v21, "%{public}@Conflict %tu on %{public}@ that should only be modified by resident sync, overwriting: %@", buf, 0x2Au);

      v15 = v25;
      v11 = v24;
    }

    objc_autoreleasePoolPop(v18);
    goto LABEL_6;
  }
  v96 = v6;
  objc_msgSend(v13, "objectForKeyedSubscript:", v97);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v28 = v27;
  else
    v28 = 0;
  v29 = v28;

  if (!v29)
  {
    v92 = v14;
    v95 = v15;
    v35 = v27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v35;
    else
      v36 = 0;
    v37 = v36;

    if (!v37)
      goto LABEL_58;
    v87 = v37;
    if (objc_msgSend(v97, "isEqualToString:", CFSTR("residentSyncMetadata")))
    {
      +[_MKFHome entity](_MKFHome, "entity");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v12, "isEqual:", v38);

      if (v39)
      {
        v85 = (void *)MEMORY[0x227676638]();
        v40 = v5;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = *((_BYTE *)v40 + 32);
        if (os_log_type_enabled(v41, v42))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v99 = (uint64_t)v43;
          v100 = 2048;
          v101 = v96;
          v102 = 2114;
          v103 = v97;
          _os_log_impl(&dword_2218F0000, v41, v42, "%{public}@Conflict %tu is on '%{public}@' that should only be modified by resident sync, overwriting", buf, 0x20u);

        }
        v14 = v92;
        v44 = v87;
        v45 = v41;
LABEL_41:
        v58 = v85;
LABEL_42:

        objc_autoreleasePoolPop(v58);
LABEL_6:

LABEL_15:
        return;
      }
    }
    v55 = isRelationshipIncludedInResidentSync(v87);
    v56 = objc_msgSend(v87, "isToMany");
    v57 = v56;
    if (!v55)
    {
      v85 = (void *)MEMORY[0x227676638]();
      v65 = v5;
      HMFGetOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = v66;
      if (v57)
      {
        v44 = v87;
        v45 = v66;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v99 = (uint64_t)v68;
          v100 = 2048;
          v101 = v96;
          v102 = 2114;
          v103 = v97;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu is on to-many relationship '%{public}@' that is not included in resident sync, allowing", buf, 0x20u);

        }
        v14 = v92;
        goto LABEL_41;
      }
      v80 = *((unsigned __int8 *)v65 + 32);
      if (os_log_type_enabled(v66, v65[32]))
      {
        HMFGetLogIdentifier();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v99 = (uint64_t)v81;
        v100 = 2048;
        v101 = v96;
        v102 = 2114;
        v103 = v97;
        v104 = 2112;
        v105 = v11;
        _os_log_impl(&dword_2218F0000, v67, (os_log_type_t)v80, "%{public}@Conflict %tu on to-one relationship '%{public}@' that is not included in resident sync: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v85);
      goto LABEL_57;
    }
    if (v56)
    {
      v58 = (void *)MEMORY[0x227676638]();
      v59 = v5;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v99 = (uint64_t)v60;
        v100 = 2048;
        v101 = v96;
        v102 = 2114;
        v103 = v97;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu is on to-many relationship '%{public}@' that is included in resident sync, allowing", buf, 0x20u);

      }
      v14 = v92;
      v44 = v87;
      goto LABEL_42;
    }
    objc_msgSend(v92, "objectForKeyedSubscript:", v97);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v97);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v71;
    LODWORD(v71) = objc_msgSend(v71, "isEqual:");
    v83 = (void *)MEMORY[0x227676638]();
    v72 = v5;
    HMFGetOSLogHandle();
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = v73;
    if ((_DWORD)v71)
    {
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v99 = (uint64_t)v75;
        v100 = 2048;
        v101 = v96;
        v102 = 2114;
        v103 = v97;
        v76 = "%{public}@Conflict %tu on to-one relationship '%{public}@' that is only modified by resident sync, could h"
              "ave safely resolved but refusing instead";
        v77 = v74;
        v78 = OS_LOG_TYPE_INFO;
        v79 = 32;
LABEL_55:
        _os_log_impl(&dword_2218F0000, v77, v78, v76, buf, v79);

      }
    }
    else
    {
      v82 = v72[32];
      if (os_log_type_enabled(v73, v82))
      {
        HMFGetLogIdentifier();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v99 = (uint64_t)v75;
        v100 = 2048;
        v101 = v96;
        v102 = 2114;
        v103 = v97;
        v104 = 2112;
        v105 = v11;
        v76 = "%{public}@Conflict %tu on to-one relationship '%{public}@' that should only be modified by resident sync: %@";
        v77 = v74;
        v78 = v82;
        v79 = 42;
        goto LABEL_55;
      }
    }

    objc_autoreleasePoolPop(v83);
LABEL_57:
    v37 = v87;
LABEL_58:

    v29 = 0;
    v14 = v92;
    goto LABEL_59;
  }
  if (objc_msgSend(v97, "isEqualToString:", CFSTR("writerTimestamp")))
  {
    v91 = v11;
    v30 = v15;
    v31 = (void *)MEMORY[0x227676638]();
    v32 = v5;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v99 = (uint64_t)v34;
      v100 = 2048;
      v101 = v96;
      v102 = 2114;
      v103 = v97;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu on attribute '%{public}@', overwriting", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);

    goto LABEL_15;
  }
  v95 = v15;
  if (!isAttributeIncludedInResidentSync(v29))
  {
    contexta = (void *)MEMORY[0x227676638]();
    v61 = v5;
    HMFGetOSLogHandle();
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = v61[32];
    if (os_log_type_enabled(v62, v63))
    {
      HMFGetLogIdentifier();
      v94 = v14;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v99 = (uint64_t)v64;
      v100 = 2048;
      v101 = v96;
      v102 = 2114;
      v103 = v97;
      v104 = 2112;
      v105 = v11;
      _os_log_impl(&dword_2218F0000, v62, v63, "%{public}@Conflict %tu on attribute '%{public}@' that resident sync should not have modified: %@", buf, 0x2Au);

      v14 = v94;
    }

    objc_autoreleasePoolPop(contexta);
    goto LABEL_59;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", v97);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v97);
  context = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v46;
  LODWORD(v46) = objc_msgSend(v46, "isEqual:");
  v88 = (void *)MEMORY[0x227676638]();
  v47 = v5;
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if ((_DWORD)v46)
  {
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v99 = (uint64_t)v50;
      v100 = 2048;
      v101 = v96;
      v102 = 2114;
      v103 = v97;
      v51 = "%{public}@Conflict %tu on attribute '%{public}@' that is only modified by resident sync, could have safely r"
            "esolved but refusing instead";
      v52 = v49;
      v53 = OS_LOG_TYPE_INFO;
      v54 = 32;
LABEL_45:
      _os_log_impl(&dword_2218F0000, v52, v53, v51, buf, v54);

    }
  }
  else
  {
    v69 = *((unsigned __int8 *)v47 + 32);
    if (os_log_type_enabled(v48, v47[32]))
    {
      HMFGetLogIdentifier();
      v70 = objc_claimAutoreleasedReturnValue();
      v53 = v69;
      v50 = (void *)v70;
      *(_DWORD *)buf = 138544130;
      v99 = v70;
      v100 = 2048;
      v101 = v96;
      v102 = 2114;
      v103 = v97;
      v104 = 2112;
      v105 = v11;
      v51 = "%{public}@Conflict %tu on attribute '%{public}@' that should only be modified by resident sync: %@";
      v52 = v49;
      v54 = 42;
      goto LABEL_45;
    }
  }

  objc_autoreleasePoolPop(v88);
LABEL_59:

  v15 = v95;
LABEL_60:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
}

void __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_2_22(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  int v38;
  _BYTE *v39;
  NSObject *v40;
  NSObject *v41;
  os_log_type_t v42;
  void *v43;
  const char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint32_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  int v58;
  _BYTE *v59;
  NSObject *v60;
  NSObject *v61;
  os_log_type_t v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  int v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *context;
  void *contexta;
  void *contextb;
  void *contextc;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v90 = *(_QWORD *)(a1 + 96);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  v8 = *(void **)(a1 + 72);
  v9 = *(void **)(a1 + 80);
  v91 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = a2;
  if (!v4)
    goto LABEL_47;
  +[MKFResidentSyncMetadata entity](MKFResidentSyncMetadata, "entity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v10, "isEqual:", v16);

  if (v17)
  {
    v18 = v10;
    v19 = v15;
    context = v11;
    v87 = v18;
    v20 = v12;
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v4;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v22[32];
    v25 = v91;
    if (os_log_type_enabled(v23, v24))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v93 = v26;
      v94 = 2048;
      v95 = v90;
      v96 = 2114;
      v97 = v19;
      v98 = 2112;
      v99 = v91;
      _os_log_impl(&dword_2218F0000, v23, v24, "%{public}@Conflict %tu has local changes on %{public}@ that should only be modified by resident sync, overwriting: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v21);

    goto LABEL_15;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v15);
  v27 = v15;
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;
  v30 = v29;

  v88 = v30;
  v89 = v27;
  if (v30)
  {
    if (objc_msgSend(v27, "isEqualToString:", CFSTR("writerTimestamp")))
    {
      contexta = v12;
      v31 = (void *)MEMORY[0x227676638]();
      v32 = v4;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v93 = v34;
        v94 = 2048;
        v95 = v90;
        v96 = 2114;
        v97 = v89;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu has local change on attribute '%{public}@', ignoring", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v31);
      v25 = v91;
LABEL_14:

LABEL_15:
      return;
    }
    v82 = v13;
    if (!objc_msgSend(v27, "isEqualToString:", CFSTR("location")))
      goto LABEL_35;
    contexta = v12;
    objc_msgSend(v12, "objectForKeyedSubscript:", v27);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v49 = v48;
    else
      v49 = 0;
    v50 = v49;

    objc_msgSend(v82, "objectForKeyedSubscript:", v89);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v52 = v51;
    else
      v52 = 0;
    v53 = v52;

    objc_msgSend(v14, "objectForKeyedSubscript:", v89);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v55 = v54;
    else
      v55 = 0;
    v56 = v55;

    if (v50)
      goto LABEL_34;
    v64 = v56;
    v76 = v53;
    v65 = v53;
    v66 = v64;
    v67 = v65;
    if (v66 == v65)
    {
      v75 = v66;

    }
    else
    {
      if (!v65 || !v66)
      {

        v50 = 0;
        v53 = v76;
        goto LABEL_34;
      }
      objc_msgSend(v66, "jsonObject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "jsonObject");
      v79 = v67;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v68, "isEqualToDictionary:", v69);

      v67 = v79;
      v75 = v66;

      v50 = 0;
      v53 = v76;
      if (!v74)
      {
LABEL_34:

        v12 = contexta;
        v30 = v88;
LABEL_35:
        v57 = v12;
        v58 = isAttributeIncludedInResidentSync(v30);
        contextc = (void *)MEMORY[0x227676638]();
        v59 = v4;
        HMFGetOSLogHandle();
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (v58)
        {
          v62 = v59[32];
          if (os_log_type_enabled(v60, v62))
          {
            HMFGetLogIdentifier();
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v93 = v78;
            v94 = 2048;
            v95 = v90;
            v96 = 2114;
            v97 = v89;
            v98 = 2112;
            v99 = v91;
            _os_log_impl(&dword_2218F0000, v61, v62, "%{public}@Conflict %tu has local change on attribute '%{public}@' that should only be modified by resident sync: %@", buf, 0x2Au);

          }
        }
        else if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v93 = v63;
          v94 = 2048;
          v95 = v90;
          v96 = 2114;
          v97 = v89;
          _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu has local change on attribute '%{public}@' that is not included in resident sync, could have safely resolved but refusing instead", buf, 0x20u);

        }
        objc_autoreleasePoolPop(contextc);
        v12 = v57;
        v13 = v82;
        goto LABEL_46;
      }
    }
    v80 = v67;
    v70 = (void *)MEMORY[0x227676638]();
    v71 = v4;
    HMFGetOSLogHandle();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v93 = v73;
      v94 = 2048;
      v95 = v90;
      v96 = 2114;
      v97 = v89;
      _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu on attribute '%{public}@', allowing since was not modified by current context and conflicting value is equal to base value", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v70);

    v25 = v91;
    v13 = v82;
    goto LABEL_14;
  }
  v35 = v28;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v35;
  else
    v36 = 0;
  v37 = v36;

  if (v37)
  {
    v81 = v13;
    contextb = v12;
    v38 = isRelationshipIncludedInResidentSync(v37);
    v77 = (void *)MEMORY[0x227676638]();
    v39 = v4;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v38)
    {
      v42 = v39[32];
      if (os_log_type_enabled(v40, v42))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v93 = v43;
        v94 = 2048;
        v95 = v90;
        v96 = 2114;
        v97 = v89;
        v98 = 2112;
        v99 = v91;
        v44 = "%{public}@Conflict %tu has local change on to-one relationship '%{public}@' that should only be modified b"
              "y resident sync: %@";
        v45 = v41;
        v46 = v42;
        v47 = 42;
LABEL_43:
        _os_log_impl(&dword_2218F0000, v45, v46, v44, buf, v47);

      }
    }
    else if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v93 = v43;
      v94 = 2048;
      v95 = v90;
      v96 = 2114;
      v97 = v89;
      v44 = "%{public}@Conflict %tu has local change on to-one relationship '%{public}@' that is not included in resident"
            " sync, could have safely resolved but refusing instead";
      v45 = v41;
      v46 = OS_LOG_TYPE_INFO;
      v47 = 32;
      goto LABEL_43;
    }

    objc_autoreleasePoolPop(v77);
    v13 = v81;
    v12 = contextb;
  }

LABEL_46:
  v15 = v89;
LABEL_47:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
}

+ (id)logCategory
{
  return +[HMDResidentSyncManager logCategory](HMDResidentSyncManager, "logCategory");
}

@end
