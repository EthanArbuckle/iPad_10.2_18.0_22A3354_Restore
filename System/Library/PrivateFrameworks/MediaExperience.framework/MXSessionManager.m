@implementation MXSessionManager

- (NSDictionary)devicesSampleRates
{
  NSDictionary *v3;

  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  v3 = self->_devicesSampleRates;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
  return v3;
}

- (NSPointerArray)mxCoreSessionList
{
  return self->_mxCoreSessionList;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_20);
  return (id)sharedInstance_sSharedInstance_2;
}

- (NSRecursiveLock)propertiesLock
{
  return self->_propertiesLock;
}

- (NSMutableDictionary)pickableRoutesDescriptions
{
  return self->_pickableRoutesDescriptions;
}

- (NSDictionary)figModeTypeToVADModeType
{
  return self->_figModeTypeToVADModeType;
}

- (NSDictionary)figCategoryToVADCategoryDict
{
  return self->_figCategoryToVADCategoryDict;
}

- (id)copyMXCoreSessionList
{
  void *v3;
  NSArray *v4;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v4 = -[NSPointerArray allObjects](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "allObjects");
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void)mxCoreSessionListEndIteration
{
  -[NSLock lock](-[MXSessionManager mxCoreSessionListReadLock](self, "mxCoreSessionListReadLock"), "lock");
  -[MXSessionManager setMxCoreSessionListActiveReaders:](self, "setMxCoreSessionListActiveReaders:", -[MXSessionManager mxCoreSessionListActiveReaders](self, "mxCoreSessionListActiveReaders") - 1);
  if (!-[MXSessionManager mxCoreSessionListActiveReaders](self, "mxCoreSessionListActiveReaders"))
    dispatch_semaphore_signal((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"));
  -[NSLock unlock](-[MXSessionManager mxCoreSessionListReadLock](self, "mxCoreSessionListReadLock"), "unlock");
}

- (void)mxCoreSessionListBeginIteration
{
  -[NSLock lock](-[MXSessionManager mxCoreSessionListReadLock](self, "mxCoreSessionListReadLock"), "lock");
  -[MXSessionManager setMxCoreSessionListActiveReaders:](self, "setMxCoreSessionListActiveReaders:", -[MXSessionManager mxCoreSessionListActiveReaders](self, "mxCoreSessionListActiveReaders") + 1);
  if (-[MXSessionManager mxCoreSessionListActiveReaders](self, "mxCoreSessionListActiveReaders") == 1)
    dispatch_semaphore_wait((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"), 0xFFFFFFFFFFFFFFFFLL);
  -[NSLock unlock](-[MXSessionManager mxCoreSessionListReadLock](self, "mxCoreSessionListReadLock"), "unlock");
}

- (NSLock)mxCoreSessionListReadLock
{
  return self->_mxCoreSessionListReadLock;
}

- (unsigned)mxCoreSessionListActiveReaders
{
  return self->_mxCoreSessionListActiveReaders;
}

- (void)setMxCoreSessionListActiveReaders:(unsigned int)a3
{
  self->_mxCoreSessionListActiveReaders = a3;
}

- (OS_dispatch_semaphore)mxCoreSessionListWriteSemaphore
{
  return self->_mxCoreSessionListWriteSemaphore;
}

- (NSString)currentAudioCategory
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (unsigned)speechDetectionVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A86C8), "unsignedIntValue");
}

- (unsigned)systemSoundRemoteVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A4C68), "unsignedIntValue");
}

- (id)copySpeechDetectSession
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasAudioCategory:", CFSTR("SpeechDetect")))
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v8;
}

- (id)copyVoiceOverSession
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasAudioCategory:", CFSTR("VoiceOver")))
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v8;
}

- (NSSet)audioCategoriesWithInput
{
  return self->_audioCategoriesWithInput;
}

- (BOOL)isSpeechDetectCategory:(id)a3
{
  int IsSpeechDetectEnabled;

  IsSpeechDetectEnabled = MX_FeatureFlags_IsSpeechDetectEnabled();
  if (IsSpeechDetectEnabled)
    LOBYTE(IsSpeechDetectEnabled) = objc_msgSend(a3, "isEqualToString:", CFSTR("SpeechDetect"));
  return IsSpeechDetectEnabled;
}

- (unsigned)decoupledInputVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A86E8), "unsignedIntValue");
}

- (NSDictionary)audioDeviceInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (id)copyActiveSessionsInfoForAdditiveRouting
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList");
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v8, "isActive", v12, v13)
          && !-[MXSessionManager isSpeechDetectCategory:](self, "isSpeechDetectCategory:", objc_msgSend(v8, "audioCategory"))&& (objc_msgSend(v8, "isIDSMXCoreSession") & 1) == 0&& (objc_msgSend(v8, "isHardwareSafetySession") & 1) == 0)
        {
          v9 = objc_msgSend(v8, "additiveRoutingInfo");
          if (v9)
          {
            objc_msgSend(v14, "addObject:", v9);
          }
          else
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration", v12, v13);
  return v14;
}

- (id)getUncustomizedCategory:(id)a3
{
  id result;

  result = -[NSDictionary objectForKey:](-[MXSessionManager figUncustomizedCategory_Dict](self, "figUncustomizedCategory_Dict"), "objectForKey:", a3);
  if (!result)
    return a3;
  return result;
}

- (NSDictionary)figUncustomizedCategory_Dict
{
  return self->_figUncustomizedCategory_Dict;
}

- (int)getSessionPriority:(MXSessionPlayingInfo *)a3 forTipi:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int var2;
  int v21;
  BOOL v22;
  id var5;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v28;
  int v30;
  NSObject *v31;

  v4 = a4;
  if (mxsmInteruptionActionMapper_setUpInterruptionPriorityDictionaries_onceToken != -1)
    dispatch_once(&mxsmInteruptionActionMapper_setUpInterruptionPriorityDictionaries_onceToken, &__block_literal_global_5);
  if (!a3->var4)
    goto LABEL_30;
  if (v4)
  {
    v6 = objc_msgSend((id)sCategoryToCategoryMapForTipi, "objectForKey:");
    if (v6)
    {
      v7 = v6;
      v8 = &sCategoryToPriorityMapForTipi;
      goto LABEL_10;
    }
LABEL_30:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 100;
  }
  v9 = objc_msgSend((id)sCategoryToCategoryMapForTriangle, "objectForKey:");
  if (!v9)
    goto LABEL_30;
  v7 = v9;
  v8 = &sCategoryToPriorityMapForTriangle;
LABEL_10:
  v10 = (void *)objc_msgSend((id)*v8, "objectForKey:", v7);
  if (!v10)
    goto LABEL_30;
  v11 = v10;
  v12 = objc_msgSend(v10, "count");
  if (v12 < 1)
    return 100;
  v13 = v12;
  v14 = 0;
  while (1)
  {
    v15 = (void *)objc_msgSend(v11, "objectAtIndex:", v14);
    v16 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("AudioMode"));
    v17 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("Priority"));
    v18 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("InterruptionStyle"));
    if (v18)
    {
      v19 = v18;
      var2 = a3->var2;
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("NonMixable")) & 1) != 0)
      {
        v21 = 15;
      }
      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("Mixable")))
      {
        v21 = 48;
      }
      else
      {
        v21 = 0;
      }
      v22 = (v21 & var2) != 0;
      if (!v16)
        goto LABEL_27;
    }
    else
    {
      v22 = 1;
      if (!v16)
        goto LABEL_27;
    }
    var5 = a3->var5;
    v24 = objc_msgSend(v16, "count");
    if (v24 >= 1)
    {
      v25 = v24;
      v26 = 0;
      while (!objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", v26), "isEqualToString:", var5))
      {
        if (v25 == ++v26)
          goto LABEL_28;
      }
    }
LABEL_27:
    if (v22)
      break;
LABEL_28:
    if (++v14 == v13)
      return 100;
  }
  v30 = objc_msgSend(v17, "unsignedIntValue");
  v28 = v30;
  if (a3->var3 == 10 && v30 != 100 && (objc_msgSend(a3->var4, "isEqualToString:", CFSTR("Ringtone")) & 1) == 0)
  {
    if (dword_1EE2B3F38)
    {
      v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 501;
  }
  return v28;
}

- (id)copySessionWithAudioSessionID:(unsigned int)a3
{
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "audioSessionID") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v10;
}

- (NSString)systemMirroringRoutingContextUUID
{
  NSString *v3;
  NSString *v5;

  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  v3 = self->_systemMirroringRoutingContextUUID;
  v5 = v3;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
  if (!v3)
  {
    FigRoutingManagerContextUtilities_CopySystemMirroringContextUUID((uint64_t)&v5);
    -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");

    self->_systemMirroringRoutingContextUUID = v5;
    -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
    v3 = v5;
  }
  return v3;
}

- (id)getBluetoothCustomizedAlternateCategory:(id)a3 enableBluetooth:(BOOL)a4
{
  NSDictionary *v5;
  id result;

  if (a4)
    v5 = -[MXSessionManager figCustomizedCategoryWithBluetooth_Dict](self, "figCustomizedCategoryWithBluetooth_Dict");
  else
    v5 = -[MXSessionManager figCustomizedCategoryWithoutBluetooth_Dict](self, "figCustomizedCategoryWithoutBluetooth_Dict");
  result = -[NSDictionary objectForKey:](v5, "objectForKey:", a3);
  if (!result)
    return a3;
  return result;
}

- (NSDictionary)figCustomizedCategoryWithBluetooth_Dict
{
  return self->_figCustomizedCategoryWithBluetooth_Dict;
}

- (NSString)currentAudioMode
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (NSDictionary)figCustomizedCategoryWithoutBluetooth_Dict
{
  return self->_figCustomizedCategoryWithoutBluetooth_Dict;
}

- (BOOL)uplinkMute
{
  return self->_uplinkMute;
}

- (NSDictionary)vadOutputPortTypeToFigOutputDeviceNameDict
{
  return self->_vadOutputPortTypeToFigOutputDeviceNameDict;
}

- (void)refreshDeviceSampleRateCache
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  os_log_type_t type;
  unsigned int v30;
  _BYTE v31[128];
  _BYTE v32[128];
  int v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  if (dword_1EE2B3F38)
  {
    v30 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXSessionManager setDevicesSampleRates:](self, "setDevicesSampleRates:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", v17, v19));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = -[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo");
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        -[MXSessionManager updateDeviceSampleRate:](self, "updateDeviceSampleRate:", objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i)), "unsignedIntValue"));
      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v6);
  }
  if (CMSMVAUtility_IsAdditiveRoutingEnabled())
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = -[MXAdditiveRoutingManager vadNameToID](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "vadNameToID");
    v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          -[MXSessionManager updateDeviceSampleRate:](self, "updateDeviceSampleRate:", objc_msgSend(-[NSDictionary objectForKey:](-[MXAdditiveRoutingManager vadNameToID](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "vadNameToID"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j)), "unsignedIntValue"));
        }
        v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      }
      while (v11);
    }
  }
  if (dword_1EE2B3F38)
  {
    v30 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v15 = v30;
    if (os_log_type_enabled(v14, type))
      v16 = v15;
    else
      v16 = v15 & 0xFFFFFFFE;
    if (v16)
    {
      v33 = 136315138;
      v34 = "-[MXSessionManager refreshDeviceSampleRateCache]";
      LODWORD(v20) = 12;
      v18 = &v33;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock", v18, v20), "unlock");
}

- (void)setVADID:(unsigned int)a3 forVADName:(id)a4
{
  uint64_t v5;
  id v7;

  v5 = *(_QWORD *)&a3;
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"));
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5), a4);
  -[MXSessionManager updateDeviceSampleRate:](self, "updateDeviceSampleRate:", v5);
  -[MXSessionManager setAudioDeviceInfo:](self, "setAudioDeviceInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7));

}

- (void)updateDeviceSampleRate:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[MXSessionManager devicesSampleRates](self, "devicesSampleRates"));
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", vaemGetSampleRateForDevice(v3)), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
    -[MXSessionManager setDevicesSampleRates:](self, "setDevicesSampleRates:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5));
    -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");

  }
}

- (void)setAudioDeviceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setDevicesSampleRates:(id)a3
{
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");

  self->_devicesSampleRates = (NSDictionary *)a3;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
}

- (NSString)appAllowedToFadeInTemporarily
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (BOOL)isAirPlaySession:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "displayID"), "containsString:", CFSTR("tvairplayd")) & 1) != 0
    || (objc_msgSend((id)objc_msgSend(a3, "displayID"), "containsString:", CFSTR("TVAirPlay")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isAirPlayReceiverSession");
  }
}

- (BOOL)isLongFormVideoApp:(id)a3
{
  int AppBooleanValue;
  BOOL v6;
  BOOL v7;
  NSArray *longFormVideoApps;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DisableLongFormVideoApp"), CFSTR("com.apple.coremedia"), &keyExistsAndHasValidFormat);
  v6 = 0;
  if (keyExistsAndHasValidFormat)
    v7 = AppBooleanValue == 0;
  else
    v7 = 1;
  if (!v7)
    return v6;
  if (CMSMDeviceState_ItsAHomePod())
  {
    if (!a3)
      return 0;
  }
  else
  {
    FigMobileAsset_UpdateCatalogIfTimeIntervalElapsed();
    if (!a3)
      return 0;
  }
  if (!objc_msgSend(a3, "length"))
    return 0;
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  longFormVideoApps = self->_longFormVideoApps;
  if (longFormVideoApps)
    v6 = -[NSArray containsObject:](longFormVideoApps, "containsObject:", a3);
  else
    v6 = 0;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
  return v6;
}

- (void)duckSessionIfDuckerIsActive:(id)a3
{
  __CFArray *v5;
  void *v6;
  int v7;
  MXSessionManager *v8;
  void *v9;
  int v10;
  MXDuckingSource *v11;
  uint64_t v12;
  MXDuckingSource *v13;

  v5 = CMSMUtility_CopyCurrentRouteTypes();
  v6 = CMSUtility_CopyActiveDuckerForSession(a3);
  -[MXSessionManager startAsyncDuckingOperation](self, "startAsyncDuckingOperation");
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
  {
    if (v6)
    {
      v7 = objc_msgSend(v6, "hasAudioCategory:", CFSTR("VoiceOver"));
      v8 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
      if (v7)
        v9 = v6;
      else
        v9 = 0;
    }
    else
    {
      v8 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
      v7 = 0;
      v9 = 0;
    }
    v10 = v7 & -[MXSessionManager duckSessionForVoiceOverIfNeeded:voiceOverSession:](v8, "duckSessionForVoiceOverIfNeeded:voiceOverSession:", a3, v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  v13 = 0;
  if (v6 && (v10 & 1) == 0)
  {
    v11 = [MXDuckingSource alloc];
    v12 = objc_msgSend((id)objc_msgSend(v6, "ID"), "longLongValue");
    objc_msgSend(v6, "duckToLevelScalar");
    v13 = -[MXDuckingSource initWithType:ID:duckVolume:duckFadeDuration:](v11, "initWithType:ID:duckVolume:duckFadeDuration:", 2, v12);
    -[MXSessionManager duckVolume:duckerSession:duckingSource:](self, "duckVolume:duckerSession:duckingSource:", a3, v6);
    objc_msgSend(v6, "setNeedToEndInterruption:", 1);
  }
  -[MXSessionManager endAsyncDuckingOperationForSession:](self, "endAsyncDuckingOperationForSession:", a3);

}

- (BOOL)isSmartRoutingEligibleSessionAvailable
{
  NSPointerArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", 0), "mxCoreSessionList");
  v3 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 1;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
      if (objc_msgSend(v8, "isPlaying"))
      {
        if (CMSUtility_GetIsEligibleForBTSmartRoutingConsideration(v8)
          && CMSM_GetLocalSessionPriority(v8, 1) > 0x64)
        {
          break;
        }
      }
      if (v4 == ++v7)
      {
        v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v6 = 0;
  }
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  return v6;
}

- (BOOL)sessionUtilizesIndependentRecordingOnly:(id)a3
{
  int IsAdditiveRoutingEnabled;

  IsAdditiveRoutingEnabled = CMSMVAUtility_IsAdditiveRoutingEnabled();
  if (IsAdditiveRoutingEnabled)
  {
    if ((objc_msgSend(a3, "isRoutedToOnDemandVAD") & 1) != 0
      || (IsAdditiveRoutingEnabled = objc_msgSend(a3, "willRouteToOnDemandVADOnActivation")) != 0)
    {
      if ((objc_msgSend(a3, "hasAudioMode:", CFSTR("SoundRecognition")) & 1) != 0)
      {
        LOBYTE(IsAdditiveRoutingEnabled) = 1;
      }
      else
      {
        IsAdditiveRoutingEnabled = objc_msgSend(a3, "mixesWithEveryone");
        if (IsAdditiveRoutingEnabled)
          LOBYTE(IsAdditiveRoutingEnabled) = CMSMUtility_IsCategoryInputOnly((const void *)objc_msgSend(a3, "audioCategory"));
      }
    }
  }
  return IsAdditiveRoutingEnabled;
}

- (void)updateSupportedOutputChannelLayouts
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  const void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = -[MXSessionManager copyMXCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyMXCoreSessionList");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v7, "isActive", v11, v12)
          && CMSUtility_SessionCanBeAndAllowedToBeNowPlayingApp(v7))
        {
          cf = 0;
          FigRoutingManagerContextUtilities_CopySystemMusicContextUUID((uint64_t)&cf);
          v8 = (const void *)FigRoutingManagerContextUtilities_CopySupportedOutputChannelLayouts((uint64_t)cf);
          objc_msgSend(v7, "supportedOutputChannelLayouts");
          if (FigCFEqual())
          {
            if (dword_1EE2B3F38)
            {
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          else
          {
            if (dword_1EE2B3F38)
            {
              v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            objc_msgSend(v7, "setSupportedOutputChannelLayouts:", v8, v11, v12);
            CMSMNotificationUtility_PostSupportedBufferedAudioCapabilitiesDidChange(v7);
          }
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          if (v8)
            CFRelease(v8);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (BOOL)carPlayIsConnected
{
  return self->_carPlayIsConnected;
}

- (void)setUplinkMutedBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (unsigned)defaultVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A4C28), "unsignedIntValue");
}

- (unsigned)systemSoundLocalVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A4C48), "unsignedIntValue");
}

- (unsigned)musicVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A8748), "unsignedIntValue");
}

- (BOOL)isCurrentPortTypeMuteable:(unsigned int)a3
{
  id v3;

  if (a3)
    v3 = -[NSDictionary objectForKey:](-[MXSessionManager vadOutputPortTypeToMuteabilityDict](self, "vadOutputPortTypeToMuteabilityDict"), "objectForKey:", a3);
  else
    v3 = 0;
  return objc_msgSend(v3, "isEqualToString:", 0x1E30A25A8);
}

- (BOOL)isAudioCategoryMuteable:(id)a3
{
  if (a3)
    return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager figCategoryToMuteabilityDict](self, "figCategoryToMuteabilityDict"), "objectForKey:", a3), "isEqualToString:", 0x1E30A25A8);
  else
    return 0;
}

- (NSDictionary)vadOutputPortTypeToMuteabilityDict
{
  return self->_vadOutputPortTypeToMuteabilityDict;
}

- (NSDictionary)figCategoryToMuteabilityDict
{
  return self->_figCategoryToMuteabilityDict;
}

- (unsigned)siriOutputVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A8728), "unsignedIntValue");
}

- (void)setSpeakerAlertVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A4C88);
}

- (void)setActuatorVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A8708);
}

- (unsigned)speakerAlertVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A4C88), "unsignedIntValue");
}

- (unsigned)perAppAirPlayVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A8768), "unsignedIntValue");
}

- (unsigned)lowLatencyVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A8788), "unsignedIntValue");
}

- (void)setDecoupledInputVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A86E8);
}

- (void)setSystemSoundRemoteVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A4C68);
}

- (void)setSystemSoundLocalVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A4C48);
}

- (void)setSpeechDetectionVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A86C8);
}

- (void)setSiriOutputVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A8728);
}

- (void)setPerAppAirPlayVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A8768);
}

- (void)setMusicVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A8748);
}

- (void)setLowLatencyVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A8788);
}

- (unsigned)actuatorVADID
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", 0x1E30A8708), "unsignedIntValue");
}

- (unsigned)currentStream0
{
  return self->_currentStream0;
}

- (unint64_t)mxCoreSessionListAddSession:(id)a3
{
  unint64_t v4;
  id location;

  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"), 0xFFFFFFFFFFFFFFFFLL);
  -[NSPointerArray addPointer:](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "addPointer:", objc_loadWeak(&location));
  -[NSPointerArray compact](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "compact");
  v4 = -[NSPointerArray count](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "count");
  dispatch_semaphore_signal((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"));
  objc_destroyWeak(&location);
  return v4;
}

- (NSDictionary)vadInputPortTypeToFigInputDeviceNameDict
{
  return self->_vadInputPortTypeToFigInputDeviceNameDict;
}

- (unint64_t)addSessionThatWantsToSuspendNeroScreenMirroring:(id)a3
{
  void *v4;
  unint64_t v5;
  id location;

  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"), 0xFFFFFFFFFFFFFFFFLL);
  -[NSPointerArray addPointer:](-[MXSessionManager sessionsThatWantToSuspendNeroScreenMirroring](self, "sessionsThatWantToSuspendNeroScreenMirroring"), "addPointer:", objc_loadWeak(&location));
  v4 = (void *)MEMORY[0x194035B20](-[NSPointerArray compact](-[MXSessionManager sessionsThatWantToSuspendNeroScreenMirroring](self, "sessionsThatWantToSuspendNeroScreenMirroring"), "compact"));
  v5 = -[NSArray count](-[NSPointerArray allObjects](-[MXSessionManager sessionsThatWantToSuspendNeroScreenMirroring](self, "sessionsThatWantToSuspendNeroScreenMirroring"), "allObjects"), "count");
  objc_autoreleasePoolPop(v4);
  dispatch_semaphore_signal((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"));
  objc_destroyWeak(&location);
  return v5;
}

- (NSPointerArray)sessionsThatWantToSuspendNeroScreenMirroring
{
  return self->_sessionsThatWantToSuspendNeroScreenMirroring;
}

- (unsigned)currentSpeechDetectStyle:(id)a3
{
  uint64_t CurrentOutputPortAtIndex;
  _BOOL4 v6;
  char v7;
  unsigned int v8;
  NSPointerArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int DoesBluetoothSupportFeature;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  CurrentOutputPortAtIndex = CMSMUtility_GetCurrentOutputPortAtIndex(0);
  DoesBluetoothSupportFeature = vaeDoesBluetoothSupportFeature(CurrentOutputPortAtIndex);
  v6 = -[MXSessionManager wombatEnabled](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "wombatEnabled");
  v7 = v6;
  if (v6)
    v8 = 4;
  else
    v8 = 0;
  if (!v6 && DoesBluetoothSupportFeature)
    v8 = objc_msgSend(a3, "hasAudioCategory:", CFSTR("SpeechDetect"));
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList");
  v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v24 = 0;
    v12 = *(_QWORD *)v26;
LABEL_9:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v12)
        objc_enumerationMutation(v9);
      v14 = v8 ? v7 : 1;
      if (v14 & 1 | (DoesBluetoothSupportFeature == 0))
        break;
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
      if ((objc_msgSend(v15, "hasAudioCategory:", CFSTR("SpeechDetect")) & 1) == 0
        && objc_msgSend(v15, "isActive")
        && !CMSUtility_DoesSessionRemainActiveAfterStoppingPlaying(v15))
      {
        v16 = -[MXSessionManager getSpeechDetectStyleForSessionConfiguration:](self, "getSpeechDetectStyleForSessionConfiguration:", v15);
        switch(v16)
        {
          case 2u:
            v17 = v24;
            if (v8 != 2)
              v17 = v15;
            v24 = v17;
            v8 = 2;
            break;
          case 3u:
            v18 = v24;
            if ((v8 & 0xFFFFFFFE) != 2)
              v18 = v15;
            v24 = v18;
            if ((v8 & 0xFFFFFFFE) != 2)
              v8 = 3;
            break;
          case 4u:
            v8 = 4;
            goto LABEL_33;
        }
      }
      if (v11 == ++v13)
      {
        v19 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v11 = v19;
        if (v19)
          goto LABEL_9;
        break;
      }
    }
  }
LABEL_33:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  if (v8 != currentSpeechDetectStyle__sPreviousSpeechDetectStyle && dword_1EE2B3F38 != 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  currentSpeechDetectStyle__sPreviousSpeechDetectStyle = v8;
  return v8;
}

- (BOOL)wombatEnabled
{
  BOOL wombatEnabled;

  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  wombatEnabled = self->_wombatEnabled;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
  return wombatEnabled;
}

- (BOOL)isSessionWithAudioCategoryActive:(id)a3
{
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive") && (objc_msgSend(v10, "hasAudioCategory:", a3) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_12;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v11;
}

- (BOOL)isSessionWithAudioModeRecording:(id)a3
{
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive")
          && objc_msgSend(v10, "isRecording")
          && (objc_msgSend(v10, "hasAudioMode:", a3) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_13;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v11;
}

- (BOOL)isSessionWithAudioModePlaying:(id)a3
{
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive")
          && objc_msgSend(v10, "isPlaying")
          && (objc_msgSend(v10, "hasAudioMode:", a3) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_13;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v11;
}

- (BOOL)areSessionsWithAudioModesActive:(id)a3
{
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive")
          && (objc_msgSend(a3, "containsObject:", objc_msgSend(v10, "audioMode")) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_12;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v11;
}

- (NSSet)audioModesWithShortVoicePromptStyle
{
  return self->_audioModesWithShortVoicePromptStyle;
}

- (BOOL)isSessionWithAudioModeActive:(id)a3
{
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive") && (objc_msgSend(v10, "hasAudioMode:", a3) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_12;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v11;
}

- (BOOL)areBothBudsInEarForA2DPPort
{
  uint64_t CurrentOutputPortAtIndex;
  AudioObjectID v3;
  int DoesBTPortSupportInEarDetection;

  CurrentOutputPortAtIndex = CMSMUtility_GetCurrentOutputPortAtIndex(0);
  v3 = CurrentOutputPortAtIndex;
  if (vaeGetPortTypeFromPortID(CurrentOutputPortAtIndex) != 1885892674)
    goto LABEL_5;
  DoesBTPortSupportInEarDetection = vaeDoesBTPortSupportInEarDetection(v3);
  if (DoesBTPortSupportInEarDetection)
  {
    if (vaeGetBTPortPrimaryBudInEarStatus(v3) == 1)
    {
      LOBYTE(DoesBTPortSupportInEarDetection) = vaeGetBTPortSecondaryBudInEarStatus(v3) == 1;
      return DoesBTPortSupportInEarDetection;
    }
LABEL_5:
    LOBYTE(DoesBTPortSupportInEarDetection) = 0;
  }
  return DoesBTPortSupportInEarDetection;
}

- (void)setCurrentAudioMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (void)setCurrentAudioCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void)volumePreferenceDidChangeCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  id v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSPointerArray *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __CFString *CurrentAudioDestination;
  float v22;
  float v23;
  void *v24;
  int CurrentOutputVADID;
  const void *CurrentRouteTypeForSystemSoundAtIndex;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  __CFString *VADNameForVADID;
  const void *CurrentRouteTypeAtIndex;
  NSObject *v33;
  unsigned int v34;
  unsigned int v35;
  __CFString *v36;
  float v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  MXSessionManager *v42;
  void *v43;
  BOOL v44;
  void *v45;
  char v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  os_log_type_t type;
  unsigned int v53;
  int v54;
  const char *v55;
  __int16 v56;
  __CFString *v57;
  __int16 v58;
  const void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "userInfo");
  v45 = (void *)objc_msgSend(v4, "objectForKey:", 0x1E30A1F68);
  v43 = (void *)objc_msgSend(v4, "objectForKey:", 0x1E30A1FC8);
  v5 = (void *)objc_msgSend(v4, "objectForKey:", 0x1E30A4AC8);
  objc_msgSend(v4, "objectForKey:", 0x1E30A3F28);
  v6 = (void *)objc_msgSend(v4, "objectForKey:", 0x1E30A9C88);
  objc_msgSend((id)objc_msgSend(v4, "objectForKey:", 0x1E30B3828), "floatValue");
  v8 = v7;
  objc_msgSend((id)objc_msgSend(v4, "objectForKey:", 0x1E30B3848), "floatValue");
  v10 = v9;
  v46 = objc_msgSend(v5, "isEqualToString:", CFSTR("ImplicitVolumeChange"));
  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v12 = v11;
  }
  else
  {
    v12 = PVMGetCurrentPreferredVolume();
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("Volume"));
  }
  objc_msgSend(v4, "removeObjectForKey:", 0x1E30B3828);
  objc_msgSend(v4, "removeObjectForKey:", 0x1E30B3848);
  MEMORY[0x1940352BC](gCMSM);
  if (CMSMVAUtility_IsAdditiveRoutingEnabled()
    && -[MXSessionManager voiceOverVADVolumeNeedsUpdate](self, "voiceOverVADVolumeNeedsUpdate"))
  {
    v13 = -[MXAdditiveRoutingManager copyActiveVoiceOverSessionPlayingToOnDemandVAD](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "copyActiveVoiceOverSessionPlayingToOnDemandVAD");
    v44 = v13 != 0;
    if (v13)
    {
      if (dword_1EE2B3F38)
      {
        v53 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSUtility_UpdatePlaybackVolume(v13, 0.0, 0.0);
    }

    -[MXSessionManager setVoiceOverVADVolumeNeedsUpdate:](self, "setVoiceOverVADVolumeNeedsUpdate:", 0);
  }
  else
  {
    v44 = 0;
    v13 = 0;
  }
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration", v38, v40);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList");
  v16 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (!v16)
  {
    -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
    v17 = 0;
LABEL_34:
    if (vaemSystemSoundLocalVADExists())
    {
      if (objc_msgSend(v17, "isActive")
        && (CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(v17),
            CurrentOutputVADID == -[MXSessionManager systemSoundLocalVADID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "systemSoundLocalVADID")))
      {
        CMSUtility_UpdatePlaybackVolume(v17, 0.0, 0.0);
      }
      else
      {
        CurrentRouteTypeForSystemSoundAtIndex = CMSMUtility_GetCurrentRouteTypeForSystemSoundAtIndex(0);
        if (dword_1EE2B3F38)
        {
          v53 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v28 = v53;
          if (os_log_type_enabled(v27, type))
            v29 = v28;
          else
            v29 = v28 & 0xFFFFFFFE;
          if (v29)
          {
            VADNameForVADID = CMSMUtility_GetVADNameForVADID(-[MXSessionManager systemSoundLocalVADID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "systemSoundLocalVADID"));
            v54 = 136315650;
            v55 = "-[MXSessionManager volumePreferenceDidChangeCallback:]";
            v56 = 2114;
            v57 = VADNameForVADID;
            v58 = 2114;
            v59 = CurrentRouteTypeForSystemSoundAtIndex;
            LODWORD(v41) = 32;
            v39 = &v54;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        vaemSetDeviceVolumeIfNotSet(-[MXSessionManager systemSoundLocalVADID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v39, v41), "systemSoundLocalVADID"), 0, CurrentRouteTypeForSystemSoundAtIndex, 0, 1.0, 0.0, 0.0);
      }
    }
    goto LABEL_46;
  }
  v42 = self;
  v47 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v49;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v49 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      if (objc_msgSend(v20, "isActive"))
      {
        if (objc_msgSend(v20, "hasAudioCategory:", CFSTR("VoiceOver")))
          v17 = v20;
        if ((!CMSMVAUtility_IsAdditiveRoutingEnabled() || (objc_msgSend(v20, "isEqual:", v13) & 1) == 0)
          && (objc_msgSend(v20, "currentlyControllingFlags") & 0x10) != 0)
        {
          CurrentAudioDestination = CMSUtility_GetCurrentAudioDestination(v20);
          if ((-[__CFString isEqualToString:](CurrentAudioDestination, "isEqualToString:", 0x1E30A4C28) & 1) != 0)
          {
            if (objc_msgSend((id)objc_msgSend(v20, "audioCategory"), "isEqualToString:", CFSTR("VoiceOver")))
            {
              v22 = 0.0;
              v23 = 0.0;
              v24 = v20;
            }
            else
            {
              v24 = v20;
              v22 = v8;
              v23 = v10;
            }
            CMSUtility_UpdatePlaybackVolume(v24, v22, v23);
            LOBYTE(v47) = 1;
          }
          else
          {
            CMSUtility_UpdatePlaybackVolume(v20, v8, v10);
            HIDWORD(v47) |= -[__CFString isEqualToString:](CurrentAudioDestination, "isEqualToString:", 0x1E30A4C48);
          }
        }
      }
    }
    v16 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  }
  while (v16);
  -[MXSessionManager mxCoreSessionListEndIteration](v42, "mxCoreSessionListEndIteration");
  LOBYTE(v16) = v47;
  if ((v47 & 0x100000000) == 0)
    goto LABEL_34;
LABEL_46:
  if ((v16 & 1) == 0
    && CMSMDeviceState_IsVoiceOverOn()
    && (!CMSMVAUtility_IsAdditiveRoutingEnabled() || !v44))
  {
    CurrentRouteTypeAtIndex = (const void *)CMSMUtility_GetCurrentRouteTypeAtIndex(0);
    if (dword_1EE2B3F38)
    {
      v53 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v34 = v53;
      if (os_log_type_enabled(v33, type))
        v35 = v34;
      else
        v35 = v34 & 0xFFFFFFFE;
      if (v35)
      {
        v36 = CMSMUtility_GetVADNameForVADID(-[MXSessionManager defaultVADID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "defaultVADID"));
        v54 = 136315650;
        v55 = "-[MXSessionManager volumePreferenceDidChangeCallback:]";
        v56 = 2114;
        v57 = v36;
        v58 = 2114;
        v59 = CurrentRouteTypeAtIndex;
        LODWORD(v41) = 32;
        v39 = &v54;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    vaemSetDeviceVolumeIfNotSet(-[MXSessionManager defaultVADID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v39, v41), "defaultVADID"), 0, CurrentRouteTypeAtIndex, 0, v12, 0.0, 0.0);
  }
  MEMORY[0x1940352C8](gCMSM);
  if ((v46 & 1) == 0
    && (!objc_msgSend(v45, "isEqualToString:", CFSTR("EmergencyAlert"))
     || (objc_msgSend(v43, "isEqualToString:", CFSTR("CustomVolume")) & 1) == 0))
  {
    MEMORY[0x1940352BC](gCMSM);
    v37 = *(float *)&dword_1EE2B3C44;
    MEMORY[0x1940352C8](gCMSM);
    if (v37 != v12)
    {
      MEMORY[0x1940352BC](gCMSM);
      dword_1EE2B3C44 = LODWORD(v12);
      MEMORY[0x1940352C8](gCMSM);
      CMSMNotificationUtility_PostVolumeDidChangeToVolumeButtonClientsWithPayload(v4);
    }
    CMSMNotificationUtility_PostVolumeDidChangeToAVSystemControllersWithPayload((uint64_t)v4);
  }
}

- (BOOL)voiceOverVADVolumeNeedsUpdate
{
  return self->_voiceOverVADVolumeNeedsUpdate;
}

- (void)cleanupSessionAssertionsIfNeeded:(id)a3 cleanupReason:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11[2];
  int v12;
  id location;

  if (a3 && objc_msgSend(a3, "audioSessionID"))
  {
    objc_initWeak(&location, a3);
    v6 = objc_msgSend(a3, "audioSessionID");
    if (objc_msgSend(a3, "clientName"))
      v7 = objc_msgSend(a3, "clientName");
    else
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN-client-%u"), v6);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v7);
    v9 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__MXSessionManager_Utilities__cleanupSessionAssertionsIfNeeded_cleanupReason___block_invoke;
    v10[3] = &unk_1E309EB98;
    objc_copyWeak(v11, &location);
    v12 = v6;
    v11[1] = (id)a4;
    v10[4] = v8;
    MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) cleanupSessionAssertionsIfNeeded:cleanupReason:]", (uint64_t)"MXSessionManagerUtilities.m", 2125, 0, 0, v9, (uint64_t)v10);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __78__MXSessionManager_Utilities__cleanupSessionAssertionsIfNeeded_cleanupReason___block_invoke(uint64_t a1)
{
  id Weak;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(Weak, "playbackAssertionRef"))
    objc_msgSend(v3, "addObject:", objc_msgSend(Weak, "playbackAssertionRef"));
  if (objc_msgSend(Weak, "resumeAssertionRef"))
    objc_msgSend(v3, "addObject:", objc_msgSend(Weak, "resumeAssertionRef"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_msgSend(Weak, "hostProcessPlaybackAssertions");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", objc_msgSend((id)objc_msgSend(Weak, "hostProcessPlaybackAssertions"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%x"), *(unsigned int *)(a1 + 56));
  MX_RunningBoardServices_InvalidatePlaybackAssertionsContainingSessionID((uint64_t)v9, v3, *(_DWORD *)(a1 + 48));

}

- (void)unduckSessionsForDucker:(id)a3
{
  id v5;
  MXDuckingSource *v6;
  uint64_t v7;
  double v8;
  double v9;
  MXDuckingSource *v10;
  NSPointerArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = [MXDuckingSource alloc];
  v7 = objc_msgSend((id)objc_msgSend(a3, "ID"), "longLongValue");
  LODWORD(v8) = 0;
  LODWORD(v9) = 0;
  v10 = -[MXDuckingSource initWithType:ID:duckVolume:duckFadeDuration:](v6, "initWithType:ID:duckVolume:duckFadeDuration:", 2, v7, v8, v9);
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
  v12 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v16, "isDucked")
          && -[MXSessionManager isSessionDucked:duckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSessionDucked:duckingSource:", v16, v10))
        {
          objc_msgSend(v5, "addObject:", v16);
        }
      }
      v13 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v13);
  }
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  -[MXSessionManager startAsyncDuckingOperation](self, "startAsyncDuckingOperation");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v5);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        -[MXSessionManager unduckVolume:sessionCausingUnduck:duckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "unduckVolume:sessionCausingUnduck:duckingSource:", v21, a3, v10);
        if (objc_msgSend(v21, "duckCommandSentToCarSession"))
          objc_msgSend(v21, "setDuckCommandSentToCarSession:", 0);
      }
      v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }
  -[MXSessionManager endAsyncDuckingOperationForSession:](self, "endAsyncDuckingOperationForSession:", a3);

}

- (void)applyUplinkMute:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v6;
  NSObject *v7;
  NSObject *v8;
  MXSessionManager *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v6 = CMSUtility_CopyBundleID(a3);
    if (objc_msgSend(a3, "hasPhoneCallBehavior")
      && -[NSNumber BOOLValue](-[MXSessionManager applyUplinkMuteToPhoneCallBehaviorSession](self, "applyUplinkMuteToPhoneCallBehaviorSession"), "BOOLValue"))
    {
      -[MXSessionManager updateMutedBundleIDs:muteValue:](self, "updateMutedBundleIDs:muteValue:", v6, 1);
      if (dword_1EE2B3F38)
      {
        v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXSessionManager setApplyUplinkMuteToPhoneCallBehaviorSession:](self, "setApplyUplinkMuteToPhoneCallBehaviorSession:", 0, v12, v13);
    }
    if (objc_msgSend(a3, "isActive")
      && objc_msgSend(a3, "isRecording")
      && (objc_msgSend(a3, "isRecordingMuted") & 1) == 0
      && -[NSSet containsObject:](-[MXSessionManager mutedSessionBundleIDs](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mutedSessionBundleIDs"), "containsObject:", v6))
    {
      if (dword_1EE2B3F38)
      {
        v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v9 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v12, v13);
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      *(_QWORD *)&v11 = -1;
      *((_QWORD *)&v11 + 1) = -1;
      v14[0] = v11;
      v14[1] = v11;
      -[MXSessionManager updateMuteState:muteValue:](v9, "updateMuteState:muteValue:", v14, v10);
    }

  }
}

- (NSArray)recordingClientPIDs
{
  NSArray *v3;

  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  if (-[NSArray count](self->_recordingClientPIDs, "count"))
    v3 = (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_recordingClientPIDs, 1);
  else
    v3 = 0;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
  return v3;
}

- (id)getDefaultBuiltInCustomizedAlternateCategory:(id)a3 defaultBuiltInRoute:(id)a4
{
  NSDictionary *v7;
  id result;

  if (!a3)
    return 0;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("Speaker")))
  {
    v7 = -[MXSessionManager figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict](self, "figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict");
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("Receiver")))
  {
    v7 = -[MXSessionManager figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict](self, "figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict");
  }
  else
  {
    if (a4)
    {
      result = 0;
      goto LABEL_11;
    }
    v7 = -[MXSessionManager figCustomizedCategoryWithDefaultBuiltIn_Default_Dict](self, "figCustomizedCategoryWithDefaultBuiltIn_Default_Dict");
  }
  result = -[NSDictionary objectForKey:](v7, "objectForKey:", a3);
LABEL_11:
  if (!result)
    return a3;
  return result;
}

- (NSDictionary)figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict
{
  return self->_figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict;
}

- (void)replaceMutedBundleIDwithHostID
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  id v5;
  uint64_t i;
  uint64_t v7;
  NSPointerArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  id v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  os_log_type_t type;
  unsigned int v46;
  int v47;
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", -[MXSessionManager mutedSessionBundleIDs](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mutedSessionBundleIDs"));
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v4;
    v31 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    if (v31)
    {
      v30 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v8 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
          v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v38 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v13, "displayID"), "isEqualToString:", v7)
                  && objc_msgSend(v13, "hasPhoneCallBehavior"))
                {
                  objc_msgSend(v5, "addObject:", v13);
                }
              }
              v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
            }
            while (v10);
          }
          -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      }
      while (v31);
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
    if (v14)
    {
      v15 = v14;
      v32 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v34 != v32)
            objc_enumerationMutation(v5);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * k);
          -[MXSessionManager updateMutedBundleIDs:muteValue:](self, "updateMutedBundleIDs:muteValue:", objc_msgSend(v17, "displayID", v27, v28), 0);
          v18 = CMSUtility_CopyBundleID(v17);
          -[MXSessionManager updateMutedBundleIDs:muteValue:](self, "updateMutedBundleIDs:muteValue:", v18, 1);
          if (objc_msgSend((id)objc_msgSend(v17, "displayID"), "isEqualToString:", -[MXSessionManager uplinkMutedBundleID](self, "uplinkMutedBundleID")))
          {
            if (dword_1EE2B3F38)
            {
              v46 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v20 = v46;
              if (os_log_type_enabled(v19, type))
                v21 = v20;
              else
                v21 = v20 & 0xFFFFFFFE;
              if (v21)
              {
                v22 = objc_msgSend(v17, "displayID");
                v47 = 136315651;
                v48 = "-[MXSessionManager(Utilities) replaceMutedBundleIDwithHostID]";
                v49 = 2113;
                v50 = v22;
                v51 = 2113;
                v52 = v18;
                LODWORD(v28) = 32;
                v27 = &v47;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            -[MXSessionManager setUplinkMutedBundleID:](self, "setUplinkMutedBundleID:", v18, v27, v28);
          }
          if (dword_1EE2B3F38)
          {
            v46 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v24 = v46;
            if (os_log_type_enabled(v23, type))
              v25 = v24;
            else
              v25 = v24 & 0xFFFFFFFE;
            if (v25)
            {
              v26 = objc_msgSend(v17, "displayID");
              v47 = 136315651;
              v48 = "-[MXSessionManager(Utilities) replaceMutedBundleIDwithHostID]";
              v49 = 2113;
              v50 = v26;
              v51 = 2113;
              v52 = v18;
              LODWORD(v28) = 32;
              v27 = &v47;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }

        }
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
      }
      while (v15);
    }

  }
}

- (NSSet)mutedSessionBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)isSiriSessionActiveAndRoutedToSiriOutputVAD
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  int CurrentOutputVADID;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "isActive"))
        {
          if (objc_msgSend(v6, "isTheAssistant"))
          {
            CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(v6);
            if (CurrentOutputVADID == -[MXSessionManager siriOutputVADID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "siriOutputVADID"))
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

- (void)cancelAnyInProgressRampIfNeeded:(id)a3 reason:(unsigned __int16)a4
{
  uint64_t CurrentOutputVADID;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
  if (vaemIsVolumeRampInProgress(CurrentOutputVADID)
    && !-[MXSessionManager isAnyOtherUnduckedPlayingSessionMatchingVolumeRampCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isAnyOtherUnduckedPlayingSessionMatchingVolumeRampCategory:", a3))
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    vaemDeviceCancelVolumeRamp(CurrentOutputVADID, a4);
  }
}

- (BOOL)uplinkMuteSetByClient
{
  return self->_uplinkMuteSetByClient;
}

- (void)updateNeroScreenState:(id)a3 suspendScreen:(BOOL)a4
{
  _BOOL4 v4;
  MXSessionManager *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  BOOL v10;

  v4 = a4;
  v6 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
  if (v4)
    v7 = -[MXSessionManager addSessionThatWantsToSuspendNeroScreenMirroring:](v6, "addSessionThatWantsToSuspendNeroScreenMirroring:", a3);
  else
    v7 = -[MXSessionManager removeSessionThatWantsToSuspendNeroScreenMirroring:](v6, "removeSessionThatWantsToSuspendNeroScreenMirroring:", a3);
  v8 = v7;
  if (v7)
    v9 = updateNeroScreenState_suspendScreen__sCurrentCount == 0;
  else
    v9 = 0;
  if (v9)
  {
    FigRoutingManagerSuspendCurrentEndpointScreen((uint64_t)-[MXSessionManager systemMirroringRoutingContextUUID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "systemMirroringRoutingContextUUID"));
  }
  else
  {
    if (v7)
      v10 = 1;
    else
      v10 = updateNeroScreenState_suspendScreen__sCurrentCount == 0;
    if (!v10)
      FigRoutingManagerResumeCurrentEndpointScreen((uint64_t)-[MXSessionManager systemMirroringRoutingContextUUID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "systemMirroringRoutingContextUUID"));
  }
  updateNeroScreenState_suspendScreen__sCurrentCount = v8;
}

- (void)setRecordingClientPIDs:(id)a3
{
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");

  self->_recordingClientPIDs = (NSArray *)a3;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
}

uint64_t __34__MXSessionManager_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance_2 = objc_alloc_init(MXSessionManager);
  return objc_msgSend((id)sharedInstance_sSharedInstance_2, "setUpStringConversionDictionaries");
}

+ (id)copyDefaultMusicAppFromPlist
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  __CFString *Value;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  CelestialGetModelSpecificName();
  v2 = (const __CFDictionary *)CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  if (v2)
  {
    v3 = v2;
    Value = (__CFString *)CFDictionaryGetValue(v2, CFSTR("DefaultMusicApp"));
    if (Value)
      v5 = Value;
    else
      v5 = CFSTR("com.apple.Music");
    v6 = v5;
    CFRelease(v3);
  }
  else
  {
    v5 = CFSTR("com.apple.Music");
    v7 = CFSTR("com.apple.Music");
  }
  return v5;
}

+ (BOOL)getSilentModeStateFromDisk
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("silentModeEnabled"), CFSTR("com.apple.mediaexperience"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (id)copySilentModeUntilTimeFromDisk
{
  return (id)CFPreferencesCopyValue(CFSTR("silentModeEnabledUntilTime"), CFSTR("com.apple.mediaexperience"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (MXSessionManager)init
{
  MXSessionManager *v2;
  double v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MXSessionManager;
  v2 = -[MXSessionManager init](&v14, sel_init);
  if (v2)
  {
    v2->_audioCategoriesWithInput = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Multi"), CFSTR("Record"), 0x1E30A2528, CFSTR("PlayAndRecord"), 0x1E30A2548, 0x1E30A2568, 0x1E30A2588, CFSTR("VoiceCommand"), CFSTR("VoiceCommand_WithBluetooth"), CFSTR("VoiceCommandThatMixes"), CFSTR("VoiceCommandThatMixes_WithBluetooth"), CFSTR("PhoneCall"), CFSTR("TTYCall"), 0);
    v2->_audioModesWithShortVoicePromptStyle = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("SpeechRecognition"), CFSTR("VoiceMessages"), 0);
    v2->_currentAudioCategory = 0;
    v2->_currentAudioMode = 0;
    v2->_defaultMusicApp = (NSString *)+[MXSessionManager copyDefaultMusicAppFromPlist](MXSessionManager, "copyDefaultMusicAppFromPlist");
    v2->_devicesSampleRates = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "systemUptime");
    if (v3 <= 45.0)
    {
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("mutedSessionBundleIDs"), 0);
    }
    v5 = (void *)MXCFPreferencesCopyPreference(CFSTR("mutedSessionBundleIDs"));
    v2->_mutedSessionBundleIDs = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);

    v2->_propertiesLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v2->_mxCoreSessionList = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
    v2->_mxCoreSessionListActiveReaders = 0;
    v2->_mxCoreSessionListReadLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v2->_mxCoreSessionListWriteSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v2->_sessionsThatWantToSuspendNeroScreenMirroring = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
    v2->_pickableRoutesDescriptions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled())
    {
      v6 = (void *)MXCFPreferencesCopyPreference(CFSTR("quiesceableWiredPortsAutoRouteOnConnectPreference"));
      v2->_quiesceableWiredPortsAutoRouteOnConnectPreference = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v6);

    }
    else
    {
      v2->_quiesceableWiredPortsAutoRouteOnConnectPreference = 0;
    }
    v2->_silentModeEnabled = +[MXSessionManager getSilentModeStateFromDisk](MXSessionManager, "getSilentModeStateFromDisk", v12, v13);
    v2->_silentModeEnabledUntilTime = (NSDate *)+[MXSessionManager copySilentModeUntilTimeFromDisk](MXSessionManager, "copySilentModeUntilTimeFromDisk");
    v7 = (void *)MXCFPreferencesCopyPreference(CFSTR("silentModeClientType"));
    v2->_silentModeClient = objc_msgSend(v7, "unsignedIntValue");
    v2->_silentModeReason = (NSString *)MXCFPreferencesCopyPreference(CFSTR("silentModeReason"));

    if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
    {
      v8 = (void *)MXCFPreferencesCopyPreference(CFSTR("duckScalarForVoiceOver"));
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "floatValue");
      else
        v10 = 1.0;
      v2->_duckScalarForVoiceOver = v10;

    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel_volumePreferenceDidChangeCallback_, 0x1E30B3808, +[MXPreferredVolumeManager sharedInstance](MXPreferredVolumeManager, "sharedInstance"));
    dword_1EE2B3C44 = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_audioCategoriesWithInput = 0;
  self->_audioDeviceInfo = 0;

  self->_audioModesWithShortVoicePromptStyle = 0;
  self->_appAllowedToFadeInTemporarily = 0;

  self->_appAllowedToInitiatePlaybackTemporarily = 0;
  self->_appAllowedToInitiateRecordingTemporarily = 0;

  self->_appAllowedToInitiateRecordingTemporarilyTimestamp = 0;
  self->_applyUplinkMuteToPhoneCallBehaviorSession = 0;

  self->_currentAudioCategory = 0;
  self->_currentAudioMode = 0;

  self->_defaultMusicApp = 0;
  self->_devicesSampleRates = 0;

  self->_propertiesLock = 0;
  self->_longFormVideoApps = 0;

  self->_mxCoreSessionList = 0;
  self->_mxCoreSessionListReadLock = 0;
  dispatch_release((dispatch_object_t)self->_mxCoreSessionListWriteSemaphore);
  self->_mxCoreSessionListWriteSemaphore = 0;

  self->_pickableRoutesDescriptions = 0;
  self->_recordingClientPIDs = 0;

  self->_quiesceableWiredPortsAutoRouteOnConnectPreference = 0;
  self->_mutedSessionBundleIDs = 0;

  self->_silentModeEnabledUntilTime = 0;
  self->_silentModeReason = 0;

  self->_systemMirroringRoutingContextUUID = 0;
  self->_figUncustomizedCategory_Dict = 0;

  self->_figCustomizedCategoryWithBluetooth_Dict = 0;
  self->_figCustomizedCategoryWithoutBluetooth_Dict = 0;

  self->_figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict = 0;
  self->_figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict = 0;

  self->_figCustomizedCategoryWithDefaultBuiltIn_Default_Dict = 0;
  self->_figCategoryToMuteabilityDict = 0;

  self->_figCategoryToOutputOverridabilityDict = 0;
  self->_figCategoryToVADCategoryDict = 0;

  self->_figRouteToVADOutputPortTypeDict = 0;
  self->_figRouteToVADInputPortTypeDict = 0;

  self->_vadOutputPortTypeToFigOutputDeviceNameDict = 0;
  self->_vadOutputPortTypeToMuteabilityDict = 0;

  self->_vadInputPortTypeToFigInputDeviceNameDict = 0;
  self->_figModeTypeToVADModeType = 0;

  self->_uplinkMutedBundleID = 0;
  self->_sessionsThatWantToSuspendNeroScreenMirroring = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXSessionManager;
  -[MXSessionManager dealloc](&v3, sel_dealloc);
}

- (NSArray)longFormVideoApps
{
  NSArray *v3;

  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  if (-[MXNowPlayingAppManager nowPlayingAppDisplayID](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "nowPlayingAppDisplayID"))
  {
    v3 = (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_longFormVideoApps, 1);
  }
  else
  {
    v3 = 0;
  }
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
  return v3;
}

- (void)setLongFormVideoApps:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock", v6, v7), "lock");

  self->_longFormVideoApps = (NSArray *)a3;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
}

- (void)setSystemMirroringRoutingContextUUID:(id)a3
{
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");

  self->_systemMirroringRoutingContextUUID = (NSString *)a3;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
}

- (void)setWombatEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 wombatEnabled;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  wombatEnabled = self->_wombatEnabled;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
  if (wombatEnabled != v3)
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock", v7, v8), "lock");
    self->_wombatEnabled = v3;
    -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
    if (v3)
      -[MXSessionManager interruptActiveSessionsNotOptedIntoWombat](self, "interruptActiveSessionsNotOptedIntoWombat");
    CMSMNotificationUtility_PostWombatEnabledDidChange(v3);
    CMSMNotificationUtility_PostSpeechDetectStyleDidChangeIfNeeded(0, 0);
  }
}

- (float)duckScalarForVoiceOver
{
  float duckScalarForVoiceOver;

  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  duckScalarForVoiceOver = self->_duckScalarForVoiceOver;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
  return duckScalarForVoiceOver;
}

- (void)setDuckScalarForVoiceOver:(float)a3
{
  float v5;
  float v6;
  float duckScalarForVoiceOver;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  id v10;
  double v11;
  void *v12;

  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
  {
    v5 = fminf(a3, 1.0);
    if (v5 >= 0.0)
      v6 = v5;
    else
      v6 = 0.0;
    -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
    duckScalarForVoiceOver = self->_duckScalarForVoiceOver;
    self->_duckScalarForVoiceOver = v6;
    -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (vabds_f32(duckScalarForVoiceOver, v6) > 0.01)
    {
      if (CMSMDeviceState_IsVoiceOverOn())
      {
        -[MXSessionManager startAsyncDuckingOperation](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "startAsyncDuckingOperation");
        -[MXSessionManager updateDuckedSessionsForVoiceOver:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateDuckedSessionsForVoiceOver:", 0);
        -[MXSessionManager endAsyncDuckingOperation](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "endAsyncDuckingOperation");
      }
      v10 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v11 = v6;
      v12 = (void *)objc_msgSend(v10, "initWithFloat:", v11);
      MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("duckScalarForVoiceOver"), v12);

    }
  }
  else if (dword_1EE2B3F38)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (NSString)appAllowedToInitiateRecordingTemporarily
{
  double v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  NSString *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");
  if (!self->_appAllowedToInitiateRecordingTemporarilyTimestamp)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceDate:", self->_appAllowedToInitiateRecordingTemporarilyTimestamp);
  if (v3 > 5.0)
  {

    self->_appAllowedToInitiateRecordingTemporarily = 0;
    self->_appAllowedToInitiateRecordingTemporarilyTimestamp = 0;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_7;
  }
  if (dword_1EE2B3F38)
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = self->_appAllowedToInitiateRecordingTemporarily;
LABEL_9:
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock", v8, v9), "unlock");
  return v6;
}

- (void)setAppAllowedToInitiateRecordingTemporarily:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");

  self->_appAllowedToInitiateRecordingTemporarily = 0;
  self->_appAllowedToInitiateRecordingTemporarilyTimestamp = 0;
  if (objc_msgSend(a3, "length"))
  {
    self->_appAllowedToInitiateRecordingTemporarily = (NSString *)a3;
    self->_appAllowedToInitiateRecordingTemporarilyTimestamp = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    if (dword_1EE2B3F38)
      goto LABEL_5;
  }
  else if (dword_1EE2B3F38)
  {
LABEL_5:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock", v6, v7), "unlock");
}

- (void)appToInterruptCurrentNowPlayingSession:(id)a3
{
  unsigned __int8 v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3 == 0;
  if (a3)
    v6 = CMSMUtility_CopyActiveMXCoreSessionEligibleForNowPlayingAppConsideration((uint64_t)a3);
  else
    v6 = 0;
  v4 = CMSMNP_CopyNowPlayingAppSession();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "audioSessionID"))
      CMSMUtility_PostStopCommandToShadowingSessionsForSession(v5, v3);
    CMSMNotificationUtility_PostStopCommandToActiveClientWithDisplayID(objc_msgSend(v5, "displayID"), 0);
  }
  if (v6)
  {
    CMSUtility_UpdateRoutingContextForSession(v6);
    -[MXNowPlayingAppManager updateNowPlayingApp:session:reasonForUpdate:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "updateNowPlayingApp:session:reasonForUpdate:", objc_msgSend((id)objc_msgSend(v6, "clientPID"), "intValue"), 0, 4);
  }

}

- (void)interruptActiveSessionsNotOptedIntoWombat
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  MXSessionManager *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = self;
  v3 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList");
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "isActive", v10, v11)
          && (objc_msgSend(v8, "prefersToPlayDuringWombat") & 1) == 0)
        {
          if (dword_1EE2B3F38)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
        }
      }
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  -[MXSessionManager mxCoreSessionListEndIteration](v12, "mxCoreSessionListEndIteration", v10, v11);
}

- (void)makeStarkPortRoutableForPhoneCall:(BOOL)a3
{
  _BOOL4 v3;
  __CFArray *v4;
  __CFArray *v5;
  __CFArray *v6;
  AudioObjectID PortOfTypeInConnectedPortsList;

  v3 = a3;
  v4 = CMSMUtility_CopyCurrentRouteTypes();
  if (!v3 || FigCFArrayContainsValue())
  {
    if (!v4)
      return;
    goto LABEL_4;
  }
  v5 = CMSMUtility_CopyMostImportantPlayingSession();
  v6 = v5;
  if (v5
    && ((-[__CFArray hasPhoneCallBehavior](v5, "hasPhoneCallBehavior") & 1) != 0
     || CMSUtility_IsAudioCategoryRingtone(v6)))
  {
    PortOfTypeInConnectedPortsList = CMSMVAUtility_GetPortOfTypeInConnectedPortsList(1886614639);
    if (cmsmRequestCarMainAudioForSession(v6))
    {
      if (PortOfTypeInConnectedPortsList)
        CMSMVAUtility_MakeConnectedPortRoutable(PortOfTypeInConnectedPortsList);
    }
  }

  if (v4)
LABEL_4:
    CFRelease(v4);
}

- (void)makeStarkPortRoutableForPlayingSession:(BOOL)a3
{
  AudioObjectID PortOfTypeInConnectedPortsList;
  __CFArray *v4;
  int v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a3)
  {
    PortOfTypeInConnectedPortsList = CMSMVAUtility_GetPortOfTypeInConnectedPortsList(1886614639);
    v4 = CMSMUtility_CopyMostImportantPlayingSession();
    v5 = cmsmRequestCarMainAudioForSession(v4);

    if (v5 && PortOfTypeInConnectedPortsList)
      CMSMVAUtility_MakeConnectedPortRoutable(PortOfTypeInConnectedPortsList);
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (unint64_t)mxCoreSessionListRemoveSession:(id)a3
{
  unint64_t i;
  unint64_t v5;
  id location;

  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"), 0xFFFFFFFFFFFFFFFFLL);
  for (i = 0; i < -[NSPointerArray count](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "count"); ++i)
  {
    if (objc_msgSend(-[NSPointerArray pointerAtIndex:](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "pointerAtIndex:", i), "isEqual:", objc_loadWeak(&location)))
    {
      -[NSPointerArray removePointerAtIndex:](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "removePointerAtIndex:", i);
      -[NSPointerArray compact](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "compact");
      break;
    }
  }
  v5 = -[NSPointerArray count](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "count");
  dispatch_semaphore_signal((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"));
  objc_destroyWeak(&location);
  return v5;
}

- (unint64_t)removeSessionThatWantsToSuspendNeroScreenMirroring:(id)a3
{
  unint64_t i;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  id location;

  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"), 0xFFFFFFFFFFFFFFFFLL);
  for (i = 0; ; ++i)
  {
    v5 = -[NSPointerArray count](-[MXSessionManager sessionsThatWantToSuspendNeroScreenMirroring](self, "sessionsThatWantToSuspendNeroScreenMirroring"), "count");
    if (i >= v5)
      break;
    if (objc_msgSend(-[NSPointerArray pointerAtIndex:](-[MXSessionManager sessionsThatWantToSuspendNeroScreenMirroring](self, "sessionsThatWantToSuspendNeroScreenMirroring"), "pointerAtIndex:", i), "isEqual:", objc_loadWeak(&location)))
    {
      -[NSPointerArray removePointerAtIndex:](-[MXSessionManager sessionsThatWantToSuspendNeroScreenMirroring](self, "sessionsThatWantToSuspendNeroScreenMirroring"), "removePointerAtIndex:", i);
      v5 = -[NSPointerArray compact](-[MXSessionManager sessionsThatWantToSuspendNeroScreenMirroring](self, "sessionsThatWantToSuspendNeroScreenMirroring"), "compact");
      break;
    }
  }
  v6 = (void *)MEMORY[0x194035B20](v5);
  v7 = -[NSArray count](-[NSPointerArray allObjects](-[MXSessionManager sessionsThatWantToSuspendNeroScreenMirroring](self, "sessionsThatWantToSuspendNeroScreenMirroring"), "allObjects"), "count");
  objc_autoreleasePoolPop(v6);
  dispatch_semaphore_signal((dispatch_semaphore_t)-[MXSessionManager mxCoreSessionListWriteSemaphore](self, "mxCoreSessionListWriteSemaphore"));
  objc_destroyWeak(&location);
  return v7;
}

- (void)nowPlayingAppShouldResumeForCarPlay:(BOOL)a3
{
  _BOOL4 v3;
  CFPropertyListRef v4;
  MXNowPlayingAppManager *v5;
  double v6;
  NSString *v7;
  CFPropertyListRef v8;
  NSObject *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v11;

  v3 = a3;
  CMSMNP_SetNowPlayingAppShouldResumeForCarPlay(a3);
  v4 = CMSMNP_CopyNowPlayingAppWasPlayingUponCarPlayDisconnectFromDisk();
  if (v4 != (CFPropertyListRef)*MEMORY[0x1E0C9AE50])
    v3 = 0;
  if (v4)
    CFRelease(v4);
  if (v3)
  {
    v5 = +[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance");
    if (-[MXNowPlayingAppManager nowPlayingAppStopTime](v5, "nowPlayingAppStopTime"))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "now"), "timeIntervalSinceDate:", -[MXNowPlayingAppManager nowPlayingAppStopTime](v5, "nowPlayingAppStopTime"));
      if (v6 < 480.0)
      {
        v7 = -[MXNowPlayingAppManager nowPlayingAppDisplayID](v5, "nowPlayingAppDisplayID");
        v8 = v7;
        if (v7)
          CFRetain(v7);
        if (!dword_1EE2B3F38)
          goto LABEL_19;
        goto LABEL_17;
      }
      v8 = CMSMNP_CopyNowPlayingAppDisplayIDUponCarPlayDisconnectFromDisk();
      if (dword_1EE2B3F38)
      {
LABEL_17:
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (dword_1EE2B3F38)
        {
          v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
    else
    {
      v8 = CMSMNP_CopyNowPlayingAppDisplayIDUponCarPlayDisconnectFromDisk();
      if (dword_1EE2B3F38)
        goto LABEL_17;
    }
LABEL_19:
    CMSMNP_ResumeNowPlayingAppOverCarPlay(v8);
    if (v8)
      CFRelease(v8);
    goto LABEL_21;
  }
  if (dword_1EE2B3F38)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_21:
  CMSMNP_WriteNowPlayingAppWasPlayingUponCarPlayDisconnectToDisk(0);
}

- (void)resetDefaultMusicApp
{
  NSString *v3;

  v3 = +[MXSessionManager copyDefaultMusicAppFromPlist](MXSessionManager, "copyDefaultMusicAppFromPlist");
  -[NSRecursiveLock lock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "lock");

  self->_defaultMusicApp = v3;
  -[NSRecursiveLock unlock](-[MXSessionManager propertiesLock](self, "propertiesLock"), "unlock");
}

- (void)handleSilentModeTimerDidFire
{
  NSObject *v3;
  _QWORD v4[5];

  v3 = MXGetSerialQueue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MXSessionManager_handleSilentModeTimerDidFire__block_invoke;
  v4[3] = &unk_1E3099900;
  v4[4] = self;
  MXDispatchAsync((uint64_t)"-[MXSessionManager handleSilentModeTimerDidFire]", (uint64_t)"MXSessionManager.m", 1195, 0, 0, v3, (uint64_t)v4);
}

uint64_t __48__MXSessionManager_handleSilentModeTimerDidFire__block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "setSilentModeEnabled:", objc_msgSend(*(id *)(a1 + 32), "silentModeEnabled", v4, v5) ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "setSilentModeEnabledUntilTime:", 0);
  -[MXAlarmEvents resetAlarmEvent:](+[MXAlarmEvents sharedInstance](MXAlarmEvents, "sharedInstance"), "resetAlarmEvent:", CFSTR("com.apple.mediaexperience.silentmode.timer"));
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("silentModeEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "silentModeEnabled")));
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("silentModeEnabledUntilTime"), 0);
  CMSMDeviceState_UpdateRingerStateForSilentMode(objc_msgSend(*(id *)(a1 + 32), "silentModeEnabled"));
  CMSMNotificationUtility_PostSilentModeEnabledDidChange(objc_msgSend(*(id *)(a1 + 32), "silentModeEnabled"));
  return -[MXBiomeStreams updateBiomeSilentMode:clientType:untilTime:reason:](+[MXBiomeStreams sharedInstance](MXBiomeStreams, "sharedInstance"), "updateBiomeSilentMode:clientType:untilTime:reason:", objc_msgSend(*(id *)(a1 + 32), "silentModeEnabled"), objc_msgSend(*(id *)(a1 + 32), "silentModeClient"), 0, objc_msgSend(*(id *)(a1 + 32), "silentModeReason"));
}

- (void)updateSilentModeTimer:(BOOL)a3 untilTime:(id)a4 clientType:(unsigned int)a5
{
  _BOOL4 v7;
  double v9;
  double v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "timeIntervalSinceNow");
  if (v9 <= 0.0)
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[MXSessionManager removeSilentModeTimer](self, "removeSilentModeTimer", v13, v14);
  }
  else
  {
    v10 = v9;
    if (a5 == 5
      && -[MXSessionManager silentModeEnabled](self, "silentModeEnabled") == v7
      && !-[MXSessionManager silentModeEnabledUntilTime](self, "silentModeEnabledUntilTime"))
    {
      if (dword_1EE2B3F38)
      {
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      -[MXAlarmEvents setAlarmEvent:eventName:](+[MXAlarmEvents sharedInstance](MXAlarmEvents, "sharedInstance"), "setAlarmEvent:eventName:", CFSTR("com.apple.mediaexperience.silentmode.timer"), v10);
      -[MXSessionManager setSilentModeEnabledUntilTime:](self, "setSilentModeEnabledUntilTime:", a4);
      MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("silentModeEnabledUntilTime"), a4);
    }
  }
}

- (void)updateSilentModeState:(BOOL)a3 untilTime:(id)a4 withReason:(id)a5 forClientType:(unsigned int)a6 updateForStartup:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v11;
  _BOOL4 v13;
  int v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSDate *v16;
  double v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v11 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v13 = -[MXSessionManager silentModeEnabled](self, "silentModeEnabled");
  v14 = v13;
  if (v7)
  {
    if (dword_1EE2B3F38)
    {
      v22 = v13;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v14 = v22;
    }
    v16 = -[MXSessionManager silentModeEnabledUntilTime](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v20, v21), "silentModeEnabledUntilTime");
    if (v16)
    {
      -[NSDate timeIntervalSinceNow](v16, "timeIntervalSinceNow");
      if (v17 > 0.0)
      {
        v11 = v11;
      }
      else
      {
        a4 = 0;
        v11 = v14 ^ 1u;
      }
    }
  }
  -[MXSessionManager setSilentModeClient:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "setSilentModeClient:", v8);
  -[MXSessionManager setSilentModeReason:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "setSilentModeReason:", a5);
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("silentModeClientType"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("silentModeReason"), a5);
  if (dword_1EE2B3F38)
  {
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXSessionManager updateSilentModeTimer:untilTime:clientType:](self, "updateSilentModeTimer:untilTime:clientType:", v11, a4, v8, v20, v21);
  if (v14 != (_DWORD)v11)
  {
    -[MXSessionManager setSilentModeEnabled:](self, "setSilentModeEnabled:", v11);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v11);
    MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("silentModeEnabled"), v19);

LABEL_13:
    CMSMDeviceState_UpdateRingerStateForSilentMode(v11);
    CMSMNotificationUtility_PostSilentModeEnabledDidChange(v11);
    goto LABEL_14;
  }
  if (v7)
    goto LABEL_13;
LABEL_14:
  -[MXBiomeStreams updateBiomeSilentMode:clientType:untilTime:reason:](+[MXBiomeStreams sharedInstance](MXBiomeStreams, "sharedInstance"), "updateBiomeSilentMode:clientType:untilTime:reason:", v11, v8, a4, a5);
}

- (void)removeSilentModeTimer
{
  -[MXAlarmEvents resetAlarmEvent:](+[MXAlarmEvents sharedInstance](MXAlarmEvents, "sharedInstance"), "resetAlarmEvent:", CFSTR("com.apple.mediaexperience.silentmode.timer"));
  -[MXSessionManager setSilentModeEnabledUntilTime:](self, "setSilentModeEnabledUntilTime:", 0);
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("silentModeEnabledUntilTime"), 0);
}

- (void)ringerIsOnChanged:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  cmsmUpdateEnableSharedAudioRouteSyntheticMute(1, 0, 0, 0, 0, 0);
  cmsUpdateMuteStatus(0);
  if (v3)
    vaemUnmuteFullMuteIfMuted();
}

- (void)setMutedSessionBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setFigCustomizedCategoryWithBluetooth_Dict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)setFigCustomizedCategoryWithoutBluetooth_Dict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (void)setMxCoreSessionListReadLock:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (void)setMxCoreSessionListWriteSemaphore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (void)setFigUncustomizedCategory_Dict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (void)setFigCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSDictionary)figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict
{
  return self->_figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict;
}

- (void)setFigCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSDictionary)figCustomizedCategoryWithDefaultBuiltIn_Default_Dict
{
  return self->_figCustomizedCategoryWithDefaultBuiltIn_Default_Dict;
}

- (void)setFigCustomizedCategoryWithDefaultBuiltIn_Default_Dict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (void)setFigCategoryToMuteabilityDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSDictionary)figCategoryToOutputOverridabilityDict
{
  return self->_figCategoryToOutputOverridabilityDict;
}

- (void)setFigCategoryToOutputOverridabilityDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (void)setFigCategoryToVADCategoryDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSDictionary)figRouteToVADOutputPortTypeDict
{
  return self->_figRouteToVADOutputPortTypeDict;
}

- (void)setFigRouteToVADOutputPortTypeDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSDictionary)figRouteToVADInputPortTypeDict
{
  return self->_figRouteToVADInputPortTypeDict;
}

- (void)setFigRouteToVADInputPortTypeDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (void)setVadOutputPortTypeToFigOutputDeviceNameDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (void)setVadOutputPortTypeToMuteabilityDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (void)setVadInputPortTypeToFigInputDeviceNameDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)setFigModeTypeToVADModeType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)setAppAllowedToFadeInTemporarily:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)appAllowedToInitiatePlaybackTemporarily
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAppAllowedToInitiatePlaybackTemporarily:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSDate)appAllowedToInitiateRecordingTemporarilyTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (NSNumber)applyUplinkMuteToPhoneCallBehaviorSession
{
  return (NSNumber *)objc_getProperty(self, a2, 256, 1);
}

- (void)setApplyUplinkMuteToPhoneCallBehaviorSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void)setCurrentStream0:(unsigned int)a3
{
  self->_currentStream0 = a3;
}

- (NSString)defaultMusicApp
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setDefaultMusicApp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSDictionary)detailedRoutesDescription
{
  return (NSDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDetailedRoutesDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (void)setSessionsThatWantToSuspendNeroScreenMirroring:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (NSMutableDictionary)quiesceableWiredPortsAutoRouteOnConnectPreference
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 304, 1);
}

- (void)setQuiesceableWiredPortsAutoRouteOnConnectPreference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSDate)silentModeEnabledUntilTime
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setSilentModeEnabledUntilTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSString)silentModeReason
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setSilentModeReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)uplinkMutedBundleID
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setVoiceOverVADVolumeNeedsUpdate:(BOOL)a3
{
  self->_voiceOverVADVolumeNeedsUpdate = a3;
}

- (void)setCarPlayIsConnected:(BOOL)a3
{
  self->_carPlayIsConnected = a3;
}

- (BOOL)phoneCallBehaviorSessionShouldResumeForCarPlay
{
  return self->_phoneCallBehaviorSessionShouldResumeForCarPlay;
}

- (void)setPhoneCallBehaviorSessionShouldResumeForCarPlay:(BOOL)a3
{
  self->_phoneCallBehaviorSessionShouldResumeForCarPlay = a3;
}

- (float)mostRecentDuckFadeDuration
{
  return self->_mostRecentDuckFadeDuration;
}

- (void)setMostRecentDuckFadeDuration:(float)a3
{
  self->_mostRecentDuckFadeDuration = a3;
}

- (BOOL)mostRecentDuckOperation
{
  return self->_mostRecentDuckOperation;
}

- (void)setMostRecentDuckOperation:(BOOL)a3
{
  self->_mostRecentDuckOperation = a3;
}

- (void)setMxCoreSessionList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (void)setPropertiesLock:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (unsigned)silentModeClient
{
  return self->_silentModeClient;
}

- (void)setSilentModeClient:(unsigned int)a3
{
  self->_silentModeClient = a3;
}

- (BOOL)silentModeEnabled
{
  return self->_silentModeEnabled;
}

- (void)setSilentModeEnabled:(BOOL)a3
{
  self->_silentModeEnabled = a3;
}

- (BOOL)starkMainAudioIsOwnedByiOSButBorrowedByCar
{
  return self->_starkMainAudioIsOwnedByiOSButBorrowedByCar;
}

- (void)setStarkMainAudioIsOwnedByiOSButBorrowedByCar:(BOOL)a3
{
  self->_starkMainAudioIsOwnedByiOSButBorrowedByCar = a3;
}

- (void)setUplinkMute:(BOOL)a3
{
  self->_uplinkMute = a3;
}

- (void)setUplinkMuteSetByClient:(BOOL)a3
{
  self->_uplinkMuteSetByClient = a3;
}

- (BOOL)appendContextToMuteNotification
{
  return self->_appendContextToMuteNotification;
}

- (void)setAppendContextToMuteNotification:(BOOL)a3
{
  self->_appendContextToMuteNotification = a3;
}

- (void)setPickableRoutesDescriptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (void)getUpdatedDuckVolume:(id)a3 outDuckVolume:(float *)a4
{
  float v6;
  float v7;
  _BOOL4 v8;
  AudioObjectID CurrentOutputPortAtIndex;
  int DoesPortSupportDoAP;
  int v11;
  AudioObjectID v12;

  if (a3)
  {
    objc_msgSend(a3, "duckToLevelDB");
    v7 = v6;
    if (v6 == -40.0)
    {
      if ((objc_msgSend(a3, "duckToLevelScalarSetByClient") & 1) != 0)
      {
        v8 = 0;
        v7 = -40.0;
      }
      else
      {
        CurrentOutputPortAtIndex = CMSMUtility_GetCurrentOutputPortAtIndex(0);
        DoesPortSupportDoAP = vaeDoesPortSupportDoAP(CurrentOutputPortAtIndex);
        v8 = DoesPortSupportDoAP != 0;
        if (DoesPortSupportDoAP)
          v7 = -68.0;
        else
          v7 = -40.0;
      }
    }
    else
    {
      v8 = 0;
    }
    v11 = objc_msgSend(a3, "duckToLevelDBSetByClient");
    v12 = CMSMUtility_GetCurrentOutputPortAtIndex(0);
    if (vaeDoesPortSupportSoftwareVolume(v12))
    {
      if (v8 | v11)
        *a4 = vaeGetDestinationVolumeScalarFactor(v7, *a4);
    }
  }
}

- (void)addDuckerToSession:(id)a3 duckerSession:(id)a4 duckingSource:(id)a5
{
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a5, "type");
  objc_msgSend(a5, "ID");
  if (a4 || v8 != 2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_msgSend(a3, "duckingSourceList", 0);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if (objc_msgSend(a5, "type") == 1 && objc_msgSend(v14, "type") == 1)
          break;
        if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled()
          && objc_msgSend(a5, "type") == 6
          && objc_msgSend(v14, "type") == 6)
        {
          break;
        }
        v15 = objc_msgSend(a5, "type");
        if (v15 == objc_msgSend(v14, "type"))
        {
          v16 = objc_msgSend(a5, "ID");
          if (v16 == objc_msgSend(v14, "ID") && objc_msgSend(a5, "type") == 2)
            break;
        }
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v11)
            goto LABEL_5;
          goto LABEL_18;
        }
      }
    }
    else
    {
LABEL_18:
      objc_msgSend((id)objc_msgSend(a3, "duckingSourceList"), "addObject:", a5);
    }
  }
}

- (void)removeDuckerForSession:(id)a3 sessionCausingUnduck:(id)a4 duckingSource:(id)a5 outLastDuckingSourceWasRemoved:(BOOL *)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "type", a3, a4) == 3)
  {
    objc_msgSend((id)objc_msgSend(a3, "duckingSourceList"), "removeAllObjects");
LABEL_28:
    *a6 = 1;
    return;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = (void *)objc_msgSend(a3, "duckingSourceList");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(a5, "type") != 1 || objc_msgSend(v14, "type") != 1)
          && (!MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled()
           || objc_msgSend(a5, "type") != 6
           || objc_msgSend(v14, "type") != 6))
        {
          v15 = objc_msgSend(a5, "type");
          if (v15 != objc_msgSend(v14, "type"))
            continue;
          v16 = objc_msgSend(a5, "ID");
          if (v16 != objc_msgSend(v14, "ID"))
            continue;
        }
        if (v14)
          objc_msgSend((id)objc_msgSend(a3, "duckingSourceList"), "removeObject:", v14);
        goto LABEL_20;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_20:
  if (!objc_msgSend((id)objc_msgSend(a3, "duckingSourceList"), "count"))
    goto LABEL_28;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  v17 = (void *)objc_msgSend(a3, "duckingSourceList", 0, 0);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v22;
    while (1)
    {
      if (*(_QWORD *)v22 != v20)
        objc_enumerationMutation(v17);
      if (!--v19)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (!v19)
          break;
      }
    }
  }
}

- (float)getScalarVolume:(float)a3
{
  return __exp10(a3 / 20.0);
}

- (float)getDuckVolumeForBlurEffect:(id)a3 duckeeSession:(id)a4
{
  __CFString *CurrentAudioDestination;
  const __CFString *v8;
  const void *v9;
  float v10;
  AudioObjectID CurrentOutputVADID;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  float v18;
  float v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  float outData;
  CFTypeRef cf[2];
  CFTypeRef v24[2];
  uint64_t v25;
  _OWORD v26[2];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  *(_OWORD *)cf = 0u;
  *(_OWORD *)v24 = 0u;
  CurrentAudioDestination = CMSUtility_GetCurrentAudioDestination(a4);
  cmsmCopyCurrentActiveRouteInfoAtIndexForVADUID((uint64_t)CurrentAudioDestination, 0, &cf[1], &v24[1], v24);
  v8 = -[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", objc_msgSend(a4, "audioCategory"));
  v9 = (const void *)objc_msgSend(a4, "audioMode");
  v26[0] = *(_OWORD *)cf;
  v26[1] = *(_OWORD *)v24;
  v27 = v25;
  v10 = PVMGetVolumePreference(v8, v9, (uint64_t)v26);
  if (cf[1])
    CFRelease(cf[1]);
  if (v24[1])
    CFRelease(v24[1]);
  if (cf[1])
    CFRelease(cf[1]);
  outData = v10;
  CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a4);
  if (vaemConvertToDecibelInVAD(CurrentOutputVADID, &outData))
    outData = 0.0;
  if (a3)
  {
    objc_msgSend(a3, "duckToLevelDB");
    v13 = *(float *)&v12;
  }
  else
  {
    v13 = -40.0;
  }
  v14 = 1.0;
  if (outData > v13)
  {
    *(float *)&v12 = v13;
    -[MXSessionManager getScalarVolume:](self, "getScalarVolume:", v12);
    v16 = v15;
    *(float *)&v17 = outData;
    -[MXSessionManager getScalarVolume:](self, "getScalarVolume:", v17);
    v14 = v16 / v18;
  }
  if (v14 <= 1.0)
    v19 = v14;
  else
    v19 = 1.0;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v19;
}

- (BOOL)shouldBlurOnHomePod:(id)a3 duckerSession:(id)a4
{
  int v6;
  int CurrentOutputVADID;
  BOOL v8;

  v6 = CMSMDeviceState_ItsAHomePod();
  if (v6)
  {
    CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
    if (a4)
      v8 = CMSUtility_GetCurrentOutputVADID(a4) == CurrentOutputVADID;
    else
      v8 = CurrentOutputVADID == CMSMUtility_GetVADIDForVADName(0x1E30A4C48);
    LOBYTE(v6) = !v8;
  }
  return v6;
}

- (void)blurOnHomePod:(id)a3 duckerSession:(id)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t CurrentOutputVADID;

  -[MXSessionManager getDuckVolumeForBlurEffect:duckeeSession:](self, "getDuckVolumeForBlurEffect:duckeeSession:", a4, a3);
  if (a4)
  {
    if (dword_1EE2B3F38)
      goto LABEL_5;
  }
  else if (dword_1EE2B3F38)
  {
LABEL_5:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
  CMSMVAUtility_SetBlurConfigurationOnVA(CurrentOutputVADID);
  objc_msgSend(a3, "setDuckedOnVAD:", 1);
}

- (BOOL)unblurOnHomePod:(id)a3 unduckDuration:(float)a4
{
  int v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t CurrentOutputVADID;

  v5 = CMSMDeviceState_ItsAHomePod();
  if (v5)
  {
    v5 = objc_msgSend(a3, "duckedOnVAD");
    if (v5)
    {
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
      CMSMVAUtility_SetBlurConfigurationOnVA(CurrentOutputVADID);
      objc_msgSend(a3, "setDuckedOnVAD:", 0);
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)duckVolume:(id)a3 duckerSession:(id)a4 duckingSource:(id)a5
{
  int v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  double v16;
  double v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  double v19;
  NSObject *v20;
  const void *v21;
  double v22;
  const void *v23;
  AudioObjectID CurrentOutputVADID;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a4 && CMSUtility_SessionDucksOthers(a3))
  {
    if (!dword_1EE2B3F38)
      return;
LABEL_17:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return;
  }
  v9 = objc_msgSend(a5, "type");
  v10 = (void *)objc_msgSend(a5, "ID");
  objc_msgSend(a5, "duckVolume");
  v12 = v11;
  v32 = v11;
  objc_msgSend(a5, "duckFadeDuration");
  v14 = v13;
  if (v9)
    v15 = 0;
  else
    v15 = CMSystemSoundMgr_SystemSoundMustBeHeard(v10) != 0;
  if (CMSUtility_GetPrefersNoDucking(a3)
    && v9 != 1
    && !v15
    && (!MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled() || v9 != 6))
  {
    if (!dword_1EE2B3F38)
      return;
    goto LABEL_17;
  }
  -[MXSessionManager addDuckerToSession:duckerSession:duckingSource:](self, "addDuckerToSession:duckerSession:duckingSource:", a3, a4, a5);
  if ((objc_msgSend(a3, "isDucked") & 1) != 0)
    return;
  -[MXSessionManager cancelAnyInProgressRampIfNeeded:reason:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "cancelAnyInProgressRampIfNeeded:reason:", a3, 1);
  if (!-[MXSessionManager shouldBlurOnHomePod:duckerSession:](self, "shouldBlurOnHomePod:duckerSession:", a3, a4))
  {
    -[MXSessionManager getUpdatedDuckVolume:outDuckVolume:](self, "getUpdatedDuckVolume:outDuckVolume:", a4, &v32);
    if (a4)
    {
      if (dword_1EE2B3F38)
      {
        v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
LABEL_23:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else if (dword_1EE2B3F38)
    {
      v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      goto LABEL_23;
    }
    LODWORD(v19) = v32;
    v21 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19, v29, v30);
    LODWORD(v22) = v14;
    v23 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
    vaemSetToolboxDuckingEnabled(CurrentOutputVADID);
    CMSUtility_PostInterruptionCommandNotification(a3, 2u, (const __CFString *)objc_msgSend(a3, "clientName"), 0, v21, v23, 0, 0);
    LODWORD(v25) = v14;
    -[MXSessionManager updateMostRecentDuckFadeDuration:duckOperation:duckerSession:sessionToDuck:](self, "updateMostRecentDuckFadeDuration:duckOperation:duckerSession:sessionToDuck:", 1, a4, a3, v25);
    goto LABEL_25;
  }
  LODWORD(v16) = v12;
  LODWORD(v17) = v14;
  -[MXSessionManager blurOnHomePod:duckerSession:duckVolume:duckFadeDuration:](self, "blurOnHomePod:duckerSession:duckVolume:duckFadeDuration:", a3, a4, v16, v17);
LABEL_25:
  objc_msgSend(a3, "setIsDucked:", 1);
  LODWORD(v26) = v14;
  objc_msgSend(a3, "setAudioQueueFadeDuration:", v26);
  LODWORD(v27) = v32;
  objc_msgSend(a3, "setAudioQueueDuckVolume:", v27);
  LODWORD(v28) = v32;
  objc_msgSend(a4, "setLastDuckVolumeApplied:", v28);
}

- (void)unduckVolume:(id)a3 sessionCausingUnduck:(id)a4 duckingSource:(id)a5
{
  id v9;
  float v10;
  float v11;
  double v12;
  double v13;
  const void *v14;
  double v15;
  const void *v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AudioObjectID CurrentOutputVADID;
  double v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isDucked"))
  {
    v9 = a4 ? a4 : a3;
    objc_msgSend(v9, "unduckFadeDuration");
    v11 = v10 <= 0.0 ? 0.5 : v10;
    v22 = 0;
    -[MXSessionManager removeDuckerForSession:sessionCausingUnduck:duckingSource:outLastDuckingSourceWasRemoved:](self, "removeDuckerForSession:sessionCausingUnduck:duckingSource:outLastDuckingSourceWasRemoved:", a3, a4, a5, &v22);
    if (v22)
    {
      objc_msgSend(a3, "setIsDucked:", 0);
      *(float *)&v12 = v11;
      if (!-[MXSessionManager unblurOnHomePod:unduckDuration:](self, "unblurOnHomePod:unduckDuration:", a3, v12)
        && !objc_msgSend(a3, "interruptingSession"))
      {
        *(float *)&v13 = v11;
        v14 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
        LODWORD(v15) = 1.0;
        v16 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
        if (dword_1EE2B3F38)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        CMSUtility_PostInterruptionCommandNotification(a3, 3u, (const __CFString *)objc_msgSend(a3, "clientName", v20, v21), 0, v16, v14, 0, 0);
        CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
        vaemSetToolboxDuckingEnabled(CurrentOutputVADID);
        *(float *)&v19 = v11;
        -[MXSessionManager updateMostRecentDuckFadeDuration:duckOperation:duckerSession:sessionToDuck:](self, "updateMostRecentDuckFadeDuration:duckOperation:duckerSession:sessionToDuck:", 0, a4, a3, v19);
      }
    }
  }
}

- (BOOL)isSessionDucked:(id)a3 duckingSource:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  LODWORD(v6) = objc_msgSend(a3, "isDucked");
  if ((_DWORD)v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_msgSend(a3, "duckingSourceList", 0);
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "type");
          if (v12 == objc_msgSend(a4, "type"))
          {
            v13 = objc_msgSend(v11, "ID");
            if (v13 == objc_msgSend(a4, "ID"))
            {
              LOBYTE(v6) = 1;
              return v6;
            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        LOBYTE(v6) = 0;
        if (v8)
          continue;
        break;
      }
    }
  }
  return v6;
}

- (id)getDuckingSource:(id)a3 duckerSession:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend(a3, "duckingSourceList", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v14;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
    if (objc_msgSend(v10, "type") == 2)
    {
      v11 = objc_msgSend(v10, "ID");
      if (v11 == objc_msgSend((id)objc_msgSend(a4, "ID"), "longLongValue"))
        return v10;
    }
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)duckSessionsForDucker:(id)a3 sessionsToDuck:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MXDuckingSource *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  MXDuckingSource *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    -[MXSessionManager startAsyncDuckingOperation](self, "startAsyncDuckingOperation");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(a4);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
          v11 = [MXDuckingSource alloc];
          v12 = objc_msgSend((id)objc_msgSend(a3, "ID"), "longLongValue");
          objc_msgSend(a3, "duckToLevelScalar");
          v14 = v13;
          objc_msgSend(a3, "duckFadeDuration");
          LODWORD(v16) = v15;
          LODWORD(v17) = v14;
          v18 = -[MXDuckingSource initWithType:ID:duckVolume:duckFadeDuration:](v11, "initWithType:ID:duckVolume:duckFadeDuration:", 2, v12, v17, v16);
          -[MXSessionManager duckVolume:duckerSession:duckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "duckVolume:duckerSession:duckingSource:", v10, a3, v18);

          if (objc_msgSend(v10, "isCarSession"))
            objc_msgSend(a3, "setDuckCommandSentToCarSession:", 1);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }
    -[MXSessionManager endAsyncDuckingOperationForSession:](self, "endAsyncDuckingOperationForSession:", a3);
  }
}

- (void)unduckSessionsForDuckingSource:(id)a3
{
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager startAsyncDuckingOperation](self, "startAsyncDuckingOperation");
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", 0), "mxCoreSessionList");
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if (-[MXSessionManager isSessionDucked:duckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSessionDucked:duckingSource:", v10, a3))
        {
          -[MXSessionManager unduckVolume:sessionCausingUnduck:duckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "unduckVolume:sessionCausingUnduck:duckingSource:", v10, 0, a3);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  -[MXSessionManager endAsyncDuckingOperation](self, "endAsyncDuckingOperation");
}

- (void)updateDuckingSourceInfoForSession:(id)a3 duckerSession:(id)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6
{
  id v8;
  double v9;
  void *v10;
  double v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v8 = -[MXSessionManager getDuckingSource:duckerSession:](self, "getDuckingSource:duckerSession:");
  if (v8)
  {
    v10 = v8;
    *(float *)&v9 = a5;
    objc_msgSend(v8, "setDuckVolume:", v9);
    *(float *)&v11 = a6;
    objc_msgSend(v10, "setDuckFadeDuration:", v11);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)isAnExistingDuckingSource:(id)a3
{
  const __CFArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = CMSUtility_CopySessionsToDuck(1, 0, (const __CFArray *)a3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (-[MXSessionManager getDuckingSource:duckerSession:](self, "getDuckingSource:duckerSession:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), a3))
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)updateDuckVolume:(id)a3 duckerSession:(id)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6
{
  double v10;
  const void *v11;
  double v12;
  const void *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v21 = a5;
  -[MXSessionManager cancelAnyInProgressRampIfNeeded:reason:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "cancelAnyInProgressRampIfNeeded:reason:", a3, 1);
  -[MXSessionManager getUpdatedDuckVolume:outDuckVolume:](self, "getUpdatedDuckVolume:outDuckVolume:", a4, &v21);
  *(float *)&v10 = v21;
  v11 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  *(float *)&v12 = a6;
  v13 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSUtility_PostInterruptionCommandNotification(a3, 2u, (const __CFString *)objc_msgSend(a3, "clientName", v19, v20), 0, v11, v13, 0, 0);
  *(float *)&v15 = a6;
  -[MXSessionManager updateMostRecentDuckFadeDuration:duckOperation:duckerSession:sessionToDuck:](self, "updateMostRecentDuckFadeDuration:duckOperation:duckerSession:sessionToDuck:", 1, a4, a3, v15);
  *(float *)&v16 = a6;
  objc_msgSend(a3, "setAudioQueueFadeDuration:", v16);
  *(float *)&v17 = v21;
  objc_msgSend(a3, "setAudioQueueDuckVolume:", v17);
  *(float *)&v18 = v21;
  objc_msgSend(a4, "setLastDuckVolumeApplied:", v18);
}

- (BOOL)updateUnduckVolume:(id)a3 duckerSession:(id)a4 unduckVolume:(float)a5 unduckFadeDuration:(float)a6
{
  double v10;
  const void *v11;
  double v12;
  const void *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  float v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22 = a5;
  -[MXSessionManager cancelAnyInProgressRampIfNeeded:reason:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "cancelAnyInProgressRampIfNeeded:reason:", a3, 1);
  -[MXSessionManager getUpdatedDuckVolume:outDuckVolume:](self, "getUpdatedDuckVolume:outDuckVolume:", a4, &v22);
  *(float *)&v10 = v22;
  v11 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  *(float *)&v12 = a6;
  v13 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v15 = v22;
  if (v22 == 1.0)
  {
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    CMSUtility_PostInterruptionCommandNotification(a3, 3u, (const __CFString *)objc_msgSend(a3, "clientName"), 0, v11, v13, 0, 0);
    *(float *)&v16 = a6;
    -[MXSessionManager updateMostRecentDuckFadeDuration:duckOperation:duckerSession:sessionToDuck:](self, "updateMostRecentDuckFadeDuration:duckOperation:duckerSession:sessionToDuck:", 0, a4, a3, v16);
    *(float *)&v17 = a6;
    objc_msgSend(a3, "setAudioQueueFadeDuration:", v17);
    *(float *)&v18 = v22;
    objc_msgSend(a3, "setAudioQueueDuckVolume:", v18);
    *(float *)&v19 = v22;
    objc_msgSend(a4, "setLastDuckVolumeApplied:", v19);
  }
  return v15 != 1.0;
}

- (BOOL)updateDuckVolumeForDucker:(id)a3 duckVolume:(float)a4 duckFadeDuration:(float)a5
{
  BOOL v9;
  const __CFArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = 1;
  v10 = CMSUtility_CopySessionsToDuck(1, 0, (const __CFArray *)a3);
  -[MXSessionManager startAsyncDuckingOperation](self, "startAsyncDuckingOperation");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = -[__CFArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isDucked") & 1) == 0)
        {
          if (dword_1EE2B3F38)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v9 = 0;
          goto LABEL_13;
        }
        *(float *)&v16 = a4;
        *(float *)&v17 = a5;
        -[MXSessionManager updateDuckingSourceInfoForSession:duckerSession:duckVolume:duckFadeDuration:](self, "updateDuckingSourceInfoForSession:duckerSession:duckVolume:duckFadeDuration:", v15, a3, v16, v17);
        *(float *)&v18 = a4;
        *(float *)&v19 = a5;
        -[MXSessionManager updateDuckVolume:duckerSession:duckVolume:duckFadeDuration:](self, "updateDuckVolume:duckerSession:duckVolume:duckFadeDuration:", v15, a3, v18, v19);
      }
      v12 = -[__CFArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
        continue;
      break;
    }
    v9 = 1;
  }
LABEL_13:
  -[MXSessionManager endAsyncDuckingOperation](self, "endAsyncDuckingOperation", v22, v23);

  return v9;
}

- (BOOL)updateUnduckVolumeForDucker:(id)a3 unduckVolume:(float)a4 unduckFadeDuration:(float)a5
{
  const __CFArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  double v21;
  double v22;
  BOOL v23;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  os_log_type_t type;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = CMSUtility_CopySessionsToDuck(1, 0, (const __CFArray *)a3);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "isDucked") & 1) == 0)
        {
          if (dword_1EE2B3F38)
          {
            v31 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v23 = 0;
          goto LABEL_20;
        }
      }
      v11 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v11)
        continue;
      break;
    }
  }
  -[MXSessionManager startAsyncDuckingOperation](self, "startAsyncDuckingOperation");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v9);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        *(float *)&v15 = a4;
        *(float *)&v16 = a5;
        -[MXSessionManager updateDuckingSourceInfoForSession:duckerSession:duckVolume:duckFadeDuration:](self, "updateDuckingSourceInfoForSession:duckerSession:duckVolume:duckFadeDuration:", v20, a3, v15, v16);
        *(float *)&v21 = a4;
        *(float *)&v22 = a5;
        -[MXSessionManager updateUnduckVolume:duckerSession:unduckVolume:unduckFadeDuration:](self, "updateUnduckVolume:duckerSession:unduckVolume:unduckFadeDuration:", v20, a3, v21, v22);
      }
      v17 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v17);
  }
  -[MXSessionManager endAsyncDuckingOperation](self, "endAsyncDuckingOperation");
  v23 = 1;
LABEL_20:

  return v23;
}

- (int)updateDuckToLevelScalarSetByClient:(BOOL)a3 session:(id)a4 newLevel:(float)a5 newLevelSetByClient:(BOOL)a6 currentLevel:(float)a7 currentLevelSetByClient:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  _BOOL4 v13;
  _BOOL4 v15;
  float v16;
  double v17;
  int result;
  NSObject *v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  MXSessionManager *v21;
  int v22;
  int v23;
  int v24;
  double v25;
  double v26;
  NSObject *v27;
  MXSessionManager *v28;
  int v29;
  int v30;
  int v31;
  double v32;
  double v33;
  NSObject *v34;
  NSObject *v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v8 = a8;
  v10 = a6;
  v13 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v15 = -[MXSessionManager isAnExistingDuckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isAnExistingDuckingSource:", a4);
  objc_msgSend(a4, "lastDuckVolumeApplied");
  v16 = *(float *)&v17;
  *(float *)&v17 = a5;
  if (v13)
  {
    objc_msgSend(a4, "setDuckToLevelScalar:", v17);
    objc_msgSend(a4, "setDuckToLevelScalarSetByClient:", v10);
  }
  else
  {
    objc_msgSend(a4, "setUnduckToLevelScalar:", v17);
    objc_msgSend(a4, "setUnduckToLevelScalarSetByClient:", v10);
  }
  result = objc_msgSend(a4, "isActive");
  if (result)
  {
    if (objc_msgSend(a4, "interruptionStyle") != 32)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return -15685;
    }
    if (-[MXSessionManager voiceOverSessionWantsRelativeDucking:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "voiceOverSessionWantsRelativeDucking:", a4))
    {
      if (dword_1EE2B3F38)
      {
        v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXSessionManager startAsyncDuckingOperation](self, "startAsyncDuckingOperation", v38, v39);
      -[MXSessionManager updateDuckedSessionsForVoiceOver:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateDuckedSessionsForVoiceOver:", a4);
      -[MXSessionManager endAsyncDuckingOperation](self, "endAsyncDuckingOperation");
      return 0;
    }
    if (v13)
    {
      if (v15)
      {
        if (v16 > a5)
        {
          v21 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
          objc_msgSend(a4, "duckToLevelScalar");
          v23 = v22;
          objc_msgSend(a4, "duckFadeDuration");
          LODWORD(v25) = v24;
          LODWORD(v26) = v23;
          if (!-[MXSessionManager updateDuckVolumeForDucker:duckVolume:duckFadeDuration:](v21, "updateDuckVolumeForDucker:duckVolume:duckFadeDuration:", a4, v26, v25))
          {
            v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            *(float *)&v36 = a7;
            objc_msgSend(a4, "setDuckToLevelScalar:", v36);
            objc_msgSend(a4, "setDuckToLevelScalarSetByClient:", v8);
            return -15685;
          }
          return 0;
        }
        if (!dword_1EE2B3F38)
          return 0;
      }
      else if (!dword_1EE2B3F38)
      {
        return 0;
      }
    }
    else if (v15)
    {
      if (a5 == 1.0)
      {
        -[MXSessionManager unduckSessionsForDucker:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "unduckSessionsForDucker:", a4);
        return 0;
      }
      if (v16 < a5)
      {
        v28 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
        objc_msgSend(a4, "unduckToLevelScalar");
        v30 = v29;
        objc_msgSend(a4, "unduckFadeDuration");
        LODWORD(v32) = v31;
        LODWORD(v33) = v30;
        if (!-[MXSessionManager updateUnduckVolumeForDucker:unduckVolume:unduckFadeDuration:](v28, "updateUnduckVolumeForDucker:unduckVolume:unduckFadeDuration:", a4, v33, v32))
        {
          v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          *(float *)&v37 = a7;
          objc_msgSend(a4, "setUnduckToLevelScalar:", v37);
          objc_msgSend(a4, "setUnduckToLevelScalarSetByClient:", v8);
          return -15685;
        }
        return 0;
      }
      if (!dword_1EE2B3F38)
        return 0;
    }
    else if (!dword_1EE2B3F38)
    {
      return 0;
    }
    v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return result;
}

- (BOOL)shouldDuckSessionForVoiceOver:(id)a3
{
  BOOL v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v7[17];

  v7[16] = *(id *)MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  if ((objc_msgSend(a3, "hasAudioCategory:", CFSTR("VoiceOver")) & 1) != 0)
    return 0;
  v7[0] = 0;
  PVMCopyVolumeCategoryAndMode((const __CFString *)-[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", objc_msgSend(a3, "audioCategory")), (const void *)objc_msgSend(a3, "audioMode"), v7, 0);
  v4 = objc_msgSend(a3, "clientPriority") <= 0xA
    && ((objc_msgSend(v7[0], "isEqualToString:", CFSTR("Alert")) & 1) == 0
     && (objc_msgSend(v7[0], "isEqualToString:", CFSTR("Alarm")) & 1) == 0
     && !objc_msgSend(a3, "isTheAssistant")
     || MX_FeatureFlags_IsAlertsRelativeVoiceOverVolumeEnabled() != 0);

  return v4;
}

- (BOOL)shouldSkipDuckingForVoiceOver:(id)a3 inActiveVoiceOverSession:(id)a4
{
  id v6;
  float v7;
  int v8;
  BOOL v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v12;
  __CFString *CurrentAudioDestination;

  if (a4)
    v6 = a4;
  else
    v6 = 0;
  -[MXSessionManager duckScalarForVoiceOver](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "duckScalarForVoiceOver");
  if (v7 >= 1.0)
  {
    if (!v6
      || !CMSUtility_SessionDucksOthers(v6)
      || CMSUtility_AreSessionsRoutedToTheSamePhysicalDevice(a3, v6))
    {
      v9 = 0;
      goto LABEL_15;
    }
    if (!dword_1EE2B3F38)
    {
      v9 = 1;
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  if (v6 || (v6 = -[MXSessionManager copyVoiceOverSession](self, "copyVoiceOverSession")) != 0)
  {
    v8 = CMSUtility_AreSessionsRoutedToTheSamePhysicalDevice(a3, v6);
  }
  else
  {
    v12 = -[MXSessionManager getProjectedAudioDestinationForCategory:mode:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getProjectedAudioDestinationForCategory:mode:", CFSTR("VoiceOver"), CFSTR("Default"));
    CurrentAudioDestination = CMSUtility_GetCurrentAudioDestination(a3);
    v8 = CMSMUtility_AreVADsRoutedToTheSamePhysicalDevice((uint64_t)v12, (uint64_t)CurrentAudioDestination);
  }
  v9 = v8 == 0;
  if (!v8 && dword_1EE2B3F38)
  {
LABEL_10:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    v9 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_15:

  return v9;
}

- (BOOL)isVoiceOverDuckingActive:(id)a3 outDuckScalar:(float *)a4 outDuckFadeDuration:(float *)a5
{
  id v8;
  float v9;
  float v10;
  int v11;
  int v12;
  BOOL v13;
  float v14;

  v8 = a3;
  if ((a3
     || (v8 = -[MXSessionManager copyActiveVoiceOverSession](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyActiveVoiceOverSession")) != 0)&& objc_msgSend(v8, "isActive")&& CMSUtility_SessionDucksOthers(v8))
  {
    objc_msgSend(v8, "duckToLevelScalar");
    v10 = v9;
    objc_msgSend(v8, "duckFadeDuration");
    v12 = v11;
    v13 = 1;
    if (a3)
      goto LABEL_9;
  }
  else
  {
    -[MXSessionManager duckScalarForVoiceOver](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "duckScalarForVoiceOver");
    v10 = v14;
    v13 = CMSMDeviceState_IsVoiceOverOn() != 0;
    v12 = 1050253722;
    if (a3)
      goto LABEL_9;
  }

LABEL_9:
  *a4 = v10;
  *(_DWORD *)a5 = v12;
  return v10 < 1.0 && v13;
}

- (BOOL)duckSessionForVoiceOverIfNeeded:(id)a3 voiceOverSession:(id)a4
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  BOOL v10;
  MXDuckingSource *v11;
  double v12;
  double v13;
  MXDuckingSource *v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[25];

  v19[24] = *MEMORY[0x1E0C80C00];
  v7 = -[MXSessionManager shouldDuckSessionForVoiceOver:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "shouldDuckSessionForVoiceOver:", a3);
  if (v7)
  {
    v19[0] = 0;
    v8 = -[MXSessionManager isVoiceOverDuckingActive:outDuckScalar:outDuckFadeDuration:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isVoiceOverDuckingActive:outDuckScalar:outDuckFadeDuration:", a4, (char *)v19 + 4, v19);
    LOBYTE(v7) = 0;
    if (v8)
    {
      v9 = -[MXSessionManager copyActiveVoiceOverSession](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyActiveVoiceOverSession");
      v10 = -[MXSessionManager shouldSkipDuckingForVoiceOver:inActiveVoiceOverSession:](self, "shouldSkipDuckingForVoiceOver:inActiveVoiceOverSession:", a3, v9);

      if (v10)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        v11 = [MXDuckingSource alloc];
        LODWORD(v12) = HIDWORD(v19[0]);
        LODWORD(v13) = v19[0];
        v14 = -[MXDuckingSource initWithType:ID:duckVolume:duckFadeDuration:](v11, "initWithType:ID:duckVolume:duckFadeDuration:", 6, 0, v12, v13);
        if (dword_1EE2B3F38)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[MXSessionManager duckVolume:duckerSession:duckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v17, v18), "duckVolume:duckerSession:duckingSource:", a3, 0, v14);

        LOBYTE(v7) = 1;
      }
    }
  }
  return v7;
}

- (void)unduckSessionsForVoiceOverDuckingSource
{
  MXDuckingSource *v2;
  double v3;
  double v4;
  MXDuckingSource *v5;

  v2 = [MXDuckingSource alloc];
  LODWORD(v3) = 1050253722;
  LODWORD(v4) = 0;
  v5 = -[MXDuckingSource initWithType:ID:duckVolume:duckFadeDuration:](v2, "initWithType:ID:duckVolume:duckFadeDuration:", 6, 0, v4, v3);
  -[MXSessionManager unduckSessionsForDuckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "unduckSessionsForDuckingSource:", v5);

}

- (BOOL)voiceOverSessionWantsRelativeDucking:(id)a3
{
  int IsRelativeVoiceOverVolumeEnabled;
  int v5;

  IsRelativeVoiceOverVolumeEnabled = MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled();
  LOBYTE(v5) = 0;
  if (a3)
  {
    if (IsRelativeVoiceOverVolumeEnabled)
    {
      v5 = objc_msgSend(a3, "hasAudioCategory:", CFSTR("VoiceOver"));
      if (v5)
        LOBYTE(v5) = CMSUtility_SessionDucksOthers(a3);
    }
  }
  return v5;
}

- (void)updateDuckedSessionsForVoiceOver:(id)a3
{
  _BOOL4 v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v7;
  id v8;
  MXDuckingSource *v9;
  double v10;
  double v11;
  MXDuckingSource *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  MXSessionManager *v23;
  double v24;
  double v25;
  int *v26;
  uint64_t v27;
  id v28;
  MXSessionManager *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  os_log_type_t type;
  unsigned int v35;
  uint64_t v36;
  _BYTE v37[128];
  int v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
  {
    v36 = 0;
    v5 = -[MXSessionManager isVoiceOverDuckingActive:outDuckScalar:outDuckFadeDuration:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isVoiceOverDuckingActive:outDuckScalar:outDuckFadeDuration:", a3, (char *)&v36 + 4, &v36);
    if (dword_1EE2B3F38)
    {
      v35 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v5)
    {
      v7 = -[MXSessionManager copyMXCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyMXCoreSessionList");
      v8 = -[MXSessionManager copyActiveVoiceOverSession](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyActiveVoiceOverSession");
      v9 = [MXDuckingSource alloc];
      LODWORD(v10) = HIDWORD(v36);
      LODWORD(v11) = v36;
      v12 = -[MXDuckingSource initWithType:ID:duckVolume:duckFadeDuration:](v9, "initWithType:ID:duckVolume:duckFadeDuration:", 6, 0, v10, v11);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v31;
        v28 = v8;
        v29 = self;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v7);
            v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (objc_msgSend(v17, "isActive", v26, v27))
            {
              v18 = -[MXSessionManager shouldSkipDuckingForVoiceOver:inActiveVoiceOverSession:](self, "shouldSkipDuckingForVoiceOver:inActiveVoiceOverSession:", v17, v8);
              if (-[MXSessionManager isSessionDucked:duckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSessionDucked:duckingSource:", v17, v12))
              {
                if (v18)
                {
                  if (dword_1EE2B3F38)
                  {
                    v35 = 0;
                    type = OS_LOG_TYPE_DEFAULT;
                    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    v20 = v35;
                    if (os_log_type_enabled(v19, type))
                      v21 = v20;
                    else
                      v21 = v20 & 0xFFFFFFFE;
                    if (v21)
                    {
                      v22 = objc_msgSend(v17, "clientName");
                      v38 = 136315394;
                      v39 = "-[MXSessionManager(DuckingUtilities) updateDuckedSessionsForVoiceOver:]";
                      v40 = 2114;
                      v41 = v22;
                      LODWORD(v27) = 22;
                      v26 = &v38;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    v8 = v28;
                    self = v29;
                  }
                  -[MXSessionManager unduckVolume:sessionCausingUnduck:duckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v26, v27), "unduckVolume:sessionCausingUnduck:duckingSource:", v17, 0, v12);
                }
                else
                {
                  v23 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
                  LODWORD(v24) = HIDWORD(v36);
                  LODWORD(v25) = v36;
                  -[MXSessionManager updateDuckVolume:duckerSession:duckVolume:duckFadeDuration:](v23, "updateDuckVolume:duckerSession:duckVolume:duckFadeDuration:", v17, 0, v24, v25);
                }
              }
              else if (!v18
                     && -[MXSessionManager shouldDuckSessionForVoiceOver:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "shouldDuckSessionForVoiceOver:", v17))
              {
                -[MXSessionManager duckVolume:duckerSession:duckingSource:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "duckVolume:duckerSession:duckingSource:", v17, 0, v12);
              }
            }
          }
          v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        }
        while (v14);
      }

    }
    else
    {
      -[MXSessionManager unduckSessionsForVoiceOverDuckingSource](self, "unduckSessionsForVoiceOverDuckingSource");
    }
  }
}

- (void)updateDuckedSessionsForVoiceOverIfNeededOnRouteChange
{
  float v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
  {
    if (CMSMDeviceState_IsVoiceOverOn())
    {
      -[MXSessionManager duckScalarForVoiceOver](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "duckScalarForVoiceOver");
      if (v2 < 1.0)
      {
        if (dword_1EE2B3F38)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[MXSessionManager startAsyncDuckingOperation](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v4, v5), "startAsyncDuckingOperation");
        -[MXSessionManager updateDuckedSessionsForVoiceOver:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateDuckedSessionsForVoiceOver:", 0);
        -[MXSessionManager endAsyncDuckingOperation](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "endAsyncDuckingOperation");
      }
    }
  }
}

- (float)getSleepDurationForDuckFadeDuration:(float)a3
{
  if (a3 >= 0.5)
  {
    a3 = a3 * 0.6;
  }
  else if (a3 >= 0.3 && a3 < 0.5)
  {
    a3 = 0.3;
  }
  return fminf(a3, 5.0);
}

- (void)startAsyncDuckingOperation
{
  double v2;

  LODWORD(v2) = 0;
  -[MXSessionManager setMostRecentDuckFadeDuration:](self, "setMostRecentDuckFadeDuration:", v2);
}

- (void)updateMostRecentDuckFadeDuration:(float)a3 duckOperation:(BOOL)a4 duckerSession:(id)a5 sessionToDuck:(id)a6
{
  _BOOL8 v7;
  double v10;

  v7 = a4;
  if (objc_msgSend(a6, "isPlayingOutput")
    && !-[MXSessionManager isSpeechDetectCategory:](self, "isSpeechDetectCategory:", objc_msgSend(a5, "audioCategory")))
  {
    -[MXSessionManager mostRecentDuckFadeDuration](self, "mostRecentDuckFadeDuration");
    if (*(float *)&v10 > a3)
    {
      -[MXSessionManager mostRecentDuckFadeDuration](self, "mostRecentDuckFadeDuration");
      a3 = *(float *)&v10;
    }
    *(float *)&v10 = a3;
    -[MXSessionManager setMostRecentDuckFadeDuration:](self, "setMostRecentDuckFadeDuration:", v10);
    -[MXSessionManager setMostRecentDuckOperation:](self, "setMostRecentDuckOperation:", v7);
  }
}

- (void)endAsyncDuckingOperation
{
  _BOOL8 v3;
  double v4;

  v3 = -[MXSessionManager mostRecentDuckOperation](self, "mostRecentDuckOperation");
  -[MXSessionManager mostRecentDuckFadeDuration](self, "mostRecentDuckFadeDuration");
  -[MXSessionManager sleepForAsyncDucking:duration:](self, "sleepForAsyncDucking:duration:", v3);
  LODWORD(v4) = 0;
  -[MXSessionManager setMostRecentDuckFadeDuration:](self, "setMostRecentDuckFadeDuration:", v4);
  -[MXSessionManager setMostRecentDuckOperation:](self, "setMostRecentDuckOperation:", 0);
}

- (void)endAsyncDuckingOperationForSession:(id)a3
{
  int IsOffloadActivationOffACQEnabled;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  IsOffloadActivationOffACQEnabled = MX_FeatureFlags_IsOffloadActivationOffACQEnabled();
  if (a3 && IsOffloadActivationOffACQEnabled && (objc_msgSend(a3, "isInterruptionCalledOffAudioControlQueue") & 1) != 0)
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    -[MXSessionManager endAsyncDuckingOperation](self, "endAsyncDuckingOperation");
  }
}

- (void)getAndResetAsyncDuckingParameters:(BOOL *)a3 mostRecentDuckFadeDuration:(float *)a4
{
  int v7;
  double v8;

  if (MX_FeatureFlags_IsOffloadActivationOffACQEnabled())
  {
    *a3 = -[MXSessionManager mostRecentDuckOperation](self, "mostRecentDuckOperation");
    -[MXSessionManager mostRecentDuckFadeDuration](self, "mostRecentDuckFadeDuration");
    *(_DWORD *)a4 = v7;
    LODWORD(v8) = 0;
    -[MXSessionManager setMostRecentDuckFadeDuration:](self, "setMostRecentDuckFadeDuration:", v8);
    -[MXSessionManager setMostRecentDuckOperation:](self, "setMostRecentDuckOperation:", 0);
  }
}

- (void)sleepForAsyncDucking:(BOOL)a3 duration:(float)a4
{
  double v6;
  float v7;
  double v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (MX_FeatureFlags_IsAsyncDuckingEnabled())
  {
    *(float *)&v6 = a4;
    -[MXSessionManager getSleepDurationForDuckFadeDuration:](self, "getSleepDurationForDuckFadeDuration:", v6);
    if (v7 > 0.0)
    {
      v8 = v7;
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v8, v10, v11);
    }
  }
}

- (void)interruptEligibleSessionsOnContinuityScreenOutputPortAvailableDidChange
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (MX_FeatureFlags_IsInterruptingPlayingSessionsInOnenessEnabled())
  {
    v3 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v8, "isActive", v10, v11)
            && (objc_msgSend(v8, "isTheAssistant") & 1) == 0
            && (objc_msgSend(v8, "prefersNoInterruptionsDuringRemoteDeviceControl") & 1) == 0
            && (objc_msgSend(v8, "hasPhoneCallBehavior") & 1) == 0
            && !CMSMUtility_IsEmergencyAlertCategory(objc_msgSend(v8, "audioCategory")))
          {
            if (dword_1EE2B3F38)
            {
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
}

- (void)interruptRecordingSessionsOnContinuityScreenOutputPortAvailableDidChange
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (MX_FeatureFlags_IsOnenessEnabled())
  {
    v3 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v8, "isActive", v10, v11)
            && objc_msgSend(v8, "isRecordingMutedForRemoteDevice")
            && (objc_msgSend(v8, "prefersNoInterruptionsDuringRemoteDeviceControl") & 1) == 0)
          {
            if (dword_1EE2B3F38)
            {
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
}

- (void)processContinuityScreenOutputPortAvailableDidChange:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (!a3)
    -[MXSessionManager interruptRecordingSessionsOnContinuityScreenOutputPortAvailableDidChange](self, "interruptRecordingSessionsOnContinuityScreenOutputPortAvailableDidChange");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[MXSystemController notifyAll:payload:dontPostIfSuspended:](MXSystemController, "notifyAll:payload:dontPostIfSuspended:", CFSTR("ContinuityScreenOutputPortAvailableDidChange"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, v5, v6), CFSTR("ContinuityScreenOutputPortAvailableDidChange_IsPortAvailable"), 0), 0);
}

- (void)updateCachedContinuityScreenOutputPortID
{
  int CachedContinuityScreenOutputPortID;
  const __CFArray *VADPortIDFromVADPortType;

  if (MX_FeatureFlags_IsOnenessEnabled())
  {
    CachedContinuityScreenOutputPortID = vaemGetCachedContinuityScreenOutputPortID();
    if (vaemContinuityScreenOutputIsConnected())
      VADPortIDFromVADPortType = vaemGetVADPortIDFromVADPortType(1885565807);
    else
      VADPortIDFromVADPortType = 0;
    if (CachedContinuityScreenOutputPortID != (_DWORD)VADPortIDFromVADPortType)
    {
      vaemSetCachedContinuityScreenOutputPortID((uint64_t)VADPortIDFromVADPortType);
      -[MXSessionManager processContinuityScreenOutputPortAvailableDidChange:](self, "processContinuityScreenOutputPortAvailableDidChange:", (_DWORD)VADPortIDFromVADPortType != 0);
    }
  }
}

- (void)setUpStringConversionDictionaries
{
  uint64_t v3;
  const __CFAllocator *v4;
  _OWORD v5[10];
  int64x2_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  int64x2_t v10;
  __int128 v11;
  void *v12[31];
  void *v13[21];
  void *v14[36];
  void *v15[36];
  void *v16[36];
  void *v17[10];
  void *v18[10];
  void *v19[10];
  void *v20[10];
  void *v21[10];
  void *values[10];
  void *keys[11];

  keys[10] = *(void **)MEMORY[0x1E0C80C00];
  v3 = 1650811758;
  keys[0] = CFSTR("Record");
  keys[1] = CFSTR("Record_WithBluetooth");
  keys[2] = CFSTR("PlayAndRecord");
  keys[3] = CFSTR("PlayAndRecord_WithBluetooth");
  keys[4] = CFSTR("PlayAndRecord_NoBluetooth_DefaultToSpeaker");
  keys[5] = CFSTR("PlayAndRecord_WithBluetooth_DefaultToSpeaker");
  keys[6] = CFSTR("VoiceCommand");
  keys[7] = CFSTR("VoiceCommand_WithBluetooth");
  keys[8] = CFSTR("VoiceCommandThatMixes");
  keys[9] = CFSTR("VoiceCommandThatMixes_WithBluetooth");
  values[0] = CFSTR("Record_WithBluetooth");
  values[1] = CFSTR("Record_WithBluetooth");
  values[2] = CFSTR("PlayAndRecord_WithBluetooth");
  values[3] = CFSTR("PlayAndRecord_WithBluetooth");
  values[4] = CFSTR("PlayAndRecord_WithBluetooth_DefaultToSpeaker");
  values[5] = CFSTR("PlayAndRecord_WithBluetooth_DefaultToSpeaker");
  values[6] = CFSTR("VoiceCommand_WithBluetooth");
  values[7] = CFSTR("VoiceCommand_WithBluetooth");
  values[8] = CFSTR("VoiceCommandThatMixes_WithBluetooth");
  values[9] = CFSTR("VoiceCommandThatMixes_WithBluetooth");
  v21[0] = CFSTR("Record");
  v21[1] = CFSTR("Record");
  v21[2] = CFSTR("PlayAndRecord");
  v21[3] = CFSTR("PlayAndRecord");
  v21[4] = CFSTR("PlayAndRecord_NoBluetooth_DefaultToSpeaker");
  v21[5] = CFSTR("PlayAndRecord_NoBluetooth_DefaultToSpeaker");
  v21[6] = CFSTR("VoiceCommand");
  v21[7] = CFSTR("VoiceCommand");
  v21[8] = CFSTR("VoiceCommandThatMixes");
  v21[9] = CFSTR("VoiceCommandThatMixes");
  v20[0] = CFSTR("Record");
  v20[1] = CFSTR("Record");
  v20[2] = CFSTR("PlayAndRecord");
  v20[3] = CFSTR("PlayAndRecord");
  v20[4] = CFSTR("PlayAndRecord");
  v20[5] = CFSTR("PlayAndRecord");
  v20[6] = CFSTR("VoiceCommand");
  v20[7] = CFSTR("VoiceCommand");
  v20[8] = CFSTR("VoiceCommandThatMixes");
  v20[9] = CFSTR("VoiceCommandThatMixes");
  v19[0] = CFSTR("Record");
  v19[1] = CFSTR("Record_WithBluetooth");
  v19[2] = CFSTR("PlayAndRecord_NoBluetooth_DefaultToSpeaker");
  v19[3] = CFSTR("PlayAndRecord_WithBluetooth_DefaultToSpeaker");
  v19[4] = CFSTR("PlayAndRecord_NoBluetooth_DefaultToSpeaker");
  v19[5] = CFSTR("PlayAndRecord_WithBluetooth_DefaultToSpeaker");
  v19[6] = CFSTR("VoiceCommand");
  v19[7] = CFSTR("VoiceCommand_WithBluetooth");
  v19[8] = CFSTR("VoiceCommandThatMixes");
  v19[9] = CFSTR("VoiceCommandThatMixes_WithBluetooth");
  v18[0] = CFSTR("Record");
  v18[1] = CFSTR("Record_WithBluetooth");
  v18[2] = CFSTR("PlayAndRecord");
  v18[3] = CFSTR("PlayAndRecord_WithBluetooth");
  v18[4] = CFSTR("PlayAndRecord");
  v18[5] = CFSTR("PlayAndRecord_WithBluetooth");
  v18[6] = CFSTR("VoiceCommand");
  v18[7] = CFSTR("VoiceCommand_WithBluetooth");
  v18[8] = CFSTR("VoiceCommandThatMixes");
  v18[9] = CFSTR("VoiceCommandThatMixes_WithBluetooth");
  v17[0] = CFSTR("Record");
  v17[1] = CFSTR("Record_WithBluetooth");
  v17[2] = CFSTR("PlayAndRecord");
  v17[3] = CFSTR("PlayAndRecord_WithBluetooth");
  v17[4] = CFSTR("PlayAndRecord");
  v17[5] = CFSTR("PlayAndRecord_WithBluetooth");
  v17[6] = CFSTR("VoiceCommand");
  v17[7] = CFSTR("VoiceCommand_WithBluetooth");
  v17[8] = CFSTR("VoiceCommandThatMixes");
  v17[9] = CFSTR("VoiceCommandThatMixes_WithBluetooth");
  v16[0] = CFSTR("Audio/Video");
  v16[1] = CFSTR("Ringtone");
  v16[2] = CFSTR("Voicemail");
  v16[3] = CFSTR("VoicemailGreeting");
  v16[4] = CFSTR("PhoneCall");
  v16[5] = CFSTR("TTYCall");
  v16[6] = CFSTR("RingtonePreview");
  v16[7] = CFSTR("Alarm");
  v16[8] = CFSTR("Record");
  v16[9] = CFSTR("Record_WithBluetooth");
  v16[10] = CFSTR("PlayAndRecord");
  v16[11] = CFSTR("PlayAndRecord_WithBluetooth");
  v16[12] = CFSTR("PlayAndRecord_NoBluetooth_DefaultToSpeaker");
  v16[13] = CFSTR("PlayAndRecord_WithBluetooth_DefaultToSpeaker");
  v16[14] = CFSTR("UserInterfaceSoundEffects");
  v16[15] = CFSTR("AmbientSound");
  v16[16] = CFSTR("SoloAmbientSound");
  v16[17] = CFSTR("MediaPlayback");
  v16[18] = CFSTR("AudioProcessing");
  v16[19] = CFSTR("LiveAudio");
  v16[20] = CFSTR("Notice");
  v16[21] = CFSTR("VoiceCommand");
  v16[22] = CFSTR("VoiceCommand_WithBluetooth");
  v16[23] = CFSTR("VoiceCommandThatMixes");
  v16[24] = CFSTR("VoiceCommandThatMixes_WithBluetooth");
  v16[25] = CFSTR("VoiceOver");
  v16[26] = CFSTR("FindMyPhone");
  v16[27] = CFSTR("EmergencyAlert");
  v16[28] = CFSTR("EmergencyAlert_Muteable");
  v16[29] = CFSTR("Multi");
  v16[30] = CFSTR("MediaPlaybackNoSpeaker");
  v16[31] = CFSTR("WaterEjection");
  v16[32] = CFSTR("FindMyAudioDevice");
  v16[33] = CFSTR("SystemSoundsAndHaptics");
  v16[34] = CFSTR("eARC");
  v16[35] = CFSTR("SpeechDetect");
  v15[0] = CFSTR("NonMuteable");
  v15[1] = CFSTR("NonMuteable");
  v15[2] = CFSTR("NonMuteable");
  v15[3] = CFSTR("NonMuteable");
  v15[4] = CFSTR("NonMuteable");
  v15[5] = CFSTR("NonMuteable");
  v15[6] = CFSTR("NonMuteable");
  v15[7] = CFSTR("NonMuteable");
  v15[8] = CFSTR("NonMuteable");
  v15[9] = CFSTR("NonMuteable");
  v15[10] = CFSTR("NonMuteable");
  v15[11] = CFSTR("NonMuteable");
  v15[12] = CFSTR("NonMuteable");
  v15[13] = CFSTR("NonMuteable");
  v15[14] = CFSTR("Muteable");
  v15[15] = CFSTR("Muteable");
  v15[16] = CFSTR("Muteable");
  v15[17] = CFSTR("NonMuteable");
  v15[18] = CFSTR("NonMuteable");
  v15[19] = CFSTR("NonMuteable");
  v15[20] = CFSTR("NonMuteable");
  v15[21] = CFSTR("NonMuteable");
  v15[22] = CFSTR("NonMuteable");
  v15[23] = CFSTR("NonMuteable");
  v15[24] = CFSTR("NonMuteable");
  v15[25] = CFSTR("NonMuteable");
  v15[26] = CFSTR("NonMuteable");
  v15[27] = CFSTR("NonMuteable");
  v15[28] = CFSTR("Muteable");
  v15[29] = CFSTR("NonMuteable");
  v15[30] = CFSTR("NonMuteable");
  v15[31] = CFSTR("NonMuteable");
  v15[32] = CFSTR("NonMuteable");
  v15[33] = CFSTR("Muteable");
  v15[34] = CFSTR("Muteable");
  v15[35] = CFSTR("Muteable");
  v14[0] = CFSTR("CannotOverride");
  v14[1] = CFSTR("CannotOverride");
  v14[2] = CFSTR("CanOverride");
  v14[3] = CFSTR("CanOverride");
  v14[4] = CFSTR("CanOverride");
  v14[5] = CFSTR("CanOverride");
  v14[6] = CFSTR("CannotOverride");
  v14[7] = CFSTR("CannotOverride");
  v14[8] = CFSTR("CannotOverride");
  v14[9] = CFSTR("CannotOverride");
  v14[10] = CFSTR("CanOverride");
  v14[11] = CFSTR("CanOverride");
  v14[12] = CFSTR("CanOverride");
  v14[13] = CFSTR("CanOverride");
  v14[14] = CFSTR("CannotOverride");
  v14[15] = CFSTR("CannotOverride");
  v14[16] = CFSTR("CannotOverride");
  v14[17] = CFSTR("CannotOverride");
  v14[18] = CFSTR("CannotOverride");
  v14[19] = CFSTR("CannotOverride");
  v14[20] = CFSTR("CannotOverride");
  v14[21] = CFSTR("CanOverride");
  v14[22] = CFSTR("CanOverride");
  v14[23] = CFSTR("CanOverride");
  v14[24] = CFSTR("CanOverride");
  v14[25] = CFSTR("CannotOverride");
  v14[26] = CFSTR("CanOverride");
  v14[27] = CFSTR("CannotOverride");
  v14[28] = CFSTR("CannotOverride");
  v14[29] = CFSTR("CanOverride");
  v14[30] = CFSTR("CannotOverride");
  v14[31] = CFSTR("CannotOverride");
  v14[32] = CFSTR("CannotOverride");
  v14[33] = CFSTR("CannotOverride");
  v14[34] = CFSTR("CannotOverride");
  v14[35] = CFSTR("CannotOverride");
  v13[0] = CFSTR("Muteable");
  v13[1] = CFSTR("NonMuteable");
  v13[2] = CFSTR("NonMuteable");
  v13[3] = CFSTR("NonMuteable");
  v13[4] = CFSTR("NonMuteable");
  v13[5] = CFSTR("Muteable");
  v13[6] = CFSTR("NonMuteable");
  v13[7] = CFSTR("Muteable");
  v13[8] = CFSTR("Muteable");
  v13[9] = CFSTR("Muteable");
  v13[10] = CFSTR("NonMuteable");
  v13[11] = CFSTR("NonMuteable");
  v13[12] = CFSTR("NonMuteable");
  v13[13] = CFSTR("Muteable");
  v13[14] = CFSTR("Muteable");
  v13[15] = CFSTR("Muteable");
  v13[16] = CFSTR("Muteable");
  v13[17] = CFSTR("Muteable");
  v13[18] = CFSTR("Muteable");
  v13[19] = CFSTR("Muteable");
  v13[20] = CFSTR("NonMuteable");
  v12[0] = CFSTR("Default");
  v12[1] = CFSTR("VoiceChat");
  v12[2] = CFSTR("VideoChat");
  v12[3] = CFSTR("VideoRecording");
  v12[4] = CFSTR("SpeechRecognition");
  v12[5] = CFSTR("Measurement");
  v12[6] = CFSTR("Raw");
  v12[7] = CFSTR("GameChat");
  v12[8] = CFSTR("MoviePlayback");
  v12[9] = CFSTR("SpokenAudio");
  v12[10] = CFSTR("VoicePrompt");
  v12[11] = CFSTR("RemoteVoiceChat");
  v12[12] = CFSTR("VoiceMessages");
  v12[13] = CFSTR("LivePhoto");
  v12[14] = CFSTR("HearingAccessibility");
  v12[15] = CFSTR("SOSNotification");
  v12[16] = CFSTR("SpatialRecording");
  v12[17] = CFSTR("Ibis");
  v12[18] = CFSTR("VideoChatForMedia");
  v12[19] = CFSTR("MultiCam");
  v12[20] = CFSTR("Skeuomorphic");
  v12[21] = CFSTR("LowLatency");
  v12[22] = CFSTR("CustomVolume");
  v12[23] = CFSTR("SpatialCapture");
  v12[24] = CFSTR("Beacon");
  v12[25] = CFSTR("WebCam");
  v12[26] = CFSTR("WebCam_MultiMic");
  v12[27] = CFSTR("Sleep");
  v12[28] = CFSTR("SoundRecognition");
  v12[29] = CFSTR("Enrollment");
  v12[30] = CFSTR("EchoCancellationInput");
  if (MX_FeatureFlags_IsMandrakeEverywhereEnabled() && !CMSMDeviceState_SupportsBeacon())
    v3 = 1768776806;
  v5[0] = xmmword_1937A3AA0;
  v5[1] = xmmword_1937A3AB0;
  v5[2] = xmmword_1937A3AC0;
  v5[3] = xmmword_1937A3AD0;
  v5[4] = xmmword_1937A3AE0;
  v5[5] = xmmword_1937A3AF0;
  v5[6] = xmmword_1937A3B00;
  v5[7] = xmmword_1937A3B10;
  v5[8] = xmmword_1937A3B20;
  v5[9] = xmmword_1937A3B30;
  v6 = vdupq_n_s64(0x696D6466uLL);
  v7 = xmmword_1937A3B40;
  v8 = v3;
  v9 = xmmword_1937A3B50;
  v10 = v6;
  v11 = xmmword_1937A3B60;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[MXSessionManager setFigCustomizedCategoryWithBluetooth_Dict:](self, "setFigCustomizedCategoryWithBluetooth_Dict:", CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 10, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]), xmmword_1937A3AA0, xmmword_1937A3AB0, xmmword_1937A3AC0, xmmword_1937A3AD0, xmmword_1937A3AE0, xmmword_1937A3AF0, xmmword_1937A3B00, xmmword_1937A3B10, xmmword_1937A3B20,
    xmmword_1937A3B30);
  if (-[MXSessionManager figCustomizedCategoryWithBluetooth_Dict](self, "figCustomizedCategoryWithBluetooth_Dict"))
  {
    -[MXSessionManager setFigCustomizedCategoryWithoutBluetooth_Dict:](self, "setFigCustomizedCategoryWithoutBluetooth_Dict:", CFDictionaryCreate(v4, (const void **)keys, (const void **)v21, 10, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]));
    if (-[MXSessionManager figCustomizedCategoryWithoutBluetooth_Dict](self, "figCustomizedCategoryWithoutBluetooth_Dict"))
    {
      -[MXSessionManager setFigUncustomizedCategory_Dict:](self, "setFigUncustomizedCategory_Dict:", CFDictionaryCreate(v4, (const void **)keys, (const void **)v20, 10, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]));
      if (-[MXSessionManager figUncustomizedCategory_Dict](self, "figUncustomizedCategory_Dict"))
      {
        -[MXSessionManager setFigCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict:](self, "setFigCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict:", CFDictionaryCreate(v4, (const void **)keys, (const void **)v19, 10, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]));
        if (-[MXSessionManager figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict](self, "figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict"))
        {
          -[MXSessionManager setFigCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict:](self, "setFigCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict:", CFDictionaryCreate(v4, (const void **)keys, (const void **)v18, 10, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]));
          if (-[MXSessionManager figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict](self, "figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict"))
          {
            -[MXSessionManager setFigCustomizedCategoryWithDefaultBuiltIn_Default_Dict:](self, "setFigCustomizedCategoryWithDefaultBuiltIn_Default_Dict:", CFDictionaryCreate(v4, (const void **)keys, (const void **)v17, 10, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]));
            if (-[MXSessionManager figCustomizedCategoryWithDefaultBuiltIn_Default_Dict](self, "figCustomizedCategoryWithDefaultBuiltIn_Default_Dict"))
            {
              -[MXSessionManager setFigCategoryToMuteabilityDict:](self, "setFigCategoryToMuteabilityDict:", CFDictionaryCreate(v4, (const void **)v16, (const void **)v15, 36, MEMORY[0x1E0C9B390], 0));
              if (-[MXSessionManager figCategoryToMuteabilityDict](self, "figCategoryToMuteabilityDict"))
              {
                -[MXSessionManager setFigCategoryToOutputOverridabilityDict:](self, "setFigCategoryToOutputOverridabilityDict:", CFDictionaryCreate(v4, (const void **)v16, (const void **)v14, 36, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]));
                if (-[MXSessionManager figCategoryToOutputOverridabilityDict](self, "figCategoryToOutputOverridabilityDict"))
                {
                  -[MXSessionManager setFigCategoryToVADCategoryDict:](self, "setFigCategoryToVADCategoryDict:", CFDictionaryCreate(v4, (const void **)v16, (const void **)"vasc", 36, MEMORY[0x1E0C9B390], 0));
                  if (-[MXSessionManager figCategoryToVADCategoryDict](self, "figCategoryToVADCategoryDict"))
                  {
                    -[MXSessionManager setFigRouteToVADOutputPortTypeDict:](self, "setFigRouteToVADOutputPortTypeDict:", CFDictionaryCreate(v4, (const void **)setUpStringConversionDictionaries_figRouteNames, (const void **)"wphp", 23, MEMORY[0x1E0C9B390], 0));
                    if (-[MXSessionManager figRouteToVADOutputPortTypeDict](self, "figRouteToVADOutputPortTypeDict"))
                    {
                      -[MXSessionManager setFigRouteToVADInputPortTypeDict:](self, "setFigRouteToVADInputPortTypeDict:", CFDictionaryCreate(v4, (const void **)setUpStringConversionDictionaries_figRouteNames, (const void **)"iwmp", 23, MEMORY[0x1E0C9B390], 0));
                      if (-[MXSessionManager figRouteToVADInputPortTypeDict](self, "figRouteToVADInputPortTypeDict"))
                      {
                        -[MXSessionManager setVadOutputPortTypeToFigOutputDeviceNameDict:](self, "setVadOutputPortTypeToFigOutputDeviceNameDict:", CFDictionaryCreate(v4, (const void **)"uolp", (const void **)setUpStringConversionDictionaries_figOutputDeviceNamesForVADOutputPortTypes, 21, 0, MEMORY[0x1E0C9B3A0]));
                        if (-[MXSessionManager vadOutputPortTypeToFigOutputDeviceNameDict](self, "vadOutputPortTypeToFigOutputDeviceNameDict"))
                        {
                          -[MXSessionManager setVadOutputPortTypeToMuteabilityDict:](self, "setVadOutputPortTypeToMuteabilityDict:", CFDictionaryCreate(v4, (const void **)"uolp", (const void **)v13, 21, 0, MEMORY[0x1E0C9B3A0]));
                          if (-[MXSessionManager vadOutputPortTypeToMuteabilityDict](self, "vadOutputPortTypeToMuteabilityDict"))
                          {
                            -[MXSessionManager setVadInputPortTypeToFigInputDeviceNameDict:](self, "setVadInputPortTypeToFigInputDeviceNameDict:", CFDictionaryCreate(v4, (const void **)"nilp", (const void **)setUpStringConversionDictionaries_figInputDeviceNamesForVADInputPortTypes, 8, 0, MEMORY[0x1E0C9B3A0]));
                            if (-[MXSessionManager vadInputPortTypeToFigInputDeviceNameDict](self, "vadInputPortTypeToFigInputDeviceNameDict"))
                            {
                              -[MXSessionManager setFigModeTypeToVADModeType:](self, "setFigModeTypeToVADModeType:", CFDictionaryCreate(v4, (const void **)v12, (const void **)v5, 31, MEMORY[0x1E0C9B390], 0));
                              -[MXSessionManager figModeTypeToVADModeType](self, "figModeTypeToVADModeType");
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)setDefaultVADID:(unsigned int)a3
{
  -[MXSessionManager setVADID:forVADName:](self, "setVADID:forVADName:", *(_QWORD *)&a3, 0x1E30A4C28);
}

- (BOOL)getQuiesceableWiredPortAutoRouteOnConnectPreference:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (!MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled())
    return 0;
  if (!(_DWORD)v3)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  v5 = (void *)vaeCopyPersistentUID(v3);
  v6 = (void *)-[NSMutableDictionary objectForKey:](-[MXSessionManager quiesceableWiredPortsAutoRouteOnConnectPreference](self, "quiesceableWiredPortsAutoRouteOnConnectPreference"), "objectForKey:", v5);
  if (v6)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
    if (dword_1EE2B3F38)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    if (dword_1EE2B3F38)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = 1;
    -[MXSessionManager setQuiesceableWiredPortPreference:autoRouteOnConnect:](self, "setQuiesceableWiredPortPreference:autoRouteOnConnect:", v3, 1, v12, v13);
  }

  return v7;
}

- (void)setQuiesceableWiredPortPreference:(unsigned int)a3 autoRouteOnConnect:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  NSMutableDictionary *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;

  v4 = a4;
  if (MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled())
  {
    if (a3)
    {
      v7 = (void *)vaeCopyPersistentUID(a3);
      v8 = -[MXSessionManager quiesceableWiredPortsAutoRouteOnConnectPreference](self, "quiesceableWiredPortsAutoRouteOnConnectPreference");
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4), v7);
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }

      MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("quiesceableWiredPortsAutoRouteOnConnectPreference"), -[MXSessionManager quiesceableWiredPortsAutoRouteOnConnectPreference](self, "quiesceableWiredPortsAutoRouteOnConnectPreference"));
    }
    else
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (int)updateSecureSpeakerMuteState:(BOOL)a3
{
  _BOOL4 v3;
  AudioObjectID VADPortIDFromVADPortType;
  int v5;
  NSObject *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  AudioObjectPropertyAddress inAddress;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  VADPortIDFromVADPortType = vaemGetVADPortIDFromVADPortType(1886613611);
  inAddress.mElement = 0;
  v11 = v3;
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"msspbolg";
  if (!VADPortIDFromVADPortType)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_7:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -12985;
  }
  if (!AudioObjectHasProperty(VADPortIDFromVADPortType, &inAddress))
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    goto LABEL_7;
  }
  v5 = CMSMVAUtility_AudioObjectSetPropertyData();
  if (v5)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5;
}

- (BOOL)isVADIDRoutedToOutputPortType:(unsigned int)a3 portType:(unsigned int)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[MXAdditiveRoutingManager copyDetailedRouteDescription:](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "copyDetailedRouteDescription:", *(_QWORD *)&a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("RouteDetailedDescription_Outputs"), 0), "allObjects");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (vaeGetPortTypeFromPortID(objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "objectForKey:", CFSTR("RouteDetailedDescription_ID")), "unsignedIntValue")) == a4)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)copyInterruptedSessions:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", 0), "mxCoreSessionList");
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "waitingToResume") && (id)objc_msgSend(v10, "interruptingSession") == a3)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  return v4;
}

- (id)copyHighestPriorityActiveSession:(id)a3 deviceIdentifier:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t i;
  void *v14;
  unsigned int LocalSessionPriority;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  os_log_type_t type;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v25 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v18, v19), "mxCoreSessionListBeginIteration");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
  v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    v12 = 100;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        LocalSessionPriority = CMSM_GetLocalSessionPriority(v14, 1);
        if (objc_msgSend(v14, "isActive"))
          v16 = LocalSessionPriority > v12;
        else
          v16 = 0;
        if (v16 && CMSUtility_IsSessionPlayStateEligibleForTipi(v14))
        {
          if (a4)
          {
            if (CMSUtility_DoPickedEndpointsForSessionContainDeviceIdentifier(v14, (uint64_t)a4))
              goto LABEL_20;
          }
          else if (a3
                 && -[__CFString isEqualToString:](CMSUtility_GetCurrentAudioDestination(v14), "isEqualToString:", a3))
          {
LABEL_20:

            v10 = v14;
            v12 = LocalSessionPriority;
            continue;
          }
        }
      }
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (!v9)
        goto LABEL_25;
    }
  }
  v10 = 0;
LABEL_25:
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  return v10;
}

- (BOOL)shouldResetWaitingToResume:(id)a3 currentSession:(id)a4
{
  return objc_msgSend(a3, "handsOverInterruptionsToInterruptor")
      && (objc_msgSend(a4, "handsOverInterruptionsToInterruptor") & 1) == 0
      && !objc_msgSend(a4, "isTheAssistant");
}

- (void)resetWaitingToResume:(id)a3
{
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", 0), "mxCoreSessionList");
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((id)objc_msgSend(v9, "interruptingSession") == a3 && objc_msgSend(v9, "waitingToResume"))
          objc_msgSend(v9, "setWaitingToResume:", 0);
      }
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
}

- (id)copySessionWithPID:(int)a3
{
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "clientPID"), "intValue") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v10;
}

- (id)copySessionToBeMuted:(id *)a3
{
  id v5;
  __int128 v6;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  id v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  unsigned int v48;
  unsigned int v49;
  NSObject *v50;
  unsigned int v51;
  unsigned int v52;
  int *v53;
  int *v54;
  int *v55;
  int *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _OWORD v73[2];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  os_log_type_t type;
  unsigned int v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  int v84;
  const char *v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = *(_OWORD *)&a3->var0[4];
  v86 = *(_OWORD *)a3->var0;
  v87 = v6;
  if (!-[MXSessionManager isAuditTokenValid:](self, "isAuditTokenValid:", &v86))
  {
    v79 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_28:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v14 = 0;
    goto LABEL_29;
  }
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v7 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList");
  v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v75 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
        if (v12)
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "auditToken");
        else
          memset(v73, 0, sizeof(v73));
        v13 = *(_OWORD *)&a3->var0[4];
        v86 = *(_OWORD *)a3->var0;
        v87 = v13;
        if (-[MXSessionManager isAuditTokenEqual:compareTo:](self, "isAuditTokenEqual:compareTo:", v73, &v86))
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    }
    while (v9);
  }
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  if (!objc_msgSend(v5, "count"))
  {
    v79 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v20 = v79;
    if (os_log_type_enabled(v19, type))
      v21 = v20;
    else
      v21 = v20 & 0xFFFFFFFE;
    if (v21)
    {
      v84 = 136315138;
      v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
      _os_log_send_and_compose_impl();
    }
    goto LABEL_28;
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    v14 = (id)objc_msgSend(v5, "firstObject");
    if (dword_1EE2B3F38)
    {
      v79 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v16 = v79;
      if (os_log_type_enabled(v15, type))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if (!v17)
        goto LABEL_97;
      v84 = 136315138;
      v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
LABEL_96:
      _os_log_send_and_compose_impl();
LABEL_97:
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    if (dword_1EE2B3F38)
    {
      v79 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v24 = v79;
      if (os_log_type_enabled(v23, type))
        v25 = v24;
      else
        v25 = v24 & 0xFFFFFFFE;
      if (v25)
      {
        v84 = 136315138;
        v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
        LODWORD(v57) = 12;
        v53 = &v84;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v82, 16, v53, v57);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v70;
LABEL_39:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v70 != v28)
          objc_enumerationMutation(v5);
        v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v29);
        if (objc_msgSend(v30, "isActive"))
        {
          if (objc_msgSend(v30, "isRecording") && objc_msgSend(v30, "hasPhoneCallBehavior"))
            break;
        }
        if (v27 == ++v29)
        {
          v27 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
          if (v27)
            goto LABEL_39;
          goto LABEL_56;
        }
      }
      v14 = v30;
      if (dword_1EE2B3F38)
      {
        v79 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v32 = v79;
        if (os_log_type_enabled(v31, type))
          v33 = v32;
        else
          v33 = v32 & 0xFFFFFFFE;
        if (v33)
        {
          v84 = 136315138;
          v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
          LODWORD(v58) = 12;
          v54 = &v84;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v14)
        goto LABEL_29;
    }
LABEL_56:
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v34 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v81, 16, v54, v58);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v66;
LABEL_58:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v66 != v36)
          objc_enumerationMutation(v5);
        v38 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v37);
        if (objc_msgSend(v38, "hasPhoneCallBehavior"))
          break;
        if (v35 == ++v37)
        {
          v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
          if (v35)
            goto LABEL_58;
          goto LABEL_73;
        }
      }
      v14 = v38;
      if (dword_1EE2B3F38)
      {
        v79 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v40 = v79;
        if (os_log_type_enabled(v39, type))
          v41 = v40;
        else
          v41 = v40 & 0xFFFFFFFE;
        if (v41)
        {
          v84 = 136315138;
          v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
          LODWORD(v59) = 12;
          v55 = &v84;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v14)
        goto LABEL_29;
    }
LABEL_73:
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v42 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v61, v80, 16, v55, v59);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v62;
LABEL_75:
      v45 = 0;
      while (1)
      {
        if (*(_QWORD *)v62 != v44)
          objc_enumerationMutation(v5);
        v46 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v45);
        if (objc_msgSend(v46, "hostProcessAttribution"))
          break;
        if (v43 == ++v45)
        {
          v43 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
          if (v43)
            goto LABEL_75;
          goto LABEL_90;
        }
      }
      v14 = v46;
      if (dword_1EE2B3F38)
      {
        v79 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v48 = v79;
        if (os_log_type_enabled(v47, type))
          v49 = v48;
        else
          v49 = v48 & 0xFFFFFFFE;
        if (v49)
        {
          v84 = 136315138;
          v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
          LODWORD(v60) = 12;
          v56 = &v84;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v14)
        goto LABEL_29;
    }
LABEL_90:
    v14 = (id)objc_msgSend(v5, "firstObject", v56, v60);
    if (dword_1EE2B3F38)
    {
      v79 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v51 = v79;
      if (os_log_type_enabled(v50, type))
        v52 = v51;
      else
        v52 = v51 & 0xFFFFFFFE;
      if (!v52)
        goto LABEL_97;
      v84 = 136315138;
      v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
      goto LABEL_96;
    }
  }
LABEL_29:

  return v14;
}

- (BOOL)isAuditTokenValid:(id *)a3
{
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;

  if (a3->var0[0] != -1)
    return 1;
  v4 = 0;
  do
  {
    v5 = v4;
    if (v4 == 7)
      break;
    v6 = a3->var0[++v4];
  }
  while (v6 == -1);
  return v5 < 7;
}

- (BOOL)isAuditTokenEqual:(id *)a3 compareTo:(id *)a4
{
  __int128 v6;
  pid_t v7;
  __int128 v8;
  pid_t v9;
  __int128 v10;
  int v11;
  __int128 v12;
  int v13;
  audit_token_t v16;

  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v6;
  v7 = audit_token_to_pid(&v16);
  v8 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v16.val[4] = v8;
  v9 = audit_token_to_pid(&v16);
  v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v10;
  v11 = audit_token_to_pidversion(&v16);
  v12 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v16.val[4] = v12;
  v13 = audit_token_to_pidversion(&v16);
  return v7 == v9 && v11 == v13;
}

- (void)updateMutedBundleIDs:(id)a3 muteValue:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  int v8;
  int v9;
  int v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v4 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", -[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs"));
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
    goto LABEL_11;
  v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobilephone"));
  v9 = (v8 & 1) != 0 ? 0 : objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.facetime"));
  v10 = v8 | v9;
  if (v4)
  {
    objc_msgSend(v7, "addObject:", a3);
    if (v10)
    {
      objc_msgSend(v7, "addObject:", CFSTR("com.apple.mobilephone"));
      objc_msgSend(v7, "addObject:", CFSTR("com.apple.facetime"));
    }
  }
  else
  {
    objc_msgSend(v7, "removeObject:", a3);
    if (v10)
    {
      objc_msgSend(v7, "removeObject:", CFSTR("com.apple.mobilephone"));
      objc_msgSend(v7, "removeObject:", CFSTR("com.apple.facetime"));
    }
  }
  -[MXSessionManager setMutedSessionBundleIDs:](self, "setMutedSessionBundleIDs:", v7);
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("mutedSessionBundleIDs"), -[NSSet allObjects](-[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs"), "allObjects"));
  if (dword_1EE2B3F38)
  {
LABEL_11:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (int)clearUplinkMutedCache
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  NSSet *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  os_log_type_t type;
  unsigned int v21;
  int v22;
  const char *v23;
  __int16 v24;
  NSSet *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -15685;
  }
  if (CMSMUtility_PhoneCallOrRingtoneExists())
    return -15685;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", -[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = -[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs");
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple")))
          objc_msgSend(v4, "removeObject:", v10);
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v7);
  }
  -[MXSessionManager setMutedSessionBundleIDs:](self, "setMutedSessionBundleIDs:", v4);
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("mutedSessionBundleIDs"), -[NSSet allObjects](-[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs"), "allObjects"));
  if (dword_1EE2B3F38)
  {
    v21 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v12 = v21;
    if (os_log_type_enabled(v11, type))
      v13 = v12;
    else
      v13 = v12 & 0xFFFFFFFE;
    if (v13)
    {
      v14 = -[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs");
      v22 = 136315395;
      v23 = "-[MXSessionManager(Utilities) clearUplinkMutedCache]";
      v24 = 2113;
      v25 = v14;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

- (int)updateMuteState:(id *)a3 muteValue:(id)a4
{
  __int128 v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  id v12;
  void *v13;
  int refreshed;
  __int128 v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  __int128 v34;
  id v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  void *UpTimeNanoseconds;
  id v42;
  NSObject *v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  _QWORD v52[6];
  id v53[2];
  __int128 v54;
  __int128 v55;
  os_log_type_t type;
  int v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  int v61;
  audit_token_t atoken;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 3;
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v7;
  v51 = audit_token_to_pid(&atoken);
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    v57 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v12 = 0;
    v13 = 0;
    refreshed = -15685;
    goto LABEL_8;
  }
  if (a4)
  {
    v9 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&atoken.val[4] = v9;
    if (-[MXSessionManager isAuditTokenValid:](self, "isAuditTokenValid:", &atoken))
    {
      v10 = *(_OWORD *)&a3->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
      *(_OWORD *)&atoken.val[4] = v10;
      if (-[MXSessionManager isAuditTokenValid:](self, "isAuditTokenValid:", &atoken))
      {
        if (dword_1EE2B3F38)
        {
          v57 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v25 = *(_OWORD *)&a3->var0[4];
        *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
        *(_OWORD *)&atoken.val[4] = v25;
        v12 = -[MXSessionManager copySessionToBeMuted:](self, "copySessionToBeMuted:", &atoken, v45, v48);
        if (v12)
        {
LABEL_27:
          v17 = 0;
LABEL_35:
          refreshed = 0;
          goto LABEL_36;
        }
        if (dword_1EE2B3F38)
        {
          v57 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v13 = (void *)MX_RunningBoardServices_CopyDisplayIDForPID(v51);
        if (v13)
        {
          -[MXSessionManager updateMutedBundleIDs:muteValue:](self, "updateMutedBundleIDs:muteValue:", v13, objc_msgSend(a4, "BOOLValue"));
          if (dword_1EE2B3F38)
          {
            v57 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v12 = 0;
          refreshed = 0;
          goto LABEL_8;
        }
      }
      v17 = 0;
      v12 = 0;
      goto LABEL_35;
    }
    if (dword_1EE2B3F38)
    {
      v57 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[MXSessionManager setUplinkMuteSetByClient:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v45, v48), "setUplinkMuteSetByClient:", objc_msgSend(a4, "BOOLValue"));
    v12 = -[MXSessionManager copyPhoneCallBehaviorRecordingSession](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyPhoneCallBehaviorRecordingSession");
    if (v12)
      goto LABEL_27;
    v57 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (objc_msgSend(a4, "BOOLValue"))
      v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    else
      v23 = 0;
    -[MXSessionManager setApplyUplinkMuteToPhoneCallBehaviorSession:](self, "setApplyUplinkMuteToPhoneCallBehaviorSession:", v23, v45, v48);
    if ((objc_msgSend(a4, "BOOLValue") & 1) == 0)
    {
      if (dword_1EE2B3F38)
      {
        v57 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXSessionManager removeEntryFromMutedBundleIDCache:bundleID:](self, "removeEntryFromMutedBundleIDCache:bundleID:", 0, -[MXSessionManager uplinkMutedBundleID](self, "uplinkMutedBundleID", v45, v48));
      -[MXSessionManager setUplinkMutedBundleID:](self, "setUplinkMutedBundleID:", 0);
    }
    CMSMNotificationUtility_PostUplinkMuteDidChange(objc_msgSend(a4, "BOOLValue"));
    v17 = 0;
    v12 = 0;
    refreshed = -15685;
  }
  else
  {
    v16 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&atoken.val[4] = v16;
    if (-[MXSessionManager isAuditTokenValid:](self, "isAuditTokenValid:", &atoken))
    {
      v17 = 0;
      v12 = 0;
      refreshed = 0;
      a4 = 0;
    }
    else
    {
      if (dword_1EE2B3F38)
      {
        v57 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v12 = -[MXSessionManager copyPhoneCallBehaviorRecordingSession](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v45, v48), "copyPhoneCallBehaviorRecordingSession");
      v21 = objc_msgSend(v12, "prefersBluetoothAccessoryMuting");
      if ((v21 & 1) != 0)
      {
        refreshed = 0;
      }
      else
      {
        v57 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        refreshed = -15685;
      }
      v27 = objc_msgSend(v12, "isRecordingMuted", v46, v49);
      a4 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27 ^ 1u);
      v17 = v21 ^ 1;
    }
  }
LABEL_36:
  v13 = CMSUtility_CopyBundleID(v12);
  if (!v13)
  {
    if (dword_1EE2B3F38)
    {
      v57 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v13 = (void *)MX_RunningBoardServices_CopyDisplayIDForPID(v51);
    if (!v13)
    {
      v57 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v13 = 0;
      refreshed = -15685;
    }
  }
  v31 = objc_msgSend(a4, "BOOLValue", v45, v48);
  if (((v31 ^ -[NSSet containsObject:](-[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs"), "containsObject:", v13) | v17) & 1) == 0)
  {
    if (dword_1EE2B3F38)
    {
      v57 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(v12, "hasPhoneCallBehavior"))
  {
    if (!v17)
      goto LABEL_51;
LABEL_48:
    if (dword_1EE2B3F38)
    {
      v57 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v17 = 1;
    goto LABEL_51;
  }
  if (((objc_msgSend(v12, "isRecording") | v17) & 1) != 0)
    goto LABEL_48;
  v17 = 0;
LABEL_51:
  if (v12)
  {
    objc_msgSend(v12, "auditToken");
    v34 = *(_OWORD *)&atoken.val[4];
    *(_OWORD *)a3->var0 = *(_OWORD *)atoken.val;
    *(_OWORD *)&a3->var0[4] = v34;
  }
  if (refreshed)
  {
    if (!v17)
      goto LABEL_8;
    goto LABEL_55;
  }
  -[MXSessionManager updateMutedBundleIDs:muteValue:](self, "updateMutedBundleIDs:muteValue:", v13, objc_msgSend(a4, "BOOLValue"));
  if (objc_msgSend(a4, "BOOLValue"))
    v37 = v13;
  else
    v37 = 0;
  -[MXSessionManager setUplinkMutedBundleID:](self, "setUplinkMutedBundleID:", v37, v47, v50);
  if (objc_msgSend(a4, "BOOLValue"))
    v38 = 1;
  else
    v38 = 2;
  *((_DWORD *)v59 + 6) = v38;
  refreshed = CMSMUtility_AudioToolboxServerRefreshMuteState();
  if (refreshed)
  {
    v57 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    *((_DWORD *)v59 + 6) = 3;
    if (!v17)
      goto LABEL_8;
    goto LABEL_55;
  }
  if (dword_1EE2B3F38)
  {
    v57 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXSessionManager setUplinkMuteSetByClient:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v47, v50), "setUplinkMuteSetByClient:", objc_msgSend(a4, "BOOLValue"));
  CMSMNotificationUtility_PostUplinkMuteDidChange(objc_msgSend(a4, "BOOLValue"));
  refreshed = 0;
  if (v17)
  {
LABEL_55:
    v35 = objc_alloc_init((Class)getAAAudioSessionControlClass());
    if (updateMuteState_muteValue__onceToken != -1)
      dispatch_once(&updateMuteState_muteValue__onceToken, &__block_literal_global_71);
    objc_msgSend(v35, "setDispatchQueue:", updateMuteState_muteValue__sBluetoothMuteActionQueue, v47, v50);
    if (dword_1EE2B3F38)
    {
      v57 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    UpTimeNanoseconds = (void *)FigGetUpTimeNanoseconds();
    objc_initWeak((id *)&atoken, v35);
    v42 = v13;
    v43 = updateMuteState_muteValue__sBluetoothMuteActionQueue;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke_19;
    v52[3] = &unk_1E309EB00;
    objc_copyWeak(v53, (id *)&atoken);
    v44 = *(_OWORD *)&a3->var0[4];
    v54 = *(_OWORD *)a3->var0;
    v55 = v44;
    v52[4] = v13;
    v52[5] = &v58;
    v53[1] = UpTimeNanoseconds;
    MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) updateMuteState:muteValue:]", (uint64_t)"MXSessionManagerUtilities.m", 844, 0, 0, v43, (uint64_t)v52);
    objc_destroyWeak(v53);
    objc_destroyWeak((id *)&atoken);
  }
LABEL_8:

  _Block_object_dispose(&v58, 8);
  return refreshed;
}

dispatch_queue_t __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.mediaexperience.BluetoothMuteActionQueue", v0);
  updateMuteState_muteValue__sBluetoothMuteActionQueue = (uint64_t)result;
  return result;
}

uint64_t __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke_19(uint64_t a1)
{
  id Weak;
  __int128 v3;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  Weak = objc_loadWeak((id *)(a1 + 48));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke_2;
  v5[3] = &unk_1E309EAD8;
  v5[4] = Weak;
  v3 = *(_OWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 64);
  v9 = v3;
  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(Weak, "activateWithCompletion:", v5);
}

void __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  NSObject *v8;
  _OWORD v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v6 = *(void **)(a1 + 32);
    v7 = *(_OWORD *)(a1 + 80);
    v9[0] = *(_OWORD *)(a1 + 64);
    v9[1] = v7;
    objc_msgSend(v6, "setMuteAction:auditToken:bundleIdentifier:", v5, v9, v4);
  }

  if (dword_1EE2B3F38)
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (int)getMuteState:(id *)a3 outMuteValue:(BOOL *)a4
{
  __int128 v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v10;
  id v11;
  void *v12;
  BOOL v13;
  int v14;
  audit_token_t atoken;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v7;
  v8 = audit_token_to_pid(&atoken);
  *a4 = 0;
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -15685;
  }
  v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v10;
  if (!-[MXSessionManager isAuditTokenValid:](self, "isAuditTokenValid:", &atoken))
    return -15685;
  v11 = -[MXSessionManager copySessionWithPID:](self, "copySessionWithPID:", v8);
  v12 = CMSUtility_CopyBundleID(v11);
  if (v12 || (v12 = (void *)MX_RunningBoardServices_CopyDisplayIDForPID(v8)) != 0)
  {
    v13 = -[NSSet containsObject:](-[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs"), "containsObject:", v12);
    v14 = 0;
    *a4 = v13;
  }
  else
  {
    v14 = -15685;
  }

  return v14;
}

- (id)copyPhoneCallBehaviorRecordingSession
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isActive")
          && objc_msgSend(v8, "isRecording")
          && objc_msgSend(v8, "hasPhoneCallBehavior"))
        {
          v9 = v8;
          goto LABEL_13;
        }
      }
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_13:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v8;
}

- (void)removeEntryFromMutedBundleIDCache:(int)a3 bundleID:(id)a4
{
  uint64_t v5;
  NSObject *v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v5 = *(_QWORD *)&a3;
  if (!MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (!MX_FeatureFlags_IsCallManagementMuteControlEnabled())
      return;
    if ((_DWORD)v5 || a4)
    {
      if ((_DWORD)v5)
      {
        v8 = -[MXSessionManager copySessionWithPID:](self, "copySessionWithPID:", v5);
        v9 = (__CFString *)CMSUtility_CopyBundleID(v8);
        if (v9)
        {
          v10 = v9;
          goto LABEL_13;
        }
        v10 = (__CFString *)MX_RunningBoardServices_CopyDisplayIDForPID(v5);
        if (v10)
        {
LABEL_13:
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", -[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs")), "containsObject:", v10))
          {
            -[MXSessionManager updateMutedBundleIDs:muteValue:](self, "updateMutedBundleIDs:muteValue:", v10, 0);
            if (dword_1EE2B3F38)
            {
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
        }
      }
      else
      {
        v10 = (__CFString *)a4;
        v8 = 0;
        if (v10)
          goto LABEL_13;
      }

      return;
    }
  }
  v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
}

- (id)copyActiveSessionWithAudioCategory:(id)a3 andAudioMode:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  uint64_t i;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  os_log_type_t type;
  unsigned int v28;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    v6 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      if (a3)
        v10 = a4 == 0;
      else
        v10 = 1;
      v11 = !v10;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v13, "isActive"))
          {
            if (v11)
            {
              if ((objc_msgSend(v13, "hasAudioMode:", a4) & 1) != 0
                && objc_msgSend(v13, "hasAudioCategory:", a3))
              {
                goto LABEL_26;
              }
            }
            else if (a3)
            {
              if ((objc_msgSend(v13, "hasAudioCategory:", a3) & 1) != 0)
                goto LABEL_26;
            }
            else if (a4 && (objc_msgSend(v13, "hasAudioMode:", a4) & 1) != 0)
            {
LABEL_26:
              if (dword_1EE2B3F38)
              {
                v28 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v17 = v28;
                if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
                  v18 = v17;
                else
                  v18 = v17 & 0xFFFFFFFE;
                if (v18)
                {
                  v19 = objc_msgSend(v13, "clientName");
                  v20 = objc_msgSend(v13, "audioCategory");
                  v21 = objc_msgSend(v13, "audioMode");
                  v29 = 136315906;
                  v30 = "-[MXSessionManager(Utilities) copyActiveSessionWithAudioCategory:andAudioMode:]";
                  v31 = 2114;
                  v32 = v19;
                  v33 = 2114;
                  v34 = v20;
                  v35 = 2114;
                  v36 = v21;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              v14 = v13;
              goto LABEL_34;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
        if (v8)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_34:

  }
  else
  {
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return v14;
}

- (id)copySessionsWithAuditToken:(id *)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v14[2];
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if (v11)
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "auditToken");
        else
          memset(v15, 0, sizeof(v15));
        v12 = *(_OWORD *)&a3->var0[4];
        v14[0] = *(_OWORD *)a3->var0;
        v14[1] = v12;
        if (-[MXSessionManager isAuditTokenEqual:compareTo:](self, "isAuditTokenEqual:compareTo:", v15, v14))
          objc_msgSend(v5, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)updateBluetoothFrameworkToPlayMuteChime:(id)a3 playRejectTone:(BOOL)a4
{
  NSObject *v6;
  id v7;
  CFStringRef v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v10;
  NSObject *v12;
  void *UpTimeNanoseconds;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  id v18[2];
  int v19;
  os_log_type_t v20;
  os_log_type_t v21[4];
  id location;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[4];
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isRecording") & 1) != 0 || a4)
  {
    v7 = objc_alloc_init((Class)getAAAudioSessionControlClass());
    v23 = 0;
    v24 = &v23;
    v25 = 0x3052000000;
    v26 = __Block_byref_object_copy__14;
    v27 = __Block_byref_object_dispose__14;
    v28 = 0;
    v28 = CMSUtility_CopyBundleID(a3);
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x4010000000;
    v29[3] = &unk_193807DB1;
    v30 = 0u;
    v31 = 0u;
    if (a3)
      objc_msgSend(a3, "auditToken");
    if (updateBluetoothFrameworkToPlayMuteChime_playRejectTone__onceToken != -1)
      dispatch_once(&updateBluetoothFrameworkToPlayMuteChime_playRejectTone__onceToken, &__block_literal_global_22_0);
    if (!v24[5])
    {
      v8 = MX_RunningBoardServices_CopyDisplayIDForPID(objc_msgSend((id)objc_msgSend(a3, "clientPID"), "unsignedIntValue"));
      v24[5] = (uint64_t)v8;
      if (!v8)
      {
        LODWORD(location) = 0;
        v21[0] = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    objc_msgSend(v7, "setDispatchQueue:", updateBluetoothFrameworkToPlayMuteChime_playRejectTone__sBluetoothMuteActionQueue, v15, v16);
    objc_initWeak(&location, v7);
    if (a4)
    {
      v10 = 3;
    }
    else if ((objc_msgSend(a3, "isRecordingMuted") & 1) != 0)
    {
      v10 = 1;
    }
    else if (objc_msgSend(a3, "isRecordingMuted"))
    {
      v10 = 3;
    }
    else
    {
      v10 = 2;
    }
    if (dword_1EE2B3F38)
    {
      *(_DWORD *)v21 = 0;
      v20 = OS_LOG_TYPE_DEFAULT;
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    UpTimeNanoseconds = (void *)FigGetUpTimeNanoseconds();
    v14 = updateBluetoothFrameworkToPlayMuteChime_playRejectTone__sBluetoothMuteActionQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_32;
    v17[3] = &unk_1E309EB50;
    objc_copyWeak(v18, &location);
    v19 = v10;
    v17[4] = v29;
    v17[5] = &v23;
    v18[1] = UpTimeNanoseconds;
    MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) updateBluetoothFrameworkToPlayMuteChime:playRejectTone:]", (uint64_t)"MXSessionManagerUtilities.m", 1110, 0, 0, v14, (uint64_t)v17);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v23, 8);
  }
  else if (dword_1EE2B3F38)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

dispatch_queue_t __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.mediaexperience.MuteActionQueue", v0);
  updateBluetoothFrameworkToPlayMuteChime_playRejectTone__sBluetoothMuteActionQueue = (uint64_t)result;
  return result;
}

uint64_t __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_32(uint64_t a1)
{
  id Weak;
  _QWORD v4[5];
  __int128 v5;
  uint64_t v6;
  int v7;

  Weak = objc_loadWeak((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_2;
  v4[3] = &unk_1E309EB28;
  v4[4] = Weak;
  v7 = *(_DWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(Weak, "activateWithCompletion:", v4);
}

void __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  _QWORD v13[5];
  os_log_type_t type;
  unsigned int v15;
  int v16;
  const char *v17;
  __int16 v18;
  double v19;
  _OWORD v20[8];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v4 = *(unsigned int *)(a1 + 64);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = *(_OWORD *)(v6 + 48);
    v20[0] = *(_OWORD *)(v6 + 32);
    v20[1] = v8;
    objc_msgSend(v5, "setMuteAction:auditToken:bundleIdentifier:", v4, v20, v7);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_2_33;
  v13[3] = &unk_1E3099900;
  v13[4] = *(_QWORD *)(a1 + 32);
  MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) updateBluetoothFrameworkToPlayMuteChime:playRejectTone:]_block_invoke", (uint64_t)"MXSessionManagerUtilities.m", 1124, 0, 0, updateBluetoothFrameworkToPlayMuteChime_playRejectTone__sBluetoothMuteActionQueue, (uint64_t)v13);

  if (dword_1EE2B3F38)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v10 = v15;
    if (os_log_type_enabled(v9, type))
      v11 = v10;
    else
      v11 = v10 & 0xFFFFFFFE;
    if (v11)
    {
      v12 = (float)((float)(FigGetUpTimeNanoseconds() - *(_QWORD *)(a1 + 56)) / 1000000.0);
      v16 = 136315394;
      v17 = "-[MXSessionManager(Utilities) updateBluetoothFrameworkToPlayMuteChime:playRejectTone:]_block_invoke";
      v18 = 2048;
      v19 = v12;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_2_33(uint64_t a1)
{

}

- (BOOL)clientTypeOverridesHardwareSwitch:(unsigned int)a3
{
  return (a3 > 8) | (0xEDu >> a3) & 1;
}

- (id)getSilentModeClientTypeAsString:(unsigned int)a3
{
  if (a3 >= 0xA)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%d)"), *(_QWORD *)&a3);
  else
    return off_1E309EBD0[a3];
}

- (id)getClientPriorityAsString:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      return CFSTR("Default");
    case 0x14u:
      return CFSTR("EmergencyAlert");
    case 0xAu:
      return CFSTR("PhoneCall");
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%d)"), *(_QWORD *)&a3);
}

- (id)getRouteSharingPolicyAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%d)"), *(_QWORD *)&a3);
  else
    return off_1E309EC20[a3];
}

- (BOOL)isAnyOtherUnduckedPlayingSessionMatchingVolumeRampCategory:(id)a3
{
  const __CFString *LastVolumeRampCategory;
  int CurrentOutputVADID;
  NSPointerArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  LastVolumeRampCategory = (const __CFString *)vaemVolumeStateGetLastVolumeRampCategory();
  CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", 0), "mxCoreSessionList");
  v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v11 != a3
          && objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isPlaying")
          && (objc_msgSend(v11, "isDucked") & 1) == 0
          && CurrentOutputVADID == CMSUtility_GetCurrentOutputVADID(v11)
          && PVMCategoriesAreEquivalent((const __CFString *)-[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", objc_msgSend(a3, "audioCategory")), (const void *)objc_msgSend(a3, "audioMode"), LastVolumeRampCategory, 0))
        {
          v12 = 1;
          goto LABEL_15;
        }
      }
      v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_15:
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  return v12;
}

- (BOOL)doesSessionPreferInterruptionOnRouteDisconnect:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "hasAudioCategory:", CFSTR("MediaPlayback"));
  if (objc_msgSend(a3, "prefersInterruptionOnRouteDisconnectSetByClient"))
    return objc_msgSend(a3, "prefersInterruptionOnRouteDisconnect");
  if ((-[NSString isEqualToString:](-[MXNowPlayingAppManager nowPlayingAppDisplayID](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "nowPlayingAppDisplayID"), "isEqualToString:", objc_msgSend(a3, "displayID")) & v4) == 1)return objc_msgSend(a3, "isAirPlayReceiverSession") ^ 1;
  return 0;
}

- (void)interruptSessionsOnRouteDisconnect:(id)a3
{
  int IsInterruptOnRouteDisconnectEnabled;
  int IsContextSystemAudio;
  int v6;
  NSPointerArray *v7;
  uint64_t v8;
  MXSessionManager *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  int *v27;
  uint64_t v28;
  uint64_t v30;
  NSPointerArray *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  os_log_type_t type;
  unsigned int v38;
  int v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  _BOOL4 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  IsInterruptOnRouteDisconnectEnabled = MX_FeatureFlags_IsInterruptOnRouteDisconnectEnabled();
  IsContextSystemAudio = FigRoutingManagerContextUtilities_IsContextSystemAudio((uint64_t)a3);
  v6 = CMSMUtility_IsSharePlayCallSessionActive();
  if (IsInterruptOnRouteDisconnectEnabled && IsContextSystemAudio && !v6)
  {
    -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
    v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    v9 = self;
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v34;
      v30 = *(_QWORD *)v34;
      v31 = v7;
      do
      {
        v12 = 0;
        v32 = v10;
        do
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
          if (objc_msgSend(v13, "isActive", v27, v28) && objc_msgSend(v13, "isPlaying"))
          {
            v14 = -[MXSessionManager doesSessionPreferInterruptionOnRouteDisconnect:](v9, "doesSessionPreferInterruptionOnRouteDisconnect:", v13);
            v15 = CMSUtility_AreRoutingContextsEquivalent((uint64_t)a3, objc_msgSend(v13, "routingContextUUID"));
            if (dword_1EE2B3F38)
            {
              v38 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v17 = v38;
              if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
                v18 = v17;
              else
                v18 = v17 & 0xFFFFFFFE;
              if (v18)
              {
                v19 = objc_msgSend(v13, "clientName");
                v20 = objc_msgSend(v13, "audioCategory");
                v39 = 136316162;
                v40 = "-[MXSessionManager(Utilities) interruptSessionsOnRouteDisconnect:]";
                v41 = 2114;
                v42 = v19;
                v43 = 2114;
                v44 = v20;
                v45 = 1024;
                v46 = v14;
                v47 = 1024;
                v48 = v15;
                v9 = self;
                LODWORD(v28) = 44;
                v27 = &v39;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v11 = v30;
              v7 = v31;
              v10 = v32;
            }
            if (v15 && v14)
            {
              if (dword_1EE2B3F38)
              {
                v38 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v23 = v38;
                if (os_log_type_enabled(v22, type))
                  v24 = v23;
                else
                  v24 = v23 & 0xFFFFFFFE;
                if (v24)
                {
                  v25 = objc_msgSend(v13, "clientName");
                  v39 = 136315394;
                  v40 = "-[MXSessionManager(Utilities) interruptSessionsOnRouteDisconnect:]";
                  v41 = 2114;
                  v42 = v25;
                  LODWORD(v28) = 22;
                  v27 = &v39;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                v11 = v30;
                v7 = v31;
                v10 = v32;
              }
              CMSUtilityApplier_PostNotification_StopCommandWithReason(v13, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4, v27, v28));
            }
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      }
      while (v10);
    }
    -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v27, v28), "mxCoreSessionListEndIteration");
  }
  else if (dword_1EE2B3F38)
  {
    v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)interruptSessionsForCategoryNoLongerRoutable
{
  NSPointerArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
  v3 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "isActive")
          && objc_msgSend(v7, "hasInput")
          && !CMSMVAUtility_IsInputDeviceAvailableForSession(v7))
        {
          if (dword_1EE2B3F38)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          CMSUtilityApplier_PostNotification_StopCommandWithReason(v7, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4, v9, v10));
        }
      }
      v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
}

- (void)postStopCommandToSessionsWithAudioMode:(id)a3
{
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  int *v15;
  uint64_t v16;
  NSPointerArray *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  os_log_type_t type;
  unsigned int v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
    v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      v17 = v4;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v9, "isActive", v15, v16)
            && objc_msgSend(v9, "hasAudioMode:", a3))
          {
            if (dword_1EE2B3F38)
            {
              v23 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v11 = v23;
              if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
                v12 = v11;
              else
                v12 = v11 & 0xFFFFFFFE;
              if (v12)
              {
                v13 = objc_msgSend(v9, "clientName");
                v24 = 136315650;
                v25 = "-[MXSessionManager(Utilities) postStopCommandToSessionsWithAudioMode:]";
                v26 = 2114;
                v27 = v13;
                v28 = 2114;
                v29 = a3;
                LODWORD(v16) = 32;
                v15 = &v24;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v4 = v17;
            }
            CMSUtilityApplier_PostNotification_StopCommand(v9, 0);
          }
        }
        v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v6);
    }
    -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v15, v16), "mxCoreSessionListEndIteration");
  }
  else
  {
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)isAtleastOneBudNotInEarForA2DPPort
{
  uint64_t CurrentOutputPortAtIndex;
  AudioObjectID v3;
  int DoesBTPortSupportInEarDetection;

  CurrentOutputPortAtIndex = CMSMUtility_GetCurrentOutputPortAtIndex(0);
  v3 = CurrentOutputPortAtIndex;
  if (vaeGetPortTypeFromPortID(CurrentOutputPortAtIndex) == 1885892674)
  {
    DoesBTPortSupportInEarDetection = vaeDoesBTPortSupportInEarDetection(v3);
    if (DoesBTPortSupportInEarDetection)
      LOBYTE(DoesBTPortSupportInEarDetection) = vaeGetBTPortPrimaryBudInEarStatus(v3) != 1
                                             || vaeGetBTPortSecondaryBudInEarStatus(v3) != 1;
  }
  else
  {
    LOBYTE(DoesBTPortSupportInEarDetection) = 0;
  }
  return DoesBTPortSupportInEarDetection;
}

- (void)interruptAllSessionsAndSystemSounds:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isActive"))
        {
          if (dword_1EE2B3F38)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
        }
        objc_msgSend((id)objc_msgSend(v8, "clientPID", v10, v11), "unsignedIntValue");
        CMSystemSoundMgr_StopSystemSoundsforPID();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (BOOL)isSessionUsingBuiltInMic:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "hasInput"))
    return 0;
  v4 = -[MXAdditiveRoutingManager copyDetailedRouteDescription:](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "copyDetailedRouteDescription:", CMSUtility_GetCurrentInputVADID(a3));
  v5 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("RouteDetailedDescription_Inputs"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKey:", CFSTR("RouteDetailedDescription_PortType")), "isEqualToString:", CFSTR("MicrophoneBuiltIn")) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (void)updateExclaveSensorStatusIfNeeded
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (CMSMDeviceState_DeviceHasExclaveCapability())
  {
    v2 = -[MXSessionManager copyMXCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyMXCoreSessionList");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      v6 = 0x1EE2B0000uLL;
      v12 = v2;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v8, "isActive", v10, v11)
            && objc_msgSend((id)objc_msgSend((id)(v6 + 3200), "sharedInstance"), "updateSensorStatus:reason:", v8, CFSTR("Route has changed")))
          {
            if (dword_1EE2B3F38)
            {
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v6 = 0x1EE2B0000;
              v2 = v12;
            }
            CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

  }
}

- (unsigned)getSpeechDetectStyleForSessionConfiguration:(id)a3
{
  if (!objc_msgSend(a3, "prefersSpeechDetectEnabled")
    || objc_msgSend(a3, "clientPriority") == 10)
  {
    return 4;
  }
  if ((objc_msgSend(a3, "hasAudioMode:", CFSTR("SpokenAudio")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "hasAudioCategory:", CFSTR("MediaPlayback")) & 1) != 0
    || (objc_msgSend(a3, "hasAudioCategory:", CFSTR("MediaPlaybackNoSpeaker")) & 1) != 0
    || (objc_msgSend(a3, "hasAudioCategory:", CFSTR("Audio/Video")) & 1) != 0
    || (objc_msgSend(a3, "hasAudioCategory:", CFSTR("AmbientSound")) & 1) != 0
    || (objc_msgSend(a3, "hasAudioCategory:", CFSTR("SoloAmbientSound")) & 1) != 0
    || (objc_msgSend(a3, "hasAudioCategory:", CFSTR("UserInterfaceSoundEffects")) & 1) != 0
    || (objc_msgSend(a3, "hasAudioCategory:", CFSTR("AudioProcessing")) & 1) != 0
    || (objc_msgSend(a3, "hasAudioCategory:", CFSTR("LiveAudio")) & 1) != 0
    || (objc_msgSend(a3, "hasAudioCategory:", CFSTR("Notice")) & 1) != 0
    || objc_msgSend(a3, "isPlayingOutput")
    && CMSMUtility_IsPlayAndRecordCategory(objc_msgSend(a3, "audioCategory"))
    && objc_msgSend(a3, "hasAudioMode:", CFSTR("Default")))
  {
    if (!MX_FeatureFlags_IsInterruptLongFormVideoOnSpeechDetectEnabled()
      || (objc_msgSend(a3, "hasAudioMode:", CFSTR("MoviePlayback")) & 1) == 0
      && !CMSUtility_IsLongFormVideoSession(a3))
    {
      return 3;
    }
    return 2;
  }
  if (-[MXSessionManager sessionUtilizesIndependentRecordingOnly:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "sessionUtilizesIndependentRecordingOnly:", a3)|| (objc_msgSend(a3, "hasAudioMode:", CFSTR("LivePhoto")) & 1) != 0)
  {
    return 1;
  }
  if (objc_msgSend(a3, "hasAudioCategory:", CFSTR("SystemSoundsAndHaptics")))
    return 1;
  return 4;
}

- (BOOL)shouldSetDeviceFormatAndSampleRate:(id)a3
{
  _BOOL4 v3;

  if (a3)
    return (objc_msgSend(a3, "currentlyControllingFlags") >> 1) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)isAnySessionWithMappedVolumeCategoryPlaying:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = PVMGetMappedCategory((void *)objc_msgSend(v9, "audioCategory"));
        if (objc_msgSend(v9, "isActive")
          && objc_msgSend(v9, "isPlaying")
          && (objc_msgSend(v10, "isEqualToString:", a3) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)isAudioCategoryAllowedForSharePlayMedia:(id)a3
{
  return objc_msgSend(a3, "isEqual:", CFSTR("MediaPlayback"));
}

- (BOOL)isPotentialSharePlayMediaSessionActive
{
  id v2;
  BOOL v3;

  v2 = -[MXSessionManager copyPotentialActiveSharePlayMediaSession](self, "copyPotentialActiveSharePlayMediaSession");
  v3 = v2 != 0;

  return v3;
}

- (BOOL)sessionCanBecomeSharePlayMedia:(id)a3
{
  if (-[MXSessionManager isAudioCategoryAllowedForSharePlayMedia:](self, "isAudioCategoryAllowedForSharePlayMedia:", objc_msgSend(a3, "audioCategory"))&& objc_msgSend(a3, "isEligibleForNowPlayingAppConsideration"))
  {
    return objc_msgSend(a3, "allowedToBeNowPlayingApp");
  }
  else
  {
    return 0;
  }
}

- (id)copyPotentialActiveSharePlayMediaSession
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id SharePlayMediaSession;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!MX_FeatureFlags_IsSharePlayEnabled())
    return 0;
  SharePlayMediaSession = CMSMUtility_GetSharePlayMediaSession();
  if (objc_msgSend(SharePlayMediaSession, "isActive"))
    return SharePlayMediaSession;
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList");
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive")
          && -[MXSessionManager sessionCanBecomeSharePlayMedia:](self, "sessionCanBecomeSharePlayMedia:", v10))
        {
          v4 = v10;
          goto LABEL_16;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v4 = 0;
LABEL_16:
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
  return v4;
}

- (BOOL)isSessionAllowedToStartRecordingTemporarily:(id)a3
{
  void *v4;
  NSString *v5;

  v4 = (void *)objc_msgSend(a3, "displayID");
  v5 = -[MXSessionManager appAllowedToInitiateRecordingTemporarily](self, "appAllowedToInitiateRecordingTemporarily");
  if (v4 && v5)
    return objc_msgSend(v4, "isEqualToString:", v5);
  else
    return 0;
}

- (void)postDisallowedActivationDueToContinuityCaptureNotification:(BOOL)a3 videoPlaybackWasIntended:(BOOL)a4
{
  NSObject *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v8[4];
  BOOL v9;
  BOOL v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (CMSMDeviceState_ItsAniPad())
  {
    v6 = MXGetNotificationSenderQueue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __115__MXSessionManager_Utilities__postDisallowedActivationDueToContinuityCaptureNotification_videoPlaybackWasIntended___block_invoke;
    v8[3] = &__block_descriptor_34_e5_v8__0l;
    v9 = a3;
    v10 = a4;
    MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) postDisallowedActivationDueToContinuityCaptureNotification:videoPlaybackWasIntended:]", (uint64_t)"MXSessionManagerUtilities.m", 1972, 0, 0, v6, (uint64_t)v8);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __115__MXSessionManager_Utilities__postDisallowedActivationDueToContinuityCaptureNotification_videoPlaybackWasIntended___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (_block_invoke_registrationStatus
    && (_block_invoke_registrationStatus = notify_register_check("com.apple.MediaExperience.DisallowedActivationDueToContinuityCapture", &_block_invoke_notificationToken)) != 0|| (*(_BYTE *)(a1 + 33) ? (v2 = *(unsigned __int8 *)(a1 + 32) | 2) : (v2 = *(unsigned __int8 *)(a1 + 32)), notify_set_state(_block_invoke_notificationToken, v2)|| (result = notify_post("com.apple.MediaExperience.DisallowedActivationDueToContinuityCapture"), (_DWORD)result)|| dword_1EE2B3F38))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)postDisallowedRecordingNotification:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = MXGetNotificationSenderQueue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__MXSessionManager_Utilities__postDisallowedRecordingNotification___block_invoke;
  v6[3] = &unk_1E309DAB0;
  v6[4] = self;
  v6[5] = a3;
  MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) postDisallowedRecordingNotification:]", (uint64_t)"MXSessionManagerUtilities.m", 2021, 0, 0, v5, (uint64_t)v6);
}

uint64_t __67__MXSessionManager_Utilities__postDisallowedRecordingNotification___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (_block_invoke_2_registrationStatus
    && (_block_invoke_2_registrationStatus = notify_register_check("com.apple.MediaExperience.DisallowedRecording", &_block_invoke_2_notificationToken)) != 0|| notify_set_state(_block_invoke_2_notificationToken, *(_QWORD *)(a1 + 40))|| (result = notify_post("com.apple.MediaExperience.DisallowedRecording"), (_DWORD)result)|| dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (id)getDisallowedRecordingReasonString:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("OnenessIsActive");
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN(%llu)"), a3);
}

- (void)updateActiveSessionsOnDeviceRelinquished
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](self, "mxCoreSessionListBeginIteration");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList", 0);
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "setWasActiveWhenDeviceOwnershipRelinquished:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "isActive"));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[MXSessionManager mxCoreSessionListEndIteration](self, "mxCoreSessionListEndIteration");
}

- (id)getCleanupSessionAssertionReasonString:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN reason = %d"), a3);
  else
    return off_1E309EC40[a3];
}

- (id)copyActiveVoiceOverSession
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "isActive")
          && objc_msgSend(v7, "hasAudioCategory:", CFSTR("VoiceOver")))
        {
          v8 = v7;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (id)copyEvaluatedBadgeType:(id)a3
{
  return (id)(id)FigRoutingManagerUtilities_GetEvaluatedBadgeType();
}

- (void)updateBadgeType:(id)a3 matchingPID:(int)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = -[MXSessionManager copyMXCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyMXCoreSessionList");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "clientPID"), "intValue") == a4)
          objc_msgSend(v11, "setBadgeType:", a3);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)updateSupportedOutputChannelLayouts:(id)a3 matchingPID:(int)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = -[MXSessionManager copyMXCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyMXCoreSessionList");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "clientPID"), "intValue") == a4)
          objc_msgSend(v11, "setSupportedOutputChannelLayouts:", a3);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (BOOL)isPIDAllowedToBeNowPlayingApp:(int)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[MXSessionManager copyMXCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyMXCoreSessionList");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "clientPID"), "intValue") == a3)
        {
          if (CMSUtility_GetIsEligibleForNowPlayingAppConsideration(v10))
          {
            ++v7;
            if (!objc_msgSend(v10, "allowedToBeNowPlayingApp"))
            {
              v11 = 0;
              goto LABEL_15;
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
  v11 = 1;
LABEL_15:

  return v7 && v11;
}

- (id)copySessionEligibleForNowPlayingAppConsideration:(int)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[MXSessionManager copyMXCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyMXCoreSessionList");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "clientPID"), "intValue") == a3
          && objc_msgSend(v9, "isEligibleForNowPlayingAppConsideration"))
        {
          v10 = v9;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)doesActiveSessionHaveInput
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isActive")
          && objc_msgSend(v6, "hasInput")
          && (objc_msgSend(v6, "currentlyControllingFlags") & 2) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

- (BOOL)isBTRouteSameDeviceWithDifferentProfile:(unsigned int)a3 newNumRoutes:(unsigned int)a4 oldRouteTypes:(id)a5 newRouteTypes:(id)a6 oldRouteIdentifiers:(id)a7 newRouteIdentifiers:(id)a8
{
  int v8;
  int v13;
  int v14;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;

  LOBYTE(v8) = 0;
  if (a3 == 1 && a4 == 1)
  {
    if ((objc_msgSend(a5, "containsObject:", CFSTR("HeadphonesBT")) & 1) != 0)
      v13 = 0;
    else
      v13 = objc_msgSend(a5, "containsObject:", CFSTR("HeadsetBT")) ^ 1;
    if ((objc_msgSend(a6, "containsObject:", CFSTR("HeadphonesBT")) & 1) != 0)
      v14 = 0;
    else
      v14 = objc_msgSend(a6, "containsObject:", CFSTR("HeadsetBT")) ^ 1;
    if (((v13 | v14) & 1) != 0)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      v18 = 0;
      v19 = 0;
      v16 = 0;
      v17 = 0;
      CMSMUtility_CreateTokensFromDeviceUID((CFStringRef)objc_msgSend(a7, "objectAtIndex:", 0), (CFStringRef *)&v19, (CFStringRef *)&v17);
      CMSMUtility_CreateTokensFromDeviceUID((CFStringRef)objc_msgSend(a8, "objectAtIndex:", 0), (CFStringRef *)&v18, (CFStringRef *)&v16);
      LOBYTE(v8) = 0;
      if (v19 && v18 && v17 && v16)
      {
        if (-[__CFString isEqualToString:](v19, "isEqualToString:"))
          v8 = -[__CFString isEqualToString:](v17, "isEqualToString:", v16) ^ 1;
        else
          LOBYTE(v8) = 0;
      }

    }
  }
  return v8;
}

- (BOOL)canSessionsCoexistDueToIndependentRecording:(id)a3 victim:(id)a4
{
  id v6;
  id v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  NSObject *v10;

  if (!CMSMVAUtility_IsAdditiveRoutingEnabled()
    || (v6 = a4,
        v7 = a3,
        !-[MXSessionManager sessionUtilizesIndependentRecordingOnly:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "sessionUtilizesIndependentRecordingOnly:", a3))&& (v6 = a3, v7 = a4, !-[MXSessionManager sessionUtilizesIndependentRecordingOnly:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "sessionUtilizesIndependentRecordingOnly:", a4)))
  {
LABEL_16:
    LOBYTE(v7) = 0;
    return (char)v7;
  }
  if (v7)
  {
    if ((objc_msgSend(v7, "prefersEchoCancelledInput") & 1) == 0 && objc_msgSend(v6, "isTheAssistant"))
    {
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_16;
    }
    if (objc_msgSend(v7, "hasAudioMode:", CFSTR("SoundRecognition")))
    {
      if (dword_1EE2B3F38)
      {
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        LOBYTE(v7) = 1;
LABEL_18:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        return (char)v7;
      }
      goto LABEL_15;
    }
    if (!objc_msgSend(v6, "hasPhoneCallBehavior"))
    {
LABEL_15:
      LOBYTE(v7) = 1;
      return (char)v7;
    }
    LOBYTE(v7) = objc_msgSend(v7, "hasEntitlementToRecordDuringCall");
    if (dword_1EE2B3F38)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      goto LABEL_18;
    }
  }
  return (char)v7;
}

- (BOOL)isSiriSessionActive:(BOOL *)a3 andMixable:(BOOL *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "isTheAssistant"))
        {
          if (a3)
            *a3 = objc_msgSend(v11, "isRecording");
          if (a4)
            *a4 = objc_msgSend(v11, "mixesWithEveryone");
          v12 = objc_msgSend(v11, "isActive");
          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (BOOL)isMixableSessionBeingInterruptedByNextRecordingClient:(id)a3 victim:(id)a4
{
  int v6;
  int v7;

  v6 = objc_msgSend(a4, "mixesWithEveryone");
  if (v6)
  {
    v6 = objc_msgSend(a4, "prefersBeingInterruptedByNextActiveRecordingClient");
    if (v6)
    {
      v7 = objc_msgSend(a4, "clientPriority");
      LOBYTE(v6) = v7 == objc_msgSend(a3, "clientPriority")
                && CMSMUtility_IsRecordingCategory((const void *)objc_msgSend(a3, "audioCategory"));
    }
  }
  return v6;
}

- (void)remoteDeviceControlIsAllowed:(unsigned int *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!MX_FeatureFlags_IsOnenessEnabled())
  {
    if (!a3)
      return;
    v11 = 1;
    goto LABEL_30;
  }
  v5 = -[MXSessionManager copyMXCoreSessionList](self, "copyMXCoreSessionList");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive")
          && objc_msgSend(v10, "hasPhoneCallBehavior")
          && objc_msgSend(v10, "isRecording"))
        {
          if (dword_1EE2B3F38)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v11 = 3;
          goto LABEL_29;
        }
        if (objc_msgSend(v10, "isTheAssistant") && objc_msgSend(v10, "isRecording"))
        {
          if (dword_1EE2B3F38)
          {
            v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v11 = 4;
          goto LABEL_29;
        }
        if (objc_msgSend(v10, "isActive")
          && objc_msgSend(v10, "isRecording")
          && (objc_msgSend(v10, "prefersNoInterruptionsDuringRemoteDeviceControl") & 1) == 0)
        {
          if (dword_1EE2B3F38)
          {
            v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v11 = 2;
          goto LABEL_29;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_29:

  if (a3)
LABEL_30:
    *a3 = v11;
}

- (id)getAvailableAudioDestination:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("VirtualAudioDevice_Default");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (vaemIsAudioDestinationAvailable((uint64_t)v9))
          return v9;
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  return v4;
}

- (id)copyAudioBehaviorForCategory:(id)a3 mode:(id)a4
{
  uint64_t CategoryStringWithModeAppended;
  void *v6;
  __CFArray *v7;
  CFTypeRef v8;
  id v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!qword_1EE2B3C48)
    return 0;
  if (!a3 || !a4)
  {
    if (!dword_1EE2B3F38)
      return 0;
LABEL_14:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  CategoryStringWithModeAppended = CMSMUtility_CreateCategoryStringWithModeAppended((uint64_t)-[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", a3), (uint64_t)a4);
  if (!CategoryStringWithModeAppended)
    goto LABEL_14;
  v6 = (void *)CategoryStringWithModeAppended;
  v7 = CMSMUtility_CopyCurrentRouteTypes();
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("VoiceOver"))
    && -[__CFArray containsObject:](v7, "containsObject:", CFSTR("BluetoothLEOutput")))
  {
    v8 = CMSMUtility_CopyVoiceOverOverBTLEAudioDictionary();
  }
  else
  {
    v9 = (id)objc_msgSend((id)qword_1EE2B3C48, "objectForKey:", v6);
    if (v9)
      goto LABEL_13;
    v8 = (id)objc_msgSend((id)qword_1EE2B3C48, "objectForKey:", CFSTR("Default"));
  }
  v9 = (id)v8;
LABEL_13:

  if (!v9)
    goto LABEL_14;
  return v9;
}

- (id)getProjectedAudioDestinationForCategory:(id)a3 mode:(id)a4
{
  __CFString *v4;
  id v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v4 = CFSTR("VirtualAudioDevice_Default");
  if (a3 && a4)
  {
    v5 = -[MXSessionManager copyAudioBehaviorForCategory:mode:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyAudioBehaviorForCategory:mode:", a3, a4);
    v6 = objc_msgSend(v5, "objectForKey:", CFSTR("AudioBehaviour_Destination"));
    if (v6)
      v4 = -[MXSessionManager getAvailableAudioDestination:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getAvailableAudioDestination:", v6);

  }
  else if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v4;
}

@end
