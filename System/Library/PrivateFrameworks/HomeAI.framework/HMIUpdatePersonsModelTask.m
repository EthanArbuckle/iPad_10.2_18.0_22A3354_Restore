@implementation HMIUpdatePersonsModelTask

- (HMIUpdatePersonsModelTask)initWithTaskID:(int)a3 homeUUID:(id)a4 sourceUUID:(id)a5 dataSource:(id)a6 externalLibrary:(BOOL)a7 removeExcessFaceCrops:(BOOL)a8
{
  uint64_t v13;
  id v15;
  id v16;
  HMIUpdatePersonsModelTask *v17;
  HMIUpdatePersonsModelTask *v18;
  objc_super v20;

  v13 = *(_QWORD *)&a3;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMIUpdatePersonsModelTask;
  v17 = -[HMIHomeTask initWithTaskID:homeUUID:timeout:](&v20, sel_initWithTaskID_homeUUID_timeout_, v13, a4, 500.0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sourceUUID, a5);
    objc_storeStrong((id *)&v18->_dataSource, a6);
    v18->_externalLibrary = a7;
    v18->_removeExcessFaceCrops = a8;
  }

  return v18;
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  HMIUpdatePersonsModelTask *v4;
  NSObject *v5;
  void *v6;
  HMIFetchPersonsOperation *v7;
  void *v8;
  HMIFetchPersonsOperation *v9;
  void *v10;
  void *v11;
  HMIUpdatePersonsModelTask *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  HMIUpdatePersonsModelTask *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void (**v31)(double);
  int v32;
  void *v33;
  HMIUpdatePersonsModelTask *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  HMIFetchPersonFaceCropsOperation *v38;
  void *v39;
  HMIFetchPersonFaceCropsOperation *v40;
  void *v41;
  void *v42;
  void *v43;
  HMIUpdatePersonsModelTask *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  HMIFetchFaceprintsForFaceCropsOperation *v49;
  void *v50;
  HMIFetchFaceprintsForFaceCropsOperation *v51;
  void *v52;
  void *v53;
  HMIUpdatePersonsModelTask *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  HMIUpdatePersonsModelTask *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  HMIStoreFaceprintsOperation *v70;
  void *v71;
  void *v72;
  HMIStoreFaceprintsOperation *v73;
  void *v74;
  HMIUpdatePersonsModelTask *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  HMIRemoveFaceprintsOperation *v83;
  void *v84;
  HMIRemoveFaceprintsOperation *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  HMIUpdatePersonsModelTask *v91;
  NSObject *v92;
  id v93;
  void *v94;
  void *v95;
  HMIUpdatePersonsModelTask *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  HMIUpdatePersonsModelTask *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  char v111;
  id v112;
  void *v113;
  int v114;
  void *v115;
  void *v116;
  HMIUpdatePersonsModelTask *v117;
  NSObject *v118;
  void *v119;
  void *v120;
  void *v121;
  HMIUpdatePersonsModelTask *v122;
  NSObject *v123;
  void *v124;
  void *v125;
  HMIUpdatePersonsModelTask *v126;
  NSObject *v127;
  void *v128;
  void *v129;
  HMIFetchPersonsOperation *v130;
  void *v131;
  void *v132;
  void *v133;
  HMIUpdatePersonsModelTask *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  void *v139;
  HMIFaceprinter *v140;
  void *v141;
  uint64_t v142;
  objc_super v143;
  id v144;
  _QWORD v145[4];
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint8_t buf[4];
  void *v153;
  __int16 v154;
  uint64_t v155;
  __int16 v156;
  void *v157;
  _BYTE v158[128];
  uint64_t v159;

  v159 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x220735570](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v153 = v6;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching persons", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = [HMIFetchPersonsOperation alloc];
  -[HMIUpdatePersonsModelTask dataSource](v4, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMIFetchPersonsOperation initWithDataSource:](v7, "initWithDataSource:", v8);

  -[HMFOperation start](v9, "start");
  -[HMIFetchPersonsOperation waitUntilFinished](v9, "waitUntilFinished");
  -[HMFOperation error](v9, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x220735570]();
    v12 = v4;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFOperation error](v9, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v153 = v14;
      v154 = 2112;
      v155 = (uint64_t)v15;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_ERROR, "%{public}@Error fetching persons, error:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v16 = (void *)MEMORY[0x24BDD1540];
    -[HMFOperation error](v9, "error");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = (void *)v17;
    objc_msgSend(v18, "hmiPrivateErrorWithCode:underlyingError:", 1026, v17);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](v12, "cancelWithError:", v20);
  }
  else
  {
    v130 = v9;
    -[HMIFetchPersonsOperation persons](v9, "persons");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x220735570]();
    v23 = v4;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v21, "count");
      *(_DWORD *)buf = 138543618;
      v153 = v25;
      v154 = 2048;
      v155 = v26;
      _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu persons", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v129 = v21;
    -[HMIUpdatePersonsModelTask limitEnforcedSubsetFromPersons:](v23, "limitEnforcedSubsetFromPersons:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = objc_alloc_init(HMIFaceprinter);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v20 = v27;
    v136 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
    if (v136)
    {
      v137 = *(_QWORD *)v149;
      v134 = v23;
      v135 = v20;
LABEL_11:
      v28 = 0;
      while (1)
      {
        if (*(_QWORD *)v149 != v137)
          objc_enumerationMutation(v20);
        v29 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v28);
        -[HMITask progressBlock](v23, "progressBlock");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          -[HMITask progressBlock](v23, "progressBlock");
          v31 = (void (**)(double))objc_claimAutoreleasedReturnValue();
          v31[2](0.0);

        }
        v32 = -[HMIUpdatePersonsModelTask isCancelled](v23, "isCancelled");
        v33 = (void *)MEMORY[0x220735570]();
        v34 = v23;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
        if (v32)
          break;
        if (v36)
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v153 = v37;
          v154 = 2112;
          v155 = (uint64_t)v29;
          _os_log_impl(&dword_219D45000, v35, OS_LOG_TYPE_INFO, "%{public}@Fetching face crops for person: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        v38 = [HMIFetchPersonFaceCropsOperation alloc];
        -[HMIUpdatePersonsModelTask dataSource](v34, "dataSource");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[HMIFetchPersonFaceCropsOperation initWithDataSource:person:](v38, "initWithDataSource:person:", v39, v29);

        -[HMFOperation start](v40, "start");
        -[HMIFetchPersonFaceCropsOperation waitUntilFinished](v40, "waitUntilFinished");
        -[HMFOperation error](v40, "error");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          v100 = (void *)MEMORY[0x220735570]();
          v101 = v34;
          HMFGetOSLogHandle();
          v102 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMFOperation error](v40, "error");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v153 = v103;
            v154 = 2112;
            v155 = (uint64_t)v29;
            v156 = 2112;
            v157 = v104;
            _os_log_impl(&dword_219D45000, v102, OS_LOG_TYPE_ERROR, "%{public}@Error fetching facecrops for person:%@, error:%@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v100);
          v105 = (void *)MEMORY[0x24BDD1540];
          -[HMFOperation error](v40, "error");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "hmiPrivateErrorWithCode:underlyingError:", 1026, v106);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMFOperation cancelWithError:](v101, "cancelWithError:", v107);

LABEL_54:
          goto LABEL_71;
        }
        v142 = v28;
        -[HMIFetchPersonFaceCropsOperation personFaceCrops](v40, "personFaceCrops");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x220735570]();
        v44 = v34;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v42, "count");
          *(_DWORD *)buf = 138543874;
          v153 = v46;
          v154 = 2048;
          v155 = v47;
          v156 = 2112;
          v157 = v29;
          _os_log_impl(&dword_219D45000, v45, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu face crops for person: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v43);
        if ((unint64_t)objc_msgSend(v42, "count") >= 0x1F)
          objc_msgSend(v131, "addObject:", v29);
        objc_msgSend(v42, "na_map:", &__block_literal_global_35);
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = [HMIFetchFaceprintsForFaceCropsOperation alloc];
        -[HMIUpdatePersonsModelTask dataSource](v44, "dataSource");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = (void *)v48;
        v51 = -[HMIFetchFaceprintsForFaceCropsOperation initWithDataSource:faceCropUUIDs:](v49, "initWithDataSource:faceCropUUIDs:", v50, v48);

        -[HMFOperation start](v51, "start");
        -[HMIFetchFaceprintsForFaceCropsOperation waitUntilFinished](v51, "waitUntilFinished");
        -[HMFOperation error](v51, "error");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          v53 = (void *)MEMORY[0x220735570]();
          v54 = v44;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMFOperation error](v51, "error");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v153 = v56;
            v154 = 2112;
            v155 = (uint64_t)v29;
            v156 = 2112;
            v157 = v57;
            _os_log_impl(&dword_219D45000, v55, OS_LOG_TYPE_ERROR, "%{public}@Ignoring error fetching faceprints for person:%@, error:%@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v53);
        }
        -[HMIFetchFaceprintsForFaceCropsOperation faceprints](v51, "faceprints");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = 0;
        -[HMIFaceprinter updatedFaceprintsForFaceCrops:withExistingFaceprints:error:](v140, "updatedFaceprintsForFaceCrops:withExistingFaceprints:error:", v42, v58, &v147);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v147;

        if (v59)
        {
          v138 = v60;
          objc_msgSend(v59, "allAtCurrentVersion");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v145[0] = MEMORY[0x24BDAC760];
          v145[1] = 3221225472;
          v145[2] = __54__HMIUpdatePersonsModelTask_mainInsideAutoreleasePool__block_invoke_30;
          v145[3] = &unk_24DBEDBA0;
          v146 = v132;
          objc_msgSend(v61, "na_map:", v145);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = (void *)MEMORY[0x220735570](objc_msgSend(v133, "setObject:forKeyedSubscript:", v62, v29));
          v64 = v44;
          HMFGetOSLogHandle();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "createdAtCurrentVersion");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v153 = v66;
            v154 = 2112;
            v155 = (uint64_t)v67;
            _os_log_impl(&dword_219D45000, v65, OS_LOG_TYPE_INFO, "%{public}@Storing newly created faceprints: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v63);
          objc_msgSend(v59, "createdAtCurrentVersion");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "count");

          if (v69)
          {
            v70 = [HMIStoreFaceprintsOperation alloc];
            -[HMIUpdatePersonsModelTask dataSource](v64, "dataSource");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "createdAtCurrentVersion");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = -[HMIStoreFaceprintsOperation initWithDataSource:faceprints:](v70, "initWithDataSource:faceprints:", v71, v72);

            -[HMFOperation start](v73, "start");
            -[HMIStoreFaceprintsOperation waitUntilFinished](v73, "waitUntilFinished");

          }
          v74 = (void *)MEMORY[0x220735570]();
          v75 = v64;
          HMFGetOSLogHandle();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "existingAtOtherVersions");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v153 = v77;
            v154 = 2112;
            v155 = (uint64_t)v78;
            _os_log_impl(&dword_219D45000, v76, OS_LOG_TYPE_INFO, "%{public}@Removing existing faceprints at other versions: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v74);
          objc_msgSend(v59, "existingAtOtherVersions");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "count");

          if (v80)
          {
            objc_msgSend(v59, "existingAtOtherVersions");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "na_map:", &__block_literal_global_35);
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            v83 = [HMIRemoveFaceprintsOperation alloc];
            -[HMIUpdatePersonsModelTask dataSource](v75, "dataSource");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = -[HMIRemoveFaceprintsOperation initWithDataSource:faceprintUUIDs:](v83, "initWithDataSource:faceprintUUIDs:", v84, v82);

            -[HMFOperation start](v85, "start");
            -[HMIRemoveFaceprintsOperation waitUntilFinished](v85, "waitUntilFinished");

          }
          v86 = v146;
          v23 = v134;
          v20 = v135;
          v87 = v141;
          v88 = v142;
          v89 = v138;
        }
        else
        {
          v90 = (void *)MEMORY[0x220735570]();
          v91 = v44;
          HMFGetOSLogHandle();
          v92 = objc_claimAutoreleasedReturnValue();
          v87 = v141;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v139 = v42;
            v93 = v60;
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v153 = v94;
            v154 = 2112;
            v155 = (uint64_t)v29;
            v156 = 2112;
            v157 = v93;
            _os_log_impl(&dword_219D45000, v92, OS_LOG_TYPE_ERROR, "%{public}@Error faceprinting face crops for person:%@, error:%@", buf, 0x20u);

            v60 = v93;
            v42 = v139;
          }

          objc_autoreleasePoolPop(v90);
          objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1026, v60);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMFOperation cancelWithError:](v91, "cancelWithError:", v86);
          v89 = v60;
          v23 = v134;
          v20 = v135;
          v88 = v142;
        }

        if (!v59)
          goto LABEL_54;
        v28 = v88 + 1;
        if (v136 == v28)
        {
          v136 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
          if (v136)
            goto LABEL_11;
          goto LABEL_44;
        }
      }
      if (v36)
      {
        HMFGetLogIdentifier();
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v153 = v99;
        _os_log_impl(&dword_219D45000, v35, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v33);
      goto LABEL_54;
    }
LABEL_44:

    if (-[HMIUpdatePersonsModelTask isCancelled](v23, "isCancelled"))
    {
      v95 = (void *)MEMORY[0x220735570]();
      v96 = v23;
      HMFGetOSLogHandle();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v153 = v98;
        _os_log_impl(&dword_219D45000, v97, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v95);
    }
    else
    {
      +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIHomeTask homeUUID](v23, "homeUUID");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIUpdatePersonsModelTask sourceUUID](v23, "sourceUUID");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = 0;
      v111 = objc_msgSend(v108, "buildPersonsModelForHomeUUID:sourceUUID:externalLibrary:faceObservationsByPerson:error:", v109, v110, -[HMIUpdatePersonsModelTask isExternalLibrary](v23, "isExternalLibrary"), v133, &v144);
      v112 = v144;

      if ((v111 & 1) != 0)
      {
        if (!-[HMIUpdatePersonsModelTask isExternalLibrary](v23, "isExternalLibrary")
          && -[HMIUpdatePersonsModelTask shouldRemoveExcessFaceCrops](v23, "shouldRemoveExcessFaceCrops")
          && objc_msgSend(v131, "count"))
        {
          -[HMIUpdatePersonsModelTask dataSource](v23, "dataSource");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = objc_msgSend(v113, "conformsToProtocol:", &unk_2550C3768);

          if (v114)
          {
            -[HMIUpdatePersonsModelTask dataSource](v23, "dataSource");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMIUpdatePersonsModelTask subsampleFacesForPersons:withFaceObservationsMap:dataSource:vnUUIDToFaceCropUUIDMap:](v23, "subsampleFacesForPersons:withFaceObservationsMap:dataSource:vnUUIDToFaceCropUUIDMap:", v131, v133, v115, v132);

          }
          else
          {
            v121 = (void *)MEMORY[0x220735570]();
            v122 = v23;
            HMFGetOSLogHandle();
            v123 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v153 = v124;
              _os_log_impl(&dword_219D45000, v123, OS_LOG_TYPE_ERROR, "%{public}@Invalid configuration: isExternalLibrary is NO but self.dataSource does not conform to HMIHomePersonManagerDataSource protocol!", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v121);
          }
        }
        v125 = (void *)MEMORY[0x220735570]();
        v126 = v23;
        HMFGetOSLogHandle();
        v127 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v153 = v128;
          _os_log_impl(&dword_219D45000, v127, OS_LOG_TYPE_INFO, "%{public}@Successfully updated persons model", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v125);
        v143.receiver = v126;
        v143.super_class = (Class)HMIUpdatePersonsModelTask;
        -[HMFOperation finish](&v143, sel_finish);
      }
      else
      {
        v116 = (void *)MEMORY[0x220735570]();
        v117 = v23;
        HMFGetOSLogHandle();
        v118 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v153 = v119;
          v154 = 2112;
          v155 = (uint64_t)v112;
          _os_log_impl(&dword_219D45000, v118, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate persons model, error:%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v116);
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1026, v112);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFOperation cancelWithError:](v117, "cancelWithError:", v120);

      }
    }
LABEL_71:
    v19 = v129;
    v9 = v130;

  }
}

uint64_t __54__HMIUpdatePersonsModelTask_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

id __54__HMIUpdatePersonsModelTask_mainInsideAutoreleasePool__block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  +[HMIFaceUtilities faceObservationFromFaceprint:](HMIFaceUtilities, "faceObservationFromFaceprint:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceCropUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  return v4;
}

uint64_t __54__HMIUpdatePersonsModelTask_mainInsideAutoreleasePool__block_invoke_34(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (id)limitEnforcedSubsetFromPersons:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HMIUpdatePersonsModelTask *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 0x50)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_filter:", &__block_literal_global_109);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") > 0x50)
    {
      v8 = (void *)MEMORY[0x220735570]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v11;
        v21 = 2048;
        v22 = objc_msgSend(v7, "count");
        v23 = 1024;
        v24 = 80;
        _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_ERROR, "%{public}@WARNING: Model has %lu named persons -- limit supported is %d", (uint8_t *)&v19, 0x1Cu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v7, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subarrayWithRange:", 0, 80);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v13);

    }
    else
    {
      objc_msgSend(v6, "unionSet:", v7);
    }
    if ((unint64_t)objc_msgSend(v6, "count") <= 0x4F)
    {
      v14 = 80 - objc_msgSend(v6, "count");
      objc_msgSend(v4, "na_filter:", &__block_literal_global_111);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subarrayWithRange:", 0, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v17);

    }
    v5 = (id)objc_msgSend(v6, "copy");

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

BOOL __60__HMIUpdatePersonsModelTask_limitEnforcedSubsetFromPersons___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __60__HMIUpdatePersonsModelTask_limitEnforcedSubsetFromPersons___block_invoke_110(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)subsampleFacesForPersons:(id)a3 withFaceObservationsMap:(id)a4 dataSource:(id)a5 vnUUIDToFaceCropUUIDMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  HMIUpdatePersonsModelTask *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  HMIRemoveFaceCropsOperation *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(id *, void *);
  void *v31;
  id v32;
  HMIUpdatePersonsModelTask *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke;
  v31 = &unk_24DBEDCD0;
  v15 = v11;
  v32 = v15;
  v33 = self;
  v16 = v13;
  v34 = v16;
  v17 = v14;
  v35 = v17;
  objc_msgSend(v10, "na_each:", &v28);
  v18 = objc_msgSend(v17, "count", v28, v29, v30, v31);
  v19 = (void *)MEMORY[0x220735570]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      v38 = 2048;
      v39 = v24;
      _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_INFO, "%{public}@Deleting a total of %lu face crops after subsampling", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v25 = -[HMIRemoveFaceCropsOperation initWithDataSource:faceCropUUIDs:]([HMIRemoveFaceCropsOperation alloc], "initWithDataSource:faceCropUUIDs:", v12, v17);
    -[HMFOperation start](v25, "start");
    -[HMIRemoveFaceCropsOperation waitUntilFinished](v25, "waitUntilFinished");

  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138543618;
      v37 = v26;
      v38 = 2048;
      v39 = v27;
      _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_ERROR, "%{public}@Selected %lu persons for subsampling faces but did not choose any face crops to delete!", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

void __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  _BYTE v51[18];
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personsModelsByHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "sourceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "visionPersonsModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v11, "trainingFaceObservationsForPersonWithUniqueIdentifier:canceller:error:", v13, 0, &v47);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v47;

  if (v14)
  {
    if (objc_msgSend(v14, "count"))
    {
      v44 = v4;
      if ((unint64_t)objc_msgSend(v14, "count") >= 0x15)
      {
        v16 = (void *)MEMORY[0x220735570]();
        v17 = a1[5];
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v14, "count");
          *(_DWORD *)buf = 138543874;
          v49 = v19;
          v50 = 1024;
          *(_DWORD *)v51 = 20;
          *(_WORD *)&v51[4] = 2048;
          *(_QWORD *)&v51[6] = v20;
          _os_log_impl(&dword_219D45000, v18, OS_LOG_TYPE_ERROR, "%{public}@Expected subsampling to leave no more than %d, but got %lu faces selected. Enforcing limit.", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v14, "subarrayWithRange:", 0, 20);
        v21 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v21;
      }
      v43 = v15;
      v22 = (void *)MEMORY[0x220735570]();
      v23 = a1[5];
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v14, "count");
        v27 = objc_msgSend(v44, "count");
        *(_DWORD *)buf = 138544130;
        v49 = v25;
        v50 = 2048;
        *(_QWORD *)v51 = v26;
        *(_WORD *)&v51[8] = 2048;
        *(_QWORD *)&v51[10] = v27;
        v52 = 2112;
        v53 = v3;
        _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_INFO, "%{public}@Subsampling will retain %lu from a total of %lu faces for %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v22);
      v28 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v14, "na_map:", &__block_literal_global_115_0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWithArray:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v44;
      objc_msgSend(v44, "na_map:", &__block_literal_global_116);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "na_setByRemovingObjectsFromSet:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke_3;
      v45[3] = &unk_24DBEDCA8;
      v46 = a1[6];
      objc_msgSend(v32, "na_map:", v45);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[7], "unionSet:", v33);
      v15 = v43;
    }
    else
    {
      v38 = (void *)MEMORY[0x220735570]();
      v39 = a1[5];
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = v4;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v42;
        v50 = 2112;
        *(_QWORD *)v51 = v3;
        _os_log_impl(&dword_219D45000, v40, OS_LOG_TYPE_ERROR, "%{public}@Fetched 0 training faces for %@, this would remove all face crops! Skipping face crop removal.", buf, 0x16u);

        v4 = v41;
      }

      objc_autoreleasePoolPop(v38);
    }
  }
  else
  {
    v34 = (void *)MEMORY[0x220735570]();
    v35 = a1[5];
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v37;
      v50 = 2112;
      *(_QWORD *)v51 = v3;
      *(_WORD *)&v51[8] = 2112;
      *(_QWORD *)&v51[10] = v15;
      _os_log_impl(&dword_219D45000, v36, OS_LOG_TYPE_ERROR, "%{public}@Error fetching faces to subsample for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v34);
  }

}

uint64_t __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke_113(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMIUpdatePersonsModelTask sourceUUID](self, "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMIUpdatePersonsModelTask isExternalLibrary](self, "isExternalLibrary");
  v6 = CFSTR("home");
  if (v5)
    v6 = CFSTR("external");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 344, 1);
}

- (HMIPersonManagerDataSource)dataSource
{
  return (HMIPersonManagerDataSource *)objc_getProperty(self, a2, 352, 1);
}

- (BOOL)isExternalLibrary
{
  return self->_externalLibrary;
}

- (BOOL)shouldRemoveExcessFaceCrops
{
  return self->_removeExcessFaceCrops;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end
