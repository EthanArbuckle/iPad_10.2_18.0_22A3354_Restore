@implementation HMDCameraClipUserNotificationCenter

- (HMDCameraClipUserNotificationCenter)initWithBulletinBoard:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDFileManager *v11;
  HMDCameraClipUserNotificationCenter *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HMDFileManager);
  v12 = -[HMDCameraClipUserNotificationCenter initWithBulletinBoard:workQueue:logIdentifier:fileManager:](self, "initWithBulletinBoard:workQueue:logIdentifier:fileManager:", v10, v9, v8, v11);

  return v12;
}

- (HMDCameraClipUserNotificationCenter)initWithBulletinBoard:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5 fileManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDCameraClipUserNotificationCenter *v15;
  HMDCameraClipUserNotificationCenter *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraClipUserNotificationCenter;
  v15 = -[HMDCameraClipUserNotificationCenter init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bulletinBoard, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_logIdentifier, a5);
    objc_storeStrong((id *)&v16->_fileManager, a6);
  }

  return v16;
}

- (id)bulletinForClipSignificantEvent:(id)a3 cameraProfile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraClipUserNotificationCenter *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCameraClipSignificantEventBulletin *v25;
  id v26;
  void *v27;
  HMDCameraClipSignificantEventBulletin *v28;
  void *v29;
  HMDCameraClipUserNotificationCenter *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDCameraClipUserNotificationCenter *v34;
  NSObject *v35;
  void *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "home");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v7, "recordingManagementService");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clipManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clipUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "significantEventsForClipWithUUID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v9;
      if (!objc_msgSend(v12, "count"))
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "clipUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v16;
          v46 = 2112;
          v47 = v17;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find any significant events for clip with UUID %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
        v18 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v18;
      }
      objc_msgSend(v12, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_225629);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDCameraClipUserNotificationCenter _firstAvailableHeroFrameURLForSignificantEvents:cameraProfile:](self, "_firstAvailableHeroFrameURLForSignificantEvents:cameraProfile:", v20, v7);
      v39 = v20;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uniqueIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dateOfOccurrence");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v23) = objc_msgSend(v12, "na_allObjectsPassTest:", &__block_literal_global_3_225630);
      v25 = [HMDCameraClipSignificantEventBulletin alloc];
      objc_msgSend(v6, "clipUUID");
      v26 = v6;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v38) = (_BYTE)v23;
      v9 = v42;
      v28 = -[HMDCameraClipSignificantEventBulletin initWithSignificantEvents:previewImageNotificationUUID:previewImageFilePathURL:dateOfOccurrence:camera:home:accessory:recordingService:clipUUID:shouldShowProvideFeedbackButton:](v25, "initWithSignificantEvents:previewImageNotificationUUID:previewImageFilePathURL:dateOfOccurrence:camera:home:accessory:recordingService:clipUUID:shouldShowProvideFeedbackButton:", v12, v22, v40, v24, v7, v43, v42, v41, v27, v38);

      v6 = v26;
    }
    else
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v36;
        v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Could not create a bulletin for clip significant event because the home is nil for accessory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      v28 = 0;
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v32;
      v46 = 2112;
      v47 = v7;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Could not create a bulletin for clip significant event because the accessory is nil for camera profile: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v28 = 0;
  }

  return v28;
}

- (void)postNotificationForBulletin:(id)a3 significantEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDCameraClipUserNotificationCenter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "previewImageFilePathURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCameraClipUserNotificationCenter _insertClipSignificantEventBulletin:](self, "_insertClipSignificantEventBulletin:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Fetching hero frame URL to post notification for significant event: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v6, "camera");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clipManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchHeroFrameURLForSignificantEventWithUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __84__HMDCameraClipUserNotificationCenter_postNotificationForBulletin_significantEvent___block_invoke;
    v18[3] = &unk_24E795D50;
    v18[4] = v10;
    v19 = v7;
    v20 = v6;
    v17 = (id)objc_msgSend(v16, "addCompletionBlock:", v18);

  }
}

- (void)removeEventNotificationForClipWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipUserNotificationCenter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraClipUserNotificationCenter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Removing bulletin for clip with UUID: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipUserNotificationCenter bulletinBoard](v7, "bulletinBoard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeBulletinWithRecordID:", v11);

}

- (void)removeEventNotificationsForCameraProfile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipUserNotificationCenter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraClipUserNotificationCenter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing camera clip bulletins for camera profile: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipUserNotificationCenter bulletinBoard](v7, "bulletinBoard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeCameraClipBulletinsForCameraProfile:", v4);

}

- (void)removeCachedHeroFrameImages
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDCameraClipUserNotificationCenter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraClipUserNotificationCenter fileManager](self, "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUserNotificationCenter fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heroFrameStoreDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v6, 0);

  -[HMDCameraClipUserNotificationCenter fileManager](self, "fileManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUserNotificationCenter fileManager](self, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "legacyHeroFrameStoreDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeItemAtURL:error:", v8, 0);

}

- (void)_insertClipSignificantEventBulletin:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipUserNotificationCenter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraClipUserNotificationCenter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "significantEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewImageFilePathURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Inserting bulletin with clip significant events: %@ hero frame URL: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipUserNotificationCenter bulletinBoard](v7, "bulletinBoard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertCameraClipSignificantEventBulletin:", v4);

}

- (id)_writeHeroFrameData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  HMDCameraClipUserNotificationCenter *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDCameraClipUserNotificationCenter *v24;
  NSObject *v25;
  void *v26;
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
  v4 = a3;
  -[HMDCameraClipUserNotificationCenter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraClipUserNotificationCenter fileManager](self, "fileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heroFrameStoreDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraClipUserNotificationCenter fileManager](self, "fileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v29);
  v10 = v29;

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("jpg"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUserNotificationCenter fileManager](self, "fileManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v10;
    v16 = objc_msgSend(v15, "writeData:toURL:options:error:", v4, v14, 0, &v28);
    v17 = v28;

    if ((v16 & 1) != 0)
    {
      v18 = v14;
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v26;
        v32 = 2112;
        v33 = v14;
        v34 = 2112;
        v35 = v17;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to write hero frame data to %@ error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
      v18 = 0;
    }

    v10 = v17;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v22;
      v32 = 2112;
      v33 = v7;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hero frame directory at URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = 0;
  }

  return v18;
}

- (id)_firstAvailableHeroFrameURLForSignificantEvents:(id)a3 cameraProfile:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
      objc_msgSend(v7, "clipManager", (_QWORD)v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "heroFrameURLForSignificantEventWithUUID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HMDCameraClipUserNotificationCenter fileManager](self, "fileManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "fileExistsAtURL:", v16);

        if ((v18 & 1) != 0)
          break;
      }

      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v16 = 0;
  }

  return v16;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCameraBulletinBoard)bulletinBoard
{
  return (HMDCameraBulletinBoard *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

void __84__HMDCameraClipUserNotificationCenter_postNotificationForBulletin_significantEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v10)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v20 = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v13 = "%{public}@Posting notification after fetching hero frame URL for significant event: %@";
    v14 = v9;
    v15 = 22;
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v11;
    v13 = "%{public}@Fetch did not result in a hero frame being downloaded";
    v14 = v9;
    v15 = 12;
  }
  _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v20, v15);

LABEL_7:
  objc_autoreleasePoolPop(v7);
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "camera");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bulletinForClipSignificantEvent:cameraProfile:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(*(id *)(a1 + 32), "_insertClipSignificantEventBulletin:", v19);

}

uint64_t __85__HMDCameraClipUserNotificationCenter_bulletinForClipSignificantEvent_cameraProfile___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canAskForUserFeedback");
}

uint64_t __85__HMDCameraClipUserNotificationCenter_bulletinForClipSignificantEvent_cameraProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_225638 != -1)
    dispatch_once(&logCategory__hmf_once_t11_225638, &__block_literal_global_9_225639);
  return (id)logCategory__hmf_once_v12_225640;
}

void __50__HMDCameraClipUserNotificationCenter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12_225640;
  logCategory__hmf_once_v12_225640 = v0;

}

@end
