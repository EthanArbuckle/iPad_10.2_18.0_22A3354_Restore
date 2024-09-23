@implementation _DKNowPlayingMonitor

- (id)_metadataFromInfo:(id)a3 outputDevices:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  char v51;
  BOOL v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  id obj;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v66 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65770]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE1B0D8], "album");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, v9);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65780]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE1B0D8], "artist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE657D0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BE1B0D8], "duration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v14, v15);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE657E8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  if (v17)
  {
    objc_msgSend(MEMORY[0x24BE1B0D8], "genre");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v17, v18);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65850]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "copy");

  if (v20)
  {
    objc_msgSend(MEMORY[0x24BE1B0D8], "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v20, v21);

  }
  v69 = (void *)v20;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65810]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BE1B0D8], "mediaType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v23, v24);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65890]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "copy");

  if (v26)
  {
    objc_msgSend(MEMORY[0x24BE1B0D8], "iTunesStoreIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v26, v27);

  }
  v64 = (void *)v26;
  v65 = (void *)v14;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65898]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copy");

  if (v29)
  {
    objc_msgSend(MEMORY[0x24BE1B0D8], "iTunesSubscriptionIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v29, v30);

  }
  v31 = v69;
  v70 = v23;
  if (v66 && objc_msgSend(v66, "count"))
  {
    v59 = v29;
    v60 = v11;
    v61 = v8;
    v62 = v6;
    v63 = v5;
    v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = v66;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (v33)
    {
      v34 = v33;
      v35 = 0;
      v36 = *(_QWORD *)v72;
      v67 = *MEMORY[0x24BE65880];
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v72 != v36)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v38, "deviceID", v59, v60, v61);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            v40 = v17;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v38, "deviceType"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKeyedSubscript:", v41);
            v42 = (id)objc_claimAutoreleasedReturnValue();

            if (!v42)
            {
              v42 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v38, "deviceType"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKeyedSubscript:", v42, v43);

            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v38, "deviceSubType"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKeyedSubscript:", v44);
            v45 = (id)objc_claimAutoreleasedReturnValue();

            if (!v45)
            {
              v45 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v38, "deviceSubType"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, v46);

            }
            objc_msgSend(v38, "deviceID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v47);

            v17 = v40;
            v31 = v69;
            v23 = v70;
          }
          if ((v35 & 1) == 0)
          {
            v48 = v38;
            v49 = v23;
            v50 = v49;
            if (v23 && !objc_msgSend(v49, "isEqualToString:", v67) || objc_msgSend(v48, "deviceType"))
            {

            }
            else
            {
              v51 = objc_msgSend(v48, "deviceFeatures");

              v52 = (v51 & 4) == 0;
              v23 = v70;
              if (!v52)
                v35 = 1;
            }
          }
        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      }
      while (v34);
    }
    else
    {
      v35 = 0;
    }

    v6 = v62;
    if (objc_msgSend(v32, "count"))
    {
      v54 = (void *)objc_msgSend(v32, "copy");
      objc_msgSend(MEMORY[0x24BE1B0D8], "outputDeviceIDs");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setObject:forKey:", v54, v55);

    }
    v53 = v35 & 1;
    v5 = v63;
    v11 = v60;
    v8 = v61;
    v29 = v59;
  }
  else
  {
    v53 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v53, v59, v60, v61);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D8], "isAirPlayVideo");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v56, v57);

  return v6;
}

+ (void)setPlaybackState:(unsigned int)a3 bundleId:(id)a4 track:(id)a5 outputDeviceIDs:(id)a6 mediaType:(id)a7 iTunesStoreIdentifier:(id)a8 iTunesSubscriptionIdentifier:(id)a9
{
  uint64_t v13;
  const __CFString *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  __CFString *v42;
  _QWORD v43[5];
  _QWORD v44[6];

  v13 = *(_QWORD *)&a3;
  v44[5] = *MEMORY[0x24BDAC8D0];
  v14 = (const __CFString *)a4;
  v37 = (__CFString *)a5;
  v15 = a6;
  v16 = (__CFString *)a7;
  v39 = a8;
  v40 = a9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForMediaPlayingStatus");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

  objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingStatusKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v38;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v20;
  objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingBundleIdKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v21;
  v42 = (__CFString *)v14;
  if (v14)
    v22 = v14;
  else
    v22 = &stru_24DA67840;
  v23 = v37;
  v44[1] = v22;
  objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingTrackKey", v37);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v24;
  if (v23)
    v25 = v23;
  else
    v25 = &stru_24DA67840;
  v44[2] = v25;
  objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingOutputDeviceIDsKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v26;
  v27 = (id)MEMORY[0x24BDBD1B8];
  v41 = v15;
  if (v15)
    v27 = v15;
  v44[3] = v27;
  objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingMediaTypeKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v28;
  if (v16)
    v29 = v16;
  else
    v29 = &stru_24DA67840;
  v44[4] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "mutableCopy");

  if (v39)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingiTunesStoreIdentifierKey");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v39, v32);

  }
  if (v40)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingiTunesSubscriptionIdentifierKey");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v40, v33);

  }
  v34 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNowPlayingDataDictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v36);

}

+ (id)_eventWithBundleIdentifier:(id)a3 metadata:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x24BE1B080];
  v6 = (void *)MEMORY[0x24BE1B130];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "nowPlayingStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B050], "withBundle:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "eventWithStream:startDate:endDate:value:metadata:", v9, v10, v11, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)eventStream
{
  return CFSTR("NowPlaying");
}

+ (id)entitlements
{
  return 0;
}

- (_DKNowPlayingMonitor)init
{
  _DKNowPlayingMonitor *v2;
  _DKNowPlayingMonitor *v3;
  _DKEvent *previousEvent;
  NSDictionary *previousBiomeEventMetadata;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DKNowPlayingMonitor;
  v2 = -[_DKMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_DKMonitor setEventComparator:](v2, "setEventComparator:", &__block_literal_global_4);
    previousEvent = v3->_previousEvent;
    v3->_previousEvent = 0;

    previousBiomeEventMetadata = v3->_previousBiomeEventMetadata;
    v3->_previousBiomeEventMetadata = 0;

    v3->_bmSaveState = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKNowPlayingMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKNowPlayingMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)_eventFilterBlock
{
  return &__block_literal_global_23;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

- (void)start
{
  void *v3;
  AVOutputContext *v4;
  AVOutputContext *outputContext;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKNowPlayingMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v6, sel_instantMonitorNeedsActivation))
  {
    objc_msgSend((id)objc_opt_class(), "_eventFilterBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKMonitor setFilter:](self, "setFilter:", v3);

    objc_msgSend(MEMORY[0x24BDB25D8], "sharedAudioPresentationOutputContext");
    v4 = (AVOutputContext *)objc_claimAutoreleasedReturnValue();
    outputContext = self->_outputContext;
    self->_outputContext = v4;

    -[_DKNowPlayingMonitor _registerForNowPlayingNotifications](self, "_registerForNowPlayingNotifications");
  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNowPlayingMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKNowPlayingMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v10;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB1F00];
  -[_DKNowPlayingMonitor outputContext](self, "outputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDB1F08];
  -[_DKNowPlayingMonitor outputContext](self, "outputContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, v7, v8);

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x24BE657C0], 0);
  v10 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v10, self, (CFNotificationName)*MEMORY[0x24BE65760], 0);
  MRMediaRemoteSetWantsNowPlayingNotifications();
}

- (void)_registerForNowPlayingNotifications
{
  NSObject *v3;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_INFO, "Registering for now playing events", v12, 2u);
  }

  MRMediaRemoteSetWantsNowPlayingNotifications();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_nowPlayingInfoInfoCallback, (CFStringRef)*MEMORY[0x24BE657C0], 0, CFNotificationSuspensionBehaviorDrop);
  v5 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_nowPlayingInfoStateCallback, (CFStringRef)*MEMORY[0x24BE65760], 0, CFNotificationSuspensionBehaviorDrop);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDB1F00];
  -[_DKNowPlayingMonitor outputContext](self, "outputContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_outputDevicesDidChange_, v7, v8);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDB1F08];
  -[_DKNowPlayingMonitor outputContext](self, "outputContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_outputDevicesDidChange_, v10, v11);

}

- (void)outputDevicesDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[_DKMonitor queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke;
  block[3] = &unk_24DA66D10;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)saveBMEventWithCurrent:(id)a3 outputDevices:(id)a4 artistStoreIdentifier:(id)a5 albumStoreIdentifier:(id)a6 excludeFromSuggestions:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _DKEvent **p_previousEvent;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  float v42;
  _DKNowPlayingMonitor *v43;
  void *v44;
  void *v45;
  void *v46;
  float v47;
  float v48;
  _BOOL4 v49;
  int v50;
  void *v51;
  unsigned int bmSaveState;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _DKEvent *v79;
  id v80;
  NSDictionary *previousBiomeEventMetadata;
  NSObject *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  _DKNowPlayingMonitor *v87;
  _BOOL4 v88;
  void *v89;
  id v90;
  uint64_t v91;
  _DKEvent **v92;
  void *v93;
  NSDictionary *v94;
  uint8_t v95[16];
  uint8_t v96[16];
  uint8_t v97[16];
  uint8_t buf[16];

  v88 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  p_previousEvent = &self->_previousEvent;
  -[_DKEvent metadata](self->_previousEvent, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D8], "playing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D8], "playing");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v91 = objc_claimAutoreleasedReturnValue();

  v21 = (NSDictionary *)objc_opt_new();
  if (v13)
  {
    objc_msgSend(v13, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v22, CFSTR("iTunesArtistIdentifierKey"));

  }
  if (v14)
  {
    objc_msgSend(v14, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, CFSTR("iTunesAlbumIdentifierKey"));

  }
  v94 = v21;
  objc_msgSend(MEMORY[0x24BE65500], "localDeviceInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v24;
  if (objc_msgSend(v24, "hasAirPlayActive"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v24, "isAirPlayActive"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v25, CFSTR("isAirPlayActive"));

    v24 = v93;
  }
  if (objc_msgSend(v24, "hasParentGroupContainsDiscoverableGroupLeader"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v93, "parentGroupContainsDiscoverableGroupLeader"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v26, CFSTR("parentGroupContainsDiscoverableGroupLeader"));

  }
  v27 = MEMORY[0x219A29278]();
  v28 = (void *)v27;
  v89 = v18;
  v90 = v11;
  v92 = &self->_previousEvent;
  if (*p_previousEvent)
  {
    v83 = (void *)v27;
    v84 = v14;
    v85 = v13;
    v86 = v12;
    v29 = objc_alloc(MEMORY[0x24BDBCED8]);
    -[_DKEvent metadata](*p_previousEvent, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithDictionary:", v30);

    objc_msgSend(MEMORY[0x24BE1B0D8], "duration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeObjectForKey:", v32);

    v33 = objc_alloc(MEMORY[0x24BDBCED8]);
    objc_msgSend(v11, "metadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v11;
    v36 = (void *)objc_msgSend(v33, "initWithDictionary:", v34);

    objc_msgSend(MEMORY[0x24BE1B0D8], "duration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeObjectForKey:", v37);

    LODWORD(v37) = objc_msgSend(v36, "isEqualToDictionary:", v31);
    objc_msgSend(v35, "metadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "duration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "floatValue");
    v42 = v41;
    -[_DKEvent metadata](self->_previousEvent, "metadata");
    v43 = self;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "duration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "floatValue");
    v48 = v47;

    self = v43;
    v49 = -[NSDictionary isEqualToDictionary:](v94, "isEqualToDictionary:", v43->_previousBiomeEventMetadata);
    v50 = !(_DWORD)v37 || vabds_f32(v42, v48) >= 0.2 || !v49;
    v13 = v85;
    v12 = v86;
    v28 = v83;
    v14 = v84;
    v51 = (void *)v91;

    v18 = v89;
    v11 = v90;
  }
  else
  {
    v50 = 1;
    v51 = (void *)v91;
  }
  objc_autoreleasePoolPop(v28);
  bmSaveState = self->_bmSaveState;
  if (bmSaveState == 2)
  {
    if (objc_msgSend(v51, "longValue") == 1)
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v95 = 0;
        _os_log_impl(&dword_219056000, v55, OS_LOG_TYPE_INFO, "Biome state transition Stopped -> Playing", v95, 2u);
      }

      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        -[_DKNowPlayingMonitor saveBMEventWithCurrent:outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:].cold.1(v11);
      goto LABEL_29;
    }
  }
  else if (bmSaveState == 1)
  {
    if (objc_msgSend(v18, "longValue") == 1 && (objc_msgSend(v18, "isEqualToNumber:", v51) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v97 = 0;
        _os_log_impl(&dword_219056000, v82, OS_LOG_TYPE_INFO, "Biome state transition Playing -> Stopped", v97, 2u);
      }

      v56 = 2;
      goto LABEL_30;
    }
    if (v50)
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v96 = 0;
        _os_log_impl(&dword_219056000, v62, OS_LOG_TYPE_INFO, "Biome state transition Playing -> Playing", v96, 2u);
      }

      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        -[_DKNowPlayingMonitor saveBMEventWithCurrent:outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:].cold.3((id *)v92);

      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        -[_DKNowPlayingMonitor saveBMEventWithCurrent:outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:].cold.1(v11);

      -[_DKEvent metadata](*v92, "metadata");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)objc_msgSend(v65, "mutableCopy");

      objc_msgSend(MEMORY[0x24BE1B0D8], "playing");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setObject:forKeyedSubscript:", &unk_24DA70FC0, v66);

      v67 = (void *)objc_opt_class();
      v68 = (void *)objc_opt_class();
      -[_DKEvent value](*v92, "value");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "stringValue");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "_eventWithBundleIdentifier:metadata:", v70, v57);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = self;
      v72 = (void *)-[NSDictionary copy](self->_previousBiomeEventMetadata, "copy");
      objc_msgSend(v67, "_bmEventWithDKEvent:outputDevices:biomeEventMetadata:excludeFromSuggestions:", v71, v12, v72, v88);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      BiomeLibrary();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "Media");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "NowPlaying");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "source");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "sendEvent:", v58);

      objc_msgSend((id)objc_opt_class(), "_bmEventWithDKEvent:outputDevices:biomeEventMetadata:excludeFromSuggestions:", v11, v12, v94, v88);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      BiomeLibrary();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "Media");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "NowPlaying");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "source");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "sendEvent:", v59);

      self = v87;
      v51 = (void *)v91;
      goto LABEL_41;
    }
  }
  else if (!bmSaveState && objc_msgSend(v51, "longValue") == 1)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219056000, v53, OS_LOG_TYPE_INFO, "Biome state transition Unknown -> Playing", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      -[_DKNowPlayingMonitor saveBMEventWithCurrent:outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:].cold.1(v11);
LABEL_29:

    v56 = 1;
LABEL_30:
    self->_bmSaveState = v56;
    objc_msgSend((id)objc_opt_class(), "_bmEventWithDKEvent:outputDevices:biomeEventMetadata:excludeFromSuggestions:", v11, v12, v94, v88);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    BiomeLibrary();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "Media");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "NowPlaying");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "source");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "sendEvent:", v57);
LABEL_41:

    v18 = v89;
    v11 = v90;
  }
  v79 = *v92;
  *v92 = (_DKEvent *)v11;
  v80 = v11;

  previousBiomeEventMetadata = self->_previousBiomeEventMetadata;
  self->_previousBiomeEventMetadata = v94;

}

- (void)_nowPlayingInfoDidChange:(void *)a3 outputDevices:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  _DKNowPlayingMonitor *v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, int);
  void *v34;
  NSObject *v35;
  id v36;
  _QWORD *v37;
  _QWORD v38[3];
  int v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  void *v43;
  NSObject *v44;
  id v45;
  _QWORD *v46;
  _QWORD v47[5];
  id v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, void *);
  void *v52;
  _DKNowPlayingMonitor *v53;
  id v54;
  NSObject *v55;
  id v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD v61[3];
  char v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;

  v5 = a4;
  v6 = dispatch_group_create();
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__3;
  v67[4] = __Block_byref_object_dispose__3;
  v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__3;
  v65[4] = __Block_byref_object_dispose__3;
  v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__3;
  v63[4] = __Block_byref_object_dispose__3;
  v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v62 = 0;
  dispatch_group_enter(v6);
  v7 = (void *)os_transaction_create();
  -[_DKMonitor queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v49 = MEMORY[0x24BDAC760];
  v50 = 3221225472;
  v51 = __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke;
  v52 = &unk_24DA67228;
  v57 = v67;
  v53 = self;
  v10 = v5;
  v54 = v10;
  v58 = v65;
  v59 = v63;
  v60 = v61;
  v11 = v6;
  v55 = v11;
  v12 = v7;
  v56 = v12;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();

  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__3;
  v47[4] = __Block_byref_object_dispose__3;
  v48 = 0;
  dispatch_group_enter(v11);
  -[_DKMonitor queue](self, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v9;
  v41 = 3221225472;
  v42 = __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2;
  v43 = &unk_24DA67250;
  v46 = v47;
  v14 = v11;
  v44 = v14;
  v15 = v12;
  v45 = v15;
  MRMediaRemoteGetNowPlayingClientForOrigin();

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  dispatch_group_enter(v14);
  -[_DKMonitor queue](self, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v9;
  v32 = 3221225472;
  v33 = __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_52;
  v34 = &unk_24DA67278;
  v37 = v38;
  v17 = v14;
  v35 = v17;
  v36 = v15;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();

  -[_DKMonitor queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_54;
  block[3] = &unk_24DA672A0;
  v26 = v67;
  v27 = v61;
  v22 = v10;
  v23 = self;
  v28 = v38;
  v29 = v65;
  v30 = v63;
  v24 = v36;
  v25 = v47;
  v19 = v36;
  v20 = v10;
  dispatch_group_notify(v17, v18, block);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);

  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);

}

- (void)_stripMetadata:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x24BE1B0D8];
  v4 = a3;
  objc_msgSend(v3, "album");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  objc_msgSend(MEMORY[0x24BE1B0D8], "artist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v6);

  objc_msgSend(MEMORY[0x24BE1B0D8], "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v7);

  objc_msgSend(MEMORY[0x24BE1B0D8], "elapsed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v8);

  objc_msgSend(MEMORY[0x24BE1B0D8], "genre");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v9);

  objc_msgSend(MEMORY[0x24BE1B0D8], "iTunesStoreIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v10);

  objc_msgSend(MEMORY[0x24BE1B0D8], "iTunesSubscriptionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v11);

  objc_msgSend(MEMORY[0x24BE1B0D8], "title");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v12);

}

+ (id)_bmEventWithDKEvent:(id)a3 outputDevices:(id)a4 biomeEventMetadata:(id)a5 excludeFromSuggestions:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  unsigned int v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  BOOL v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id obj;
  id obja;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t v114[128];
  uint8_t buf[4];
  unint64_t v116;
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  obj = a4;
  v10 = a5;
  objc_msgSend(v9, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D8], "playing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  v93 = objc_alloc(MEMORY[0x24BE0C540]);
  if (a6)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v9, "source");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "itemID");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "startDate");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v14 >= 6)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[_DKNowPlayingMonitor _bmEventWithDKEvent:outputDevices:biomeEventMetadata:excludeFromSuggestions:].cold.1(v14, v17);

    v14 = 0;
  }
  v94 = v14;
  if (a6)
  {
    v18 = 0;
    v98 = 0;
    v100 = 0;
    v19 = 0;
    v106 = 0;
    v20 = 0;
  }
  else
  {
    objc_msgSend(v9, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "album");
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = v21;
    objc_msgSend(v21, "objectForKeyedSubscript:");
    v100 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "artist");
    v14 = objc_claimAutoreleasedReturnValue();
    v79 = v22;
    objc_msgSend(v22, "objectForKeyedSubscript:", v14);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "duration");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v23;
    objc_msgSend(v23, "objectForKeyedSubscript:");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "genre");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v24;
    objc_msgSend(v24, "objectForKeyedSubscript:");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "title");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v25;
    objc_msgSend(v25, "objectForKeyedSubscript:");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "elapsed");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v26;
    objc_msgSend(v26, "objectForKeyedSubscript:");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v103 = v10;
  objc_msgSend(v9, "metadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D8], "mediaType");
  v90 = v27;
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:");
  v101 = (void *)v15;
  v96 = (void *)v16;
  v97 = (void *)v20;
  v102 = a6;
  v99 = (void *)v19;
  v83 = (void *)v14;
  v92 = (void *)v18;
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    v105 = 0;
    v28 = 0;
  }
  else
  {
    objc_msgSend(v9, "metadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "iTunesStoreIdentifier");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v29;
    objc_msgSend(v29, "objectForKeyedSubscript:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "stringValue");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "iTunesSubscriptionIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v30;
    objc_msgSend(v30, "objectForKeyedSubscript:");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringValue");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v88 = (void *)v28;
  v104 = v9;
  objc_msgSend(v9, "metadata");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D8], "isAirPlayVideo");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v31;
  objc_msgSend(v31, "objectForKeyedSubscript:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = obj;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v32, "count"));
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obja = v32;
  v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v111;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v111 != v36)
          objc_enumerationMutation(obja);
        v38 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v37);
        v39 = objc_alloc(MEMORY[0x24BE0C548]);
        v40 = objc_msgSend(v38, "deviceType");
        v41 = v40;
        if (v40 >= 5)
        {
          objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v116 = v41;
            _os_log_fault_impl(&dword_219056000, v43, OS_LOG_TYPE_FAULT, "BMMediaNowPlayingOutputDeviceType: Unrecognized value for outputDevice: %ld", buf, 0xCu);
          }

          v42 = 0;
        }
        else
        {
          v42 = (v40 + 1);
        }
        v44 = objc_msgSend(v38, "deviceSubType");
        v45 = v44;
        if (v44 >= 0x14)
        {
          objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v116 = v45;
            _os_log_fault_impl(&dword_219056000, v47, OS_LOG_TYPE_FAULT, "BMMediaNowPlayingOutputDeviceSubType: Unrecognized value for outputSubtype: %ld", buf, 0xCu);
          }

          v46 = 0;
        }
        else
        {
          v46 = (v44 + 1);
        }
        objc_msgSend(v38, "deviceID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v39, "initWithType:subType:outputDeviceID:", v42, v46, v48);
        objc_msgSend(v33, "addObject:", v49);

        ++v37;
      }
      while (v35 != v37);
      v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
    }
    while (v35);
  }

  objc_msgSend(v104, "value");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "stringValue");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v50 = 0;
    v51 = 0;
    v52 = v103;
  }
  else
  {
    v52 = v103;
    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("iTunesArtistIdentifierKey"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("iTunesAlbumIdentifierKey"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53 = v85;
  objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("isAirPlayActive"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("parentGroupContainsDiscoverableGroupLeader"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v89;
  v57 = v96;
  v95 = (id)objc_msgSend(v93, "initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:", v101, v96, v94, v100, v99, v98, v106, v92, v97, v89, v105, v88, v85, v33,
              v84,
              v50,
              v51,
              0,
              0,
              0,
              v54,
              v55);

  if (v102)
  {
    v58 = v84;
    v59 = v107;
    v61 = v86;
    v60 = v87;
    v62 = v96;
    v63 = v90;
    v57 = v91;
  }
  else
  {

    v56 = v81;
    v62 = v82;
    v61 = (void *)v100;
    v63 = v101;
    v53 = v79;
    v60 = (void *)v80;
    v59 = v99;
    v33 = v83;
    v58 = v78;
  }

  return v95;
}

- (unsigned)lastPlaybackState
{
  return self->_lastPlaybackState;
}

- (void)setLastPlaybackState:(unsigned int)a3
{
  self->_lastPlaybackState = a3;
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
  objc_storeStrong((id *)&self->_outputContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_previousBiomeEventMetadata, 0);
  objc_storeStrong((id *)&self->_previousEvent, 0);
}

- (void)saveBMEventWithCurrent:(void *)a1 outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_219056000, v2, v3, "Biome new metadata:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)saveBMEventWithCurrent:(id *)a1 outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:.cold.3(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_219056000, v2, v3, "Biome old metadata:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)_bmEventWithDKEvent:(uint64_t)a1 outputDevices:(NSObject *)a2 biomeEventMetadata:excludeFromSuggestions:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_219056000, a2, v4, "BMMediaNowPlaying: unable to convert MRPlaybackState enum value: %@", v5);

  OUTLINED_FUNCTION_3();
}

@end
