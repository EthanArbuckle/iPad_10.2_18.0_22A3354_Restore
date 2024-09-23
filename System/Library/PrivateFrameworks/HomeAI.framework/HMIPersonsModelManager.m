@implementation HMIPersonsModelManager

- (HMIPersonsModelManager)init
{
  HMIPersonsModelManager *v2;
  HMIPersonsModelManager *v3;
  uint64_t v4;
  HMFTimer *watchdogTimer;
  NSDictionary *personsModelsByHome;
  NSDictionary *equivalencyTablesByHome;
  NSDictionary *torsoModelsByHome;
  NSDictionary *torsoToFaceCropByHome;
  uint64_t v10;
  NSDictionary *userDefinedPersonLinksByHome;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMIPersonsModelManager;
  v2 = -[HMIPersonsModelManager init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 12, 30.0);
    watchdogTimer = v3->_watchdogTimer;
    v3->_watchdogTimer = (HMFTimer *)v4;

    -[HMFTimer setDelegate:](v3->_watchdogTimer, "setDelegate:", v3);
    personsModelsByHome = v3->_personsModelsByHome;
    v3->_personsModelsByHome = 0;

    equivalencyTablesByHome = v3->_equivalencyTablesByHome;
    v3->_equivalencyTablesByHome = 0;

    torsoModelsByHome = v3->_torsoModelsByHome;
    v3->_torsoModelsByHome = 0;

    torsoToFaceCropByHome = v3->_torsoToFaceCropByHome;
    v3->_torsoToFaceCropByHome = 0;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    userDefinedPersonLinksByHome = v3->_userDefinedPersonLinksByHome;
    v3->_userDefinedPersonLinksByHome = (NSDictionary *)v10;

  }
  return v3;
}

+ (HMIPersonsModelManager)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_25);
  return (HMIPersonsModelManager *)(id)sharedInstance_sharedInstance_0;
}

void __40__HMIPersonsModelManager_sharedInstance__block_invoke()
{
  HMIPersonsModelManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMIPersonsModelManager);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (id)buildEquivalencyMapForPersonsModels:(id)a3 userDefinedPersonLinks:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HMIPersonsModelEquivalencyTable *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[HMIPersonsModelEquivalencyTable initWithPersonsModels:userDefinedPersonLinks:error:]([HMIPersonsModelEquivalencyTable alloc], "initWithPersonsModels:userDefinedPersonLinks:error:", v8, v7, a5);

  return v9;
}

- (id)homePersonsModelForHomeWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__6;
    v14 = __Block_byref_object_dispose__6;
    v15 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __58__HMIPersonsModelManager_homePersonsModelForHomeWithUUID___block_invoke;
    v9[3] = &unk_24DBECAE8;
    v9[4] = &v10;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __58__HMIPersonsModelManager_homePersonsModelForHomeWithUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isExternalLibrary") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (id)personsModelWithFaceObservations:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__HMIPersonsModelManager_personsModelWithFaceObservations_error___block_invoke;
  v11[3] = &unk_24DBECB10;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  +[HMIPersonsModelManager personsModelWithFaceObservationsByID:error:](HMIPersonsModelManager, "personsModelWithFaceObservationsByID:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __65__HMIPersonsModelManager_personsModelWithFaceObservations_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v8);

}

+ (id)personsModelWithFaceObservationsByID:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  v6 = objc_alloc_init(MEMORY[0x24BDF9C50]);
  objc_msgSend(v6, "setMaximumIdentities:", 80);
  objc_msgSend(v6, "setMaximumTrainingFaceprintsPerIdentity:", 20);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF9C38]), "initWithConfiguration:", v6);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__HMIPersonsModelManager_personsModelWithFaceObservationsByID_error___block_invoke;
  v14[3] = &unk_24DBECB38;
  v8 = v7;
  v15 = v8;
  v16 = &v17;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);
  v9 = (void *)v18[5];
  if (v9)
  {
    v10 = v9;
    v11 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    HMIErrorLogC(v11);

    v12 = 0;
  }
  else
  {
    v12 = v8;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __69__HMIPersonsModelManager_personsModelWithFaceObservationsByID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v15 = 0;
  v9 = objc_msgSend(v8, "addFaceObservations:toPersonWithUniqueIdentifier:error:", a3, v7, &v15);
  v10 = v15;
  if ((v9 & 1) == 0)
  {
    *a4 = 1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error adding faceprints to model for personUUID: %@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1033, v11, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

- (BOOL)buildPersonsModelForHomeUUID:(id)a3 sourceUUID:(id)a4 externalLibrary:(BOOL)a5 faceObservationsByPerson:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMIPersonsModelManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSDictionary *v24;
  void *v25;
  NSDictionary *userDefinedPersonLinksByHome;
  NSDictionary *v27;
  void *v28;
  id v29;
  BOOL v30;
  id v31;
  void *v32;
  char v33;
  id v34;
  uint64_t v35;
  id v36;
  BOOL v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  NSDictionary *v45;
  NSDictionary *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  BOOL v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  NSObject *v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  char v71;
  void *v72;
  char v73;
  id v74;
  NSDictionary *v75;
  NSDictionary *v76;
  void *v77;
  HMIPersonsModelManager *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v86;
  HMIPersonsModelManager *v87;
  NSObject *v88;
  void *v89;
  NSDictionary *personsModelsByHome;
  NSDictionary *equivalencyTablesByHome;
  BOOL v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  HMIPersonsModelManager *v101;
  void *v102;
  void *v103;
  void *v104;
  os_unfair_lock_t lock;
  HMIPersonsModel *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  uint8_t buf[4];
  id v122;
  __int16 v123;
  id v124;
  __int16 v125;
  id v126;
  uint64_t v127;

  v9 = a5;
  v127 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v108 = a4;
  v107 = a6;
  if (v9)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v118[0] = MEMORY[0x24BDAC760];
    v118[1] = 3221225472;
    v118[2] = __113__HMIPersonsModelManager_buildPersonsModelForHomeUUID_sourceUUID_externalLibrary_faceObservationsByPerson_error___block_invoke;
    v118[3] = &unk_24DBEBDB0;
    v119 = v108;
    v16 = v14;
    v120 = v16;
    objc_msgSend(v15, "na_each:", v118);

    -[HMIPersonsModelManager userDefinedPersonLinksByHome](self, "userDefinedPersonLinksByHome");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "isEqualToDictionary:", v16) & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x220735570]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v122 = v22;
        v123 = 2112;
        v124 = v12;
        _os_log_impl(&dword_219D45000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Writing updated userDefinedPersonLinksByHome[%@] to disk", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      -[HMIPersonsModelManager userDefinedPersonLinksByHome](v20, "userDefinedPersonLinksByHome");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (NSDictionary *)objc_msgSend(v23, "mutableCopy");

      v25 = (void *)objc_msgSend(v16, "copy");
      -[NSDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v25, v12);

      userDefinedPersonLinksByHome = v20->_userDefinedPersonLinksByHome;
      v20->_userDefinedPersonLinksByHome = v24;
      v27 = v24;

      v117 = 0;
      +[HMIPersonsModelManager persistUserDefinedPersonLinks:forHomeUUID:error:](HMIPersonsModelManager, "persistUserDefinedPersonLinks:forHomeUUID:error:", v16, v12, &v117);
      v13 = v117;

    }
  }
  v116 = v13;
  -[HMIPersonsModelManager personsModelWithFaceObservations:error:](self, "personsModelWithFaceObservations:error:", v107, &v116);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v116;

  if (v28)
  {
    v106 = -[HMIPersonsModel initWithPersonsModel:homeUUID:sourceUUID:externalLibrary:]([HMIPersonsModel alloc], "initWithPersonsModel:homeUUID:sourceUUID:externalLibrary:", v28, v12, v108, v9);
    lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v115 = v29;
    v30 = -[HMIPersonsModelManager loadModelsWithError:](self, "loadModelsWithError:", &v115);
    v31 = v115;

    if (!v30)
    {
      v57 = v31;
      v58 = v57;
      if (a7)
        *a7 = objc_retainAutorelease(v57);
      HMIErrorLog(self, v58);
      v56 = 0;
      v29 = v58;
      goto LABEL_51;
    }
    -[HMIPersonsModelManager homePersonsModelForHomeWithUUID:](self, "homePersonsModelForHomeWithUUID:", v12);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || !v104
      || (objc_msgSend(v104, "sourceUUID"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = objc_msgSend(v32, "isEqual:", v108),
          v32,
          (v33 & 1) != 0))
    {
      v34 = v31;
    }
    else
    {
      v65 = (void *)MEMORY[0x220735570]();
      v101 = self;
      HMFGetOSLogHandle();
      v66 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v67 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "sourceUUID");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v122 = v67;
        v123 = 2112;
        v124 = v12;
        v125 = 2112;
        v126 = v68;
        _os_log_impl(&dword_219D45000, v66, OS_LOG_TYPE_INFO, "%{public}@Stale Home VNPersonsModel with homeUUID: %@ sourceUUID: %@ detected, attempting to remove...", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v65);
      v114 = 0;
      +[HMIPersonsModelManager getModelStoragePathForModel:error:](HMIPersonsModelManager, "getModelStoragePathForModel:error:", v104, &v114);
      v69 = objc_claimAutoreleasedReturnValue();
      v36 = v114;
      v103 = (void *)v69;
      if (!v69)
      {
        v81 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v104, "sourceUUID");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "stringWithFormat:", CFSTR("Failed to remove stale Home VNPersonsModel with homeUUID: %@ sourceUUID: %@, error getting model storage path"), v12, v82);
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1033, v102, v36);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        v84 = v83;
        v41 = v84;
        if (a7)
          *a7 = objc_retainAutorelease(v84);
        HMIErrorLog(v101, v41);
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "fileExistsAtPath:", v69);

      if ((v71 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = v36;
        v73 = objc_msgSend(v72, "removeItemAtPath:error:", v103, &v113);
        v74 = v113;

        if ((v73 & 1) == 0)
        {
          v94 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v104, "sourceUUID");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "stringWithFormat:", CFSTR("Failed to remove stale Home VNPersonsModel with homeUUID: %@ sourceUUID: %@"), v12, v95);
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1033, v102, v74);
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          v97 = v96;
          v41 = v97;
          if (a7)
            *a7 = objc_retainAutorelease(v97);
          HMIErrorLog(v101, v41);
          v56 = 0;
          v36 = v74;
          goto LABEL_48;
        }
        v36 = v74;
      }
      else
      {
        v86 = (void *)MEMORY[0x220735570]();
        v87 = v101;
        HMFGetOSLogHandle();
        v88 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v122 = v89;
          _os_log_impl(&dword_219D45000, v88, OS_LOG_TYPE_INFO, "%{public}@Stale model path no longer on disk, proceeding with building persons model...", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v86);
      }
      personsModelsByHome = v101->_personsModelsByHome;
      v101->_personsModelsByHome = 0;

      equivalencyTablesByHome = v101->_equivalencyTablesByHome;
      v101->_equivalencyTablesByHome = 0;

      v112 = v31;
      v92 = -[HMIPersonsModelManager loadModelsWithError:](v101, "loadModelsWithError:", &v112);
      v34 = v112;

      if (!v92)
      {
        v93 = v34;
        v29 = v93;
        if (a7)
          *a7 = objc_retainAutorelease(v93);
        HMIErrorLog(v101, v29);
        v56 = 0;

        goto LABEL_50;
      }

    }
    v111 = 0;
    +[HMIPersonsModelManager getModelStoragePathForModel:error:](HMIPersonsModelManager, "getModelStoragePathForModel:error:", v106, &v111);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v111;
    v103 = (void *)v35;
    if (v35)
    {
      v110 = v36;
      v37 = +[HMIPersonsModelManager persistModel:toPath:error:](HMIPersonsModelManager, "persistModel:toPath:error:", v28, v35, &v110);
      v100 = v110;

      if (v37)
      {
        -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", v12);
        v39 = objc_claimAutoreleasedReturnValue();

        if (v39)
          v40 = (void *)v39;
        else
          v40 = (void *)MEMORY[0x24BDBD1B8];
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v40);
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v106, v108);
        v102 = v40;
        v42 = objc_alloc(MEMORY[0x24BDBCED8]);
        -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = (void *)objc_msgSend(v42, "initWithDictionary:", v43);

        v44 = (void *)objc_msgSend(v41, "copy");
        objc_msgSend(v99, "setObject:forKeyedSubscript:", v44, v12);

        v45 = (NSDictionary *)objc_msgSend(v99, "copy");
        v46 = self->_personsModelsByHome;
        self->_personsModelsByHome = v45;

        -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKeyedSubscript:", v12);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIPersonsModelManager userDefinedPersonLinksByHome](self, "userDefinedPersonLinksByHome");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", v12);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v34;
        -[HMIPersonsModelManager buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:](self, "buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:", v48, v50, &v109);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v109;
        v52 = v34;
        v29 = v51;

        v53 = objc_alloc(MEMORY[0x24BDBCED8]);
        -[HMIPersonsModelManager equivalencyTablesByHome](self, "equivalencyTablesByHome");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)objc_msgSend(v53, "initWithDictionary:", v54);

        if (v98)
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v98, v12);
        else
          objc_msgSend(v55, "removeObjectForKey:", v12);
        v75 = (NSDictionary *)objc_msgSend(v55, "copy");
        v76 = self->_equivalencyTablesByHome;
        self->_equivalencyTablesByHome = v75;

        v77 = (void *)MEMORY[0x220735570]();
        v78 = self;
        HMFGetOSLogHandle();
        v79 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v122 = v80;
          v123 = 2112;
          v124 = v12;
          v125 = 2112;
          v126 = v108;
          _os_log_impl(&dword_219D45000, v79, OS_LOG_TYPE_INFO, "%{public}@Persisted VNPersonsModel for homeUUID: %@ sourceUUID: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v77);

        v56 = 1;
        v36 = v100;
        goto LABEL_49;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to persist VNPersonsModel for homeUUID: %@ sourceUUID: %@, path: %@"), v12, v108, v35);
      v62 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1033, v62, v100);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = (void *)v62;

      v64 = v63;
      v41 = v64;
      if (a7)
        *a7 = objc_retainAutorelease(v64);
      HMIErrorLog(self, v41);
      v56 = 0;
      v36 = v100;
LABEL_48:
      v29 = v41;
LABEL_49:

LABEL_50:
      v58 = v104;
LABEL_51:

      os_unfair_lock_unlock(lock);
      goto LABEL_52;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to persist VNPersonsModel for homeUUID: %@ sourceUUID: %@, error getting model storage path"), v12, v108);
    v59 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1033, v59, v36);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)v59;

    v61 = v60;
    v41 = v61;
    if (a7)
      *a7 = objc_retainAutorelease(v61);
    HMIErrorLog(self, v41);
LABEL_47:
    v56 = 0;
    goto LABEL_48;
  }
  if (a7)
    *a7 = objc_retainAutorelease(v29);
  HMIErrorLog(self, v29);
  v56 = 0;
LABEL_52:

  return v56;
}

void __113__HMIPersonsModelManager_buildPersonsModelForHomeUUID_sourceUUID_externalLibrary_faceObservationsByPerson_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  HMIPersonSourceUUIDPair *v5;
  void *v6;
  HMIPersonSourceUUIDPair *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "personLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = [HMIPersonSourceUUIDPair alloc];
    objc_msgSend(v9, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:](v5, "initWithPersonUUID:sourceUUID:", v6, *(_QWORD *)(a1 + 32));

    objc_msgSend(v9, "personLinks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);

  }
}

- (BOOL)removePersonsModelForHomeUUID:(id)a3 sourceUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  char v19;
  HMIPersonsModelManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  BOOL v24;
  void *v25;
  HMIPersonsModelManager *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSDictionary *userDefinedPersonLinksByHome;
  void *v38;
  char v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSDictionary *v44;
  NSDictionary *personsModelsByHome;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  NSDictionary *v55;
  NSDictionary *equivalencyTablesByHome;
  void *v57;
  HMIPersonsModelManager *v58;
  NSObject *v59;
  void *v60;
  id v62;
  void *context;
  void *contexta;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  id v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v78 = 0;
  v11 = -[HMIPersonsModelManager loadModelsWithError:](self, "loadModelsWithError:", &v78);
  v12 = v78;
  v13 = v12;
  if (v11)
  {
    -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", v9);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v77 = 0;
        v69 = (void *)v16;
        +[HMIPersonsModelManager getModelStoragePathForModel:error:](HMIPersonsModelManager, "getModelStoragePathForModel:error:", v16, &v77);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v77;
        if (v70)
        {
          if ((objc_msgSend(v69, "isExternalLibrary") & 1) == 0)
          {
            v76 = 0;
            +[HMIPersonsModelManager getUserDefinedPersonLinksStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getUserDefinedPersonLinksStoragePathForHomeUUID:error:", v8, &v76);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v76;
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v17;
            v19 = objc_msgSend(v18, "removeItemAtPath:error:", v67, &v75);
            v65 = v75;

            context = (void *)MEMORY[0x220735570]();
            v20 = self;
            if ((v19 & 1) != 0)
            {
              HMFGetOSLogHandle();
              v21 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v80 = v22;
                v81 = 2112;
                v82 = v8;
                _os_log_impl(&dword_219D45000, v21, OS_LOG_TYPE_INFO, "%{public}@Removed userDefinedPersonLinksByHome for homeUUID: %@", buf, 0x16u);

              }
            }
            else
            {
              HMFGetOSLogHandle();
              v21 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v80 = v33;
                v81 = 2112;
                v82 = v65;
                _os_log_impl(&dword_219D45000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error removing user defined person links file: %@", buf, 0x16u);

              }
            }

            objc_autoreleasePoolPop(context);
            -[HMIPersonsModelManager userDefinedPersonLinksByHome](v20, "userDefinedPersonLinksByHome");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(v34, "mutableCopy");

            objc_msgSend(v35, "removeObjectForKey:", v8);
            v36 = objc_msgSend(v35, "copy");
            userDefinedPersonLinksByHome = v20->_userDefinedPersonLinksByHome;
            v20->_userDefinedPersonLinksByHome = (NSDictionary *)v36;

          }
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v71;
          v39 = objc_msgSend(v38, "removeItemAtPath:error:", v70, &v74);
          v66 = v74;

          if ((v39 & 1) != 0)
          {
            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v15);
            objc_msgSend(v40, "removeObjectForKey:", v9);
            v68 = v40;
            v41 = objc_alloc(MEMORY[0x24BDBCED8]);
            -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v41, "initWithDictionary:", v42);

            v43 = (void *)objc_msgSend(v68, "copy");
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v43, v8);

            v44 = (NSDictionary *)objc_msgSend(v32, "copy");
            personsModelsByHome = self->_personsModelsByHome;
            self->_personsModelsByHome = v44;

            -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "objectForKeyedSubscript:", v8);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMIPersonsModelManager userDefinedPersonLinksByHome](self, "userDefinedPersonLinksByHome");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKeyedSubscript:", v8);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = v13;
            -[HMIPersonsModelManager buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:](self, "buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:", v46, v48, &v73);
            contexta = (void *)objc_claimAutoreleasedReturnValue();
            v62 = v73;

            v49 = objc_alloc(MEMORY[0x24BDBCED8]);
            -[HMIPersonsModelManager equivalencyTablesByHome](self, "equivalencyTablesByHome");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = (void *)objc_msgSend(v49, "initWithDictionary:", v50);

            if (contexta)
              objc_msgSend(v51, "setObject:forKeyedSubscript:", contexta, v8);
            else
              objc_msgSend(v51, "removeObjectForKey:", v8);
            v55 = (NSDictionary *)objc_msgSend(v51, "copy");
            equivalencyTablesByHome = self->_equivalencyTablesByHome;
            self->_equivalencyTablesByHome = v55;

            v57 = (void *)MEMORY[0x220735570]();
            v58 = self;
            HMFGetOSLogHandle();
            v59 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v80 = v60;
              v81 = 2112;
              v82 = v8;
              v83 = 2112;
              v84 = v9;
              _os_log_impl(&dword_219D45000, v59, OS_LOG_TYPE_INFO, "%{public}@Removed VNPersonsModel for homeUUID: %@ sourceUUID:%@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v57);

            v24 = 1;
            v71 = v66;
            v13 = v62;
            goto LABEL_32;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to remove VNPersonsModel for homeUUID: %@ sourceUUID: %@, path: %@"), v8, v9, v70);
          v52 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1034, v52, v66);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = (void *)v52;

          v54 = v53;
          v32 = v54;
          if (a5)
            *a5 = objc_retainAutorelease(v54);
          HMIErrorLog(self, v32);
          v24 = 0;
          v71 = v66;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to remove VNPersonsModel for homeUUID: %@ sourceUUID: %@, error getting model storage path"), v8, v9);
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1034, v29, v71);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = (void *)v29;

          v31 = v30;
          v32 = v31;
          if (a5)
            *a5 = objc_retainAutorelease(v31);
          HMIErrorLog(self, v32);
          v24 = 0;
        }
        v13 = v32;
LABEL_32:

        goto LABEL_33;
      }
    }
    v25 = (void *)MEMORY[0x220735570]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v80 = v28;
      v81 = 2112;
      v82 = v8;
      v83 = 2112;
      v84 = v9;
      _os_log_impl(&dword_219D45000, v27, OS_LOG_TYPE_INFO, "%{public}@Did not remove VNPersonsModel for homeUUID: %@ sourceUUID: %@, no model found", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 1;
  }
  else
  {
    v23 = v12;
    v15 = v23;
    if (a5)
      *a5 = objc_retainAutorelease(v23);
    HMIErrorLog(self, v15);
    v24 = 0;
    v13 = v15;
  }
LABEL_33:

  os_unfair_lock_unlock(p_lock);
  return v24;
}

- (id)predictHomePersonFromFaceObservation:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMIPersonsModelPrediction *v25;
  void *v26;
  HMIPersonsModelPrediction *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v34;
  id v35;
  id v36;

  v8 = a3;
  v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v36 = 0;
  v11 = -[HMIPersonsModelManager loadModelsWithError:](self, "loadModelsWithError:", &v36);
  v12 = v36;
  v13 = v12;
  if (v11)
  {
    -[HMIPersonsModelManager homePersonsModelForHomeWithUUID:](self, "homePersonsModelForHomeWithUUID:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v34 = v8;
    if (v14)
    {
      objc_msgSend(v14, "visionPersonsModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v13;
      objc_msgSend(v16, "predictPersonFromFaceObservation:limit:canceller:error:", v8, 10, 0, &v35);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v35;

      if (v17)
      {
        objc_msgSend(v17, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v19, "predictedPersonUniqueIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);

        v23 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v19, "confidence");
        objc_msgSend(v23, "numberWithFloat:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = [HMIPersonsModelPrediction alloc];
        objc_msgSend(v15, "sourceUUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[HMIPersonsModelPrediction initWithSourceUUID:personUUID:confidence:linkedEntityUUID:](v25, "initWithSourceUUID:personUUID:confidence:linkedEntityUUID:", v26, v22, v24, 0);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to predict using VNPersonsModel for home persons model"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1035, v19, v18);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v31;
        v22 = v32;
        if (a5)
          *a5 = objc_retainAutorelease(v32);
        HMIErrorLog(self, v22);
        v27 = 0;
        v18 = v22;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Home persons model not found for homeUUID: %@"), v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1037, v17);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v29;
      v19 = v30;
      if (a5)
        *a5 = objc_retainAutorelease(v30);
      HMIErrorLog(self, v19);
      v27 = 0;
      v18 = v19;
    }

    v8 = v34;
  }
  else
  {
    v28 = v12;
    v15 = v28;
    if (a5)
      *a5 = objc_retainAutorelease(v28);
    HMIErrorLog(self, v15);
    v27 = 0;
    v18 = v15;
  }

  os_unfair_lock_unlock(p_lock);
  return v27;
}

- (id)equivalencyCellForPerson:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSDictionary *v25;
  NSDictionary *equivalencyTablesByHome;
  void *v27;
  void *v29;
  HMIPersonsModelManager *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v8 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v35 = 0;
  v10 = -[HMIPersonsModelManager loadModelsWithError:](self, "loadModelsWithError:", &v35);
  v11 = v35;
  v12 = v11;
  if (v10)
  {
    -[HMIPersonsModelManager equivalencyTablesByHome](self, "equivalencyTablesByHome");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = v12;
LABEL_9:
      objc_msgSend(v14, "equivalencyCellForPerson:", v33);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v27, "copy");

      v17 = v14;
      goto LABEL_10;
    }
    -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIPersonsModelManager userDefinedPersonLinksByHome](self, "userDefinedPersonLinksByHome");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    -[HMIPersonsModelManager buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:](self, "buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:", v20, v22, &v34);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v34;

    v23 = objc_alloc(MEMORY[0x24BDBCED8]);
    -[HMIPersonsModelManager equivalencyTablesByHome](self, "equivalencyTablesByHome");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v23, "initWithDictionary:", v24);

    if (v14)
    {
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v8);
      v25 = (NSDictionary *)objc_msgSend(v17, "copy");
      equivalencyTablesByHome = self->_equivalencyTablesByHome;
      self->_equivalencyTablesByHome = v25;

      goto LABEL_9;
    }
    v29 = (void *)MEMORY[0x220735570]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v32;
      v38 = 2112;
      v39 = v8;
      v40 = 2112;
      v41 = v15;
      _os_log_impl(&dword_219D45000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to build equivalency map for homeUUID: %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    v18 = 0;
  }
  else
  {
    v16 = v11;
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    HMIErrorLog(self, v17);
    v18 = 0;
    v15 = v17;
  }
LABEL_10:

  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (id)predictPersonFromFaceObservation:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *equivalencyTablesByHome;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *context;
  HMIPersonsModelManager *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  HMIPersonsModelManager *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  id v65;
  id obj;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  id *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  id v92;
  __int16 v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v83 = 0;
  v84 = (id *)&v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__6;
  v87 = __Block_byref_object_dispose__6;
  v88 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 1;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__6;
  v77 = __Block_byref_object_dispose__6;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__6;
  v71 = __Block_byref_object_dispose__6;
  v72 = 0;
  os_unfair_lock_lock_with_options();
  v10 = v84;
  obj = v84[5];
  v11 = -[HMIPersonsModelManager loadModelsWithError:](self, "loadModelsWithError:", &obj);
  objc_storeStrong(v10 + 5, obj);
  if (!v11)
  {
    v25 = v84[5];
    v26 = v25;
    if (a5)
      *a5 = objc_retainAutorelease(v25);
    HMIErrorLog(self, v26);

    goto LABEL_16;
  }
  -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v27 = (void *)MEMORY[0x24BDD17C8];
    -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = CFSTR("not");
    if (!v28)
      v29 = &stru_24DBF1B40;
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Unable to get person model for homeUUID: %@ (self.personsModelsByHome is %@ nil)"), v9, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1035, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v84[5];
    v84[5] = (id)v31;

    v33 = v84[5];
    v34 = v33;
    if (a5)
      *a5 = objc_retainAutorelease(v33);
    HMIErrorLog(self, v34);

LABEL_16:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_17;
  }
  -[HMIPersonsModelManager equivalencyTablesByHome](self, "equivalencyTablesByHome");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0x24BDBC000;
  if (!v15)
  {
    -[HMIPersonsModelManager userDefinedPersonLinksByHome](self, "userDefinedPersonLinksByHome");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      v18 = (void *)MEMORY[0x24BDBD1B8];
    v19 = v84;
    v65 = v84[5];
    -[HMIPersonsModelManager buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:](self, "buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:", v13, v18, &v65);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v19 + 5, v65);
    v20 = objc_alloc(MEMORY[0x24BDBCED8]);
    -[HMIPersonsModelManager equivalencyTablesByHome](self, "equivalencyTablesByHome");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithDictionary:", v21);

    if (v15)
    {
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, v9);
      v23 = (NSDictionary *)objc_msgSend(v22, "copy");
      equivalencyTablesByHome = self->_equivalencyTablesByHome;
      self->_equivalencyTablesByHome = v23;

    }
    else
    {
      context = (void *)MEMORY[0x220735570]();
      v53 = self;
      HMFGetOSLogHandle();
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v84[5];
        *(_DWORD *)buf = 138543874;
        v90 = v38;
        v91 = 2112;
        v92 = v9;
        v93 = 2112;
        v94 = v39;
        v51 = (void *)v38;
        _os_log_impl(&dword_219D45000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to build equivalency map for homeUUID: %@, error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
    }

    v16 = 0x24BDBC000uLL;
  }
  objc_msgSend(*(id *)(v16 + 3800), "dictionary");
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v74[5];
  v74[5] = v40;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v68[5];
  v68[5] = v42;

  v44 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke;
  v56[3] = &unk_24DBECB60;
  v57 = v8;
  v58 = v9;
  v61 = &v83;
  v62 = &v79;
  v63 = &v67;
  v45 = v15;
  v59 = v45;
  v60 = self;
  v64 = &v73;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v56);

  os_unfair_lock_unlock(&self->_lock);
  if (*((_BYTE *)v80 + 24))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v74[5];
    v54[0] = v44;
    v54[1] = 3221225472;
    v54[2] = __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke_130;
    v54[3] = &unk_24DBECBB0;
    v48 = v46;
    v55 = v48;
    objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v54);
    objc_msgSend(v48, "unionSet:", v68[5]);
    v35 = (void *)objc_msgSend(v48, "copy");

    goto LABEL_18;
  }
  v49 = v84[5];
  v50 = v49;
  if (a5)
    *a5 = objc_retainAutorelease(v49);
  HMIErrorLog(self, v50);

LABEL_17:
  v35 = 0;
LABEL_18:
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);

  return v35;
}

void __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  HMIPersonSourceUUIDPair *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  float v30;
  float v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  HMIPersonsModelPrediction *v41;
  void *v42;
  HMIPersonsModelPrediction *v43;
  HMIPersonSourceUUIDPair *v44;
  HMIPersonsModelPrediction *v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  HMIPersonSourceUUIDPair *v52;
  __int16 v53;
  const __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "visionPersonsModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v48 = 0;
  objc_msgSend(v9, "predictPersonFromFaceObservation:limit:canceller:error:", v10, 10, 0, &v48);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v48;

  if (v11)
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v46 = v12;
      v47 = v8;
      v14 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v13, "predictedPersonUniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithUUIDString:", v15);

      v45 = (HMIPersonsModelPrediction *)v16;
      v17 = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:]([HMIPersonSourceUUIDPair alloc], "initWithPersonUUID:sourceUUID:", v16, v7);
      objc_msgSend(*(id *)(a1 + 48), "equivalencyCellForPerson:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v19 = (void *)MEMORY[0x220735570]();
        v20 = *(id *)(a1 + 56);
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          v50 = v22;
          if (v23)
            v24 = CFSTR(" not");
          else
            v24 = &stru_24DBF1B40;
          v51 = 2112;
          v52 = v17;
          v53 = 2112;
          v54 = v24;
          _os_log_impl(&dword_219D45000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failure to lookup equivalency cell for %@ (equivalencyCellForHome is%@ nil)", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v44 = v17;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "objectForKeyedSubscript:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (!v25
        || (objc_msgSend(v25, "confidence"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v27, "floatValue"),
            v29 = v28,
            objc_msgSend(v13, "confidence"),
            v31 = v30,
            v27,
            v29 < v31))
      {
        v32 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v13, "predictedPersonUniqueIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v32, "initWithUUIDString:", v33);

        v35 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v13, "confidence");
        objc_msgSend(v35, "numberWithFloat:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend(v26, "linkedEntityUUID");
        else
          +[HMIPersonsModelManager minimumUUIDInEquivalencyCell:](HMIPersonsModelManager, "minimumUUIDInEquivalencyCell:", v18);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[HMIPersonsModelPrediction initWithSourceUUID:personUUID:confidence:linkedEntityUUID:]([HMIPersonsModelPrediction alloc], "initWithSourceUUID:personUUID:confidence:linkedEntityUUID:", v7, v34, v36, v42);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setObject:forKeyedSubscript:", v43, v18);

      }
      v12 = v46;
      v8 = v47;
      v41 = v45;
    }
    else
    {
      v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v41 = -[HMIPersonsModelPrediction initWithSourceUUID:personUUID:confidence:linkedEntityUUID:]([HMIPersonsModelPrediction alloc], "initWithSourceUUID:personUUID:confidence:linkedEntityUUID:", v7, 0, 0, 0);
      objc_msgSend(v40, "addObject:", v41);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to predict using VNPersonsModel for homeUUID: %@ sourceUUID: %@"), *(_QWORD *)(a1 + 40), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1035, v13, v12);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v39 = *(void **)(v38 + 40);
    *(_QWORD *)(v38 + 40) = v37;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke_2;
  v7[3] = &unk_24DBECB88;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v7);

}

void __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMIPersonsModelPrediction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMIPersonsModelPrediction *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "personUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    v7 = [HMIPersonsModelPrediction alloc];
    objc_msgSend(v13, "sourceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "confidence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "linkedEntityUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMIPersonsModelPrediction initWithSourceUUID:personUUID:confidence:linkedEntityUUID:](v7, "initWithSourceUUID:personUUID:confidence:linkedEntityUUID:", v8, v9, v10, v11);
    objc_msgSend(v6, "addObject:", v12);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));

}

+ (id)faceObservationFromTorsoprint:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BDF9BC8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  LODWORD(v9) = 1.0;
  v10 = (void *)objc_msgSend(v5, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v8, 128, 1, 512, 3, v9);

  objc_msgSend(MEMORY[0x24BDF9BB8], "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", 3, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFaceprint:", v10);

  return v11;
}

- (BOOL)updateTorsoModelForHome:(id)a3 torsoAnnotations:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  HMIPersonsModelManager *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  int v34;
  id v35;
  BOOL v36;
  id v37;
  BOOL v38;
  id v39;
  BOOL v40;
  void *v41;
  HMIPersonsModelManager *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSDictionary *torsoModelsByHome;
  uint64_t v54;
  NSDictionary *torsoToFaceCropByHome;
  id v56;
  id v57;
  void *v58;
  HMIPersonsModelManager *v59;
  NSObject *v60;
  void *v61;
  id v62;
  id v63;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  os_unfair_lock_t lock;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  int v79;
  id v80;
  _QWORD v81[5];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  HMIPersonsModelManager *v86;
  id v87;
  id v88;
  uint8_t buf[4];
  id v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  int v94;
  __int16 v95;
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v70 = a4;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v88 = 0;
  v9 = -[HMIPersonsModelManager loadModelsWithError:](self, "loadModelsWithError:", &v88);
  v10 = v88;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIPersonsModelManager torsoModelsByHome](self, "torsoModelsByHome");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = MEMORY[0x24BDAC760];
    if (!v15)
    {
      v68 = v13;
LABEL_9:
      v24 = (void *)objc_msgSend(v12, "mutableCopy");
      v25 = (void *)objc_msgSend(v68, "mutableCopy");
      v81[0] = v16;
      v81[1] = 3221225472;
      v81[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_139;
      v81[3] = &unk_24DBECCB8;
      v81[4] = self;
      v26 = v24;
      v82 = v26;
      v66 = v25;
      v83 = v66;
      objc_msgSend(v70, "na_each:", v81);
      v80 = v11;
      +[HMIPersonsModelManager personsModelWithFaceObservationsByID:error:](HMIPersonsModelManager, "personsModelWithFaceObservationsByID:error:", v26, &v80);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v80;

      if (!v67)
      {
        v56 = v27;
        v11 = v56;
        if (a5)
          *a5 = objc_retainAutorelease(v56);
        HMIErrorLog(self, v11);

        v23 = 0;
        goto LABEL_35;
      }
      v76 = 0;
      v77 = &v76;
      v78 = 0x2020000000;
      v79 = 0;
      objc_msgSend(v26, "allValues");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v16;
      v75[1] = 3221225472;
      v75[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_2_146;
      v75[3] = &unk_24DBECCE0;
      v75[4] = &v76;
      objc_msgSend(v28, "na_each:", v75);

      v29 = (void *)MEMORY[0x220735570]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v26, "count");
        v34 = *((_DWORD *)v77 + 6);
        *(_DWORD *)buf = 138544130;
        v90 = v32;
        v91 = 2048;
        v92 = v33;
        v93 = 1024;
        v94 = v34;
        v95 = 2112;
        v96 = v8;
        _os_log_impl(&dword_219D45000, v31, OS_LOG_TYPE_INFO, "%{public}@Created new torso model with %lu persons and %d total torsoprints for home: %@", buf, 0x26u);

      }
      objc_autoreleasePoolPop(v29);
      v74 = v27;
      +[HMIPersonsModelManager getTorsoModelStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoModelStoragePathForHomeUUID:error:", v8, &v74);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v74;

      v73 = v35;
      v36 = +[HMIPersonsModelManager persistModel:toPath:error:](HMIPersonsModelManager, "persistModel:toPath:error:", v67, v65, &v73);
      v37 = v73;

      if (v36)
      {
        v72 = v37;
        v38 = +[HMIPersonsModelManager persistTorsoToFaceCrop:forHomeUUID:error:](HMIPersonsModelManager, "persistTorsoToFaceCrop:forHomeUUID:error:", v66, v8, &v72);
        v39 = v72;

        if (v38)
        {
          v71 = v39;
          v40 = +[HMIPersonsModelManager persistTorsoprinterVersionForHomeUUID:error:](HMIPersonsModelManager, "persistTorsoprinterVersionForHomeUUID:error:", v8, &v71);
          v11 = v71;

          if (v40)
          {
            v41 = (void *)MEMORY[0x220735570]();
            v42 = v30;
            HMFGetOSLogHandle();
            v43 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v90 = v44;
              v91 = 2112;
              v92 = (uint64_t)v8;
              _os_log_impl(&dword_219D45000, v43, OS_LOG_TYPE_INFO, "%{public}@Successfully updated torso model and face crop map for home: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v41);
            v45 = (void *)MEMORY[0x24BDBCED8];
            -[HMIPersonsModelManager torsoModelsByHome](v42, "torsoModelsByHome");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "dictionaryWithDictionary:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v48 = (void *)MEMORY[0x24BDBCED8];
            -[HMIPersonsModelManager torsoToFaceCropByHome](v42, "torsoToFaceCropByHome");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "dictionaryWithDictionary:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v47, "setObject:forKeyedSubscript:", v67, v8);
            v51 = (void *)objc_msgSend(v66, "copy");
            objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, v8);

            v52 = objc_msgSend(v47, "copy");
            torsoModelsByHome = v42->_torsoModelsByHome;
            v42->_torsoModelsByHome = (NSDictionary *)v52;

            v54 = objc_msgSend(v50, "copy");
            torsoToFaceCropByHome = v42->_torsoToFaceCropByHome;
            v42->_torsoToFaceCropByHome = (NSDictionary *)v54;

            v23 = 1;
            goto LABEL_34;
          }
          v63 = v11;
          v47 = v63;
          if (a5)
            *a5 = objc_retainAutorelease(v63);
          HMIErrorLog(v30, v47);
        }
        else
        {
          v62 = v39;
          v47 = v62;
          if (a5)
            *a5 = objc_retainAutorelease(v62);
          HMIErrorLog(v30, v47);
        }
      }
      else
      {
        v57 = v37;
        v47 = v57;
        if (a5)
          *a5 = objc_retainAutorelease(v57);
        HMIErrorLog(v30, v47);
      }
      v23 = 0;
      v11 = v47;
LABEL_34:

      _Block_object_dispose(&v76, 8);
LABEL_35:

      goto LABEL_36;
    }
    -[HMIPersonsModelManager torsoToFaceCropByHome](self, "torsoToFaceCropByHome");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v8);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      -[HMIPersonsModelManager torsoModelsByHome](self, "torsoModelsByHome");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "personUniqueIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v16;
      v84[1] = 3221225472;
      v84[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke;
      v84[3] = &unk_24DBECC18;
      v21 = v19;
      v85 = v21;
      v86 = self;
      v87 = v12;
      objc_msgSend(v20, "na_each:", v84);

      goto LABEL_9;
    }
    v58 = (void *)MEMORY[0x220735570]();
    v59 = self;
    HMFGetOSLogHandle();
    v60 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v90 = v61;
      v91 = 2112;
      v92 = (uint64_t)v8;
      _os_log_impl(&dword_219D45000, v60, OS_LOG_TYPE_ERROR, "%{public}@Found nil torsoToFaceCrop for home %@ with non-nil model!", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v58);
    v23 = 0;
  }
  else
  {
    v22 = v10;
    v12 = v22;
    if (a5)
      *a5 = objc_retainAutorelease(v22);
    HMIErrorLog(self, v12);
    v23 = 0;
    v11 = v12;
  }
LABEL_36:

  os_unfair_lock_unlock(lock);
  return v23;
}

void __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  HMIPersonSourceUUIDPair *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v20 = 0;
  objc_msgSend(v4, "trainingFaceObservationsForPersonWithUniqueIdentifier:canceller:error:", v3, 0, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v20;
  if (v5)
  {
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_137);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x220735570]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 138543874;
      v22 = v11;
      v23 = 2112;
      v24 = v3;
      v25 = 2048;
      v26 = v12;
      _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Person %@ has %lu torsoprints", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = -[HMIPersonSourceUUIDPair initWithUUIDPairString:]([HMIPersonSourceUUIDPair alloc], "initWithUUIDPairString:", v3);
    v14 = *(void **)(a1 + 48);
    -[HMIPersonSourceUUIDPair UUIDPairString](v13, "UUIDPairString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, v15);

  }
  else
  {
    v16 = (void *)MEMORY[0x220735570]();
    v17 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v19;
      v23 = 2112;
      v24 = v3;
      v25 = 2112;
      v26 = (uint64_t)v6;
      _os_log_impl(&dword_219D45000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve torsoprints for person: %@, %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

uint64_t __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_135(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "faceId");
  if (v6 >= objc_msgSend(v5, "faceId"))
  {
    v8 = objc_msgSend(v4, "faceId");
    v7 = v8 > objc_msgSend(v5, "faceId");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMIPersonSourceUUIDPair *v14;
  void *v15;
  void *v16;
  HMIPersonSourceUUIDPair *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  _QWORD v45[6];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[5];
  _BYTE v53[24];
  uint64_t v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "faceRecognition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "torsoprints");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedLinkedEntityUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "predictedLinkedEntityUUIDs"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hmf_isEmpty"),
        v6,
        v5,
        !v7))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v56 = __Block_byref_object_copy__6;
    v57 = __Block_byref_object_dispose__6;
    v58 = 0;
    objc_msgSend(v4, "predictedLinkedEntityUUIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_140;
    v52[3] = &unk_24DBECC40;
    v52[4] = buf;
    objc_msgSend(v12, "na_each:", v52);

    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__6;
    v50 = __Block_byref_object_dispose__6;
    v51 = 0;
    objc_msgSend(v4, "classifications");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_2;
    v45[3] = &unk_24DBECC68;
    v45[4] = buf;
    v45[5] = &v46;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v45);

    if (v47[5])
    {
      v14 = [HMIPersonSourceUUIDPair alloc];
      objc_msgSend((id)v47[5], "personUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v47[5], "sourceUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:](v14, "initWithPersonUUID:sourceUUID:", v15, v16);

      *(_QWORD *)v53 = 0;
      *(_QWORD *)&v53[8] = v53;
      *(_QWORD *)&v53[16] = 0x2020000000;
      v54 = 0;
      v18 = *(void **)(a1 + 40);
      -[HMIPersonSourceUUIDPair UUIDPairString](v17, "UUIDPairString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "hmf_isEmpty") & 1) != 0)
      {
        v21 = 0;
      }
      else
      {
        v26 = *(void **)(a1 + 40);
        -[HMIPersonSourceUUIDPair UUIDPairString](v17, "UUIDPairString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v29, "faceId");

      }
      v54 = v21;
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_143;
      v44[3] = &unk_24DBECC90;
      v44[4] = v53;
      objc_msgSend(v43, "na_map:", v44);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(void **)(a1 + 40);
      -[HMIPersonSourceUUIDPair UUIDPairString](v17, "UUIDPairString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = *(void **)(a1 + 40);
      -[HMIPersonSourceUUIDPair UUIDPairString](v17, "UUIDPairString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        objc_msgSend(v34, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "arrayByAddingObjectsFromArray:", v30);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(a1 + 40);
        -[HMIPersonSourceUUIDPair UUIDPairString](v17, "UUIDPairString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, v39);

      }
      else
      {
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v30, v35);
      }

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v17);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40 == 0;

      if (v41)
      {
        objc_msgSend(v4, "faceCrop");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v42, v17);

      }
      _Block_object_dispose(v53, 8);

    }
    else
    {
      v22 = (void *)MEMORY[0x220735570]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v53 = 138543618;
        *(_QWORD *)&v53[4] = v25;
        *(_WORD *)&v53[12] = 2112;
        *(_QWORD *)&v53[14] = v4;
        _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received torso annotation with no classification corresponding to the linkedEntityUUID: %@", v53, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v8 = (void *)MEMORY[0x220735570]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_ERROR, "%{public}@Received torso annotation with no identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_140(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  v10 = v4;
  if (!v6)
    goto LABEL_4;
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (v9 == -1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v5 + 40), a2);
  }

}

void __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

id __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_143(uint64_t a1, uint64_t a2)
{
  void *v3;

  +[HMIPersonsModelManager faceObservationFromTorsoprint:](HMIPersonsModelManager, "faceObservationFromTorsoprint:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v3, "setFaceId:");
  return v3;
}

uint64_t __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_2_146(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)faceCropFromTorsoModelForHomeUUID:(id)a3 personUUID:(id)a4 sourceUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_lock;
  HMIPersonSourceUUIDPair *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12 = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:]([HMIPersonSourceUUIDPair alloc], "initWithPersonUUID:sourceUUID:", v9, v10);
  -[HMIPersonsModelManager torsoToFaceCropByHome](self, "torsoToFaceCropByHome");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (BOOL)_resetStaleTorsoStateForHome:(id)a3 torsoToFaceCropMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIPersonsModelManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  HMIPersonsModelManager *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  BOOL v26;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[HMIPersonsModelManager _isTorsoFaceCropMapStale:](self, "_isTorsoFaceCropMapStale:", v7)
    && !-[HMIPersonsModelManager _hasTorsoprinterVersionChangedForHome:](self, "_hasTorsoprinterVersionChangedForHome:", v6))
  {
    v26 = 0;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Resetting torso model and wiping data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v29 = 0;
  +[HMIPersonsModelManager getTorsoModelStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoModelStoragePathForHomeUUID:error:", v6, &v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v13;
  v15 = objc_msgSend(v14, "removeItemAtPath:error:", v12, &v28);
  v16 = v28;

  v17 = (void *)MEMORY[0x220735570]();
  v18 = v9;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v15)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      v32 = 2112;
      v33 = v12;
      v22 = "%{public}@Successfully deleted torso data at path: %@";
      v23 = v20;
      v24 = OS_LOG_TYPE_INFO;
      v25 = 22;
LABEL_10:
      _os_log_impl(&dword_219D45000, v23, v24, v22, buf, v25);

    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v21;
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v16;
    v22 = "%{public}@Failed to delete torso directory at path: %@, error: %@";
    v23 = v20;
    v24 = OS_LOG_TYPE_ERROR;
    v25 = 32;
    goto LABEL_10;
  }

  objc_autoreleasePoolPop(v17);
  v26 = 1;
LABEL_13:

  return v26;
}

- (BOOL)_hasTorsoprinterVersionChangedForHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  HMIPersonsModelManager *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0;
  +[HMIPersonsModelManager loadTorsoprinterVersion:error:](HMIPersonsModelManager, "loadTorsoprinterVersion:error:", v4, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v5
    && (+[HMITorsoprinter currentModelUUID](HMITorsoprinter, "currentModelUUID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x220735570]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_INFO, "%{public}@Torso model version on disk doesn't match current version", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 1;
  }

  return v9;
}

- (BOOL)_isTorsoFaceCropMapStale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  HMIPersonsModelManager *v11;
  NSObject *v12;
  void *v13;
  char v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__6;
      v21 = __Block_byref_object_dispose__6;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v7;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __51__HMIPersonsModelManager__isTorsoFaceCropMapStale___block_invoke;
      v16[3] = &unk_24DBECD08;
      v16[4] = &v17;
      objc_msgSend(v6, "na_each:", v16);
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDate:inSameDayAsDate:", v18[5], v7);

      if ((v9 & 1) == 0)
      {
        v10 = (void *)MEMORY[0x220735570]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v13;
          _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_INFO, "%{public}@Found stale torso_to_facecrop file", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
      }
      _Block_object_dispose(&v17, 8);

      v14 = v9 ^ 1;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __51__HMIPersonsModelManager__isTorsoFaceCropMapStale___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "dateCreated");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "earlierDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)predictPersonFromTorsoObservation:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMIPersonsModelManager *v17;
  NSObject *v18;
  id v19;
  float v20;
  HMIPersonSourceUUIDPair *v21;
  HMIPersonsModelPrediction *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMIPersonsModelPrediction *v28;
  void *v29;
  id v30;
  void *v31;
  HMIPersonsModelManager *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v8 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v46 = 0;
  v10 = -[HMIPersonsModelManager loadModelsWithError:](self, "loadModelsWithError:", &v46);
  v11 = v46;
  v12 = v11;
  if (v10)
  {
    -[HMIPersonsModelManager torsoModelsByHome](self, "torsoModelsByHome");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[HMIPersonsModelManager faceObservationFromTorsoprint:](HMIPersonsModelManager, "faceObservationFromTorsoprint:", v44);
      v45 = 0;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predictPersonFromFaceObservation:limit:canceller:error:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v45;
      v40 = v15;
      if (v15)
      {
        objc_msgSend(v15, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "predictedPersonUniqueIdentifier");
        v41 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x220735570]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "confidence");
          *(_DWORD *)buf = 138543874;
          v48 = v19;
          v49 = 2112;
          v50 = v41;
          v51 = 2048;
          v52 = v20;
          _os_log_impl(&dword_219D45000, v18, OS_LOG_TYPE_INFO, "%{public}@Torso model predicted person %@ with confidence %f", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        v21 = -[HMIPersonSourceUUIDPair initWithUUIDPairString:]([HMIPersonSourceUUIDPair alloc], "initWithUUIDPairString:", v41);
        v22 = [HMIPersonsModelPrediction alloc];
        -[HMIPersonSourceUUIDPair sourceUUID](v21, "sourceUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIPersonSourceUUIDPair personUUID](v21, "personUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v43, "confidence");
        objc_msgSend(v25, "numberWithFloat:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIPersonSourceUUIDPair personUUID](v21, "personUUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[HMIPersonsModelPrediction initWithSourceUUID:personUUID:confidence:linkedEntityUUID:](v22, "initWithSourceUUID:personUUID:confidence:linkedEntityUUID:", v23, v24, v26, v27);

        v29 = (void *)v41;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to predict using torso model for homeUUID: %@"), v8);
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1035, v35, v42);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)v35;

        v37 = v36;
        v29 = v37;
        if (a5)
          *a5 = objc_retainAutorelease(v37);
        HMIErrorLog(self, v29);
        v28 = 0;
        v12 = v29;
      }

    }
    else
    {
      v31 = (void *)MEMORY[0x220735570]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v34;
        v49 = 2112;
        v50 = (uint64_t)v8;
        _os_log_impl(&dword_219D45000, v33, OS_LOG_TYPE_DEBUG, "%{public}@There is no current torso model for home: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      v28 = 0;
    }
  }
  else
  {
    v30 = v11;
    v14 = v30;
    if (a5)
      *a5 = objc_retainAutorelease(v30);
    HMIErrorLog(self, v14);
    v28 = 0;
    v12 = v14;
  }

  os_unfair_lock_unlock(p_lock);
  return v28;
}

- (id)linkedPredictionsForPrediction:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HMIPersonSourceUUIDPair *v10;
  void *v11;
  void *v12;
  HMIPersonSourceUUIDPair *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = [HMIPersonSourceUUIDPair alloc];
  objc_msgSend(v8, "personUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:](v10, "initWithPersonUUID:sourceUUID:", v11, v12);

  -[HMIPersonsModelManager equivalencyCellForPerson:homeUUID:error:](self, "equivalencyCellForPerson:homeUUID:error:", v13, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    +[HMIPersonsModelManager minimumUUIDInEquivalencyCell:](HMIPersonsModelManager, "minimumUUIDInEquivalencyCell:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __72__HMIPersonsModelManager_linkedPredictionsForPrediction_homeUUID_error___block_invoke;
    v19[3] = &unk_24DBECD30;
    v20 = v8;
    v21 = v15;
    v16 = v15;
    objc_msgSend(v14, "na_map:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

HMIPersonsModelPrediction *__72__HMIPersonsModelManager_linkedPredictionsForPrediction_homeUUID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMIPersonsModelPrediction *v4;
  void *v5;
  void *v6;
  void *v7;
  HMIPersonsModelPrediction *v8;

  v3 = a2;
  v4 = [HMIPersonsModelPrediction alloc];
  objc_msgSend(v3, "sourceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "confidence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMIPersonsModelPrediction initWithSourceUUID:personUUID:confidence:linkedEntityUUID:](v4, "initWithSourceUUID:personUUID:confidence:linkedEntityUUID:", v5, v6, v7, *(_QWORD *)(a1 + 40));

  return v8;
}

- (void)timerDidFire:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x220735570]();
  os_unfair_lock_lock_with_options();
  -[HMIPersonsModelManager _reset](self, "_reset");
  -[HMIPersonsModelManager watchdogTimer](self, "watchdogTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspend");

  -[HMIPersonsModelManager setTransaction:](self, "setTransaction:", 0);
  os_unfair_lock_unlock(&self->_lock);
  objc_autoreleasePoolPop(v4);

}

+ (id)loadModelAtPath:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF9C48], "modelFromURL:options:error:", v5, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)persistModel:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, a5);

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x24BDF9C60]);
    objc_msgSend(v15, "setReadOnly:", 0);
    v16 = objc_msgSend(v7, "writeToURL:options:error:", v14, v15, a5);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)getModelStoragePathForHome:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[HMIPersonsModelManager getRootModelStoragePathWithError:](HMIPersonsModelManager, "getRootModelStoragePathWithError:", a4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v13[0] = v6;
    objc_msgSend(v5, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathWithComponents:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)getModelStoragePathForModel:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIPersonsModelManager getModelStoragePathForHome:error:](HMIPersonsModelManager, "getModelStoragePathForHome:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v17[0] = v7;
    v9 = objc_msgSend(v5, "isExternalLibrary");
    v10 = CFSTR("home");
    if (v9)
      v10 = CFSTR("external");
    v17[1] = v10;
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "sourceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.bin"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathWithComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)getRootModelStoragePathWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  HMIURLForCacheDirectory(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringPreferenceForKey:defaultValue:", CFSTR("personsModelStoragePath"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("personsmodels"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "absoluteURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)getUserDefinedPersonLinksStoragePathForHomeUUID:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager getModelStoragePathForHome:error:](HMIPersonsModelManager, "getModelStoragePathForHome:error:", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v10[0] = v4;
    v10[1] = CFSTR("user_defined_person_links.bin");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathWithComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)persistUserDefinedPersonLinks:(id)a3 forHomeUUID:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v7 = a3;
  +[HMIPersonsModelManager getUserDefinedPersonLinksStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getUserDefinedPersonLinksStoragePathForHomeUUID:error:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, a5);

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        v17 = objc_msgSend(v15, "writeToURL:atomically:", v14, 1);
      else
        v17 = 0;

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)loadUserDefinedPersonLinksForHomeUUID:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager getUserDefinedPersonLinksStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getUserDefinedPersonLinksStoragePathForHomeUUID:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDBCF20];
      v15[0] = objc_opt_class();
      v15[1] = objc_opt_class();
      v15[2] = objc_opt_class();
      v15[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend(v7, "readDataToEndOfFile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v10, v12, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)getTorsoSubdirectoryPathForHomeUUID:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager getModelStoragePathForHome:error:](HMIPersonsModelManager, "getModelStoragePathForHome:error:", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v10[0] = v4;
    v10[1] = CFSTR("torso");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathWithComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)getTorsoModelStoragePathForHomeUUID:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager getTorsoSubdirectoryPathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoSubdirectoryPathForHomeUUID:error:", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v10[0] = v4;
    v10[1] = CFSTR("torso.bin");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathWithComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)getTorsoToFaceCropStoragePathForHomeUUID:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager getTorsoSubdirectoryPathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoSubdirectoryPathForHomeUUID:error:", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v10[0] = v4;
    v10[1] = CFSTR("torso_to_facecrop.bin");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathWithComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)getTorsoprinterVersionStoragePathForHomeUUID:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager getTorsoSubdirectoryPathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoSubdirectoryPathForHomeUUID:error:", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    v10[0] = v4;
    v10[1] = CFSTR("torsoprinter_version.bin");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPathComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)persistTorsoToFaceCrop:(id)a3 forHomeUUID:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v7 = a3;
  +[HMIPersonsModelManager getTorsoToFaceCropStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoToFaceCropStoragePathForHomeUUID:error:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, a5);

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        v17 = objc_msgSend(v15, "writeToURL:atomically:", v14, 1);
      else
        v17 = 0;

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)persistTorsoprinterVersionForHomeUUID:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  +[HMIPersonsModelManager getTorsoprinterVersionStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoprinterVersionStoragePathForHomeUUID:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, a4);

    if (v10)
    {
      +[HMITorsoprinter currentModelUUID](HMITorsoprinter, "currentModelUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        v14 = objc_msgSend(v12, "writeToURL:atomically:", v6, 1);
      else
        v14 = 0;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)loadTorsoToFaceCrop:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager getTorsoToFaceCropStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoToFaceCropStoragePathForHomeUUID:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDBCF20];
      v15[0] = objc_opt_class();
      v15[1] = objc_opt_class();
      v15[2] = objc_opt_class();
      v15[3] = objc_opt_class();
      v15[4] = objc_opt_class();
      v15[5] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend(v7, "readDataToEndOfFile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v10, v12, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)loadTorsoprinterVersion:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager getTorsoprinterVersionStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoprinterVersionStoragePathForHomeUUID:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      v14[0] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend(v6, "readDataToEndOfFile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v9, v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)modelURLsFromPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  void *v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v25);
  v9 = v25;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v10, MEMORY[0x24BDBD1A8], 4, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;

    if (v11)
    {
      v23 = v12;
      objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\A[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}\\.bin\\Z"), 0, &v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v23;

      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __50__HMIPersonsModelManager_modelURLsFromPath_error___block_invoke;
      v21[3] = &unk_24DBECD58;
      v22 = v13;
      v15 = v13;
      objc_msgSend(v11, "na_filter:", v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v22;
      v12 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to enumerate persons models at path (%@)"), v6);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1032, v15, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v19;
      if (a4)
        *a4 = objc_retainAutorelease(v19);
      HMIErrorLog(self, v17);
      v16 = 0;
    }

    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Directory to load/store persons models (%@) does not exist"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1032, v10, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    if (a4)
      *a4 = objc_retainAutorelease(v18);
    HMIErrorLog(self, v11);
    v16 = 0;
  }

  return v16;
}

BOOL __50__HMIPersonsModelManager_modelURLsFromPath_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) == 1;

  return v4;
}

- (BOOL)loadModelsWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HMIPersonsModelManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t i;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  HMIPersonsModelManager *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMIPersonsModelManager *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  HMIPersonsModelManager *v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  HMIPersonsModelManager *v68;
  NSObject *v69;
  NSObject *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  HMIPersonsModelManager *v77;
  NSObject *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  HMIPersonsModelManager *v85;
  NSObject *v86;
  _BOOL4 v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  uint64_t v93;
  NSDictionary *personsModelsByHome;
  uint64_t v95;
  NSDictionary *userDefinedPersonLinksByHome;
  uint64_t v97;
  NSDictionary *torsoModelsByHome;
  uint64_t v99;
  NSDictionary *torsoToFaceCropByHome;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  id *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  id obj;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  HMIPersonsModelManager *v129;
  id v130;
  id v131;
  void *v132;
  id v133;
  id v134;
  id v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  id v146;
  id v147;
  id v148;
  uint8_t buf[4];
  void *v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  id v154;
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldEnableTorsoRecognition");

  if (v6)
  {
    -[HMIPersonsModelManager torsoModelsByHome](self, "torsoModelsByHome");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HMIPersonsModelManager torsoToFaceCropByHome](self, "torsoToFaceCropByHome");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 1;
  }
  -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v9)
  {
    -[HMIPersonsModelManager watchdogTimer](self, "watchdogTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "kick");

    return 1;
  }
  else
  {
    v119 = a3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = 0;
    +[HMIPersonsModelManager getRootModelStoragePathWithError:](HMIPersonsModelManager, "getRootModelStoragePathWithError:", &v148);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v148;
    v18 = v17;
    if (v16)
    {
      v118 = v6;
      v19 = (void *)MEMORY[0x220735570]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v150 = v22;
        v151 = 2112;
        v152 = (uint64_t)v16;
        _os_log_impl(&dword_219D45000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Persons Model Storage Path:%@", buf, 0x16u);

      }
      v129 = v20;

      objc_autoreleasePoolPop(v19);
      v114 = v16;
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = v18;
      v26 = objc_msgSend(v24, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v147);
      v27 = v147;

      v113 = v23;
      if ((v26 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = v27;
        objc_msgSend(v28, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v23, MEMORY[0x24BDBD1A8], 4, &v146);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v146;

        if (v29)
        {
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          obj = v29;
          v121 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
          if (v121)
          {
            v120 = *(_QWORD *)v143;
            v116 = v13;
            v117 = v14;
            v115 = v15;
            while (2)
            {
              for (i = 0; i != v121; ++i)
              {
                if (*(_QWORD *)v143 != v120)
                  objc_enumerationMutation(obj);
                v32 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
                v33 = objc_alloc(MEMORY[0x24BDD1880]);
                objc_msgSend(v32, "lastPathComponent");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = (void *)objc_msgSend(v33, "initWithUUIDString:", v34);

                if (v35)
                {
                  v131 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                  v125 = v32;
                  objc_msgSend(v32, "URLByAppendingPathComponent:", CFSTR("external"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "path");
                  v37 = objc_claimAutoreleasedReturnValue();

                  v141 = v30;
                  v127 = (void *)v37;
                  -[HMIPersonsModelManager modelURLsFromPath:error:](v129, "modelURLsFromPath:error:", v37, &v141);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v141;

                  if (!v38)
                  {
                    if (v119)
                      *v119 = objc_retainAutorelease(v27);
                    HMIErrorLog(v129, v27);
                    goto LABEL_88;
                  }
                  v123 = i;
                  v132 = v35;
                  v139 = 0u;
                  v140 = 0u;
                  v137 = 0u;
                  v138 = 0u;
                  v130 = v38;
                  v39 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v137, v155, 16);
                  if (v39)
                  {
                    v40 = v39;
                    v41 = *(_QWORD *)v138;
                    v42 = v129;
                    do
                    {
                      v43 = 0;
                      v44 = v27;
                      do
                      {
                        if (*(_QWORD *)v138 != v41)
                          objc_enumerationMutation(v130);
                        v45 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v43);
                        v136 = v44;
                        -[HMIPersonsModelManager loadPersonsModelFromURL:externalLibrary:homeUUID:error:](v42, "loadPersonsModelFromURL:externalLibrary:homeUUID:error:", v45, 1, v132, &v136);
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        v27 = v136;

                        v47 = (void *)MEMORY[0x220735570]();
                        v48 = v42;
                        HMFGetOSLogHandle();
                        v49 = objc_claimAutoreleasedReturnValue();
                        v50 = v49;
                        if (v46)
                        {
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                          {
                            HMFGetLogIdentifier();
                            v51 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v46, "sourceUUID");
                            v52 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543874;
                            v150 = v51;
                            v151 = 2112;
                            v152 = (uint64_t)v132;
                            v153 = 2112;
                            v154 = v52;
                            _os_log_impl(&dword_219D45000, v50, OS_LOG_TYPE_INFO, "%{public}@Loaded External HMIPersonsModel for homeUUID: %@ sourceUUID: %@", buf, 0x20u);

                            v42 = v129;
                          }

                          objc_autoreleasePoolPop(v47);
                          objc_msgSend(v46, "sourceUUID");
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v131, "setObject:forKeyedSubscript:", v46, v53);

                        }
                        else
                        {
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                          {
                            HMFGetLogIdentifier();
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543874;
                            v150 = v54;
                            v151 = 2112;
                            v152 = (uint64_t)v45;
                            v153 = 2112;
                            v154 = v27;
                            _os_log_impl(&dword_219D45000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to load External HMIPersonsModel at path: %@, error: %@", buf, 0x20u);

                            v42 = v129;
                          }

                          objc_autoreleasePoolPop(v47);
                        }

                        ++v43;
                        v44 = v27;
                      }
                      while (v40 != v43);
                      v40 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v137, v155, 16);
                    }
                    while (v40);
                  }
                  else
                  {
                    v42 = v129;
                  }

                  objc_msgSend(v125, "URLByAppendingPathComponent:", CFSTR("home"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "path");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();

                  v135 = v27;
                  -[HMIPersonsModelManager modelURLsFromPath:error:](v42, "modelURLsFromPath:error:", v61, &v135);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = v135;

                  v35 = v132;
                  if (!v62)
                  {
                    v13 = v116;
                    v14 = v117;
                    if (v119)
                      *v119 = objc_retainAutorelease(v63);
                    HMIErrorLog(v129, v63);
LABEL_87:

                    v27 = v63;
                    v15 = v115;
LABEL_88:

                    v12 = 0;
                    v102 = obj;
                    goto LABEL_89;
                  }
                  v13 = v116;
                  v14 = v117;
                  if ((unint64_t)objc_msgSend(v62, "count") >= 2)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Directory to load/store home persons model (%@) contains multiples files: %@ there can only be one"), v61, v62);
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1032, v109, v63);
                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                    v111 = v110;
                    if (v119)
                      *v119 = objc_retainAutorelease(v110);
                    HMIErrorLog(v129, v111);

                    v35 = v132;
                    goto LABEL_87;
                  }
                  v126 = v61;
                  v122 = v62;
                  if (objc_msgSend(v62, "count"))
                  {
                    objc_msgSend(v62, "firstObject");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v134 = v63;
                    -[HMIPersonsModelManager loadPersonsModelFromURL:externalLibrary:homeUUID:error:](v129, "loadPersonsModelFromURL:externalLibrary:homeUUID:error:", v64, 0, v132, &v134);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    v66 = v134;

                    v67 = (void *)MEMORY[0x220735570]();
                    v68 = v129;
                    HMFGetOSLogHandle();
                    v69 = objc_claimAutoreleasedReturnValue();
                    v70 = v69;
                    if (v65)
                    {
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v71 = v66;
                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v65, "sourceUUID");
                        v73 = v64;
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v150 = v72;
                        v151 = 2112;
                        v152 = (uint64_t)v132;
                        v153 = 2112;
                        v154 = v74;
                        _os_log_impl(&dword_219D45000, v70, OS_LOG_TYPE_INFO, "%{public}@Loaded Home HMIPersonsModel for homeUUID: %@ sourceUUID: %@", buf, 0x20u);

                        v64 = v73;
                        v66 = v71;
                        v13 = v116;
                        v14 = v117;
                      }

                      objc_autoreleasePoolPop(v67);
                      objc_msgSend(v65, "sourceUUID");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v131, "setObject:forKeyedSubscript:", v65, v75);

                    }
                    else
                    {
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v80 = v66;
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v150 = v81;
                        v151 = 2112;
                        v152 = (uint64_t)v64;
                        v153 = 2112;
                        v154 = v80;
                        _os_log_impl(&dword_219D45000, v70, OS_LOG_TYPE_ERROR, "%{public}@Failed to load Home HMIPersonsModel at path: %@, error: %@", buf, 0x20u);

                        v66 = v80;
                        v13 = v116;
                        v14 = v117;
                      }

                      objc_autoreleasePoolPop(v67);
                    }

                    v63 = v66;
                  }
                  else
                  {
                    v76 = (void *)MEMORY[0x220735570]();
                    v77 = v129;
                    HMFGetOSLogHandle();
                    v78 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v150 = v79;
                      v151 = 2112;
                      v152 = (uint64_t)v132;
                      _os_log_impl(&dword_219D45000, v78, OS_LOG_TYPE_INFO, "%{public}@No home model found for homeUUID: %@", buf, 0x16u);

                    }
                    objc_autoreleasePoolPop(v76);
                  }
                  v82 = (void *)objc_msgSend(v131, "copy");
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", v82, v132);

                  v133 = v63;
                  +[HMIPersonsModelManager loadUserDefinedPersonLinksForHomeUUID:error:](HMIPersonsModelManager, "loadUserDefinedPersonLinksForHomeUUID:error:", v132, &v133);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = v133;

                  v84 = (void *)MEMORY[0x220735570]();
                  v85 = v129;
                  HMFGetOSLogHandle();
                  v86 = objc_claimAutoreleasedReturnValue();
                  v87 = os_log_type_enabled(v86, OS_LOG_TYPE_INFO);
                  if (v83)
                  {
                    v15 = v115;
                    if (v87)
                    {
                      HMFGetLogIdentifier();
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      v89 = objc_msgSend(v83, "count");
                      *(_DWORD *)buf = 138543874;
                      v150 = v88;
                      v151 = 2048;
                      v152 = v89;
                      v153 = 2112;
                      v154 = v132;
                      _os_log_impl(&dword_219D45000, v86, OS_LOG_TYPE_INFO, "%{public}@Loaded %lu user defined equivalencies found for home: %@", buf, 0x20u);

                    }
                    objc_autoreleasePoolPop(v84);
                  }
                  else
                  {
                    v15 = v115;
                    if (v87)
                    {
                      HMFGetLogIdentifier();
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "shortDescription");
                      v91 = v30;
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v150 = v90;
                      v151 = 2112;
                      v152 = (uint64_t)v132;
                      v153 = 2112;
                      v154 = v92;
                      _os_log_impl(&dword_219D45000, v86, OS_LOG_TYPE_INFO, "%{public}@No user defined equivalencies found for home: %@ (reason: %@)", buf, 0x20u);

                      v30 = v91;
                    }

                    objc_autoreleasePoolPop(v84);
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  objc_msgSend(v14, "setObject:forKeyedSubscript:", v83, v132);
                  if (v118)
                    -[HMIPersonsModelManager _loadTorsoDataForHomeUUID:intoTorsoModelsByHome:torsoToFaceCropByHome:](v85, "_loadTorsoDataForHomeUUID:intoTorsoModelsByHome:torsoToFaceCropByHome:", v132, v15, v128);

                  i = v123;
                }
                else
                {
                  v55 = (void *)MEMORY[0x220735570]();
                  v56 = v129;
                  HMFGetOSLogHandle();
                  v57 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v58 = v30;
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v150 = v59;
                    v151 = 2112;
                    v152 = (uint64_t)v32;
                    _os_log_impl(&dword_219D45000, v57, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Home UUID from path: %@", buf, 0x16u);

                    v30 = v58;
                  }

                  objc_autoreleasePoolPop(v55);
                }
              }
              v121 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
              if (v121)
                continue;
              break;
            }
          }

          v93 = objc_msgSend(v13, "copy");
          personsModelsByHome = v129->_personsModelsByHome;
          v129->_personsModelsByHome = (NSDictionary *)v93;

          v95 = objc_msgSend(v14, "copy");
          userDefinedPersonLinksByHome = v129->_userDefinedPersonLinksByHome;
          v129->_userDefinedPersonLinksByHome = (NSDictionary *)v95;

          v97 = objc_msgSend(v15, "copy");
          torsoModelsByHome = v129->_torsoModelsByHome;
          v129->_torsoModelsByHome = (NSDictionary *)v97;

          v99 = objc_msgSend(v128, "copy");
          torsoToFaceCropByHome = v129->_torsoToFaceCropByHome;
          v129->_torsoToFaceCropByHome = (NSDictionary *)v99;

          v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("HMIPersonsModelManager"));
          -[HMIPersonsModelManager setTransaction:](v129, "setTransaction:", v101);

          -[HMIPersonsModelManager watchdogTimer](v129, "watchdogTimer");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "resume");
          v12 = 1;
        }
        else
        {
          obj = 0;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to enumerate homes at path: %@"), v23);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1032, v102, v30);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v107;
          if (v119)
            *v119 = objc_retainAutorelease(v107);
          HMIErrorLog(v129, v108);

          v12 = 0;
        }
        v27 = v30;
      }
      else
      {
        v103 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v23, "path");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "stringWithFormat:", CFSTR("Directory to load/store persons models (%@) does not exist"), v104);
        v105 = objc_claimAutoreleasedReturnValue();

        obj = (id)v105;
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1032, v105, v27);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = v106;
        if (v119)
          *v119 = objc_retainAutorelease(v106);
        HMIErrorLog(v129, v102);
        v12 = 0;
      }
LABEL_89:

      v18 = v27;
      v16 = v114;
    }
    else
    {
      if (a3)
        *a3 = objc_retainAutorelease(v17);
      HMIErrorLog(self, v18);
      v12 = 0;
    }

  }
  return v12;
}

- (void)_loadTorsoDataForHomeUUID:(id)a3 intoTorsoModelsByHome:(id)a4 torsoToFaceCropByHome:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  HMIPersonsModelManager *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMIPersonsModelManager *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint32_t v31;
  void *v32;
  HMIPersonsModelManager *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40 = 0;
  +[HMIPersonsModelManager getTorsoModelStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoModelStoragePathForHomeUUID:error:", v8, &v40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v40;
  if (!v11)
  {
    v24 = (void *)MEMORY[0x220735570]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v27;
      v43 = 2112;
      v44 = v12;
      v28 = "%{public}@Got nil for torso model file path, error: %@";
      v29 = v26;
      v30 = OS_LOG_TYPE_ERROR;
      v31 = 22;
LABEL_13:
      _os_log_impl(&dword_219D45000, v29, v30, v28, buf, v31);

    }
LABEL_14:

    objc_autoreleasePoolPop(v24);
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v11);

  if ((v14 & 1) == 0)
  {
    v24 = (void *)MEMORY[0x220735570]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v27;
      v43 = 2112;
      v44 = v8;
      v45 = 2112;
      v46 = v11;
      v28 = "%{public}@No torso model found for home %@ at path: %@";
      v29 = v26;
      v30 = OS_LOG_TYPE_INFO;
      v31 = 32;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v39 = v12;
  +[HMIPersonsModelManager loadTorsoToFaceCrop:error:](HMIPersonsModelManager, "loadTorsoToFaceCrop:error:", v8, &v39);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v39;

  if (v15)
  {
    if (!-[HMIPersonsModelManager _resetStaleTorsoStateForHome:torsoToFaceCropMap:](self, "_resetStaleTorsoStateForHome:torsoToFaceCropMap:", v8, v15))
    {
      v38 = v16;
      +[HMIPersonsModelManager loadModelAtPath:error:](HMIPersonsModelManager, "loadModelAtPath:error:", v11, &v38);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v38;

      v19 = (void *)MEMORY[0x220735570]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v17)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = v18;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v23;
          v43 = 2112;
          v44 = v8;
          _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_INFO, "%{public}@Successfully loaded torso model and face crop map for home: %@", buf, 0x16u);

          v18 = v36;
        }

        objc_autoreleasePoolPop(v19);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v8);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v8);
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v37;
          v43 = 2112;
          v44 = v11;
          v45 = 2112;
          v46 = v18;
          _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to load torso model at path: %@, error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v19);
      }

      v16 = v18;
    }
  }
  else
  {
    v32 = (void *)MEMORY[0x220735570]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v35;
      v43 = 2112;
      v44 = v16;
      _os_log_impl(&dword_219D45000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to load torsoToFaceCrop map, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
  }

  v12 = v16;
LABEL_23:

}

- (id)loadPersonsModelFromURL:(id)a3 externalLibrary:(BOOL)a4 homeUUID:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMIPersonsModel *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v42;
  id v43;
  id v44;
  id v45;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "URLByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
  if (v14)
  {
    objc_msgSend(v10, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("bin"));

    if ((v16 & 1) != 0)
    {
      v42 = v8;
      v43 = v11;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      objc_msgSend(v17, "attributesOfItemAtPath:error:", v18, &v45);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v45;
      v21 = objc_msgSend(v19, "fileSize");

      if (v21 < 0x2800001)
      {
        objc_msgSend(v10, "path");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v20;
        +[HMIPersonsModelManager loadModelAtPath:error:](HMIPersonsModelManager, "loadModelAtPath:error:", v34, &v44);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v44;

        if (v25)
        {
          v11 = v43;
          v28 = -[HMIPersonsModel initWithPersonsModel:homeUUID:sourceUUID:externalLibrary:]([HMIPersonsModel alloc], "initWithPersonsModel:homeUUID:sourceUUID:externalLibrary:", v25, v43, v14, v42);
          v20 = v35;
LABEL_16:

          goto LABEL_17;
        }
        v36 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v10, "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("Failed to load VNPersonsModel at path: %@"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1032, v38, v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (a6)
          *a6 = objc_retainAutorelease(v39);
        HMIErrorLog(self, v40);

        v28 = 0;
        v20 = v35;
      }
      else
      {
        v22 = (void *)MEMORY[0x24BDD17C8];
        NSLocalizedFileSizeDescription();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("Refusing to load %@ VNPersonsModel at path: %@"), v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1032, v25, v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (a6)
          *a6 = objc_retainAutorelease(v26);
        HMIErrorLog(self, v27);

        v28 = 0;
      }
      v11 = v43;
      goto LABEL_16;
    }
  }
  v29 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "path");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("Invalid file path in load model attempt: %@"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1032, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (a6)
    *a6 = objc_retainAutorelease(v32);
  HMIErrorLog(self, v33);

  v28 = 0;
LABEL_17:

  return v28;
}

- (id)summaryForHomeUUID:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  id v23;
  HMIPersonsModelsSummary *v24;
  HMIPersonsModelsSummary *v25;
  void *v26;
  id v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  v6 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v40 = 0;
  v8 = -[HMIPersonsModelManager loadModelsWithError:](self, "loadModelsWithError:", &v40);
  v9 = v40;
  v10 = v9;
  if (v8)
  {
    -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "na_map:", &__block_literal_global_193);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIPersonsModelManager equivalencyTablesByHome](self, "equivalencyTablesByHome");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
LABEL_6:
        -[HMIPersonsModelManager homePersonsModelForHomeWithUUID:](self, "homePersonsModelForHomeWithUUID:", v6, v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = 0;
        v37[1] = v37;
        v37[2] = 0x3032000000;
        v37[3] = __Block_byref_object_copy__6;
        v37[4] = __Block_byref_object_dispose__6;
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v38 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "personToEquivalencyCell");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke_2;
        v32[3] = &unk_24DBECDE8;
        v20 = v18;
        v33 = v20;
        v34 = &v45;
        v35 = &v41;
        v36 = v37;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v32);

        _Block_object_dispose(v37, 8);
        v21 = 0;
LABEL_14:

        goto LABEL_15;
      }
      -[HMIPersonsModelManager personsModelsByHome](self, "personsModelsByHome");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIPersonsModelManager userDefinedPersonLinksByHome](self, "userDefinedPersonLinksByHome");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v10;
      -[HMIPersonsModelManager buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:](self, "buildEquivalencyMapForPersonsModels:userDefinedPersonLinks:error:", v30, v17, &v39);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v39;

      if (v15)
      {
        v10 = v29;
        goto LABEL_6;
      }
      v28 = v29;
      v15 = v28;
      if (a4)
        *a4 = objc_retainAutorelease(v28);
      HMIErrorLog(self, v15);
    }
    else
    {
      v23 = v10;
      v15 = v23;
      if (a4)
        *a4 = objc_retainAutorelease(v23);
      HMIErrorLog(self, v15);
      v13 = (void *)MEMORY[0x24BDBD1A8];
    }
    v21 = 1;
    v10 = v15;
    goto LABEL_14;
  }
  v22 = v9;
  v12 = v22;
  if (a4)
    *a4 = objc_retainAutorelease(v22);
  HMIErrorLog(self, v12);
  v13 = (void *)MEMORY[0x24BDBD1A8];
  v21 = 1;
  v10 = v12;
LABEL_15:

  os_unfair_lock_unlock(p_lock);
  if (v21)
  {
    v24 = 0;
  }
  else
  {
    v25 = [HMIPersonsModelsSummary alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMIPersonsModelsSummary initWithModelSummaries:homeToExternalEquivalencies:externalToExternalEquivalencies:](v25, "initWithModelSummaries:homeToExternalEquivalencies:externalToExternalEquivalencies:", v26, v46[3], v42[3]);

  }
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v24;
}

uint64_t __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "summary");
}

void __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v5 = a2;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(v5, "sourceUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sourceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "count")
                                                                  + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24)
                                                                  - 1;
      v10 = objc_msgSend(v6, "count") - 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += (unint64_t)((objc_msgSend(v6, "count") - 2)
                                                                                      * v10) >> 1;
    }
    else
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__6;
      v20 = __Block_byref_object_dispose__6;
      v21 = 0;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke_3;
      v12[3] = &unk_24DBECDC0;
      v14 = &v22;
      v13 = *(id *)(a1 + 32);
      v15 = &v16;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
      if (!*((_BYTE *)v23 + 24)
        && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsObject:", v17[5]) & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v17[5]);
        v11 = objc_msgSend(v6, "count");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += (unint64_t)((objc_msgSend(v6, "count") - 1)
                                                                                        * v11) >> 1;
      }

      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&v22, 8);
    }
  }

}

void __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;

  v3 = a2;
  objc_msgSend(v3, "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "isEqual:", v5);

  objc_msgSend(v3, "personUUID");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  if (!v7)
  {
    v11 = obj;
    goto LABEL_5;
  }
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  if (v10 == -1)
  {
    v11 = obj;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
LABEL_5:
    objc_storeStrong((id *)(v6 + 40), v11);
  }

}

+ (id)minimumUUIDInEquivalencyCell:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__HMIPersonsModelManager_minimumUUIDInEquivalencyCell___block_invoke;
  v6[3] = &unk_24DBECE10;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__HMIPersonsModelManager_minimumUUIDInEquivalencyCell___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id obj;

  objc_msgSend(a2, "personUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  obj = (id)v3;
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  v9 = obj;
  if (v8 == -1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v4 + 40), obj);
    v9 = obj;
  }

}

- (void)reset
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIPersonsModelManager _reset](self, "_reset");
  os_unfair_lock_unlock(p_lock);
}

- (void)_reset
{
  void *v3;
  HMIPersonsModelManager *v4;
  NSObject *v5;
  void *v6;
  NSDictionary *personsModelsByHome;
  NSDictionary *equivalencyTablesByHome;
  uint64_t v9;
  NSDictionary *userDefinedPersonLinksByHome;
  NSDictionary *torsoModelsByHome;
  NSDictionary *torsoToFaceCropByHome;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x220735570](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMIPersonsModelManager", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  personsModelsByHome = v4->_personsModelsByHome;
  v4->_personsModelsByHome = 0;

  equivalencyTablesByHome = v4->_equivalencyTablesByHome;
  v4->_equivalencyTablesByHome = 0;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v9 = objc_claimAutoreleasedReturnValue();
  userDefinedPersonLinksByHome = v4->_userDefinedPersonLinksByHome;
  v4->_userDefinedPersonLinksByHome = (NSDictionary *)v9;

  torsoModelsByHome = v4->_torsoModelsByHome;
  v4->_torsoModelsByHome = 0;

  torsoToFaceCropByHome = v4->_torsoToFaceCropByHome;
  v4->_torsoToFaceCropByHome = 0;

}

- (NSDictionary)userDefinedPersonLinksByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (HMFOSTransaction)transaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)personsModelsByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)torsoModelsByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)torsoToFaceCropByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)equivalencyTablesByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equivalencyTablesByHome, 0);
  objc_storeStrong((id *)&self->_torsoToFaceCropByHome, 0);
  objc_storeStrong((id *)&self->_torsoModelsByHome, 0);
  objc_storeStrong((id *)&self->_personsModelsByHome, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_userDefinedPersonLinksByHome, 0);
}

@end
