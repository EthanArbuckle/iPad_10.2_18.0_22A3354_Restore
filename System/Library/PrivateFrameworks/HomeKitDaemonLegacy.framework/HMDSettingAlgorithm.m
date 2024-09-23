@implementation HMDSettingAlgorithm

+ (id)allSettingsFromRootGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__HMDSettingAlgorithm_allSettingsFromRootGroup___block_invoke;
    v7[3] = &unk_1E89AE7C0;
    v8 = v4;
    BFSTraverseGroupWithBlock(v3, v7);

  }
  return v5;
}

+ (id)allGroupsFromRootGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__HMDSettingAlgorithm_allGroupsFromRootGroup___block_invoke;
    v7[3] = &unk_1E89AE7C0;
    v8 = v4;
    BFSTraverseGroupWithBlock(v3, v7);

  }
  return v5;
}

+ (void)findChangedSettingsWithRootGroup:(id)a3 currentGroups:(id)a4 currentSettings:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  uint64_t v50;
  void *v51;
  void *v52;
  void *context;
  void *contexta;
  void (**v55)(id, void *, void *, id, id, id, id);
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id obj;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v64 = a5;
  v55 = (void (**)(id, void *, void *, id, id, id, id))a6;
  context = (void *)MEMORY[0x1D17BA0A0]();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = v13;
  if (v10)
  {
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __97__HMDSettingAlgorithm_findChangedSettingsWithRootGroup_currentGroups_currentSettings_completion___block_invoke;
    v81[3] = &unk_1E89AE810;
    v82 = v13;
    v84 = a1;
    v83 = v12;
    BFSTraverseGroupWithBlock(v10, v81);

  }
  v61 = v14;
  v56 = v10;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable", context);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v12;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v78 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v21, v22);

        objc_msgSend(v21, "identifier");
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)v23;
          objc_msgSend(v21, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
            objc_msgSend(v60, "addObject:", v21);
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
    }
    while (v18);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v62 = v61;
  v27 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v74 != v29)
          objc_enumerationMutation(v62);
        v31 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        objc_msgSend(v31, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v31, v32);

        objc_msgSend(v31, "identifier");
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v34 = (void *)v33;
          objc_msgSend(v31, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
            objc_msgSend(v59, "addObject:", v31);
        }
      }
      v28 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    }
    while (v28);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v37 = v11;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v70 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k);
        objc_msgSend(v16, "objectForKey:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v43)
        {
          objc_msgSend(v37, "objectForKey:", v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
            objc_msgSend(v57, "addObject:", v44);

        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
    }
    while (v39);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v45 = v64;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v66;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v66 != v48)
          objc_enumerationMutation(v45);
        v50 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * m);
        objc_msgSend(v15, "objectForKey:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v51)
        {
          objc_msgSend(v45, "objectForKey:", v50);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
            objc_msgSend(v58, "addObject:", v52);

        }
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
    }
    while (v47);
  }

  v55[2](v55, v16, v15, v59, v60, v57, v58);
  objc_autoreleasePoolPop(contexta);

}

uint64_t __97__HMDSettingAlgorithm_findChangedSettingsWithRootGroup_currentGroups_currentSettings_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDAssertionLogEvent *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __97__HMDSettingAlgorithm_findChangedSettingsWithRootGroup_currentGroups_currentSettings_completion___block_invoke_2;
  v25[3] = &unk_1E89AE7E8;
  v8 = v5;
  v26 = v8;
  if (objc_msgSend(v7, "na_any:", v25))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = a1[6];
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Multiple groups collison", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Multiple groups collison"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "submitLogEvent:", v13);

    v15 = v26;
  }
  else
  {

    objc_msgSend(a1[4], "addObject:", v8);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(a1[5], "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++), (_QWORD)v21);
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v17);
    }
  }

  return 1;
}

uint64_t __97__HMDSettingAlgorithm_findChangedSettingsWithRootGroup_currentGroups_currentSettings_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __46__HMDSettingAlgorithm_allGroupsFromRootGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

uint64_t __48__HMDSettingAlgorithm_allSettingsFromRootGroup___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
  return 1;
}

@end
