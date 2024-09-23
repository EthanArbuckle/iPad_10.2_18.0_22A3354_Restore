@implementation HMDCameraProfile

- (NSString)urlString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDAccessoryProfile services](self, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDAccessoryProfile services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "instanceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifierWithSalts();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSDictionary)assistantObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  _QWORD v28[7];
  _QWORD v29[7];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "name"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7) && v4)
  {
    v8 = objc_alloc(MEMORY[0x24BDBCED8]);
    v29[0] = *MEMORY[0x24BE81F50];
    -[HMDCameraProfile urlString](self, "urlString", CFSTR("objectType"), CFSTR("objectIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE820C0];
    v29[1] = v9;
    v29[2] = v10;
    v28[2] = CFSTR("objectServiceType");
    v28[3] = CFSTR("objectHome");
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v11;
    v28[4] = CFSTR("objectHomeIdentifier");
    objc_msgSend(v6, "urlString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v12;
    v29[5] = self;
    v28[5] = CFSTR("objectReference");
    v28[6] = CFSTR("objectName");
    v29[6] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v8, "initWithDictionary:", v13);

    objc_msgSend(v3, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("objectAccessory"));

    objc_msgSend(v3, "urlString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("objectAccessoryIdentifier"));

    objc_msgSend(v3, "room");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v6, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("objectRoom"));
        objc_msgSend(v17, "urlString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v21, CFSTR("objectRoomIdentifier"));

      }
    }
    v22 = (void *)objc_msgSend(v14, "copy");

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v6, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      *(_DWORD *)buf = 138544130;
      v31 = v25;
      v32 = 2112;
      v33 = v6;
      v34 = 2112;
      v35 = v26;
      v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because one of the properties of service is nil: service.accessory.home %@  service.accessory.home.name %@  service.name %@", buf, 0x2Au);
      if (v6)

    }
    objc_autoreleasePoolPop(v23);
    v22 = 0;
  }

  return (NSDictionary *)v22;
}

- (HMDCameraProfile)initWithAccessory:(id)a3 services:(id)a4 msgDispatcher:(id)a5 workQueue:(id)a6 home:(id)a7 settingsManager:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HMDCameraClipUserNotificationCenter *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HMDCameraStreamSnapshotHandler *v66;
  id v67;
  void *v68;
  HMDCameraSignificantEventNotificationFilter *v69;
  void *v70;
  HMDCameraProfile *v71;
  HMDCameraRecordingReachabilityEventManager *v73;
  void *v74;
  HMDCameraStreamSnapshotHandler *v75;
  void *v76;
  id v78;
  id v79;
  HMDCameraStreamSnapshotHandler *v80;
  HMDCameraSnapshotManager *v81;
  void *v82;
  HMDCameraClipManager *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  id obj;
  _QWORD v93[4];
  id v94;
  HMDCameraStreamSnapshotHandler *v95;
  id v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v89 = a6;
  v16 = a7;
  v17 = a8;
  v85 = v13;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_43;
  }
  if (!v14)
  {
LABEL_43:
    _HMFPreconditionFailure();
    goto LABEL_44;
  }
  if (!v15)
  {
LABEL_44:
    _HMFPreconditionFailure();
    goto LABEL_45;
  }
  if (!v89)
  {
LABEL_45:
    _HMFPreconditionFailure();
LABEL_46:
    _HMFPreconditionFailure();
  }
  if (!v16)
    goto LABEL_46;
  v84 = v17;
  v87 = v16;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = v14;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
  v88 = v15;
  if (!v20)
  {
    v91 = 0;
    goto LABEL_21;
  }
  v21 = v20;
  v91 = 0;
  v22 = *(_QWORD *)v108;
  v23 = *MEMORY[0x24BDD6B68];
  v24 = *MEMORY[0x24BDD6B70];
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v108 != v22)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
      objc_msgSend(v26, "serviceType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", v23);

      if (v28)
      {
        v29 = v18;
      }
      else
      {
        objc_msgSend(v26, "serviceType");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", v24);

        if (v31)
        {
          v32 = v26;

          v91 = v32;
          continue;
        }
        v29 = v19;
      }
      objc_msgSend(v29, "addObject:", v26);
    }
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
  }
  while (v21);
LABEL_21:

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v34 = v18;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v104 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * j), "instanceID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("%@"), v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v41);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
    }
    while (v36);
  }

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v42 = v19;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v100;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v100 != v45)
          objc_enumerationMutation(v42);
        v47 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * k), "instanceID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithFormat:", CFSTR("%@"), v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v49);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
    }
    while (v44);
  }

  objc_msgSend(v33, "sortedArrayUsingSelector:", sel_compare_);
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v85, "uuid");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "hm_deriveUUIDFromBaseUUID:withSalts:", v52, v50);
  v53 = objc_claimAutoreleasedReturnValue();

  v74 = (void *)v53;
  v76 = (void *)v50;
  if (v91)
  {
    v54 = (void *)MEMORY[0x24BDD1880];
    objc_msgSend(v91, "uuid");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "hm_deriveUUIDFromBaseUUID:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = -[HMDCameraClipManager initWithHome:zoneUUID:messageDispatcher:workQueue:cameraProfileUUID:]([HMDCameraClipManager alloc], "initWithHome:zoneUUID:messageDispatcher:workQueue:cameraProfileUUID:", v87, v56, v88, v89, v53);
    +[HMDCameraProfile bulletinBoard](HMDCameraProfile, "bulletinBoard");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v58 = [HMDCameraClipUserNotificationCenter alloc];
      -[HMDAccessoryProfile logIdentifier](self, "logIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = -[HMDCameraClipUserNotificationCenter initWithBulletinBoard:workQueue:logIdentifier:](v58, "initWithBulletinBoard:workQueue:logIdentifier:", v57, v89, v59);

    }
    else
    {
      v60 = 0;
    }
    v82 = (void *)v60;
    v73 = -[HMDCameraRecordingReachabilityEventManager initWithHAPAccessory:workQueue:]([HMDCameraRecordingReachabilityEventManager alloc], "initWithHAPAccessory:workQueue:", v85, v89);

  }
  else
  {
    v73 = 0;
    v82 = 0;
    v83 = 0;
  }
  v78 = objc_alloc_init(MEMORY[0x24BE3F1F0]);
  v80 = [HMDCameraStreamSnapshotHandler alloc];
  objc_msgSend(v34, "allObjects");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v87, "name");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "name");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "stringWithFormat:", CFSTR("%@/%@/%@"), v63, v64, v74);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[HMDCameraStreamSnapshotHandler initWithWorkQueue:services:logID:](v80, "initWithWorkQueue:services:logID:", v89, v61, v65);

  v81 = -[HMDCameraSnapshotManager initWithAccessory:workQueue:streamSnapshotHandler:uniqueIdentifier:msgDispatcher:networkMonitor:]([HMDCameraSnapshotManager alloc], "initWithAccessory:workQueue:streamSnapshotHandler:uniqueIdentifier:msgDispatcher:networkMonitor:", v85, v89, v66, v74, v88, v78);
  v93[0] = MEMORY[0x24BDAC760];
  v93[1] = 3221225472;
  v93[2] = __92__HMDCameraProfile_initWithAccessory_services_msgDispatcher_workQueue_home_settingsManager___block_invoke;
  v93[3] = &unk_24E792428;
  v94 = v89;
  v95 = v66;
  v96 = v85;
  v97 = v74;
  v98 = v78;
  v79 = v78;
  v67 = v74;
  v86 = v85;
  v75 = v66;
  v90 = v89;
  objc_msgSend(v34, "na_map:", v93);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_alloc_init(HMDCameraSignificantEventNotificationFilter);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_retain(-[HMDCameraProfile initWithAccessory:services:recordingManagementService:msgDispatcher:workQueue:home:settingsManager:uniqueIdentifier:clipManager:clipUserNotificationCenter:reachabilityEventManager:networkMonitor:streamSnapshotHandler:snapshotManager:cameraStreamManagers:significantEventNotificationFilter:notificationCenter:](self, "initWithAccessory:services:recordingManagementService:msgDispatcher:workQueue:home:settingsManager:uniqueIdentifier:clipManager:clipUserNotificationCenter:reachabilityEventManager:networkMonitor:streamSnapshotHandler:snapshotManager:cameraStreamManagers:significantEventNotificationFilter:notificationCenter:", v86, v42, v91, v88, v90, v87, v84, v67, v83, v82, v73, v79, v75, v81,
            v68,
            v69,
            v70));

  return v71;
}

- (HMDCameraProfile)initWithAccessory:(id)a3 services:(id)a4 recordingManagementService:(id)a5 msgDispatcher:(id)a6 workQueue:(id)a7 home:(id)a8 settingsManager:(id)a9 uniqueIdentifier:(id)a10 clipManager:(id)a11 clipUserNotificationCenter:(id)a12 reachabilityEventManager:(id)a13 networkMonitor:(id)a14 streamSnapshotHandler:(id)a15 snapshotManager:(id)a16 cameraStreamManagers:(id)a17 significantEventNotificationFilter:(id)a18 notificationCenter:(id)a19
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraProfile *v34;
  HMDPredicateUtilities *v35;
  void *v36;
  uint64_t v37;
  HMDPredicateUtilities *predicateUtilities;
  uint64_t v39;
  NSMutableArray *settingProactiveReaders;
  id recordingEventsCleanupTimerFactory;
  id recordingManagerFactory;
  HMDCameraProfile *v44;
  SEL v45;
  id obj;
  id v47;
  void *v48;
  void *v49;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v59;
  id v60;
  id v62;
  objc_super v63;

  v56 = a3;
  v22 = a4;
  v47 = a5;
  v54 = a5;
  obj = a6;
  v60 = a6;
  v55 = a7;
  v62 = a8;
  v53 = a9;
  v23 = a10;
  v24 = a11;
  v52 = a12;
  v51 = a13;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v59 = a17;
  v57 = a18;
  v28 = a19;
  if (!v56)
  {
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v22)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v60)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v55)
  {
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  v49 = v24;
  v29 = v62;
  if (!v62)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!v23)
  {
LABEL_21:
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if (!v25)
  {
LABEL_22:
    _HMFPreconditionFailure();
    goto LABEL_23;
  }
  if (!v26)
  {
LABEL_23:
    _HMFPreconditionFailure();
    goto LABEL_24;
  }
  if (!v27)
  {
LABEL_24:
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  if (!v59)
  {
LABEL_25:
    _HMFPreconditionFailure();
    goto LABEL_26;
  }
  if (!v57)
  {
LABEL_26:
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  v30 = v28;
  if (!v28)
  {
LABEL_27:
    v44 = (HMDCameraProfile *)_HMFPreconditionFailure();
    return (HMDCameraProfile *)-[HMDCameraProfile isCameraRecordingFeatureSupported](v44, v45);
  }
  v31 = v23;
  v32 = v27;
  v48 = v22;
  objc_msgSend(v22, "allObjects");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v63.receiver = self;
  v63.super_class = (Class)HMDCameraProfile;
  v34 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:workQueue:](&v63, sel_initWithAccessory_uniqueIdentifier_services_workQueue_, v56, v31, v33, v55);

  if (v34)
  {
    objc_storeWeak((id *)&v34->_hapAccessory, v56);
    v35 = [HMDPredicateUtilities alloc];
    -[HMDAccessoryProfile logIdentifier](v34, "logIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[HMDPredicateUtilities initWithHome:logIdentifier:](v35, "initWithHome:logIdentifier:", v62, v36);
    predicateUtilities = v34->_predicateUtilities;
    v34->_predicateUtilities = (HMDPredicateUtilities *)v37;

    v29 = v62;
    objc_storeStrong((id *)&v34->super._msgDispatcher, obj);
    objc_storeStrong((id *)&v34->_recordingManagementService, v47);
    objc_storeStrong((id *)&v34->_networkMonitor, a14);
    objc_storeStrong((id *)&v34->_streamSnapshotHandler, a15);
    objc_storeStrong((id *)&v34->_snapshotManager, a16);
    objc_storeStrong((id *)&v34->_cameraStreamManagers, a17);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v39 = objc_claimAutoreleasedReturnValue();
    settingProactiveReaders = v34->_settingProactiveReaders;
    v34->_settingProactiveReaders = (NSMutableArray *)v39;

    objc_storeStrong((id *)&v34->_cameraSettingsManager, a9);
    objc_storeStrong((id *)&v34->_clipManager, a11);
    objc_storeStrong((id *)&v34->_clipUserNotificationCenter, a12);
    objc_storeStrong((id *)&v34->_reachabilityEventManager, a13);
    objc_storeStrong((id *)&v34->_notificationCenter, a19);
    objc_storeStrong((id *)&v34->_significantEventNotificationFilter, a18);
    -[HMDCameraProfile _setControlSupport](v34, "_setControlSupport");
    recordingEventsCleanupTimerFactory = v34->_recordingEventsCleanupTimerFactory;
    v34->_recordingEventsCleanupTimerFactory = &__block_literal_global_208904;

    recordingManagerFactory = v34->_recordingManagerFactory;
    v34->_recordingManagerFactory = &__block_literal_global_56_208905;

  }
  return v34;
}

- (BOOL)isCameraRecordingFeatureSupported
{
  void *v2;
  BOOL v3;

  -[HMDCameraProfile recordingManagementService](self, "recordingManagementService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setUp
{
  NSObject *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HMDCameraProfile *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDCameraProfile *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryProfile accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HMDCameraProfile networkMonitor](self, "networkMonitor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);

      -[HMDCameraProfile clipManager](self, "clipManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", self);

      -[HMDCameraProfile clipManager](self, "clipManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configure");

      -[HMDCameraProfile clipUserNotificationCenter](self, "clipUserNotificationCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeCachedHeroFrameImages");

      -[HMDCameraProfile cameraSettingsManager](self, "cameraSettingsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", self);

      -[HMDCameraProfile cameraSettingsManager](self, "cameraSettingsManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "msgDispatcher");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "administratorHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configureWithMessageDispatcher:adminMessageDispatcher:deviceIsResidentCapable:", v13, v14, objc_msgSend(v15, "isResidentCapable"));

      -[HMDCameraProfile reachabilityEventManager](self, "reachabilityEventManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryProfile msgDispatcher](self, "msgDispatcher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfile currentSettings](self, "currentSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v6, "isCurrentDeviceConfirmedPrimaryResident");
      -[HMDCameraProfile networkMonitor](self, "networkMonitor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configureWithMessageDispatcher:currentSettings:isCurrentDeviceConfirmedPrimaryResident:isCurrentDeviceConnectedToNetwork:", v17, v18, v19, objc_msgSend(v20, "isReachable"));

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
        v29 = 138543362;
        v30 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Skipping camera profile setup because home reference is nil", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Skipping camera profile setup because accessory reference is nil", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)tearDownWithReplacementCameraProfile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDCameraProfile isCameraRecordingFeatureSupported](self, "isCameraRecordingFeatureSupported")
    && (objc_msgSend(v4, "isCameraRecordingFeatureSupported") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfile recordingManagementService](v7, "recordingManagementService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing clip data because we have a recording management service %@ and we are transitioning to a replacement camera profile that does not", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCameraProfile clipManager](v7, "clipManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "remove");

  }
}

- (void)_createCameraRecordingManager
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  HMDCameraProfile *v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCameraProfile *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDCameraProfile *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraProfile recordingManagementService](self, "recordingManagementService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDAccessoryProfile accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isOwnerUser");

    -[HMDCameraProfile hapAccessory](self, "hapAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCurrentDeviceAvailableResident");

    -[HMDCameraProfile cameraRecordingManager](self, "cameraRecordingManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (v7 & 1) != 0)
    {
      if (!v11)
      {
        v12 = (void *)MEMORY[0x227676638]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543362;
          v30 = v15;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Creating camera recording manager", (uint8_t *)&v29, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        -[HMDCameraProfile recordingManagerFactory](v13, "recordingManagerFactory");
        v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[HMDCameraProfile recordingManagementService](v13, "recordingManagementService");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, HMDCameraProfile *, void *))v16)[2](v16, v13, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraProfile setCameraRecordingManager:](v13, "setCameraRecordingManager:", v18);

        -[HMDCameraProfile cameraRecordingManager](v13, "cameraRecordingManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "start");

      }
    }
    else if (v11)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Destroying camera recording manager", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      -[HMDCameraProfile cameraRecordingManager](v25, "cameraRecordingManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "shutDown");

      -[HMDCameraProfile setCameraRecordingManager:](v25, "setCameraRecordingManager:", 0);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Not configuring for recording because there is no recording service", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }
}

- (void)_setUpBulletinNotificationManagerObserver
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryProfile accessory](self, "accessory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraBulletinNotificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCameraSignificantEventNotificationObserver:cameraIdentifier:", self, v6);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAccessoryProfile accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Camera Profile %@, %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)removeCloudData
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDCameraProfile;
  -[HMDAccessoryProfile removeCloudData](&v5, sel_removeCloudData);
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDCameraProfile_removeCloudData__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)unconfigure
{
  void *v3;
  void *v4;
  id v5;

  -[HMDCameraProfile hapAccessory](self, "hapAccessory");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "isCurrentDeviceAvailableResident");
  -[HMDCameraProfile notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("HMDCameraProfileUnconfiguredNotification"), self);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDAccessoryProfile msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDCameraProfile;
  -[HMDCameraProfile dealloc](&v4, sel_dealloc);
}

- (id)dumpState
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDCameraProfile;
  -[HMDAccessoryProfile dumpState](&v5, sel_dumpState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (void)_setControlSupport
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  int *v12;
  void *v13;
  int v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDAccessoryProfile services](self, "services");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    v6 = *MEMORY[0x24BDD6C10];
    v7 = *MEMORY[0x24BDD6C48];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "serviceType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v6);

        v12 = &OBJC_IVAR___HMDCameraProfile__microphonePresent;
        if ((v11 & 1) == 0)
        {
          objc_msgSend(v9, "serviceType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v7);

          v12 = &OBJC_IVAR___HMDCameraProfile__speakerPresent;
          if (!v14)
            continue;
        }
        *((_BYTE *)&self->super.super.super.isa + *v12) = 1;
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

- (void)registerForMessages
{
  NSObject *v3;
  void *v4;
  HMDCameraProfile *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
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
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v63 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Registering for messages", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryProfile accessory](v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", v9, 0, 1, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v10;
  v61[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5630], v5, v13, sel__handleNegotiateStreamRequest_);

  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5648], v5, v13, sel__handleStreamControlRequest_);

  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5638], v5, v13, sel__handleStreamControlRequest_);

  v60[0] = v10;
  v60[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5640], v5, v17, sel__handleStreamControlRequest_);

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isResidentCapable") & 1) != 0)
  {

  }
  else
  {
    v20 = isiOSDevice();

    if (!v20)
      goto LABEL_7;
  }
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRoles:", objc_msgSend(v21, "roles") | 6);
  v22 = (void *)objc_msgSend(v21, "copy");
  v59[0] = v10;
  v59[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v24 = v12;
  v25 = v11;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "registerForMessage:receiver:policies:selector:", CFSTR("kNegotitateRemoteStreamRequestKey"), v5, v23, sel__handleNegotiateStreamRequest_);

  v11 = v25;
  v12 = v24;
  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "registerForMessage:receiver:policies:selector:", CFSTR("kStartRemoteStreamRequestKey"), v5, v23, sel__handleStreamControlRequest_);

  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerForMessage:receiver:policies:selector:", CFSTR("kStopRemoteStreamRequestKey"), v5, v23, sel__handleStreamControlRequest_);

  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerForMessage:receiver:policies:selector:", CFSTR("kReconfigureRemoteStreamRequestKey"), v5, v23, sel__handleStreamControlRequest_);

LABEL_7:
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v10;
  v58[1] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "registerForMessage:receiver:policies:selector:", CFSTR("kStreamRemoteConnectionSetupNotificationKey"), v5, v31, sel__handleStreamControlRequest_);

  -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "registerForMessage:receiver:policies:selector:", CFSTR("kStreamStoppedRemoteNotificationKey"), v5, v31, sel__handleStreamControlRequest_);

  -[HMDCameraProfile snapshotManager](v5, "snapshotManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "registerForMessages");

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[HMDCameraProfile cameraStreamManagers](v5, "cameraStreamManagers", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v54 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        -[HMDAccessoryProfile msgDispatcher](v5, "msgDispatcher");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "configureWithMessageDispatcher:", v41);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v37);
  }

  -[HMDCameraProfile hapAccessory](v5, "hapAccessory");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "home");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfile notificationCenter](v5, "notificationCenter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObserver:selector:name:object:", v5, sel_handleCameraProfileSettingsDidChangeNotification_, CFSTR("HMDCameraProfileSettingsDidChangeNotification"), v42);

  -[HMDCameraProfile notificationCenter](v5, "notificationCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "residentDeviceManager");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", v5, sel_handleResidentsChangedNotification_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), v46);

  -[HMDCameraProfile notificationCenter](v5, "notificationCenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "residentDeviceManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObserver:selector:name:object:", v5, sel_handleResidentsChangedNotification_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), v48);

  -[HMDCameraProfile notificationCenter](v5, "notificationCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "residentDeviceManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObserver:selector:name:object:", v5, sel_handleResidentsChangedNotification_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), v50);

  -[HMDCameraProfile cameraSettingsManager](v5, "cameraSettingsManager");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "start");

  -[HMDCameraProfile _createCameraRecordingManager](v5, "_createCameraRecordingManager");
  -[HMDCameraProfile _setUpBulletinNotificationManagerObserver](v5, "_setUpBulletinNotificationManagerObserver");
  -[HMDCameraProfile currentSettings](v5, "currentSettings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  __updateClipManagerWriteAccess(v5, v52);

}

- (BOOL)_areFaceClassificationsSuppressedForSignificantEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDCameraProfile *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "faceClassification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryProfile accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personSettingsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || !v10)
    goto LABEL_6;
  objc_msgSend(v6, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "areClassificationNotificationsEnabledForPersonUUID:", v11);

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Classification notifications enabled is %@ for person: %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  if (v12)
LABEL_6:
    LOBYTE(v12) = 1;

  return v12;
}

- (BOOL)_shouldNotifyForSignificantEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  HMDCameraProfile *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  HMDCameraProfile *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfile clipUserNotificationCenter](self, "clipUserNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_10:
    LOBYTE(v21) = 0;
    goto LABEL_15;
  }
  -[HMDCameraProfile currentSettings](self, "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSmartBulletinBoardNotificationEnabled");

  if ((v9 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Not notifying for significant event %@ because smart notification bulletin is disabled", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    goto LABEL_10;
  }
  -[HMDCameraProfile significantEventNotificationFilter](self, "significantEventNotificationFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "consumePrimaryResidentSignificantEventWithUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v12, "notificationReasons") & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v4, "dateOfOccurrence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[HMDCameraSignificantEventNotificationFilter isRelevantSignificantEventDate:](HMDCameraSignificantEventNotificationFilter, "isRelevantSignificantEventDate:", v13);

    if (v14)
    {
      -[HMDCameraProfile significantEventNotificationFilter](self, "significantEventNotificationFilter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addIncomingCloudSignificantEvent:", v4);

      v14 = 0;
    }
  }
  v21 = v14 & -[HMDCameraProfile _areFaceClassificationsSuppressedForSignificantEvent:](self, "_areFaceClassificationsSuppressedForSignificantEvent:", v4);
  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543874;
    v30 = v25;
    v31 = 2112;
    v32 = v26;
    v33 = 2112;
    v34 = v27;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Determined should add notification for significant event %@: %@", (uint8_t *)&v29, 0x20u);

  }
  objc_autoreleasePoolPop(v22);

LABEL_15:
  return v21;
}

- (void)_postNotificationForUpdatedSignificantEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(id *, char);
  void *v15;
  HMDCameraProfile *v16;
  id v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfile clipUserNotificationCenter](self, "clipUserNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bulletinForClipSignificantEvent:cameraProfile:", v4, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "bulletinBoard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __64__HMDCameraProfile__postNotificationForUpdatedSignificantEvent___block_invoke;
    v15 = &unk_24E7964E0;
    v16 = self;
    v17 = v7;
    v9 = v4;
    v18 = v9;
    objc_msgSend(v8, "updateDoorbellPressNotificationsWithSignificantEventBulletin:completion:", v17, &v12);

    -[HMDCameraProfile notificationCenter](self, "notificationCenter", v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("HMDCameraProfileSignificantEventKey");
    v20[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("HMDCameraProfileDidUpdateSignificantEvent"), self, v11);

  }
}

- (void)_handleNegotiateStreamRequest:(id)a3
{
  id v4;
  NSObject *v5;
  HMDCameraMetricsMilestone *v6;
  void *v7;
  HMDCameraProfile *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDCameraProfile *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  HMDCameraSettingProactiveReader *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDCameraSettingProactiveReader *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  HMDCameraProfile *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  HMDCameraProfile *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[HMDCameraMetricsMilestone initWithKey:timestamp:]([HMDCameraMetricsMilestone alloc], "initWithKey:timestamp:", CFSTR("ReceivedNegotiationRequest"), +[HMDCameraSessionID uptimeInMilliseconds](HMDCameraStreamSessionID, "uptimeInMilliseconds"));
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v70 = v10;
    v71 = 2114;
    v72 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling negotiate stream request message payload: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "stringForKey:", CFSTR("kCameraSessionID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v68 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("kCameraSessionPreference"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = objc_alloc_init(MEMORY[0x24BDD75A0]);
    v21 = v16;

    if (objc_msgSend(v4, "isEntitledForSPIAccess")
      && objc_msgSend(v21, "shouldTakeOwnershipOfExistingStream"))
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      -[HMDCameraProfile cameraStreamManagers](v8, "cameraStreamManagers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v62;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v62 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            if (objc_msgSend(v27, "isStreamingSessionInProgress"))
            {
              objc_msgSend(v27, "updateStreamClientUsingMessage:", v4);
              goto LABEL_45;
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
          if (v24)
            continue;
          break;
        }
      }

    }
    v52 = v12;
    -[HMDAccessoryProfile accessory](v8, "accessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isReachable") & 1) != 0)
    {
      v55 = 0uLL;
      v56 = 0uLL;
      v53 = 0uLL;
      v54 = 0uLL;
      -[HMDCameraProfile cameraStreamManagers](v8, "cameraStreamManagers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v54 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "setNegotiationMilestone:", v6);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
        }
        while (v30);
      }

      v33 = [HMDCameraSettingProactiveReader alloc];
      -[HMDAccessoryProfile workQueue](v8, "workQueue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfile cameraStreamManagers](v8, "cameraStreamManagers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryProfile logIdentifier](v8, "logIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v52;
      v37 = -[HMDCameraSettingProactiveReader initWithWorkQueue:sessionID:accessory:message:streamControlMessageHandlers:streamPreferences:logIdentifier:](v33, "initWithWorkQueue:sessionID:accessory:message:streamControlMessageHandlers:streamPreferences:logIdentifier:", v34, v52, v22, v4, v35, v21, v36);

      -[HMDCameraProfile settingProactiveReaders](v8, "settingProactiveReaders");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v37);

      -[HMDCameraSettingProactiveReader setDelegate:](v37, "setDelegate:", v8);
      -[HMDCameraSettingProactiveReader readSetting](v37, "readSetting");
    }
    else
    {
      v59 = 0uLL;
      v60 = 0uLL;
      v57 = 0uLL;
      v58 = 0uLL;
      -[HMDCameraProfile cameraStreamManagers](v8, "cameraStreamManagers");
      v37 = (HMDCameraSettingProactiveReader *)objc_claimAutoreleasedReturnValue();
      v39 = -[HMDCameraSettingProactiveReader countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v58;
        while (2)
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v58 != v41)
              objc_enumerationMutation(v37);
            v43 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
            if ((objc_msgSend(v43, "isStreamingSessionInProgress") & 1) == 0)
            {
              v48 = (void *)MEMORY[0x227676638]();
              v49 = v8;
              HMFGetOSLogHandle();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v70 = v51;
                v71 = 2112;
                v72 = v43;
                _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@Accessory is not reachable, routing request to camera streaming service: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v48);
              objc_msgSend(v43, "setNegotiationMilestone:", v6);
              objc_msgSend(v43, "handleMessage:", v4);
              v12 = v52;
              goto LABEL_44;
            }
          }
          v40 = -[HMDCameraSettingProactiveReader countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          if (v40)
            continue;
          break;
        }
      }

      v44 = (void *)MEMORY[0x227676638]();
      v45 = v8;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      v12 = v52;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v70 = v47;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not reachable and cannot route request to a camera streaming service", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v44);
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1019);
      v37 = (HMDCameraSettingProactiveReader *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v37);
    }
LABEL_44:

LABEL_45:
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Stream session ID is not present in negotiate request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v21);
  }

}

- (void)_handleStreamControlRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  HMDCameraProfile *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  HMDCameraProfile *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDCameraProfile *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  id obj;
  HMDCameraProfile *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
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
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v9;
    v58 = 2112;
    v59 = v10;
    v60 = 2112;
    v61 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling %@ message with payload: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "stringForKey:", CFSTR("kCameraSessionID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMDCameraProfile settingProactiveReaders](v7, "settingProactiveReaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if (objc_msgSend(v20, "hasPendingNegotiateMessageForSessionWithIdentifier:", v12))
          {
            objc_msgSend(v20, "handleMessage:", v4);
            v37 = v15;
            goto LABEL_30;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v17)
          continue;
        break;
      }
    }
    v42 = v15;
    v43 = v4;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v45 = v7;
    -[HMDCameraProfile cameraStreamManagers](v7, "cameraStreamManagers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          v26 = (void *)MEMORY[0x227676638]();
          v27 = v45;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "streamSessionID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v57 = v29;
            v58 = 2112;
            v59 = v30;
            v60 = 2112;
            v61 = v12;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Checking if stream message handler's session ID %@ matches with given %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v26);
          objc_msgSend(v25, "streamSessionID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqual:", v12);

          if (v32)
          {
            v4 = v43;
            objc_msgSend(v25, "handleMessage:", v43);
            v15 = v42;
            v37 = obj;
            goto LABEL_30;
          }
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v22)
          continue;
        break;
      }
    }

    v33 = (void *)MEMORY[0x227676638]();
    v34 = v45;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v36;
      v58 = 2112;
      v59 = v12;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Did not find the stream with Session ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v43;
    objc_msgSend(v43, "respondWithError:", v37);
    v15 = v42;
LABEL_30:

  }
  else
  {
    v38 = (void *)MEMORY[0x227676638]();
    v39 = v7;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v41;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Stream session ID is not present in start request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v38);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)cameraSettingProactiveReaderDidCompleteRead:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfile settingProactiveReaders](self, "settingProactiveReaders");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDCameraProfile cameraStreamManagers](self, "cameraStreamManagers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cameraStreamManagers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToSet:", v10))
      {
        -[HMDCameraProfile recordingManagementService](self, "recordingManagementService");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recordingManagementService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = HMFEqualObjects();

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

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (_HMCameraUserSettings)currentSettings
{
  void *v2;
  void *v3;

  -[HMDCameraProfile cameraSettingsManager](self, "cameraSettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_HMCameraUserSettings *)v3;
}

- (void)handleCameraProfileSettingsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HMDCameraProfileSettingsNotificationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v10 = v8;

  v9 = v10;
  if (v10)
  {
    __updateClipManagerWriteAccess(self, v10);
    v9 = v10;
  }

}

- (void)handleResidentsChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__HMDCameraProfile_handleResidentsChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)-[HMDCameraProfile superclass](self, "superclass"), "instancesRespondToSelector:", sel_messageReceiverChildren))
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDCameraProfile;
    -[HMDCameraProfile messageReceiverChildren](&v10, sel_messageReceiverChildren);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  -[HMDCameraProfile snapshotManager](self, "snapshotManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCameraProfile snapshotManager](self, "snapshotManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraProfile;
  -[HMDAccessoryProfile encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[HMDCameraProfile snapshotManager](self, "snapshotManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodedMostRecentSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x24BDD5540]);
  -[HMDCameraProfile cameraSettingsManager](self, "cameraSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, *MEMORY[0x24BDD5548]);

}

- (void)clipManager:(id)a3 didUpdateSignificantEvent:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfile hapAccessory](self, "hapAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doorbellChimeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleUpdatedPersonIdentificationInformation");

  -[HMDCameraProfile _postNotificationForUpdatedSignificantEvent:](self, "_postNotificationForUpdatedSignificantEvent:", v8);
}

- (void)clipManager:(id)a3 didDeleteClipWithUUID:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;

  v5 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDCameraProfile clipUserNotificationCenter](self, "clipUserNotificationCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeEventNotificationForClipWithUUID:", v5);

}

- (void)clipManagerDidStart:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, double);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfile reachabilityEventManager](self, "reachabilityEventManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clipManagerDidStart:", v4);

  -[HMDCameraProfile recordingEventsCleanupTimerFactory](self, "recordingEventsCleanupTimerFactory");
  v7 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v7[2](v7, 4, 86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfile setRecordingEventsCleanupTimer:](self, "setRecordingEventsCleanupTimer:", v8);

  -[HMDCameraProfile recordingEventsCleanupTimer](self, "recordingEventsCleanupTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfile recordingEventsCleanupTimer](self, "recordingEventsCleanupTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegateQueue:", v10);

  -[HMDCameraProfile recordingEventsCleanupTimer](self, "recordingEventsCleanupTimer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

}

- (void)clipManagerDidStartUpCloudZone:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfile cameraRecordingManager](self, "cameraRecordingManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clipManagerDidStartUpCloudZone:", v4);

}

- (void)clipManagerDidStop:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfile cameraRecordingManager](self, "cameraRecordingManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clipManagerDidStop:", v4);

  -[HMDCameraProfile reachabilityEventManager](self, "reachabilityEventManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clipManagerDidStop:", v4);

  -[HMDCameraProfile setRecordingEventsCleanupTimer:](self, "setRecordingEventsCleanupTimer:", 0);
  -[HMDCameraProfile clipUserNotificationCenter](self, "clipUserNotificationCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeEventNotificationsForCameraProfile:", self);

}

- (void)clipManagerDidDisableCloudStorage:(id)a3
{
  NSObject *v4;
  id v5;

  -[HMDAccessoryProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDCameraProfile cameraSettingsManager](self, "cameraSettingsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disableRecordingAccessModes");

}

- (void)clipManagerDidEncounterDisabledCloudStorage:(id)a3
{
  NSObject *v4;
  id v5;

  -[HMDAccessoryProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDCameraProfile cameraSettingsManager](self, "cameraSettingsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronizeCloudStorageWithRecordingAccessModes");

}

- (void)cameraProfileSettingsManager:(id)a3 canEnableRecordingWithCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  -[HMDCameraProfile clipManager](self, "clipManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCameraProfile clipManager](self, "clipManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enableCloudStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __82__HMDCameraProfile_cameraProfileSettingsManager_canEnableRecordingWithCompletion___block_invoke;
    v11[3] = &unk_24E792510;
    v12 = v5;
    v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v10);

  }
}

- (void)cameraProfileSettingsManager:(id)a3 canDisableRecordingWithCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  -[HMDCameraProfile clipManager](self, "clipManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCameraProfile clipManager](self, "clipManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableCloudStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __83__HMDCameraProfile_cameraProfileSettingsManager_canDisableRecordingWithCompletion___block_invoke;
    v11[3] = &unk_24E792510;
    v12 = v5;
    v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v10);

  }
}

- (void)notificationManager:(id)a3 didReceiveNotificationForCameraSignificantEventIdentifier:(id)a4 notificationReasons:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v7 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __118__HMDCameraProfile_notificationManager_didReceiveNotificationForCameraSignificantEventIdentifier_notificationReasons___block_invoke;
  block[3] = &unk_24E796490;
  block[4] = self;
  v11 = v7;
  v12 = a5;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)networkMonitorIsReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDCameraProfile_networkMonitorIsReachable___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)networkMonitorIsUnreachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDCameraProfile_networkMonitorIsUnreachable___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDCameraProfile *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfile recordingEventsCleanupTimer](self, "recordingEventsCleanupTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Performing recording events cleanup due to timer firing", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDCameraProfile clipManager](v8, "clipManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cleanUpClips");

    -[HMDCameraProfile reachabilityEventManager](v8, "reachabilityEventManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cleanUpEvents");

  }
}

- (BOOL)isMicrophonePresent
{
  return self->_microphonePresent;
}

- (BOOL)isSpeakerPresent
{
  return self->_speakerPresent;
}

- (HMDCameraClipManager)clipManager
{
  return (HMDCameraClipManager *)objc_getProperty(self, a2, 64, 1);
}

- (HMDService)recordingManagementService
{
  return (HMDService *)objc_getProperty(self, a2, 72, 1);
}

- (HMDHAPAccessory)hapAccessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_hapAccessory);
}

- (NSSet)cameraStreamManagers
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraSnapshotManager)snapshotManager
{
  return (HMDCameraSnapshotManager *)objc_getProperty(self, a2, 96, 1);
}

- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler
{
  return (HMDCameraStreamSnapshotHandler *)objc_getProperty(self, a2, 104, 1);
}

- (NSMutableArray)settingProactiveReaders
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (HMFNetMonitor)networkMonitor
{
  return (HMFNetMonitor *)objc_getProperty(self, a2, 120, 1);
}

- (HMDCameraProfileSettingsManager)cameraSettingsManager
{
  return (HMDCameraProfileSettingsManager *)objc_getProperty(self, a2, 128, 1);
}

- (HMDCameraRecordingReachabilityEventManager)reachabilityEventManager
{
  return (HMDCameraRecordingReachabilityEventManager *)objc_getProperty(self, a2, 136, 1);
}

- (HMDCameraClipUserNotificationCenter)clipUserNotificationCenter
{
  return (HMDCameraClipUserNotificationCenter *)objc_getProperty(self, a2, 144, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 152, 1);
}

- (HMFTimer)recordingEventsCleanupTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRecordingEventsCleanupTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (HMDCameraSignificantEventNotificationFilter)significantEventNotificationFilter
{
  return self->_significantEventNotificationFilter;
}

- (HMDPredicateUtilities)predicateUtilities
{
  return (HMDPredicateUtilities *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPredicateUtilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (HMDCameraRecordingManager)cameraRecordingManager
{
  return (HMDCameraRecordingManager *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCameraRecordingManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (id)recordingEventsCleanupTimerFactory
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setRecordingEventsCleanupTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (id)recordingManagerFactory
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setRecordingManagerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recordingManagerFactory, 0);
  objc_storeStrong(&self->_recordingEventsCleanupTimerFactory, 0);
  objc_storeStrong((id *)&self->_cameraRecordingManager, 0);
  objc_storeStrong((id *)&self->_predicateUtilities, 0);
  objc_storeStrong((id *)&self->_significantEventNotificationFilter, 0);
  objc_storeStrong((id *)&self->_recordingEventsCleanupTimer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_clipUserNotificationCenter, 0);
  objc_storeStrong((id *)&self->_reachabilityEventManager, 0);
  objc_storeStrong((id *)&self->_cameraSettingsManager, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_settingProactiveReaders, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_cameraStreamManagers, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_recordingManagementService, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
}

void __48__HMDCameraProfile_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reachabilityEventManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkMonitorIsUnreachable:", *(_QWORD *)(a1 + 40));

}

void __46__HMDCameraProfile_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reachabilityEventManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkMonitorIsReachable:", *(_QWORD *)(a1 + 40));

}

void __118__HMDCameraProfile_notificationManager_didReceiveNotificationForCameraSignificantEventIdentifier_notificationReasons___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    NSPrintF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received notification for significant event with UUID: %@ notificationReasons: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "significantEventNotificationFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIncomingPrimaryResidentSignificantEventNotificationWithUUID:notificationReasons:date:", v9, v10, v11);

  objc_msgSend(*(id *)(a1 + 32), "significantEventNotificationFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "consumeCloudSignificantEventWithUUID:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 32);
  if (v13)
  {
    objc_msgSend(v14, "_postNotificationForUpdatedSignificantEvent:", v13);
  }
  else
  {
    objc_msgSend(v14, "clipManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "performCloudPull");

  }
}

uint64_t __83__HMDCameraProfile_cameraProfileSettingsManager_canDisableRecordingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

uint64_t __82__HMDCameraProfile_cameraProfileSettingsManager_canEnableRecordingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

uint64_t __55__HMDCameraProfile_handleResidentsChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createCameraRecordingManager");
}

void __64__HMDCameraProfile__postNotificationForUpdatedSignificantEvent___block_invoke(id *a1, char a2)
{
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDCameraProfile__postNotificationForUpdatedSignificantEvent___block_invoke_2;
  v7[3] = &unk_24E796150;
  v11 = a2;
  v5 = a1[5];
  v6 = a1[4];
  v8 = v5;
  v9 = v6;
  v10 = a1[6];
  dispatch_async(v4, v7);

}

void __64__HMDCameraProfile__postNotificationForUpdatedSignificantEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 56)
    && (objc_msgSend(*(id *)(a1 + 32), "significantEvents"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "na_allObjectsPassTest:", &__block_literal_global_87_208860),
        v2,
        v3))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Not posting notification since we found recent doorbell bulletin(s) to update for significant event: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "_shouldNotifyForSignificantEvent:", *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 40), "clipUserNotificationCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationForBulletin:significantEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

BOOL __64__HMDCameraProfile__postNotificationForUpdatedSignificantEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "reason") == 1 || objc_msgSend(v2, "reason") == 2;

  return v3;
}

void __35__HMDCameraProfile_removeCloudData__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing all cloud data", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "clipManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "remove");

  objc_msgSend(*(id *)(a1 + 32), "cameraSettingsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remove");

}

HMDCameraRecordingManager *__328__HMDCameraProfile_initWithAccessory_services_recordingManagementService_msgDispatcher_workQueue_home_settingsManager_uniqueIdentifier_clipManager_clipUserNotificationCenter_reachabilityEventManager_networkMonitor_streamSnapshotHandler_snapshotManager_cameraStreamManagers_significantEventNotificationFilter_notificationCenter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HMDCameraRecordingManager *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[HMDCameraRecordingManager initWithCamera:recordingManagementService:]([HMDCameraRecordingManager alloc], "initWithCamera:recordingManagementService:", v5, v4);

  return v6;
}

id __328__HMDCameraProfile_initWithAccessory_services_recordingManagementService_msgDispatcher_workQueue_home_settingsManager_uniqueIdentifier_clipManager_clipUserNotificationCenter_reachabilityEventManager_networkMonitor_streamSnapshotHandler_snapshotManager_cameraStreamManagers_significantEventNotificationFilter_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

HMDCameraStreamControlMessageHandler *__92__HMDCameraProfile_initWithAccessory_services_msgDispatcher_workQueue_home_settingsManager___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  HMDCameraStreamControlMessageHandler *v4;

  v3 = a2;
  v4 = -[HMDCameraStreamControlMessageHandler initWithWorkQueue:streamSnapshotHandler:accessory:streamManagementService:profileUniqueIdentifier:networkMonitor:]([HMDCameraStreamControlMessageHandler alloc], "initWithWorkQueue:streamSnapshotHandler:accessory:streamManagementService:profileUniqueIdentifier:networkMonitor:", a1[4], a1[5], a1[6], v3, a1[7], a1[8]);

  return v4;
}

+ (HMDCameraBulletinBoard)bulletinBoard
{
  void *v2;

  v2 = (void *)_bulletinBoard;
  if (!_bulletinBoard)
  {
    if (bulletinBoard_onceToken != -1)
      dispatch_once(&bulletinBoard_onceToken, &__block_literal_global_60_208950);
    v2 = (void *)_bulletinBoard;
  }
  return (HMDCameraBulletinBoard *)v2;
}

+ (void)setBulletinBoard:(id)a3
{
  objc_storeStrong((id *)&_bulletinBoard, a3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_208945 != -1)
    dispatch_once(&logCategory__hmf_once_t7_208945, &__block_literal_global_62_208946);
  return (id)logCategory__hmf_once_v8_208947;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __31__HMDCameraProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_208947;
  logCategory__hmf_once_v8_208947 = v0;

}

void __33__HMDCameraProfile_bulletinBoard__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_bulletinBoard;
  _bulletinBoard = v0;

}

@end
