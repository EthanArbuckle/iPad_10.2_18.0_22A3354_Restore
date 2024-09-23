@implementation HMDMediaProfile

- (NSString)urlString
{
  void *v2;
  void *v3;

  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  id *v20;
  id *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  HMDMediaProfile *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[6];
  _QWORD v63[6];
  _BYTE buf[22];
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  _QWORD v69[5];

  v69[2] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (v4)
      {
        v8 = objc_alloc(MEMORY[0x24BDBCED8]);
        v63[0] = *MEMORY[0x24BE81F50];
        v62[0] = CFSTR("objectType");
        v62[1] = CFSTR("objectIdentifier");
        -[HMDMediaProfile urlString](self, "urlString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v63[1] = v9;
        v62[2] = CFSTR("objectHome");
        objc_msgSend(v6, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v63[2] = v10;
        v62[3] = CFSTR("objectHomeIdentifier");
        objc_msgSend(v6, "urlString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v63[3] = v11;
        v63[4] = self;
        v62[4] = CFSTR("objectReference");
        v62[5] = CFSTR("objectName");
        v63[5] = v4;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v8, "initWithDictionary:", v12);

        v14 = v3;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        objc_msgSend(v14, "category");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "categoryType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqual:", *MEMORY[0x24BDD49A0]);

        v58 = v4;
        v59 = v17;
        if ((v19 & 1) != 0)
        {
          v20 = (id *)MEMORY[0x24BE81FA0];
          v21 = (id *)MEMORY[0x24BE82050];
          goto LABEL_25;
        }
        objc_msgSend(v17, "categoryType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqual:", *MEMORY[0x24BDD49E0]);

        if ((v27 & 1) != 0)
        {
          v20 = (id *)MEMORY[0x24BE81FE0];
        }
        else
        {
          objc_msgSend(v17, "categoryType");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqual:", *MEMORY[0x24BDD4990]);

          if ((v30 & 1) != 0)
          {
            v20 = (id *)MEMORY[0x24BE81FA0];
            v21 = (id *)MEMORY[0x24BE82038];
            goto LABEL_25;
          }
          objc_msgSend(v17, "categoryType");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqual:", *MEMORY[0x24BDD4A30]);

          if ((v32 & 1) == 0)
          {
            objc_msgSend(v16, "siriEndpointProfile");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              v55 = v16;
              v38 = (void *)MEMORY[0x227676638]();
              v39 = self;
              HMFGetOSLogHandle();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v41;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v17;
                _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@MediaProfile with invalid accessory category: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v38);
              v57 = 0;
              v34 = 0;
              v16 = v55;
              goto LABEL_31;
            }
          }
          v20 = (id *)MEMORY[0x24BE81FA0];
        }
        v21 = (id *)MEMORY[0x24BE82130];
LABEL_25:
        v34 = *v21;
        v35 = *v20;
        v57 = v35;
        if (v34)
        {
          v36 = v59;
          if (v35)
          {
            v60[0] = CFSTR("objectServiceType");
            v60[1] = CFSTR("objectServiceSubType");
            v61[0] = v34;
            v61[1] = v35;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addEntriesFromDictionary:", v37);

          }
          goto LABEL_32;
        }
LABEL_31:
        v36 = v59;
LABEL_32:
        objc_msgSend(v14, "name");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v42, CFSTR("objectAccessory"));

        objc_msgSend(v14, "urlString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v43, CFSTR("objectAccessoryIdentifier"));

        v44 = v14;
        objc_msgSend(v44, "room");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "name");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          v56 = v34;
          v47 = v16;
          v48 = v13;
          objc_msgSend(v44, "home");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "name");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v46, "isEqualToString:", v50);

          if ((v51 & 1) != 0)
          {
            v52 = 0;
          }
          else
          {
            *(_QWORD *)buf = v46;
            v69[0] = CFSTR("objectRoom");
            v69[1] = CFSTR("objectRoomIdentifier");
            objc_msgSend(v45, "urlString");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf[8] = v53;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v69, 2);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v13 = v48;
          v16 = v47;
          v36 = v59;
          v34 = v56;
        }
        else
        {
          v52 = 0;
        }

        if (v52)
          objc_msgSend(v13, "addEntriesFromDictionary:", v52);
        v28 = (void *)objc_msgSend(v13, "copy");

        v4 = v58;
        goto LABEL_41;
      }
    }
  }
  v22 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v6, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    v65 = 2112;
    v66 = v25;
    v67 = 2112;
    v68 = v4;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because one of the properties of service is nil: service.accessory.home %@  service.accessory.home.name %@  service.name %@", buf, 0x2Au);
    if (v6)

  }
  objc_autoreleasePoolPop(v22);
  v28 = 0;
LABEL_41:

  return (NSDictionary *)v28;
}

- (NSString)mediaRouteID
{
  void *v2;
  void *v3;

  -[HMDAccessoryProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HMDMediaProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6 notificationCenter:(id)a7
{
  id v13;
  HMDMediaProfile *v14;
  HMDMediaProfile *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HMDMediaProfile;
  v14 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:workQueue:](&v17, sel_initWithAccessory_uniqueIdentifier_services_workQueue_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
  {
    v14->_lock.lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_notificationCenter, a7);
  }

  return v15;
}

- (HMDMediaProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDMediaProfile *v16;

  v10 = (void *)MEMORY[0x24BDD16D0];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDMediaProfile initWithAccessory:uniqueIdentifier:services:workQueue:notificationCenter:](self, "initWithAccessory:uniqueIdentifier:services:workQueue:notificationCenter:", v14, v13, v12, v11, v15);

  return v16;
}

- (HMDMediaProfile)initWithAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDMediaProfile *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "uniqueIdentifierFromAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:](self, "initWithAccessory:uniqueIdentifier:services:", v4, v5, 0);

  return v6;
}

- (void)configureWithMessageDispatcher:(id)a3 configurationTracker:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  NSObject *v14;
  HMDMediaProfile *v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    dispatch_group_enter(v7);
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMDMediaProfile_configureWithMessageDispatcher_configurationTracker___block_invoke;
  block[3] = &unk_24E79BBD0;
  v13 = v6;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)HMDMediaProfile;
  -[HMDAccessoryProfile registerForMessages](&v9, sel_registerForMessages);
  -[HMDAccessoryProfile msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  -[HMDAccessoryProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6728], self, v8, sel__handleSetPlayback_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD66F8], self, v8, sel__handleRefreshPlayback_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6720], self, v8, sel__handleMediaSessionSetAudioControl_);
  -[HMDMediaProfile unregisterForNotifications](self, "unregisterForNotifications");
  -[HMDMediaProfile registerForNotifications](self, "registerForNotifications");

}

- (void)registerForNotifications
{
  void *v3;
  id v4;

  -[HMDMediaProfile notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleSessionPlaybackStateUpdatedNotification_, CFSTR("HMDMediaSessionDidUpdatePlaybackStateNotification"), 0);

  -[HMDMediaProfile notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleSessionVolumeUpdatedNotification_, *MEMORY[0x24BE65A10], 0);

}

- (void)unregisterForNotifications
{
  void *v3;
  id v4;

  -[HMDMediaProfile notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("HMDMediaSessionDidUpdatePlaybackStateNotification"), 0);

  -[HMDMediaProfile notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE65A10], 0);

}

- (HMEEventForwarder)eventForwarder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaProfile *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventForwarder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to get event forwarder for accessory: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return (HMEEventForwarder *)v5;
}

- (unint64_t)capability
{
  return 0;
}

- (HMDMediaSession)mediaSession
{
  hmf_unfair_data_lock_s *p_lock;
  HMDMediaSession *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mediaSession;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setMediaSession:(id)a3
{
  hmf_unfair_data_lock_s *p_lock;
  HMDMediaSession **p_mediaSession;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_mediaSession = &self->_mediaSession;
  if ((HMFEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_mediaSession, a3);
  os_unfair_lock_unlock(&p_lock->lock);

}

- (BOOL)_updatePlayback:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[HMDMediaProfile mediaSession](self, "mediaSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isConnected");
  if (v6)
    objc_msgSend(v5, "handleSetPlayback:", v4);

  return v6;
}

- (void)_handleSetPlayback:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[HMDMediaProfile _updatePlayback:](self, "_updatePlayback:"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "respondWithError:", v4);

  }
}

- (BOOL)_updateRefreshPlayback:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[HMDMediaProfile mediaSession](self, "mediaSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isConnected");
  if (v6)
    objc_msgSend(v5, "handleRefreshPlayback:", v4);

  return v6;
}

- (void)_handleRefreshPlayback:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[HMDMediaProfile _updateRefreshPlayback:](self, "_updateRefreshPlayback:"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "respondWithError:", v4);

  }
}

- (BOOL)_updateAudioControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMediaProfile *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaProfile mediaSession](self, "mediaSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "handleMediaSessionSetAudioControl:", v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@No session for mediaProfile", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v6 != 0;
}

- (void)_handleMediaSessionSetAudioControl:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[HMDMediaProfile _updateAudioControl:](self, "_updateAudioControl:"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "respondWithError:", v4);

  }
}

- (void)_handleMediaResponses:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDMediaProfile *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMDMediaProfile__handleMediaResponses_message___block_invoke;
  block[3] = &unk_24E79BBD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)updateWithResponses:(id)a3 requestMessageInformation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDMediaProfile *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  HMDMediaProfile *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[HMDAccessoryProfile workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__HMDMediaProfile_updateWithResponses_requestMessageInformation___block_invoke;
    block[3] = &unk_24E79BBD0;
    v14 = v6;
    v15 = self;
    v16 = v7;
    dispatch_async(v8, block);

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
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Skipping updating media profile due to empty response array", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_sessionPlaybackStateUpdated:(id)a3 notifyXPCClients:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  HMDMediaProfile *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  unsigned __int8 v12;
  HMDMediaSessionState *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v21;
  id v22;
  __CFString *v23;
  void *v24;
  HMDMediaProfile *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDMediaSessionState *v29;
  HMDMediaSessionState *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  HMDMediaSessionState *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  HMDMediaSessionState *v41;
  uint64_t v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  float v47;
  float v48;
  float v49;
  HMDMediaSessionState *v50;
  void *v51;
  void *v52;
  char v53;
  HMDMediaSessionState *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  BOOL v61;
  int v62;
  __CFString *v63;
  void *v64;
  HMDMediaProfile *v65;
  NSObject *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  BOOL v73;
  id v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  BOOL v85;
  int v86;
  objc_class *v87;
  HMDMediaSessionState *v88;
  void *v89;
  double v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  double v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  HMDMediaSessionState *v129;
  HMDMediaSessionState *v130;
  HMDMediaSessionState *v131;
  HMDMediaSessionState *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  id v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  BOOL v143;
  id v144;
  id v145;
  id v147;
  id v148;
  void *v149;
  HMDMediaSessionState *v150;
  void *v151;
  __CFString *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  unsigned __int8 v161;
  uint8_t buf[4];
  void *v163;
  __int16 v164;
  __CFString *v165;
  __int16 v166;
  void *v167;
  __int16 v168;
  void *v169;
  __int16 v170;
  void *v171;
  __int16 v172;
  void *v173;
  __int16 v174;
  void *v175;
  __int16 v176;
  void *v177;
  __int16 v178;
  void *v179;
  uint64_t v180;

  v180 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("session-state-changed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "BOOLValue");
    HMFBooleanToString();
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v163 = v10;
    v164 = 2112;
    v165 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@_sessionPlaybackStateUpdated with HMDMediaProfileHasMediaSessionStateChangedKey: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
    v12 = objc_msgSend(v6, "BOOLValue");
  else
    v12 = 0;
  v161 = v12;
  -[HMDMediaProfile mediaSession](v8, "mediaSession");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "state");
  v13 = (HMDMediaSessionState *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile accessory](v8, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v14;
  if (v13)
  {
    v143 = 1;
  }
  else
  {
    v15 = v14;
    if (v8)
    {
      objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x24BDD66B8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryProfile uniqueIdentifier](v8, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "isEqualToString:", v18);

      if (v19)
      {
        objc_msgSend(v15, "identifier");
        v20 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v20;
      }
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v155, "mediaSessionStateWithIdentifier:", v16);
    v13 = (HMDMediaSessionState *)objc_claimAutoreleasedReturnValue();
    v143 = v13 != 0;
    if (!v13)
    {
      v21 = v155;
      v22 = v15;
      v23 = v16;
      if (v8)
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = v8;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v141 = v6;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "identifier");
          v159 = v22;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v163 = v27;
          v164 = 2112;
          v165 = v23;
          v166 = 2112;
          v167 = v28;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Creating a media session state for a remote session (sessionIdentifier %@; accessoryIdentifier %@) update",
            buf,
            0x20u);

          v22 = v159;
          v6 = v141;
        }

        objc_autoreleasePoolPop(v24);
        v13 = -[HMDMediaSessionState initWithSessionIdentifier:]([HMDMediaSessionState alloc], "initWithSessionIdentifier:", v23);
        objc_msgSend(v21, "addMediaSessionState:", v13);
      }
      else
      {
        v13 = 0;
      }

      v161 = 1;
      v14 = v151;
    }

  }
  -[HMDMediaProfile parseAndSetPlaybackStateFromResponsePayload:mediaSessionState:outDidUpdateMediaSessionState:](v8, "parseAndSetPlaybackStateFromResponsePayload:mediaSessionState:outDidUpdateMediaSessionState:", v5, v13, &v161);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13;
  v30 = v29;
  v31 = (_QWORD *)MEMORY[0x24BDD6708];
  v32 = (_QWORD *)MEMORY[0x24BDD6758];
  v33 = (_QWORD *)MEMORY[0x24BDD66C8];
  if (v8)
  {
    objc_msgSend(v5, "hmf_numberForKey:", *MEMORY[0x24BDD6738]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedIntegerValue");
    v158 = v34;
    if (v34)
    {
      v36 = v35;
      if (v35 != -[HMDMediaSessionState shuffleState](v30, "shuffleState"))
      {
        -[HMDMediaSessionState setShuffleState:](v30, "setShuffleState:", v36);
        v161 = 1;
      }
    }
    else
    {
      v158 = 0;
    }

    v37 = v30;
    objc_msgSend(v5, "hmf_numberForKey:", *v31);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "unsignedIntegerValue");
    v157 = v38;
    if (v38)
    {
      v40 = v39;
      if (v39 != -[HMDMediaSessionState repeatState](v37, "repeatState"))
      {
        -[HMDMediaSessionState setRepeatState:](v37, "setRepeatState:", v40);
        v161 = 1;
      }
    }
    else
    {
      v157 = 0;
    }

    v41 = v37;
    objc_msgSend(v5, "hmf_numberForKey:", *v32);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    if (v160)
    {
      -[HMDMediaSessionState volume](v41, "volume");
      v42 = objc_claimAutoreleasedReturnValue();
      if (!v42)
        goto LABEL_30;
      v43 = (void *)v42;
      objc_msgSend(v160, "floatValue");
      v45 = v44;
      -[HMDMediaSessionState volume](v41, "volume");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "floatValue");
      v48 = vabds_f32(v45, v47);
      v49 = *MEMORY[0x24BDD7AF0];

      if (v48 > v49)
      {
LABEL_30:
        -[HMDMediaSessionState setVolume:](v41, "setVolume:", v160);
        v161 = 1;
      }
    }
    else
    {
      v160 = 0;
    }

    v50 = v41;
    objc_msgSend(v5, "hmf_stringForKey:", *v33);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      -[HMDMediaSessionState mediaUniqueIdentifier](v50, "mediaUniqueIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqualToString:", v52);

      if ((v53 & 1) == 0)
      {
        -[HMDMediaSessionState setMediaUniqueIdentifier:](v50, "setMediaUniqueIdentifier:", v51);
        v161 = 1;
      }
    }

    v54 = v50;
    objc_msgSend(v5, "hmf_numberForKey:", *MEMORY[0x24BDD6748]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "unsignedIntegerValue");
    if (v55)
    {
      v57 = v56;
      if (v56 != -[HMDMediaSessionState sleepWakeState](v54, "sleepWakeState"))
      {
        -[HMDMediaSessionState setSleepWakeState:](v54, "setSleepWakeState:", v57);
        v161 = 1;
      }
    }
  }
  else
  {

    v129 = v30;
    v130 = v129;

    v131 = v130;
    v132 = v131;
    v51 = 0;
    v157 = 0;
    v158 = 0;
    v160 = 0;
    v55 = 0;
  }
  v150 = v30;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD6710]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v59 = v58;
  else
    v59 = 0;
  v60 = v59;

  objc_msgSend(v60, "messageIdentifier");
  v153 = v60;
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if (v161)
    v61 = 0;
  else
    v61 = v60 == 0;
  v62 = !v61;
  v63 = CFSTR(", state has not changed so not notifying clients");
  if (!v61)
    v63 = CFSTR("state has changed, notifying clients");
  v152 = v63;
  v64 = (void *)MEMORY[0x227676638]();
  v65 = v8;
  HMFGetOSLogHandle();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    v163 = v67;
    v164 = 2112;
    v165 = v152;
    v166 = 2112;
    v167 = v156;
    v168 = 2112;
    v169 = v158;
    v170 = 2112;
    v171 = v157;
    v172 = 2112;
    v173 = v160;
    v174 = 2112;
    v175 = v51;
    v176 = 2112;
    v177 = v154;
    v178 = 2112;
    v179 = v55;
    _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_INFO, "%{public}@_sessionPlaybackStateUpdated, %@, p:%@ s:%@ r:%@ v:%@ m:%@, requestMessageID: %@, sleepWakeState: %@", buf, 0x5Cu);

    v14 = v151;
  }

  objc_autoreleasePoolPop(v64);
  if (v62)
  {
    v68 = v161;
    if (v161)
    {
      v69 = v156;
      if (v8)
      {
        -[HMDMediaProfile payloadForUpdatedPlaybackState:shuffleStateNumber:repeatStateNumber:volume:sleepWakeStateNumber:mediaUniqueIdentifier:](v65, v156, v158, v157, v160, v55, v51);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMediaProfile notificationCenter](v65, "notificationCenter");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "postNotificationName:object:userInfo:", HMDMediaProfileHasMediaSessionStateChangedNotificationName, v65, v70);

        v68 = v161;
      }
      v72 = v68 != 0;
    }
    else
    {
      v72 = 0;
      v69 = v156;
    }
    v142 = v6;
    if (a4 || v72)
    {
      if (v8)
      {
        v74 = v154;
        -[HMDMediaProfile payloadForUpdatedPlaybackState:shuffleStateNumber:repeatStateNumber:volume:sleepWakeStateNumber:mediaUniqueIdentifier:](v65, v69, v158, v157, v160, v55, v51);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)MEMORY[0x24BE3F1D0];
        v77 = *MEMORY[0x24BDD66E8];
        v78 = (void *)objc_msgSend(v75, "copy");
        objc_msgSend(v76, "entitledMessageWithName:identifier:messagePayload:", v77, v74, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = objc_alloc(MEMORY[0x24BE3F1B8]);
        -[HMDAccessoryProfile uniqueIdentifier](v65, "uniqueIdentifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)objc_msgSend(v80, "initWithTarget:", v81);
        objc_msgSend(v79, "setDestination:", v82);

        -[HMDAccessoryProfile msgDispatcher](v65, "msgDispatcher");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)objc_msgSend(v79, "copy");
        objc_msgSend(v83, "sendMessage:", v84);

        v69 = v156;
        v68 = v161;
      }
      v73 = v68 == 0;
      v6 = v142;
      v14 = v151;
    }
    else
    {
      v73 = 1;
    }
    v85 = v143;
    if (v69)
      v85 = 0;
    if (v160)
      v85 = 0;
    if (v51)
      v85 = 0;
    if (v158)
      v85 = 0;
    if (v157)
      v85 = 0;
    if (!v73 && !v85)
    {
      v86 = objc_msgSend(v14, "isCurrentAccessory");
      if (v14)
      {
        if (v86 && v155 && v8)
        {
          v87 = (objc_class *)MEMORY[0x24BDD73B0];
          v144 = v155;
          v147 = v14;
          v88 = v150;
          v138 = [v87 alloc];
          -[HMDMediaSessionState mediaUniqueIdentifier](v88, "mediaUniqueIdentifier");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaSessionState volume](v88, "volume");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "doubleValue");
          v91 = v90;
          v92 = -[HMDMediaSessionState playbackState](v88, "playbackState");
          v93 = -[HMDMediaSessionState shuffleState](v88, "shuffleState");
          v94 = -[HMDMediaSessionState repeatState](v88, "repeatState");

          v139 = (void *)objc_msgSend(v138, "initWithMediaIdentifier:volume:playbackState:shuffleState:repeatState:", v135, v92, v93, v94, v91);
          objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
          v96 = v95;
          v97 = objc_alloc(MEMORY[0x24BE4ED90]);
          objc_msgSend(v147, "uuid");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "UUIDString");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = (void *)objc_msgSend(v97, "initWithSource:cachePolicy:combineType:timestamp:", v99, 2, 2, v96);

          v100 = objc_alloc(MEMORY[0x24BE4ED80]);
          objc_msgSend(v139, "protoData");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = (void *)objc_msgSend(v100, "initWithEventData:metadata:", v101, v136);

          v102 = (void *)MEMORY[0x24BDD73A0];
          v103 = *MEMORY[0x24BDD4BA0];
          objc_msgSend(v144, "uuid");
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v147, "uuid");
          v105 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v102, "topicFromSuffixID:homeUUID:accessoryUUID:", v103, v104, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v142;
          v14 = v151;
          -[HMDMediaProfile eventForwarder](v65, "eventForwarder");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "forwardEvent:topic:completion:", v133, v106, 0);

        }
      }
    }
    if (!v153
      || (objc_msgSend(v155, "primaryResident"),
          v108 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v108, "device"),
          v109 = (void *)objc_claimAutoreleasedReturnValue(),
          v110 = objc_msgSend(v109, "isCurrentDevice"),
          v109,
          v108,
          v110))
    {
      v148 = v156;
      v145 = v158;
      v140 = v157;
      v137 = v160;
      v111 = v55;
      v134 = v51;
      v112 = v111;
      if (v8)
      {
        v113 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        if (v156)
        {
          +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", *MEMORY[0x24BDD66E0], v65);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v115, v148, v114);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "addObject:", v116);

          v111 = v112;
        }
        if (v158)
        {
          +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", *MEMORY[0x24BDD6738], v65);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v117, v145, v114);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "addObject:", v118);

          v111 = v112;
        }
        if (v157)
        {
          +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", *MEMORY[0x24BDD6708], v65);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v119, v140, v114);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "addObject:", v120);

          v111 = v112;
        }
        if (v160)
        {
          +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", *MEMORY[0x24BDD6758], v65);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v121, v137, v114);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "addObject:", v122);

          v111 = v112;
        }
        if (v51)
        {
          +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", *MEMORY[0x24BDD66C8], v65);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v123, v134, v114);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "addObject:", v124);

          v111 = v112;
        }
        if (v111)
        {
          +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", *MEMORY[0x24BDD6748], v65);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v125, v111, v114);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "addObject:", v126);

        }
        v127 = (void *)objc_msgSend(v113, "copy", v134);

      }
      else
      {
        v127 = 0;
      }

      v6 = v142;
      v14 = v151;
      if (objc_msgSend(v127, "count"))
      {
        v128 = (void *)objc_msgSend(v127, "copy");
        objc_msgSend(v155, "notifyRemoteUsersOfChangedProperties:requestMessageInformation:", v128, v153);

      }
    }
  }

}

- (id)parseAndSetPlaybackStateFromResponsePayload:(id)a3 mediaSessionState:(id)a4 outDidUpdateMediaSessionState:(BOOL *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = a4;
  objc_msgSend(a3, "hmf_numberForKey:", *MEMORY[0x24BDD66E0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  if (v8)
  {
    v10 = v9;
    if (v9 != objc_msgSend(v7, "playbackState"))
    {
      objc_msgSend(v7, "setPlaybackState:", v10);
      *a5 = 1;
    }
  }

  return v8;
}

- (void)handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__HMDMediaProfile_handleSetValue_withRequestProperty_withCompletionHandler___block_invoke;
  v15[3] = &unk_24E79B3F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  HMDMediaProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryProfile accessory](v12, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v14;
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@The accessory %@ does not support _handleSetValue:", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
  {
    +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", v9, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMediaPropertyResponse serializeResponses:](HMDMediaPropertyResponse, "serializeResponses:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v20);

  }
}

- (void)handleSessionUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDMediaProfile *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  HMDMediaProfile *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x24BDD6750]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);
  -[HMDMediaProfile mediaSession](self, "mediaSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if ((v9 & 1) != 0)
  {
    LODWORD(v10) = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("force-notify"));
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD6710]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
      v10 = 1;
    else
      v10 = v10;
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = &stru_24E79DB48;
      v26 = 138543874;
      v27 = v17;
      v28 = 2112;
      if ((_DWORD)v10)
        v18 = CFSTR(" - force notifying clients on remote notification");
      v29 = v5;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Got a playback state update for media session %@%@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDMediaProfile _sessionPlaybackStateUpdated:notifyXPCClients:](v15, "_sessionPlaybackStateUpdated:notifyXPCClients:", v4, v10);

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaProfile mediaSession](v20, "mediaSession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v26 = 138544130;
      v27 = v22;
      v28 = 2112;
      v29 = v5;
      v30 = 2112;
      v31 = v25;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Media session %@ playback notification does not match our media session:%@ ui:%@", (uint8_t *)&v26, 0x2Au);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)handleSessionPlaybackStateUpdatedNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("session-state-changed"));
  -[HMDMediaProfile handleSessionUpdatedNotification:](self, "handleSessionUpdatedNotification:", v5);

}

- (void)handleSessionVolumeUpdatedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int IsLocalOrigin;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
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
  _QWORD v36[8];
  _QWORD v37[10];

  v37[8] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaProfile mediaSession](self, "mediaSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE65A08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || !v6)
  {

LABEL_10:
    goto LABEL_11;
  }
  IsLocalOrigin = MROriginIsLocalOrigin();

  if (IsLocalOrigin)
  {
    objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x24BE65A18]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v5, "state");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mediaUniqueIdentifier");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        v15 = &stru_24E79DB48;
        if (v13)
          v15 = (__CFString *)v13;
        v16 = v15;

        v36[0] = *MEMORY[0x24BDD6750];
        objc_msgSend(v5, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "UUIDString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v34;
        v36[1] = *MEMORY[0x24BDD66E0];
        v17 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "state");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v33, "playbackState"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v32;
        v36[2] = *MEMORY[0x24BDD6738];
        v18 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "state");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v31, "shuffleState"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v30;
        v36[3] = *MEMORY[0x24BDD6708];
        v19 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "state");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "repeatState"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *MEMORY[0x24BDD6758];
        v37[3] = v21;
        v37[4] = v7;
        v23 = *MEMORY[0x24BDD66C8];
        v36[4] = v22;
        v36[5] = v23;
        v37[5] = v16;
        v37[6] = MEMORY[0x24BDBD1C8];
        v24 = v16;
        v25 = *MEMORY[0x24BDD6748];
        v36[6] = CFSTR("force-notify");
        v36[7] = v25;
        v26 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "state");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "sleepWakeState"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37[7] = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 8);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDMediaProfile handleSessionUpdatedNotification:](self, "handleSessionUpdatedNotification:", v29);
      }
    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)sessionAudioControlUpdated:(id)a3
{
  void *v4;
  void *v5;
  HMDMediaProfile *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HMDMediaProfile *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  objc_msgSend(v29, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@sessionAudioControlUpdated %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD6710]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "messageIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDD66B0];
  objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x24BDD66B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDD6698];
  objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x24BDD6698]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18 = v17;
  if (v14)
    objc_msgSend(v17, "setValue:forKey:", v14, v13);
  if (v16)
    objc_msgSend(v18, "setValue:forKey:", v16, v15);
  v19 = (void *)MEMORY[0x227676638]();
  v20 = v6;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v22;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Notify clients of updated audio control state", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(MEMORY[0x24BE3F1D0], "entitledMessageWithName:identifier:messagePayload:", *MEMORY[0x24BDD66A0], v12, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDAccessoryProfile uniqueIdentifier](v20, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithTarget:", v25);
  objc_msgSend(v23, "setDestination:", v26);

  -[HMDAccessoryProfile msgDispatcher](v20, "msgDispatcher");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v27, "sendMessage:completionHandler:", v28, 0);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaSession *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDMediaSession *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaProfile;
  -[HMDAccessoryProfile encodeWithCoder:](&v22, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "getUUIDBytes:", objc_msgSend(v7, "mutableBytes"));

  v8 = (void *)MEMORY[0x24BDD1880];
  +[HMDMediaProfile namespace](HMDMediaProfile, "namespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_UUIDWithNamespace:data:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, *MEMORY[0x24BDD6688]);

  -[HMDMediaProfile mediaSession](self, "mediaSession");
  v12 = (HMDMediaSession *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile accessory](self, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mediaSessionStateWithIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12 && v17)
    {
      if (objc_msgSend(v4, "hmd_isForXPCTransport"))
      {
        v18 = [HMDMediaSession alloc];
        v23[0] = self;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[HMDMediaSession initWithEndpoint:mediaProfiles:state:](v18, "initWithEndpoint:mediaProfiles:state:", 0, v19, v17);

      }
      else
      {
        v12 = 0;
      }
    }
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v12, *MEMORY[0x24BDD6680]);
  objc_msgSend(v14, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, *MEMORY[0x24BDD6678]);

  v21 = -[HMDMediaProfile capability](self, "capability");
  objc_msgSend(v4, "encodeInteger:forKey:", v21, *MEMORY[0x24BDD6670]);

}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HMDAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@<name %@ identifier %@ uniqueIdentifier %@>"), v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_mediaSession, 0);
}

uint64_t __76__HMDMediaProfile_handleSetValue_withRequestProperty_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSetValue:withRequestProperty:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)payloadForUpdatedPlaybackState:(void *)a3 shuffleStateNumber:(void *)a4 repeatStateNumber:(void *)a5 volume:(void *)a6 sleepWakeStateNumber:(void *)a7 mediaUniqueIdentifier:
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v13 = (objc_class *)MEMORY[0x24BDBCED8];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = a2;
  v20 = (void *)objc_msgSend([v13 alloc], "initWithCapacity:", 7);
  objc_msgSend(a1, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setValue:forKey:", v22, *MEMORY[0x24BDD6750]);

  objc_msgSend(v20, "setValue:forKey:", v19, *MEMORY[0x24BDD66E0]);
  objc_msgSend(v20, "setValue:forKey:", v18, *MEMORY[0x24BDD6738]);

  objc_msgSend(v20, "setValue:forKey:", v17, *MEMORY[0x24BDD6708]);
  objc_msgSend(v20, "setValue:forKey:", v16, *MEMORY[0x24BDD6758]);

  objc_msgSend(v20, "setValue:forKey:", v14, *MEMORY[0x24BDD66C8]);
  objc_msgSend(v20, "setValue:forKey:", v15, *MEMORY[0x24BDD6748]);

  v23 = (void *)objc_msgSend(v20, "copy");
  return v23;
}

void __65__HMDMediaProfile_updateWithResponses_requestMessageInformation___block_invoke(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v40 = v5;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating media profile with responses %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = objc_msgSend(v7, "count");
  if (*(_QWORD *)(a1 + 48))
    v10 = v9 + 1;
  else
    v10 = v9;
  objc_msgSend(v8, "dictionaryWithCapacity:", v10);
  v31 = a1;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = *(id *)(a1 + 32);
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v35;
    v15 = *MEMORY[0x24BDD66B8];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v17, "request");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "property");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDMediaSession mediaPropertyMessageKeys](HMDMediaSession, "mediaPropertyMessageKeys");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "containsObject:", v19);

        if (v21)
        {
          objc_msgSend(v17, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDMediaSession mediaPropertyValueTypeWithMessageKey:](HMDMediaSession, "mediaPropertyValueTypeWithMessageKey:", v19);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v22;
          else
            v23 = 0;
          objc_msgSend(v32, "setValue:forKey:", v23, v19);

        }
        objc_msgSend(v18, "property");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqual:", v15);

        if (v25)
        {
          objc_msgSend(v17, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;
          v28 = v27;

          v13 = v28;
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  if (objc_msgSend(v32, "count"))
  {
    objc_msgSend(v32, "setValue:forKey:", *(_QWORD *)(v31 + 48), *MEMORY[0x24BDD6710]);
    objc_msgSend(v32, "setValue:forKey:", v13, *MEMORY[0x24BDD66B8]);
    v29 = *(void **)(v31 + 40);
    v30 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v29, "_sessionPlaybackStateUpdated:notifyXPCClients:", v30, 1);

  }
}

void __49__HMDMediaProfile__handleMediaResponses_message___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  HMDMediaSessionRequestMessageInformation *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  HMDMediaSessionRequestMessageInformation *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  char v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  HMDMediaSessionRequestMessageInformation *v54;
  _BYTE v55[128];
  uint64_t v56;

  v1 = a1;
  v56 = *MEMORY[0x24BDAC8D0];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = *(id *)(a1 + 32);
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (!v37)
    goto LABEL_28;
  v2 = *(_QWORD *)v49;
  v36 = *MEMORY[0x24BDD6710];
  v3 = *MEMORY[0x24BDD66E0];
  v32 = *(_QWORD *)v49;
  v33 = v1;
  v40 = *MEMORY[0x24BDD66B8];
  do
  {
    for (i = 0; i != v37; ++i)
    {
      v5 = v2;
      if (*(_QWORD *)v49 != v2)
        objc_enumerationMutation(obj);
      v41 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      objc_msgSend(v41, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mediaProfile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 40), "uniqueIdentifier");
      v10 = v1;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqual:", v11);

      v1 = v10;
      v13 = v6;

      v2 = v5;
      if (!v12)
        goto LABEL_26;
      v35 = i;
      v14 = -[HMDMediaSessionRequestMessageInformation initWithMessage:]([HMDMediaSessionRequestMessageInformation alloc], "initWithMessage:", *(_QWORD *)(v10 + 48));
      v53 = v36;
      v54 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v15, "mutableCopy");

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v16 = v41;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (!v17)
      {

        goto LABEL_25;
      }
      v18 = v17;
      v34 = v14;
      v39 = 0;
      v19 = *(_QWORD *)v45;
      v42 = *(_QWORD *)v45;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v21, "request");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "property");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqual:", v3);

          if (v24)
          {
            objc_msgSend(v21, "error");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {

LABEL_30:
              v30 = *(void **)(v33 + 48);
              objc_msgSend(v21, "error");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "respondWithError:", v31);

              return;
            }
            objc_msgSend(v21, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
              goto LABEL_30;
            objc_msgSend(v21, "value");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKey:", v27, v3);
            v39 = 1;
            goto LABEL_18;
          }
          objc_msgSend(v22, "property");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqual:", v40);

          if (v29)
          {
            objc_msgSend(v21, "value");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKey:", v27, v40);
            v19 = v42;
LABEL_18:

            goto LABEL_20;
          }
          v19 = v42;
LABEL_20:

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v18)
          continue;
        break;
      }

      v1 = v33;
      v14 = v34;
      if ((v39 & 1) != 0)
        objc_msgSend(*(id *)(v33 + 40), "_sessionPlaybackStateUpdated:notifyXPCClients:", v43, 1);
LABEL_25:

      v2 = v32;
      i = v35;
LABEL_26:

    }
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  }
  while (v37);
LABEL_28:

  objc_msgSend(*(id *)(v1 + 48), "respondWithSuccess");
}

void __71__HMDMediaProfile_configureWithMessageDispatcher_configurationTracker___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  objc_super v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)HMDMediaProfile;
  objc_msgSendSuper2(&v5, sel_configureWithMessageDispatcher_configurationTracker_, v3, v2);
  v4 = *(NSObject **)(a1 + 40);
  if (v4)
    dispatch_group_leave(v4);
}

+ (id)namespace
{
  if (namespace_onceToken_219699 != -1)
    dispatch_once(&namespace_onceToken_219699, &__block_literal_global_219700);
  return (id)namespace_namespace_219701;
}

+ (id)sessionNamespace
{
  if (sessionNamespace_onceToken != -1)
    dispatch_once(&sessionNamespace_onceToken, &__block_literal_global_8_219696);
  return (id)sessionNamespace_sessionNamespace;
}

+ (id)uniqueIdentifierFromAccessoryUUID:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCEC8];
  v4 = a3;
  objc_msgSend(v3, "dataWithLength:", 16);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  v6 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend((id)objc_opt_class(), "namespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)uniqueIdentifierFromAccessory:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifierFromAccessoryUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_219691 != -1)
    dispatch_once(&logCategory__hmf_once_t0_219691, &__block_literal_global_10_219692);
  return (id)logCategory__hmf_once_v1_219693;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __30__HMDMediaProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_219693;
  logCategory__hmf_once_v1_219693 = v0;

}

void __35__HMDMediaProfile_sessionNamespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("B93C6A7F-75EF-4A55-B3BC-8C09CACC301C"));
  v1 = (void *)sessionNamespace_sessionNamespace;
  sessionNamespace_sessionNamespace = v0;

}

void __28__HMDMediaProfile_namespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("7B3B12CE-F1D8-49D9-A573-4AB2D944B077"));
  v1 = (void *)namespace_namespace_219701;
  namespace_namespace_219701 = v0;

}

@end
