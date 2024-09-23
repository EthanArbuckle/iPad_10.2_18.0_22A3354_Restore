@implementation HMDCameraRecordingSessionNotificationTrigger

- (HMDCameraRecordingSessionNotificationTrigger)initWithCamera:(id)a3 workQueue:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCharacteristicsAvailabilityListener *v13;
  void *v14;
  HMDCharacteristicsAvailabilityListener *v15;
  void *v16;
  HMDCameraRecordingSessionNotificationTrigger *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v19[0] = *MEMORY[0x24BDD6C18];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = *MEMORY[0x24BDD5918];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "setWithObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v19[1] = *MEMORY[0x24BDD6BA0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BDD58F0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [HMDCharacteristicsAvailabilityListener alloc];
  objc_msgSend(v9, "hapAccessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDCharacteristicsAvailabilityListener initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:](v13, "initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:", v14, v8, v12);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDCameraRecordingSessionNotificationTrigger initWithCamera:workQueue:availabilityListener:notificationCenter:](self, "initWithCamera:workQueue:availabilityListener:notificationCenter:", v9, v8, v15, v16);

  return v17;
}

- (HMDCameraRecordingSessionNotificationTrigger)initWithCamera:(id)a3 workQueue:(id)a4 availabilityListener:(id)a5 notificationCenter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDCameraRecordingSessionNotificationTrigger *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *logIdentifier;
  uint64_t v19;
  NSSet *availableCharacteristics;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *clientIdentifier;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HMDCameraRecordingSessionNotificationTrigger;
  v14 = -[HMDCameraRecordingSessionNotificationTrigger init](&v27, sel_init);
  if (v14)
  {
    objc_msgSend(v10, "hapAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_cameraAccessory, v15);

    objc_storeStrong((id *)&v14->_workQueue, a4);
    objc_storeStrong((id *)&v14->_availabilityListener, a5);
    objc_storeStrong((id *)&v14->_notificationCenter, a6);
    objc_msgSend(v10, "logIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    logIdentifier = v14->_logIdentifier;
    v14->_logIdentifier = (NSString *)v17;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    availableCharacteristics = v14->_availableCharacteristics;
    v14->_availableCharacteristics = (NSSet *)v19;

    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.HMDCameraRecordingSessionNotificationTrigger.%@"), CFSTR("com.apple.HomeKitDaemon.Local"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v14->_clientIdentifier;
    v14->_clientIdentifier = (NSString *)v24;

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  HMDCameraRecordingSessionNotificationTrigger *v4;
  NSObject *v5;
  void *v6;
  NSString *clientIdentifier;
  id WeakRetained;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    clientIdentifier = v4->_clientIdentifier;
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = clientIdentifier;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating recording session notification trigger: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  WeakRetained = objc_loadWeakRetained((id *)&v4->_cameraAccessory);
  -[NSSet allObjects](v4->_availableCharacteristics, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "enableNotification:forCharacteristics:message:clientIdentifier:", 0, v9, 0, v4->_clientIdentifier);

  v10.receiver = v4;
  v10.super_class = (Class)HMDCameraRecordingSessionNotificationTrigger;
  -[HMDCameraRecordingSessionNotificationTrigger dealloc](&v10, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDCameraRecordingSessionNotificationTrigger workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSessionNotificationTrigger cameraAccessory](self, "cameraAccessory");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionNotificationTrigger notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleAccessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), v8);

  -[HMDCameraRecordingSessionNotificationTrigger notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleCharacteristicsValueUpdated_, CFSTR("HMDNotificationCharacteristicValueUpdated"), v8);

  -[HMDCameraRecordingSessionNotificationTrigger availabilityListener](self, "availabilityListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[HMDCameraRecordingSessionNotificationTrigger availabilityListener](self, "availabilityListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");

}

- (void)_handleObservedCharacteristicsValueUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  HMDCameraRecordingSessionNotificationTrigger *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMDCameraRecordingSessionNotificationTrigger *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  int v34;
  HMDCameraRecordingSessionNotificationTrigger *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDCameraRecordingSessionNotificationTrigger *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDCameraRecordingSessionNotificationTrigger *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  HMDCameraRecordingSessionNotificationTrigger *v61;
  NSObject *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  HMDCameraRecordingSessionNotificationTrigger *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id obj;
  id obja;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  id v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSessionNotificationTrigger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSessionNotificationTrigger delegate](self, "delegate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v64 = v4;
    if (objc_msgSend(v4, "count"))
    {
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      obj = v4;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      if (!v6)
        goto LABEL_31;
      v7 = v6;
      v8 = *(_QWORD *)v74;
      v66 = *MEMORY[0x24BDD5918];
      v65 = *MEMORY[0x24BDD58F0];
      v68 = *(_QWORD *)v74;
      while (1)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v74 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          -[HMDCameraRecordingSessionNotificationTrigger availabilityListener](self, "availabilityListener");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "availableCharacteristics");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v10);

          if (v13)
          {
            objc_msgSend(v10, "value");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v15 = v14;
            else
              v15 = 0;
            v16 = v15;

            if (v16)
            {
              objc_msgSend(v10, "type");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqualToString:", v66);

              if (v18)
              {
                v19 = objc_msgSend(v16, "BOOLValue");
                v20 = (void *)MEMORY[0x227676638]();
                v21 = self;
                HMFGetOSLogHandle();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  HMFBooleanToString();
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v83 = v23;
                  v84 = 2112;
                  v85 = v24;
                  _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Motion characteristic isActive changed to %@", buf, 0x16u);

                }
                v25 = 0;
LABEL_27:
                v8 = v68;

                objc_autoreleasePoolPop(v20);
                objc_msgSend(v70, "notificationTrigger:didObserveTriggerType:changeToActive:", self, v25, v19);
              }
              else
              {
                objc_msgSend(v10, "type");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "isEqualToString:", v65);

                v20 = (void *)MEMORY[0x227676638]();
                v35 = self;
                HMFGetOSLogHandle();
                v36 = objc_claimAutoreleasedReturnValue();
                v22 = v36;
                if (v34)
                {
                  v19 = 1;
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v83 = v37;
                    v25 = 1;
                    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Doorbell event detected", buf, 0xCu);

                    v19 = 1;
                  }
                  else
                  {
                    v25 = 1;
                  }
                  goto LABEL_27;
                }
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v83 = v38;
                  v84 = 2112;
                  v85 = v10;
                  _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unsupported characteristics type: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v20);
                v8 = v68;
              }
            }
            else
            {
              v26 = (void *)MEMORY[0x227676638]();
              v27 = self;
              HMFGetOSLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "value");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (objc_class *)objc_opt_class();
                NSStringFromClass(v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v83 = v29;
                v84 = 2112;
                v85 = v32;
                _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Expected a number for characteristic value, was %@", buf, 0x16u);

                v8 = v68;
              }

              objc_autoreleasePoolPop(v26);
            }

            continue;
          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        if (!v7)
        {
LABEL_31:

          goto LABEL_55;
        }
      }
    }
    v43 = (void *)MEMORY[0x227676638]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v46;
      _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@No changed characteristics provided, only evaluating motion detected for triggers", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    -[HMDCameraRecordingSessionNotificationTrigger availabilityListener](v44, "availabilityListener");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "availableCharacteristics");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v78;
      v52 = *MEMORY[0x24BDD5918];
      v67 = v44;
      v69 = v48;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v78 != v51)
            objc_enumerationMutation(v48);
          v54 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
          objc_msgSend(v54, "type");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "isEqualToString:", v52);

          if (v56)
          {
            v57 = v52;
            objc_msgSend(v54, "value");
            v58 = (id)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v59 = v58;
            else
              v59 = 0;
            v60 = v59;

            if (v60)
            {
              objc_msgSend(v70, "notificationTrigger:didObserveTriggerType:changeToActive:", v44, 0, objc_msgSend(v60, "BOOLValue"));
            }
            else
            {
              obja = (id)MEMORY[0x227676638]();
              v61 = v44;
              HMFGetOSLogHandle();
              v62 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v83 = v63;
                v84 = 2112;
                v85 = v54;
                v86 = 2112;
                v87 = v58;
                _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Unhandled characteristic: %@ value type: %@", buf, 0x20u);

                v44 = v67;
              }

              objc_autoreleasePoolPop(obja);
              v48 = v69;
            }

            v52 = v57;
          }
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
      }
      while (v50);
    }

LABEL_55:
    v4 = v64;
  }
  else
  {
    v39 = (void *)MEMORY[0x227676638]();
    v40 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v42;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@No delegate to notify", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v39);
  }

}

- (void)handleAccessoryConfigured:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingSessionNotificationTrigger workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__HMDCameraRecordingSessionNotificationTrigger_handleAccessoryConfigured___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleCharacteristicsValueUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDCameraRecordingSessionNotificationTrigger *v9;

  v4 = a3;
  -[HMDCameraRecordingSessionNotificationTrigger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__HMDCameraRecordingSessionNotificationTrigger_handleCharacteristicsValueUpdated___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCameraRecordingSessionNotificationTrigger *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraRecordingSessionNotificationTrigger workQueue](self, "workQueue");
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
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for characteristics: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCameraRecordingSessionNotificationTrigger setAvailableCharacteristics:](v10, "setAvailableCharacteristics:", v7);
  -[HMDCameraRecordingSessionNotificationTrigger cameraAccessory](v10, "cameraAccessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionNotificationTrigger availableCharacteristics](v10, "availableCharacteristics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionNotificationTrigger clientIdentifier](v10, "clientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enableNotification:forCharacteristics:message:clientIdentifier:", 1, v15, 0, v16);

  if (objc_msgSend(v13, "isReachable"))
    -[HMDCameraRecordingSessionNotificationTrigger _handleObservedCharacteristicsValueUpdate:](v10, "_handleObservedCharacteristicsValueUpdate:", MEMORY[0x24BDBD1A8]);

}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCameraRecordingSessionNotificationTriggerDelegate)delegate
{
  return (HMDCameraRecordingSessionNotificationTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHAPAccessory)cameraAccessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_cameraAccessory);
}

- (HMDCharacteristicsAvailabilityListener)availabilityListener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 40, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (NSSet)availableCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAvailableCharacteristics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_availableCharacteristics, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_availabilityListener, 0);
  objc_destroyWeak((id *)&self->_cameraAccessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

void __82__HMDCameraRecordingSessionNotificationTrigger_handleCharacteristicsValueUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v6 = v4;

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleObservedCharacteristicsValueUpdate:", v6);
    v5 = v6;
  }

}

uint64_t __74__HMDCameraRecordingSessionNotificationTrigger_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleObservedCharacteristicsValueUpdate:", MEMORY[0x24BDBD1A8]);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_224201 != -1)
    dispatch_once(&logCategory__hmf_once_t11_224201, &__block_literal_global_224202);
  return (id)logCategory__hmf_once_v12_224203;
}

void __59__HMDCameraRecordingSessionNotificationTrigger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12_224203;
  logCategory__hmf_once_v12_224203 = v0;

}

@end
