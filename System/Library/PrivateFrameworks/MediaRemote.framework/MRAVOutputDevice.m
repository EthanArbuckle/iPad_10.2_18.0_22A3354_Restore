@implementation MRAVOutputDevice

- (_MRAVOutputDeviceDescriptorProtobuf)descriptor
{
  _MRAVOutputDeviceDescriptorProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _MRAVOutputDeviceSourceInfoProtobuf *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
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
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
  -[MRAVOutputDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setName:](v3, "setName:", v4);

  -[MRAVOutputDevice uid](self, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](v3, "setUniqueIdentifier:", v5);

  -[MRAVOutputDevice tightSyncID](self, "tightSyncID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setLogicalDeviceID:](v3, "setLogicalDeviceID:", v6);

  -[MRAVOutputDevice groupID](self, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setGroupID:](v3, "setGroupID:", v7);

  -[MRAVOutputDevice modelID](self, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setModelID:](v3, "setModelID:", v8);

  -[MRAVOutputDevice MACAddress](self, "MACAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setMacAddress:](v3, "setMacAddress:", v9);

  -[_MRAVOutputDeviceDescriptorProtobuf setCanAccessRemoteAssets:](v3, "setCanAccessRemoteAssets:", -[MRAVOutputDevice canAccessRemoteAssets](self, "canAccessRemoteAssets"));
  -[_MRAVOutputDeviceDescriptorProtobuf setCanAccessAppleMusic:](v3, "setCanAccessAppleMusic:", -[MRAVOutputDevice canAccessAppleMusic](self, "canAccessAppleMusic"));
  -[_MRAVOutputDeviceDescriptorProtobuf setCanAccessiCloudMusicLibrary:](v3, "setCanAccessiCloudMusicLibrary:", -[MRAVOutputDevice canAccessiCloudMusicLibrary](self, "canAccessiCloudMusicLibrary"));
  -[_MRAVOutputDeviceDescriptorProtobuf setCanPlayEncryptedProgressiveDownloadAssets:](v3, "setCanPlayEncryptedProgressiveDownloadAssets:", -[MRAVOutputDevice canPlayEncryptedProgressiveDownloadAssets](self, "canPlayEncryptedProgressiveDownloadAssets"));
  -[_MRAVOutputDeviceDescriptorProtobuf setCanFetchMediaDataFromSender:](v3, "setCanFetchMediaDataFromSender:", -[MRAVOutputDevice canFetchMediaDataFromSender](self, "canFetchMediaDataFromSender"));
  -[_MRAVOutputDeviceDescriptorProtobuf setPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets:](v3, "setPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets:", -[MRAVOutputDevice presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets](self, "presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets"));
  -[_MRAVOutputDeviceDescriptorProtobuf setIsRemoteControllable:](v3, "setIsRemoteControllable:", -[MRAVOutputDevice isRemoteControllable](self, "isRemoteControllable"));
  -[_MRAVOutputDeviceDescriptorProtobuf setCanRelayCommunicationChannel:](v3, "setCanRelayCommunicationChannel:", -[MRAVOutputDevice canRelayCommunicationChannel](self, "canRelayCommunicationChannel"));
  -[_MRAVOutputDeviceDescriptorProtobuf setSupportsBufferedAirPlay:](v3, "setSupportsBufferedAirPlay:", -[MRAVOutputDevice supportsBufferedAirPlay](self, "supportsBufferedAirPlay"));
  -[_MRAVOutputDeviceDescriptorProtobuf setIsGroupLeader:](v3, "setIsGroupLeader:", -[MRAVOutputDevice isGroupLeader](self, "isGroupLeader"));
  -[_MRAVOutputDeviceDescriptorProtobuf setGroupContainsGroupLeader:](v3, "setGroupContainsGroupLeader:", -[MRAVOutputDevice groupContainsGroupLeader](self, "groupContainsGroupLeader"));
  -[_MRAVOutputDeviceDescriptorProtobuf setIsAirPlayReceiverSessionActive:](v3, "setIsAirPlayReceiverSessionActive:", -[MRAVOutputDevice isAirPlayReceiverSessionActive](self, "isAirPlayReceiverSessionActive"));
  -[_MRAVOutputDeviceDescriptorProtobuf setParentGroupContainsDiscoverableLeader:](v3, "setParentGroupContainsDiscoverableLeader:", -[MRAVOutputDevice parentGroupContainsDiscoverableLeader](self, "parentGroupContainsDiscoverableLeader"));
  -[MRAVOutputDevice parentGroupIdentifier](self, "parentGroupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setParentGroupIdentifier:](v3, "setParentGroupIdentifier:", v10);

  -[_MRAVOutputDeviceDescriptorProtobuf setIsGroupable:](v3, "setIsGroupable:", -[MRAVOutputDevice isGroupable](self, "isGroupable"));
  -[_MRAVOutputDeviceDescriptorProtobuf setIsDeviceGroupable:](v3, "setIsDeviceGroupable:", -[MRAVOutputDevice isDeviceGroupable](self, "isDeviceGroupable"));
  -[_MRAVOutputDeviceDescriptorProtobuf setIsProxyGroupPlayer:](v3, "setIsProxyGroupPlayer:", -[MRAVOutputDevice isProxyGroupPlayer](self, "isProxyGroupPlayer"));
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceType:](v3, "setDeviceType:", -[MRAVOutputDevice deviceType](self, "deviceType"));
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceSubType:](v3, "setDeviceSubType:", -[MRAVOutputDevice deviceSubtype](self, "deviceSubtype"));
  -[_MRAVOutputDeviceDescriptorProtobuf setHostDeviceClass:](v3, "setHostDeviceClass:", _MRDeviceInfoMessageProtobuf_DeviceClassFromModel(-[MRAVOutputDevice hostDeviceClass](self, "hostDeviceClass")));
  -[_MRAVOutputDeviceDescriptorProtobuf setIsAddedToHomeKit:](v3, "setIsAddedToHomeKit:", -[MRAVOutputDevice isAddedToHomeKit](self, "isAddedToHomeKit"));
  -[_MRAVOutputDeviceDescriptorProtobuf setVolumeCapabilities:](v3, "setVolumeCapabilities:", -[MRAVOutputDevice volumeCapabilities](self, "volumeCapabilities"));
  if (-[MRAVOutputDevice isVolumeControlAvailable](self, "isVolumeControlAvailable")
    || (-[MRAVOutputDevice volumeCapabilities](self, "volumeCapabilities") & 2) != 0)
  {
    -[_MRAVOutputDeviceDescriptorProtobuf setIsVolumeControlAvailable:](v3, "setIsVolumeControlAvailable:", 1);
    -[MRAVOutputDevice volume](self, "volume");
    -[_MRAVOutputDeviceDescriptorProtobuf setVolume:](v3, "setVolume:");
  }
  -[_MRAVOutputDeviceDescriptorProtobuf setVolumeMuted:](v3, "setVolumeMuted:", -[MRAVOutputDevice isVolumeMuted](self, "isVolumeMuted"));
  -[MRAVOutputDevice bluetoothID](self, "bluetoothID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setBluetoothID:](v3, "setBluetoothID:", v11);

  -[_MRAVOutputDeviceDescriptorProtobuf setSupportsHAP:](v3, "setSupportsHAP:", -[MRAVOutputDevice supportsHAP](self, "supportsHAP"));
  -[MRAVOutputDevice modelSpecificInfo](self, "modelSpecificInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateDataFromObject(v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v56 = (void *)v13;
  -[_MRAVOutputDeviceDescriptorProtobuf setModelSpecificInfoData:](v3, "setModelSpecificInfoData:", v13);
  if (-[MRAVOutputDevice hasBatteryLevel](self, "hasBatteryLevel"))
  {
    -[MRAVOutputDevice batteryLevel](self, "batteryLevel");
    -[_MRAVOutputDeviceDescriptorProtobuf setBatteryLevel:](v3, "setBatteryLevel:");
  }
  -[_MRAVOutputDeviceDescriptorProtobuf setIsLocalDevice:](v3, "setIsLocalDevice:", -[MRAVOutputDevice isLocalDevice](self, "isLocalDevice"));
  -[_MRAVOutputDeviceDescriptorProtobuf setSupportsExternalScreen:](v3, "setSupportsExternalScreen:", -[MRAVOutputDevice supportsExternalScreen](self, "supportsExternalScreen"));
  -[_MRAVOutputDeviceDescriptorProtobuf setRequiresAuthorization:](v3, "setRequiresAuthorization:", -[MRAVOutputDevice requiresAuthorization](self, "requiresAuthorization"));
  -[_MRAVOutputDeviceDescriptorProtobuf setUsingJSONProtocol:](v3, "setUsingJSONProtocol:", -[MRAVOutputDevice isUsingJSONProtocol](self, "isUsingJSONProtocol"));
  -[MRAVOutputDevice sourceInfo](self, "sourceInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(_MRAVOutputDeviceSourceInfoProtobuf);
  objc_msgSend(v14, "routingContextUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceSourceInfoProtobuf setRoutingContextUID:](v15, "setRoutingContextUID:", v16);

  -[_MRAVOutputDeviceSourceInfoProtobuf setMultipleBuiltInDevices:](v15, "setMultipleBuiltInDevices:", objc_msgSend(v14, "multipleBuiltInDevices"));
  -[_MRAVOutputDeviceDescriptorProtobuf setSourceInfo:](v3, "setSourceInfo:", v15);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[MRAVOutputDevice clusterComposition](self, "clusterComposition");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v70;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v70 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v21), "descriptor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRAVOutputDeviceDescriptorProtobuf addClusterComposition:](v3, "addClusterComposition:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v19);
  }

  -[_MRAVOutputDeviceDescriptorProtobuf setClusterType:](v3, "setClusterType:", -[MRAVOutputDevice clusterType](self, "clusterType"));
  -[MRAVOutputDevice primaryID](self, "primaryID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setPrimaryUID:](v3, "setPrimaryUID:", v23);

  -[_MRAVOutputDeviceDescriptorProtobuf setConfiguredClusterSize:](v3, "setConfiguredClusterSize:", -[MRAVOutputDevice configuredClusterSize](self, "configuredClusterSize"));
  -[_MRAVOutputDeviceDescriptorProtobuf setSupportsRapportRemoteControlTransport:](v3, "setSupportsRapportRemoteControlTransport:", -[MRAVOutputDevice supportsRapportRemoteControlTransport](self, "supportsRapportRemoteControlTransport"));
  -[MRAVOutputDevice currentBluetoothListeningMode](self, "currentBluetoothListeningMode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setCurrentBluetoothListeningMode:](v3, "setCurrentBluetoothListeningMode:", v24);

  -[MRAVOutputDevice availableBluetoothListeningModes](self, "availableBluetoothListeningModes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");
  -[_MRAVOutputDeviceDescriptorProtobuf setAvailableBluetoothListeningModes:](v3, "setAvailableBluetoothListeningModes:", v26);

  -[_MRAVOutputDeviceDescriptorProtobuf setSupportsMultiplayer:](v3, "setSupportsMultiplayer:", -[MRAVOutputDevice supportsMultiplayer](self, "supportsMultiplayer"));
  -[_MRAVOutputDeviceDescriptorProtobuf setProducesLowFidelityAudio:](v3, "setProducesLowFidelityAudio:", -[MRAVOutputDevice producesLowFidelityAudio](self, "producesLowFidelityAudio"));
  -[MRAVOutputDevice airPlayGroupID](self, "airPlayGroupID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setAirPlayGroupID:](v3, "setAirPlayGroupID:", v27);

  -[_MRAVOutputDeviceDescriptorProtobuf setSupportsSharePlayHandoff:](v3, "setSupportsSharePlayHandoff:", -[MRAVOutputDevice supportsSharePlayHandoff](self, "supportsSharePlayHandoff"));
  -[MRAVOutputDevice distance](self, "distance");
  if (v28 > 0.0)
  {
    -[MRAVOutputDevice distance](self, "distance");
    -[_MRAVOutputDeviceDescriptorProtobuf setDistance:](v3, "setDistance:");
  }
  if (!-[MRAVOutputDevice discoveredOnSameInfra](self, "discoveredOnSameInfra"))
    -[_MRAVOutputDeviceDescriptorProtobuf setDiscoveredOnSameInfra:](v3, "setDiscoveredOnSameInfra:", 0);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[MRAVOutputDevice activatedClusterMembersOutputDevices](self, "activatedClusterMembersOutputDevices");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v66;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v66 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v33), "descriptor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRAVOutputDeviceDescriptorProtobuf addActivatedClusterMembers:](v3, "addActivatedClusterMembers:", v34);

        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v31);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[MRAVOutputDevice allClusterMembers](self, "allClusterMembers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v62;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v62 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v39), "descriptor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRAVOutputDeviceDescriptorProtobuf addAllClusterMembers:](v3, "addAllClusterMembers:", v40);

        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v37);
  }

  -[_MRAVOutputDeviceDescriptorProtobuf setPickable:](v3, "setPickable:", -[MRAVOutputDevice isPickable](self, "isPickable"));
  -[_MRAVOutputDeviceDescriptorProtobuf setTransportType:](v3, "setTransportType:", -[MRAVOutputDevice transportType](self, "transportType"));
  -[MRAVOutputDevice clusterID](self, "clusterID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setClusterID:](v3, "setClusterID:", v41);

  -[_MRAVOutputDeviceDescriptorProtobuf setIsClusterLeader:](v3, "setIsClusterLeader:", -[MRAVOutputDevice isClusterLeader](self, "isClusterLeader"));
  -[MRAVOutputDevice parentUID](self, "parentUID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setParentUniqueIdentifier:](v3, "setParentUniqueIdentifier:", v42);

  -[MRAVOutputDevice roomID](self, "roomID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setRoomID:](v3, "setRoomID:", v43);

  -[MRAVOutputDevice roomName](self, "roomName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setRoomName:](v3, "setRoomName:", v44);

  -[_MRAVOutputDeviceDescriptorProtobuf setIsAppleAccessory:](v3, "setIsAppleAccessory:", -[MRAVOutputDevice isAppleAccessory](self, "isAppleAccessory"));
  if (-[MRAVOutputDevice supportsEngageOnClusterActivation](self, "supportsEngageOnClusterActivation"))
    -[_MRAVOutputDeviceDescriptorProtobuf setEngageOnClusterActivate:](v3, "setEngageOnClusterActivate:", 1);
  if (-[MRAVOutputDevice supportsBluetoothSharing](self, "supportsBluetoothSharing"))
    -[_MRAVOutputDeviceDescriptorProtobuf setSupportsBluetoothSharing:](v3, "setSupportsBluetoothSharing:", 1);
  -[MRAVOutputDevice deviceEnclosureColor](self, "deviceEnclosureColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceEnclosureColor:](v3, "setDeviceEnclosureColor:", v45);

  -[MRAVOutputDevice playingPairedDeviceName](self, "playingPairedDeviceName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setPlayingPairedDeviceName:](v3, "setPlayingPairedDeviceName:", v46);

  if (-[MRAVOutputDevice supportsRapport](self, "supportsRapport"))
    -[_MRAVOutputDeviceDescriptorProtobuf setSupportsRapport:](v3, "setSupportsRapport:", 1);
  if (-[MRAVOutputDevice isPickedOnPairedDevice](self, "isPickedOnPairedDevice"))
    -[_MRAVOutputDeviceDescriptorProtobuf setIsPickedOnPairedDevice:](v3, "setIsPickedOnPairedDevice:", 1);
  if (-[MRAVOutputDevice supportsHeadTrackedSpatialAudio](self, "supportsHeadTrackedSpatialAudio"))
    -[_MRAVOutputDeviceDescriptorProtobuf setSupportsHeadTrackedSpatialAudio:](v3, "setSupportsHeadTrackedSpatialAudio:", 1);
  if (-[MRAVOutputDevice isHeadTrackedSpatialAudioActive](self, "isHeadTrackedSpatialAudioActive"))
    -[_MRAVOutputDeviceDescriptorProtobuf setIsHeadTrackedSpatialAudioActive:](v3, "setIsHeadTrackedSpatialAudioActive:", 1);
  -[MRAVOutputDevice headTrackedSpatialAudioMode](self, "headTrackedSpatialAudioMode");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setHeadTrackedSpatialAudioMode:](v3, "setHeadTrackedSpatialAudioMode:", v47);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[MRAVOutputDevice dnsNames](self, "dnsNames");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v58;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v58 != v51)
          objc_enumerationMutation(v48);
        v53 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v52);
        -[_MRAVOutputDeviceDescriptorProtobuf dnsNames](v3, "dnsNames");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v53);

        ++v52;
      }
      while (v50 != v52);
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v50);
  }

  if (-[MRAVOutputDevice supportsConversationDetection](self, "supportsConversationDetection"))
    -[_MRAVOutputDeviceDescriptorProtobuf setSupportsConversationDetection:](v3, "setSupportsConversationDetection:", 1);
  if (-[MRAVOutputDevice isConversationDetectionEnabled](self, "isConversationDetectionEnabled"))
    -[_MRAVOutputDeviceDescriptorProtobuf setConversationDetectionEnabled:](v3, "setConversationDetectionEnabled:", 1);

  return v3;
}

- (BOOL)shouldBeLocallyHosted
{
  void *v3;
  _BOOL4 v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canHostMultiplayerStream")
    && -[MRAVOutputDevice isAuxiliary](self, "isAuxiliary"))
  {
    if (self)
      v4 = !-[MRAVOutputDevice canRelayCommunicationChannel](self, "canRelayCommunicationChannel");
    else
      LOBYTE(v4) = 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (NSString)groupID
{
  void *v3;

  if (!-[MRAVOutputDevice supportsMultiplayer](self, "supportsMultiplayer"))
    goto LABEL_4;
  -[MRAVOutputDevice parentGroupIdentifier](self, "parentGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {

LABEL_4:
    -[MRAVOutputDevice airPlayGroupID](self, "airPlayGroupID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (BOOL)isUsingJSONProtocol
{
  return 0;
}

- (NSDictionary)roomsLookupTable
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MRAVOutputDevice activatedClusterMembersOutputDevices](self, "activatedClusterMembersOutputDevices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "roomID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);
          }
          objc_msgSend(v11, "addObject:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSString)roomName
{
  return 0;
}

- (NSString)roomID
{
  return 0;
}

- (NSString)parentUID
{
  return 0;
}

- (BOOL)isPickable
{
  return 1;
}

- (int64_t)hostDeviceClass
{
  return self->_hostDeviceClass;
}

+ (id)localDeviceLocalizedName
{
  id v2;

  if (MSVDeviceIsAppleTV())
  {
    MRCopyDeviceName();
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (localDeviceLocalizedName___once != -1)
      dispatch_once(&localDeviceLocalizedName___once, &__block_literal_global_19);
    v2 = (id)localDeviceLocalizedName___localizedModelName;
  }
  return v2;
}

+ (id)localDeviceUID
{
  return CFSTR("LOCAL");
}

- (BOOL)isPersonalRoute
{
  return -[MRAVOutputDevice deviceSubtype](self, "deviceSubtype") == 2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  _BOOL4 v17;
  const char *v18;
  _BOOL4 v19;
  const char *v20;
  _BOOL4 v21;
  const char *v22;
  _BOOL4 v23;
  const char *v24;
  _BOOL4 v25;
  const char *v26;
  _BOOL4 v27;
  const char *v28;
  _BOOL4 v29;
  const char *v30;
  _BOOL4 v31;
  const char *v32;
  _BOOL4 v33;
  const char *v34;
  _BOOL4 v35;
  const char *v36;
  _BOOL4 v37;
  const char *v38;
  _BOOL4 v39;
  const char *v40;
  _BOOL4 v41;
  const char *v42;
  _BOOL4 v43;
  const char *v44;
  _BOOL4 v45;
  const char *v46;
  _BOOL4 v47;
  const char *v48;
  _BOOL4 v49;
  const char *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  __CFString *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  unint64_t v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  void *v88;
  void *v89;
  void *v90;
  __CFString *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  __CFString *v98;
  __CFString *v99;
  __CFString *v100;
  __CFString *v101;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (-[MRAVOutputDevice isLocalDevice](self, "isLocalDevice"))
    v5 = "(local) ";
  else
    v5 = " ";
  -[MRAVOutputDevice name](self, "name");
  v6 = objc_claimAutoreleasedReturnValue();
  -[MRAVOutputDevice uid](self, "uid");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[MRAVOutputDevice supportsMultiplayer](self, "supportsMultiplayer");
  v9 = (void *)MEMORY[0x1E0CB3940];
  v93 = v4;
  if (v8)
  {
    -[MRAVOutputDevice airPlayGroupID](self, "airPlayGroupID");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("airplay_group_id=\"%@\"), v70);
  }
  else
  {
    -[MRAVOutputDevice groupID](self, "groupID");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("group_id=\"%@\"), v70);
  }
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVOutputDevice parentGroupIdentifier](self, "parentGroupIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[MRAVOutputDevice parentGroupIdentifier](self, "parentGroupIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("parent_group_id=\"%@\" "), v67);
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1E30D5AF8;
  }
  -[MRAVOutputDevice bluetoothID](self, "bluetoothID");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVOutputDevice logicalDeviceID](self, "logicalDeviceID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[MRAVOutputDevice logicalDeviceID](self, "logicalDeviceID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR(" logical_id=%@"), v66);
    v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v99 = &stru_1E30D5AF8;
  }
  v101 = MRAVOutputDeviceTypeCopyDescription(-[MRAVOutputDevice deviceType](self, "deviceType"));
  v100 = MRAVOutputDeviceSubtypeCopyDescription(-[MRAVOutputDevice deviceSubtype](self, "deviceSubtype"));
  -[MRAVOutputDevice clusterComposition](self, "clusterComposition");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    -[MRAVOutputDevice clusterCompositionDescription](self);
    v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v98 = &stru_1E30D5AF8;
  }
  v15 = -[MRAVOutputDevice clusterType](self, "clusterType") - 1;
  v96 = (void *)v7;
  v97 = (void *)v6;
  v94 = (void *)v10;
  v95 = v3;
  v91 = (__CFString *)v12;
  v92 = v5;
  v89 = (void *)v13;
  if (v15 > 2)
    v16 = CFSTR("None");
  else
    v16 = off_1E30C7430[v15];
  v68 = v16;
  v17 = -[MRAVOutputDevice canAccessRemoteAssets](self, "canAccessRemoteAssets");
  v18 = " remote-assets";
  if (!v17)
    v18 = "";
  v87 = v18;
  v19 = -[MRAVOutputDevice isRemoteControllable](self, "isRemoteControllable");
  v20 = " remote-controllable";
  if (!v19)
    v20 = "";
  v86 = v20;
  v21 = -[MRAVOutputDevice canRelayCommunicationChannel](self, "canRelayCommunicationChannel");
  v22 = " relayable";
  if (!v21)
    v22 = "";
  v85 = v22;
  v23 = -[MRAVOutputDevice supportsBufferedAirPlay](self, "supportsBufferedAirPlay");
  v24 = " airplay2";
  if (!v23)
    v24 = "";
  v84 = v24;
  v25 = -[MRAVOutputDevice isGroupable](self, "isGroupable");
  v26 = " groupable";
  if (!v25)
    v26 = "";
  v83 = v26;
  v27 = -[MRAVOutputDevice isDeviceGroupable](self, "isDeviceGroupable");
  v28 = " device-groupable";
  if (!v27)
    v28 = "";
  v82 = v28;
  v29 = -[MRAVOutputDevice isGroupLeader](self, "isGroupLeader");
  v30 = " group-leader";
  if (!v29)
    v30 = "";
  v81 = v30;
  v31 = -[MRAVOutputDevice groupContainsGroupLeader](self, "groupContainsGroupLeader");
  v32 = " group-contains-leader";
  if (!v31)
    v32 = "";
  v80 = v32;
  v33 = -[MRAVOutputDevice isAirPlayReceiverSessionActive](self, "isAirPlayReceiverSessionActive");
  v34 = " airplay-receiving";
  if (!v33)
    v34 = "";
  v79 = v34;
  v35 = -[MRAVOutputDevice parentGroupContainsDiscoverableLeader](self, "parentGroupContainsDiscoverableLeader");
  v36 = " parent-group-discoverable-leader";
  if (!v35)
    v36 = "";
  v78 = v36;
  v37 = -[MRAVOutputDevice isProxyGroupPlayer](self, "isProxyGroupPlayer");
  v38 = " proxy";
  if (!v37)
    v38 = "";
  v77 = v38;
  v39 = -[MRAVOutputDevice canAccessAppleMusic](self, "canAccessAppleMusic");
  v40 = " music";
  if (!v39)
    v40 = "";
  v76 = v40;
  v41 = -[MRAVOutputDevice canAccessiCloudMusicLibrary](self, "canAccessiCloudMusicLibrary");
  v42 = " iCML";
  if (!v41)
    v42 = "";
  v75 = v42;
  v43 = -[MRAVOutputDevice canPlayEncryptedProgressiveDownloadAssets](self, "canPlayEncryptedProgressiveDownloadAssets");
  v44 = " enc-prog-dl-assets";
  if (!v43)
    v44 = "";
  v74 = v44;
  v45 = -[MRAVOutputDevice canFetchMediaDataFromSender](self, "canFetchMediaDataFromSender");
  v46 = " fetch-sender-media-data";
  if (!v45)
    v46 = "";
  v73 = v46;
  v47 = -[MRAVOutputDevice presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets](self, "presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets");
  v48 = " opt-audio-ui";
  if (!v47)
    v48 = "";
  v72 = v48;
  v49 = -[MRAVOutputDevice isAddedToHomeKit](self, "isAddedToHomeKit");
  v50 = " is-added-to-home-kit";
  if (!v49)
    v50 = "";
  v71 = v50;
  -[MRAVOutputDevice modelID](self, "modelID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = &stru_1E30D5AF8;
  if (v51)
  {
    v53 = (void *)MEMORY[0x1E0CB3940];
    -[MRAVOutputDevice modelID](self, "modelID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringWithFormat:", CFSTR(" %@"), v65);
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = &stru_1E30D5AF8;
  }
  if (-[MRAVOutputDevice supportsBluetoothSharing](self, "supportsBluetoothSharing"))
    v55 = " bluetooth-sharing";
  else
    v55 = "";
  if (-[MRAVOutputDevice isUsingJSONProtocol](self, "isUsingJSONProtocol"))
    v56 = " JSON";
  else
    v56 = "";
  if (-[MRAVOutputDevice supportsHAP](self, "supportsHAP"))
    v57 = " supportsHAP";
  else
    v57 = "";
  if (-[MRAVOutputDevice supportsMultiplayer](self, "supportsMultiplayer"))
    v58 = " multiplayer";
  else
    v58 = "";
  -[MRAVOutputDevice batteryDescription](self);
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v59;
  if (v59)
    v61 = (const __CFString *)v59;
  else
    v61 = &stru_1E30D5AF8;
  if (-[MRAVOutputDevice transportType](self, "transportType"))
  {
    v62 = -[MRAVOutputDevice transportType](self, "transportType");
    if (v62 > 6)
      v52 = CFSTR("Unknown");
    else
      v52 = off_1E30C7448[v62];
  }
  objc_msgSend(v95, "stringWithFormat:", CFSTR("<%@:%p %s\"%@\" uid=\"%@\" %@ %@bluetooth_id=%@%@ type=%@ subtype=%@%@ clusterType=%@%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%@%s%s%s%s%@ %@>"), v93, self, v92, v97, v96, v69, v91, v90, v99, v101, v100, v98, v68, v87, v86, v85,
    v84,
    v83,
    v82,
    v81,
    v80,
    v79,
    v78,
    v77,
    v76,
    v75,
    v74,
    v73,
    v72,
    v71,
    v54,
    v55,
    v56,
    v57,
    v58,
    v61,
    v52);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {

  }
  if (v88)

  if (v89)
  {

  }
  if (v94)
  {

  }
  return v63;
}

- (id)batteryDescription
{
  id v1;
  id v2;
  void *v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  void *v32;
  void *v33;
  void *v34;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v1, "hasBatteryLevel"))
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v1, "batteryLevel");
      objc_msgSend(v3, "stringWithFormat:", CFSTR("s:%.2f"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

    }
    objc_msgSend(v1, "modelSpecificInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    getAVOutputDeviceBatteryLevelCaseKey[0]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v1, "modelSpecificInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      getAVOutputDeviceBatteryLevelCaseKey[0]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      objc_msgSend(v9, "stringWithFormat:", CFSTR("c:%.2f"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v14);

    }
    objc_msgSend(v1, "modelSpecificInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    getAVOutputDeviceBatteryLevelLeftKey[0]();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v1, "modelSpecificInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      getAVOutputDeviceBatteryLevelLeftKey[0]();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      objc_msgSend(v18, "stringWithFormat:", CFSTR("l:%.2f"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v23);

    }
    objc_msgSend(v1, "modelSpecificInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    getAVOutputDeviceBatteryLevelRightKey[0]();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v1, "modelSpecificInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      getAVOutputDeviceBatteryLevelRightKey[0]();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "floatValue");
      objc_msgSend(v27, "stringWithFormat:", CFSTR("r:%.2f"), v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v32);

    }
    if (objc_msgSend(v2, "count"))
    {
      v33 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v2, "componentsJoinedByString:", CFSTR("|"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR(" (batt %@)"), v34);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_headTrackedSpatialAudioMode, 0);
  objc_storeStrong((id *)&self->_availableBluetoothListeningModes, 0);
  objc_storeStrong((id *)&self->_currentBluetoothListeningMode, 0);
  objc_storeStrong((id *)&self->_tightSyncID, 0);
  objc_storeStrong((id *)&self->_logicalDeviceID, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_destroyWeak((id *)&self->_endpoint);
  objc_storeStrong((id *)&self->_primaryID, 0);
  objc_storeStrong((id *)&self->_dnsNames, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_groupSessionInfo, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);
  objc_storeStrong((id *)&self->_parentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_activatedClusterMembersOutputDevices, 0);
  objc_storeStrong((id *)&self->_allClusterMembers, 0);
  objc_storeStrong((id *)&self->_clusterComposition, 0);
  objc_storeStrong((id *)&self->_playingPairedDeviceName, 0);
  objc_storeStrong((id *)&self->_modelSpecificInfo, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
  objc_storeStrong((id *)&self->_airPlayGroupID, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_recommendation, 0);
}

- (BOOL)isVolumeControlAvailable
{
  return (-[MRAVOutputDevice volumeCapabilities](self, "volumeCapabilities") >> 1) & 1;
}

- (void)setEndpoint:(id)a3
{
  objc_storeWeak((id *)&self->_endpoint, a3);
}

void __44__MRAVOutputDevice_localDeviceLocalizedName__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MSVCopyLocalizedModelName();
  v1 = (void *)localDeviceLocalizedName___localizedModelName;
  localDeviceLocalizedName___localizedModelName = v0;

}

- (void)setVolume:(float)a3 details:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputDevice setVolume:details:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)adjustVolume:(int64_t)a3 details:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputDevice adjustVolume:details:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)setVolumeMuted:(BOOL)a3 details:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputDevice setVolumeMuted:details:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (float)volume
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputDevice volume]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (BOOL)isVolumeMuted
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputDevice isVolumeMuted]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (unsigned)volumeCapabilities
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputDevice volumeCapabilities]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (unsigned)clusterType
{
  return 0;
}

- (id)_clusterCompositionDescription
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];

  if (!a1)
    return 0;
  v2 = objc_msgSend(a1, "configuredClusterSize");
  objc_msgSend(a1, "clusterComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MRAVOutputDevice__clusterCompositionDescription__block_invoke;
  v10[3] = &unk_1E30C73A8;
  v10[4] = a1;
  objc_msgSend(v3, "mr_map:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "clusterComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 != v2)
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" * expected: %lu"), v2);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

id __50__MRAVOutputDevice__clusterCompositionDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = MRAVOutputDeviceSubtypeCopyDescription(objc_msgSend(v4, "deviceSubtype"));
  objc_msgSend(v4, "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "primaryID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v8, "isEqual:", v9);
  if ((_DWORD)v4)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("^"));
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  return v7;
}

- (id)_clusterRoomDescription
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "roomOutputDevices");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "mr_map:", &__block_literal_global_17);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR("|"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t __43__MRAVOutputDevice__clusterRoomDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugName");
}

- (id)clusterCompositionDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  if (a1)
  {
    -[MRAVOutputDevice _clusterCompositionDescription](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVOutputDevice _clusterRoomDescription](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@, rooms=<%@>)"), v2, v3);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v2, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isAirpodsDevice
{
  void *v3;
  char v4;
  void *v5;

  -[MRAVOutputDevice modelID](self, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", 0x1E30DDD18) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[MRAVOutputDevice modelID](self, "modelID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsString:", 0x1E30DDD38) & 1) != 0
      || -[MRAVOutputDevice isB298Device](self, "isB298Device")
      || -[MRAVOutputDevice isB515Device](self, "isB515Device")
      || -[MRAVOutputDevice isB688Device](self, "isB688Device")
      || -[MRAVOutputDevice isB698Device](self, "isB698Device")
      || -[MRAVOutputDevice isB698CDevice](self, "isB698CDevice")
      || (-[MRAVOutputDevice isB768Device](self) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v4 = -[MRAVOutputDevice isB735Device](self);
    }

  }
  return v4;
}

- (uint64_t)isB768Device
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (uint64_t)a1;
  if (a1)
  {
    objc_msgSend(a1, "modelID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "containsString:", 0x1E30DDEB8) & 1) != 0)
    {
      v1 = 1;
    }
    else
    {
      objc_msgSend((id)v1, "modelID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "containsString:", 0x1E30DDED8) & 1) != 0)
      {
        v1 = 1;
      }
      else
      {
        objc_msgSend((id)v1, "modelID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "containsString:", 0x1E30DDEF8) & 1) != 0)
        {
          v1 = 1;
        }
        else
        {
          objc_msgSend((id)v1, "modelID");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v1 = objc_msgSend(v5, "containsString:", 0x1E30DDF18);

        }
      }

    }
  }
  return v1;
}

- (uint64_t)isB735Device
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = (uint64_t)a1;
  if (a1)
  {
    objc_msgSend(a1, "modelID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "containsString:", 0x1E30DDF38) & 1) != 0)
    {
      v1 = 1;
    }
    else
    {
      objc_msgSend((id)v1, "modelID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend(v3, "containsString:", 0x1E30DDF58);

    }
  }
  return v1;
}

- (BOOL)isB298Device
{
  void *v2;
  char v3;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", 0x1E30DDD78);

  return v3;
}

- (BOOL)isB515Device
{
  void *v2;
  char v3;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", 0x1E30DDD58);

  return v3;
}

- (BOOL)isB688Device
{
  void *v2;
  char v3;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", 0x1E30DDE38);

  return v3;
}

- (BOOL)isB698Device
{
  void *v2;
  char v3;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", 0x1E30DDE78);

  return v3;
}

- (BOOL)isB698CDevice
{
  void *v2;
  char v3;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", 0x1E30DDE98);

  return v3;
}

- (BOOL)isBeatsLegacyDevice
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((objc_msgSend(v4, "containsString:", 0x1E30DDD98) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "containsString:", 0x1E30DDDB8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isHearingDevice
{
  void *v2;
  char v3;

  -[MRAVOutputDevice uid](self, "uid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("-tlea"));

  return v3;
}

- (BOOL)isJ327Device
{
  void *v2;
  char v3;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", 0x1E30DDE58);

  return v3;
}

- (BOOL)isB238Device
{
  void *v2;
  char v3;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", 0x1E30DDDD8);

  return v3;
}

- (BOOL)isB520Device
{
  void *v2;
  char v3;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", 0x1E30DDDF8);

  return v3;
}

- (BOOL)isB620Device
{
  void *v2;
  char v3;

  -[MRAVOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", 0x1E30DDE18);

  return v3;
}

- (BOOL)isHomeTheaterB520Device
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MRAVOutputDevice clusterComposition](self, "clusterComposition", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        if ((v6 & 1) != 0)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "modelID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v9, "containsString:", 0x1E30DDDF8);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  if (-[MRAVOutputDevice clusterType](self, "clusterType") == 2)
    return v6;
  else
    return 0;
}

- (BOOL)isW3Device
{
  if (-[MRAVOutputDevice isB698Device](self, "isB698Device")
    || -[MRAVOutputDevice isB698CDevice](self, "isB698CDevice")
    || (-[MRAVOutputDevice isB768Device](self) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[MRAVOutputDevice isB735Device](self);
  }
}

- (BOOL)canBeAirPlayReceiver
{
  return -[MRAVOutputDevice deviceType](self, "deviceType") == 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MRAVOutputDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (MRAVOutputDevice *)v4;
    if (self == v5)
    {
      v10 = 1;
    }
    else
    {
      -[MRAVOutputDevice uid](self, "uid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[MRAVOutputDevice uid](v5, "uid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          -[MRAVOutputDevice uid](self, "uid");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRAVOutputDevice uid](v5, "uid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "isEqualToString:", v9);

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqualToOutputDevice:(id)a3
{
  return -[MRAVOutputDevice isEqualToOutputDevice:denyList:](self, "isEqualToOutputDevice:denyList:", a3, 0);
}

- (BOOL)isEqualToOutputDevice:(id)a3 denyList:(id)a4
{
  return -[MRAVOutputDevice isEqualToOutputDevice:denyList:addedProperties:removedProperties:changedProperties:](self, "isEqualToOutputDevice:denyList:addedProperties:removedProperties:changedProperties:", a3, a4, 0, 0, 0);
}

- (BOOL)isEqualToOutputDevice:(id)a3 denyList:(id)a4 addedProperties:(id *)a5 removedProperties:(id *)a6 changedProperties:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;

  v12 = a3;
  v13 = a4;
  if (-[MRAVOutputDevice isEqual:](self, "isEqual:", v12))
  {
    v14 = objc_msgSend(v13, "count");
    -[MRAVOutputDevice descriptor](self, "descriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a7 || a6 || a5 || v14)
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v12, "descriptor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "mutableCopy");

      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __103__MRAVOutputDevice_isEqualToOutputDevice_denyList_addedProperties_removedProperties_changedProperties___block_invoke;
      v35[3] = &unk_1E30C73F0;
      v36 = v13;
      v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v35);
      ((void (**)(_QWORD, void *))v24)[2](v24, v20);
      ((void (**)(_QWORD, void *))v24)[2](v24, v23);
      v33 = 0;
      v34 = 0;
      v31 = v20;
      v32 = 0;
      MRDictionaryCalculateDeltas(v20, v23, &v34, &v33, &v32);
      v25 = v34;
      v26 = v33;
      v27 = v32;
      if (a5)
        *a5 = objc_retainAutorelease(v25);
      if (a6)
        *a6 = objc_retainAutorelease(v26);
      if (a7)
        *a7 = objc_retainAutorelease(v27);
      v28 = objc_msgSend(v25, "count");
      v29 = objc_msgSend(v26, "count") + v28;
      v18 = v29 + objc_msgSend(v27, "count") == 0;

    }
    else
    {
      objc_msgSend(v12, "descriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __103__MRAVOutputDevice_isEqualToOutputDevice_denyList_addedProperties_removedProperties_changedProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)isEqualFuzzy:(id)a3
{
  id v4;
  MRAVOutputDevice *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  BOOL v18;

  v4 = a3;
  v5 = self;
  v6 = v4;
  v7 = -[MRAVOutputDevice clusterType](v5, "clusterType");
  if (v7 == objc_msgSend(v6, "clusterType"))
  {
    v8 = -[MRAVOutputDevice configuredClusterSize](v5, "configuredClusterSize");
    v9 = v8 == objc_msgSend(v6, "configuredClusterSize");
  }
  else
  {
    v9 = 0;
  }
  -[MRAVOutputDevice uid](v5, "uid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  -[MRAVOutputDevice uid](v5, "uid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {

LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "uid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15
    || !objc_msgSend(v6, "isLocalDevice")
    || !-[MRAVOutputDevice isLocalDevice](v5, "isLocalDevice"))
  {
    goto LABEL_10;
  }
  v16 = -[MRAVOutputDevice deviceType](v5, "deviceType");
  v17 = v16 == objc_msgSend(v6, "deviceType");
LABEL_11:
  v18 = v12 & v9 | v17;

  return v18;
}

- (id)mergingVolumeFrom:(id)a3
{
  id v4;
  void *v5;
  MRAVDistantOutputDevice *v6;

  v4 = a3;
  -[MRAVOutputDevice descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __38__MRAVOutputDevice_mergingVolumeFrom___block_invoke((uint64_t)v5, v5, v4);

  v6 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v5);
  return v6;
}

void __38__MRAVOutputDevice_mergingVolumeFrom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_msgSend(v5, "hasVolume") & 1) == 0)
  {
    objc_msgSend(v4, "volume");
    objc_msgSend(v5, "setVolume:");
  }
  if ((objc_msgSend(v5, "hasVolumeCapabilities") & 1) == 0)
    objc_msgSend(v5, "setVolumeCapabilities:", objc_msgSend(v4, "volumeCapabilities"));
  if ((objc_msgSend(v5, "hasVolumeMuted") & 1) == 0)
    objc_msgSend(v5, "setVolumeMuted:", objc_msgSend(v4, "isVolumeMuted"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MRAVOutputDevice uid](self, "uid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)capabilitiesDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRAVOutputDevice isGroupable](self, "isGroupable"))
    objc_msgSend(v3, "addObject:", CFSTR("groupable"));
  if (-[MRAVOutputDevice groupContainsGroupLeader](self, "groupContainsGroupLeader"))
    objc_msgSend(v3, "addObject:", CFSTR("discoverable-leader"));
  if (-[MRAVOutputDevice isRemoteControllable](self, "isRemoteControllable"))
    objc_msgSend(v3, "addObject:", CFSTR("remote-controllable"));
  if (-[MRAVOutputDevice canRelayCommunicationChannel](self, "canRelayCommunicationChannel"))
    objc_msgSend(v3, "addObject:", CFSTR("relayable"));
  if (-[MRAVOutputDevice canAccessAppleMusic](self, "canAccessAppleMusic"))
    objc_msgSend(v3, "addObject:", CFSTR("music"));
  if (-[MRAVOutputDevice canAccessiCloudMusicLibrary](self, "canAccessiCloudMusicLibrary"))
    objc_msgSend(v3, "addObject:", CFSTR("iCML"));
  if (-[MRAVOutputDevice canAccessRemoteAssets](self, "canAccessRemoteAssets"))
    objc_msgSend(v3, "addObject:", CFSTR("remote-assets"));
  if (-[MRAVOutputDevice parentGroupContainsDiscoverableLeader](self, "parentGroupContainsDiscoverableLeader"))
    objc_msgSend(v3, "addObject:", CFSTR("discoverable-parent-leader"));
  -[MRAVOutputDevice bluetoothID](self, "bluetoothID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "addObject:", CFSTR("bt-ad"));
  if (-[MRAVOutputDevice supportsBluetoothSharing](self, "supportsBluetoothSharing"))
    objc_msgSend(v3, "addObject:", CFSTR("bt-share"));
  if (-[MRAVOutputDevice supportsHAP](self, "supportsHAP"))
    objc_msgSend(v3, "addObject:", CFSTR("HAP"));
  if (-[MRAVOutputDevice isUsingJSONProtocol](self, "isUsingJSONProtocol"))
    objc_msgSend(v3, "addObject:", CFSTR("JSON"));
  if (-[MRAVOutputDevice supportsMultiplayer](self, "supportsMultiplayer"))
    objc_msgSend(v3, "addObject:", CFSTR("multiplayer"));
  v5 = -[MRAVOutputDevice transportType](self, "transportType");
  if (v5 > 6)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E30C7448[v5];
  objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)composedTypeDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRAVOutputDevice deviceType](self, "deviceType") == 2
    && (-[MRAVOutputDevice modelID](self, "modelID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v5))
  {
    -[MRAVOutputDevice modelID](self, "modelID");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = MRAVOutputDeviceTypeCopyDescription(-[MRAVOutputDevice deviceType](self, "deviceType"));
    objc_msgSend(v3, "addObject:", v7);

    if (-[MRAVOutputDevice deviceType](self, "deviceType") == 1
      && -[MRAVOutputDevice supportsBufferedAirPlay](self, "supportsBufferedAirPlay"))
    {
      objc_msgSend(v3, "addObject:", CFSTR("2"));
    }
    v6 = (uint64_t)MRAVOutputDeviceSubtypeCopyDescription(-[MRAVOutputDevice deviceSubtype](self, "deviceSubtype"));
  }
  v8 = (void *)v6;
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)roleDescription
{
  if (-[MRAVOutputDevice isProxyGroupPlayer](self, "isProxyGroupPlayer"))
    return (NSString *)CFSTR("proxy");
  if (-[MRAVOutputDevice isGroupLeader](self, "isGroupLeader"))
    return (NSString *)CFSTR("leader");
  if (-[MRAVOutputDevice isAirPlayReceiverSessionActive](self, "isAirPlayReceiverSessionActive"))
    return (NSString *)CFSTR("receiver");
  return (NSString *)CFSTR("none");
}

- (NSDictionary)jsonEncodableDictionaryRepresentation
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[22];
  _QWORD v42[24];

  v42[22] = *MEMORY[0x1E0C80C00];
  v41[0] = CFSTR("name");
  -[MRAVOutputDevice name](self, "name");
  v3 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = &stru_1E30D5AF8;
  v42[0] = v4;
  v41[1] = CFSTR("uid");
  -[MRAVOutputDevice uid](self, "uid");
  v5 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = &stru_1E30D5AF8;
  v42[1] = v6;
  v41[2] = CFSTR("group-id");
  -[MRAVOutputDevice groupID](self, "groupID");
  v7 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v7;
  if (v7)
    v8 = (const __CFString *)v7;
  else
    v8 = &stru_1E30D5AF8;
  v42[2] = v8;
  v41[3] = CFSTR("type");
  v9 = MRAVOutputDeviceTypeCopyDescription(-[MRAVOutputDevice deviceType](self, "deviceType"));
  v37 = v9;
  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E30D5AF8;
  v42[3] = v10;
  v41[4] = CFSTR("subtype");
  v11 = MRAVOutputDeviceSubtypeCopyDescription(-[MRAVOutputDevice deviceSubtype](self, "deviceSubtype"));
  v36 = v11;
  if (v11)
    v12 = v11;
  else
    v12 = &stru_1E30D5AF8;
  v42[4] = v12;
  v41[5] = CFSTR("buffered-airplay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice supportsBufferedAirPlay](self, "supportsBufferedAirPlay"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v35;
  v41[6] = CFSTR("group-leader");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice isGroupLeader](self, "isGroupLeader"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v34;
  v41[7] = CFSTR("remote-assets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice canAccessRemoteAssets](self, "canAccessRemoteAssets"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v33;
  v41[8] = CFSTR("remote-controllable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice isRemoteControllable](self, "isRemoteControllable"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v32;
  v41[9] = CFSTR("relayable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice canRelayCommunicationChannel](self, "canRelayCommunicationChannel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v31;
  v41[10] = CFSTR("groupable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice isGroupable](self, "isGroupable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[10] = v30;
  v41[11] = CFSTR("discoverable-leader");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice groupContainsGroupLeader](self, "groupContainsGroupLeader"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[11] = v29;
  v41[12] = CFSTR("airplay-receiving");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice isAirPlayReceiverSessionActive](self, "isAirPlayReceiverSessionActive"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[12] = v28;
  v41[13] = CFSTR("parent-group-id");
  -[MRAVOutputDevice parentGroupIdentifier](self, "parentGroupIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E30D5AF8;
  v42[13] = v15;
  v41[14] = CFSTR("parent-group-discoverable-leader");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice parentGroupContainsDiscoverableLeader](self, "parentGroupContainsDiscoverableLeader"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[14] = v16;
  v41[15] = CFSTR("proxy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice isProxyGroupPlayer](self, "isProxyGroupPlayer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[15] = v17;
  v41[16] = CFSTR("music");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice canAccessAppleMusic](self, "canAccessAppleMusic"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[16] = v18;
  v41[17] = CFSTR("iCML");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice canAccessiCloudMusicLibrary](self, "canAccessiCloudMusicLibrary"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[17] = v19;
  v41[18] = CFSTR("is-added-to-home-kit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice isAddedToHomeKit](self, "isAddedToHomeKit"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[18] = v20;
  v41[19] = CFSTR("bluetoothID");
  -[MRAVOutputDevice bluetoothID](self, "bluetoothID");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = &stru_1E30D5AF8;
  v42[19] = v23;
  v41[20] = CFSTR("supportsHAP");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRAVOutputDevice supportsHAP](self, "supportsHAP"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[20] = v24;
  v41[21] = CFSTR("modelID");
  -[MRAVOutputDevice modelID](self, "modelID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[21] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v26;
}

- (NSString)debugName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVOutputDevice uid](self, "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVOutputDevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@-%@"), v4, v5);

  return (NSString *)v6;
}

- (BOOL)isAuxiliary
{
  void *v3;
  BOOL v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMultiplayerAware")
    && -[MRAVOutputDevice deviceType](self, "deviceType") == 1
    && (-[MRAVOutputDevice deviceSubtype](self, "deviceSubtype") == 1
     || -[MRAVOutputDevice deviceSubtype](self, "deviceSubtype") == 0);

  return v4;
}

- (BOOL)isPrimaryLocalDevice
{
  void *v2;
  void *v3;
  char v4;

  -[MRAVOutputDevice primaryID](self, "primaryID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MRMediaRemoteCopyDeviceUID();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)canProxyEndpoint
{
  _BOOL4 v3;

  v3 = -[MRAVOutputDevice supportsRapportRemoteControlTransport](self, "supportsRapportRemoteControlTransport");
  if (v3)
    LOBYTE(v3) = -[MRAVOutputDevice deviceSubtype](self, "deviceSubtype") == 12;
  return v3;
}

- (BOOL)containsUID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  -[MRAVOutputDevice uid](self, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[MRAVOutputDevice primaryID](self, "primaryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[MRAVOutputDevice allClusterMembers](self, "allClusterMembers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __32__MRAVOutputDevice_containsUID___block_invoke;
      v19[3] = &unk_1E30C5BF0;
      v10 = v4;
      v20 = v10;
      if ((objc_msgSend(v8, "mr_any:", v19) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        -[MRAVOutputDevice clusterComposition](self, "clusterComposition");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __32__MRAVOutputDevice_containsUID___block_invoke_2;
        v17[3] = &unk_1E30C5BF0;
        v12 = v10;
        v18 = v12;
        if ((objc_msgSend(v11, "mr_any:", v17) & 1) != 0)
        {
          v6 = 1;
        }
        else
        {
          -[MRAVOutputDevice allClusterMembers](self, "allClusterMembers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = v9;
          v15[1] = 3221225472;
          v15[2] = __32__MRAVOutputDevice_containsUID___block_invoke_3;
          v15[3] = &unk_1E30C5BF0;
          v16 = v12;
          v6 = objc_msgSend(v13, "mr_any:", v15);

        }
      }

    }
  }

  return v6;
}

uint64_t __32__MRAVOutputDevice_containsUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

uint64_t __32__MRAVOutputDevice_containsUID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

uint64_t __32__MRAVOutputDevice_containsUID___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

- (id)effectiveOutputDeviceForUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  MRAVOutputDevice *v19;
  MRAVOutputDevice *v20;
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
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[MRAVOutputDevice rooms](self, "rooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
      objc_msgSend(v10, "uid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v4);

      if ((v12 & 1) != 0)
        goto LABEL_21;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[MRAVOutputDevice activatedClusterMembersOutputDevices](self, "activatedClusterMembersOutputDevices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v15)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v16);
      objc_msgSend(v10, "uid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v4);

      if ((v18 & 1) != 0)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v14)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_21:
    v20 = v10;

    goto LABEL_22;
  }
LABEL_17:

  if (-[MRAVOutputDevice containsUID:](self, "containsUID:", v4))
    v19 = self;
  else
    v19 = 0;
  v20 = v19;
LABEL_22:

  return v20;
}

- (NSString)baseGroupID
{
  void *v2;
  void *v3;

  -[MRAVOutputDevice airPlayGroupID](self, "airPlayGroupID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MRComputeBaseGroupID(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)baseParentGroupID
{
  void *v2;
  void *v3;

  -[MRAVOutputDevice parentGroupIdentifier](self, "parentGroupIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MRComputeBaseGroupID(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)groupContextID
{
  void *v2;
  void *v3;

  -[MRAVOutputDevice groupID](self, "groupID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MRComputeGroupContextID(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEligibleForWHAPlayback
{
  unsigned int v3;
  char v4;

  v3 = -[MRAVOutputDevice isGroupable](self, "isGroupable");
  if (v3)
  {
    if (-[MRAVOutputDevice deviceType](self, "deviceType") == 1)
    {
      if (!self
        || (v3 = -[MRAVOutputDevice deviceSubtype](self, "deviceSubtype"), v3 > 0xF)
        || (v4 = v3, LOBYTE(v3) = 1, ((1 << v4) & 0xB000) == 0))
      {
        LOBYTE(v3) = -[MRAVOutputDevice isAuxiliary](self, "isAuxiliary");
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)supportsMigration
{
  BOOL v3;
  _BOOL4 v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;

  v3 = self
    && -[MRAVOutputDevice canRelayCommunicationChannel](self, "canRelayCommunicationChannel")
    && -[MRAVOutputDevice groupContainsGroupLeader](self, "groupContainsGroupLeader");
  v4 = -[MRAVOutputDevice isGroupable](self, "isGroupable");
  if (v4)
  {
    v5 = -[MRAVOutputDevice deviceType](self, "deviceType");
    v6 = v5 == 1;
    LOBYTE(v4) = v5 == 1 && v3;
    if (self && v6)
    {
      v7 = -[MRAVOutputDevice deviceSubtype](self, "deviceSubtype");
      LOBYTE(v4) = v7 == 15 || (v7 & 0xFFFFFFFE) == 12 || v3;
    }
  }
  return v4;
}

- (BOOL)isActivatedForContinuityScreen
{
  return 0;
}

- (BOOL)isNearby
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportRouteRecommendations");

  if (!v4)
    return 0;
  -[MRAVOutputDevice recommendation](self, "recommendation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[MRAVOutputDevice recommendation](self, "recommendation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)(objc_msgSend(v6, "classification") - 2) < 3;

  return v7;
}

- (BOOL)isKnown
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportRouteRecommendations");

  if ((v4 & 1) == 0)
    return -[MRAVOutputDevice discoveredOnSameInfra](self, "discoveredOnSameInfra");
  -[MRAVOutputDevice recommendation](self, "recommendation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return -[MRAVOutputDevice discoveredOnSameInfra](self, "discoveredOnSameInfra");
  -[MRAVOutputDevice recommendation](self, "recommendation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "classification") != 1;

  return v7;
}

- (NSArray)clusterCompositionOutputDevices
{
  void *v2;
  void *v3;

  -[MRAVOutputDevice clusterComposition](self, "clusterComposition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_map:", &__block_literal_global_153);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

MRAVDistantOutputDevice *__51__MRAVOutputDevice_clusterCompositionOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantOutputDevice *v3;
  void *v4;
  MRAVDistantOutputDevice *v5;

  v2 = a2;
  v3 = [MRAVDistantOutputDevice alloc];
  objc_msgSend(v2, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MRAVDistantOutputDevice initWithDescriptor:](v3, "initWithDescriptor:", v4);
  return v5;
}

- (NSArray)allClusterMembersOutputDevices
{
  void *v2;
  void *v3;

  -[MRAVOutputDevice allClusterMembers](self, "allClusterMembers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_map:", &__block_literal_global_154);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

MRAVDistantOutputDevice *__50__MRAVOutputDevice_allClusterMembersOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantOutputDevice *v3;
  void *v4;
  MRAVDistantOutputDevice *v5;

  v2 = a2;
  v3 = [MRAVDistantOutputDevice alloc];
  objc_msgSend(v2, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MRAVDistantOutputDevice initWithDescriptor:](v3, "initWithDescriptor:", v4);
  return v5;
}

- (BOOL)isMultiRoom
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[MRAVOutputDevice roomID](self, "roomID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRAVOutputDevice roomID](self, "roomID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[MRAVOutputDevice activatedClusterMembersOutputDevices](self, "activatedClusterMembersOutputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "msv_compactMap:", &__block_literal_global_157);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  LOBYTE(v6) = (unint64_t)objc_msgSend(v3, "count") > 1;
  return (char)v6;
}

uint64_t __31__MRAVOutputDevice_isMultiRoom__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "roomID");
}

- (NSArray)rooms
{
  return 0;
}

- (MRRouteRecommendation)recommendation
{
  MRAVOutputDevice *v2;
  MRRouteRecommendation *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_recommendation;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRecommendation:(id)a3
{
  MRRouteRecommendation *v4;
  MRRouteRecommendation *recommendation;
  MRAVOutputDevice *obj;

  v4 = (MRRouteRecommendation *)a3;
  obj = self;
  objc_sync_enter(obj);
  recommendation = obj->_recommendation;
  obj->_recommendation = v4;

  objc_sync_exit(obj);
}

- (MRAVOutputDevice)outputDeviceWithSourceInfoFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MRAVDistantOutputDevice *v8;

  v4 = a3;
  -[MRAVOutputDevice descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourceInfo:", v7);

  v8 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v5);
  return (MRAVOutputDevice *)v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)airPlayGroupID
{
  return self->_airPlayGroupID;
}

- (void)setAirPlayGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)MACAddress
{
  return self->_MACAddress;
}

- (NSDictionary)modelSpecificInfo
{
  return self->_modelSpecificInfo;
}

- (NSString)playingPairedDeviceName
{
  return self->_playingPairedDeviceName;
}

- (BOOL)canAccessRemoteAssets
{
  return self->_canAccessRemoteAssets;
}

- (BOOL)canAccessAppleMusic
{
  return self->_canAccessAppleMusic;
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return self->_canAccessiCloudMusicLibrary;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return self->_canPlayEncryptedProgressiveDownloadAssets;
}

- (BOOL)canFetchMediaDataFromSender
{
  return self->_canFetchMediaDataFromSender;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
}

- (BOOL)isRemoteControllable
{
  return self->_remoteControllable;
}

- (BOOL)isGroupLeader
{
  return self->_groupLeader;
}

- (BOOL)groupContainsGroupLeader
{
  return self->_groupContainsGroupLeader;
}

- (BOOL)isAirPlayReceiverSessionActive
{
  return self->_airPlayReceiverSessionActive;
}

- (BOOL)isGroupable
{
  return self->_groupable;
}

- (BOOL)supportsBluetoothSharing
{
  return self->_supportsBluetoothSharing;
}

- (BOOL)isProxyGroupPlayer
{
  return self->_proxyGroupPlayer;
}

- (BOOL)canRelayCommunicationChannel
{
  return self->_canRelayCommunicationChannel;
}

- (BOOL)supportsBufferedAirPlay
{
  return self->_supportsBufferedAirPlay;
}

- (BOOL)supportsMultiplayer
{
  return self->_supportsMultiplayer;
}

- (BOOL)isDeviceGroupable
{
  return self->_deviceGroupable;
}

- (BOOL)isPickedOnPairedDevice
{
  return self->_pickedOnPairedDevice;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (unsigned)deviceSubtype
{
  return self->_deviceSubtype;
}

- (NSArray)clusterComposition
{
  return self->_clusterComposition;
}

- (NSArray)allClusterMembers
{
  return self->_allClusterMembers;
}

- (NSArray)activatedClusterMembersOutputDevices
{
  return self->_activatedClusterMembersOutputDevices;
}

- (unint64_t)configuredClusterSize
{
  return self->_configuredClusterSize;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (BOOL)hasBatteryLevel
{
  return self->_hasBatteryLevel;
}

- (BOOL)isLocalDevice
{
  return self->_localDevice;
}

- (BOOL)supportsExternalScreen
{
  return self->_supportsExternalScreen;
}

- (BOOL)requiresAuthorization
{
  return self->_requiresAuthorization;
}

- (NSString)parentGroupIdentifier
{
  return self->_parentGroupIdentifier;
}

- (void)setParentGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)producesLowFidelityAudio
{
  return self->_producesLowFidelityAudio;
}

- (NSString)bluetoothID
{
  return self->_bluetoothID;
}

- (BOOL)supportsHAP
{
  return self->_supportsHAP;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (BOOL)isClusterLeader
{
  return self->_clusterLeader;
}

- (BOOL)supportsEngageOnClusterActivation
{
  return self->_supportsEngageOnClusterActivation;
}

- (MRGroupSessionInfo)groupSessionInfo
{
  return self->_groupSessionInfo;
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (BOOL)isAppleAccessory
{
  return self->_appleAccessory;
}

- (NSArray)dnsNames
{
  return self->_dnsNames;
}

- (void)setPrimaryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  return self->_parentGroupContainsDiscoverableLeader;
}

- (BOOL)supportsRapportRemoteControlTransport
{
  return self->_supportsRapportRemoteControlTransport;
}

- (BOOL)supportsSharePlayHandoff
{
  return self->_supportsSharePlayHandoff;
}

- (float)distance
{
  return self->_distance;
}

- (MRAVEndpoint)endpoint
{
  return (MRAVEndpoint *)objc_loadWeakRetained((id *)&self->_endpoint);
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)logicalDeviceID
{
  return self->_logicalDeviceID;
}

- (NSString)tightSyncID
{
  return self->_tightSyncID;
}

- (BOOL)supportsRapport
{
  return self->_supportsRapport;
}

- (BOOL)isAddedToHomeKit
{
  return self->_isAddedToHomeKit;
}

- (NSString)currentBluetoothListeningMode
{
  return self->_currentBluetoothListeningMode;
}

- (NSArray)availableBluetoothListeningModes
{
  return self->_availableBluetoothListeningModes;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  return self->_supportsHeadTrackedSpatialAudio;
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  return self->_allowsHeadTrackedSpatialAudio;
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  return self->_headTrackedSpatialAudioActive;
}

- (NSString)headTrackedSpatialAudioMode
{
  return self->_headTrackedSpatialAudioMode;
}

- (BOOL)supportsConversationDetection
{
  return self->_supportsConversationDetection;
}

- (BOOL)isConversationDetectionEnabled
{
  return self->_conversationDetectionEnabled;
}

- (BOOL)discoveredOnSameInfra
{
  return self->_discoveredOnSameInfra;
}

- (MRAVOutputDeviceSourceInfo)sourceInfo
{
  return self->_sourceInfo;
}

@end
