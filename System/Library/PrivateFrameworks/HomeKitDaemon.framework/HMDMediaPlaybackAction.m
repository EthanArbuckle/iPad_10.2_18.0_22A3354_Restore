@implementation HMDMediaPlaybackAction

- (HMDMediaPlaybackAction)initWithUUID:(id)a3 mediaProfiles:(id)a4 playbackState:(int64_t)a5 volume:(id)a6 playbackArchive:(id)a7 actionSet:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMDMediaPlaybackAction *v19;
  HMDMediaPlaybackAction *v20;
  void *v21;
  uint64_t v22;
  NSSet *profileUUIDs;
  void *v24;
  objc_super v26;

  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMDMediaPlaybackAction;
  v19 = -[HMDAction initWithUUID:actionSet:](&v26, sel_initWithUUID_actionSet_, a3, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_mediaProfiles, a4);
    __mapProfilesToProfileUUIDs(v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "mutableCopy");
    profileUUIDs = v20->_profileUUIDs;
    v20->_profileUUIDs = (NSSet *)v22;

    objc_storeStrong((id *)&v20->_volume, a6);
    v20->_state = a5;
    objc_storeStrong((id *)&v20->_playbackArchive, a7);
    objc_msgSend(v18, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v20->_home, v24);

  }
  return v20;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMediaPlaybackAction *v8;
  NSObject *v9;
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
  -[HMDMediaPlaybackAction setHome:](self, "setHome:", v4);
  -[HMDMediaPlaybackAction profileUUIDs](self, "profileUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __mapUUIDsToProfiles(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackAction setMediaProfiles:](self, "setMediaProfiles:", v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackAction profileUUIDs](v8, "profileUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackAction mediaProfiles](v8, "mediaProfiles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Mapped profile UUIDs %@ to profiles %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v7);

}

- (unint64_t)type
{
  return 1;
}

- (id)stateDump
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  -[HMDAction uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDMediaPlaybackAction state](self, "state");
  -[HMDMediaPlaybackAction volume](self, "volume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackAction playbackArchive](self, "playbackArchive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackAction profileUUIDs](self, "profileUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Action uuid: %@, state: %tu, volume: %@, playbackArchive: %@, profileUUIDs: %@"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendFormat:", CFSTR(" %@"), v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_msgSend(v10, "copy");
  return v18;
}

- (id)dictionaryRepresentation
{
  void *v3;
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
  id v14;
  void *v15;
  HMDMediaPlaybackAction *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaPlaybackAction;
  -[HMDAction dictionaryRepresentation](&v22, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDMediaPlaybackAction state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD6658]);

  -[HMDMediaPlaybackAction volume](self, "volume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD6668]);

  -[HMDMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __mapProfilesToProfileUUIDs(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD6648]);

  -[HMDMediaPlaybackAction playbackArchive](self, "playbackArchive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1618];
    -[HMDMediaPlaybackAction playbackArchive](self, "playbackArchive");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;

    if (v13)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD6638]);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode playbackArchive: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  v19 = (void *)objc_msgSend(v4, "copy");

  return v19;
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDMediaPlaybackAction *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[HMDMediaPlaybackAction home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Executing media playback action", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_initWeak((id *)buf, v12);
    objc_msgSend(v10, "mediaActionRouter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__HMDMediaPlaybackAction_executeWithSource_clientName_completionHandler___block_invoke;
    v17[3] = &unk_24E797698;
    objc_copyWeak(&v19, (id *)buf);
    v18 = v9;
    objc_msgSend(v15, "routeMediaActionForExecution:source:clientName:completion:", v12, a3, v8, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v16);

  }
}

- (id)validate
{
  void *v3;
  int64_t v4;
  void *v5;
  BOOL v6;
  void *v8;
  HMDMediaPlaybackAction *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDMediaPlaybackAction state](self, "state");
  -[HMDMediaPlaybackAction volume](self, "volume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[HMDMediaPlaybackAction isPlaybackActionValidWithProfiles:state:volume:](HMDMediaPlaybackAction, "isPlaybackActionValidWithProfiles:state:volume:", v3, v4, v5);

  if (v6)
    return 0;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDMediaPlaybackAction state](v9, "state");
    -[HMDMediaPlaybackAction volume](v9, "volume");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackAction mediaProfiles](v9, "mediaProfiles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v11;
    v17 = 2048;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2048;
    v22 = objc_msgSend(v14, "count");
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid configuration for media playback action - state: %tu  volume: %@  #Profiles: %tu", (uint8_t *)&v15, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid configuration for media playback action"), 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HMDMediaPlaybackActionAsCharacteristicWriteRequests)convertedCharacteristicWriteRequests
{
  void *v3;
  HMDMediaPlaybackActionAsCharacteristicWriteRequests *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDMediaPlaybackAction *v26;
  void *v27;
  int64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDMediaPlaybackAction *v33;
  void *v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaPlaybackAction playbackArchive](self, "playbackArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[HMDMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v6, "count"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2 * objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          if (v15)
          {
            if (-[HMDMediaPlaybackAction state](self, "state"))
            {
              objc_msgSend(v15, "playStateWriteRequestWithPlaybackState:", -[HMDMediaPlaybackAction state](self, "state"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v7, "addObject:", v16);

            }
            -[HMDMediaPlaybackAction volume](self, "volume");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              -[HMDMediaPlaybackAction volume](self, "volume");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "floatValue");
              v20 = v19 / 100.0;

              *(float *)&v21 = v20;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
              v22 = v7;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "volumeWriteRequestWithVolumePercentage:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              v7 = v22;
              if (v24)
                objc_msgSend(v22, "addObject:", v24);

            }
          }
          else
          {
            objc_msgSend(v36, "addObject:", v13);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      v25 = v36;
      if (objc_msgSend(v36, "count"))
      {
        v26 = [HMDMediaPlaybackAction alloc];
        -[HMDAction uuid](self, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[HMDMediaPlaybackAction state](self, "state");
        -[HMDMediaPlaybackAction volume](self, "volume");
        v29 = v7;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMediaPlaybackAction playbackArchive](self, "playbackArchive");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAction actionSet](self, "actionSet");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[HMDMediaPlaybackAction initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:](v26, "initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:", v27, v36, v28, v30, v31, v32);

        v7 = v29;
        -[HMDMediaPlaybackAction home](self, "home");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMediaPlaybackAction configureWithHome:](v33, "configureWithHome:", v34);

      }
      else
      {
        v33 = 0;
      }
      v4 = -[HMDMediaPlaybackActionAsCharacteristicWriteRequests initWithAction:characteristicWriteRequests:]([HMDMediaPlaybackActionAsCharacteristicWriteRequests alloc], "initWithAction:characteristicWriteRequests:", v33, v7);

    }
    else
    {
      v4 = 0;
      v25 = v36;
    }

  }
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;

  -[HMDMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_232143);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(",\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAction uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDMediaPlaybackAction state](self, "state");
  -[HMDMediaPlaybackAction volume](self, "volume");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackAction playbackArchive](self, "playbackArchive");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@<uuid %@ play state %ld volume %@ playbackArchive %@ mediaProfiles {%@}>"), v9, v10, v11, v12, v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDMediaPlaybackAction profileUUIDs](self, "profileUUIDs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  mapProfilesToAccessoryUUIDs(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = objc_msgSend(v12, "isEqualToString:", v14);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDMediaPlaybackAction;
  if (-[HMDAction isCompatibleWithAction:](&v9, sel_isCompatibleWithAction_, v4))
  {
    -[HMDMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isStaleWithAccessory:(id)a3
{
  return 0;
}

- (id)associatedAccessories
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_32_232141);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isUnsecuringAction
{
  return 0;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMDMediaPlaybackAction *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    -[HMDMediaPlaybackAction _processPlaybackActionModelUpdated:message:](self, "_processPlaybackActionModelUpdated:message:", v13, v10);
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = (id)objc_opt_class();
      v18 = v25;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v19);

  }
}

- (void)_processPlaybackActionModelUpdated:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  HMDMediaPlaybackAction *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDMediaPlaybackAction *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[3];
  _QWORD v47[3];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "transactionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", CFSTR("state"));

  if (v10)
  {
    objc_msgSend(v6, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackAction setState:](self, "setState:", objc_msgSend(v11, "integerValue"));

  }
  objc_msgSend(v6, "setProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", CFSTR("volume"));

  if (v13)
  {
    objc_msgSend(v6, "volume");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackAction setVolume:](self, "setVolume:", v14);

    v10 = 1;
  }
  objc_msgSend(v6, "setProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", CFSTR("encodedPlaybackArchive"));

  if (v16)
  {
    objc_msgSend(v6, "encodedPlaybackArchive");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackAction setPlaybackArchive:](self, "setPlaybackArchive:", v17);

    v10 = 1;
  }
  objc_msgSend(v6, "setProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", CFSTR("profiles"));

  if (v19)
  {
    -[HMDMediaPlaybackAction home](self, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "profiles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    __mapUUIDsToProfiles(v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackAction setMediaProfiles:](self, "setMediaProfiles:", v22);

    objc_msgSend(v6, "profiles");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    -[HMDMediaPlaybackAction setProfileUUIDs:](self, "setProfileUUIDs:", v24);

  }
  else if (!v10)
  {
    v25 = 0;
    goto LABEL_17;
  }
  -[HMDAction actionSet](self, "actionSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "home");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v25 && v26)
  {
    v46[0] = CFSTR("kActionUUID");
    -[HMDAction uuid](self, "uuid");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v28;
    v46[1] = CFSTR("kActionInfo");
    -[HMDMediaPlaybackAction dictionaryRepresentation](self, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v29;
    v46[2] = CFSTR("kHomeUUID");
    objc_msgSend(v27, "uuid");
    v30 = v8;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "UUIDString");
    v44 = v27;
    v32 = v7;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
    v34 = objc_claimAutoreleasedReturnValue();

    v7 = v32;
    v8 = v30;

    v25 = (void *)v34;
LABEL_17:
    v40 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "respondWithPayload:", v25));
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v43;
      v50 = 2112;
      v51 = v25;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Responding to client after updating action with response: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    objc_msgSend(v8, "markChanged");
    goto LABEL_20;
  }
  v35 = (void *)MEMORY[0x227676638]();
  v36 = self;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v49 = v38;
    v50 = 2112;
    v51 = v6;
    v52 = 2112;
    v53 = v25;
    v54 = 2112;
    v55 = v27;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Playback action Model object (%@) missing actionset %@ or home %@ ", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v35);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v39);

LABEL_20:
}

- (HMDMediaPlaybackAction)initWithCoder:(id)a3
{
  id v4;
  HMDAction *v5;
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
  HMDMediaPlaybackAction *v16;
  HMDMediaPlaybackAction *v17;
  HMDMediaPlaybackAction *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v24;
  void *v25;
  objc_super v26;
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDAction initWithCoder:]([HMDAction alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6650]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6660]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCF20];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HDMPA.profileUUIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6630]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAction actionSet](v5, "actionSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAction uuid](v5, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDMediaPlaybackAction initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:](self, "initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:", v14, v15, v24, v6, v12, v13);

    -[HMDMediaPlaybackAction setProfileUUIDs:](v16, "setProfileUUIDs:", v11);
    v17 = v16;

    v18 = v17;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26.receiver = v17;
      v26.super_class = (Class)HMDMediaPlaybackAction;
      v22 = -[HMDMediaPlaybackAction class](&v26, sel_class);
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode base class: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDMediaPlaybackAction *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HMDMediaPlaybackAction *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HMDMediaPlaybackAction;
  -[HMDAction encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDMediaPlaybackAction state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD6650]);

  -[HMDMediaPlaybackAction volume](self, "volume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x24BDD6660]);

  -[HMDMediaPlaybackAction playbackArchive](self, "playbackArchive");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x24BDD6630]);

  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    -[HMDMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, *MEMORY[0x24BDD6640]);

    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAction uuid](v10, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HMDMediaPlaybackAction state](v10, "state");
      -[HMDMediaPlaybackAction mediaProfiles](v10, "mediaProfiles");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaPlaybackAction playbackArchive](v10, "playbackArchive");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v26 = v12;
      v27 = 2112;
      v28 = v14;
      v29 = 2048;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@XPC Encoded Playback action uuid %@ state %tu profiles %@ playbackArchive %@", buf, 0x34u);

LABEL_6:
    }
  }
  else
  {
    -[HMDMediaPlaybackAction profileUUIDs](self, "profileUUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("HDMPA.profileUUIDs"));

    v9 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAction uuid](v19, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMDMediaPlaybackAction state](v19, "state");
      -[HMDMediaPlaybackAction profileUUIDs](v19, "profileUUIDs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v12;
      v27 = 2112;
      v28 = v21;
      v29 = 2048;
      v30 = v22;
      v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Cloud Encoded Playback action uuid %@ state %tu profiles %@", buf, 0x2Au);

      goto LABEL_6;
    }
  }

  objc_autoreleasePoolPop(v9);
}

- (HMDMediaPlaybackAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDMediaPlaybackAction *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  HMDMediaPlaybackAction *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v13 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      objc_msgSend(v15, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "profiles");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __59__HMDMediaPlaybackAction_initWithModelObject_parent_error___block_invoke;
      v46[3] = &unk_24E797670;
      v18 = v16;
      v47 = v18;
      objc_msgSend(v17, "na_map:", v46);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "count"))
      {
        v42 = v19;
        v44 = v15;
        v41 = v18;
        v20 = objc_msgSend(v19, "count");
        objc_msgSend(v12, "profiles");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v20 != v22)
        {
          v23 = (void *)MEMORY[0x227676638]();
          v24 = self;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "profiles");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v49 = v26;
            v50 = 2112;
            v51 = v42;
            v52 = 2112;
            v53 = v27;
            _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Couldn't find all media profiles on the home, found: %@ from UUIDs: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v23);
        }
        objc_msgSend(v12, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "state");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "integerValue");
        objc_msgSend(v12, "volume");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "encodedPlaybackArchive");
        v32 = v9;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v42;
        self = -[HMDMediaPlaybackAction initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:](self, "initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:", v28, v42, v30, v31, v33, v44);

        v9 = v32;
        v15 = v44;
        v34 = self;
        v18 = v41;
      }
      else
      {
        v35 = (void *)MEMORY[0x227676638]();
        self = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "profiles");
          v45 = v15;
          v38 = v19;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v37;
          v50 = 2112;
          v51 = v39;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find any media profiles in the home for the UUIDs: %@", buf, 0x16u);

          v19 = v38;
          v15 = v45;

          v35 = v43;
        }

        objc_autoreleasePoolPop(v35);
        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
          v34 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v34 = 0;
        }
      }

    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v34 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
    v34 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v6;
  HMDMediaPlaybackActionModel *v7;
  void *v8;
  void *v9;
  HMDMediaPlaybackActionModel *v10;
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

  if (a4 < 4)
  {
    v10 = 0;
  }
  else
  {
    -[HMDAction actionSet](self, "actionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [HMDMediaPlaybackActionModel alloc];
    -[HMDAction uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v9);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDMediaPlaybackAction state](self, "state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackActionModel setState:](v10, "setState:", v11);

    -[HMDMediaPlaybackAction volume](self, "volume");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackActionModel setVolume:](v10, "setVolume:", v12);

    -[HMDMediaPlaybackAction home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v6, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HMDMediaPlaybackAction profileUUIDs](self, "profileUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    -[HMDMediaPlaybackActionModel setProfiles:](v10, "setProfiles:", v15);

    -[HMDMediaPlaybackAction profileUUIDs](self, "profileUUIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    mapProfilesToAccessoryUUIDs(v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackActionModel setAccessories:](v10, "setAccessories:", v17);

    -[HMDMediaPlaybackAction profileUUIDs](self, "profileUUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    mapProfilesToServiceUUIDs(v13, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackActionModel setServices:](v10, "setServices:", v19);

    -[HMDMediaPlaybackAction playbackArchive](self, "playbackArchive");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackActionModel setEncodedPlaybackArchive:](v10, "setEncodedPlaybackArchive:", v20);

  }
  return v10;
}

- (id)modelObjectWithUpdatedMediaProfiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HMDAction modelObjectWithChangeType:](self, "modelObjectWithChangeType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDMediaPlaybackAction home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[HMDAction actionSet](self, "actionSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "home");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    __mapProfilesToProfileUUIDs(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProfiles:", v8);
    mapProfilesToAccessoryUUIDs(v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessories:", v9);

    mapProfilesToServiceUUIDs(v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setServices:", v10);

    v11 = v5;
  }

  return v5;
}

- (NSSet)mediaProfiles
{
  return self->_mediaProfiles;
}

- (void)setMediaProfiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
  objc_storeStrong((id *)&self->_volume, a3);
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setPlaybackArchive:(id)a3
{
  objc_storeStrong((id *)&self->_playbackArchive, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)encodePlaybackArchiveForExecution
{
  return self->_encodePlaybackArchiveForExecution;
}

- (void)setEncodePlaybackArchiveForExecution:(BOOL)a3
{
  self->_encodePlaybackArchiveForExecution = a3;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSSet)profileUUIDs
{
  return self->_profileUUIDs;
}

- (void)setProfileUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_profileUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUUIDs, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

id __59__HMDMediaPlaybackAction_initWithModelObject_parent_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  objc_msgSend(*(id *)(a1 + 32), "mediaProfileWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __47__HMDMediaPlaybackAction_associatedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

uint64_t __37__HMDMediaPlaybackAction_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

void __73__HMDMediaPlaybackAction_executeWithSource_clientName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v3;
    v10 = "%{public}@Failed to execute %@ with error: %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    v10 = "%{public}@Successfully executed %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 22;
  }
  _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v15, v13);

LABEL_7:
  objc_autoreleasePoolPop(v5);
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);

}

+ (HMDMediaPlaybackAction)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaPlaybackActionModel *v9;
  void *v10;
  void *v11;
  HMDMediaPlaybackActionModel *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDMediaPlaybackAction *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  HMDMediaPlaybackAction *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kActionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "unsignedIntegerValue") == 1)
  {
    v9 = [HMDMediaPlaybackActionModel alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v9, "initWithObjectChangeType:uuid:parentUUID:", 0, v10, v11);

    -[HMDMediaPlaybackActionModel loadModelWithActionInformation:](v12, "loadModelWithActionInformation:", v6);
    -[HMDMediaPlaybackActionModel profiles](v12, "profiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __66__HMDMediaPlaybackAction_actionWithDictionaryRepresentation_home___block_invoke;
    v42[3] = &unk_24E797670;
    v43 = v7;
    objc_msgSend(v13, "na_map:", v42);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      v41 = v8;
      v15 = objc_msgSend(v14, "count");
      -[HMDMediaPlaybackActionModel profiles](v12, "profiles");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v15 != v17)
      {
        v18 = (void *)MEMORY[0x227676638]();
        v19 = a1;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaPlaybackActionModel profiles](v12, "profiles");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v45 = v21;
          v46 = 2112;
          v47 = v14;
          v48 = 2112;
          v49 = v22;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Couldn't find all media profiles on the home, found: %@ from UUIDs: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
      }
      v23 = [HMDMediaPlaybackAction alloc];
      -[HMDBackingStoreModelObject uuid](v12, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaPlaybackActionModel state](v12, "state");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");
      -[HMDMediaPlaybackActionModel volume](v12, "volume");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaPlaybackActionModel encodedPlaybackArchive](v12, "encodedPlaybackArchive");
      v28 = v7;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[HMDMediaPlaybackAction initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:](v23, "initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:", v24, v14, v26, v27, v29, 0);

      v7 = v28;
      v8 = v41;
    }
    else
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = a1;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMediaPlaybackActionModel profiles](v12, "profiles");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v38;
        v46 = 2112;
        v47 = v39;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find any media profiles in the home for the UUIDs: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      v30 = 0;
    }

  }
  else
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = a1;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v34;
      v46 = 2112;
      v47 = v8;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Invalid action type: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    v30 = 0;
  }

  return v30;
}

+ (BOOL)isPlaybackActionValidWithProfiles:(id)a3 state:(int64_t)a4 volume:(id)a5
{
  id v7;
  id v8;
  float v9;
  BOOL v10;
  float v11;
  BOOL v12;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "floatValue");
  if (v9 >= -0.00000011921)
  {
    objc_msgSend(v8, "floatValue");
    v10 = v11 <= 100.0;
  }
  else
  {
    v10 = 0;
  }
  v12 = (unint64_t)a4 < 3 && v10;
  if (!objc_msgSend(v7, "count"))
    v12 = 0;

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_232175 != -1)
    dispatch_once(&logCategory__hmf_once_t24_232175, &__block_literal_global_52_232176);
  return (id)logCategory__hmf_once_v25_232177;
}

void __37__HMDMediaPlaybackAction_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_232177;
  logCategory__hmf_once_v25_232177 = v0;

}

id __66__HMDMediaPlaybackAction_actionWithDictionaryRepresentation_home___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  objc_msgSend(*(id *)(a1 + 32), "mediaProfileWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
