@implementation MRNotificationClient

void __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE2C1E40);
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    v8 = objc_msgSend(v5, "copy");

    v5 = (id)v8;
  }
  objc_msgSend(v7, "setObject:forKey:", v5, v9);

}

- (MRNotificationClient)init
{
  MRNotificationClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *notificationQueue;
  void *v9;
  uint64_t v10;
  NSOrderedSet *nowPlayingNotifications;
  void *v12;
  uint64_t v13;
  NSOrderedSet *routesChangedNotifications;
  void *v15;
  uint64_t v16;
  NSOrderedSet *volumeControlNotifications;
  void *v18;
  uint64_t v19;
  NSOrderedSet *externalScreenNotifications;
  void *v21;
  uint64_t v22;
  NSOrderedSet *originNotifications;
  void *v24;
  uint64_t v25;
  NSOrderedSet *supportedCommandsNotifications;
  void *v27;
  uint64_t v28;
  NSOrderedSet *voiceInputNotifications;
  void *v30;
  uint64_t v31;
  NSOrderedSet *errorNotifications;
  objc_super v34;
  const __CFString *v35;
  const __CFString *v36;
  _QWORD v37[3];
  _QWORD v38[4];
  const __CFString *v39;
  const __CFString *v40;
  _QWORD v41[4];
  _QWORD v42[59];

  v42[58] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)MRNotificationClient;
  v2 = -[MRNotificationClient init](&v34, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MediaRemote.MRNotificationClient.serialQueue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.MediaRemote.MRNotificationClient.notificationQueue", v6);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    v42[0] = CFSTR("kMRMediaRemoteNowPlayingInfoDidChangeNotification");
    v42[1] = CFSTR("kMRMediaRemoteOriginNowPlayingInfoDidChangeNotification");
    v42[2] = CFSTR("kMRMediaRemotePlayerNowPlayingInfoDidChangeNotification");
    v42[3] = CFSTR("kMRMediaRemoteNowPlayingApplicationDidChangeNotification");
    v42[4] = CFSTR("kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification");
    v42[5] = CFSTR("kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification");
    v42[6] = CFSTR("kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification");
    v42[7] = CFSTR("kMRMediaRemotePlayerIsPlayingDidChangeNotification");
    v42[8] = CFSTR("kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification");
    v42[9] = CFSTR("kMRMediaRemoteOriginNowPlayingApplicationPlaybackStateDidChangeNotification");
    v42[10] = CFSTR("_kMRMediaRemotePlayerPlaybackStateDidChangeNotification");
    v42[11] = CFSTR("kMRMediaRemoteNowPlayingApplicationDisplayNameDidChangeNotification");
    v42[12] = CFSTR("kMRMediaRemoteOriginNowPlayingApplicationDisplayNameDidChangeNotification");
    v42[13] = CFSTR("kMRMediaRemoteApplicationDisplayNameDidChangeNotification");
    v42[14] = CFSTR("kMRMediaRemoteNowPlayingPlayerDidChange");
    v42[15] = CFSTR("kMRMediaRemoteOriginNowPlayingPlayerDidChange");
    v42[16] = CFSTR("kMRMediaRemoteActivePlayerDidChange");
    v42[17] = CFSTR("kMRMediaRemotePlayerPictureInPictureDidChange");
    v42[18] = CFSTR("kMRMediaRemoteActivePlayerPathsDidChange");
    v42[19] = CFSTR("kMRMediaRemoteAudioFormatContentInfoDidChange");
    v42[20] = CFSTR("kMRMediaRemoteNowPlayingApplicationDidRegister");
    v42[21] = CFSTR("kMRMediaRemoteNowPlayingApplicationDidUnregister");
    v42[22] = CFSTR("kMRMediaRemoteNowPlayingApplicationClientStateDidChange");
    v42[23] = CFSTR("kMRMediaRemoteOriginNowPlayingApplicationClientStateDidChange");
    v42[24] = CFSTR("kMRMediaRemoteApplicationClientStateDidChange");
    v42[25] = CFSTR("kMRMediaRemoteNowPlayingPlayerStateDidChange");
    v42[26] = CFSTR("kMRMediaRemoteOriginNowPlayingPlayerStateDidChange");
    v42[27] = CFSTR("kMRMediaRemotePlayerStateDidChange");
    v42[28] = CFSTR("kMRMediaRemoteNowPlayingPlayerDidRegister");
    v42[29] = CFSTR("kMRMediaRemoteNowPlayingPlayerDidUnregister");
    v42[30] = CFSTR("kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying");
    v42[31] = CFSTR("kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying");
    v42[32] = CFSTR("kMRMediaRemoteNowPlayingExternalTouchBarInvocationNotification");
    v42[33] = CFSTR("com.apple.MediaRemote.nowPlayingApplicationIsPlayingDidChange");
    v42[34] = CFSTR("com.apple.MediaRemote.nowPlayingActivePlayersIsPlayingDidChange");
    v42[35] = CFSTR("kMRNowPlayingPlaybackQueueChangedNotification");
    v42[36] = CFSTR("kMROriginNowPlayingPlaybackQueueChangedNotification");
    v42[37] = CFSTR("kMRPlayerPlaybackQueueChangedNotification");
    v42[38] = CFSTR("kMRPlaybackQueueContentItemsChangedNotification");
    v42[39] = CFSTR("kMROriginPlaybackQueueContentItemsChangedNotification");
    v42[40] = CFSTR("kMRPlayerPlaybackQueueContentItemsChangedNotification");
    v42[41] = CFSTR("kMRPlaybackQueueContentItemArtworkChangedNotification");
    v42[42] = CFSTR("kMROriginPlaybackQueueContentItemArtworkChangedNotification");
    v42[43] = CFSTR("kMRPlayerPlaybackQueueContentItemArtworkChangedNotification");
    v42[44] = CFSTR("kMRMediaRemoteApplicationDidForeground");
    v42[45] = CFSTR("kMRMediaRemoteOriginNowPlayingApplicationDidForegroundNotification");
    v42[46] = CFSTR("kMRMediaRemoteNowPlayingApplicationDidForegroundNotification");
    v42[47] = CFSTR("kMRMediaRemoteElectedPlayerDidChangeNotification");
    v42[48] = CFSTR("kMRMediaRemoteLockScreenControlsPlayerPathDidChangeNotification");
    v42[49] = CFSTR("kMRMediaRemoteLockScreenControlsDidActivateNotification");
    v42[50] = CFSTR("kMRMediaRemoteLockScreenControlsDidDeactivateNotification");
    v42[51] = CFSTR("kMRMediaRemoteLockScreenControlsDidAppearNotification");
    v42[52] = CFSTR("kMRMediaRemoteLockScreenControlsDidDisappearNotification");
    v42[53] = CFSTR("kMRMediaRemoteNowPlayingPlayerDidRegisterCanBeNowPlaying");
    v42[54] = CFSTR("kMRMediaRemoteNowPlayingPlayerDidUnregisterCanBeNowPlaying");
    v42[55] = CFSTR("MRNowPlayingPlaybackQueueNowPlayingItemChangedNotification");
    v42[56] = CFSTR("MROriginNowPlayingPlaybackQueueNowPlayingItemChangedNotification");
    v42[57] = CFSTR("MRPlayerPlaybackQueueNowPlayingItemChangedNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 58);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v9);
    nowPlayingNotifications = v2->_nowPlayingNotifications;
    v2->_nowPlayingNotifications = (NSOrderedSet *)v10;

    v41[0] = CFSTR("kMRMediaRemoteWillPresentRouteAuthenticationPromptNotification");
    v41[1] = CFSTR("kMRMediaRemotePickableRoutesDidChangeNotification");
    v41[2] = CFSTR("kMRMediaRemotePairingHandlerNotification");
    v41[3] = CFSTR("_MRMediaRemoteDeviceAvailableForMediaSuggestionsNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v12);
    routesChangedNotifications = v2->_routesChangedNotifications;
    v2->_routesChangedNotifications = (NSOrderedSet *)v13;

    v40 = CFSTR("kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v15);
    volumeControlNotifications = v2->_volumeControlNotifications;
    v2->_volumeControlNotifications = (NSOrderedSet *)v16;

    v39 = CFSTR("kMRMediaRemoteExternalScreenTypeDidChangeNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v18);
    externalScreenNotifications = v2->_externalScreenNotifications;
    v2->_externalScreenNotifications = (NSOrderedSet *)v19;

    v38[0] = CFSTR("kMRMediaRemoteActiveOriginDidChangeNotification");
    v38[1] = CFSTR("kMRMediaRemoteAvailableOriginsDidChangeNotification");
    v38[2] = CFSTR("kMRMediaRemoteOriginDidRegisterNotification");
    v38[3] = CFSTR("kMRMediaRemoteOriginDidUnregisterNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v21);
    originNotifications = v2->_originNotifications;
    v2->_originNotifications = (NSOrderedSet *)v22;

    v37[0] = CFSTR("kMRMediaRemoteSupportedCommandsDidChangeNotification");
    v37[1] = CFSTR("kMRMediaRemoteOriginSupportedCommandsDidChangeNotification");
    v37[2] = CFSTR("kMRMediaRemotePlayerSupportedCommandsDidChangeNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v24);
    supportedCommandsNotifications = v2->_supportedCommandsNotifications;
    v2->_supportedCommandsNotifications = (NSOrderedSet *)v25;

    v36 = CFSTR("kMRVirtualVoiceInputRecordingStateDidChangeNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v27);
    voiceInputNotifications = v2->_voiceInputNotifications;
    v2->_voiceInputNotifications = (NSOrderedSet *)v28;

    v35 = CFSTR("kMRMediaRemoteApplicationDidReportPlaybackErrorNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v30);
    errorNotifications = v2->_errorNotifications;
    v2->_errorNotifications = (NSOrderedSet *)v31;

  }
  return v2;
}

void __41__MRNotificationClient_notificationQueue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  if (!v2)
    v2 = *(void **)(v1 + 32);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (OS_dispatch_queue)notificationQueue
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__MRNotificationClient_notificationQueue__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (OS_dispatch_queue *)v3;
}

- (BOOL)postNotification:(id)a3 userInfo:(id)a4 object:(id)a5
{
  return a3
      && -[MRNotificationClient _postNotification:userInfo:object:withHandler:](self, "_postNotification:userInfo:object:withHandler:", a3, a4, a5, &__block_literal_global_54_0);
}

- (BOOL)_postNotification:(id)a3 userInfo:(id)a4 object:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, id, id);
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *serialQueue;
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v23;
  id v24;
  MRNotificationClient *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[4];
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, id, id))a6;
  kdebug_trace();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v15 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke;
  v31[3] = &unk_1E30CA498;
  v16 = v14;
  v32 = v16;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v31);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  serialQueue = self->_serialQueue;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2;
  block[3] = &unk_1E30CB2C8;
  v18 = v10;
  v23 = v18;
  v19 = v16;
  v24 = v19;
  v25 = self;
  v26 = &v27;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v28 + 24))
  {
    v13[2](v13, v18, v19, v12);
    v20 = *((_BYTE *)v28 + 24) != 0;
  }
  else
  {
    v20 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v20;
}

void __57__MRNotificationClient_postNotification_userInfo_object___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = a2;
  v7 = a4;
  v8 = a3;
  _MRLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __57__MRNotificationClient_postNotification_userInfo_object___block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", v6, v7, v8);

}

uint64_t __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  _MRLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2_cold_2((uint64_t)a1, v2, v3, v4, v5, v6, v7, v8);

  _MRLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2_cold_1((uint64_t)a1, v9, v10, v11, v12, v13, v14, v15);

  result = MRProcessIsMediaRemoteDaemon();
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1[6] + 40), "containsObject:", a1[4]);
    v17 = a1[6];
    if ((_DWORD)result)
    {
      v18 = *(_QWORD *)(v17 + 8) != 0;
LABEL_20:
      v25 = a1[7];
LABEL_21:
      *(_BYTE *)(*(_QWORD *)(v25 + 8) + 24) = v18;
      return result;
    }
    result = objc_msgSend(*(id *)(v17 + 48), "containsObject:", a1[4]);
    v19 = a1[6];
    if ((_DWORD)result)
    {
      v18 = *(_BYTE *)(v19 + 114);
      goto LABEL_20;
    }
    result = objc_msgSend(*(id *)(v19 + 56), "containsObject:", a1[4]);
    v20 = a1[6];
    if ((_DWORD)result)
    {
      v18 = *(_BYTE *)(v20 + 115);
      goto LABEL_20;
    }
    result = objc_msgSend(*(id *)(v20 + 64), "containsObject:", a1[4]);
    v21 = a1[6];
    if ((_DWORD)result)
    {
      v18 = *(_BYTE *)(v21 + 112);
      goto LABEL_20;
    }
    result = objc_msgSend(*(id *)(v21 + 72), "containsObject:", a1[4]);
    v22 = a1[6];
    if ((_DWORD)result)
    {
      v18 = *(_BYTE *)(v22 + 116);
      goto LABEL_20;
    }
    result = objc_msgSend(*(id *)(v22 + 80), "containsObject:", a1[4]);
    v23 = a1[6];
    if ((_DWORD)result)
    {
      v18 = *(_BYTE *)(v23 + 113);
      goto LABEL_20;
    }
    result = objc_msgSend(*(id *)(v23 + 96), "containsObject:", a1[4]);
    v24 = a1[6];
    if ((_DWORD)result)
    {
      v18 = *(_BYTE *)(v24 + 117);
      goto LABEL_20;
    }
    result = objc_msgSend(*(id *)(v24 + 88), "containsObject:", a1[4]);
    if ((_DWORD)result)
    {
      v25 = a1[7];
      v18 = *(_BYTE *)(a1[6] + 118);
      goto LABEL_21;
    }
  }
  return result;
}

uint64_t __61__MRNotificationClient_dispatchNotification_userInfo_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotification:userInfo:object:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)setReceivesExternalScreenTypeChangedNotifications:(BOOL)a3
{
  self->_receivesExternalScreenTypeChangedNotifications = a3;
}

- (void)setReceivesSupportedCommandsNotifications:(BOOL)a3
{
  self->_receivesSupportedCommandsNotifications = a3;
}

- (void)registerForNowPlayingNotificationsWithQueue:(id)a3 force:(BOOL)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MRNotificationClient_registerForNowPlayingNotificationsWithQueue_force___block_invoke;
  block[3] = &unk_1E30C7890;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(serialQueue, block);

}

- (void)dispatchNotification:(id)a3 userInfo:(id)a4 object:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *notificationQueue;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  notificationQueue = self->_notificationQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__MRNotificationClient_dispatchNotification_userInfo_object___block_invoke;
  v16[3] = &unk_1E30C9008;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  MRCreateDonatedQosBlock(v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(notificationQueue, v15);

}

- (void)setReceivesVolumeControlNotifications:(BOOL)a3
{
  self->_receivesVolumeControlNotifications = a3;
}

void __74__MRNotificationClient_registerForNowPlayingNotificationsWithQueue_force___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  dispatch_queue_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48) || !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = *(NSObject **)(a1 + 40);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v2)
      v4 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRNotificationClient/nowPlayingNotifications", v3, v2);
    else
      v4 = dispatch_queue_create("com.apple.MediaRemote.MRNotificationClient/nowPlayingNotifications", v3);
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v4);

  }
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  _MRLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = 134217984;
    v9 = v7;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "%lu clients have now registered for Now Playing Notifications", (uint8_t *)&v8, 0xCu);
  }

}

- (void)registerForNowPlayingNotificationsWithQueue:(id)a3
{
  -[MRNotificationClient registerForNowPlayingNotificationsWithQueue:force:](self, "registerForNowPlayingNotificationsWithQueue:force:", a3, 0);
}

- (id)debugDescription
{
  void *v3;
  NSObject *serialQueue;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;
  MRNotificationClient *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@:%p { \n"), objc_opt_class(), self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MRNotificationClient_debugDescription__block_invoke;
  block[3] = &unk_1E30C5F40;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(serialQueue, block);
  v6 = v5;

  return v6;
}

uint64_t __40__MRNotificationClient_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("    nowPlayingObservers = %lu\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 113))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("    supportedCommandNotifications = %@\n"), CFSTR("YES"));
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (*(_BYTE *)(v2 + 115))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("    volumeControlNotifications = %@\n"), CFSTR("YES"));
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (*(_BYTE *)(v2 + 116))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("    originNotifications = %@\n"), CFSTR("YES"));
    v2 = *(_QWORD *)(a1 + 40);
  }
  v3 = *(NSObject **)(v2 + 16);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("    customNotificationQueue = %s\n"), dispatch_queue_get_label(v3));
    v2 = *(_QWORD *)(a1 + 40);
  }
  v4 = *(void **)(v2 + 104);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    MRCreateIndentedDebugDescriptionFromArray(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("    subscribedWakingPlayerPaths = %@\n"), v6);

  }
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("}\n"));
}

- (void)unregisterForNowPlayingNotifications
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MRNotificationClient_unregisterForNowPlayingNotifications__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __60__MRNotificationClient_unregisterForNowPlayingNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  v4 = v3 != 0;
  v5 = v3 - 1;
  if (!v4)
    v5 = 0;
  *(_QWORD *)(v2 + 8) = v5;
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v6 + 8))
  {
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = 0;

  }
  _MRLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "%lu clients have now registered for Now Playing Notifications", (uint8_t *)&v10, 0xCu);
  }

}

- (BOOL)isRegisteredForNowPlayingNotifications
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__MRNotificationClient_isRegisteredForNowPlayingNotifications__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__MRNotificationClient_isRegisteredForNowPlayingNotifications__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
    result = 1;
  else
    result = objc_msgSend(v2, "_processAlwaysNeedsNowPlayingNotifications");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_processAlwaysNeedsNowPlayingNotifications
{
  if (_processAlwaysNeedsNowPlayingNotifications_onceToken != -1)
    dispatch_once(&_processAlwaysNeedsNowPlayingNotifications_onceToken, &__block_literal_global_59);
  return _processAlwaysNeedsNowPlayingNotifications_allowed;
}

void __66__MRNotificationClient__processAlwaysNeedsNowPlayingNotifications__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E3143BD8);
  _processAlwaysNeedsNowPlayingNotifications_allowed = objc_msgSend(v1, "containsObject:", v2);

}

- (void)registerForWakingNowPlayingNotificationsForPlayerPath:(id)a3 replyQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *serialQueue;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  __CFString *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("registerForWakingNowPlayingNotificationsForPlayerPath"), v12);
  v15 = v14;
  if (v8)
    objc_msgSend(v14, "appendFormat:", CFSTR(" for %@"), v8);
  _MRLogForCategory(0xAuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v15;
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke;
  v32[3] = &unk_1E30CB258;
  v18 = v8;
  v33 = v18;
  v34 = CFSTR("registerForWakingNowPlayingNotificationsForPlayerPath");
  v35 = v12;
  v36 = v13;
  v38 = v10;
  v19 = v9;
  v37 = v19;
  v20 = v10;
  v21 = v13;
  v22 = v12;
  v23 = (void *)MEMORY[0x194036C44](v32);
  serialQueue = self->_serialQueue;
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_2;
  block[3] = &unk_1E30CB280;
  block[4] = self;
  v29 = v18;
  v30 = v19;
  v31 = v23;
  v25 = v23;
  v26 = v19;
  v27 = v18;
  dispatch_sync(serialQueue, block);

}

void __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[4];
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_14;
      v15 = a1[5];
      v14 = a1[6];
      v16 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138544130;
      v28 = v15;
      v29 = 2114;
      v30 = v14;
      v31 = 2114;
      v32 = v16;
      v33 = 2048;
      v34 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v6;
      v20 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_14;
      v21 = a1[5];
      v22 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138543874;
      v28 = v21;
      v29 = 2114;
      v30 = v22;
      v31 = 2048;
      v32 = v23;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v6;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v9 = a1[5];
    v8 = a1[6];
    v10 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
    *(_DWORD *)buf = 138544386;
    v28 = v9;
    v29 = 2114;
    v30 = v8;
    v31 = 2114;
    v32 = v3;
    v33 = 2114;
    v34 = v10;
    v35 = 2048;
    v36 = v12;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_11_cold_1();
LABEL_14:

  v24 = (void *)a1[9];
  if (v24)
  {
    v26 = v24;
    v25 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  char v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  }
  v6 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", *(_QWORD *)(a1 + 40));
  if ((v6 & 1) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_syncWakingPlayerPathsWithReplyQueue:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)unregisterForWakingNowPlayingNotificationsForPlayerPath:(id)a3 replyQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *serialQueue;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  __CFString *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("unregisterForWakingNowPlayingNotificationsForPlayerPath"), v12);
  v15 = v14;
  if (v8)
    objc_msgSend(v14, "appendFormat:", CFSTR(" for %@"), v8);
  _MRLogForCategory(0xAuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v15;
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke;
  v32[3] = &unk_1E30CB258;
  v18 = v8;
  v33 = v18;
  v34 = CFSTR("unregisterForWakingNowPlayingNotificationsForPlayerPath");
  v35 = v12;
  v36 = v13;
  v38 = v10;
  v19 = v9;
  v37 = v19;
  v20 = v10;
  v21 = v13;
  v22 = v12;
  v23 = (void *)MEMORY[0x194036C44](v32);
  serialQueue = self->_serialQueue;
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_2;
  block[3] = &unk_1E30CB280;
  block[4] = self;
  v29 = v18;
  v30 = v19;
  v31 = v23;
  v25 = v23;
  v26 = v19;
  v27 = v18;
  dispatch_sync(serialQueue, block);

}

void __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[4];
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_14;
      v15 = a1[5];
      v14 = a1[6];
      v16 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138544130;
      v28 = v15;
      v29 = 2114;
      v30 = v14;
      v31 = 2114;
      v32 = v16;
      v33 = 2048;
      v34 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v6;
      v20 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_14;
      v21 = a1[5];
      v22 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138543874;
      v28 = v21;
      v29 = 2114;
      v30 = v22;
      v31 = 2048;
      v32 = v23;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v6;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v9 = a1[5];
    v8 = a1[6];
    v10 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
    *(_DWORD *)buf = 138544386;
    v28 = v9;
    v29 = 2114;
    v30 = v8;
    v31 = 2114;
    v32 = v3;
    v33 = 2114;
    v34 = v10;
    v35 = 2048;
    v36 = v12;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_11_cold_1();
LABEL_14:

  v24 = (void *)a1[9];
  if (v24)
  {
    v26 = v24;
    v25 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "indexOfObject:", *(_QWORD *)(a1 + 40));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 2, CFSTR("Client was not previously registered for waking now playing notifications for specificed playerPath"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObjectAtIndex:", v2);
    objc_msgSend(*(id *)(a1 + 32), "_syncWakingPlayerPathsWithReplyQueue:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

- (void)_syncWakingPlayerPathsWithReplyQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteServiceSetWakingPlayerPaths(v8, self->_subscribedWakingPlayerPaths, v7, v6);

}

- (void)restoreNowPlayingClientState
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MRNotificationClient_restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __52__MRNotificationClient_restoreNowPlayingClientState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "_syncWakingPlayerPathsWithReplyQueue:completion:", 0, 0);
  return result;
}

+ (id)nowPlayingNotifications
{
  if (nowPlayingNotifications___once != -1)
    dispatch_once(&nowPlayingNotifications___once, &__block_literal_global_59_1);
  return (id)nowPlayingNotifications_nowPlayingNotifications;
}

void __47__MRNotificationClient_nowPlayingNotifications__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MRNotificationClient *v8;

  v8 = objc_alloc_init(MRNotificationClient);
  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)nowPlayingNotifications_nowPlayingNotifications;
  nowPlayingNotifications_nowPlayingNotifications = (uint64_t)v0;

  v2 = (void *)nowPlayingNotifications_nowPlayingNotifications;
  -[NSOrderedSet array](v8->_nowPlayingNotifications, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = (void *)nowPlayingNotifications_nowPlayingNotifications;
  -[NSOrderedSet array](v8->_supportedCommandsNotifications, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = (void *)nowPlayingNotifications_nowPlayingNotifications;
  -[NSOrderedSet array](v8->_originNotifications, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

}

- (BOOL)receivesExternalScreenTypeChangedNotifications
{
  return self->_receivesExternalScreenTypeChangedNotifications;
}

- (BOOL)receivesSupportedCommandsNotifications
{
  return self->_receivesSupportedCommandsNotifications;
}

- (BOOL)receivesRoutesChangedNotifications
{
  return self->_receivesRoutesChangedNotifications;
}

- (void)setReceivesRoutesChangedNotifications:(BOOL)a3
{
  self->_receivesRoutesChangedNotifications = a3;
}

- (BOOL)receivesVolumeControlNotifications
{
  return self->_receivesVolumeControlNotifications;
}

- (BOOL)receivesOriginChangedNotifications
{
  return self->_receivesOriginChangedNotifications;
}

- (void)setReceivesOriginChangedNotifications:(BOOL)a3
{
  self->_receivesOriginChangedNotifications = a3;
}

- (BOOL)receivesPlaybackErrorNotifications
{
  return self->_receivesPlaybackErrorNotifications;
}

- (void)setReceivesPlaybackErrorNotifications:(BOOL)a3
{
  self->_receivesPlaybackErrorNotifications = a3;
}

- (BOOL)receivesVoiceInputRecordingStateNotifications
{
  return self->_receivesVoiceInputRecordingStateNotifications;
}

- (void)setReceivesVoiceInputRecordingStateNotifications:(BOOL)a3
{
  self->_receivesVoiceInputRecordingStateNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedWakingPlayerPaths, 0);
  objc_storeStrong((id *)&self->_errorNotifications, 0);
  objc_storeStrong((id *)&self->_voiceInputNotifications, 0);
  objc_storeStrong((id *)&self->_supportedCommandsNotifications, 0);
  objc_storeStrong((id *)&self->_originNotifications, 0);
  objc_storeStrong((id *)&self->_externalScreenNotifications, 0);
  objc_storeStrong((id *)&self->_volumeControlNotifications, 0);
  objc_storeStrong((id *)&self->_routesChangedNotifications, 0);
  objc_storeStrong((id *)&self->_nowPlayingNotifications, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_customNotificationsQueue, 0);
}

void __57__MRNotificationClient_postNotification_userInfo_object___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_193827000, a2, a3, "Posting Notification %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_193827000, a2, a3, "UserInfo %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_193827000, a2, a3, "Receieved Notification %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

@end
