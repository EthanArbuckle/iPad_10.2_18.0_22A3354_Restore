@implementation HMDPhotoLibraryPersonImporter

- (HMDPhotoLibraryPersonImporter)initWithUUID:(id)a3
{
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  HMDPhotoLibrary *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDPhotoLibraryPersonImporter *v12;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a3;
  v7 = dispatch_queue_create("com.apple.homed.photos.person.importer", v5);

  v8 = -[HMDPhotoLibrary initWithWorkQueue:]([HMDPhotoLibrary alloc], "initWithWorkQueue:", v7);
  +[HMDFMFHandler sharedHandler](HMDFMFHandler, "sharedHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCloudPhotosSettingObserver sharedInstance](HMDCloudPhotosSettingObserver, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDPhotoLibraryPersonImporter initWithUUID:fmfHandler:photoLibrary:workQueue:cloudPhotosSettingObserver:logEventSubmitter:](self, "initWithUUID:fmfHandler:photoLibrary:workQueue:cloudPhotosSettingObserver:logEventSubmitter:", v6, v9, v8, v7, v10, v11);

  return v12;
}

- (HMDPhotoLibraryPersonImporter)initWithUUID:(id)a3 fmfHandler:(id)a4 photoLibrary:(id)a5 workQueue:(id)a6 cloudPhotosSettingObserver:(id)a7 logEventSubmitter:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDPhotoLibraryPersonImporter *v18;
  HMDPhotoLibraryPersonImporter *v19;
  void *v20;
  id photoLibraryObserverFactory;
  id v23;
  id v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v15 = a3;
  v25 = a4;
  v16 = a5;
  v17 = a6;
  v24 = a7;
  v23 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HMDPhotoLibraryPersonImporter;
  v18 = -[HMDPhotoLibraryPersonImporter init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_UUID, a3);
    objc_storeStrong((id *)&v19->_workQueue, a6);
    objc_storeStrong((id *)&v19->_fmfHandler, a4);
    objc_storeStrong((id *)&v19->_photoLibrary, a5);
    objc_storeStrong((id *)&v19->_cloudPhotosSettingObserver, a7);
    objc_storeStrong((id *)&v19->_logEventSubmitter, a8);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __125__HMDPhotoLibraryPersonImporter_initWithUUID_fmfHandler_photoLibrary_workQueue_cloudPhotosSettingObserver_logEventSubmitter___block_invoke;
    aBlock[3] = &unk_24E7872F8;
    v27 = v15;
    v28 = v17;
    v29 = v16;
    v20 = _Block_copy(aBlock);
    photoLibraryObserverFactory = v19->_photoLibraryObserverFactory;
    v19->_photoLibraryObserverFactory = v20;

  }
  return v19;
}

- (void)_updatePersonsAndFaceCrops:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDPhotoLibraryPersonImporter *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  HMDPhotoLibraryPersonImporter *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPhotoLibraryPersonImporter dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createBatchChange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating persons and face crops from Photos using shouldUpdateAllFaceCrops: %@ batchChange: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDPhotoLibraryPersonImporter _updatePersonsUsingBatchChange:](v9, "_updatePersonsUsingBatchChange:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (v3)
        v15 = -[HMDPhotoLibraryPersonImporter _updateFaceCropsForAllPersonsUsingCurrentPersons:batchChange:](v9, "_updateFaceCropsForAllPersonsUsingCurrentPersons:batchChange:", v14, v7);
      else
        v15 = -[HMDPhotoLibraryPersonImporter _updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons:batchChange:](v9, "_updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons:batchChange:", v14, v7);
      v17 = (void *)MEMORY[0x227676638](v15);
      v18 = v9;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v20;
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Committing batch change: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v7, "commit");
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create batch data operation for person and face crop update", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (id)_updatePersonsUsingBatchChange:(id)a3
{
  NSObject *v4;
  void *v5;
  HMDPhotoLibraryPersonImporter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDPhotoLibraryPersonImporter *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  HMDPhotoLibraryPersonImporter *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDPhotoLibraryPersonImporter *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  HMDPhotoLibraryPerson *v50;
  void *v51;
  char v52;
  void *v53;
  HMDPhotoLibraryPersonImporter *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  void *v64;
  HMDPhotoLibraryPersonImporter *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id obj;
  void *obja;
  HMDPhotoLibraryPersonImporter *v80;
  id v81;
  __int128 v82;
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
  _QWORD v94[4];
  id v95;
  id v96;
  HMDPhotoLibraryPersonImporter *v97;
  id v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  void *v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v81 = a3;
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v103 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating persons from photos", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPhotoLibraryPersonImporter photoLibrary](v6, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchPersons");

  -[HMDPhotoLibraryPersonImporter photoLibrary](v6, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x227676638]();
  v13 = v6;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v103 = v16;
      v104 = 2112;
      v105 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Current Photo Library persons: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPhotoLibraryPersonImporter dataSource](v13, "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = MEMORY[0x24BDAC760];
    v94[1] = 3221225472;
    v94[2] = __64__HMDPhotoLibraryPersonImporter__updatePersonsUsingBatchChange___block_invoke;
    v94[3] = &unk_24E787320;
    v21 = v19;
    v95 = v21;
    v22 = v17;
    v96 = v22;
    v97 = v13;
    v72 = v18;
    v98 = v72;
    objc_msgSend(v20, "enumeratePersonsUsingBlock:", v94);

    v23 = (void *)MEMORY[0x227676638]();
    v24 = v13;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v103 = v26;
      v104 = 2112;
      v105 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Previous HomeKit persons: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    v80 = v24;
    -[HMDPhotoLibraryPersonImporter _submitLogEventsForUpdatedPersonsWithCurrentPersons:previousPersons:](v24, "_submitLogEventsForUpdatedPersonsWithCurrentPersons:previousPersons:", v11, v21);
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v11, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v74 = v11;
    obj = v11;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
    v75 = v22;
    v77 = v28;
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v91 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_msgSend(v33, "UUID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v21, "containsObject:", v33))
          {
            v36 = (void *)objc_msgSend(v35, "mutableCopy");
            objc_msgSend(v33, "UUID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setExternalPersonUUID:", v37);

            objc_msgSend(v28, "addObject:", v36);
            goto LABEL_22;
          }
          if (v35)
          {
            v36 = (void *)objc_msgSend(v35, "mutableCopy");
            objc_msgSend(v33, "updateHMPerson:", v36);
            v38 = (void *)MEMORY[0x227676638](objc_msgSend(v28, "addObject:", v36));
            v39 = v80;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v103 = v41;
              v104 = 2112;
              v105 = v36;
              v42 = v40;
              v43 = "%{public}@Updating person: %@";
LABEL_20:
              _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, v43, buf, 0x16u);

              v22 = v75;
            }
          }
          else
          {
            objc_msgSend(v33, "createHMPerson");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)MEMORY[0x227676638](objc_msgSend(v28, "addObject:", v36));
            v39 = v80;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v103 = v41;
              v104 = 2112;
              v105 = v36;
              v42 = v40;
              v43 = "%{public}@Adding person: %@";
              goto LABEL_20;
            }
          }

          objc_autoreleasePoolPop(v38);
          objc_msgSend(v81, "addOrUpdatePerson:", v36);
          v28 = v77;
LABEL_22:

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
      }
      while (v30);
    }
    v73 = v21;

    objc_msgSend(obj, "na_map:", &__block_literal_global_131377);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    objc_msgSend(v22, "allValues");
    obja = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
    v76 = v44;
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v87 != v47)
            objc_enumerationMutation(obja);
          v49 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          v50 = -[HMDPhotoLibraryPerson initWithHMPerson:]([HMDPhotoLibraryPerson alloc], "initWithHMPerson:", v49);
          -[HMDPhotoLibraryPerson UUID](v50, "UUID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v44, "containsObject:", v51);

          if ((v52 & 1) == 0)
          {
            v53 = (void *)MEMORY[0x227676638]();
            v54 = v80;
            HMFGetOSLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v103 = v56;
              v104 = 2112;
              v105 = v49;
              _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Removing person: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v53);
            objc_msgSend(v49, "UUID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "removePersonWithUUID:", v57);

            v44 = v76;
          }

        }
        v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
      }
      while (v46);
    }

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v58 = v72;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v83;
      do
      {
        for (k = 0; k != v60; ++k)
        {
          if (*(_QWORD *)v83 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
          v64 = (void *)MEMORY[0x227676638]();
          v65 = v80;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v103 = v67;
            v104 = 2112;
            v105 = v63;
            _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_INFO, "%{public}@Removing duplicate person: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v64);
          objc_msgSend(v63, "UUID");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "removePersonWithUUID:", v68);

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
      }
      while (v60);
    }

    v69 = (void *)objc_msgSend(v77, "copy");
    v11 = v74;
  }
  else
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v103 = v70;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Photo library query returned nil when querying current photo library persons, so aborting import process", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v69 = 0;
  }

  return v69;
}

- (void)_updateFaceCropsForAllPersonsUsingCurrentPersons:(id)a3 batchChange:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDPhotoLibraryPersonImporter *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating face crops for all photos persons", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDPhotoLibraryPersonImporter _updateFaceCropsForPersons:usingBatchChange:](v10, "_updateFaceCropsForPersons:usingBatchChange:", v6, v7);

}

- (void)_updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons:(id)a3 batchChange:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDPhotoLibraryPersonImporter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating face crops for persons with updated Photos face crops", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __117__HMDPhotoLibraryPersonImporter__updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons_batchChange___block_invoke;
  v14[3] = &unk_24E787388;
  v14[4] = v10;
  objc_msgSend(v6, "na_filter:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotoLibraryPersonImporter _updateFaceCropsForPersons:usingBatchChange:](v10, "_updateFaceCropsForPersons:usingBatchChange:", v13, v7);

}

- (void)_updateFaceCropsForPersons:(id)a3 usingBatchChange:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  HMDPhotoLibraryPersonImporter *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDPhotoLibraryPersonImporter *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29 = a4;
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v11;
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating face crops for persons: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      v27 = v13;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x227676638]();
        -[HMDPhotoLibraryPersonImporter photoLibrary](v9, "photoLibrary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "externalPersonUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fetchFaceCropDataByUUIDForPersonUUID:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v16, "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDPhotoLibraryPersonImporter _updateFaceCropsWithCurrentPhotoLibraryFaceCrops:forPersonWithUUID:usingBatchChange:](v9, "_updateFaceCropsWithCurrentPhotoLibraryFaceCrops:forPersonWithUUID:usingBatchChange:", v20, v21, v29);

        }
        else
        {
          v22 = v14;
          v23 = (void *)MEMORY[0x227676638]();
          v24 = v9;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v36 = v26;
            v37 = 2112;
            v38 = v16;
            _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Photo library query returned nil when querying face crops for person %@, so not modifying their face crops.", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v23);
          v14 = v22;
          v13 = v27;
        }

        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

}

- (void)_updateFaceCropsWithCurrentPhotoLibraryFaceCrops:(id)a3 forPersonWithUUID:(id)a4 usingBatchChange:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDPhotoLibraryPersonImporter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDPhotoLibraryPersonImporter *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
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
  HMDPhotoLibraryPersonImporter *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDPhotoLibraryPersonImporter *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  HMDPhotoLibraryPersonImporter *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v63 = a5;
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v62 = v8;
  v11 = (void *)MEMORY[0x227676638](-[HMDPhotoLibraryPersonImporter _submitLogEventForFaceCrops:](self, "_submitLogEventForFaceCrops:", v8));
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v76 = v14;
    v77 = 2112;
    v78 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating face crops for person with uuid: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDPhotoLibraryPersonImporter dataSource](v12, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "faceCropUUIDsForPersonWithUUID:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x227676638]();
  v18 = v12;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v62, "count");
    v22 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 138544130;
    v76 = v20;
    v77 = 2112;
    v78 = v9;
    v79 = 2048;
    v80 = v21;
    v81 = 2048;
    v82 = v22;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Person with uuid: %@ has %lu current photos face crops, and %lu previous face crops in homekit", buf, 0x2Au);

  }
  v64 = v9;

  objc_autoreleasePoolPop(v17);
  v23 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v62, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "na_setByRemovingObjectsFromSet:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v25;
  v58 = v16;
  objc_msgSend(v16, "na_setByRemovingObjectsFromSet:", v25);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v26;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v27)
  {
    v28 = v27;
    v60 = *(id *)v70;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(id *)v70 != v60)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        v31 = (void *)MEMORY[0x227676638]();
        -[HMDPhotoLibraryPersonImporter photoLibrary](v18, "photoLibrary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "faceCropFromFaceCropData:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v35 = objc_alloc(MEMORY[0x24BDD7850]);
          objc_msgSend(v34, "dataRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "faceBoundingBox");
          v38 = (void *)objc_msgSend(v35, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v30, v36, v37, v64);

          v39 = (void *)MEMORY[0x227676638](objc_msgSend(v38, "setSource:", 1));
          v40 = v18;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v76 = v42;
            v77 = 2112;
            v78 = v64;
            v79 = 2112;
            v80 = (uint64_t)v38;
            _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Adding new face crop for person with uuid %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v39);
          objc_msgSend(v63, "addOrUpdateFaceCrop:", v38);

        }
        else
        {
          v43 = (void *)MEMORY[0x227676638]();
          v44 = v18;
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v76 = v46;
            v77 = 2112;
            v78 = v30;
            v79 = 2112;
            v80 = (uint64_t)v64;
            _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Did not receive a valid face crop from HomeAI for photos face crop with uuid: %@ for person with uuid: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v43);
        }

        objc_autoreleasePoolPop(v31);
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v28);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v61 = v56;
  v47 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v66 != v49)
          objc_enumerationMutation(v61);
        v51 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        v52 = (void *)MEMORY[0x227676638]();
        v53 = v18;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v76 = v55;
          v77 = 2112;
          v78 = v64;
          v79 = 2112;
          v80 = (uint64_t)v51;
          _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@Removing old face crop for person with uuid %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v52);
        objc_msgSend(v63, "removeFaceCropWithUUID:", v51);
      }
      v48 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v48);
  }

}

- (void)_submitLogEventsForUpdatedPersonsWithCurrentPersons:(id)a3 previousPersons:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDPhotoLibraryImportingPersonsImportedLogEvent *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDPhotoLibraryImportingPhotoLibraryRenamedPersonsLogEvent *v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "na_map:", &__block_literal_global_86);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[HMDPhotoLibraryPersonImporter logEventSubmitter](self, "logEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDPhotoLibraryImportingPersonsImportedLogEvent initWithTotalNumberOfImportedPersons:numberOfNamedImportedPersons:]([HMDPhotoLibraryImportingPersonsImportedLogEvent alloc], "initWithTotalNumberOfImportedPersons:numberOfNamedImportedPersons:", objc_msgSend(v6, "count"), v10);
  objc_msgSend(v11, "submitLogEvent:", v12);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v19, "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v16);
  }

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __101__HMDPhotoLibraryPersonImporter__submitLogEventsForUpdatedPersonsWithCurrentPersons_previousPersons___block_invoke_2;
  v26[3] = &unk_24E7873F0;
  v27 = v13;
  v21 = v13;
  objc_msgSend(v6, "na_filter:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  -[HMDPhotoLibraryPersonImporter logEventSubmitter](self, "logEventSubmitter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HMDPhotoLibraryImportingPhotoLibraryRenamedPersonsLogEvent initWithNumberOfRenamedPersons:]([HMDPhotoLibraryImportingPhotoLibraryRenamedPersonsLogEvent alloc], "initWithNumberOfRenamedPersons:", v23);
  objc_msgSend(v24, "submitLogEvent:", v25);

}

- (void)_submitLogEventForFaceCrops:(id)a3
{
  id v4;
  NSObject *v5;
  HMDPhotoLibraryImportingFaceCropsImportedLogEvent *v6;
  void *v7;
  HMDPhotoLibraryImportingFaceCropsImportedLogEvent *v8;
  id v9;

  v4 = a3;
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPhotoLibraryPersonImporter logEventSubmitter](self, "logEventSubmitter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [HMDPhotoLibraryImportingFaceCropsImportedLogEvent alloc];
  objc_msgSend(v4, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDPhotoLibraryImportingFaceCropsImportedLogEvent initWithNumberOfImportedFaceCrops:](v6, "initWithNumberOfImportedFaceCrops:", objc_msgSend(v7, "count"));
  objc_msgSend(v9, "submitLogEvent:", v8);

}

- (void)_registerForNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotoLibraryPersonImporter cloudPhotosSettingObserver](self, "cloudPhotosSettingObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleCloudPhotosEnabledDidChangeNotification_, CFSTR("HMDCloudPhotoSettingChangedNotification"), v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDPhotoLibraryPersonImporter fmfHandler](self, "fmfHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleFMFDeviceChangedNotification_, CFSTR("HMDFMFStatusUpdateNotification"), v6);

}

- (void)_configure
{
  NSObject *v3;
  void *v4;
  HMDPhotoLibraryPersonImporter *v5;
  NSObject *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring photo library person importer", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDPhotoLibraryPersonImporter photoLibraryObserverFactory](v5, "photoLibraryObserverFactory");
  v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v8[2]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotoLibraryPersonImporter setPhotoLibraryObserver:](v5, "setPhotoLibraryObserver:", v9);

  -[HMDPhotoLibraryPersonImporter photoLibraryObserver](v5, "photoLibraryObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v5);

  -[HMDPhotoLibraryPersonImporter photoLibraryObserver](v5, "photoLibraryObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configure");

  -[HMDPhotoLibraryPersonImporter _updatePersonsAndFaceCrops:](v5, "_updatePersonsAndFaceCrops:", 1);
}

- (void)_unconfigure
{
  NSObject *v3;
  void *v4;
  HMDPhotoLibraryPersonImporter *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Unconfiguring photo library person importer", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDPhotoLibraryPersonImporter photoLibraryObserver](v5, "photoLibraryObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[HMDPhotoLibraryPersonImporter setPhotoLibraryObserver:](v5, "setPhotoLibraryObserver:", 0);
}

- (void)_handleUpdatedCloudPhotosSetting
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDPhotoLibraryPersonImporter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDPhotoLibraryPersonImporter cloudPhotosSettingObserver](self, "cloudPhotosSettingObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isCloudPhotosEnabled");

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Cloud photos enabled changed to %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPhotoLibraryPersonImporter _reconfigure](v6, "_reconfigure");
}

- (void)_handleFMFDeviceChanged
{
  NSObject *v3;
  void *v4;
  HMDPhotoLibraryPersonImporter *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPhotoLibraryPersonImporter isThisDesignatedFMFDevice](v5, "isThisDesignatedFMFDevice");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@FMF device changed, isThisDesignatedFMFDevice: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDPhotoLibraryPersonImporter _reconfigure](v5, "_reconfigure");
}

- (void)_reconfigure
{
  void *v3;
  int v4;

  -[HMDPhotoLibraryPersonImporter cloudPhotosSettingObserver](self, "cloudPhotosSettingObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCloudPhotosEnabled");

  if (v4 && -[HMDPhotoLibraryPersonImporter isThisDesignatedFMFDevice](self, "isThisDesignatedFMFDevice"))
    -[HMDPhotoLibraryPersonImporter _configure](self, "_configure");
  else
    -[HMDPhotoLibraryPersonImporter _unconfigure](self, "_unconfigure");
}

- (void)configureWithDataSource:(id)a3 home:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__HMDPhotoLibraryPersonImporter_configureWithDataSource_home___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (BOOL)isThisDesignatedFMFDevice
{
  void *v2;
  char v3;

  -[HMDPhotoLibraryPersonImporter fmfHandler](self, "fmfHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isThisDesignatedFMFDevice");

  return v3;
}

- (void)handleCloudPhotosEnabledDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMDPhotoLibraryPersonImporter_handleCloudPhotosEnabledDidChangeNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleFMFDeviceChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDPhotoLibraryPersonImporter_handleFMFDeviceChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)observerDidObserveMinorChange:(id)a3
{
  NSObject *v4;

  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDPhotoLibraryPersonImporter _updatePersonsAndFaceCrops:](self, "_updatePersonsAndFaceCrops:", 0);
}

- (void)observerDidObserveMajorChange:(id)a3
{
  NSObject *v4;

  -[HMDPhotoLibraryPersonImporter workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDPhotoLibraryPersonImporter _updatePersonsAndFaceCrops:](self, "_updatePersonsAndFaceCrops:", 1);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDPhotoLibraryPersonImporter UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDFMFHandlerProtocol)fmfHandler
{
  return (HMDFMFHandlerProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (HMDPhotoLibrary)photoLibrary
{
  return (HMDPhotoLibrary *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCloudPhotosSettingObserver)cloudPhotosSettingObserver
{
  return (HMDCloudPhotosSettingObserver *)objc_getProperty(self, a2, 40, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 48, 1);
}

- (HMDPersonDataSource)dataSource
{
  return (HMDPersonDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDPhotoLibraryObserver)photoLibraryObserver
{
  return (HMDPhotoLibraryObserver *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPhotoLibraryObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)photoLibraryObserverFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPhotoLibraryObserverFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_photoLibraryObserverFactory, 0);
  objc_storeStrong((id *)&self->_photoLibraryObserver, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_cloudPhotosSettingObserver, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_fmfHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

uint64_t __68__HMDPhotoLibraryPersonImporter_handleFMFDeviceChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFMFDeviceChanged");
}

uint64_t __79__HMDPhotoLibraryPersonImporter_handleCloudPhotosEnabledDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedCloudPhotosSetting");
}

void __62__HMDPhotoLibraryPersonImporter_configureWithDataSource_home___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setDataSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_registerForNotifications");
  objc_msgSend(*(id *)(a1 + 32), "cloudPhotosSettingObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudPhotosEnabled");

  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isThisDesignatedFMFDevice") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_configure");
      return;
    }
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      v8 = "%{public}@Not configuring photo library person importer because this device is not the designated FMF device";
      goto LABEL_8;
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      v8 = "%{public}@Not configuring photo library person importer because cloud photos is disabled";
LABEL_8:
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __101__HMDPhotoLibraryPersonImporter__submitLogEventsForUpdatedPersonsWithCurrentPersons_previousPersons___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12) ^ 1;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __101__HMDPhotoLibraryPersonImporter__submitLogEventsForUpdatedPersonsWithCurrentPersons_previousPersons___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

BOOL __117__HMDPhotoLibraryPersonImporter__updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons_batchChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _BOOL8 v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceCropUUIDsForPersonWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalPersonUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "numberOfFaceCropsForPersonWithUUID:", v9);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v14;
    v20 = 2112;
    v21 = v3;
    v22 = 2048;
    v23 = v7;
    v24 = 2048;
    v25 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Person: %@ has %lu face crops in homekit, and there are %lu face crops in photos", (uint8_t *)&v18, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  v16 = v7 < 0x14 && v7 != v10;

  return v16;
}

void __64__HMDPhotoLibraryPersonImporter__updatePersonsUsingBatchChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDPhotoLibraryPerson *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[HMDPhotoLibraryPerson initWithHMPerson:]([HMDPhotoLibraryPerson alloc], "initWithHMPerson:", v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  v5 = *(void **)(a1 + 40);
  -[HMDPhotoLibraryPerson UUID](v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v10 == 1)
    {
      if (v14)
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v15;
        v25 = 2112;
        v26 = v3;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Ignoring person with duplicate external person UUID: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v16 = *(void **)(a1 + 56);
      v17 = v3;
    }
    else
    {
      if (v14)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Ignoring person with duplicate external person UUID: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v21 = *(void **)(a1 + 40);
      -[HMDPhotoLibraryPerson UUID](v4, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v3, v22);

      v16 = *(void **)(a1 + 56);
      v17 = v7;
    }
    objc_msgSend(v16, "addObject:", v17);
  }
  else
  {
    v18 = *(void **)(a1 + 40);
    -[HMDPhotoLibraryPerson UUID](v4, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v3, v19);

  }
}

uint64_t __64__HMDPhotoLibraryPersonImporter__updatePersonsUsingBatchChange___block_invoke_79(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

HMDPhotoLibraryObserver *__125__HMDPhotoLibraryPersonImporter_initWithUUID_fmfHandler_photoLibrary_workQueue_cloudPhotosSettingObserver_logEventSubmitter___block_invoke(_QWORD *a1)
{
  return -[HMDPhotoLibraryObserver initWithUUID:workQueue:photoLibrary:]([HMDPhotoLibraryObserver alloc], "initWithUUID:workQueue:photoLibrary:", a1[4], a1[5], a1[6]);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29_131399 != -1)
    dispatch_once(&logCategory__hmf_once_t29_131399, &__block_literal_global_97_131400);
  return (id)logCategory__hmf_once_v30_131401;
}

void __44__HMDPhotoLibraryPersonImporter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v30_131401;
  logCategory__hmf_once_v30_131401 = v0;

}

@end
