@implementation _DKSyncPolicy

+ (id)policy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint8_t v13[16];

  v3 = (void *)objc_opt_new();
  +[_DKSyncPolicy configurationPlist]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  +[_DKSync2Policy userDefaults]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("CloudSyncPolicy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "addEntriesFromDictionary:", v6);
  +[_DKSyncPolicy policyFromDictionary:]((uint64_t)a1, v3);
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToDictionary:", policy_previousPolicyDict) & 1) == 0)
  {
    v8 = policy_previousPolicyDict;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
        +[_DKSyncPolicy policy].cold.2();
    }
    else if (v10)
    {
      +[_DKSyncPolicy policy].cold.1();
    }

    objc_storeStrong((id *)&policy_previousPolicyDict, v3);
  }
  if (+[_DKCloudUtilities isUnitTesting](_DKCloudUtilities, "isUnitTesting")
    && objc_msgSend(v7, "syncDisabled"))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_INFO, "Enabling sync due to unit testing", v13, 2u);
    }

    if (v7)
      v7[8] = 0;
  }

  return v7;
}

+ (id)configurationPlist
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0C99D80];
  +[_DKSyncPolicy syncPolicyConfigPath]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      +[_DKSyncPolicy syncPolicyConfigPath]();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DDBE000, v3, OS_LOG_TYPE_INFO, "Failed to read policy file: %@", (uint8_t *)&v6, 0xCu);

    }
    v2 = 0;
  }
  return v2;
}

+ (Class)policyFromDictionary:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  char v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  objc_class *v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  Class v97;
  Class v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;

  v2 = a2;
  v97 = (Class)objc_opt_self();
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = (id)MEMORY[0x1E0C9AA70];
  }
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SyncDisabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SyncDisabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    v103 = v7;
  }
  else
  {

    if (v8)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.16(v2, v3, v9);

    }
    v103 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AlwaysSyncUpAndDown"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AlwaysSyncUpAndDown"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    v102 = v12;
  }
  else
  {

    if (v13)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.15(v2, v3, v14);

    }
    v102 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AssetThresholdInBytes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AssetThresholdInBytes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v16 & 1) != 0)
  {
    v101 = v17;
  }
  else
  {

    if (v18)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.14(v2, v3, v19);

    }
    v101 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FirstSyncPeriodInDays"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FirstSyncPeriodInDays"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if ((v21 & 1) != 0)
  {
    v99 = v22;
  }
  else
  {

    if (v23)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.13(v2, v3, v24);

    }
    v99 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MaxSyncDownIntervalInDays"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MaxSyncDownIntervalInDays"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if ((v26 & 1) != 0)
  {
    v100 = v27;
  }
  else
  {

    if (v28)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.12(v2, v3, v29);

    }
    v100 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinSyncIntervalInSeconds"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinSyncIntervalInSeconds"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if ((v31 & 1) != 0)
  {
    v96 = v32;
  }
  else
  {

    if (v33)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.11(v2, v3, v34);

    }
    v96 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinSyncsPerDay"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinSyncsPerDay"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if ((v36 & 1) != 0)
  {
    v95 = v37;
  }
  else
  {

    if (v38)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.10(v2, v3, v39);

    }
    v95 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MaxSyncsPerDay"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MaxSyncsPerDay"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if ((v41 & 1) != 0)
  {
    v94 = v42;
  }
  else
  {

    if (v43)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.9(v2, v3, v44);

    }
    v94 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NumChangesTriggeringSync"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NumChangesTriggeringSync"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if ((v46 & 1) != 0)
  {
    v93 = v47;
    v49 = v4;
  }
  else
  {

    v49 = v4;
    if (v48)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.8(v2, v3, v50);

    }
    v93 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PolicyDownloadIntervalInDays"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PolicyDownloadIntervalInDays"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if ((v52 & 1) != 0)
  {
    v92 = v53;
  }
  else
  {

    if (v54)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.7(v2, v3, v55);

    }
    v92 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PushTriggersSync"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PushTriggersSync"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if ((v57 & 1) != 0 || (v58, !v59))
  {
    v61 = v49;
  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = v49;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      +[_DKSyncPolicy policyFromDictionary:].cold.6(v2, v3, v60);

    v59 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SingleDeviceSyncIntervalInDays"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SingleDeviceSyncIntervalInDays"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if ((v63 & 1) != 0)
  {
    v66 = v64;
  }
  else
  {

    if (v65)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.5(v2, v3, v67);

    }
    v66 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("StreamNamesWithAdditionsTriggeringSync"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("StreamNamesWithAdditionsTriggeringSync"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if ((v69 & 1) != 0)
  {
    v72 = v70;
  }
  else
  {

    if (v71)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.4(v2, v61, v73);

    }
    v72 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("StreamNamesWithDeletionsTriggeringSync"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("StreamNamesWithDeletionsTriggeringSync"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if ((v75 & 1) == 0)
  {

    if (v77)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.3(v2, v61, v78);

      v77 = 0;
    }
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SyncTimeoutInSeconds"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SyncTimeoutInSeconds"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if ((v80 & 1) == 0)
  {

    if (v82)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        +[_DKSyncPolicy policyFromDictionary:].cold.2(v2, v3, v83);

      v82 = 0;
    }
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TriggeredSyncDelayInSeconds"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_opt_isKindOfClass();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TriggeredSyncDelayInSeconds"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v86;
  if ((v85 & 1) != 0 || (v86, !v87))
  {
    v90 = v97;
    v89 = v103;
  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = v103;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      +[_DKSyncPolicy policyFromDictionary:].cold.1(v2, v3, v88);

    v87 = 0;
    v90 = v97;
  }
  v98 = (Class)-[_DKSyncPolicy initWithSyncDisabled:alwaysSyncUpAndDown:assetThresholdInBytes:firstSyncPeriodInDays:maxSyncDownIntervalInDays:minSyncIntervalInSeconds:minSyncsPerDay:maxSyncsPerDay:numChangesTriggeringSync:policyDownloadIntervalInDays:pushTriggersSync:singleDeviceSyncIntervalInDays:streamNamesWithAdditionsTriggeringSync:streamNamesWithDeletionsTriggeringSync:syncTimeoutInSeconds:triggeredSyncDelayInSeconds:]([v90 alloc], v89, v102, v101, v99, v100, v96, v95, v94, v93, v92, v59, v66, v72, v77, v82, v87);

  return v98;
}

+ (id)forceSyncPolicy
{
  id result;

  result = (id)objc_msgSend(a1, "policy");
  if (result)
  {
    *((_BYTE *)result + 11) = 1;
    *((_BYTE *)result + 9) = 1;
  }
  return result;
}

- (id)initWithSyncDisabled:(void *)a3 alwaysSyncUpAndDown:(void *)a4 assetThresholdInBytes:(void *)a5 firstSyncPeriodInDays:(void *)a6 maxSyncDownIntervalInDays:(void *)a7 minSyncIntervalInSeconds:(void *)a8 minSyncsPerDay:(void *)a9 maxSyncsPerDay:(void *)a10 numChangesTriggeringSync:(void *)a11 policyDownloadIntervalInDays:(void *)a12 pushTriggersSync:(void *)a13 singleDeviceSyncIntervalInDays:(void *)a14 streamNamesWithAdditionsTriggeringSync:(void *)a15 streamNamesWithDeletionsTriggeringSync:(void *)a16 syncTimeoutInSeconds:(void *)a17 triggeredSyncDelayInSeconds:
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  id v51;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  objc_super v61;

  v51 = a2;
  v55 = a3;
  v23 = a4;
  v60 = a5;
  v59 = a6;
  v58 = a7;
  v57 = a8;
  v56 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v54 = a14;
  v53 = a15;
  v28 = a16;
  v29 = a17;
  if (!a1)
  {
    v30 = 0;
    v32 = v51;
    v31 = v55;
    goto LABEL_64;
  }
  v61.receiver = a1;
  v61.super_class = (Class)_DKSyncPolicy;
  v30 = objc_msgSendSuper2(&v61, sel_init);
  v31 = v55;
  if (!v30)
  {
    v32 = v51;
    goto LABEL_64;
  }
  v32 = v51;
  if (v51)
    v33 = objc_msgSend(v51, "BOOLValue");
  else
    v33 = 0;
  *((_BYTE *)v30 + 8) = v33;
  if (v55)
    v34 = objc_msgSend(v55, "BOOLValue");
  else
    v34 = 0;
  *((_BYTE *)v30 + 9) = v34;
  if (v23)
    v35 = objc_msgSend(v23, "unsignedIntegerValue");
  else
    v35 = 20480;
  *((_QWORD *)v30 + 2) = v35;
  if (v60)
    v36 = objc_msgSend(v60, "unsignedIntegerValue");
  else
    v36 = 7;
  *((_QWORD *)v30 + 3) = v36;
  if (v59)
    v37 = objc_msgSend(v59, "unsignedIntegerValue");
  else
    v37 = 7;
  *((_QWORD *)v30 + 4) = v37;
  if (v58)
    v38 = objc_msgSend(v58, "unsignedIntegerValue");
  else
    v38 = 60;
  *((_QWORD *)v30 + 5) = v38;
  if (v57)
    v39 = objc_msgSend(v57, "unsignedIntegerValue");
  else
    v39 = 4;
  *((_QWORD *)v30 + 6) = v39;
  if (v56)
    v40 = objc_msgSend(v56, "unsignedIntegerValue");
  else
    v40 = 6;
  *((_QWORD *)v30 + 7) = v40;
  if (v24)
    v41 = objc_msgSend(v24, "unsignedIntegerValue");
  else
    v41 = 0;
  *((_QWORD *)v30 + 8) = v41;
  if (v25)
    v42 = objc_msgSend(v25, "unsignedIntegerValue");
  else
    v42 = 7;
  *((_QWORD *)v30 + 14) = v42;
  if (v26)
    v43 = objc_msgSend(v26, "BOOLValue");
  else
    v43 = 1;
  *((_BYTE *)v30 + 10) = v43;
  if (v27)
    v44 = objc_msgSend(v27, "unsignedIntegerValue");
  else
    v44 = 1;
  *((_QWORD *)v30 + 9) = v44;
  objc_storeStrong((id *)v30 + 10, a14);
  objc_storeStrong((id *)v30 + 11, a15);
  if (v28)
    v45 = objc_msgSend(v28, "unsignedIntegerValue");
  else
    v45 = 30;
  *((_QWORD *)v30 + 12) = v45;
  if (v29)
    v46 = objc_msgSend(v29, "unsignedIntegerValue");
  else
    v46 = 10;
  *((_QWORD *)v30 + 13) = v46;
  if (*((_QWORD *)v30 + 5) > 0x15180uLL)
    *((_QWORD *)v30 + 5) = 86400;
  v47 = *((_QWORD *)v30 + 7);
  if (v47 >= 0x121)
  {
    v47 = 288;
    *((_QWORD *)v30 + 7) = 288;
  }
  if (*((_QWORD *)v30 + 6) > v47)
    *((int64x2_t *)v30 + 3) = vdupq_n_s64(4uLL);
  v48 = *((_QWORD *)v30 + 14);
  if (!v48)
  {
    v49 = 1;
    goto LABEL_56;
  }
  if (v48 >= 0x16E)
  {
    v49 = 365;
LABEL_56:
    *((_QWORD *)v30 + 14) = v49;
  }
  if (!*((_QWORD *)v30 + 9))
    *((_QWORD *)v30 + 9) = 1;
  if (!*((_QWORD *)v30 + 12))
    *((_QWORD *)v30 + 12) = 30;
  if (v46 > 0x15180)
    *((_QWORD *)v30 + 13) = 86400;
  +[_DKSyncPolicy possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:]();
LABEL_64:

  return v30;
}

+ (void)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:
{
  id v0;

  objc_opt_self();
  if (!+[_DKCloudUtilities isUnitTesting](_DKCloudUtilities, "isUnitTesting"))
  {
    +[_DKCloudUtilities sharedInstance](_DKCloudUtilities, "sharedInstance");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "isCloudSyncAvailable");

  }
}

+ (id)syncPolicyConfigPath
{
  void *v0;
  void *v1;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("com.apple.coreduet.knowledge.syncPolicies"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)queryStartDateFromLastDaySyncDates:(id)a3 lastSyncDate:(id)a4 isSingleDevice:(BOOL)a5 isTriggeredSync:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (-[_DKSyncPolicy syncDisabled](self, "syncDisabled"))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:].cold.1();
LABEL_4:

LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v15 = -[_DKSyncPolicy forceSync](self, "forceSync");
  if (v15 || v6)
  {
    if (v15)
    {
      if (v11)
        goto LABEL_26;
      goto LABEL_19;
    }
  }
  else if (!-[_DKSyncPolicy minSyncsPerDay](self, "minSyncsPerDay"))
  {
    goto LABEL_5;
  }
  if (v11)
  {
    v16 = objc_msgSend(v10, "count");
    v17 = -[_DKSyncPolicy maxSyncsPerDay](self, "maxSyncsPerDay");
    if (v6)
    {
      if (v16 >= v17)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:].cold.3();
        goto LABEL_4;
      }
    }
    else
    {
      if (v16 >= v17)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:].cold.5();
        goto LABEL_4;
      }
      objc_msgSend(v11, "timeIntervalSinceNow");
      v28 = -v27;
      -[_DKSyncPolicy hoursBetweenSyncsWhenIsSingleDevice:](self, "hoursBetweenSyncsWhenIsSingleDevice:", v7);
      if (v29 * 3600.0 * 0.75 > v28)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:].cold.4();
        goto LABEL_4;
      }
    }
LABEL_26:
    v13 = v11;
    goto LABEL_6;
  }
LABEL_19:
  v18 = -[_DKSyncPolicy firstSyncPeriodInDays](self, "firstSyncPeriodInDays");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -(double)(86400 * v18));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

LABEL_6:
  return v13;
}

- (double)hoursBetweenSyncsWhenIsSingleDevice:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (!-[_DKSyncPolicy minSyncsPerDay](self, "minSyncsPerDay"))
    return -1.0;
  if (v3)
    return (double)-[_DKSyncPolicy singleDeviceSyncIntervalInDays](self, "singleDeviceSyncIntervalInDays") * 24.0;
  return 24.0 / (double)-[_DKSyncPolicy minSyncsPerDay](self, "minSyncsPerDay");
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t policyDownloadIntervalInDays;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ { \n"), v5);

  if (-[_DKSyncPolicy syncDisabled](self, "syncDisabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("                           syncDisabled: %@\n"), v6);
  if (-[_DKSyncPolicy forceSync](self, "forceSync"))
  {
    if (-[_DKSyncPolicy forceSync](self, "forceSync"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("                              forceSync: %@\n"), v7);
  }
  if (-[_DKSyncPolicy alwaysSyncUpAndDown](self, "alwaysSyncUpAndDown"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("                    alwaysSyncUpAndDown: %@\n"), v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy assetThresholdInBytes](self, "assetThresholdInBytes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                  assetThresholdInBytes: %@\n"), v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy firstSyncPeriodInDays](self, "firstSyncPeriodInDays"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                  firstSyncPeriodInDays: %@\n"), v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy maxSyncDownIntervalInDays](self, "maxSyncDownIntervalInDays"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("              maxSyncDownIntervalInDays: %@\n"), v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy minSyncIntervalInSeconds](self, "minSyncIntervalInSeconds"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("               minSyncIntervalInSeconds: %@\n"), v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy minSyncsPerDay](self, "minSyncsPerDay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                         minSyncsPerDay: %@\n"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy maxSyncsPerDay](self, "maxSyncsPerDay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                         maxSyncsPerDay: %@\n"), v14);

  if (-[_DKSyncPolicy numChangesTriggeringSync](self, "numChangesTriggeringSync"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy numChangesTriggeringSync](self, "numChangesTriggeringSync"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("               numChangesTriggeringSync: %@\n"), v15);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("               numChangesTriggeringSync: %@\n"), CFSTR("disabled"));
  }
  if (self)
    policyDownloadIntervalInDays = self->_policyDownloadIntervalInDays;
  else
    policyDownloadIntervalInDays = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", policyDownloadIntervalInDays);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("           policyDownloadIntervalInDays: %@\n"), v17);

  if (-[_DKSyncPolicy pushTriggersSync](self, "pushTriggersSync"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("                       pushTriggersSync: %@\n"), v18);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy singleDeviceSyncIntervalInDays](self, "singleDeviceSyncIntervalInDays"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("         singleDeviceSyncIntervalInDays: %@\n"), v19);

  -[_DKSyncPolicy streamNamesWithAdditionsTriggeringSync](self, "streamNamesWithAdditionsTriggeringSync");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPrettyPrintCollection(v20, 0, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" streamNamesWithAdditionsTriggeringSync: %@\n"), v21);

  -[_DKSyncPolicy streamNamesWithDeletionsTriggeringSync](self, "streamNamesWithDeletionsTriggeringSync");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPrettyPrintCollection(v22, 0, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" streamNamesWithDeletionsTriggeringSync: %@\n"), v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy syncTimeoutInSeconds](self, "syncTimeoutInSeconds"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                   syncTimeoutInSeconds: %@\n"), v24);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncPolicy triggeredSyncDelayInSeconds](self, "triggeredSyncDelayInSeconds"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("            triggeredSyncDelayInSeconds: %@\n"), v25);

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (BOOL)syncDisabled
{
  return self->_syncDisabled;
}

- (BOOL)alwaysSyncUpAndDown
{
  return self->_alwaysSyncUpAndDown;
}

- (unint64_t)assetThresholdInBytes
{
  return self->_assetThresholdInBytes;
}

- (unint64_t)firstSyncPeriodInDays
{
  return self->_firstSyncPeriodInDays;
}

- (unint64_t)maxSyncDownIntervalInDays
{
  return self->_maxSyncDownIntervalInDays;
}

- (unint64_t)minSyncIntervalInSeconds
{
  return self->_minSyncIntervalInSeconds;
}

- (unint64_t)minSyncsPerDay
{
  return self->_minSyncsPerDay;
}

- (unint64_t)maxSyncsPerDay
{
  return self->_maxSyncsPerDay;
}

- (unint64_t)numChangesTriggeringSync
{
  return self->_numChangesTriggeringSync;
}

- (BOOL)pushTriggersSync
{
  return self->_pushTriggersSync;
}

- (unint64_t)singleDeviceSyncIntervalInDays
{
  return self->_singleDeviceSyncIntervalInDays;
}

- (NSArray)streamNamesWithAdditionsTriggeringSync
{
  return self->_streamNamesWithAdditionsTriggeringSync;
}

- (NSArray)streamNamesWithDeletionsTriggeringSync
{
  return self->_streamNamesWithDeletionsTriggeringSync;
}

- (unint64_t)syncTimeoutInSeconds
{
  return self->_syncTimeoutInSeconds;
}

- (unint64_t)triggeredSyncDelayInSeconds
{
  return self->_triggeredSyncDelayInSeconds;
}

- (BOOL)forceSync
{
  return self->_forceSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamNamesWithDeletionsTriggeringSync, 0);
  objc_storeStrong((id *)&self->_streamNamesWithAdditionsTriggeringSync, 0);
}

+ (void)policy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "policy changed to: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Syncing disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)queryStartDateFromLastDaySyncDates:(uint64_t)a3 lastSyncDate:(uint64_t)a4 isSingleDevice:(uint64_t)a5 isTriggeredSync:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, a1, a3, "No last sync date, using: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Skipping triggered sync, over daily maximum", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Skipping sync, not yet time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Skipping sync, over daily maximum", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
