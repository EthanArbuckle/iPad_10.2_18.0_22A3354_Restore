@implementation HMDHomeMediaSystemHandler

- (HMDHomeMediaSystemHandler)initWithMediaSystems:(id)a3
{
  id v4;
  HMDHomeMediaSystemHandler *v5;
  uint64_t v6;
  OS_os_log *logger;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *uuidToMediaSystems;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeMediaSystemHandler;
  v5 = -[HMDHomeMediaSystemHandler init](&v12, sel_init);
  if (v5)
  {
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    logger = v5->_logger;
    v5->_logger = (OS_os_log *)v6;

    objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_61951);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    uuidToMediaSystems = v5->_uuidToMediaSystems;
    v5->_uuidToMediaSystems = (NSMutableDictionary *)v9;

  }
  return v5;
}

- (NSArray)mediaSystems
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_uuidToMediaSystems, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)filteredMediaSystems
{
  void *v2;
  void *v3;

  -[HMDHomeMediaSystemHandler mediaSystems](self, "mediaSystems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_2_61947);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mediaSystemWithUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_uuidToMediaSystems, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)updateMediaSystem:(id)a3
{
  id v4;
  void *v5;
  HMDHomeMediaSystemHandler *v6;
  NSObject *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *uuidToMediaSystems;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating media system: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  uuidToMediaSystems = v6->_uuidToMediaSystems;
  objc_msgSend(v4, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](uuidToMediaSystems, "setObject:forKey:", v4, v11);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeMediaSystem:(id)a3
{
  id v4;
  void *v5;
  HMDHomeMediaSystemHandler *v6;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *uuidToMediaSystems;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing media system: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  uuidToMediaSystems = v6->_uuidToMediaSystems;
  objc_msgSend(v4, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](uuidToMediaSystems, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v6->_uuidToMediaSystems;
    objc_msgSend(v4, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

    os_unfair_lock_unlock(&v6->_lock);
    -[HMDHomeMediaSystemHandler handleRemovedMediaSystem:](v6, "handleRemovedMediaSystem:", v4);
  }
  else
  {
    os_unfair_lock_unlock(&v6->_lock);
  }

}

- (void)handleRemovedMediaSystem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "unconfigureMediaSystemComponents");
  -[HMDHomeMediaSystemHandler unsubscribeToSettingsForMediaSystem:](self, "unsubscribeToSettingsForMediaSystem:", v6);
  -[HMDHomeMediaSystemHandler delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSystemController:didRemoveMediaSystem:", self, v5);

  -[HMDHomeMediaSystemHandler notifyOfRemovedMediaSystem:](self, "notifyOfRemovedMediaSystem:", v6);
}

- (void)unsubscribeToSettingsForMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeMediaSystemHandler *v7;
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
  -[HMDHomeMediaSystemHandler stereoPairSettingsController](self, "stereoPairSettingsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Stereo pair settings controller remove media system: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDHomeMediaSystemHandler stereoPairSettingsController](v7, "stereoPairSettingsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unsubscribeToRemovedMediaSystemIfPrimaryResident:", v4);

  }
}

- (void)notifyOfRemovedMediaSystem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDD7D20];
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeMediaSystemHandler notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemHandler delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HMDMediaSystemRemovedNotification"), v8, v6);

}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[HMDHomeMediaSystemHandler mediaSystems](self, "mediaSystems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeMediaSystemHandler parentUUID](self, "parentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("homeUUID"), v6);
  v11[0] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F140]), "initWithName:value:", CFSTR("mediaSystemUUIDs"), v4);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeMediaSystemHandler parentUUID](self, "parentUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configure:(id)a3 delegate:(id)a4 dataSource:(id)a5 queue:(id)a6 messageDispatcher:(id)a7 notificationCenter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HMDHomeMediaSystemHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDHomeMediaSystemControllerMessageHandler *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v33 = a4;
  v32 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v14, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemHandler setParentUUID:](self, "setParentUUID:", v18);

  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeMediaSystemHandler mediaSystems](v20, "mediaSystems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v22;
    v41 = 2112;
    v42 = v14;
    v43 = 2112;
    v44 = v23;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Configuring media system controller for home: %@ media systems: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v19);
  -[HMDHomeMediaSystemHandler setHome:](v20, "setHome:", v14);
  -[HMDHomeMediaSystemHandler setDelegate:](v20, "setDelegate:", v33);
  -[HMDHomeMediaSystemHandler setDataSource:](v20, "setDataSource:", v32);
  objc_msgSend(v14, "residentDeviceManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addDataSource:", v20);

  -[HMDHomeMediaSystemHandler setWorkQueue:](v20, "setWorkQueue:", v15);
  -[HMDHomeMediaSystemHandler setMessageDispatcher:](v20, "setMessageDispatcher:", v16);
  -[HMDHomeMediaSystemHandler setNotificationCenter:](v20, "setNotificationCenter:", v17);
  v25 = -[HMDHomeMediaSystemControllerMessageHandler initWithQueue:home:messageDispatcher:delegate:]([HMDHomeMediaSystemControllerMessageHandler alloc], "initWithQueue:home:messageDispatcher:delegate:", v15, v14, v16, v20);
  -[HMDHomeMediaSystemHandler setMessageHandler:](v20, "setMessageHandler:", v25);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HMDHomeMediaSystemHandler mediaSystems](v20, "mediaSystems");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v31, "setDataSource:", v20, v32);
        objc_msgSend(v31, "configureWithMessageDispatcher:", v16);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v28);
  }

}

- (id)mediaSystemForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDHomeMediaSystemHandler mediaSystems](self, "mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke;
  v9[3] = &unk_24E77E3B8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)processedMediaSystemBuilderMessageFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHomeMediaSystemHandler messageHandler](self, "messageHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preProcessMediaSystemMessage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)routeMediaSystemWithMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDHomeMediaSystemHandler messageHandler](self, "messageHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeUpdateMediaSystem:", v4);

}

- (void)messageHandlerAddMediaSystem:(id)a3 configuredName:(id)a4 leftUUID:(id)a5 leftAccessoryUUID:(id)a6 rightUUID:(id)a7 rightAccessoryUUID:(id)a8 builderSession:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMDHomeMediaSystemHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDHomeMediaSystemHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  HMDHomeMediaSystemHandler *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void **v52;
  const __CFString **v53;
  void *v54;
  HMDHomeMediaSystemHandler *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  HMDMediaSystemModel *v78;
  void *v79;
  HMDMediaSystemModel *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  HMDHomeMediaSystemHandler *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  HMDHomeMediaSystemHandler *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void (**v119)(id, _QWORD, void *);
  void *v120;
  id v121;
  id v122;
  _QWORD v123[5];
  id v124;
  void (**v125)(id, _QWORD, void *);
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[2];
  _BYTE v138[128];
  _BYTE v139[128];
  const __CFString *v140;
  void *v141;
  const __CFString *v142;
  void *v143;
  uint8_t buf[4];
  void *v145;
  __int16 v146;
  id v147;
  __int16 v148;
  id v149;
  __int16 v150;
  void *v151;
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v122 = a4;
  v17 = a5;
  v18 = a6;
  v121 = a7;
  v19 = a8;
  v20 = a9;
  v119 = (void (**)(id, _QWORD, void *))a10;
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v145 = v24;
    v146 = 2112;
    v147 = v20;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Received add media system message for session ID %@", buf, 0x16u);

  }
  v120 = v20;

  objc_autoreleasePoolPop(v21);
  -[HMDHomeMediaSystemHandler mediaSystemWithUUID:](v22, "mediaSystemWithUUID:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    -[HMDHomeMediaSystemHandler dataSource](v22, "dataSource");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeMediaSystemHandler home](v22, "home");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "homeManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "mediaSystemController:accessoryForUUID:", v22, v18);
    v36 = objc_claimAutoreleasedReturnValue();
    v116 = v33;
    v37 = v33;
    v38 = (void *)v36;
    v29 = v19;
    objc_msgSend(v37, "mediaSystemController:accessoryForUUID:", v22, v19);
    v39 = objc_claimAutoreleasedReturnValue();
    v117 = v16;
    v118 = (void *)v39;
    if (v38 && (v40 = (void *)v39) != 0)
    {
      v114 = v35;
      objc_msgSend(v38, "uuid");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "uuid");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "hmf_isEqualToUUID:", v42);

      if (!v43)
      {
        v113 = v38;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v18, v19, 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        -[HMDHomeMediaSystemHandler mediaSystems](v22, "mediaSystems");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v18;
        v35 = v114;
        v64 = v118;
        v108 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v130, v139, 16);
        if (v108)
        {
          v65 = *(_QWORD *)v131;
          v110 = v63;
          v111 = v17;
          v106 = *(_QWORD *)v131;
          do
          {
            v66 = 0;
            do
            {
              if (*(_QWORD *)v131 != v65)
              {
                v67 = v66;
                objc_enumerationMutation(v63);
                v66 = v67;
              }
              v109 = v66;
              v68 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v66);
              v126 = 0u;
              v127 = 0u;
              v128 = 0u;
              v129 = 0u;
              v107 = v68;
              objc_msgSend(v68, "components");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v126, v138, 16);
              if (v70)
              {
                v71 = v70;
                v72 = *(_QWORD *)v127;
                while (2)
                {
                  for (i = 0; i != v71; ++i)
                  {
                    if (*(_QWORD *)v127 != v72)
                      objc_enumerationMutation(v69);
                    objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * i), "accessory");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "uuid");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v76 = objc_msgSend(v62, "containsObject:", v75);

                    if (v76)
                    {
                      v84 = (void *)MEMORY[0x227676638]();
                      v85 = v22;
                      HMFGetOSLogHandle();
                      v86 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v145 = v87;
                        v146 = 2112;
                        v147 = v74;
                        v148 = 2112;
                        v149 = v107;
                        _os_log_impl(&dword_2218F0000, v86, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ already used in another media system %@", buf, 0x20u);

                      }
                      objc_autoreleasePoolPop(v84);
                      objc_msgSend(v114, "setupActivity");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      v136[0] = CFSTR("accessory.uuid");
                      objc_msgSend(v74, "uuid");
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      HMDailyRotatedUUID();
                      v90 = objc_claimAutoreleasedReturnValue();
                      v91 = (void *)v90;
                      if (v90)
                        v92 = (const __CFString *)v90;
                      else
                        v92 = CFSTR("no uuid");
                      v136[1] = CFSTR("error.code");
                      v137[0] = v92;
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2023);
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      v137[1] = v93;
                      v94 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v137, v136, 2);

                      v35 = v114;
                      objc_msgSend(v114, "setupActivity");
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v95, "markWithReason:", CFSTR("HMDHomeMediaSystemHandler.addedMediaSystem.failure"));

                      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2023);
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      v119[2](v119, 0, v96);

                      v32 = v119;
                      v82 = v110;
                      v17 = v111;
                      v29 = v19;
                      v31 = v116;
                      v38 = v113;
                      goto LABEL_42;
                    }

                  }
                  v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v126, v138, 16);
                  if (v71)
                    continue;
                  break;
                }
              }

              v66 = v109 + 1;
              v63 = v110;
              v17 = v111;
              v38 = v113;
              v35 = v114;
              v64 = v118;
              v65 = v106;
            }
            while (v109 + 1 != v108);
            v29 = v19;
            v108 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v130, v139, 16);
          }
          while (v108);
        }

        v77 = objc_msgSend(v38, "supportedStereoPairVersions");
        if ((objc_msgSend(v64, "supportedStereoPairVersions") & v77) != 0)
        {
          v78 = [HMDMediaSystemModel alloc];
          -[HMDHomeMediaSystemHandler parentUUID](v22, "parentUUID");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v78, "initWithObjectChangeType:uuid:parentUUID:", 1, v117, v79);

          v31 = v116;
          if (v122)
            -[HMDMediaSystemModel setConfiguredName:](v80, "setConfiguredName:");
          objc_msgSend(MEMORY[0x24BDD77D8], "encodeComponentDataWithLeftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:", v17, v112, v121, v29);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaSystemModel setMediaSystemComponents:](v80, "setMediaSystemComponents:", v81);

          objc_msgSend(v116, "backingStore");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
          v82 = v80;
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "transaction:options:", CFSTR("Add media system"), v83);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v69, "add:", v82);
          v123[0] = MEMORY[0x24BDAC760];
          v123[1] = 3221225472;
          v123[2] = __155__HMDHomeMediaSystemHandler_messageHandlerAddMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke;
          v123[3] = &unk_24E79AB68;
          v123[4] = v22;
          v124 = v117;
          v32 = v119;
          v125 = v119;
          objc_msgSend(v69, "run:", v123);

        }
        else
        {
          v97 = (void *)MEMORY[0x227676638]();
          v98 = v22;
          HMFGetOSLogHandle();
          v99 = objc_claimAutoreleasedReturnValue();
          v31 = v116;
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v145 = v100;
            v146 = 2112;
            v147 = v38;
            v148 = 2112;
            v149 = v118;
            _os_log_impl(&dword_2218F0000, v99, OS_LOG_TYPE_ERROR, "%{public}@There is a mismatch in the supported stereo pair versions %@, %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v97);
          objc_msgSend(v35, "setupActivity");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v134[0] = CFSTR("error.code");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v134[1] = CFSTR("error.code.private");
          v135[0] = v102;
          v38 = v113;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2024);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v135[1] = v103;
          v104 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v135, v134, 2);

          v105 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2024);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 3, 0, 0, 0, v82);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v119;
          v119[2](v119, 0, v69);
        }
LABEL_42:

        v18 = v112;
        goto LABEL_43;
      }
      v44 = (void *)MEMORY[0x227676638]();
      v45 = v22;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      v31 = v116;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v145 = v47;
        v146 = 2112;
        v147 = v18;
        v148 = 2112;
        v149 = v29;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Accessories in media system are not unique %@ - %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v44);
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2022);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v119;
      v119[2](v119, 0, v48);

      v35 = v114;
      objc_msgSend(v114, "setupActivity");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = CFSTR("error.code");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2022);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = v50;
      v51 = (void *)MEMORY[0x24BDBCE70];
      v52 = &v141;
      v53 = &v140;
    }
    else
    {
      v54 = (void *)MEMORY[0x227676638]();
      v55 = v22;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      v31 = v116;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v57 = v38;
        v58 = v35;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v145 = v59;
        v146 = 2112;
        v147 = v116;
        v148 = 2112;
        v149 = v18;
        v150 = 2112;
        v151 = v29;
        _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Accessory cannot be found in home %@ for accessory IDs %@ %@", buf, 0x2Au);

        v35 = v58;
        v38 = v57;
      }

      objc_autoreleasePoolPop(v54);
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2021);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v119;
      v119[2](v119, 0, v60);

      objc_msgSend(v35, "setupActivity");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = CFSTR("error.code");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2021);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = v50;
      v51 = (void *)MEMORY[0x24BDBCE70];
      v52 = &v143;
      v53 = &v142;
    }
    v61 = (id)objc_msgSend(v51, "dictionaryWithObjects:forKeys:count:", v52, v53, 1);

    objc_msgSend(v35, "setupActivity");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "markWithReason:", CFSTR("HMDHomeMediaSystemHandler.addedMediaSystem.failure"));
LABEL_43:

    v16 = v117;
    goto LABEL_44;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = v22;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v19;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v145 = v30;
    v146 = 2112;
    v147 = v16;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Media system with uuid %@ already exists", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v119;
  v119[2](v119, 0, v31);
LABEL_44:

}

- (void)messageHandlerUpdateMediaSystem:(id)a3 configuredName:(id)a4 leftUUID:(id)a5 leftAccessoryUUID:(id)a6 rightUUID:(id)a7 rightAccessoryUUID:(id)a8 builderSession:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD, void *);
  void *v21;
  HMDHomeMediaSystemHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDHomeMediaSystemHandler *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDHomeMediaSystemHandler *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDHomeMediaSystemHandler *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  _QWORD v64[5];
  id v65;
  void (**v66)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v63 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v60 = a7;
  v62 = a8;
  v19 = a9;
  v20 = (void (**)(id, _QWORD, void *))a10;
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v24;
    v69 = 2112;
    v70 = v19;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Received update media system message for session ID %@", buf, 0x16u);

  }
  v61 = v19;

  objc_autoreleasePoolPop(v21);
  -[HMDHomeMediaSystemHandler mediaSystemWithUUID:](v22, "mediaSystemWithUUID:", v63);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[HMDHomeMediaSystemHandler dataSource](v22, "dataSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v18;
    objc_msgSend(v26, "mediaSystemController:accessoryForUUID:", v22, v18);
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mediaSystemController:accessoryForUUID:", v22, v62);
    v29 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v28;
    v58 = v16;
    v59 = (void *)v29;
    if (!v28 || !v29)
    {
      v43 = (void *)MEMORY[0x227676638]();
      v44 = v22;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeMediaSystemHandler delegate](v44, "delegate");
        v47 = v17;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v68 = v46;
        v69 = 2112;
        v70 = v48;
        v71 = 2112;
        v72 = v18;
        v73 = 2112;
        v74 = v62;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Accessory cannot be found in home %@ for accessory IDs %@ %@", buf, 0x2Au);

        v17 = v47;
        v27 = v18;

      }
      objc_autoreleasePoolPop(v43);
      v49 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2021);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, 0, 0, 0, v34);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v50);

      v31 = v60;
      goto LABEL_19;
    }
    v56 = v17;
    objc_msgSend(v25, "accessories");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v60;
    if ((objc_msgSend(v30, "containsObject:", v28) & 1) != 0)
    {
      objc_msgSend(v25, "accessories");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "containsObject:", v59);

      if ((v33 & 1) != 0)
      {
        objc_msgSend(v25, "modelForMediaSystem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObjectChangeType:", 2);
        objc_msgSend(v34, "setConfiguredName:", v58);
        objc_msgSend(MEMORY[0x24BDD77D8], "encodeComponentDataWithLeftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:", v56, v27, v60, v62);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setMediaSystemComponents:", v35);

        objc_msgSend(v26, "backingStore");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "transaction:options:", CFSTR("Update media system"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v56;
        objc_msgSend(v38, "add:", v34);
        v64[0] = MEMORY[0x24BDAC760];
        v64[1] = 3221225472;
        v64[2] = __158__HMDHomeMediaSystemHandler_messageHandlerUpdateMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke;
        v64[3] = &unk_24E79AB68;
        v64[4] = v22;
        v65 = v63;
        v66 = v20;
        objc_msgSend(v38, "run:", v64);

LABEL_19:
        v16 = v58;
        goto LABEL_20;
      }
    }
    else
    {

    }
    v51 = (void *)MEMORY[0x227676638]();
    v52 = v22;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "accessories");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v68 = v54;
      v69 = 2112;
      v70 = v55;
      v71 = 2112;
      v72 = v25;
      v73 = 2112;
      v74 = v27;
      v75 = 2112;
      v76 = v62;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Accessories %@ in media system %@ cannot be changed - accessory IDs %@ %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v51);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 0, v34);
    v17 = v56;
    goto LABEL_19;
  }
  v39 = (void *)MEMORY[0x227676638]();
  v40 = v22;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v42;
    v69 = 2112;
    v70 = v63;
    _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Media system with uuid %@ not found", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v39);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, 0, v26);
  v27 = v18;
  v31 = v60;
LABEL_20:

}

- (void)messageHandlerRemoveMediaSystem:(id)a3 builderSession:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHomeMediaSystemHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHomeMediaSystemHandler *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v14;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received remove media system message for session ID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDHomeMediaSystemHandler mediaSystemWithUUID:](v12, "mediaSystemWithUUID:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "modelForMediaSystem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObjectChangeType:", 3);
    -[HMDHomeMediaSystemHandler dataSource](v12, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "backingStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transaction:options:", CFSTR("Remove media system"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "add:withMessage:", v17, v10);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __84__HMDHomeMediaSystemHandler_messageHandlerRemoveMediaSystem_builderSession_message___block_invoke;
    v26[3] = &unk_24E79BD80;
    v26[4] = v12;
    objc_msgSend(v21, "run:", v26);

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v12;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v25;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@No media system for session ID found %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v17);
  }

}

- (void)mergeMediaSystemData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__61896;
  v15 = __Block_byref_object_dispose__61897;
  -[HMDHomeMediaSystemHandler identifiersInMediaSystemData:](self, "identifiersInMediaSystemData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v5, "mutableCopy");

  -[HMDHomeMediaSystemHandler mediaSystems](self, "mediaSystems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__HMDHomeMediaSystemHandler_mergeMediaSystemData___block_invoke;
  v8[3] = &unk_24E77E3E0;
  v10 = &v11;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "na_each:", v8);

  -[HMDHomeMediaSystemHandler addMediaSystemsWithIdentifiers:usingData:](self, "addMediaSystemsWithIdentifiers:usingData:", v12[5], v7);
  _Block_object_dispose(&v11, 8);

}

- (id)identifiersInMediaSystemData:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_46_61894);
}

- (id)mediaSystemData:(id)a3 withIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HMDHomeMediaSystemHandler_mediaSystemData_withIdentifier___block_invoke;
  v9[3] = &unk_24E77E448;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addMediaSystemsWithIdentifiers:(id)a3 usingData:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__HMDHomeMediaSystemHandler_addMediaSystemsWithIdentifiers_usingData___block_invoke;
  v8[3] = &unk_24E782620;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "na_each:", v8);

}

- (void)addMediaSystemWithGroupIdentifier:(id)a3 usingData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeMediaSystemHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaSystem *v14;
  void *v15;
  HMDHomeMediaSystemHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDHomeMediaSystemHandler *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v11;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding media system with identifier: %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHomeMediaSystemHandler mediaSystemData:withIdentifier:](v9, "mediaSystemData:withIdentifier:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMDHomeMediaSystemHandler home](v9, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[HMDMediaSystem initWithMediaSystemData:home:]([HMDMediaSystem alloc], "initWithMediaSystemData:home:", v12, v13);
      -[HMDHomeMediaSystemHandler addMediaSystem:](v9, "addMediaSystem:", v14);

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v9;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v22;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to add media system using data: %@ due to no home", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v9;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v18;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data for media system to add with identifier: %@ data: %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)_handleAddMediaSystemModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeMediaSystemHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDMediaSystem *v13;
  void *v14;
  HMDHomeMediaSystemHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDHomeMediaSystemHandler *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  HMDMediaSystem *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && !objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    -[HMDHomeMediaSystemHandler home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDMediaSystem initWithMediaSystemModel:home:]([HMDMediaSystem alloc], "initWithMediaSystemModel:home:", v6, v12);
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v17;
      v31 = 2112;
      v32 = v19;
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling add of media system %@, system: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    if (v13)
    {
      -[HMDHomeMediaSystemHandler addMediaSystem:](v15, "addMediaSystem:", v13);
      -[HMDMediaSystem serialize](v13, "serialize", *MEMORY[0x24BDD7CD0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithPayload:", v21);

      objc_msgSend(v7, "transactionResult");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "markChanged");
      objc_msgSend(v22, "markSaveToAssistant");
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v15;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot create media system object", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v22);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping add model due to Home Theater QFA enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)addMediaSystem:(id)a3
{
  id v4;
  void *v5;
  NSObject *logger;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setDataSource:", self);
  -[HMDHomeMediaSystemHandler messageDispatcher](self, "messageDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureWithMessageDispatcher:", v5);

  -[HMDHomeMediaSystemHandler updateMediaSystem:](self, "updateMediaSystem:", v4);
  -[HMDHomeMediaSystemHandler subscribeToSettingsForNewlyAddedMediaSystem:](self, "subscribeToSettingsForNewlyAddedMediaSystem:", v4);
  -[HMDHomeMediaSystemHandler confirmPrimaryResidentIfFirstMediaSystem](self, "confirmPrimaryResidentIfFirstMediaSystem");
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    v7 = logger;
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AddedMediaSystem", "mediaSystemUUID=%{signpost.description:attribute}@ ", buf, 0xCu);

  }
  -[HMDHomeMediaSystemHandler notificationCenter](self, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemHandler delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("HMDMediaSystemNotificationKey");
  v13 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("HMDMediaSystemAddedNotification"), v10, v11);

}

- (void)subscribeToSettingsForNewlyAddedMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeMediaSystemHandler *v7;
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
  -[HMDHomeMediaSystemHandler stereoPairSettingsController](self, "stereoPairSettingsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Stereo pair settings controller add media system: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDHomeMediaSystemHandler stereoPairSettingsController](v7, "stereoPairSettingsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscribeToAddedMediaSystemIfPrimaryResident:", v4);

  }
}

- (void)confirmPrimaryResidentIfFirstMediaSystem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  HMDHomeMediaSystemHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDHomeMediaSystemHandler *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeMediaSystemHandler mediaSystems](self, "mediaSystems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[HMDHomeMediaSystemHandler home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "isCurrentDevicePrimaryResident"))
      {
        v7 = (void *)MEMORY[0x227676638]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543362;
          v17 = v10;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Confirming primary resident due to first added media system", (uint8_t *)&v16, 0xCu);

        }
        objc_autoreleasePoolPop(v7);
        objc_msgSend(v6, "residentDeviceManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "confirmWithCompletionHandler:", 0);

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to confirm primary resident due to no home", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
}

- (void)_handleRemoveMediaSystemModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeMediaSystemHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeMediaSystemHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHomeMediaSystemHandler *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && !objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    objc_msgSend(v6, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeMediaSystemHandler mediaSystemWithUUID:](self, "mediaSystemWithUUID:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138544130;
      v30 = v17;
      v31 = 2112;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling transaction removal of media system model uuid: %@ message identifier: %@ media system: %@", (uint8_t *)&v29, 0x2Au);

    }
    objc_autoreleasePoolPop(v14);
    if (v12)
    {
      -[HMDHomeMediaSystemHandler removeMediaSystem:](v15, "removeMediaSystem:", v12);
      objc_msgSend(v7, "transactionResult");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "markChanged");
      objc_msgSend(v21, "markSaveToAssistant");
      objc_msgSend(v7, "respondWithSuccess");
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v15;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "UUIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeMediaSystemHandler mediaSystems](v23, "mediaSystems");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543874;
        v30 = v25;
        v31 = 2112;
        v32 = v27;
        v33 = 2112;
        v34 = v28;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot find media system with UUID %@, current media systems: %@", (uint8_t *)&v29, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v21);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping remove model due to Home Theater QFA enabled", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v12);
  }

}

- (void)_handleUpdateMediaSystemModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeMediaSystemHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeMediaSystemHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && !objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeMediaSystemHandler mediaSystemWithUUID:](self, "mediaSystemWithUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v19;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling update of media system %@, system: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v13, "transactionObjectUpdated:newValues:message:", 0, v6, v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping update model due to Home Theater QFA enabled", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (id)backingStoreObjectsForVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDHomeMediaSystemHandler mediaSystems](self, "mediaSystems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "backingStoreObjectsForVersion:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)localAndRemoteSubscriptionProvider
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHomeMediaSystemHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localAndRemoteSubscriptionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)eventForwarder
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHomeMediaSystemHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "eventForwarder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)eventStoreReadHandle
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHomeMediaSystemHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "eventStoreReadHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)uuidToMediaSystems
{
  return self->_uuidToMediaSystems;
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  -[HMDHomeMediaSystemHandler mediaSystems](self, "mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    v7 = objc_msgSend(v4, "supportsWholeHouseAudio");
  else
    v7 = 1;

  return v7;
}

- (HMDHomeMediaSystemHandler)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HMDHomeMediaSystemHandler *v18;
  NSObject *v19;
  void *v20;
  HMDHomeMediaSystemHandler *v21;
  int v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x24BDD7D30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("ms.homepod"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("ms.homepod6_1"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8)
    v12 = 0;
  else
    v12 = v9 == 0;
  if (!v12 || v10 != 0)
  {
    if (v8)
    {
      v14 = v8;
      if (!v9)
        goto LABEL_11;
    }
    else
    {
      v14 = (id)MEMORY[0x24BDBD1A8];
      if (!v9)
      {
LABEL_11:
        if (v11)
        {
          objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v11);
          v16 = objc_claimAutoreleasedReturnValue();

          v14 = (id)v16;
        }
        goto LABEL_16;
      }
    }
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v9);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v15;
    goto LABEL_11;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v20;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Decoded home media system handler with no media systems", (uint8_t *)&v23, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  v14 = (id)MEMORY[0x24BDBD1A8];
LABEL_16:
  v21 = -[HMDHomeMediaSystemHandler initWithMediaSystems:](self, "initWithMediaSystems:", v14);

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDHomeMediaSystemHandler mediaSystems](self, "mediaSystems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD7D30]);

}

- (id)_currentMediaSystemIfPrimary
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!+[HMDDeviceCapabilities isAppleMediaAccessory](HMDDeviceCapabilities, "isAppleMediaAccessory"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HMDHomeMediaSystemHandler mediaSystems](self, "mediaSystems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "targetAccessory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isCurrentAccessory"))
        {
          v4 = v7;

          goto LABEL_13;
        }

      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

- (void)_userAssistantAccessControlDidUpdate:(id)a3 accessories:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  uint64_t i;
  int v18;
  void *v19;
  HMDHomeMediaSystemHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  HMDHomeMediaSystemHandler *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDHomeMediaSystemHandler *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  _BYTE v50[10];
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HMDHomeMediaSystemHandler _currentMediaSystemIfPrimary](self, "_currentMediaSystemIfPrimary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v37 = self;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v9, "accessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v43;
      v16 = 1;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v43 != v15)
            objc_enumerationMutation(v11);
          v18 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          v14 |= v18;
          v16 &= v18;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
      v16 = 1;
    }

    v19 = (void *)MEMORY[0x227676638]();
    self = v37;
    v20 = v37;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessories");
      v36 = v10;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v48 = v22;
      v49 = 1024;
      *(_DWORD *)v50 = v14 & 1;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v16;
      v51 = 2112;
      v52 = v23;
      v53 = 2112;
      v54 = v7;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEBUG, "%{public}@accessories in media system somePresent:%d allPresent:%d, ms acc:%@, incoming acc: %@", buf, 0x2Cu);

      v10 = v36;
      self = v37;
    }

    objc_autoreleasePoolPop(v19);
    if (!(v16 & 1 | ((v14 & 1) == 0)))
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v10, "accessories");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v39 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
            if (objc_msgSend(v7, "containsObject:", v29))
              objc_msgSend(v8, "addObject:", v29);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v26);
      }

    }
  }
  if (objc_msgSend(v8, "count"))
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v33;
      v49 = 2112;
      *(_QWORD *)v50 = v8;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@audit discovered accessories added by old controller, will remove %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    -[HMDHomeMediaSystemHandler delegate](v31, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v34, "mediaSystemController:removeAccessories:fromAssistantAccessControl:", v31, v35, v6);

  }
}

- (id)destinationForMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHomeMediaSystemHandler dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationForMediaSystem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDHomeMediaSystemHandlerDataSource)dataSource
{
  return (HMDHomeMediaSystemHandlerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDHomeMediaSystemHandlerDelegate)delegate
{
  return (HMDHomeMediaSystemHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)parentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParentUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_messageDispatcher, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (HMDHomeMediaSystemControllerMessageHandler)messageHandler
{
  return (HMDHomeMediaSystemControllerMessageHandler *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (HMDStereoPairSettingsController)stereoPairSettingsController
{
  return self->_stereoPairSettingsController;
}

- (void)setStereoPairSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_stereoPairSettingsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stereoPairSettingsController, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_uuidToMediaSystems, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

uint64_t __70__HMDHomeMediaSystemHandler_addMediaSystemsWithIdentifiers_usingData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addMediaSystemWithGroupIdentifier:usingData:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __60__HMDHomeMediaSystemHandler_mediaSystemData_withIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __58__HMDHomeMediaSystemHandler_identifiersInMediaSystemData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __50__HMDHomeMediaSystemHandler_mergeMediaSystemData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v5);

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaSystemData:withIdentifier:", v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v4, "mergeMediaSystemData:", v9);
  else
    objc_msgSend(*(id *)(a1 + 32), "removeMediaSystem:", v4);

}

void __84__HMDHomeMediaSystemHandler_messageHandlerRemoveMediaSystem_builderSession_message___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Remove media system transaction run completed with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __158__HMDHomeMediaSystemHandler_messageHandlerUpdateMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaSystemWithUUID:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialize");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __155__HMDHomeMediaSystemHandler_messageHandlerAddMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaSystemWithUUID:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serialize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "setupActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("error.code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "code"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("domain");
  v16[0] = v10;
  objc_msgSend(v4, "domain");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("no domain");
  if (v11)
    v13 = (const __CFString *)v11;
  v16[1] = v13;
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke_2;
  v6[3] = &unk_24E790530;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);
  return v6;
}

uint64_t __50__HMDHomeMediaSystemHandler_attributeDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __49__HMDHomeMediaSystemHandler_filteredMediaSystems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValid");
}

uint64_t __50__HMDHomeMediaSystemHandler_initWithMediaSystems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_61958 != -1)
    dispatch_once(&logCategory__hmf_once_t7_61958, &__block_literal_global_10_61959);
  return (id)logCategory__hmf_once_v8_61960;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __40__HMDHomeMediaSystemHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_61960;
  logCategory__hmf_once_v8_61960 = v0;

}

@end
