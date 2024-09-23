@implementation ANAnnouncementCoordinator

- (ANAnnouncementCoordinator)init
{
  ANAnnouncementCoordinator *v2;
  uint64_t v3;
  OS_os_log *log;
  uint64_t v5;
  ANCompanionConnection *companionConnection;
  uint64_t v7;
  ANAnnouncementStatePublisher *playbackStatePublisher;
  uint64_t v9;
  ANMessenger *messenger;
  uint64_t v11;
  NSMutableDictionary *announcementManagers;
  uint64_t v13;
  NSMutableDictionary *playbackManagers;
  uint64_t v15;
  NSMapTable *delegatesToQueues;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  _TtC14AnnounceDaemon31SiriReferenceResolutionDonation *siriRRDonation;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ANAnnouncementCoordinator;
  v2 = -[ANAnnouncementCoordinator init](&v22, sel_init);
  if (v2)
  {
    ANLogWithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_opt_new();
    companionConnection = v2->_companionConnection;
    v2->_companionConnection = (ANCompanionConnection *)v5;

    -[ANCompanionConnection setDelegate:](v2->_companionConnection, "setDelegate:", v2);
    v7 = objc_opt_new();
    playbackStatePublisher = v2->_playbackStatePublisher;
    v2->_playbackStatePublisher = (ANAnnouncementStatePublisher *)v7;

    v9 = objc_opt_new();
    messenger = v2->_messenger;
    v2->_messenger = (ANMessenger *)v9;

    -[ANMessenger setDelegate:](v2->_messenger, "setDelegate:", v2);
    v11 = objc_opt_new();
    announcementManagers = v2->_announcementManagers;
    v2->_announcementManagers = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    playbackManagers = v2->_playbackManagers;
    v2->_playbackManagers = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 517, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    delegatesToQueues = v2->_delegatesToQueues;
    v2->_delegatesToQueues = (NSMapTable *)v15;

    v17 = dispatch_queue_create("com.apple.announce.coordinatorQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v17;

    v19 = objc_opt_new();
    siriRRDonation = v2->_siriRRDonation;
    v2->_siriRRDonation = (_TtC14AnnounceDaemon31SiriReferenceResolutionDonation *)v19;

    -[ANAnnouncementCoordinator _initializeManagers](v2, "_initializeManagers");
  }
  return v2;
}

+ (id)sharedCoordinator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ANAnnouncementCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_onceToken != -1)
    dispatch_once(&sharedCoordinator_onceToken, block);
  return (id)sharedCoordinator_sharedCoordinator;
}

void __46__ANAnnouncementCoordinator_sharedCoordinator__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCoordinator_sharedCoordinator;
  sharedCoordinator_sharedCoordinator = v0;

}

+ (NSUUID)localDeviceIdentifier
{
  if (localDeviceIdentifier_onceToken != -1)
    dispatch_once(&localDeviceIdentifier_onceToken, &__block_literal_global_16);
  return (NSUUID *)(id)localDeviceIdentifier_identifier;
}

void __50__ANAnnouncementCoordinator_localDeviceIdentifier__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v1 = objc_msgSend(v0, "initWithUUIDString:", *MEMORY[0x1E0CF7CC8]);
  v2 = (void *)localDeviceIdentifier_identifier;
  localDeviceIdentifier_identifier = v1;

}

- (void)_initializeManagers
{
  NSObject *v3;
  _QWORD block[5];

  -[ANAnnouncementCoordinator queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ANAnnouncementCoordinator__initializeManagers__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __48__ANAnnouncementCoordinator__initializeManagers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  +[ANAnnouncementStorageManager sharedManager](ANAnnouncementStorageManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v4, "deleteAnnouncementsExcludingAnnouncementsForEndpointIDs:", v5);

  objc_msgSend(*(id *)(a1 + 32), "announcementManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = *(void **)(a1 + 32);
    +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v9, "_createAnnouncementManagerForIdentifier:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "playbackManagers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = *(void **)(a1 + 32);
    +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v15, "_createPlaybackManagerForIdentifier:", v16);

  }
}

- (id)_createAnnouncementManagerForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ANAnnouncementManager managerWithEndpointID:](ANAnnouncementManager, "managerWithEndpointID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

  return v6;
}

- (BOOL)_removeAnnouncementManagerForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setDelegate:", 0);
    objc_msgSend(v7, "removeAllAnnouncements");
    -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v4);

  }
  return v7 != 0;
}

- (id)_createPlaybackManagerForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ANPlaybackManager managerWithEndpointID:](ANPlaybackManager, "managerWithEndpointID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setDataSource:", self);
  -[ANAnnouncementCoordinator playbackManagers](self, "playbackManagers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

  return v6;
}

- (BOOL)_removePlaybackManagerForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ANAnnouncementCoordinator playbackManagers](self, "playbackManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setDelegate:", 0);
    objc_msgSend(v7, "setDataSource:", 0);
    -[ANAnnouncementCoordinator playbackManagers](self, "playbackManagers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v4);

  }
  return v7 != 0;
}

- (void)_removeManagersForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = a3;
  if (-[ANAnnouncementCoordinator _removeAnnouncementManagerForIdentifier:](self, "_removeAnnouncementManagerForIdentifier:", v4))
  {
    -[ANAnnouncementCoordinator log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Removed Announcement Manager", buf, 2u);
    }

  }
  if (-[ANAnnouncementCoordinator _removePlaybackManagerForIdentifier:](self, "_removePlaybackManagerForIdentifier:", v4))
  {
    -[ANAnnouncementCoordinator log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "Removed Playback Manager", v7, 2u);
    }

  }
}

- (id)_endpointIDForAnnouncementManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          v13 = v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_endpointIDForPlaybackManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[ANAnnouncementCoordinator playbackManagers](self, "playbackManagers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          v13 = v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)_handleReceivedAnnouncement:(id)a3
{
  NSObject *v4;
  void *v5;
  OpaqueCMClock *HostTimeClock;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  CMTimeValue value;
  uint64_t v18;
  uint64_t i;
  void *v20;
  CMTimeFlags v21;
  int v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  NSObject *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CMTime v49;
  CMTime lhs;
  CMTime rhs;
  CMTime v52;
  CMTime v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ANHomeManager shared](ANHomeManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAccessory");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    memset(&v52, 0, sizeof(v52));
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v52, HostTimeClock);
    objc_msgSend(MEMORY[0x1E0CF7E98], "machTimeToSeconds:", mach_absolute_time());
    v8 = v7;
    objc_msgSend(v37, "playbackDeadline");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberForDefault:", *MEMORY[0x1E0CF7AD0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    if (v11 < v15)
      v11 = v15;
    CMTimeMakeWithSeconds(&rhs, v11, v52.timescale);
    lhs = v52;
    CMTimeAdd(&v53, &lhs, &rhs);
    v52 = v53;
    objc_msgSend(v37, "setMachStartTime:", objc_msgSend(MEMORY[0x1E0CF7E98], "secondsToMachTime:", v8 + v11));
    v49 = v52;
    objc_msgSend(v37, "setCmStartTime:", &v49);
    -[ANAnnouncementCoordinator log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      value = v52.value;
      v18 = objc_msgSend(v37, "machStartTime");
      LODWORD(v53.value) = 134218240;
      *(CMTimeValue *)((char *)&v53.value + 4) = value;
      LOWORD(v53.flags) = 2048;
      *(_QWORD *)((char *)&v53.flags + 2) = v18;
      _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "Did Set Announcement CM Start Time = %lld, Mach Start Time = %llu", (uint8_t *)&v53, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v33);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v46 != v35)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "an_isAnnounceAccessory");
          v22 = objc_msgSend(v20, "an_isAnnounceEnabled");
          objc_msgSend(v37, "location");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "containsAccessory:", v20);

          v25 = objc_msgSend(v37, "isAnnouncerInSameRoomAsAccessory:", v20);
          -[ANAnnouncementCoordinator log](self, "log");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v20, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v53.value) = 138413314;
            *(CMTimeValue *)((char *)&v53.value + 4) = (CMTimeValue)v27;
            LOWORD(v53.flags) = 1024;
            *(CMTimeFlags *)((char *)&v53.flags + 2) = v21;
            WORD1(v53.epoch) = 1024;
            HIDWORD(v53.epoch) = v22;
            v54 = 1024;
            v55 = v24;
            v56 = 1024;
            v57 = v25;
            _os_log_impl(&dword_1D23A0000, v26, OS_LOG_TYPE_DEFAULT, "HomePod: %@ Supports Announce = %d, Announce Enabled = %d, In Announcement Location = %d, In Same Room as Announcer = %d", (uint8_t *)&v53, 0x24u);

          }
          if (((v21 & v22 & v24 ^ 1 | v25) & 1) != 0)
          {
            -[ANAnnouncementCoordinator log](self, "log");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v53.value) = 138412290;
              *(CMTimeValue *)((char *)&v53.value + 4) = (CMTimeValue)v20;
              _os_log_impl(&dword_1D23A0000, v28, OS_LOG_TYPE_DEFAULT, "Ignoring message. Accessory does not meet criteria for receiving the announcement locally. %@", (uint8_t *)&v53, 0xCu);
            }
          }
          else
          {
            +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v37, "copy");
            objc_initWeak((id *)&v53, self);
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke;
            v41[3] = &unk_1E938FFC0;
            objc_copyWeak(&v44, (id *)&v53);
            v31 = v30;
            v42 = v31;
            v28 = v29;
            v43 = v28;
            -[ANAnnouncementCoordinator addAnnouncement:forEndpointID:completion:](self, "addAnnouncement:forEndpointID:completion:", v31, v28, v41);

            objc_destroyWeak(&v44);
            objc_destroyWeak((id *)&v53);

          }
        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v36);
    }

  }
  else
  {
    objc_initWeak((id *)&v53, self);
    +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke_19;
    v38[3] = &unk_1E938FFE8;
    objc_copyWeak(&v40, (id *)&v53);
    v39 = v37;
    -[ANAnnouncementCoordinator addAnnouncement:forEndpointID:completion:](self, "addAnnouncement:forEndpointID:completion:", v39, v32, v38);

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)&v53);
  }

}

void __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke(id *a1, int a2)
{
  id *v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  if (a2)
  {
    v3 = a1 + 6;
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke_2;
    block[3] = &unk_1E938FCC0;
    objc_copyWeak(&v9, v3);
    v7 = a1[4];
    v8 = a1[5];
    dispatch_async(v5, block);

    objc_destroyWeak(&v9);
  }
}

void __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_notifyDidReceiveAnnouncement:forEndpointID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke_19(uint64_t a1, int a2)
{
  void *v3;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "messenger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardAnnouncementToCompanion:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_notifyDidReceiveAnnouncement:(id)a3 forEndpointID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__ANAnnouncementCoordinator__notifyDidReceiveAnnouncement_forEndpointID___block_invoke;
  v11[3] = &unk_1E9390010;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[ANAnnouncementCoordinator _executeBlockForDelegates:](self, "_executeBlockForDelegates:", v11);

}

void __73__ANAnnouncementCoordinator__notifyDidReceiveAnnouncement_forEndpointID___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[4];
    v4 = (void *)a1[5];
    objc_msgSend(v4, "groupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinator:didReceiveAnnouncement:forGroupID:forEndpointID:", v3, v4, v5, a1[6]);

  }
}

- (void)_executeBlockForDelegates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ANAnnouncementCoordinator__executeBlockForDelegates___block_invoke;
  v7[3] = &unk_1E938F8E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __55__ANAnnouncementCoordinator__executeBlockForDelegates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id obj;
  _QWORD block[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegatesToQueues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 32), "delegatesToQueues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = objc_claimAutoreleasedReturnValue();

        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __55__ANAnnouncementCoordinator__executeBlockForDelegates___block_invoke_2;
        block[3] = &unk_1E938FDD8;
        v13 = *(id *)(a1 + 40);
        block[4] = v10;
        v16 = v13;
        dispatch_async(v12, block);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

uint64_t __55__ANAnnouncementCoordinator__executeBlockForDelegates___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)announcementManager:(id)a3 announcements:(id)a4 didChangeForGroupID:(id)a5
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
  -[ANAnnouncementCoordinator queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__ANAnnouncementCoordinator_announcementManager_announcements_didChangeForGroupID___block_invoke;
  v15[3] = &unk_1E938F690;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __83__ANAnnouncementCoordinator_announcementManager_announcements_didChangeForGroupID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_endpointIDForAnnouncementManager:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __83__ANAnnouncementCoordinator_announcementManager_announcements_didChangeForGroupID___block_invoke_2;
    v4[3] = &unk_1E9390038;
    v4[4] = v3;
    v5 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    v7 = v2;
    objc_msgSend(v3, "_executeBlockForDelegates:", v4);

  }
}

void __83__ANAnnouncementCoordinator_announcementManager_announcements_didChangeForGroupID___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "coordinator:didUpdateAnnouncements:forGroupID:forEndpointID:", a1[4], a1[5], a1[6], a1[7]);

}

- (void)receivedAnnouncement:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ANAnnouncementCoordinator_receivedAnnouncement___block_invoke;
  v7[3] = &unk_1E938F2F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__ANAnnouncementCoordinator_receivedAnnouncement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReceivedAnnouncement:", *(_QWORD *)(a1 + 40));
}

- (void)failedToDeliverAnnouncement:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ANAnnouncementCoordinator log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "Failed to Deliver Announcement with Error %@, %@", (uint8_t *)&v10, 0x16u);
  }

  if (objc_msgSend(v6, "isRelayRequest"))
  {
    +[ANUserNotificationController sharedController](ANUserNotificationController, "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postSendFailureNotificationForAnnouncement:", v6);

  }
}

- (void)companionDidPlayAnnouncement:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAnnouncementCoordinator log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Announcement was played on remote device: %@", (uint8_t *)&v14, 0xCu);
  }

  -[ANAnnouncementCoordinator playbackManagers](self, "playbackManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ANAnnouncementCoordinator remotePlaybackStatusProvider](self, "remotePlaybackStatusProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[ANAnnouncementCoordinator remotePlaybackStatusProvider](self, "remotePlaybackStatusProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isExternalPlaybackActiveForEndpointID:", v11);

    }
    else
    {
      v12 = 0;
    }

    v13 = objc_msgSend(v8, "playbackState");
    if ((v12 & 1) == 0 && v13 != 1)
      objc_msgSend(v8, "updatePlaybackForAnnouncementID:options:", v4, 4);
  }

}

- (void)playbackManager:(id)a3 didStartPlayingAnnouncement:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[ANAnnouncementCoordinator _endpointIDForPlaybackManager:](self, "_endpointIDForPlaybackManager:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ANAnnouncementCoordinator announcementForID:endpointID:](self, "announcementForID:endpointID:", v11, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[ANAnnouncementCoordinator updateAnnouncement:statusFlags:endpointID:](self, "updateAnnouncement:statusFlags:endpointID:", v7, 4, v6);
    -[ANAnnouncementCoordinator siriRRDonation](self, "siriRRDonation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "makePlaybackDonationWithAnnouncementID:", v11);

    objc_msgSend(MEMORY[0x1E0CF7E40], "getEffectiveNotificationNameFromNotificationName:endpointID:", *MEMORY[0x1E0CF7EB0], v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnouncementCoordinator playbackStatePublisher](self, "playbackStatePublisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "publishState:name:", 1, v9);

  }
}

- (void)playbackManager:(id)a3 didFinishPlayingAnnouncement:(id)a4 withOptions:(unint64_t)a5
{
  char v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v5 = a5;
  v22 = a3;
  v8 = a4;
  -[ANAnnouncementCoordinator _endpointIDForPlaybackManager:](self, "_endpointIDForPlaybackManager:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((v5 & 4) != 0)
    {
      -[ANAnnouncementCoordinator announcementForID:endpointID:](self, "announcementForID:endpointID:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if ((v5 & 2) != 0)
          v11 = 2;
        else
          v11 = 1;
        -[ANAnnouncementCoordinator updateAnnouncement:statusFlags:endpointID:](self, "updateAnnouncement:statusFlags:endpointID:", v10, v11, v9);
        objc_msgSend(v22, "endpointID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[ANAnalytics shared](ANAnalytics, "shared");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "creationTimestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", v16);
        objc_msgSend(v14, "announcementFinishedPlaying:withTime:ofGroupCount:context:", v10, objc_msgSend(v22, "playbackItemCount"), v13, v17);

      }
      if ((v5 & 8) != 0 && objc_msgSend(v9, "an_isLocalDevice"))
      {
        -[ANAnnouncementCoordinator companionConnection](self, "companionConnection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "broadcastAnnouncementPlayed:", v8);

      }
    }
    -[ANAnnouncementCoordinator siriRRDonation](self, "siriRRDonation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "makePlaybackDonationWithAnnouncementID:", v8);

    objc_msgSend(MEMORY[0x1E0CF7E40], "getEffectiveNotificationNameFromNotificationName:endpointID:", *MEMORY[0x1E0CF7EB0], v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnouncementCoordinator playbackStatePublisher](self, "playbackStatePublisher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "publishState:name:", 0, v20);

  }
}

- (void)playbackManager:(id)a3 didUpdatePlaybackState:(unint64_t)a4 announcement:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;

  v8 = a5;
  -[ANAnnouncementCoordinator _endpointIDForPlaybackManager:](self, "_endpointIDForPlaybackManager:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
    {
      -[ANAnnouncementCoordinator siriRRDonation](self, "siriRRDonation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "makePlaybackDonationWithAnnouncementID:", v8);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__ANAnnouncementCoordinator_playbackManager_didUpdatePlaybackState_announcement___block_invoke;
    v11[3] = &unk_1E9390060;
    v11[4] = self;
    v13 = a4;
    v12 = v9;
    -[ANAnnouncementCoordinator _executeBlockForDelegates:](self, "_executeBlockForDelegates:", v11);

  }
}

void __81__ANAnnouncementCoordinator_playbackManager_didUpdatePlaybackState_announcement___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "coordinator:didUpdatePlaybackState:forEndpointID:", a1[4], a1[6], a1[5]);

}

- (void)playbackManager:(id)a3 didStartPlayingAnnouncementsAtMachAbsoluteTime:(unint64_t)a4
{
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  -[ANAnnouncementCoordinator _endpointIDForPlaybackManager:](self, "_endpointIDForPlaybackManager:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __92__ANAnnouncementCoordinator_playbackManager_didStartPlayingAnnouncementsAtMachAbsoluteTime___block_invoke;
    v8[3] = &unk_1E9390060;
    v8[4] = self;
    v10 = a4;
    v9 = v6;
    -[ANAnnouncementCoordinator _executeBlockForDelegates:](self, "_executeBlockForDelegates:", v8);

  }
}

void __92__ANAnnouncementCoordinator_playbackManager_didStartPlayingAnnouncementsAtMachAbsoluteTime___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "coordinator:didStartPlayingAnnouncementsAtMachAbsoluteTime:forEndpointID:", a1[4], a1[6], a1[5]);

}

- (void)playbackManagerDidFinishPlayingAnnouncements:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  -[ANAnnouncementCoordinator _endpointIDForPlaybackManager:](self, "_endpointIDForPlaybackManager:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__ANAnnouncementCoordinator_playbackManagerDidFinishPlayingAnnouncements___block_invoke;
    v6[3] = &unk_1E9390088;
    v6[4] = self;
    v7 = v4;
    -[ANAnnouncementCoordinator _executeBlockForDelegates:](self, "_executeBlockForDelegates:", v6);

  }
}

void __74__ANAnnouncementCoordinator_playbackManagerDidFinishPlayingAnnouncements___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "coordinator:didFinishPlayingAnnouncementsForEndpointID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)cleanUpOldAnnouncementsForPlaybackManager:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[ANAnnouncementCoordinator _endpointIDForPlaybackManager:](self, "_endpointIDForPlaybackManager:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ANAnnouncementCoordinator remotePlaybackStatusProvider](self, "remotePlaybackStatusProvider");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[ANAnnouncementCoordinator remotePlaybackStatusProvider](self, "remotePlaybackStatusProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isExternalPlaybackActiveForEndpointID:", v8);

      if (v7)
        -[ANAnnouncementCoordinator removeOldAnnouncementsForEndpointID:](self, "removeOldAnnouncementsForEndpointID:", v8);
    }
  }

}

- (id)announcementsForPlaybackManager:(id)a3
{
  void *v4;
  void *v5;

  -[ANAnnouncementCoordinator _endpointIDForPlaybackManager:](self, "_endpointIDForPlaybackManager:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ANAnnouncementCoordinator allAnnouncementsSortedByReceiptForEndpointID:](self, "allAnnouncementsSortedByReceiptForEndpointID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)playbackManager:(id)a3 announcementsForIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[ANAnnouncementCoordinator _endpointIDForPlaybackManager:](self, "_endpointIDForPlaybackManager:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ANAnnouncementCoordinator announcementsForIDs:endpointID:](self, "announcementsForIDs:endpointID:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (ANRemotePlaybackStatusProvider)remotePlaybackStatusProvider
{
  return (ANRemotePlaybackStatusProvider *)objc_loadWeakRetained((id *)&self->_remotePlaybackStatusProvider);
}

- (void)setRemotePlaybackStatusProvider:(id)a3
{
  objc_storeWeak((id *)&self->_remotePlaybackStatusProvider, a3);
}

- (ANMessenger)messenger
{
  return self->_messenger;
}

- (NSMutableDictionary)announcementManagers
{
  return self->_announcementManagers;
}

- (NSMutableDictionary)playbackManagers
{
  return self->_playbackManagers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)delegatesToQueues
{
  return self->_delegatesToQueues;
}

- (ANCompanionConnection)companionConnection
{
  return self->_companionConnection;
}

- (void)setCompanionConnection:(id)a3
{
  objc_storeStrong((id *)&self->_companionConnection, a3);
}

- (ANAnnouncementStatePublisher)playbackStatePublisher
{
  return self->_playbackStatePublisher;
}

- (void)setPlaybackStatePublisher:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStatePublisher, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (_TtC14AnnounceDaemon31SiriReferenceResolutionDonation)siriRRDonation
{
  return self->_siriRRDonation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriRRDonation, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_playbackStatePublisher, 0);
  objc_storeStrong((id *)&self->_companionConnection, 0);
  objc_storeStrong((id *)&self->_delegatesToQueues, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_playbackManagers, 0);
  objc_storeStrong((id *)&self->_announcementManagers, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_destroyWeak((id *)&self->_remotePlaybackStatusProvider);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ANAnnouncementCoordinator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__ANAnnouncementCoordinator_ANAnnouncementCoordinatorDelegate__addDelegate_queue___block_invoke;
  block[3] = &unk_1E938F668;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __82__ANAnnouncementCoordinator_ANAnnouncementCoordinatorDelegate__addDelegate_queue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v3;
  objc_msgSend(*(id *)(a1 + 40), "delegatesToQueues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));

}

- (ANParticipant)localParticipant
{
  void *v2;
  void *v3;

  -[ANAnnouncementCoordinator messenger](self, "messenger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ANParticipant *)v3;
}

- (NSSet)scanningDeviceCandidates
{
  void *v2;
  void *v3;

  -[ANAnnouncementCoordinator messenger](self, "messenger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getScanningDeviceCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)sendRequest:(id)a3 sentHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CF7E98];
  v7 = a4;
  v8 = a3;
  if ((objc_msgSend(v6, "isHomeAppInstalled") & 1) == 0)
  {
    -[ANAnnouncementCoordinator log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ANAnnouncementCoordinator(AnnouncementSend) sendRequest:sentHandler:].cold.1(v9);

  }
  -[ANAnnouncementCoordinator messenger](self, "messenger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendRequest:sentHandler:", v8, v7);

}

- (void)mockAnnouncement:(id)a3 playbackDeadline:(id)a4 sentHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ANAnnouncementCoordinator messenger](self, "messenger");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mockAnnouncement:playbackDeadline:sentHandler:", v10, v9, v8);

}

- (void)addAnnouncement:(id)a3 forEndpointID:(id)a4 completion:(id)a5
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
  -[ANAnnouncementCoordinator queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__ANAnnouncementCoordinator_ANAnnouncementManagement_Internal__addAnnouncement_forEndpointID_completion___block_invoke;
  v15[3] = &unk_1E93900B0;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __105__ANAnnouncementCoordinator_ANAnnouncementManagement_Internal__addAnnouncement_forEndpointID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "resolveIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "announcementManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createAnnouncementManagerForIdentifier:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "addAnnouncement:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (id)announcementsForGroupID:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementCoordinator resolveIdentifier:](self, "resolveIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "announcementsForGroupID:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (id)announcementForID:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementCoordinator resolveIdentifier:](self, "resolveIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "announcementForID:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)allAnnouncementsSortedByReceiptForEndpointID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementCoordinator resolveIdentifier:](self, "resolveIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "allAnnouncementsSortedByReceipt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)announcementsForIDs:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementCoordinator resolveIdentifier:](self, "resolveIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "announcementsForIDs:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (void)updateAnnouncement:(id)a3 statusFlags:(unint64_t)a4 endpointID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a3;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementCoordinator resolveIdentifier:](self, "resolveIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "updateAnnouncement:statusFlags:", v9, a4);
}

- (void)removeOldAnnouncementsForEndpointID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementCoordinator resolveIdentifier:](self, "resolveIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeOldAnnouncements");
}

- (void)cleanForExit
{
  void *v3;
  id v4;

  -[ANAnnouncementCoordinator messenger](self, "messenger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanForExit");

  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_202);

}

uint64_t __67__ANAnnouncementCoordinator_ANAnnouncementManagement__cleanForExit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cleanForExit");
}

- (void)performPlaybackCommand:(id)a3 endpointID:(id)a4 completionHandler:(id)a5
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
  -[ANAnnouncementCoordinator queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__ANAnnouncementCoordinator_Playback__performPlaybackCommand_endpointID_completionHandler___block_invoke;
  v15[3] = &unk_1E93900B0;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __91__ANAnnouncementCoordinator_Playback__performPlaybackCommand_endpointID_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "Performing Playback Command. Endpoint ID = %@, Command = %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "resolveIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playbackManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createPlaybackManagerForIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "performPlaybackCommand:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (id)lastPlayedAnnouncementInfoForEndpointID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__ANAnnouncementCoordinator_Playback__lastPlayedAnnouncementInfoForEndpointID___block_invoke;
  block[3] = &unk_1E938F640;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __79__ANAnnouncementCoordinator_Playback__lastPlayedAnnouncementInfoForEndpointID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "playbackManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolveIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "lastPlayedAnnouncementInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
  v5 = v6;
  if (v6)
  {

    v5 = v6;
  }

}

- (unint64_t)playbackStateForEndpointID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ANAnnouncementCoordinator_Playback__playbackStateForEndpointID___block_invoke;
  block[3] = &unk_1E938F640;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __66__ANAnnouncementCoordinator_Playback__playbackStateForEndpointID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "playbackManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolveIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    v5 = objc_msgSend(v6, "playbackState");
    v4 = v6;
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

}

- (void)setPlaybackStartedForAnnouncement:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ANAnnouncementCoordinator_Playback__setPlaybackStartedForAnnouncement_endpointID___block_invoke;
  block[3] = &unk_1E938F668;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __84__ANAnnouncementCoordinator_Playback__setPlaybackStartedForAnnouncement_endpointID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "playbackManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolveIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "updatePlaybackForAnnouncementID:options:", *(_QWORD *)(a1 + 48), 1);
}

- (void)setPlaybackStoppedForAnnouncement:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ANAnnouncementCoordinator queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ANAnnouncementCoordinator_Playback__setPlaybackStoppedForAnnouncement_endpointID___block_invoke;
  block[3] = &unk_1E938F668;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __84__ANAnnouncementCoordinator_Playback__setPlaybackStoppedForAnnouncement_endpointID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "playbackManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolveIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "updatePlaybackForAnnouncementID:options:", *(_QWORD *)(a1 + 48), 12);
}

- (void)pauseAllTimersForEndpointID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementCoordinator resolveIdentifier:](self, "resolveIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pauseAllTimers");
}

- (void)resumeAllTimersForEndpointID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementCoordinator resolveIdentifier:](self, "resolveIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resumeAllTimers");
}

- (void)resetAllTimersForEndpointID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ANAnnouncementCoordinator announcementManagers](self, "announcementManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementCoordinator resolveIdentifier:](self, "resolveIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resetAllTimers");
}

- (id)resolveIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
