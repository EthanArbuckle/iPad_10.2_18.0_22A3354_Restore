@implementation AFDeviceContext

- (AFClockAlarmSnapshot)alarmSnapshot
{
  void *v2;
  AFClockAlarmSnapshot *v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("alarm"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AFClockAlarmSnapshot initWithSerializedBackingStore:]([AFClockAlarmSnapshot alloc], "initWithSerializedBackingStore:", v2);

  return v3;
}

- (AFDeviceContextMetadata)alarmSnapshotMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("alarm"));
}

- (AFClockTimerSnapshot)timerSnapshot
{
  void *v2;
  AFClockTimerSnapshot *v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("timer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AFClockTimerSnapshot initWithSerializedBackingStore:]([AFClockTimerSnapshot alloc], "initWithSerializedBackingStore:", v2);

  return v3;
}

- (AFDeviceContextMetadata)timerSnapshotMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("timer"));
}

- (AFMediaPlaybackStateSnapshot)playbackStateSnapshot
{
  void *v2;
  AFMediaPlaybackStateSnapshot *v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("playbackState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AFMediaPlaybackStateSnapshot initWithSerializedBackingStore:]([AFMediaPlaybackStateSnapshot alloc], "initWithSerializedBackingStore:", v2);

  return v3;
}

- (AFDeviceContextMetadata)playbackStateMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("playbackState"));
}

- (AFHomeAnnouncementSnapshot)homeAnnouncementSnapshot
{
  void *v2;
  AFHomeAnnouncementSnapshot *v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("homeAnnouncement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AFHomeAnnouncementSnapshot initWithSerializedBackingStore:]([AFHomeAnnouncementSnapshot alloc], "initWithSerializedBackingStore:", v2);

  return v3;
}

- (AFDeviceContextMetadata)homeAnnouncementSnapshotMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("homeAnnouncement"));
}

- (int64_t)heardVoiceTrigger
{
  void *v2;
  int64_t v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("heardVoiceTrigger"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (AFDeviceContextMetadata)heardVoiceTriggerMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("heardVoiceTrigger"));
}

- (NSData)myriadAdvertisementContext
{
  void *v2;
  id v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("myriadAdvertisementContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSData *)v3;
}

- (AFMultiUserStateSnapshot)multiUserStateSnapshot
{
  void *v2;
  AFMultiUserStateSnapshot *v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("multiUserState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AFMultiUserStateSnapshot initWithSerializedBackingStore:]([AFMultiUserStateSnapshot alloc], "initWithSerializedBackingStore:", v2);

  return v3;
}

- (AFDeviceContextMetadata)multiUserStateMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("multiUserState"));
}

- (AFLocationSnapshot)locationSnapshot
{
  void *v2;
  AFLocationSnapshot *v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("location"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AFLocationSnapshot initWithSerializedBackingStore:]([AFLocationSnapshot alloc], "initWithSerializedBackingStore:", v2);

  return v3;
}

- (AFDeviceContextMetadata)locationMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("location"));
}

- (AFCallStateSnapshot)callStateSnapshot
{
  void *v2;
  AFCallStateSnapshot *v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("callState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AFCallStateSnapshot initWithSerializedBackingStore:]([AFCallStateSnapshot alloc], "initWithSerializedBackingStore:", v2);

  return v3;
}

- (AFDeviceContextMetadata)callStateMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("callState"));
}

- (AFSystemStateSnapshot)systemStateSnapshot
{
  void *v2;
  AFSystemStateSnapshot *v3;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("systemState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AFSystemStateSnapshot initWithSerializedBackingStore:]([AFSystemStateSnapshot alloc], "initWithSerializedBackingStore:", v2);

  return v3;
}

- (AFDeviceContextMetadata)systemStateMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("systemState"));
}

- (unint64_t)siriClientState
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("siriClientState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithSerializedBackingStore:", v2);
  v4 = objc_msgSend(v3, "unsignedLongValue");

  return v4;
}

- (AFDeviceContextMetadata)siriClientStateMetadata
{
  return (AFDeviceContextMetadata *)-[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("siriClientState"));
}

- (id)historicalSiriClientStates
{
  void *v2;
  void *v3;

  -[AFDeviceContext serializedHistoricalContextForKey:](self, "serializedHistoricalContextForKey:", CFSTR("siriClientState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "af_lenientMappedArray:", &__block_literal_global_14714);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)historicalSiriClientStateMetadata
{
  return -[AFDeviceContext historicalContextMetadataForKey:](self, "historicalContextMetadataForKey:", CFSTR("siriClientState"));
}

- (id)buildBuiltInContextsDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v52;

  v3 = (void *)MEMORY[0x1A1AC0A74](self, a2);
  -[AFDeviceContext alarmSnapshot](self, "alarmSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AFDeviceContext alarmSnapshot](self, "alarmSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ad_shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_1E3A37708, "stringByAppendingFormat:", CFSTR(", alarm=%@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E3A37708;
  }
  -[AFDeviceContext timerSnapshot](self, "timerSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AFDeviceContext timerSnapshot](self, "timerSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ad_shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(", timer=%@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v11;
  }
  -[AFDeviceContext playbackStateSnapshot](self, "playbackStateSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AFDeviceContext playbackStateSnapshot](self, "playbackStateSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ad_shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(", media=%@"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v15;
  }
  if (-[AFDeviceContext af_didHearVoiceTrigger](self, "af_didHearVoiceTrigger"))
  {
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR(", heardVT"));
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v16;
  }
  -[AFDeviceContext homeAnnouncementSnapshot](self, "homeAnnouncementSnapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[AFDeviceContext homeAnnouncementSnapshot](self, "homeAnnouncementSnapshot");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ad_shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(", homeAnnounce=%@"), v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v20;
  }
  -[AFDeviceContext myriadAdvertisementContext](self, "myriadAdvertisementContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[AFDeviceContext myriadAdvertisementContext](self, "myriadAdvertisementContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(", myriadAdvLen=%lu"), objc_msgSend(v22, "length"));
    v23 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v23;
  }
  -[AFDeviceContext locationSnapshot](self, "locationSnapshot");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[AFDeviceContext locationSnapshot](self, "locationSnapshot");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ad_shortDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(", location=%@"), v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v27;
  }
  -[AFDeviceContext callStateSnapshot](self, "callStateSnapshot");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[AFDeviceContext callStateSnapshot](self, "callStateSnapshot");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "ad_shortDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFDeviceContext callStateMetadata](self, "callStateMetadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "deliveryDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(", call=%@(delivered: %@)"), v30, v32);
    v33 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v33;
  }
  -[AFDeviceContext systemStateSnapshot](self, "systemStateSnapshot");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[AFDeviceContext systemStateSnapshot](self, "systemStateSnapshot");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "ad_shortDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(", sys=%@"), v36);
    v37 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v37;
  }
  -[AFDeviceContext af_validFlowContext](self, "af_validFlowContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR(", flowUpdate=YES"));
    v39 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v39;
  }
  if (-[AFDeviceContext siriClientState](self, "siriClientState"))
  {
    v40 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setLocale:", v41);

    objc_msgSend(v40, "setLocalizedDateFormatFromTemplate:", CFSTR("HH:mm:ss.SSS"));
    v42 = -[AFDeviceContext siriClientState](self, "siriClientState");
    -[AFDeviceContext historicalSiriClientStates](self, "historicalSiriClientStates");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "lastObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "unsignedLongValue");
    -[AFDeviceContext historicalSiriClientStateMetadata](self, "historicalSiriClientStateMetadata");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "lastObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "deliveryDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringFromDate:", v47);
    v48 = v3;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(", clientState=%llu(prev %lu %@)"), v42, v44, v49);
    v50 = objc_claimAutoreleasedReturnValue();

    v3 = v48;
    v7 = (__CFString *)v50;
  }
  objc_autoreleasePoolPop(v3);
  return v7;
}

id __66__AFDeviceContext_BuiltInContextTypes__historicalSiriClientStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithSerializedBackingStore:", v3);

  return v4;
}

- (AFDeviceContext)init
{
  AFDeviceContext *v2;
  AFDeviceContext *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *serializedBackingStore;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFDeviceContext;
  v2 = -[AFDeviceContext init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cachedDescriptionLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serializedBackingStore = v3->_serializedBackingStore;
    v3->_serializedBackingStore = v4;

  }
  return v3;
}

- (AFDeviceContext)initWithSerializedBackingStore:(id)a3 fromLocalDevice:(BOOL)a4 contextCollectorSource:(id)a5
{
  id v8;
  id v9;
  AFDeviceContext *v10;
  uint64_t v11;
  NSMutableDictionary *serializedBackingStore;
  void *v13;
  AFPeerInfo *v14;
  AFPeerInfo *deviceInfo;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a5;
  v10 = -[AFDeviceContext init](self, "init");
  if (v10)
  {
    v11 = objc_msgSend(v8, "mutableCopy");
    serializedBackingStore = v10->_serializedBackingStore;
    v10->_serializedBackingStore = (NSMutableDictionary *)v11;

    v10->_fromLocalDevice = a4;
    objc_storeStrong((id *)&v10->_contextCollectorSource, a5);
    objc_msgSend(v8, "objectForKey:", CFSTR("deviceInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[AFPeerInfo initWithDictionaryRepresentation:]([AFPeerInfo alloc], "initWithDictionaryRepresentation:", v13);
      deviceInfo = v10->_deviceInfo;
      v10->_deviceInfo = v14;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_identifier, v16);
    objc_msgSend(v8, "objectForKey:", CFSTR("privacyClass"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10->_privacyClass = AFDeviceContextPrivacyClassFromString(v17);

  }
  return v10;
}

- (id)_serializedBackingStoreIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  int64_t privacyClass;
  const __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_identifier && (objc_msgSend(v7, "containsObject:", CFSTR("identifier")) & 1) == 0)
    objc_msgSend(v8, "setObject:forKey:", self->_identifier, CFSTR("identifier"));
  if (self->_deviceInfo && (objc_msgSend(v7, "containsObject:", CFSTR("deviceInfo")) & 1) == 0)
  {
    if ((self->_dirtyFlags & 1) != 0)
    {
      -[AFPeerInfo buildDictionaryRepresentation](self->_deviceInfo, "buildDictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_serializedBackingStore, "objectForKey:", CFSTR("deviceInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
    }
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("deviceInfo"));
    goto LABEL_11;
  }
LABEL_12:
  if ((objc_msgSend(v7, "containsObject:", CFSTR("privacyClass")) & 1) != 0)
    goto LABEL_24;
  if ((self->_dirtyFlags & 2) != 0)
  {
    privacyClass = self->_privacyClass;
    v12 = CFSTR("AFDeviceContextPrivacyClassUsedByLocalUser");
    if (privacyClass == 50)
      v12 = CFSTR("AFDeviceContextPrivacyClassSharedWithHome");
    if (privacyClass)
      v13 = (__CFString *)v12;
    else
      v13 = CFSTR("AFDeviceContextPrivacyClassUnknown");
    v10 = v13;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_serializedBackingStore, "objectForKey:", CFSTR("privacyClass"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_23;
  }
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("privacyClass"));
LABEL_23:

LABEL_24:
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AFDeviceContext _safeContextDictionary](self, "_safeContextDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKey:", v21, (_QWORD)v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v14, "setObject:forKey:", v22, v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v14, "count"))
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("contexts"));

  return v8;
}

- (id)serializedBackingStore
{
  void *v3;
  void *v4;

  -[AFDeviceContext _serializedBackingStoreIncludingKeys:excludingMandatoryKeys:](self, "_serializedBackingStoreIncludingKeys:excludingMandatoryKeys:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSMutableDictionary mutableCopy](self->_serializedBackingStore, "mutableCopy");
  objc_msgSend(v4, "addEntriesFromDictionary:", v3);

  return v4;
}

- (id)serializedContextForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AFDeviceContext _safeContextDictionary](self, "_safeContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("data"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)serializedHistoricalContextForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AFDeviceContext _safeContextDictionary](self, "_safeContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("historicalData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_safeContextDictionary
{
  void *v2;
  id v3;

  -[NSMutableDictionary objectForKey:](self->_serializedBackingStore, "objectForKey:", CFSTR("contexts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)contextMetadataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  AFDeviceContextMetadata *v9;

  v4 = a3;
  -[AFDeviceContext _safeContextDictionary](self, "_safeContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("metadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = -[AFDeviceContextMetadata initWithBackingStore:]([AFDeviceContextMetadata alloc], "initWithBackingStore:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)historicalContextMetadataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AFDeviceContextMetadata *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AFDeviceContext _safeContextDictionary](self, "_safeContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v4;
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("historicalMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = -[AFDeviceContextMetadata initWithBackingStore:]([AFDeviceContextMetadata alloc], "initWithBackingStore:", v14);
          objc_msgSend(v8, "addObject:", v15);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)allContextKeys
{
  void *v2;
  void *v3;

  -[AFDeviceContext _safeContextDictionary](self, "_safeContextDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  -[AFPeerInfo idsDeviceUniqueIdentifier](self->_deviceInfo, "idsDeviceUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fromLocalDevice);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[AFDeviceContext serializedBackingStore](self, "serializedBackingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AFDeviceContext *v4;
  void *v5;
  void *v6;
  _BOOL4 fromLocalDevice;
  BOOL v8;

  v4 = (AFDeviceContext *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFDeviceContext serializedBackingStore](self, "serializedBackingStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFDeviceContext serializedBackingStore](v4, "serializedBackingStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        fromLocalDevice = self->_fromLocalDevice;
        v8 = fromLocalDevice == -[AFDeviceContext fromLocalDevice](v4, "fromLocalDevice");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  os_unfair_lock_s *p_cachedDescriptionLock;
  NSString *v4;
  NSString *cachedDescription;

  p_cachedDescriptionLock = &self->_cachedDescriptionLock;
  os_unfair_lock_lock(&self->_cachedDescriptionLock);
  if (!self->_cachedDescription)
  {
    -[AFDeviceContext buildDescription](self, "buildDescription");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedDescription = self->_cachedDescription;
    self->_cachedDescription = v4;

  }
  os_unfair_lock_unlock(p_cachedDescriptionLock);
  return self->_cachedDescription;
}

- (AFDeviceContext)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  AFDeviceContext *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v13, v14, v15, v16, v17, v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("serializedBackingStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("fromLocalDevice"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextCollectorSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[AFDeviceContext initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:](self, "initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:", v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AFDeviceContext serializedBackingStore](self, "serializedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("serializedBackingStore"));

  objc_msgSend(v5, "encodeBool:forKey:", self->_fromLocalDevice, CFSTR("fromLocalDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextCollectorSource, CFSTR("contextCollectorSource"));

}

- (id)partiallyUpdatedContextForDeviceContextKeys:(id)a3 excludingMandatoryKeys:(id)a4 fromDeviceContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  AFDeviceContext *v27;
  void *v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10 && objc_msgSend(v8, "count"))
  {
    -[AFDeviceContext serializedBackingStore](self, "serializedBackingStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v10, "serializedBackingStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", CFSTR("deviceInfo")) & 1) == 0)
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("deviceInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("deviceInfo"));

    }
    if ((objc_msgSend(v9, "containsObject:", CFSTR("identifier")) & 1) == 0)
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("identifier"));

    }
    if ((objc_msgSend(v9, "containsObject:", CFSTR("privacyClass")) & 1) == 0)
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("privacyClass"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("privacyClass"));

    }
    v30 = v12;
    v31 = v9;
    -[NSMutableDictionary objectForKey:](self->_serializedBackingStore, "objectForKey:", CFSTR("contexts"), v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "mutableCopy");

    if (!v18)
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "_safeContextDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v8;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v18, "setObject:forKey:", v26, v25);
          else
            objc_msgSend(v18, "removeObjectForKey:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v22);
    }

    objc_msgSend(v30, "setObject:forKey:", v18, CFSTR("contexts"));
    v27 = (AFDeviceContext *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:", v30, self->_fromLocalDevice, self->_contextCollectorSource);

    v9 = v31;
    v8 = v32;
  }
  else
  {
    v27 = self;
  }

  return v27;
}

- (id)deviceContextForDeviceContextKeys:(id)a3 excludingMandatoryKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "containsObject:", CFSTR("all")))
  {
    v8 = (void *)-[AFDeviceContext copy](self, "copy");
  }
  else
  {
    -[AFDeviceContext partialSerializedBackingStoreIncludingKeys:excludingMandatoryKeys:](self, "partialSerializedBackingStoreIncludingKeys:excludingMandatoryKeys:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:", v9, self->_fromLocalDevice, self->_contextCollectorSource);

  }
  return v8;
}

- (id)updatedContextWithSerializedContextByKey:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v23;
  AFDeviceContext *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AFDeviceContext serializedBackingStore](self, "serializedBackingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v8, "mutableCopy");

  v24 = self;
  -[AFDeviceContext _safeContextDictionary](self, "_safeContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "type");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v10, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (id)objc_msgSend(v18, "mutableCopy");

          if (!v19)
            v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v19, "setObject:forKey:", v17, CFSTR("data"));
          objc_msgSend(v15, "backingStore");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("metadata"));

          objc_msgSend(v10, "setObject:forKey:", v19, v16);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  objc_msgSend(v23, "setObject:forKey:", v10, CFSTR("contexts"));
  v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:", v23, v24->_fromLocalDevice, v24->_contextCollectorSource);

  return v21;
}

- (BOOL)isValid
{
  return self->_deviceInfo && self->_identifier != 0;
}

- (id)buildDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v16;
  objc_super v17;

  -[AFDeviceContext buildBuiltInContextsDescriptions](self, "buildBuiltInContextsDescriptions");
  v3 = objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17.receiver = self;
  v17.super_class = (Class)AFDeviceContext;
  -[AFDeviceContext description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDeviceContext deviceInfo](self, "deviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDeviceContext identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ad_shortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDeviceContext deviceInfo](self, "deviceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ad_shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AFDeviceContext fromLocalDevice](self, "fromLocalDevice");
  v13 = (void *)v3;
  v14 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@(%@)(id=%@, deviceInfo=%@, local=%d%@"), v4, v6, v9, v11, v12, v3);

  return v14;
}

- (BOOL)fromLocalDevice
{
  return self->_fromLocalDevice;
}

- (NSString)contextCollectorSource
{
  return self->_contextCollectorSource;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (AFPeerInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (int64_t)privacyClass
{
  return self->_privacyClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextCollectorSource, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_serializedBackingStore, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)af_serviceDeviceContextForKeys:(id)a3
{
  return -[AFDeviceContext af_serviceDeviceContextForKeys:excludeContextExpiredBefore:proximity:](self, "af_serviceDeviceContextForKeys:excludeContextExpiredBefore:proximity:", a3, 0, 0);
}

- (id)af_serviceDeviceContextForKeys:(id)a3 excludeContextExpiredBefore:(id)a4 proximity:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  AFServiceDeviceContext *v26;
  void *v28;
  void *v29;
  AFServiceDeviceContext *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;

  v8 = a4;
  v9 = a3;
  -[AFDeviceContext deviceInfo](self, "deviceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaRouteIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __99__AFDeviceContext_Utilities__af_serviceDeviceContextForKeys_excludeContextExpiredBefore_proximity___block_invoke;
  v37[3] = &unk_1E3A309A8;
  v37[4] = self;
  v12 = v8;
  v38 = v12;
  objc_msgSend(v9, "af_lenientMappedDictionary:", v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v35 = v13;
    v36 = v12;
    -[AFDeviceContext deviceInfo](self, "deviceInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "productType");
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = v16;
    if (v15)
      objc_msgSend(v16, "setObject:forKey:", v15, CFSTR("productType"));
    AFCoreAnalyticsPayloadCreateForDeviceContext(self, a5, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v34, CFSTR("coreAnalyticsContextPayload"));
    v30 = [AFServiceDeviceContext alloc];
    -[AFDeviceContext identifier](self, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFDeviceContext deviceInfo](self, "deviceInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "assistantIdentifier");
    v18 = v17;
    v31 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFDeviceContext deviceInfo](self, "deviceInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mediaSystemIdentifier");
    v33 = (void *)v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFDeviceContext deviceInfo](self, "deviceInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sharedUserIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFDeviceContext deviceInfo](self, "deviceInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "roomName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v18;
    v13 = v35;
    v26 = -[AFServiceDeviceContext initWithIdentifier:assistantIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:sharedUserID:roomName:proximity:serializedContextByKey:metricsContext:](v30, "initWithIdentifier:assistantIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:sharedUserID:roomName:proximity:serializedContextByKey:metricsContext:", v29, v19, v21, v11, v23, v25, a5, v35, v28);

    v12 = v36;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)af_didHearVoiceTrigger
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (-[AFDeviceContext heardVoiceTrigger](self, "heardVoiceTrigger") != 2)
    return 0;
  -[AFDeviceContext heardVoiceTriggerMetadata](self, "heardVoiceTriggerMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5) == 1;

  return v6;
}

- (id)af_validFlowContext
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AFDeviceContext serializedContextForKey:](self, "serializedContextForKey:", CFSTR("serverContextUpdateCommand"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D88368]), "initWithSerializedBackingStore:", v3);
  if (!v4)
  {
    v9 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v11 = v9;
      -[AFDeviceContext deviceInfo](self, "deviceInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[AFDeviceContext(Utilities) af_validFlowContext]";
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = 0;
      _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s Error unarchiving flowContext from %@: %@", (uint8_t *)&v13, 0x20u);

    }
    goto LABEL_8;
  }
  v5 = (void *)v4;
  -[AFDeviceContext contextMetadataForKey:](self, "contextMetadataForKey:", CFSTR("serverContextUpdateCommand"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isExpiredByDate:", v7);

  if (v8)
  {

    v5 = 0;
  }

LABEL_9:
  return v5;
}

id __99__AFDeviceContext_Utilities__af_serviceDeviceContextForKeys_excludeContextExpiredBefore_proximity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serializedContextForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contextMetadataForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isExpiredByDate:", *(_QWORD *)(a1 + 40))
    && (objc_msgSend(*(id *)(a1 + 32), "fromLocalDevice") & 1) == 0)
  {
    v8 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "deviceInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "idsDeviceUniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v17 = "-[AFDeviceContext(Utilities) af_serviceDeviceContextForKeys:excludeContextExpiredBefore:proximity:]_block_invoke";
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s #hal Context for %@ of type %@ has expired", buf, 0x20u);

    }
    goto LABEL_7;
  }
  v14 = v3;
  v15 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v7;
}

@end
