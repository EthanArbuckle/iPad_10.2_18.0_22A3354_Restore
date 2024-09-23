@implementation MRAVVirtualOutputDevice

- (MRAVVirtualOutputDevice)initWithJSONData:(id)a3 pipeEndpoint:(id)a4
{
  id v7;
  id v8;
  MRAVVirtualOutputDevice *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *accessSerialQueue;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  NSString *uid;
  uint64_t v18;
  NSString *modelID;
  uint64_t v20;
  NSString *firmwareVersion;
  uint64_t v22;
  NSString *logicalDeviceID;
  uint64_t v24;
  NSString *groupID;
  id v26;
  uint64_t v27;
  NSData *MACAddress;
  uint64_t v29;
  NSString *playingPairedDeviceName;
  uint64_t v31;
  NSString *name;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSString *parentGroupIdentifier;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  float v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  float v63;
  uint64_t v64;
  NSString *bluetoothID;
  void *v66;
  char v68[6];
  id v69;
  objc_super v70;

  v7 = a3;
  v8 = a4;
  v70.receiver = self;
  v70.super_class = (Class)MRAVVirtualOutputDevice;
  v9 = -[MRAVVirtualOutputDevice init](&v70, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.mediaremote.MRAVOutputDevice", v10);
    accessSerialQueue = v9->_accessSerialQueue;
    v9->_accessSerialQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_jsonDeviceDefinition, a3);
    v69 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v69);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v69;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v13;
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("uid"));
      v16 = objc_claimAutoreleasedReturnValue();
      uid = v9->_uid;
      v9->_uid = (NSString *)v16;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("modelID"));
      v18 = objc_claimAutoreleasedReturnValue();
      modelID = v9->_modelID;
      v9->_modelID = (NSString *)v18;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("firmwareVersion"));
      v20 = objc_claimAutoreleasedReturnValue();
      firmwareVersion = v9->_firmwareVersion;
      v9->_firmwareVersion = (NSString *)v20;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("logicalDeviceID"));
      v22 = objc_claimAutoreleasedReturnValue();
      logicalDeviceID = v9->_logicalDeviceID;
      v9->_logicalDeviceID = (NSString *)v22;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("groupID"));
      v24 = objc_claimAutoreleasedReturnValue();
      groupID = v9->_groupID;
      v9->_groupID = (NSString *)v24;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MACAddress"));
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v26, "UTF8String");
      TextToHardwareAddress();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v68, 6);
      v27 = objc_claimAutoreleasedReturnValue();
      MACAddress = v9->_MACAddress;
      v9->_MACAddress = (NSData *)v27;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("playingPairedDeviceName"));
      v29 = objc_claimAutoreleasedReturnValue();
      playingPairedDeviceName = v9->_playingPairedDeviceName;
      v9->_playingPairedDeviceName = (NSString *)v29;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("name"));
      v31 = objc_claimAutoreleasedReturnValue();
      name = v9->_name;
      v9->_name = (NSString *)v31;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("canAccessRemoteAssets"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_canAccessRemoteAssets = objc_msgSend(v33, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("canAccessAppleMusic"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_canAccessAppleMusic = objc_msgSend(v34, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("canAccessiCloudMusicLibrary"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_canAccessiCloudMusicLibrary = objc_msgSend(v35, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("canPlayEncryptedProgressiveDownloadAssets"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_canPlayEncryptedProgressiveDownloadAssets = objc_msgSend(v36, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("canFetchMediaDataFromSender"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_canFetchMediaDataFromSender = objc_msgSend(v37, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets = objc_msgSend(v38, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isRemoteControllable"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_isRemoteControllable = objc_msgSend(v39, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("canRelayCommunicationChannel"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_canRelayCommunicationChannel = objc_msgSend(v40, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("supportsBufferedAirPlay"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_supportsBufferedAirPlay = objc_msgSend(v41, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("supportsRapport"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_supportsRapport = objc_msgSend(v42, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isAddedToHomeKit"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_isAddedToHomeKit = objc_msgSend(v43, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isGroupLeader"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_isGroupLeader = objc_msgSend(v44, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("groupContainsGroupLeader"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_groupContainsGroupLeader = objc_msgSend(v45, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("airPlayReceiver"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_airPlayReceiver = objc_msgSend(v46, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentGroupIdentifier"));
      v47 = objc_claimAutoreleasedReturnValue();
      parentGroupIdentifier = v9->_parentGroupIdentifier;
      v9->_parentGroupIdentifier = (NSString *)v47;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isGroupable"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_isGroupable = objc_msgSend(v49, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("supportsBluetoothSharing"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_supportsBluetoothSharing = objc_msgSend(v50, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isProxyGroupPlayer"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_isProxyGroupPlayer = objc_msgSend(v51, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isPickedOnPairedDevice"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_isPickedOnPairedDevice = objc_msgSend(v52, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("batteryLevel"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "floatValue");
      v9->_batteryLevel = v54;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hasBatteryLevel"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_hasBatteryLevel = objc_msgSend(v55, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isLocalDevice"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_isLocalDevice = objc_msgSend(v56, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("supportsExternalScreen"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_supportsExternalScreen = objc_msgSend(v57, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("deviceType"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_deviceType = objc_msgSend(v58, "intValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("deviceSubType"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_deviceSubType = objc_msgSend(v59, "intValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("requiresAuthorization"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_requiresAuthorization = objc_msgSend(v60, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isVolumeControlAvailable"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_isVolumeControlAvailable = objc_msgSend(v61, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("volume"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "floatValue");
      v9->_volume = v63;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("bluetoothID"));
      v64 = objc_claimAutoreleasedReturnValue();
      bluetoothID = v9->_bluetoothID;
      v9->_bluetoothID = (NSString *)v64;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("JSONProtocol"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v9->_isUsingJSONProtocol = objc_msgSend(v66, "BOOLValue");
    }
    objc_storeStrong((id *)&v9->_pipeEndpoint, a4);

  }
  return v9;
}

- (id)sourceInfo
{
  return 0;
}

- (id)uid
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__MRAVVirtualOutputDevice_uid__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__MRAVVirtualOutputDevice_uid__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 312));
}

- (id)name
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MRAVVirtualOutputDevice_name__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__MRAVVirtualOutputDevice_name__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 376));
}

- (id)logicalDeviceID
{
  void *v3;
  char v4;
  NSObject *accessSerialQueue;
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useClusterDevices");

  if ((v4 & 1) != 0)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__30;
  v13 = __Block_byref_object_dispose__30;
  v14 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__MRAVVirtualOutputDevice_logicalDeviceID__block_invoke;
  v8[3] = &unk_1E30C5D20;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(accessSerialQueue, v8);
  v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

void __42__MRAVVirtualOutputDevice_logicalDeviceID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 336));
}

- (id)modelID
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__MRAVVirtualOutputDevice_modelID__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__MRAVVirtualOutputDevice_modelID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 320));
}

- (id)firmwareVersion
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__MRAVVirtualOutputDevice_firmwareVersion__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__MRAVVirtualOutputDevice_firmwareVersion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 328));
}

- (id)groupID
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__MRAVVirtualOutputDevice_groupID__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__MRAVVirtualOutputDevice_groupID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 344));
}

- (id)MACAddress
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__MRAVVirtualOutputDevice_MACAddress__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__MRAVVirtualOutputDevice_MACAddress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 352));
}

- (id)modelSpecificInfo
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MRAVVirtualOutputDevice_modelSpecificInfo__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__MRAVVirtualOutputDevice_modelSpecificInfo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 360));
}

- (id)playingPairedDeviceName
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__MRAVVirtualOutputDevice_playingPairedDeviceName__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__MRAVVirtualOutputDevice_playingPairedDeviceName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 368));
}

- (BOOL)canAccessRemoteAssets
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MRAVVirtualOutputDevice_canAccessRemoteAssets__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__MRAVVirtualOutputDevice_canAccessRemoteAssets__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 384);
  return result;
}

- (BOOL)canAccessAppleMusic
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__MRAVVirtualOutputDevice_canAccessAppleMusic__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__MRAVVirtualOutputDevice_canAccessAppleMusic__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 385);
  return result;
}

- (BOOL)canAccessiCloudMusicLibrary
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MRAVVirtualOutputDevice_canAccessiCloudMusicLibrary__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__MRAVVirtualOutputDevice_canAccessiCloudMusicLibrary__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 386);
  return result;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__MRAVVirtualOutputDevice_canPlayEncryptedProgressiveDownloadAssets__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__MRAVVirtualOutputDevice_canPlayEncryptedProgressiveDownloadAssets__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 387);
  return result;
}

- (BOOL)canFetchMediaDataFromSender
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MRAVVirtualOutputDevice_canFetchMediaDataFromSender__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__MRAVVirtualOutputDevice_canFetchMediaDataFromSender__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 388);
  return result;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__MRAVVirtualOutputDevice_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __90__MRAVVirtualOutputDevice_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 389);
  return result;
}

- (BOOL)isRemoteControllable
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MRAVVirtualOutputDevice_isRemoteControllable__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__MRAVVirtualOutputDevice_isRemoteControllable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 390);
  return result;
}

- (BOOL)canRelayCommunicationChannel
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__MRAVVirtualOutputDevice_canRelayCommunicationChannel__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__MRAVVirtualOutputDevice_canRelayCommunicationChannel__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 391);
  return result;
}

- (BOOL)supportsBufferedAirPlay
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__MRAVVirtualOutputDevice_supportsBufferedAirPlay__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__MRAVVirtualOutputDevice_supportsBufferedAirPlay__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 392);
  return result;
}

- (BOOL)supportsRapport
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__MRAVVirtualOutputDevice_supportsRapport__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__MRAVVirtualOutputDevice_supportsRapport__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 393);
  return result;
}

- (BOOL)isAddedToHomeKit
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__MRAVVirtualOutputDevice_isAddedToHomeKit__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__MRAVVirtualOutputDevice_isAddedToHomeKit__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 394);
  return result;
}

- (BOOL)isGroupLeader
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__MRAVVirtualOutputDevice_isGroupLeader__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MRAVVirtualOutputDevice_isGroupLeader__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 395);
  return result;
}

- (BOOL)groupContainsGroupLeader
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MRAVVirtualOutputDevice_groupContainsGroupLeader__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__MRAVVirtualOutputDevice_groupContainsGroupLeader__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 396);
  return result;
}

- (BOOL)isAirPlayReceiverSessionActive
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__MRAVVirtualOutputDevice_isAirPlayReceiverSessionActive__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__MRAVVirtualOutputDevice_isAirPlayReceiverSessionActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 397);
  return result;
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  NSObject *accessSerialQueue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  accessSerialQueue = self->_accessSerialQueue;
  v9 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRAVVirtualOutputDevice_parentGroupContainsDiscoverableLeader__block_invoke;
  block[3] = &unk_1E30CC300;
  block[4] = &v6;
  dispatch_sync(accessSerialQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)parentGroupIdentifier
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MRAVVirtualOutputDevice_parentGroupIdentifier__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__MRAVVirtualOutputDevice_parentGroupIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 400));
}

- (BOOL)isGroupable
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MRAVVirtualOutputDevice_isGroupable__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__MRAVVirtualOutputDevice_isGroupable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 408);
  return result;
}

- (BOOL)supportsBluetoothSharing
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MRAVVirtualOutputDevice_supportsBluetoothSharing__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__MRAVVirtualOutputDevice_supportsBluetoothSharing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 409);
  return result;
}

- (BOOL)isProxyGroupPlayer
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MRAVVirtualOutputDevice_isProxyGroupPlayer__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__MRAVVirtualOutputDevice_isProxyGroupPlayer__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 410);
  return result;
}

- (BOOL)isDeviceGroupable
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MRAVVirtualOutputDevice_isDeviceGroupable__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__MRAVVirtualOutputDevice_isDeviceGroupable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 408);
  return result;
}

- (BOOL)isPickedOnPairedDevice
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__MRAVVirtualOutputDevice_isPickedOnPairedDevice__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__MRAVVirtualOutputDevice_isPickedOnPairedDevice__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 411);
  return result;
}

- (id)currentBluetoothListeningMode
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVVirtualOutputDevice_currentBluetoothListeningMode__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__MRAVVirtualOutputDevice_currentBluetoothListeningMode__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 456));
}

- (id)availableBluetoothListeningModes
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__MRAVVirtualOutputDevice_availableBluetoothListeningModes__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__MRAVVirtualOutputDevice_availableBluetoothListeningModes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unsigned)deviceType
{
  NSObject *accessSerialQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__MRAVVirtualOutputDevice_deviceType__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__MRAVVirtualOutputDevice_deviceType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 420);
  return result;
}

- (unsigned)deviceSubtype
{
  NSObject *accessSerialQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__MRAVVirtualOutputDevice_deviceSubtype__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MRAVVirtualOutputDevice_deviceSubtype__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 424);
  return result;
}

- (float)batteryLevel
{
  NSObject *accessSerialQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MRAVVirtualOutputDevice_batteryLevel__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __39__MRAVVirtualOutputDevice_batteryLevel__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 412);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)hasBatteryLevel
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__MRAVVirtualOutputDevice_hasBatteryLevel__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__MRAVVirtualOutputDevice_hasBatteryLevel__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 416);
  return result;
}

- (BOOL)isLocalDevice
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__MRAVVirtualOutputDevice_isLocalDevice__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MRAVVirtualOutputDevice_isLocalDevice__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 417);
  return result;
}

- (BOOL)supportsExternalScreen
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__MRAVVirtualOutputDevice_supportsExternalScreen__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__MRAVVirtualOutputDevice_supportsExternalScreen__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 418);
  return result;
}

- (BOOL)requiresAuthorization
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MRAVVirtualOutputDevice_requiresAuthorization__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__MRAVVirtualOutputDevice_requiresAuthorization__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 428);
  return result;
}

- (BOOL)isVolumeControlAvailable
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MRAVVirtualOutputDevice_isVolumeControlAvailable__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__MRAVVirtualOutputDevice_isVolumeControlAvailable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 429);
  return result;
}

- (float)volume
{
  NSObject *accessSerialQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__MRAVVirtualOutputDevice_volume__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __33__MRAVVirtualOutputDevice_volume__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 432);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)bluetoothID
{
  NSObject *accessSerialQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MRAVVirtualOutputDevice_bluetoothID__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__MRAVVirtualOutputDevice_bluetoothID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 440));
}

- (BOOL)isUsingJSONProtocol
{
  NSObject *accessSerialQueue;
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
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__MRAVVirtualOutputDevice_isUsingJSONProtocol__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__MRAVVirtualOutputDevice_isUsingJSONProtocol__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 448);
  return result;
}

- (NSXPCListenerEndpoint)pipeEndpoint
{
  return self->_pipeEndpoint;
}

- (NSData)jsonDeviceDefinition
{
  return self->_jsonDeviceDefinition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDeviceDefinition, 0);
  objc_storeStrong((id *)&self->_pipeEndpoint, 0);
  objc_storeStrong((id *)&self->_availableBluetoothListeningModes, 0);
  objc_storeStrong((id *)&self->_currentBluetoothListeningMode, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);
  objc_storeStrong((id *)&self->_parentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_playingPairedDeviceName, 0);
  objc_storeStrong((id *)&self->_modelSpecificInfo, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_logicalDeviceID, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end
