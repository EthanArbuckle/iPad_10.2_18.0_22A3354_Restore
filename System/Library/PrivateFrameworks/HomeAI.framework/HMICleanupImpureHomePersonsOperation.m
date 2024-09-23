@implementation HMICleanupImpureHomePersonsOperation

- (HMICleanupImpureHomePersonsOperation)initWithHomeUUID:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  HMICleanupImpureHomePersonsOperation *v9;
  HMICleanupImpureHomePersonsOperation *v10;
  HMIGreedyClustering *v11;
  HMIGreedyClustering *clusterer;
  HMIFaceprinter *v13;
  HMIFaceprinter *faceprinter;
  id v15;
  uint64_t v16;
  NSDate *targetDate;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMICleanupImpureHomePersonsOperation;
  v9 = -[HMFOperation initWithTimeout:](&v19, sel_initWithTimeout_, 500.0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeUUID, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    v11 = -[HMIGreedyClustering initWithError:]([HMIGreedyClustering alloc], "initWithError:", 0);
    clusterer = v10->_clusterer;
    v10->_clusterer = v11;

    v13 = objc_alloc_init(HMIFaceprinter);
    faceprinter = v10->_faceprinter;
    v10->_faceprinter = v13;

    v10->_numFailures = 0;
    v15 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v15, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    objc_msgSend(v15, "dateFromString:", CFSTR("2021-05-15"));
    v16 = objc_claimAutoreleasedReturnValue();
    targetDate = v10->_targetDate;
    v10->_targetDate = (NSDate *)v16;

  }
  return v10;
}

- (id)fetchPersons
{
  void *v3;
  HMICleanupImpureHomePersonsOperation *v4;
  NSObject *v5;
  void *v6;
  HMIFetchPersonsOperation *v7;
  void *v8;
  HMIFetchPersonsOperation *v9;
  void *v10;
  void *v11;
  HMICleanupImpureHomePersonsOperation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMICleanupImpureHomePersonsOperation *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x220735570](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v6;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching persons for HMICleanupImpureHomePersonsOperation", (uint8_t *)&v24, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = [HMIFetchPersonsOperation alloc];
  -[HMICleanupImpureHomePersonsOperation dataSource](v4, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMIFetchPersonsOperation initWithDataSource:](v7, "initWithDataSource:", v8);

  -[HMFOperation start](v9, "start");
  -[HMIFetchPersonsOperation waitUntilFinished](v9, "waitUntilFinished");
  -[HMFOperation error](v9, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_5:
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
      v24 = 138543618;
      v25 = v14;
      v26 = 2112;
      v27 = (uint64_t)v15;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_ERROR, "%{public}@Error fetching persons, error:%@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMICleanupImpureHomePersonsOperation setNumFailures:](v12, "setNumFailures:", -[HMICleanupImpureHomePersonsOperation numFailures](v12, "numFailures") + 1);
    v16 = 0;
    goto LABEL_12;
  }
  -[HMIFetchPersonsOperation persons](v9, "persons");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_5;
  -[HMIFetchPersonsOperation persons](v9, "persons");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x220735570]();
  v19 = v4;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "count");
    v24 = 138543618;
    v25 = v21;
    v26 = 2048;
    v27 = v22;
    _os_log_impl(&dword_219D45000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu persons", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
LABEL_12:

  return v16;
}

- (id)fetchFaceCropsForPerson:(id)a3
{
  id v4;
  void *v5;
  HMICleanupImpureHomePersonsOperation *v6;
  NSObject *v7;
  void *v8;
  HMIFetchPersonFaceCropsOperation *v9;
  void *v10;
  HMIFetchPersonFaceCropsOperation *v11;
  void *v12;
  void *v13;
  HMICleanupImpureHomePersonsOperation *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMICleanupImpureHomePersonsOperation *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v8;
    v28 = 2112;
    v29 = (uint64_t)v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching face crops for person: %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = [HMIFetchPersonFaceCropsOperation alloc];
  -[HMICleanupImpureHomePersonsOperation dataSource](v6, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMIFetchPersonFaceCropsOperation initWithDataSource:person:](v9, "initWithDataSource:person:", v10, v4);

  -[HMFOperation start](v11, "start");
  -[HMIFetchPersonFaceCropsOperation waitUntilFinished](v11, "waitUntilFinished");
  -[HMFOperation error](v11, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

LABEL_5:
    v13 = (void *)MEMORY[0x220735570]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFOperation error](v11, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v16;
      v28 = 2112;
      v29 = (uint64_t)v4;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_ERROR, "%{public}@Error fetching facecrops for person:%@, error:%@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMICleanupImpureHomePersonsOperation setNumFailures:](v14, "setNumFailures:", -[HMICleanupImpureHomePersonsOperation numFailures](v14, "numFailures") + 1);
    v18 = 0;
    goto LABEL_12;
  }
  -[HMIFetchPersonFaceCropsOperation personFaceCrops](v11, "personFaceCrops");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_5;
  -[HMIFetchPersonFaceCropsOperation personFaceCrops](v11, "personFaceCrops");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x220735570]();
  v21 = v6;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v18, "count");
    v26 = 138543874;
    v27 = v23;
    v28 = 2048;
    v29 = v24;
    v30 = 2112;
    v31 = v4;
    _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu face crops for person: %@", (uint8_t *)&v26, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
LABEL_12:

  return v18;
}

- (id)fetchOrCreateFaceprintsForCrops:(id)a3 person:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIFetchFaceprintsForFaceCropsOperation *v9;
  void *v10;
  HMIFetchFaceprintsForFaceCropsOperation *v11;
  void *v12;
  void *v13;
  HMICleanupImpureHomePersonsOperation *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  HMICleanupImpureHomePersonsOperation *v25;
  NSObject *v26;
  void *v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "na_map:", &__block_literal_global_33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [HMIFetchFaceprintsForFaceCropsOperation alloc];
  -[HMICleanupImpureHomePersonsOperation dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMIFetchFaceprintsForFaceCropsOperation initWithDataSource:faceCropUUIDs:](v9, "initWithDataSource:faceCropUUIDs:", v10, v8);

  -[HMFOperation start](v11, "start");
  -[HMIFetchFaceprintsForFaceCropsOperation waitUntilFinished](v11, "waitUntilFinished");
  -[HMFOperation error](v11, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x220735570](-[HMICleanupImpureHomePersonsOperation setNumFailures:](self, "setNumFailures:", -[HMICleanupImpureHomePersonsOperation numFailures](self, "numFailures") + 1));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFOperation error](v11, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v16;
      v32 = 2112;
      v33 = v7;
      v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_ERROR, "%{public}@Ignoring error fetching faceprints for person:%@, error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }
  -[HMICleanupImpureHomePersonsOperation faceprinter](self, "faceprinter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIFetchFaceprintsForFaceCropsOperation faceprints](v11, "faceprints");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v18, "updatedFaceprintsForFaceCrops:withExistingFaceprints:error:", v6, v19, &v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v29;

  if (v20)
  {
    objc_msgSend(v20, "allAtCurrentVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = (void *)MEMORY[0x220735570]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v27;
      v32 = 2112;
      v33 = v7;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_219D45000, v26, OS_LOG_TYPE_ERROR, "%{public}@Error faceprinting face crops for person:%@, error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v24);
    -[HMICleanupImpureHomePersonsOperation setNumFailures:](v25, "setNumFailures:", -[HMICleanupImpureHomePersonsOperation numFailures](v25, "numFailures") + 1);
    v23 = 0;
  }

  return v23;
}

uint64_t __79__HMICleanupImpureHomePersonsOperation_fetchOrCreateFaceprintsForCrops_person___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (BOOL)isIdentityPureWithFaceprints:(id)a3 person:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMICleanupImpureHomePersonsOperation *v10;
  NSObject *v11;
  void *v12;
  HMIGreedyClustering *clusterer;
  void *v14;
  id v15;
  void *v16;
  HMICleanupImpureHomePersonsOperation *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  HMICleanupImpureHomePersonsOperation *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMICleanupImpureHomePersonsOperation *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  HMICleanupImpureHomePersonsOperation *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v56;
  HMICleanupImpureHomePersonsOperation *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  HMICleanupImpureHomePersonsOperation *v67;
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[5];
  id v72;
  void *v73;
  uint64_t v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[HMIFaceUtilities faceObservationsFromFaceprintsForClustering:](HMIFaceUtilities, "faceObservationsFromFaceprintsForClustering:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x220735570]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v76 = v12;
    v77 = 2048;
    v78 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_INFO, "%{public}@Number of faceprints to cluster: %lu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  clusterer = v10->_clusterer;
  v72 = 0;
  -[HMIGreedyClustering getClustersWithFaces:error:](clusterer, "getClustersWithFaces:error:", v8, &v72);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v72;
  if (!v14)
  {
    v22 = (void *)MEMORY[0x220735570](-[HMICleanupImpureHomePersonsOperation setNumFailures:](v10, "setNumFailures:", -[HMICleanupImpureHomePersonsOperation numFailures](v10, "numFailures") + 1));
    v23 = v10;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = v25;
      v77 = 2112;
      v78 = (uint64_t)v26;
      v79 = 2112;
      v80 = (uint64_t)v15;
      _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_ERROR, "%{public}@Clustering error:%@ treating identity: %@ as impure", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    goto LABEL_24;
  }
  if ((unint64_t)objc_msgSend(v14, "count") <= 1)
  {
    v16 = (void *)MEMORY[0x220735570]();
    v17 = v10;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v19;
      v77 = 2112;
      v78 = (uint64_t)v20;
      _os_log_impl(&dword_219D45000, v18, OS_LOG_TYPE_INFO, "%{public}@0 or 1 cluster exists, treating identity: %@ as pure", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);

    v21 = 1;
    goto LABEL_25;
  }
  objc_msgSend(v7, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    v32 = (void *)MEMORY[0x220735570]();
    v33 = v10;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 138543874;
      v76 = v35;
      v77 = 2112;
      v78 = (uint64_t)v7;
      v79 = 2048;
      v80 = v54;
      v37 = "%{public}@Unnamed person %@ has %lu clusters, treating as impure";
      goto LABEL_22;
    }
LABEL_23:

    objc_autoreleasePoolPop(v32);
LABEL_24:
    v21 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v7, "name");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    objc_msgSend(v7, "personLinks");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      v32 = (void *)MEMORY[0x220735570]();
      v33 = v10;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 138543874;
        v76 = v35;
        v77 = 2112;
        v78 = (uint64_t)v7;
        v79 = 2048;
        v80 = v36;
        v37 = "%{public}@Named person %@ with atleast 1 personLink has %lu clusters, treating as impure";
LABEL_22:
        _os_log_impl(&dword_219D45000, v34, OS_LOG_TYPE_INFO, v37, buf, 0x20u);

        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  v38 = (void *)MEMORY[0x220735570]();
  v39 = v10;
  HMFGetOSLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v14, "count");
    objc_msgSend(v7, "UUID");
    v62 = v38;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v76 = v41;
    v77 = 2048;
    v78 = v42;
    v79 = 2112;
    v80 = (uint64_t)v43;
    _os_log_impl(&dword_219D45000, v40, OS_LOG_TYPE_INFO, "%{public}@%lu clusters exists, for person %@ trying to club clusters using vip model", buf, 0x20u);

    v38 = v62;
  }

  objc_autoreleasePoolPop(v38);
  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_37);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = MEMORY[0x24BDAC760];
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_2;
  v71[3] = &unk_24DBED888;
  v71[4] = v39;
  objc_msgSend(v44, "na_each:", v71);
  objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objects");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v45;
  v69[1] = 3221225472;
  v69[2] = __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_39;
  v69[3] = &unk_24DBED8B0;
  v48 = v8;
  v70 = v48;
  objc_msgSend(v47, "na_map:", v69);
  v49 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v50;
  v61 = (void *)v49;
  v74 = v49;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  +[HMIPersonsModelManager personsModelWithFaceObservationsByID:error:](HMIPersonsModelManager, "personsModelWithFaceObservationsByID:error:", v51, &v68);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v68;

  if (v52)
  {
    objc_msgSend(v44, "subarrayWithRange:", 1, objc_msgSend(v44, "count") - 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_44;
    v64[3] = &unk_24DBED8D8;
    v65 = v48;
    v66 = v52;
    v67 = v39;
    v21 = objc_msgSend(v53, "na_all:", v64);

  }
  else
  {
    v56 = (void *)MEMORY[0x220735570]();
    v57 = v39;
    HMFGetOSLogHandle();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v60 = v56;
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v59;
      v77 = 2112;
      v78 = (uint64_t)v63;
      _os_log_impl(&dword_219D45000, v58, OS_LOG_TYPE_ERROR, "%{public}@Error while creating vnpersonsmodel: %@, treating identity as impure", buf, 0x16u);

      v56 = v60;
    }

    objc_autoreleasePoolPop(v56);
    v21 = 0;
  }

LABEL_25:
  return v21;
}

uint64_t __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v5, "objects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 <= v9)
  {
    objc_msgSend(v4, "objects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    objc_msgSend(v5, "objects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 < objc_msgSend(v13, "count");

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

void __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x220735570]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2048;
    v12 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_INFO, "%{public}@Cluster size: %lu", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_39(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", (int)objc_msgSend(a2, "intValue"));
}

BOOL __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  float v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[HMIGreedyClustering centermostFaceprintInCluster:faceObservations:](HMIGreedyClustering, "centermostFaceprintInCluster:faceObservations:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v16 = 0;
  objc_msgSend(v5, "predictPersonFromFaceObservation:limit:canceller:error:", v4, 1, 0, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "confidence");
    v10 = v9 > 0.6;

  }
  else
  {
    v11 = (void *)MEMORY[0x220735570]();
    v12 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to predict using VNPersonsModel, error: %@, treating identity as impure", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (void)removeFaceCropsWithUUIDs:(id)a3
{
  id v4;
  HMIRemoveFaceCropsOperation *v5;
  void *v6;
  HMIRemoveFaceCropsOperation *v7;
  void *v8;
  void *v9;
  HMICleanupImpureHomePersonsOperation *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [HMIRemoveFaceCropsOperation alloc];
  -[HMICleanupImpureHomePersonsOperation dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMIRemoveFaceCropsOperation initWithDataSource:faceCropUUIDs:](v5, "initWithDataSource:faceCropUUIDs:", v6, v4);

  -[HMFOperation start](v7, "start");
  -[HMIRemoveFaceCropsOperation waitUntilFinished](v7, "waitUntilFinished");
  -[HMFOperation error](v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x220735570](-[HMICleanupImpureHomePersonsOperation setNumFailures:](self, "setNumFailures:", -[HMICleanupImpureHomePersonsOperation numFailures](self, "numFailures") + 1));
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFOperation error](v7, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error while removing facecrops %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)reassociateFaceCropsWithUnknownSource:(id)a3 toPersonUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMICleanupImpureHomePersonsOperation *v10;
  NSObject *v11;
  void *v12;
  HMIAssociateFaceCropsOperation *v13;
  void *v14;
  HMIAssociateFaceCropsOperation *v15;
  void *v16;
  void *v17;
  HMICleanupImpureHomePersonsOperation *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "na_map:", &__block_literal_global_48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)MEMORY[0x220735570]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v12;
      v24 = 2048;
      v25 = objc_msgSend(v8, "count");
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_INFO, "%{public}@Reassociating %lu face crops to person UUID: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = [HMIAssociateFaceCropsOperation alloc];
    -[HMICleanupImpureHomePersonsOperation dataSource](v10, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMIAssociateFaceCropsOperation initWithDataSource:faceCropUUIDs:personUUID:source:](v13, "initWithDataSource:faceCropUUIDs:personUUID:source:", v14, v8, v7, 4);

    -[HMFOperation start](v15, "start");
    -[HMIAssociateFaceCropsOperation waitUntilFinished](v15, "waitUntilFinished");
    -[HMFOperation error](v15, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x220735570](-[HMICleanupImpureHomePersonsOperation setNumFailures:](v10, "setNumFailures:", -[HMICleanupImpureHomePersonsOperation numFailures](v10, "numFailures") + 1));
      v18 = v10;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFOperation error](v15, "error");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = (uint64_t)v21;
        _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error while reassociating facecrops %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
}

id __91__HMICleanupImpureHomePersonsOperation_reassociateFaceCropsWithUnknownSource_toPersonUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "source"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)ffArchiveRootURLWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  HMICleanupImpureHomePersonsOperation *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  HMIURLForCacheDirectory(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("FFArchive"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMICleanupImpureHomePersonsOperation homeUUID](self, "homeUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, a3);

    if ((v13 & 1) != 0)
    {
      v14 = v10;
    }
    else
    {
      v15 = (void *)MEMORY[0x220735570]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v18;
        v23 = 2112;
        v24 = v19;
        _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_ERROR, "%{public}@Error creating directory %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)purgeURLIfNeeded:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  HMICleanupImpureHomePersonsOperation *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  HMICleanupImpureHomePersonsOperation *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  HMICleanupImpureHomePersonsOperation *v42;
  id v43;
  uint64_t *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtPath:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v34 = *MEMORY[0x24BDD0C98];
  *(_QWORD *)&v6 = 138543874;
  v32 = v6;
  while (1)
  {
    objc_msgSend(v38, "nextObject", v32);
    v7 = objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v39, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v10, "attributesOfItemAtPath:error:", v9, &v48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v48;

    if (v11)
    {
      objc_msgSend(v37, "addObject:", v7);
      v13 = objc_msgSend(v11, "fileSize");
      v50[3] += v13;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "fileSize"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v14, v7);

      objc_msgSend(v11, "objectForKey:", v34);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v15, v7);
    }
    else
    {
      v16 = (void *)MEMORY[0x220735570]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v32;
        v54 = v19;
        v55 = 2112;
        v56 = v7;
        v57 = 2112;
        v58 = v20;
        _os_log_impl(&dword_219D45000, v18, OS_LOG_TYPE_ERROR, "%{public}@Error fetching attributes of the file: %@ at: %@. Attempting to delete it", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v12;
      objc_msgSend(v15, "removeItemAtPath:error:", v9, &v47);
      v21 = v47;

      v12 = v21;
    }

    v5 = (void *)v7;
  }
  v22 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __57__HMICleanupImpureHomePersonsOperation_purgeURLIfNeeded___block_invoke;
  v45[3] = &unk_24DBED920;
  v23 = v35;
  v46 = v23;
  objc_msgSend(v37, "sortUsingComparator:", v45);
  v40[0] = v22;
  v40[1] = 3221225472;
  v40[2] = __57__HMICleanupImpureHomePersonsOperation_purgeURLIfNeeded___block_invoke_2;
  v40[3] = &unk_24DBED948;
  v44 = &v49;
  v24 = v39;
  v41 = v24;
  v42 = self;
  v25 = v36;
  v43 = v25;
  v26 = (void *)MEMORY[0x220735570](objc_msgSend(v37, "enumerateObjectsUsingBlock:", v40));
  v27 = self;
  HMFGetOSLogHandle();
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)((unint64_t)v50[3] >> 10);
    *(_DWORD *)buf = v32;
    v54 = v29;
    v55 = 2112;
    v56 = (uint64_t)v30;
    v57 = 2048;
    v58 = v31;
    _os_log_impl(&dword_219D45000, v28, OS_LOG_TYPE_INFO, "%{public}@Disk buffer size of %@: %ld KB", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v26);

  _Block_object_dispose(&v49, 8);
}

uint64_t __57__HMICleanupImpureHomePersonsOperation_purgeURLIfNeeded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

void __57__HMICleanupImpureHomePersonsOperation_purgeURLIfNeeded___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >> 22 > 0x18uLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v10 = objc_msgSend(v9, "removeItemAtPath:error:", v8, &v19);
    v11 = v19;

    v12 = (void *)MEMORY[0x220735570]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v16;
        v22 = 2112;
        v23 = v8;
        v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_INFO, "%{public}@Deleted %@ to free up some space, error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) -= objc_msgSend(v17, "integerValue");

    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v18;
        v22 = 2112;
        v23 = v8;
        v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_ERROR, "%{public}@Error while deleting %@ to free up some space, error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
  else
  {
    *a4 = 1;
  }

}

- (void)dumpFFDataToCacheForPerson:(id)a3 personFaceCrops:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMICleanupImpureHomePersonsOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMICleanupImpureHomePersonsOperation *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMICleanupImpureHomePersonsOperation *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  HMICleanupImpureHomePersonsOperation *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  HMICleanupImpureHomePersonsOperation *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  HMICleanupImpureHomePersonsOperation *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  _QWORD v75[2];
  _QWORD v76[2];
  void *v77;
  _QWORD v78[2];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMICleanupImpureHomePersonsOperation homeUUID](v9, "homeUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v68 = v11;
    v69 = 2112;
    v70 = v12;
    v71 = 2112;
    v72 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Archive familiar face data for home: %@ person: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_58);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v78[0] = CFSTR("home");
  -[HMICleanupImpureHomePersonsOperation homeUUID](v9, "homeUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = CFSTR("homePersonsAndFaceCrops");
  v79[0] = v16;
  v75[0] = CFSTR("person");
  v75[1] = CFSTR("faceCrops");
  v76[0] = v6;
  v76[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v66);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v66;
  v22 = v21;
  if (v20)
  {
    v65 = v21;
    -[HMICleanupImpureHomePersonsOperation ffArchiveRootURLWithError:](v9, "ffArchiveRootURLWithError:", &v65);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v65;

    if (v23)
    {
      v61 = v14;
      v62 = v7;
      -[HMICleanupImpureHomePersonsOperation purgeURLIfNeeded:](v9, "purgeURLIfNeeded:", v23);
      v24 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v24, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH-mm-ss"));
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v24;
      objc_msgSend(v24, "stringFromDate:", v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)v26;
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@_%@.plist"), v29, v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathComponent:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)MEMORY[0x220735570]();
      v34 = v9;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMICleanupImpureHomePersonsOperation homeUUID](v34, "homeUUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v68 = v36;
        v69 = 2112;
        v70 = v37;
        v71 = 2112;
        v72 = v6;
        v73 = 2112;
        v74 = v32;
        _os_log_impl(&dword_219D45000, v35, OS_LOG_TYPE_INFO, "%{public}@Saving archived familiar face data for home: %@ person: %@ to: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v33);
      v14 = v61;
      if ((objc_msgSend(v20, "writeToFile:atomically:", v32, 1) & 1) == 0)
      {
        v38 = (void *)MEMORY[0x220735570]();
        v39 = v34;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v58 = v38;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v68 = v41;
          _os_log_impl(&dword_219D45000, v40, OS_LOG_TYPE_ERROR, "%{public}@Couldn't save FF archive", buf, 0xCu);

          v38 = v58;
        }

        objc_autoreleasePoolPop(v38);
      }
      v42 = (void *)MEMORY[0x220735570]();
      v43 = v34;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v45;
        _os_log_impl(&dword_219D45000, v44, OS_LOG_TYPE_INFO, "%{public}@Saved FF archive", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v42);

      v7 = v62;
    }
    else
    {
      v53 = (void *)MEMORY[0x220735570]();
      v54 = v9;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = v14;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v57;
        v69 = 2112;
        v70 = v63;
        _os_log_impl(&dword_219D45000, v55, OS_LOG_TYPE_ERROR, "%{public}@Couldn't get URL for home archives, error: %@", buf, 0x16u);

        v14 = v56;
      }

      objc_autoreleasePoolPop(v53);
    }

    v22 = v63;
  }
  else
  {
    v46 = (void *)MEMORY[0x220735570]();
    v47 = v9;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v64 = v19;
      v49 = v14;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v51 = v7;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v68 = v50;
      v69 = 2112;
      v70 = v52;
      v71 = 2112;
      v72 = v22;
      _os_log_impl(&dword_219D45000, v48, OS_LOG_TYPE_ERROR, "%{public}@Cannot archive familiar face data for person %@, error: %@", buf, 0x20u);

      v7 = v51;
      v14 = v49;
      v19 = v64;
    }

    objc_autoreleasePoolPop(v46);
  }

}

uint64_t __83__HMICleanupImpureHomePersonsOperation_dumpFFDataToCacheForPerson_personFaceCrops___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)main
{
  void *v3;

  v3 = (void *)MEMORY[0x220735570](self, a2);
  -[HMICleanupImpureHomePersonsOperation mainInsideAutoreleasePool](self, "mainInsideAutoreleasePool");
  objc_autoreleasePoolPop(v3);
}

- (void)handleCleanupForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HMICleanupImpureHomePersonsOperation *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  HMICleanupImpureHomePersonsOperation *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMICleanupImpureHomePersonsOperation *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  HMICleanupImpureHomePersonsOperation *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMICleanupImpureHomePersonsOperation *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMICleanupImpureHomePersonsOperation fetchFaceCropsForPerson:](self, "fetchFaceCropsForPerson:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v30 = (void *)MEMORY[0x220735570]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
LABEL_27:

      objc_autoreleasePoolPop(v30);
      goto LABEL_28;
    }
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v33;
    v60 = 2112;
    v61 = (uint64_t)v34;
    v35 = "%{public}@Skipping person %@ due to nil or 0 face crops";
LABEL_26:
    _os_log_impl(&dword_219D45000, v32, OS_LOG_TYPE_INFO, v35, buf, 0x16u);

    goto LABEL_27;
  }
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke;
  v57[3] = &unk_24DBEBD60;
  v57[4] = self;
  if ((objc_msgSend(v6, "na_any:", v57) & 1) == 0)
  {
    if (objc_msgSend(v6, "na_any:", &__block_literal_global_75))
    {
      v36 = (void *)MEMORY[0x220735570]();
      v37 = self;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v39;
        v60 = 2112;
        v61 = (uint64_t)v40;
        _os_log_impl(&dword_219D45000, v38, OS_LOG_TYPE_INFO, "%{public}@Person %@ has crops with unknown source, reassociating them", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      if (+[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall"))
        -[HMICleanupImpureHomePersonsOperation dumpFFDataToCacheForPerson:personFaceCrops:](v37, "dumpFFDataToCacheForPerson:personFaceCrops:", v4, v6);
      objc_msgSend(v4, "UUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMICleanupImpureHomePersonsOperation reassociateFaceCropsWithUnknownSource:toPersonUUID:](v37, "reassociateFaceCropsWithUnknownSource:toPersonUUID:", v6, v41);

    }
    v30 = (void *)MEMORY[0x220735570]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v33;
    v60 = 2112;
    v61 = (uint64_t)v34;
    v35 = "%{public}@Skipping person %@ as all crops are either old or have a non-unknown source";
    goto LABEL_26;
  }
  if (+[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall"))
    -[HMICleanupImpureHomePersonsOperation dumpFFDataToCacheForPerson:personFaceCrops:](self, "dumpFFDataToCacheForPerson:personFaceCrops:", v4, v6);
  -[HMICleanupImpureHomePersonsOperation fetchOrCreateFaceprintsForCrops:person:](self, "fetchOrCreateFaceprintsForCrops:person:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "na_map:", &__block_literal_global_78);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v7, "na_map:", &__block_literal_global_82);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v11;
    objc_msgSend(v8, "na_setByRemovingObjectsFromSet:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v51 = v8;
      v14 = (void *)MEMORY[0x220735570]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v49 = v14;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v13;
        v19 = objc_msgSend(v13, "count");
        objc_msgSend(v4, "UUID");
        v50 = v12;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v17;
        v60 = 2048;
        v61 = v19;
        v13 = v18;
        v62 = 2112;
        v63 = v20;
        _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing %lu sentinel facecrops for person %@", buf, 0x20u);

        v12 = v50;
        v14 = v49;
      }

      objc_autoreleasePoolPop(v14);
      -[HMICleanupImpureHomePersonsOperation removeFaceCropsWithUUIDs:](v15, "removeFaceCropsWithUUIDs:", v13);
      v8 = v51;
    }
    if (objc_msgSend(v7, "count"))
    {
      v21 = -[HMICleanupImpureHomePersonsOperation isIdentityPureWithFaceprints:person:](self, "isIdentityPureWithFaceprints:person:", v7, v4);
      v22 = (void *)MEMORY[0x220735570]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v21)
      {
        v52 = v13;
        if (v25)
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v26;
          v60 = 2112;
          v61 = (uint64_t)v27;
          _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_INFO, "%{public}@Found pure identity, skipping person %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_83;
        v55[3] = &unk_24DBEBD60;
        v56 = v12;
        objc_msgSend(v6, "na_filter:", v55);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMICleanupImpureHomePersonsOperation reassociateFaceCropsWithUnknownSource:toPersonUUID:](v23, "reassociateFaceCropsWithUnknownSource:toPersonUUID:", v28, v29);

        v13 = v52;
      }
      else
      {
        if (v25)
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v54 = v13;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v47;
          v60 = 2112;
          v61 = (uint64_t)v48;
          _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_INFO, "%{public}@Removing person %@ and associated crops", buf, 0x16u);

          v13 = v54;
        }

        objc_autoreleasePoolPop(v22);
        -[HMICleanupImpureHomePersonsOperation removeFaceCropsWithUUIDs:](v23, "removeFaceCropsWithUUIDs:", v12);
        -[HMICleanupImpureHomePersonsOperation removePerson:](v23, "removePerson:", v4);
      }
    }
    else
    {
      v42 = (void *)MEMORY[0x220735570]();
      v43 = self;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v53 = v13;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v45;
        v60 = 2112;
        v61 = (uint64_t)v46;
        _os_log_impl(&dword_219D45000, v44, OS_LOG_TYPE_INFO, "%{public}@0 faceprints for person: %@, skipping", buf, 0x16u);

        v13 = v53;
      }

      objc_autoreleasePoolPop(v42);
    }

  }
LABEL_28:

}

BOOL __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAffectedDate:", v5))
    v6 = objc_msgSend(v3, "source") == 0;
  else
    v6 = 0;

  return v6;
}

BOOL __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source") == 0;
}

uint64_t __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_77(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

uint64_t __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_2_80(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceCropUUID");
}

uint64_t __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_83(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  HMICleanupImpureHomePersonsOperation *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  void *v20;
  HMICleanupImpureHomePersonsOperation *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[HMICleanupImpureHomePersonsOperation fetchPersons](self, "fetchPersons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v11 = -[HMICleanupImpureHomePersonsOperation isCancelled](self, "isCancelled");
          v12 = (void *)MEMORY[0x220735570]();
          if (v11)
          {
            v21 = self;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v31 = v23;
              _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_INFO, "%{public}@HMICleanupImpureHomePersonsOperation exiting early because operation was canceled.", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v12);
            goto LABEL_18;
          }
          -[HMICleanupImpureHomePersonsOperation handleCleanupForPerson:](self, "handleCleanupForPerson:", v10);
          objc_autoreleasePoolPop(v12);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v7)
          continue;
        break;
      }
    }

    v13 = -[HMICleanupImpureHomePersonsOperation numFailures](self, "numFailures");
    v14 = (void *)MEMORY[0x220735570]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v17)
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[HMICleanupImpureHomePersonsOperation numFailures](v15, "numFailures");
        *(_DWORD *)buf = 138543618;
        v31 = v18;
        v32 = 1024;
        v33 = v19;
        _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_INFO, "%{public}@CleanImpureHomePersonsOperation encountered %d failures", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1040, CFSTR("CleanImpureHomePersonsOperation encountered failures"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFOperation cancelWithError:](v15, "cancelWithError:", v20);

    }
    else
    {
      if (v17)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v24;
        _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_INFO, "%{public}@Completed CleanImpureHomePersonsOperation", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      v25.receiver = v15;
      v25.super_class = (Class)HMICleanupImpureHomePersonsOperation;
      -[HMFOperation finish](&v25, sel_finish);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1040, CFSTR("Fetch persons failed"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](self, "cancelWithError:", v5);
LABEL_18:

  }
}

- (BOOL)isAffectedDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[HMICleanupImpureHomePersonsOperation targetDate](self, "targetDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  return v6 == 1;
}

- (void)removePerson:(id)a3
{
  id v4;
  HMIRemovePersonsOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMIRemovePersonsOperation *v10;
  void *v11;
  void *v12;
  HMICleanupImpureHomePersonsOperation *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [HMIRemovePersonsOperation alloc];
  -[HMICleanupImpureHomePersonsOperation dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMIRemovePersonsOperation initWithDataSource:personUUIDs:](v5, "initWithDataSource:personUUIDs:", v6, v9);

  -[HMFOperation start](v10, "start");
  -[HMIRemovePersonsOperation waitUntilFinished](v10, "waitUntilFinished");
  -[HMFOperation error](v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x220735570](-[HMICleanupImpureHomePersonsOperation setNumFailures:](self, "setNumFailures:", -[HMICleanupImpureHomePersonsOperation numFailures](self, "numFailures") + 1));
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFOperation error](v10, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_ERROR, "%{public}@Error while removing persons %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (HMIGreedyClustering)clusterer
{
  return (HMIGreedyClustering *)objc_getProperty(self, a2, 320, 1);
}

- (HMIFaceprinter)faceprinter
{
  return (HMIFaceprinter *)objc_getProperty(self, a2, 328, 1);
}

- (int)numFailures
{
  return self->_numFailures;
}

- (void)setNumFailures:(int)a3
{
  self->_numFailures = a3;
}

- (NSDate)targetDate
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 344, 1);
}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 352, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_targetDate, 0);
  objc_storeStrong((id *)&self->_faceprinter, 0);
  objc_storeStrong((id *)&self->_clusterer, 0);
}

@end
