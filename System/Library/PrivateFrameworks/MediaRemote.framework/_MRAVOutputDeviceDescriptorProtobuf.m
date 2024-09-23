@implementation _MRAVOutputDeviceDescriptorProtobuf

- (_MRAVOutputDeviceSourceInfoProtobuf)sourceInfo
{
  return self->_sourceInfo;
}

- (NSData)modelSpecificInfoData
{
  return self->_modelSpecificInfoData;
}

- (NSMutableArray)clusterCompositions
{
  return self->_clusterCompositions;
}

- (NSMutableArray)allClusterMembers
{
  return self->_allClusterMembers;
}

- (NSMutableArray)activatedClusterMembers
{
  return self->_activatedClusterMembers;
}

- (void)setVolumeCapabilities:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_volumeCapabilities = a3;
}

- (void)setVolumeMuted:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_volumeMuted = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setTransportType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_transportType = a3;
}

- (void)setSupportsSharePlayHandoff:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_supportsSharePlayHandoff = a3;
}

- (void)setSupportsMultiplayer:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_supportsMultiplayer = a3;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
}

- (void)setRoomID:(id)a3
{
  objc_storeStrong((id *)&self->_roomID, a3);
}

- (void)setProducesLowFidelityAudio:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_producesLowFidelityAudio = a3;
}

- (void)setPlayingPairedDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_playingPairedDeviceName, a3);
}

- (void)setPickable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_pickable = a3;
}

- (void)setParentUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentUniqueIdentifier, a3);
}

- (void)setIsClusterLeader:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_isClusterLeader = a3;
}

- (void)setIsAppleAccessory:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_isAppleAccessory = a3;
}

- (void)setHeadTrackedSpatialAudioMode:(id)a3
{
  objc_storeStrong((id *)&self->_headTrackedSpatialAudioMode, a3);
}

- (void)setDeviceEnclosureColor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceEnclosureColor, a3);
}

- (void)setClusterID:(id)a3
{
  objc_storeStrong((id *)&self->_clusterID, a3);
}

- (void)setAvailableBluetoothListeningModes:(id)a3
{
  objc_storeStrong((id *)&self->_availableBluetoothListeningModes, a3);
}

- (void)setAirPlayGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_airPlayGroupID, a3);
}

- (void)setUsingJSONProtocol:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_usingJSONProtocol = a3;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (void)setSupportsRapportRemoteControlTransport:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_supportsRapportRemoteControlTransport = a3;
}

- (void)setSupportsExternalScreen:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_supportsExternalScreen = a3;
}

- (void)setSupportsBufferedAirPlay:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_supportsBufferedAirPlay = a3;
}

- (void)setSourceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sourceInfo, a3);
}

- (void)setRequiresAuthorization:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_requiresAuthorization = a3;
}

- (void)setPrimaryUID:(id)a3
{
  objc_storeStrong((id *)&self->_primaryUID, a3);
}

- (void)setPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets = a3;
}

- (void)setParentGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentGroupIdentifier, a3);
}

- (void)setParentGroupContainsDiscoverableLeader:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_parentGroupContainsDiscoverableLeader = a3;
}

- (void)setModelSpecificInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_modelSpecificInfoData, a3);
}

- (void)setModelID:(id)a3
{
  objc_storeStrong((id *)&self->_modelID, a3);
}

- (void)setMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_macAddress, a3);
}

- (void)setLogicalDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_logicalDeviceID, a3);
}

- (void)setIsRemoteControllable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_isRemoteControllable = a3;
}

- (void)setIsProxyGroupPlayer:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_isProxyGroupPlayer = a3;
}

- (void)setIsLocalDevice:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_isLocalDevice = a3;
}

- (void)setIsGroupable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_isGroupable = a3;
}

- (void)setIsGroupLeader:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_isGroupLeader = a3;
}

- (void)setIsDeviceGroupable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_isDeviceGroupable = a3;
}

- (void)setIsAirPlayReceiverSessionActive:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_isAirPlayReceiverSessionActive = a3;
}

- (void)setIsAddedToHomeKit:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_isAddedToHomeKit = a3;
}

- (void)setHostDeviceClass:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_hostDeviceClass = a3;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (void)setGroupContainsGroupLeader:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_groupContainsGroupLeader = a3;
}

- (void)setDeviceType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_deviceType = a3;
}

- (void)setDeviceSubType:(int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_deviceSubType = a3;
}

- (void)setCurrentBluetoothListeningMode:(id)a3
{
  objc_storeStrong((id *)&self->_currentBluetoothListeningMode, a3);
}

- (void)setConfiguredClusterSize:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_configuredClusterSize = a3;
}

- (void)setClusterType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_clusterType = a3;
}

- (void)setCanRelayCommunicationChannel:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_canRelayCommunicationChannel = a3;
}

- (void)setCanPlayEncryptedProgressiveDownloadAssets:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_canPlayEncryptedProgressiveDownloadAssets = a3;
}

- (void)setCanFetchMediaDataFromSender:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_canFetchMediaDataFromSender = a3;
}

- (void)setCanAccessiCloudMusicLibrary:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_canAccessiCloudMusicLibrary = a3;
}

- (void)setCanAccessRemoteAssets:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_canAccessRemoteAssets = a3;
}

- (void)setCanAccessAppleMusic:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_canAccessAppleMusic = a3;
}

- (void)setSupportsHAP:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_supportsHAP = a3;
}

- (void)setBluetoothID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothID, a3);
}

- (void)setVolume:(float)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_volume = a3;
}

- (void)setIsVolumeControlAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_isVolumeControlAvailable = a3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setHasVolumeMuted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (void)setHasVolume:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (void)setHasIsVolumeControlAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (int)deviceType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_deviceType;
  else
    return 0;
}

- (BOOL)supportsMultiplayer
{
  return self->_supportsMultiplayer;
}

- (int)transportType
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_transportType;
  else
    return 0;
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (int)deviceSubType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_deviceSubType;
  else
    return 0;
}

- (BOOL)usingJSONProtocol
{
  return self->_usingJSONProtocol;
}

- (BOOL)supportsHAP
{
  return self->_supportsHAP;
}

- (BOOL)supportsBufferedAirPlay
{
  return self->_supportsBufferedAirPlay;
}

- (BOOL)supportsBluetoothSharing
{
  return self->_supportsBluetoothSharing;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
}

- (NSString)parentGroupIdentifier
{
  return self->_parentGroupIdentifier;
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  return self->_parentGroupContainsDiscoverableLeader;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (BOOL)isRemoteControllable
{
  return self->_isRemoteControllable;
}

- (BOOL)isProxyGroupPlayer
{
  return self->_isProxyGroupPlayer;
}

- (BOOL)isGroupable
{
  return self->_isGroupable;
}

- (BOOL)isGroupLeader
{
  return self->_isGroupLeader;
}

- (BOOL)isDeviceGroupable
{
  return self->_isDeviceGroupable;
}

- (BOOL)isAirPlayReceiverSessionActive
{
  return self->_isAirPlayReceiverSessionActive;
}

- (BOOL)isAddedToHomeKit
{
  return self->_isAddedToHomeKit;
}

- (BOOL)hasBatteryLevel
{
  return *(_DWORD *)&self->_has & 1;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (BOOL)groupContainsGroupLeader
{
  return self->_groupContainsGroupLeader;
}

- (BOOL)canRelayCommunicationChannel
{
  return self->_canRelayCommunicationChannel;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return self->_canPlayEncryptedProgressiveDownloadAssets;
}

- (BOOL)canFetchMediaDataFromSender
{
  return self->_canFetchMediaDataFromSender;
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return self->_canAccessiCloudMusicLibrary;
}

- (BOOL)canAccessRemoteAssets
{
  return self->_canAccessRemoteAssets;
}

- (BOOL)canAccessAppleMusic
{
  return self->_canAccessAppleMusic;
}

- (NSString)bluetoothID
{
  return self->_bluetoothID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_roomID, 0);
  objc_storeStrong((id *)&self->_primaryUID, 0);
  objc_storeStrong((id *)&self->_playingPairedDeviceName, 0);
  objc_storeStrong((id *)&self->_parentUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_parentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modelSpecificInfoData, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_logicalDeviceID, 0);
  objc_storeStrong((id *)&self->_headTrackedSpatialAudioMode, 0);
  objc_storeStrong((id *)&self->_groupSessionInfo, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_dnsNames, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_currentBluetoothListeningMode, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_clusterCompositions, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);
  objc_storeStrong((id *)&self->_availableBluetoothListeningModes, 0);
  objc_storeStrong((id *)&self->_allClusterMembers, 0);
  objc_storeStrong((id *)&self->_airPlayGroupID, 0);
  objc_storeStrong((id *)&self->_activatedClusterMembers, 0);
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *name;
  NSString *uniqueIdentifier;
  NSString *groupID;
  NSString *modelID;
  NSData *macAddress;
  $F5690C47DB6193B0809CC40AF9394DD6 has;
  uint64_t v11;
  NSData *modelSpecificInfoData;
  uint64_t v13;
  _MRAVOutputDeviceSourceInfoProtobuf *sourceInfo;
  uint64_t v15;
  NSString *logicalDeviceID;
  uint64_t v17;
  NSString *firmwareVersion;
  uint64_t v19;
  NSString *parentGroupIdentifier;
  uint64_t v21;
  NSString *bluetoothID;
  uint64_t v23;
  NSMutableArray *clusterCompositions;
  uint64_t v25;
  NSString *primaryUID;
  uint64_t v27;
  NSString *currentBluetoothListeningMode;
  NSMutableArray *availableBluetoothListeningModes;
  $F5690C47DB6193B0809CC40AF9394DD6 v30;
  uint64_t v31;
  NSString *airPlayGroupID;
  uint64_t v33;
  NSMutableArray *activatedClusterMembers;
  uint64_t v35;
  NSString *clusterID;
  uint64_t v37;
  NSString *parentUniqueIdentifier;
  NSString *roomID;
  NSString *roomName;
  NSMutableArray *allClusterMembers;
  $F5690C47DB6193B0809CC40AF9394DD6 v42;
  uint64_t v43;
  _MRGroupSessionInfoProtobuf *groupSessionInfo;
  uint64_t v45;
  NSString *deviceEnclosureColor;
  NSString *playingPairedDeviceName;
  $F5690C47DB6193B0809CC40AF9394DD6 v48;
  uint64_t v49;
  NSString *headTrackedSpatialAudioMode;
  NSMutableArray *dnsNames;
  char v52;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_454;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_454;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_454;
  }
  groupID = self->_groupID;
  if ((unint64_t)groupID | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](groupID, "isEqual:"))
      goto LABEL_454;
  }
  modelID = self->_modelID;
  if ((unint64_t)modelID | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](modelID, "isEqual:"))
      goto LABEL_454;
  }
  macAddress = self->_macAddress;
  if ((unint64_t)macAddress | *((_QWORD *)v4 + 21))
  {
    if (!-[NSData isEqual:](macAddress, "isEqual:"))
      goto LABEL_454;
  }
  has = self->_has;
  v11 = *(_QWORD *)(v4 + 324);
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0)
      goto LABEL_454;
    if (self->_canAccessRemoteAssets)
    {
      if (!v4[282])
        goto LABEL_454;
    }
    else if (v4[282])
    {
      goto LABEL_454;
    }
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v11 & 0x100000000) == 0)
      goto LABEL_454;
    if (self->_isRemoteControllable)
    {
      if (!v4[302])
        goto LABEL_454;
    }
    else if (v4[302])
    {
      goto LABEL_454;
    }
  }
  else if ((v11 & 0x100000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v11 & 0x4000000) == 0)
      goto LABEL_454;
    if (self->_isGroupLeader)
    {
      if (!v4[296])
        goto LABEL_454;
    }
    else if (v4[296])
    {
      goto LABEL_454;
    }
  }
  else if ((v11 & 0x4000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v11 & 0x8000000) == 0)
      goto LABEL_454;
    if (self->_isGroupable)
    {
      if (!v4[297])
        goto LABEL_454;
    }
    else if (v4[297])
    {
      goto LABEL_454;
    }
  }
  else if ((v11 & 0x8000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_deviceType != *((_DWORD *)v4 + 25))
      goto LABEL_454;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_deviceSubType != *((_DWORD *)v4 + 24))
      goto LABEL_454;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_454;
  }
  modelSpecificInfoData = self->_modelSpecificInfoData;
  if ((unint64_t)modelSpecificInfoData | *((_QWORD *)v4 + 23))
  {
    if (!-[NSData isEqual:](modelSpecificInfoData, "isEqual:"))
      goto LABEL_454;
    has = self->_has;
  }
  v13 = *(_QWORD *)(v4 + 324);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_batteryLevel != *((float *)v4 + 10))
      goto LABEL_454;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v13 & 0x20000000) == 0)
      goto LABEL_454;
    if (self->_isLocalDevice)
    {
      if (!v4[299])
        goto LABEL_454;
    }
    else if (v4[299])
    {
      goto LABEL_454;
    }
  }
  else if ((v13 & 0x20000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
    if ((v13 & 0x80000000000) == 0)
      goto LABEL_454;
    if (self->_supportsExternalScreen)
    {
      if (!v4[313])
        goto LABEL_454;
    }
    else if (v4[313])
    {
      goto LABEL_454;
    }
  }
  else if ((v13 & 0x80000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v13 & 0x4000000000) == 0)
      goto LABEL_454;
    if (self->_requiresAuthorization)
    {
      if (!v4[308])
        goto LABEL_454;
    }
    else if (v4[308])
    {
      goto LABEL_454;
    }
  }
  else if ((v13 & 0x4000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v13 & 0x8000000000) == 0)
      goto LABEL_454;
    if (self->_shouldForceRemoteControlabillity)
    {
      if (!v4[309])
        goto LABEL_454;
    }
    else if (v4[309])
    {
      goto LABEL_454;
    }
  }
  else if ((v13 & 0x8000000000) != 0)
  {
    goto LABEL_454;
  }
  sourceInfo = self->_sourceInfo;
  if ((unint64_t)sourceInfo | *((_QWORD *)v4 + 31))
  {
    if (!-[_MRAVOutputDeviceSourceInfoProtobuf isEqual:](sourceInfo, "isEqual:"))
      goto LABEL_454;
    has = self->_has;
  }
  v15 = *(_QWORD *)(v4 + 324);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v15 & 0x2000000) == 0)
      goto LABEL_454;
    if (self->_isDeviceGroupable)
    {
      if (!v4[295])
        goto LABEL_454;
    }
    else if (v4[295])
    {
      goto LABEL_454;
    }
  }
  else if ((v15 & 0x2000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0)
      goto LABEL_454;
    if (self->_canRelayCommunicationChannel)
    {
      if (!v4[286])
        goto LABEL_454;
    }
    else if (v4[286])
    {
      goto LABEL_454;
    }
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_454;
  }
  logicalDeviceID = self->_logicalDeviceID;
  if ((unint64_t)logicalDeviceID | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](logicalDeviceID, "isEqual:"))
      goto LABEL_454;
    has = self->_has;
  }
  v17 = *(_QWORD *)(v4 + 324);
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v17 & 0x80000000) == 0)
      goto LABEL_454;
    if (self->_isProxyGroupPlayer)
    {
      if (!v4[301])
        goto LABEL_454;
    }
    else if (v4[301])
    {
      goto LABEL_454;
    }
  }
  else if ((v17 & 0x80000000) != 0)
  {
    goto LABEL_454;
  }
  firmwareVersion = self->_firmwareVersion;
  if ((unint64_t)firmwareVersion | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](firmwareVersion, "isEqual:"))
      goto LABEL_454;
    has = self->_has;
  }
  v19 = *(_QWORD *)(v4 + 324);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0 || self->_volume != *((float *)v4 + 68))
      goto LABEL_454;
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v19 & 0x200000000) == 0)
      goto LABEL_454;
    if (self->_isVolumeControlAvailable)
    {
      if (!v4[303])
        goto LABEL_454;
    }
    else if (v4[303])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x200000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v19 & 0x800) == 0)
      goto LABEL_454;
    if (self->_canAccessAppleMusic)
    {
      if (!v4[281])
        goto LABEL_454;
    }
    else if (v4[281])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x800) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0)
      goto LABEL_454;
    if (self->_canAccessiCloudMusicLibrary)
    {
      if (!v4[283])
        goto LABEL_454;
    }
    else if (v4[283])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v19 & 0x100000) == 0)
      goto LABEL_454;
    if (self->_groupContainsGroupLeader)
    {
      if (!v4[290])
        goto LABEL_454;
    }
    else if (v4[290])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x100000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    if ((v19 & 0x20000000000) == 0)
      goto LABEL_454;
    if (self->_supportsBufferedAirPlay)
    {
      if (!v4[311])
        goto LABEL_454;
    }
    else if (v4[311])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x20000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v19 & 0x8000) == 0)
      goto LABEL_454;
    if (self->_canPlayEncryptedProgressiveDownloadAssets)
    {
      if (!v4[285])
        goto LABEL_454;
    }
    else if (v4[285])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x8000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v19 & 0x4000) == 0)
      goto LABEL_454;
    if (self->_canFetchMediaDataFromSender)
    {
      if (!v4[284])
        goto LABEL_454;
    }
    else if (v4[284])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x4000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v19 & 0x1000000000) == 0)
      goto LABEL_454;
    if (self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets)
    {
      if (!v4[306])
        goto LABEL_454;
    }
    else if (v4[306])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x1000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v19 & 0x400000) == 0)
      goto LABEL_454;
    if (self->_isAirPlayReceiverSessionActive)
    {
      if (!v4[292])
        goto LABEL_454;
    }
    else if (v4[292])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x400000) != 0)
  {
    goto LABEL_454;
  }
  parentGroupIdentifier = self->_parentGroupIdentifier;
  if ((unint64_t)parentGroupIdentifier | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](parentGroupIdentifier, "isEqual:"))
      goto LABEL_454;
    has = self->_has;
  }
  v21 = *(_QWORD *)(v4 + 324);
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v21 & 0x400000000) == 0)
      goto LABEL_454;
    if (self->_parentGroupContainsDiscoverableLeader)
    {
      if (!v4[304])
        goto LABEL_454;
    }
    else if (v4[304])
    {
      goto LABEL_454;
    }
  }
  else if ((v21 & 0x400000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v21 & 0x200000) == 0)
      goto LABEL_454;
    if (self->_isAddedToHomeKit)
    {
      if (!v4[291])
        goto LABEL_454;
    }
    else if (v4[291])
    {
      goto LABEL_454;
    }
  }
  else if ((v21 & 0x200000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v21 & 0x200) == 0 || self->_volumeCapabilities != *((_DWORD *)v4 + 69))
      goto LABEL_454;
  }
  else if ((v21 & 0x200) != 0)
  {
    goto LABEL_454;
  }
  bluetoothID = self->_bluetoothID;
  if ((unint64_t)bluetoothID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](bluetoothID, "isEqual:"))
      goto LABEL_454;
    has = self->_has;
  }
  v23 = *(_QWORD *)(v4 + 324);
  if ((*(_QWORD *)&has & 0x100000000000) != 0)
  {
    if ((v23 & 0x100000000000) == 0)
      goto LABEL_454;
    if (self->_supportsHAP)
    {
      if (!v4[314])
        goto LABEL_454;
    }
    else if (v4[314])
    {
      goto LABEL_454;
    }
  }
  else if ((v23 & 0x100000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&has & 0x4000000000000) != 0)
  {
    if ((v23 & 0x4000000000000) == 0)
      goto LABEL_454;
    if (self->_usingJSONProtocol)
    {
      if (!v4[320])
        goto LABEL_454;
    }
    else if (v4[320])
    {
      goto LABEL_454;
    }
  }
  else if ((v23 & 0x4000000000000) != 0)
  {
    goto LABEL_454;
  }
  clusterCompositions = self->_clusterCompositions;
  if ((unint64_t)clusterCompositions | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](clusterCompositions, "isEqual:"))
      goto LABEL_454;
    has = self->_has;
  }
  v25 = *(_QWORD *)(v4 + 324);
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_clusterType != *((_DWORD *)v4 + 18))
      goto LABEL_454;
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_454;
  }
  primaryUID = self->_primaryUID;
  if ((unint64_t)primaryUID | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](primaryUID, "isEqual:"))
      goto LABEL_454;
    has = self->_has;
  }
  v27 = *(_QWORD *)(v4 + 324);
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v27 & 4) == 0 || self->_configuredClusterSize != *((_DWORD *)v4 + 19))
      goto LABEL_454;
  }
  else if ((v27 & 4) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    if ((v27 & 0x1000000000000) == 0)
      goto LABEL_454;
    if (self->_supportsRapportRemoteControlTransport)
    {
      if (!v4[318])
        goto LABEL_454;
    }
    else if (v4[318])
    {
      goto LABEL_454;
    }
  }
  else if ((v27 & 0x1000000000000) != 0)
  {
    goto LABEL_454;
  }
  currentBluetoothListeningMode = self->_currentBluetoothListeningMode;
  if ((unint64_t)currentBluetoothListeningMode | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](currentBluetoothListeningMode, "isEqual:"))
  {
    goto LABEL_454;
  }
  availableBluetoothListeningModes = self->_availableBluetoothListeningModes;
  if ((unint64_t)availableBluetoothListeningModes | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](availableBluetoothListeningModes, "isEqual:"))
      goto LABEL_454;
  }
  v30 = self->_has;
  v31 = *(_QWORD *)(v4 + 324);
  if ((*(_QWORD *)&v30 & 0x400000000000) != 0)
  {
    if ((v31 & 0x400000000000) == 0)
      goto LABEL_454;
    if (self->_supportsMultiplayer)
    {
      if (!v4[316])
        goto LABEL_454;
    }
    else if (v4[316])
    {
      goto LABEL_454;
    }
  }
  else if ((v31 & 0x400000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&v30 & 0x2000000000) != 0)
  {
    if ((v31 & 0x2000000000) == 0)
      goto LABEL_454;
    if (self->_producesLowFidelityAudio)
    {
      if (!v4[307])
        goto LABEL_454;
    }
    else if (v4[307])
    {
      goto LABEL_454;
    }
  }
  else if ((v31 & 0x2000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_BYTE *)&v30 & 0x40) != 0)
  {
    if ((v31 & 0x40) == 0 || self->_hostDeviceClass != *((_DWORD *)v4 + 38))
      goto LABEL_454;
  }
  else if ((v31 & 0x40) != 0)
  {
    goto LABEL_454;
  }
  airPlayGroupID = self->_airPlayGroupID;
  if ((unint64_t)airPlayGroupID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](airPlayGroupID, "isEqual:"))
      goto LABEL_454;
    v30 = self->_has;
  }
  v33 = *(_QWORD *)(v4 + 324);
  if ((*(_QWORD *)&v30 & 0x2000000000000) != 0)
  {
    if ((v33 & 0x2000000000000) == 0)
      goto LABEL_454;
    if (self->_supportsSharePlayHandoff)
    {
      if (!v4[319])
        goto LABEL_454;
    }
    else if (v4[319])
    {
      goto LABEL_454;
    }
  }
  else if ((v33 & 0x2000000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_BYTE *)&v30 & 0x20) != 0)
  {
    if ((v33 & 0x20) == 0 || self->_distance != *((float *)v4 + 26))
      goto LABEL_454;
  }
  else if ((v33 & 0x20) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v30 & 0x40000) != 0)
  {
    if ((v33 & 0x40000) == 0)
      goto LABEL_454;
    if (self->_discoveredOnSameInfra)
    {
      if (!v4[288])
        goto LABEL_454;
    }
    else if (v4[288])
    {
      goto LABEL_454;
    }
  }
  else if ((v33 & 0x40000) != 0)
  {
    goto LABEL_454;
  }
  activatedClusterMembers = self->_activatedClusterMembers;
  if ((unint64_t)activatedClusterMembers | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](activatedClusterMembers, "isEqual:"))
      goto LABEL_454;
    v30 = self->_has;
  }
  v35 = *(_QWORD *)(v4 + 324);
  if ((*(_QWORD *)&v30 & 0x800000000) != 0)
  {
    if ((v35 & 0x800000000) == 0)
      goto LABEL_454;
    if (self->_pickable)
    {
      if (!v4[305])
        goto LABEL_454;
    }
    else if (v4[305])
    {
      goto LABEL_454;
    }
  }
  else if ((v35 & 0x800000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_BYTE *)&v30 & 0x80) != 0)
  {
    if ((v35 & 0x80) == 0 || self->_transportType != *((_DWORD *)v4 + 64))
      goto LABEL_454;
  }
  else if ((v35 & 0x80) != 0)
  {
    goto LABEL_454;
  }
  clusterID = self->_clusterID;
  if ((unint64_t)clusterID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](clusterID, "isEqual:"))
      goto LABEL_454;
    v30 = self->_has;
  }
  v37 = *(_QWORD *)(v4 + 324);
  if ((*(_DWORD *)&v30 & 0x1000000) != 0)
  {
    if ((v37 & 0x1000000) == 0)
      goto LABEL_454;
    if (self->_isClusterLeader)
    {
      if (!v4[294])
        goto LABEL_454;
    }
    else if (v4[294])
    {
      goto LABEL_454;
    }
  }
  else if ((v37 & 0x1000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v30 & 0x800000) != 0)
  {
    if ((v37 & 0x800000) == 0)
      goto LABEL_454;
    if (self->_isAppleAccessory)
    {
      if (!v4[293])
        goto LABEL_454;
    }
    else if (v4[293])
    {
      goto LABEL_454;
    }
  }
  else if ((v37 & 0x800000) != 0)
  {
    goto LABEL_454;
  }
  parentUniqueIdentifier = self->_parentUniqueIdentifier;
  if ((unint64_t)parentUniqueIdentifier | *((_QWORD *)v4 + 26)
    && !-[NSString isEqual:](parentUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_454;
  }
  roomID = self->_roomID;
  if ((unint64_t)roomID | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](roomID, "isEqual:"))
      goto LABEL_454;
  }
  roomName = self->_roomName;
  if ((unint64_t)roomName | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](roomName, "isEqual:"))
      goto LABEL_454;
  }
  allClusterMembers = self->_allClusterMembers;
  if ((unint64_t)allClusterMembers | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](allClusterMembers, "isEqual:"))
      goto LABEL_454;
  }
  v42 = self->_has;
  v43 = *(_QWORD *)(v4 + 324);
  if ((*(_QWORD *)&v42 & 0x40000000000) != 0)
  {
    if ((v43 & 0x40000000000) == 0)
      goto LABEL_454;
    if (self->_supportsConversationDetection)
    {
      if (!v4[312])
        goto LABEL_454;
    }
    else if (v4[312])
    {
      goto LABEL_454;
    }
  }
  else if ((v43 & 0x40000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v42 & 0x20000) != 0)
  {
    if ((v43 & 0x20000) == 0)
      goto LABEL_454;
    if (self->_conversationDetectionEnabled)
    {
      if (!v4[287])
        goto LABEL_454;
    }
    else if (v4[287])
    {
      goto LABEL_454;
    }
  }
  else if ((v43 & 0x20000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v42 & 0x80000) != 0)
  {
    if ((v43 & 0x80000) == 0)
      goto LABEL_454;
    if (self->_engageOnClusterActivate)
    {
      if (!v4[289])
        goto LABEL_454;
    }
    else if (v4[289])
    {
      goto LABEL_454;
    }
  }
  else if ((v43 & 0x80000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&v42 & 0x8000000000000) != 0)
  {
    if ((v43 & 0x8000000000000) == 0)
      goto LABEL_454;
    if (self->_volumeMuted)
    {
      if (!v4[321])
        goto LABEL_454;
    }
    else if (v4[321])
    {
      goto LABEL_454;
    }
  }
  else if ((v43 & 0x8000000000000) != 0)
  {
    goto LABEL_454;
  }
  groupSessionInfo = self->_groupSessionInfo;
  if ((unint64_t)groupSessionInfo | *((_QWORD *)v4 + 17))
  {
    if (!-[_MRGroupSessionInfoProtobuf isEqual:](groupSessionInfo, "isEqual:"))
      goto LABEL_454;
    v42 = self->_has;
  }
  v45 = *(_QWORD *)(v4 + 324);
  if ((*(_QWORD *)&v42 & 0x10000000000) != 0)
  {
    if ((v45 & 0x10000000000) == 0)
      goto LABEL_454;
    if (self->_supportsBluetoothSharing)
    {
      if (!v4[310])
        goto LABEL_454;
    }
    else if (v4[310])
    {
      goto LABEL_454;
    }
  }
  else if ((v45 & 0x10000000000) != 0)
  {
    goto LABEL_454;
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if ((unint64_t)deviceEnclosureColor | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](deviceEnclosureColor, "isEqual:"))
  {
    goto LABEL_454;
  }
  playingPairedDeviceName = self->_playingPairedDeviceName;
  if ((unint64_t)playingPairedDeviceName | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](playingPairedDeviceName, "isEqual:"))
      goto LABEL_454;
  }
  v48 = self->_has;
  v49 = *(_QWORD *)(v4 + 324);
  if ((*(_QWORD *)&v48 & 0x800000000000) != 0)
  {
    if ((v49 & 0x800000000000) == 0)
      goto LABEL_454;
    if (self->_supportsRapport)
    {
      if (!v4[317])
        goto LABEL_454;
    }
    else if (v4[317])
    {
      goto LABEL_454;
    }
  }
  else if ((v49 & 0x800000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v48 & 0x40000000) != 0)
  {
    if ((v49 & 0x40000000) == 0)
      goto LABEL_454;
    if (self->_isPickedOnPairedDevice)
    {
      if (!v4[300])
        goto LABEL_454;
    }
    else if (v4[300])
    {
      goto LABEL_454;
    }
  }
  else if ((v49 & 0x40000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_QWORD *)&v48 & 0x200000000000) != 0)
  {
    if ((v49 & 0x200000000000) == 0)
      goto LABEL_454;
    if (self->_supportsHeadTrackedSpatialAudio)
    {
      if (!v4[315])
        goto LABEL_454;
    }
    else if (v4[315])
    {
      goto LABEL_454;
    }
  }
  else if ((v49 & 0x200000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&v48 & 0x400) != 0)
  {
    if ((v49 & 0x400) == 0)
      goto LABEL_454;
    if (self->_allowsHeadTrackedSpatialAudio)
    {
      if (!v4[280])
        goto LABEL_454;
    }
    else if (v4[280])
    {
      goto LABEL_454;
    }
  }
  else if ((v49 & 0x400) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v48 & 0x10000000) == 0)
  {
    if ((v49 & 0x10000000) == 0)
      goto LABEL_450;
LABEL_454:
    v52 = 0;
    goto LABEL_455;
  }
  if ((v49 & 0x10000000) == 0)
    goto LABEL_454;
  if (self->_isHeadTrackedSpatialAudioActive)
  {
    if (!v4[298])
      goto LABEL_454;
  }
  else if (v4[298])
  {
    goto LABEL_454;
  }
LABEL_450:
  headTrackedSpatialAudioMode = self->_headTrackedSpatialAudioMode;
  if ((unint64_t)headTrackedSpatialAudioMode | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](headTrackedSpatialAudioMode, "isEqual:"))
  {
    goto LABEL_454;
  }
  dnsNames = self->_dnsNames;
  if ((unint64_t)dnsNames | *((_QWORD *)v4 + 14))
    v52 = -[NSMutableArray isEqual:](dnsNames, "isEqual:");
  else
    v52 = 1;
LABEL_455:

  return v52;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  $F5690C47DB6193B0809CC40AF9394DD6 has;
  uint64_t v17;
  void *v18;
  $F5690C47DB6193B0809CC40AF9394DD6 v19;
  id v20;
  void *v21;
  $F5690C47DB6193B0809CC40AF9394DD6 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  $F5690C47DB6193B0809CC40AF9394DD6 v27;
  uint64_t v28;
  void *v29;
  $F5690C47DB6193B0809CC40AF9394DD6 v30;
  uint64_t v31;
  void *v32;
  $F5690C47DB6193B0809CC40AF9394DD6 v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  $F5690C47DB6193B0809CC40AF9394DD6 v42;
  uint64_t v43;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  $F5690C47DB6193B0809CC40AF9394DD6 v51;
  uint64_t v52;
  void *v53;
  $F5690C47DB6193B0809CC40AF9394DD6 v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  $F5690C47DB6193B0809CC40AF9394DD6 v61;
  uint64_t v62;
  void *v63;
  $F5690C47DB6193B0809CC40AF9394DD6 v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  NSMutableArray *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  $F5690C47DB6193B0809CC40AF9394DD6 v77;
  id v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  $F5690C47DB6193B0809CC40AF9394DD6 v84;
  uint64_t v85;
  void *v86;
  NSMutableArray *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v93;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v6;

  v8 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v8;

  v10 = -[NSString copyWithZone:](self->_groupID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v10;

  v12 = -[NSString copyWithZone:](self->_modelID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v12;

  v14 = -[NSData copyWithZone:](self->_macAddress, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v14;

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    *(_BYTE *)(v5 + 282) = self->_canAccessRemoteAssets;
    *(_QWORD *)(v5 + 324) |= 0x1000uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_4;
      goto LABEL_112;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 302) = self->_isRemoteControllable;
  *(_QWORD *)(v5 + 324) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_5;
    goto LABEL_113;
  }
LABEL_112:
  *(_BYTE *)(v5 + 296) = self->_isGroupLeader;
  *(_QWORD *)(v5 + 324) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_114;
  }
LABEL_113:
  *(_BYTE *)(v5 + 297) = self->_isGroupable;
  *(_QWORD *)(v5 + 324) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_114:
  *(_DWORD *)(v5 + 100) = self->_deviceType;
  *(_QWORD *)(v5 + 324) |= 0x10uLL;
  if ((*(_QWORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 96) = self->_deviceSubType;
    *(_QWORD *)(v5 + 324) |= 8uLL;
  }
LABEL_8:
  v17 = -[NSData copyWithZone:](self->_modelSpecificInfoData, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v17;

  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 1) != 0)
  {
    *(float *)(v5 + 40) = self->_batteryLevel;
    *(_QWORD *)(v5 + 324) |= 1uLL;
    v19 = self->_has;
    if ((*(_DWORD *)&v19 & 0x20000000) == 0)
    {
LABEL_10:
      if ((*(_QWORD *)&v19 & 0x80000000000) == 0)
        goto LABEL_11;
      goto LABEL_118;
    }
  }
  else if ((*(_DWORD *)&v19 & 0x20000000) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 299) = self->_isLocalDevice;
  *(_QWORD *)(v5 + 324) |= 0x20000000uLL;
  v19 = self->_has;
  if ((*(_QWORD *)&v19 & 0x80000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&v19 & 0x4000000000) == 0)
      goto LABEL_12;
    goto LABEL_119;
  }
LABEL_118:
  *(_BYTE *)(v5 + 313) = self->_supportsExternalScreen;
  *(_QWORD *)(v5 + 324) |= 0x80000000000uLL;
  v19 = self->_has;
  if ((*(_QWORD *)&v19 & 0x4000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&v19 & 0x8000000000) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_119:
  *(_BYTE *)(v5 + 308) = self->_requiresAuthorization;
  *(_QWORD *)(v5 + 324) |= 0x4000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
  {
LABEL_13:
    *(_BYTE *)(v5 + 309) = self->_shouldForceRemoteControlabillity;
    *(_QWORD *)(v5 + 324) |= 0x8000000000uLL;
  }
LABEL_14:
  v20 = -[_MRAVOutputDeviceSourceInfoProtobuf copyWithZone:](self->_sourceInfo, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v20;

  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x2000000) != 0)
  {
    *(_BYTE *)(v5 + 295) = self->_isDeviceGroupable;
    *(_QWORD *)(v5 + 324) |= 0x2000000uLL;
    v22 = self->_has;
  }
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
    *(_BYTE *)(v5 + 286) = self->_canRelayCommunicationChannel;
    *(_QWORD *)(v5 + 324) |= 0x10000uLL;
  }
  v23 = -[NSString copyWithZone:](self->_logicalDeviceID, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v23;

  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 301) = self->_isProxyGroupPlayer;
    *(_QWORD *)(v5 + 324) |= 0x80000000uLL;
  }
  v25 = -[NSString copyWithZone:](self->_firmwareVersion, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v25;

  v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x100) != 0)
  {
    *(float *)(v5 + 272) = self->_volume;
    *(_QWORD *)(v5 + 324) |= 0x100uLL;
    v27 = self->_has;
    if ((*(_QWORD *)&v27 & 0x200000000) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v27 & 0x800) == 0)
        goto LABEL_23;
      goto LABEL_123;
    }
  }
  else if ((*(_QWORD *)&v27 & 0x200000000) == 0)
  {
    goto LABEL_22;
  }
  *(_BYTE *)(v5 + 303) = self->_isVolumeControlAvailable;
  *(_QWORD *)(v5 + 324) |= 0x200000000uLL;
  v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v27 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_124;
  }
LABEL_123:
  *(_BYTE *)(v5 + 281) = self->_canAccessAppleMusic;
  *(_QWORD *)(v5 + 324) |= 0x800uLL;
  v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v27 & 0x100000) == 0)
      goto LABEL_25;
    goto LABEL_125;
  }
LABEL_124:
  *(_BYTE *)(v5 + 283) = self->_canAccessiCloudMusicLibrary;
  *(_QWORD *)(v5 + 324) |= 0x2000uLL;
  v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x100000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&v27 & 0x20000000000) == 0)
      goto LABEL_26;
    goto LABEL_126;
  }
LABEL_125:
  *(_BYTE *)(v5 + 290) = self->_groupContainsGroupLeader;
  *(_QWORD *)(v5 + 324) |= 0x100000uLL;
  v27 = self->_has;
  if ((*(_QWORD *)&v27 & 0x20000000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v27 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_127;
  }
LABEL_126:
  *(_BYTE *)(v5 + 311) = self->_supportsBufferedAirPlay;
  *(_QWORD *)(v5 + 324) |= 0x20000000000uLL;
  v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v27 & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_128;
  }
LABEL_127:
  *(_BYTE *)(v5 + 285) = self->_canPlayEncryptedProgressiveDownloadAssets;
  *(_QWORD *)(v5 + 324) |= 0x8000uLL;
  v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&v27 & 0x1000000000) == 0)
      goto LABEL_29;
    goto LABEL_129;
  }
LABEL_128:
  *(_BYTE *)(v5 + 284) = self->_canFetchMediaDataFromSender;
  *(_QWORD *)(v5 + 324) |= 0x4000uLL;
  v27 = self->_has;
  if ((*(_QWORD *)&v27 & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v27 & 0x400000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_129:
  *(_BYTE *)(v5 + 306) = self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
  *(_QWORD *)(v5 + 324) |= 0x1000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_30:
    *(_BYTE *)(v5 + 292) = self->_isAirPlayReceiverSessionActive;
    *(_QWORD *)(v5 + 324) |= 0x400000uLL;
  }
LABEL_31:
  v28 = -[NSString copyWithZone:](self->_parentGroupIdentifier, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v28;

  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x400000000) != 0)
  {
    *(_BYTE *)(v5 + 304) = self->_parentGroupContainsDiscoverableLeader;
    *(_QWORD *)(v5 + 324) |= 0x400000000uLL;
    v30 = self->_has;
    if ((*(_DWORD *)&v30 & 0x200000) == 0)
    {
LABEL_33:
      if ((*(_WORD *)&v30 & 0x200) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&v30 & 0x200000) == 0)
  {
    goto LABEL_33;
  }
  *(_BYTE *)(v5 + 291) = self->_isAddedToHomeKit;
  *(_QWORD *)(v5 + 324) |= 0x200000uLL;
  if ((*(_QWORD *)&self->_has & 0x200) != 0)
  {
LABEL_34:
    *(_DWORD *)(v5 + 276) = self->_volumeCapabilities;
    *(_QWORD *)(v5 + 324) |= 0x200uLL;
  }
LABEL_35:
  v31 = -[NSString copyWithZone:](self->_bluetoothID, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v31;

  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x100000000000) != 0)
  {
    *(_BYTE *)(v5 + 314) = self->_supportsHAP;
    *(_QWORD *)(v5 + 324) |= 0x100000000000uLL;
    v33 = self->_has;
  }
  if ((*(_QWORD *)&v33 & 0x4000000000000) != 0)
  {
    *(_BYTE *)(v5 + 320) = self->_usingJSONProtocol;
    *(_QWORD *)(v5 + 324) |= 0x4000000000000uLL;
  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v34 = self->_clusterCompositions;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v112;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v112 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * v38), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addClusterComposition:", v39);

        ++v38;
      }
      while (v36 != v38);
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
    }
    while (v36);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_clusterType;
    *(_QWORD *)(v5 + 324) |= 2uLL;
  }
  v40 = -[NSString copyWithZone:](self->_primaryUID, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v40;

  v42 = self->_has;
  if ((*(_BYTE *)&v42 & 4) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_configuredClusterSize;
    *(_QWORD *)(v5 + 324) |= 4uLL;
    v42 = self->_has;
  }
  if ((*(_QWORD *)&v42 & 0x1000000000000) != 0)
  {
    *(_BYTE *)(v5 + 318) = self->_supportsRapportRemoteControlTransport;
    *(_QWORD *)(v5 + 324) |= 0x1000000000000uLL;
  }
  v43 = -[NSString copyWithZone:](self->_currentBluetoothListeningMode, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v43;

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v45 = self->_availableBluetoothListeningModes;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v108;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v108 != v48)
          objc_enumerationMutation(v45);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * v49), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAvailableBluetoothListeningModes:", v50);

        ++v49;
      }
      while (v47 != v49);
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
    }
    while (v47);
  }

  v51 = self->_has;
  if ((*(_QWORD *)&v51 & 0x400000000000) != 0)
  {
    *(_BYTE *)(v5 + 316) = self->_supportsMultiplayer;
    *(_QWORD *)(v5 + 324) |= 0x400000000000uLL;
    v51 = self->_has;
    if ((*(_QWORD *)&v51 & 0x2000000000) == 0)
    {
LABEL_61:
      if ((*(_BYTE *)&v51 & 0x40) == 0)
        goto LABEL_63;
      goto LABEL_62;
    }
  }
  else if ((*(_QWORD *)&v51 & 0x2000000000) == 0)
  {
    goto LABEL_61;
  }
  *(_BYTE *)(v5 + 307) = self->_producesLowFidelityAudio;
  *(_QWORD *)(v5 + 324) |= 0x2000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
  {
LABEL_62:
    *(_DWORD *)(v5 + 152) = self->_hostDeviceClass;
    *(_QWORD *)(v5 + 324) |= 0x40uLL;
  }
LABEL_63:
  v52 = -[NSString copyWithZone:](self->_airPlayGroupID, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v52;

  v54 = self->_has;
  if ((*(_QWORD *)&v54 & 0x2000000000000) != 0)
  {
    *(_BYTE *)(v5 + 319) = self->_supportsSharePlayHandoff;
    *(_QWORD *)(v5 + 324) |= 0x2000000000000uLL;
    v54 = self->_has;
    if ((*(_BYTE *)&v54 & 0x20) == 0)
    {
LABEL_65:
      if ((*(_DWORD *)&v54 & 0x40000) == 0)
        goto LABEL_67;
      goto LABEL_66;
    }
  }
  else if ((*(_BYTE *)&v54 & 0x20) == 0)
  {
    goto LABEL_65;
  }
  *(float *)(v5 + 104) = self->_distance;
  *(_QWORD *)(v5 + 324) |= 0x20uLL;
  if ((*(_QWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_66:
    *(_BYTE *)(v5 + 288) = self->_discoveredOnSameInfra;
    *(_QWORD *)(v5 + 324) |= 0x40000uLL;
  }
LABEL_67:
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v55 = self->_activatedClusterMembers;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v104;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v104 != v58)
          objc_enumerationMutation(v55);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v59), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addActivatedClusterMembers:", v60);

        ++v59;
      }
      while (v57 != v59);
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
    }
    while (v57);
  }

  v61 = self->_has;
  if ((*(_QWORD *)&v61 & 0x800000000) != 0)
  {
    *(_BYTE *)(v5 + 305) = self->_pickable;
    *(_QWORD *)(v5 + 324) |= 0x800000000uLL;
    v61 = self->_has;
  }
  if ((*(_BYTE *)&v61 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_transportType;
    *(_QWORD *)(v5 + 324) |= 0x80uLL;
  }
  v62 = -[NSString copyWithZone:](self->_clusterID, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v62;

  v64 = self->_has;
  if ((*(_DWORD *)&v64 & 0x1000000) != 0)
  {
    *(_BYTE *)(v5 + 294) = self->_isClusterLeader;
    *(_QWORD *)(v5 + 324) |= 0x1000000uLL;
    v64 = self->_has;
  }
  if ((*(_DWORD *)&v64 & 0x800000) != 0)
  {
    *(_BYTE *)(v5 + 293) = self->_isAppleAccessory;
    *(_QWORD *)(v5 + 324) |= 0x800000uLL;
  }
  v65 = -[NSString copyWithZone:](self->_parentUniqueIdentifier, "copyWithZone:", a3);
  v66 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v65;

  v67 = -[NSString copyWithZone:](self->_roomID, "copyWithZone:", a3);
  v68 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v67;

  v69 = -[NSString copyWithZone:](self->_roomName, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v69;

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v71 = self->_allClusterMembers;
  v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v100;
    do
    {
      v75 = 0;
      do
      {
        if (*(_QWORD *)v100 != v74)
          objc_enumerationMutation(v71);
        v76 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v75), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllClusterMembers:", v76);

        ++v75;
      }
      while (v73 != v75);
      v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
    }
    while (v73);
  }

  v77 = self->_has;
  if ((*(_QWORD *)&v77 & 0x40000000000) != 0)
  {
    *(_BYTE *)(v5 + 312) = self->_supportsConversationDetection;
    *(_QWORD *)(v5 + 324) |= 0x40000000000uLL;
    v77 = self->_has;
    if ((*(_DWORD *)&v77 & 0x20000) == 0)
    {
LABEL_91:
      if ((*(_DWORD *)&v77 & 0x80000) == 0)
        goto LABEL_92;
      goto LABEL_142;
    }
  }
  else if ((*(_DWORD *)&v77 & 0x20000) == 0)
  {
    goto LABEL_91;
  }
  *(_BYTE *)(v5 + 287) = self->_conversationDetectionEnabled;
  *(_QWORD *)(v5 + 324) |= 0x20000uLL;
  v77 = self->_has;
  if ((*(_DWORD *)&v77 & 0x80000) == 0)
  {
LABEL_92:
    if ((*(_QWORD *)&v77 & 0x8000000000000) == 0)
      goto LABEL_94;
    goto LABEL_93;
  }
LABEL_142:
  *(_BYTE *)(v5 + 289) = self->_engageOnClusterActivate;
  *(_QWORD *)(v5 + 324) |= 0x80000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
  {
LABEL_93:
    *(_BYTE *)(v5 + 321) = self->_volumeMuted;
    *(_QWORD *)(v5 + 324) |= 0x8000000000000uLL;
  }
LABEL_94:
  v78 = -[_MRGroupSessionInfoProtobuf copyWithZone:](self->_groupSessionInfo, "copyWithZone:", a3);
  v79 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v78;

  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
  {
    *(_BYTE *)(v5 + 310) = self->_supportsBluetoothSharing;
    *(_QWORD *)(v5 + 324) |= 0x10000000000uLL;
  }
  v80 = -[NSString copyWithZone:](self->_deviceEnclosureColor, "copyWithZone:", a3);
  v81 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v80;

  v82 = -[NSString copyWithZone:](self->_playingPairedDeviceName, "copyWithZone:", a3);
  v83 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v82;

  v84 = self->_has;
  if ((*(_QWORD *)&v84 & 0x800000000000) != 0)
  {
    *(_BYTE *)(v5 + 317) = self->_supportsRapport;
    *(_QWORD *)(v5 + 324) |= 0x800000000000uLL;
    v84 = self->_has;
    if ((*(_DWORD *)&v84 & 0x40000000) == 0)
    {
LABEL_98:
      if ((*(_QWORD *)&v84 & 0x200000000000) == 0)
        goto LABEL_99;
      goto LABEL_146;
    }
  }
  else if ((*(_DWORD *)&v84 & 0x40000000) == 0)
  {
    goto LABEL_98;
  }
  *(_BYTE *)(v5 + 300) = self->_isPickedOnPairedDevice;
  *(_QWORD *)(v5 + 324) |= 0x40000000uLL;
  v84 = self->_has;
  if ((*(_QWORD *)&v84 & 0x200000000000) == 0)
  {
LABEL_99:
    if ((*(_WORD *)&v84 & 0x400) == 0)
      goto LABEL_100;
    goto LABEL_147;
  }
LABEL_146:
  *(_BYTE *)(v5 + 315) = self->_supportsHeadTrackedSpatialAudio;
  *(_QWORD *)(v5 + 324) |= 0x200000000000uLL;
  v84 = self->_has;
  if ((*(_WORD *)&v84 & 0x400) == 0)
  {
LABEL_100:
    if ((*(_DWORD *)&v84 & 0x10000000) == 0)
      goto LABEL_102;
    goto LABEL_101;
  }
LABEL_147:
  *(_BYTE *)(v5 + 280) = self->_allowsHeadTrackedSpatialAudio;
  *(_QWORD *)(v5 + 324) |= 0x400uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_101:
    *(_BYTE *)(v5 + 298) = self->_isHeadTrackedSpatialAudioActive;
    *(_QWORD *)(v5 + 324) |= 0x10000000uLL;
  }
LABEL_102:
  v85 = -[NSString copyWithZone:](self->_headTrackedSpatialAudioMode, "copyWithZone:", a3);
  v86 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v85;

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v87 = self->_dnsNames;
  v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v96;
    do
    {
      v91 = 0;
      do
      {
        if (*(_QWORD *)v96 != v90)
          objc_enumerationMutation(v87);
        v92 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v91), "copyWithZone:", a3, (_QWORD)v95);
        objc_msgSend((id)v5, "addDnsNames:", v92);

        ++v91;
      }
      while (v89 != v91);
      v89 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
    }
    while (v89);
  }

  v93 = (id)v5;
  return v93;
}

- (void)addAvailableBluetoothListeningModes:(id)a3
{
  id v4;
  NSMutableArray *availableBluetoothListeningModes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  availableBluetoothListeningModes = self->_availableBluetoothListeningModes;
  v8 = v4;
  if (!availableBluetoothListeningModes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_availableBluetoothListeningModes;
    self->_availableBluetoothListeningModes = v6;

    v4 = v8;
    availableBluetoothListeningModes = self->_availableBluetoothListeningModes;
  }
  -[NSMutableArray addObject:](availableBluetoothListeningModes, "addObject:", v4);

}

- (void)writeTo:(id)a3
{
  id v4;
  $F5690C47DB6193B0809CC40AF9394DD6 has;
  $F5690C47DB6193B0809CC40AF9394DD6 v6;
  $F5690C47DB6193B0809CC40AF9394DD6 v7;
  $F5690C47DB6193B0809CC40AF9394DD6 v8;
  $F5690C47DB6193B0809CC40AF9394DD6 v9;
  $F5690C47DB6193B0809CC40AF9394DD6 v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  $F5690C47DB6193B0809CC40AF9394DD6 v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  $F5690C47DB6193B0809CC40AF9394DD6 v22;
  $F5690C47DB6193B0809CC40AF9394DD6 v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  $F5690C47DB6193B0809CC40AF9394DD6 v29;
  $F5690C47DB6193B0809CC40AF9394DD6 v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  $F5690C47DB6193B0809CC40AF9394DD6 v36;
  $F5690C47DB6193B0809CC40AF9394DD6 v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_uniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_groupID)
    PBDataWriterWriteStringField();
  if (self->_modelID)
    PBDataWriterWriteStringField();
  if (self->_macAddress)
    PBDataWriterWriteDataField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_14;
      goto LABEL_156;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_158:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 8) != 0)
LABEL_17:
    PBDataWriterWriteInt32Field();
LABEL_18:
  if (self->_modelSpecificInfoData)
    PBDataWriterWriteDataField();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
    {
LABEL_22:
      if ((*(_QWORD *)&v6 & 0x80000000000) == 0)
        goto LABEL_23;
      goto LABEL_162;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteBOOLField();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x80000000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
      goto LABEL_24;
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteBOOLField();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&v6 & 0x8000000000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_163:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
LABEL_25:
    PBDataWriterWriteBOOLField();
LABEL_26:
  if (self->_sourceInfo)
    PBDataWriterWriteSubmessage();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_logicalDeviceID)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_firmwareVersion)
    PBDataWriterWriteStringField();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    PBDataWriterWriteFloatField();
    v8 = self->_has;
    if ((*(_QWORD *)&v8 & 0x200000000) == 0)
    {
LABEL_40:
      if ((*(_WORD *)&v8 & 0x800) == 0)
        goto LABEL_41;
      goto LABEL_167;
    }
  }
  else if ((*(_QWORD *)&v8 & 0x200000000) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteBOOLField();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v8 & 0x2000) == 0)
      goto LABEL_42;
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteBOOLField();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v8 & 0x100000) == 0)
      goto LABEL_43;
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteBOOLField();
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&v8 & 0x20000000000) == 0)
      goto LABEL_44;
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteBOOLField();
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x20000000000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v8 & 0x8000) == 0)
      goto LABEL_45;
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteBOOLField();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v8 & 0x4000) == 0)
      goto LABEL_46;
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteBOOLField();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&v8 & 0x1000000000) == 0)
      goto LABEL_47;
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteBOOLField();
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x1000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_173:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
LABEL_48:
    PBDataWriterWriteBOOLField();
LABEL_49:
  if (self->_parentGroupIdentifier)
    PBDataWriterWriteStringField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x400000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x200000) == 0)
    {
LABEL_53:
      if ((*(_WORD *)&v9 & 0x200) == 0)
        goto LABEL_55;
      goto LABEL_54;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
    goto LABEL_53;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x200) != 0)
LABEL_54:
    PBDataWriterWriteInt32Field();
LABEL_55:
  if (self->_bluetoothID)
    PBDataWriterWriteStringField();
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x100000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_has;
  }
  if ((*(_QWORD *)&v10 & 0x4000000000000) != 0)
    PBDataWriterWriteBOOLField();
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v11 = self->_clusterCompositions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v60;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v13);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_primaryUID)
    PBDataWriterWriteStringField();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v16 = self->_has;
  }
  if ((*(_QWORD *)&v16 & 0x1000000000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_currentBluetoothListeningMode)
    PBDataWriterWriteStringField();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v17 = self->_availableBluetoothListeningModes;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v56;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v56 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteStringField();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v19);
  }

  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x400000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v22 = self->_has;
    if ((*(_QWORD *)&v22 & 0x2000000000) == 0)
    {
LABEL_87:
      if ((*(_BYTE *)&v22 & 0x40) == 0)
        goto LABEL_89;
      goto LABEL_88;
    }
  }
  else if ((*(_QWORD *)&v22 & 0x2000000000) == 0)
  {
    goto LABEL_87;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
LABEL_88:
    PBDataWriterWriteInt32Field();
LABEL_89:
  if (self->_airPlayGroupID)
    PBDataWriterWriteStringField();
  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x2000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v23 = self->_has;
    if ((*(_BYTE *)&v23 & 0x20) == 0)
    {
LABEL_93:
      if ((*(_DWORD *)&v23 & 0x40000) == 0)
        goto LABEL_95;
      goto LABEL_94;
    }
  }
  else if ((*(_BYTE *)&v23 & 0x20) == 0)
  {
    goto LABEL_93;
  }
  PBDataWriterWriteFloatField();
  if ((*(_QWORD *)&self->_has & 0x40000) != 0)
LABEL_94:
    PBDataWriterWriteBOOLField();
LABEL_95:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v24 = self->_activatedClusterMembers;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v52;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v52 != v27)
          objc_enumerationMutation(v24);
        PBDataWriterWriteSubmessage();
        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v26);
  }

  v29 = self->_has;
  if ((*(_QWORD *)&v29 & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v29 = self->_has;
  }
  if ((*(_BYTE *)&v29 & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_clusterID)
    PBDataWriterWriteStringField();
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v30 = self->_has;
  }
  if ((*(_DWORD *)&v30 & 0x800000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_parentUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_roomID)
    PBDataWriterWriteStringField();
  if (self->_roomName)
    PBDataWriterWriteStringField();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v31 = self->_allClusterMembers;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v48;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v48 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
    }
    while (v33);
  }

  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x40000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v36 = self->_has;
    if ((*(_DWORD *)&v36 & 0x20000) == 0)
    {
LABEL_127:
      if ((*(_DWORD *)&v36 & 0x80000) == 0)
        goto LABEL_128;
      goto LABEL_186;
    }
  }
  else if ((*(_DWORD *)&v36 & 0x20000) == 0)
  {
    goto LABEL_127;
  }
  PBDataWriterWriteBOOLField();
  v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x80000) == 0)
  {
LABEL_128:
    if ((*(_QWORD *)&v36 & 0x8000000000000) == 0)
      goto LABEL_130;
    goto LABEL_129;
  }
LABEL_186:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
LABEL_129:
    PBDataWriterWriteBOOLField();
LABEL_130:
  if (self->_groupSessionInfo)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_deviceEnclosureColor)
    PBDataWriterWriteStringField();
  if (self->_playingPairedDeviceName)
    PBDataWriterWriteStringField();
  v37 = self->_has;
  if ((*(_QWORD *)&v37 & 0x800000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v37 = self->_has;
    if ((*(_DWORD *)&v37 & 0x40000000) == 0)
    {
LABEL_140:
      if ((*(_QWORD *)&v37 & 0x200000000000) == 0)
        goto LABEL_141;
      goto LABEL_190;
    }
  }
  else if ((*(_DWORD *)&v37 & 0x40000000) == 0)
  {
    goto LABEL_140;
  }
  PBDataWriterWriteBOOLField();
  v37 = self->_has;
  if ((*(_QWORD *)&v37 & 0x200000000000) == 0)
  {
LABEL_141:
    if ((*(_WORD *)&v37 & 0x400) == 0)
      goto LABEL_142;
    goto LABEL_191;
  }
LABEL_190:
  PBDataWriterWriteBOOLField();
  v37 = self->_has;
  if ((*(_WORD *)&v37 & 0x400) == 0)
  {
LABEL_142:
    if ((*(_DWORD *)&v37 & 0x10000000) == 0)
      goto LABEL_144;
    goto LABEL_143;
  }
LABEL_191:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
LABEL_143:
    PBDataWriterWriteBOOLField();
LABEL_144:
  if (self->_headTrackedSpatialAudioMode)
    PBDataWriterWriteStringField();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v38 = self->_dnsNames;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v44;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(v38);
        PBDataWriterWriteStringField();
        ++v42;
      }
      while (v40 != v42);
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    }
    while (v40);
  }

}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasGroupID
{
  return self->_groupID != 0;
}

- (BOOL)hasModelID
{
  return self->_modelID != 0;
}

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0;
}

- (void)setHasCanAccessRemoteAssets:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCanAccessRemoteAssets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasIsRemoteControllable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsRemoteControllable
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setHasIsGroupLeader:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasIsGroupLeader
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasIsGroupable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasIsGroupable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasDeviceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasDeviceType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)deviceTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E30CFD68[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AirPlay")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Bluetooth")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CarPlay")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BuiltIn")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Wired")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasDeviceSubType:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDeviceSubType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)deviceSubTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_1E30CFD98[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceSubType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Speaker")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Headphones")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Headset")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Receiver")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LineOut")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USB")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DisplayPort")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HDMI")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LowEnergy")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPDIF")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomePod")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Vehicle")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cluster")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetTopBox")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TVStick")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mac")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iOS")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Vision")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasModelSpecificInfoData
{
  return self->_modelSpecificInfoData != 0;
}

- (void)setBatteryLevel:(float)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_batteryLevel = a3;
}

- (void)setHasBatteryLevel:(BOOL)a3
{
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setHasIsLocalDevice:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsLocalDevice
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasSupportsExternalScreen:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsExternalScreen
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setHasRequiresAuthorization:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasRequiresAuthorization
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setShouldForceRemoteControlabillity:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_shouldForceRemoteControlabillity = a3;
}

- (void)setHasShouldForceRemoteControlabillity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasShouldForceRemoteControlabillity
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (BOOL)hasSourceInfo
{
  return self->_sourceInfo != 0;
}

- (void)setHasIsDeviceGroupable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasIsDeviceGroupable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasCanRelayCommunicationChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasCanRelayCommunicationChannel
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasLogicalDeviceID
{
  return self->_logicalDeviceID != 0;
}

- (void)setHasIsProxyGroupPlayer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsProxyGroupPlayer
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (BOOL)hasFirmwareVersion
{
  return self->_firmwareVersion != 0;
}

- (BOOL)hasVolume
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasIsVolumeControlAvailable
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHasCanAccessAppleMusic:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCanAccessAppleMusic
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasCanAccessiCloudMusicLibrary:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCanAccessiCloudMusicLibrary
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasGroupContainsGroupLeader:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasGroupContainsGroupLeader
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasSupportsBufferedAirPlay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsBufferedAirPlay
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setHasCanPlayEncryptedProgressiveDownloadAssets:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasCanPlayEncryptedProgressiveDownloadAssets
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasCanFetchMediaDataFromSender:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasCanFetchMediaDataFromSender
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setHasIsAirPlayReceiverSessionActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasIsAirPlayReceiverSessionActive
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasParentGroupIdentifier
{
  return self->_parentGroupIdentifier != 0;
}

- (void)setHasParentGroupContainsDiscoverableLeader:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasParentGroupContainsDiscoverableLeader
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setHasIsAddedToHomeKit:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasIsAddedToHomeKit
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasVolumeCapabilities:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasVolumeCapabilities
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasBluetoothID
{
  return self->_bluetoothID != 0;
}

- (void)setHasSupportsHAP:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsHAP
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setHasUsingJSONProtocol:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUsingJSONProtocol
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)clearClusterCompositions
{
  -[NSMutableArray removeAllObjects](self->_clusterCompositions, "removeAllObjects");
}

- (void)addClusterComposition:(id)a3
{
  id v4;
  NSMutableArray *clusterCompositions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clusterCompositions = self->_clusterCompositions;
  v8 = v4;
  if (!clusterCompositions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clusterCompositions;
    self->_clusterCompositions = v6;

    v4 = v8;
    clusterCompositions = self->_clusterCompositions;
  }
  -[NSMutableArray addObject:](clusterCompositions, "addObject:", v4);

}

- (unint64_t)clusterCompositionsCount
{
  return -[NSMutableArray count](self->_clusterCompositions, "count");
}

- (id)clusterCompositionAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clusterCompositions, "objectAtIndex:", a3);
}

+ (Class)clusterCompositionType
{
  return (Class)objc_opt_class();
}

- (void)setHasClusterType:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasClusterType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasPrimaryUID
{
  return self->_primaryUID != 0;
}

- (void)setHasConfiguredClusterSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasConfiguredClusterSize
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSupportsRapportRemoteControlTransport:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsRapportRemoteControlTransport
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (BOOL)hasCurrentBluetoothListeningMode
{
  return self->_currentBluetoothListeningMode != 0;
}

- (void)clearAvailableBluetoothListeningModes
{
  -[NSMutableArray removeAllObjects](self->_availableBluetoothListeningModes, "removeAllObjects");
}

- (unint64_t)availableBluetoothListeningModesCount
{
  return -[NSMutableArray count](self->_availableBluetoothListeningModes, "count");
}

- (id)availableBluetoothListeningModesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_availableBluetoothListeningModes, "objectAtIndex:", a3);
}

+ (Class)availableBluetoothListeningModesType
{
  return (Class)objc_opt_class();
}

- (void)setHasSupportsMultiplayer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsMultiplayer
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setHasProducesLowFidelityAudio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasProducesLowFidelityAudio
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (int)hostDeviceClass
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_hostDeviceClass;
  else
    return -1;
}

- (void)setHasHostDeviceClass:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasHostDeviceClass
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)hostDeviceClassAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 + 1;
  if ((a3 + 1) < 0xF && ((0x7FFDu >> v3) & 1) != 0)
  {
    v4 = off_1E30CFE48[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsHostDeviceClass:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iFPGA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Accessory")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Bridge")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mac")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Android")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Web")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleDisplay")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RealityDevice")))
  {
    v4 = 13;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)hasAirPlayGroupID
{
  return self->_airPlayGroupID != 0;
}

- (void)setHasSupportsSharePlayHandoff:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsSharePlayHandoff
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setDistance:(float)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasDistance
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)discoveredOnSameInfra
{
  return (*((_BYTE *)&self->_has + 2) & 4) == 0 || self->_discoveredOnSameInfra;
}

- (void)setDiscoveredOnSameInfra:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_discoveredOnSameInfra = a3;
}

- (void)setHasDiscoveredOnSameInfra:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasDiscoveredOnSameInfra
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)clearActivatedClusterMembers
{
  -[NSMutableArray removeAllObjects](self->_activatedClusterMembers, "removeAllObjects");
}

- (void)addActivatedClusterMembers:(id)a3
{
  id v4;
  NSMutableArray *activatedClusterMembers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  activatedClusterMembers = self->_activatedClusterMembers;
  v8 = v4;
  if (!activatedClusterMembers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_activatedClusterMembers;
    self->_activatedClusterMembers = v6;

    v4 = v8;
    activatedClusterMembers = self->_activatedClusterMembers;
  }
  -[NSMutableArray addObject:](activatedClusterMembers, "addObject:", v4);

}

- (unint64_t)activatedClusterMembersCount
{
  return -[NSMutableArray count](self->_activatedClusterMembers, "count");
}

- (id)activatedClusterMembersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_activatedClusterMembers, "objectAtIndex:", a3);
}

+ (Class)activatedClusterMembersType
{
  return (Class)objc_opt_class();
}

- (BOOL)pickable
{
  return (*((_BYTE *)&self->_has + 4) & 8) == 0 || self->_pickable;
}

- (void)setHasPickable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasPickable
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setHasTransportType:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTransportType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E30CFEC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AirPlay")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rapport")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Companion")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IDS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OutputContext")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GroupSession")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (void)setHasIsClusterLeader:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasIsClusterLeader
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasIsAppleAccessory:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasIsAppleAccessory
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasParentUniqueIdentifier
{
  return self->_parentUniqueIdentifier != 0;
}

- (BOOL)hasRoomID
{
  return self->_roomID != 0;
}

- (BOOL)hasRoomName
{
  return self->_roomName != 0;
}

- (void)clearAllClusterMembers
{
  -[NSMutableArray removeAllObjects](self->_allClusterMembers, "removeAllObjects");
}

- (void)addAllClusterMembers:(id)a3
{
  id v4;
  NSMutableArray *allClusterMembers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  allClusterMembers = self->_allClusterMembers;
  v8 = v4;
  if (!allClusterMembers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_allClusterMembers;
    self->_allClusterMembers = v6;

    v4 = v8;
    allClusterMembers = self->_allClusterMembers;
  }
  -[NSMutableArray addObject:](allClusterMembers, "addObject:", v4);

}

- (unint64_t)allClusterMembersCount
{
  return -[NSMutableArray count](self->_allClusterMembers, "count");
}

- (id)allClusterMembersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allClusterMembers, "objectAtIndex:", a3);
}

+ (Class)allClusterMembersType
{
  return (Class)objc_opt_class();
}

- (void)setSupportsConversationDetection:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_supportsConversationDetection = a3;
}

- (void)setHasSupportsConversationDetection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsConversationDetection
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setConversationDetectionEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_conversationDetectionEnabled = a3;
}

- (void)setHasConversationDetectionEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasConversationDetectionEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setEngageOnClusterActivate:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_engageOnClusterActivate = a3;
}

- (void)setHasEngageOnClusterActivate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasEngageOnClusterActivate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasVolumeMuted
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (BOOL)hasGroupSessionInfo
{
  return self->_groupSessionInfo != 0;
}

- (void)setSupportsBluetoothSharing:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_supportsBluetoothSharing = a3;
}

- (void)setHasSupportsBluetoothSharing:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsBluetoothSharing
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (BOOL)hasDeviceEnclosureColor
{
  return self->_deviceEnclosureColor != 0;
}

- (BOOL)hasPlayingPairedDeviceName
{
  return self->_playingPairedDeviceName != 0;
}

- (void)setSupportsRapport:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_supportsRapport = a3;
}

- (void)setHasSupportsRapport:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsRapport
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setIsPickedOnPairedDevice:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_isPickedOnPairedDevice = a3;
}

- (void)setHasIsPickedOnPairedDevice:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsPickedOnPairedDevice
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setSupportsHeadTrackedSpatialAudio:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_supportsHeadTrackedSpatialAudio = a3;
}

- (void)setHasSupportsHeadTrackedSpatialAudio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsHeadTrackedSpatialAudio
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setAllowsHeadTrackedSpatialAudio:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_allowsHeadTrackedSpatialAudio = a3;
}

- (void)setHasAllowsHeadTrackedSpatialAudio:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasAllowsHeadTrackedSpatialAudio
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsHeadTrackedSpatialAudioActive:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_isHeadTrackedSpatialAudioActive = a3;
}

- (void)setHasIsHeadTrackedSpatialAudioActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIsHeadTrackedSpatialAudioActive
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasHeadTrackedSpatialAudioMode
{
  return self->_headTrackedSpatialAudioMode != 0;
}

- (void)clearDnsNames
{
  -[NSMutableArray removeAllObjects](self->_dnsNames, "removeAllObjects");
}

- (void)addDnsNames:(id)a3
{
  id v4;
  NSMutableArray *dnsNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dnsNames = self->_dnsNames;
  v8 = v4;
  if (!dnsNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dnsNames;
    self->_dnsNames = v6;

    v4 = v8;
    dnsNames = self->_dnsNames;
  }
  -[NSMutableArray addObject:](dnsNames, "addObject:", v4);

}

- (unint64_t)dnsNamesCount
{
  return -[NSMutableArray count](self->_dnsNames, "count");
}

- (id)dnsNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dnsNames, "objectAtIndex:", a3);
}

+ (Class)dnsNamesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRAVOutputDeviceDescriptorProtobuf;
  -[_MRAVOutputDeviceDescriptorProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *name;
  NSString *uniqueIdentifier;
  NSString *groupID;
  NSString *modelID;
  NSData *macAddress;
  $F5690C47DB6193B0809CC40AF9394DD6 has;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t deviceType;
  __CFString *v17;
  uint64_t deviceSubType;
  __CFString *v19;
  NSData *modelSpecificInfoData;
  $F5690C47DB6193B0809CC40AF9394DD6 v21;
  void *v22;
  _MRAVOutputDeviceSourceInfoProtobuf *sourceInfo;
  void *v24;
  $F5690C47DB6193B0809CC40AF9394DD6 v25;
  void *v26;
  void *v27;
  NSString *logicalDeviceID;
  void *v29;
  NSString *firmwareVersion;
  $F5690C47DB6193B0809CC40AF9394DD6 v31;
  void *v32;
  NSString *parentGroupIdentifier;
  $F5690C47DB6193B0809CC40AF9394DD6 v34;
  void *v35;
  NSString *bluetoothID;
  $F5690C47DB6193B0809CC40AF9394DD6 v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  NSString *primaryUID;
  $F5690C47DB6193B0809CC40AF9394DD6 v50;
  void *v51;
  void *v52;
  NSString *currentBluetoothListeningMode;
  NSMutableArray *availableBluetoothListeningModes;
  $F5690C47DB6193B0809CC40AF9394DD6 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned int v73;
  __CFString *v74;
  NSString *airPlayGroupID;
  $F5690C47DB6193B0809CC40AF9394DD6 v76;
  void *v77;
  void *v78;
  NSMutableArray *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  $F5690C47DB6193B0809CC40AF9394DD6 v85;
  void *v86;
  uint64_t transportType;
  __CFString *v88;
  void *v89;
  void *v90;
  NSString *clusterID;
  $F5690C47DB6193B0809CC40AF9394DD6 v92;
  void *v93;
  void *v94;
  NSString *parentUniqueIdentifier;
  NSString *roomID;
  NSString *roomName;
  void *v98;
  NSMutableArray *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t k;
  void *v104;
  $F5690C47DB6193B0809CC40AF9394DD6 v105;
  void *v106;
  _MRGroupSessionInfoProtobuf *groupSessionInfo;
  void *v108;
  void *v109;
  NSString *deviceEnclosureColor;
  NSString *playingPairedDeviceName;
  $F5690C47DB6193B0809CC40AF9394DD6 v112;
  void *v113;
  NSString *headTrackedSpatialAudioMode;
  NSMutableArray *dnsNames;
  id v116;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v5, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  groupID = self->_groupID;
  if (groupID)
    objc_msgSend(v5, "setObject:forKey:", groupID, CFSTR("groupID"));
  modelID = self->_modelID;
  if (modelID)
    objc_msgSend(v5, "setObject:forKey:", modelID, CFSTR("modelID"));
  macAddress = self->_macAddress;
  if (macAddress)
    objc_msgSend(v5, "setObject:forKey:", macAddress, CFSTR("macAddress"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canAccessRemoteAssets);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("canAccessRemoteAssets"));

    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_14;
      goto LABEL_20;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRemoteControllable);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("isRemoteControllable"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isGroupLeader);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("isGroupLeader"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isGroupable);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("isGroupable"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_30;
    goto LABEL_26;
  }
LABEL_22:
  deviceType = self->_deviceType;
  if (deviceType >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deviceType);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E30CFD68[deviceType];
  }
  objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("deviceType"));

  if ((*(_QWORD *)&self->_has & 8) != 0)
  {
LABEL_26:
    deviceSubType = self->_deviceSubType;
    if (deviceSubType >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deviceSubType);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E30CFD98[deviceSubType];
    }
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("deviceSubType"));

  }
LABEL_30:
  modelSpecificInfoData = self->_modelSpecificInfoData;
  if (modelSpecificInfoData)
    objc_msgSend(v5, "setObject:forKey:", modelSpecificInfoData, CFSTR("modelSpecificInfoData"));
  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 1) != 0)
  {
    *(float *)&v4 = self->_batteryLevel;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v56, CFSTR("batteryLevel"));

    v21 = self->_has;
    if ((*(_DWORD *)&v21 & 0x20000000) == 0)
    {
LABEL_34:
      if ((*(_QWORD *)&v21 & 0x80000000000) == 0)
        goto LABEL_35;
      goto LABEL_100;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x20000000) == 0)
  {
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLocalDevice);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v57, CFSTR("isLocalDevice"));

  v21 = self->_has;
  if ((*(_QWORD *)&v21 & 0x80000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&v21 & 0x4000000000) == 0)
      goto LABEL_36;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsExternalScreen);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v58, CFSTR("supportsExternalScreen"));

  v21 = self->_has;
  if ((*(_QWORD *)&v21 & 0x4000000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&v21 & 0x8000000000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresAuthorization);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v59, CFSTR("requiresAuthorization"));

  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
  {
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldForceRemoteControlabillity);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("shouldForceRemoteControlabillity"));

  }
LABEL_38:
  sourceInfo = self->_sourceInfo;
  if (sourceInfo)
  {
    -[_MRAVOutputDeviceSourceInfoProtobuf dictionaryRepresentation](sourceInfo, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("sourceInfo"));

  }
  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceGroupable);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("isDeviceGroupable"));

    v25 = self->_has;
  }
  if ((*(_DWORD *)&v25 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canRelayCommunicationChannel);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("canRelayCommunicationChannel"));

  }
  logicalDeviceID = self->_logicalDeviceID;
  if (logicalDeviceID)
    objc_msgSend(v5, "setObject:forKey:", logicalDeviceID, CFSTR("logicalDeviceID"));
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isProxyGroupPlayer);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v29, CFSTR("isProxyGroupPlayer"));

  }
  firmwareVersion = self->_firmwareVersion;
  if (firmwareVersion)
    objc_msgSend(v5, "setObject:forKey:", firmwareVersion, CFSTR("firmwareVersion"));
  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x100) != 0)
  {
    *(float *)&v4 = self->_volume;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v60, CFSTR("volume"));

    v31 = self->_has;
    if ((*(_QWORD *)&v31 & 0x200000000) == 0)
    {
LABEL_52:
      if ((*(_WORD *)&v31 & 0x800) == 0)
        goto LABEL_53;
      goto LABEL_105;
    }
  }
  else if ((*(_QWORD *)&v31 & 0x200000000) == 0)
  {
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVolumeControlAvailable);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v61, CFSTR("isVolumeControlAvailable"));

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x800) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v31 & 0x2000) == 0)
      goto LABEL_54;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canAccessAppleMusic);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v62, CFSTR("canAccessAppleMusic"));

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x2000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v31 & 0x100000) == 0)
      goto LABEL_55;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canAccessiCloudMusicLibrary);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v63, CFSTR("canAccessiCloudMusicLibrary"));

  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x100000) == 0)
  {
LABEL_55:
    if ((*(_QWORD *)&v31 & 0x20000000000) == 0)
      goto LABEL_56;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_groupContainsGroupLeader);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v64, CFSTR("groupContainsGroupLeader"));

  v31 = self->_has;
  if ((*(_QWORD *)&v31 & 0x20000000000) == 0)
  {
LABEL_56:
    if ((*(_WORD *)&v31 & 0x8000) == 0)
      goto LABEL_57;
    goto LABEL_109;
  }
LABEL_108:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsBufferedAirPlay);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v65, CFSTR("supportsBufferedAirPlay"));

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x8000) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v31 & 0x4000) == 0)
      goto LABEL_58;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canPlayEncryptedProgressiveDownloadAssets);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v66, CFSTR("canPlayEncryptedProgressiveDownloadAssets"));

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x4000) == 0)
  {
LABEL_58:
    if ((*(_QWORD *)&v31 & 0x1000000000) == 0)
      goto LABEL_59;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canFetchMediaDataFromSender);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v67, CFSTR("canFetchMediaDataFromSender"));

  v31 = self->_has;
  if ((*(_QWORD *)&v31 & 0x1000000000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v31 & 0x400000) == 0)
      goto LABEL_61;
    goto LABEL_60;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v68, CFSTR("presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets"));

  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_60:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAirPlayReceiverSessionActive);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("isAirPlayReceiverSessionActive"));

  }
LABEL_61:
  parentGroupIdentifier = self->_parentGroupIdentifier;
  if (parentGroupIdentifier)
    objc_msgSend(v5, "setObject:forKey:", parentGroupIdentifier, CFSTR("parentGroupIdentifier"));
  v34 = self->_has;
  if ((*(_QWORD *)&v34 & 0x400000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_parentGroupContainsDiscoverableLeader);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v69, CFSTR("parentGroupContainsDiscoverableLeader"));

    v34 = self->_has;
    if ((*(_DWORD *)&v34 & 0x200000) == 0)
    {
LABEL_65:
      if ((*(_WORD *)&v34 & 0x200) == 0)
        goto LABEL_67;
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v34 & 0x200000) == 0)
  {
    goto LABEL_65;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAddedToHomeKit);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v70, CFSTR("isAddedToHomeKit"));

  if ((*(_QWORD *)&self->_has & 0x200) != 0)
  {
LABEL_66:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_volumeCapabilities);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v35, CFSTR("volumeCapabilities"));

  }
LABEL_67:
  bluetoothID = self->_bluetoothID;
  if (bluetoothID)
    objc_msgSend(v5, "setObject:forKey:", bluetoothID, CFSTR("bluetoothID"));
  v37 = self->_has;
  if ((*(_QWORD *)&v37 & 0x100000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsHAP);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v38, CFSTR("supportsHAP"));

    v37 = self->_has;
  }
  if ((*(_QWORD *)&v37 & 0x4000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_usingJSONProtocol);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v39, CFSTR("usingJSONProtocol"));

  }
  if (-[NSMutableArray count](self->_clusterCompositions, "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_clusterCompositions, "count"));
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v42 = self->_clusterCompositions;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v133, v139, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v134;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v134 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * i), "dictionaryRepresentation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v47);

        }
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v133, v139, 16);
      }
      while (v44);
    }

    objc_msgSend(v5, "setObject:forKey:", v41, CFSTR("clusterComposition"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_clusterType);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v48, CFSTR("clusterType"));

  }
  primaryUID = self->_primaryUID;
  if (primaryUID)
    objc_msgSend(v5, "setObject:forKey:", primaryUID, CFSTR("primaryUID"));
  v50 = self->_has;
  if ((*(_BYTE *)&v50 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_configuredClusterSize);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v51, CFSTR("configuredClusterSize"));

    v50 = self->_has;
  }
  if ((*(_QWORD *)&v50 & 0x1000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsRapportRemoteControlTransport);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v52, CFSTR("supportsRapportRemoteControlTransport"));

  }
  currentBluetoothListeningMode = self->_currentBluetoothListeningMode;
  if (currentBluetoothListeningMode)
    objc_msgSend(v5, "setObject:forKey:", currentBluetoothListeningMode, CFSTR("currentBluetoothListeningMode"));
  availableBluetoothListeningModes = self->_availableBluetoothListeningModes;
  if (availableBluetoothListeningModes)
    objc_msgSend(v5, "setObject:forKey:", availableBluetoothListeningModes, CFSTR("availableBluetoothListeningModes"));
  v55 = self->_has;
  if ((*(_QWORD *)&v55 & 0x400000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMultiplayer);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v71, CFSTR("supportsMultiplayer"));

    v55 = self->_has;
    if ((*(_QWORD *)&v55 & 0x2000000000) == 0)
    {
LABEL_96:
      if ((*(_BYTE *)&v55 & 0x40) == 0)
        goto LABEL_123;
      goto LABEL_118;
    }
  }
  else if ((*(_QWORD *)&v55 & 0x2000000000) == 0)
  {
    goto LABEL_96;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_producesLowFidelityAudio);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v72, CFSTR("producesLowFidelityAudio"));

  if ((*(_QWORD *)&self->_has & 0x40) == 0)
    goto LABEL_123;
LABEL_118:
  v73 = self->_hostDeviceClass + 1;
  if (v73 < 0xF && ((0x7FFDu >> v73) & 1) != 0)
  {
    v74 = off_1E30CFE48[v73];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hostDeviceClass);
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKey:", v74, CFSTR("hostDeviceClass"));

LABEL_123:
  airPlayGroupID = self->_airPlayGroupID;
  if (airPlayGroupID)
    objc_msgSend(v5, "setObject:forKey:", airPlayGroupID, CFSTR("airPlayGroupID"));
  v76 = self->_has;
  if ((*(_QWORD *)&v76 & 0x2000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSharePlayHandoff);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v89, CFSTR("supportsSharePlayHandoff"));

    v76 = self->_has;
    if ((*(_BYTE *)&v76 & 0x20) == 0)
    {
LABEL_127:
      if ((*(_DWORD *)&v76 & 0x40000) == 0)
        goto LABEL_129;
      goto LABEL_128;
    }
  }
  else if ((*(_BYTE *)&v76 & 0x20) == 0)
  {
    goto LABEL_127;
  }
  *(float *)&v40 = self->_distance;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v90, CFSTR("distance"));

  if ((*(_QWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_128:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_discoveredOnSameInfra);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v77, CFSTR("discoveredOnSameInfra"));

  }
LABEL_129:
  if (-[NSMutableArray count](self->_activatedClusterMembers, "count"))
  {
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_activatedClusterMembers, "count"));
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v79 = self->_activatedClusterMembers;
    v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v130;
      do
      {
        for (j = 0; j != v81; ++j)
        {
          if (*(_QWORD *)v130 != v82)
            objc_enumerationMutation(v79);
          objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * j), "dictionaryRepresentation");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "addObject:", v84);

        }
        v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
      }
      while (v81);
    }

    objc_msgSend(v5, "setObject:forKey:", v78, CFSTR("activatedClusterMembers"));
  }
  v85 = self->_has;
  if ((*(_QWORD *)&v85 & 0x800000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_pickable);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v86, CFSTR("pickable"));

    v85 = self->_has;
  }
  if ((*(_BYTE *)&v85 & 0x80) != 0)
  {
    transportType = self->_transportType;
    if (transportType >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportType);
      v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v88 = off_1E30CFEC0[transportType];
    }
    objc_msgSend(v5, "setObject:forKey:", v88, CFSTR("transportType"));

  }
  clusterID = self->_clusterID;
  if (clusterID)
    objc_msgSend(v5, "setObject:forKey:", clusterID, CFSTR("clusterID"));
  v92 = self->_has;
  if ((*(_DWORD *)&v92 & 0x1000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isClusterLeader);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v93, CFSTR("isClusterLeader"));

    v92 = self->_has;
  }
  if ((*(_DWORD *)&v92 & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAppleAccessory);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v94, CFSTR("isAppleAccessory"));

  }
  parentUniqueIdentifier = self->_parentUniqueIdentifier;
  if (parentUniqueIdentifier)
    objc_msgSend(v5, "setObject:forKey:", parentUniqueIdentifier, CFSTR("parentUniqueIdentifier"));
  roomID = self->_roomID;
  if (roomID)
    objc_msgSend(v5, "setObject:forKey:", roomID, CFSTR("roomID"));
  roomName = self->_roomName;
  if (roomName)
    objc_msgSend(v5, "setObject:forKey:", roomName, CFSTR("roomName"));
  if (-[NSMutableArray count](self->_allClusterMembers, "count"))
  {
    v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_allClusterMembers, "count"));
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v99 = self->_allClusterMembers;
    v100 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v126;
      do
      {
        for (k = 0; k != v101; ++k)
        {
          if (*(_QWORD *)v126 != v102)
            objc_enumerationMutation(v99);
          objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * k), "dictionaryRepresentation");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "addObject:", v104);

        }
        v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
      }
      while (v101);
    }

    objc_msgSend(v5, "setObject:forKey:", v98, CFSTR("allClusterMembers"));
  }
  v105 = self->_has;
  if ((*(_QWORD *)&v105 & 0x40000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsConversationDetection);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v118, CFSTR("supportsConversationDetection"));

    v105 = self->_has;
    if ((*(_DWORD *)&v105 & 0x20000) == 0)
    {
LABEL_171:
      if ((*(_DWORD *)&v105 & 0x80000) == 0)
        goto LABEL_172;
      goto LABEL_195;
    }
  }
  else if ((*(_DWORD *)&v105 & 0x20000) == 0)
  {
    goto LABEL_171;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_conversationDetectionEnabled);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v119, CFSTR("conversationDetectionEnabled"));

  v105 = self->_has;
  if ((*(_DWORD *)&v105 & 0x80000) == 0)
  {
LABEL_172:
    if ((*(_QWORD *)&v105 & 0x8000000000000) == 0)
      goto LABEL_174;
    goto LABEL_173;
  }
LABEL_195:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_engageOnClusterActivate);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v120, CFSTR("engageOnClusterActivate"));

  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
  {
LABEL_173:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_volumeMuted);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v106, CFSTR("volumeMuted"));

  }
LABEL_174:
  groupSessionInfo = self->_groupSessionInfo;
  if (groupSessionInfo)
  {
    -[_MRGroupSessionInfoProtobuf dictionaryRepresentation](groupSessionInfo, "dictionaryRepresentation");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v108, CFSTR("groupSessionInfo"));

  }
  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsBluetoothSharing);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v109, CFSTR("supportsBluetoothSharing"));

  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (deviceEnclosureColor)
    objc_msgSend(v5, "setObject:forKey:", deviceEnclosureColor, CFSTR("deviceEnclosureColor"));
  playingPairedDeviceName = self->_playingPairedDeviceName;
  if (playingPairedDeviceName)
    objc_msgSend(v5, "setObject:forKey:", playingPairedDeviceName, CFSTR("playingPairedDeviceName"));
  v112 = self->_has;
  if ((*(_QWORD *)&v112 & 0x800000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsRapport);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v121, CFSTR("supportsRapport"));

    v112 = self->_has;
    if ((*(_DWORD *)&v112 & 0x40000000) == 0)
    {
LABEL_184:
      if ((*(_QWORD *)&v112 & 0x200000000000) == 0)
        goto LABEL_185;
      goto LABEL_199;
    }
  }
  else if ((*(_DWORD *)&v112 & 0x40000000) == 0)
  {
    goto LABEL_184;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPickedOnPairedDevice);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v122, CFSTR("isPickedOnPairedDevice"));

  v112 = self->_has;
  if ((*(_QWORD *)&v112 & 0x200000000000) == 0)
  {
LABEL_185:
    if ((*(_WORD *)&v112 & 0x400) == 0)
      goto LABEL_186;
    goto LABEL_200;
  }
LABEL_199:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsHeadTrackedSpatialAudio);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v123, CFSTR("supportsHeadTrackedSpatialAudio"));

  v112 = self->_has;
  if ((*(_WORD *)&v112 & 0x400) == 0)
  {
LABEL_186:
    if ((*(_DWORD *)&v112 & 0x10000000) == 0)
      goto LABEL_188;
    goto LABEL_187;
  }
LABEL_200:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsHeadTrackedSpatialAudio);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v124, CFSTR("allowsHeadTrackedSpatialAudio"));

  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_187:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isHeadTrackedSpatialAudioActive);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v113, CFSTR("isHeadTrackedSpatialAudioActive"));

  }
LABEL_188:
  headTrackedSpatialAudioMode = self->_headTrackedSpatialAudioMode;
  if (headTrackedSpatialAudioMode)
    objc_msgSend(v5, "setObject:forKey:", headTrackedSpatialAudioMode, CFSTR("headTrackedSpatialAudioMode"));
  dnsNames = self->_dnsNames;
  if (dnsNames)
    objc_msgSend(v5, "setObject:forKey:", dnsNames, CFSTR("dnsNames"));
  v116 = v5;

  return v116;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAVOutputDeviceDescriptorProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  char *v4;
  $F5690C47DB6193B0809CC40AF9394DD6 has;
  $F5690C47DB6193B0809CC40AF9394DD6 v6;
  $F5690C47DB6193B0809CC40AF9394DD6 v7;
  $F5690C47DB6193B0809CC40AF9394DD6 v8;
  $F5690C47DB6193B0809CC40AF9394DD6 v9;
  $F5690C47DB6193B0809CC40AF9394DD6 v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  char *v15;
  $F5690C47DB6193B0809CC40AF9394DD6 v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t j;
  void *v20;
  $F5690C47DB6193B0809CC40AF9394DD6 v21;
  char *v22;
  $F5690C47DB6193B0809CC40AF9394DD6 v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t k;
  void *v27;
  $F5690C47DB6193B0809CC40AF9394DD6 v28;
  char *v29;
  $F5690C47DB6193B0809CC40AF9394DD6 v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t m;
  void *v34;
  $F5690C47DB6193B0809CC40AF9394DD6 v35;
  char *v36;
  $F5690C47DB6193B0809CC40AF9394DD6 v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t n;
  void *v41;
  char *v42;

  v4 = (char *)a3;
  v42 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v42;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v42, "setUniqueIdentifier:");
    v4 = v42;
  }
  if (self->_groupID)
  {
    objc_msgSend(v42, "setGroupID:");
    v4 = v42;
  }
  if (self->_modelID)
  {
    objc_msgSend(v42, "setModelID:");
    v4 = v42;
  }
  if (self->_macAddress)
  {
    objc_msgSend(v42, "setMacAddress:");
    v4 = v42;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v4[282] = self->_canAccessRemoteAssets;
    *(_QWORD *)(v4 + 324) |= 0x1000uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_14;
      goto LABEL_141;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_13;
  }
  v4[302] = self->_isRemoteControllable;
  *(_QWORD *)(v4 + 324) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_142;
  }
LABEL_141:
  v4[296] = self->_isGroupLeader;
  *(_QWORD *)(v4 + 324) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_143;
  }
LABEL_142:
  v4[297] = self->_isGroupable;
  *(_QWORD *)(v4 + 324) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_143:
  *((_DWORD *)v4 + 25) = self->_deviceType;
  *(_QWORD *)(v4 + 324) |= 0x10uLL;
  if ((*(_QWORD *)&self->_has & 8) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 24) = self->_deviceSubType;
    *(_QWORD *)(v4 + 324) |= 8uLL;
  }
LABEL_18:
  if (self->_modelSpecificInfoData)
  {
    objc_msgSend(v42, "setModelSpecificInfoData:");
    v4 = v42;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = LODWORD(self->_batteryLevel);
    *(_QWORD *)(v4 + 324) |= 1uLL;
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
    {
LABEL_22:
      if ((*(_QWORD *)&v6 & 0x80000000000) == 0)
        goto LABEL_23;
      goto LABEL_147;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
    goto LABEL_22;
  }
  v4[299] = self->_isLocalDevice;
  *(_QWORD *)(v4 + 324) |= 0x20000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x80000000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
      goto LABEL_24;
    goto LABEL_148;
  }
LABEL_147:
  v4[313] = self->_supportsExternalScreen;
  *(_QWORD *)(v4 + 324) |= 0x80000000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&v6 & 0x8000000000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_148:
  v4[308] = self->_requiresAuthorization;
  *(_QWORD *)(v4 + 324) |= 0x4000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
  {
LABEL_25:
    v4[309] = self->_shouldForceRemoteControlabillity;
    *(_QWORD *)(v4 + 324) |= 0x8000000000uLL;
  }
LABEL_26:
  if (self->_sourceInfo)
  {
    objc_msgSend(v42, "setSourceInfo:");
    v4 = v42;
  }
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    v4[295] = self->_isDeviceGroupable;
    *(_QWORD *)(v4 + 324) |= 0x2000000uLL;
    v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
    v4[286] = self->_canRelayCommunicationChannel;
    *(_QWORD *)(v4 + 324) |= 0x10000uLL;
  }
  if (self->_logicalDeviceID)
  {
    objc_msgSend(v42, "setLogicalDeviceID:");
    v4 = v42;
  }
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    v4[301] = self->_isProxyGroupPlayer;
    *(_QWORD *)(v4 + 324) |= 0x80000000uLL;
  }
  if (self->_firmwareVersion)
  {
    objc_msgSend(v42, "setFirmwareVersion:");
    v4 = v42;
  }
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 68) = LODWORD(self->_volume);
    *(_QWORD *)(v4 + 324) |= 0x100uLL;
    v8 = self->_has;
    if ((*(_QWORD *)&v8 & 0x200000000) == 0)
    {
LABEL_40:
      if ((*(_WORD *)&v8 & 0x800) == 0)
        goto LABEL_41;
      goto LABEL_152;
    }
  }
  else if ((*(_QWORD *)&v8 & 0x200000000) == 0)
  {
    goto LABEL_40;
  }
  v4[303] = self->_isVolumeControlAvailable;
  *(_QWORD *)(v4 + 324) |= 0x200000000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v8 & 0x2000) == 0)
      goto LABEL_42;
    goto LABEL_153;
  }
LABEL_152:
  v4[281] = self->_canAccessAppleMusic;
  *(_QWORD *)(v4 + 324) |= 0x800uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v8 & 0x100000) == 0)
      goto LABEL_43;
    goto LABEL_154;
  }
LABEL_153:
  v4[283] = self->_canAccessiCloudMusicLibrary;
  *(_QWORD *)(v4 + 324) |= 0x2000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&v8 & 0x20000000000) == 0)
      goto LABEL_44;
    goto LABEL_155;
  }
LABEL_154:
  v4[290] = self->_groupContainsGroupLeader;
  *(_QWORD *)(v4 + 324) |= 0x100000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x20000000000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v8 & 0x8000) == 0)
      goto LABEL_45;
    goto LABEL_156;
  }
LABEL_155:
  v4[311] = self->_supportsBufferedAirPlay;
  *(_QWORD *)(v4 + 324) |= 0x20000000000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v8 & 0x4000) == 0)
      goto LABEL_46;
    goto LABEL_157;
  }
LABEL_156:
  v4[285] = self->_canPlayEncryptedProgressiveDownloadAssets;
  *(_QWORD *)(v4 + 324) |= 0x8000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&v8 & 0x1000000000) == 0)
      goto LABEL_47;
    goto LABEL_158;
  }
LABEL_157:
  v4[284] = self->_canFetchMediaDataFromSender;
  *(_QWORD *)(v4 + 324) |= 0x4000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x1000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_158:
  v4[306] = self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
  *(_QWORD *)(v4 + 324) |= 0x1000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_48:
    v4[292] = self->_isAirPlayReceiverSessionActive;
    *(_QWORD *)(v4 + 324) |= 0x400000uLL;
  }
LABEL_49:
  if (self->_parentGroupIdentifier)
  {
    objc_msgSend(v42, "setParentGroupIdentifier:");
    v4 = v42;
  }
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x400000000) != 0)
  {
    v4[304] = self->_parentGroupContainsDiscoverableLeader;
    *(_QWORD *)(v4 + 324) |= 0x400000000uLL;
    v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x200000) == 0)
    {
LABEL_53:
      if ((*(_WORD *)&v9 & 0x200) == 0)
        goto LABEL_55;
      goto LABEL_54;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
    goto LABEL_53;
  }
  v4[291] = self->_isAddedToHomeKit;
  *(_QWORD *)(v4 + 324) |= 0x200000uLL;
  if ((*(_QWORD *)&self->_has & 0x200) != 0)
  {
LABEL_54:
    *((_DWORD *)v4 + 69) = self->_volumeCapabilities;
    *(_QWORD *)(v4 + 324) |= 0x200uLL;
  }
LABEL_55:
  if (self->_bluetoothID)
  {
    objc_msgSend(v42, "setBluetoothID:");
    v4 = v42;
  }
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x100000000000) != 0)
  {
    v4[314] = self->_supportsHAP;
    *(_QWORD *)(v4 + 324) |= 0x100000000000uLL;
    v10 = self->_has;
  }
  if ((*(_QWORD *)&v10 & 0x4000000000000) != 0)
  {
    v4[320] = self->_usingJSONProtocol;
    *(_QWORD *)(v4 + 324) |= 0x4000000000000uLL;
  }
  if (-[_MRAVOutputDeviceDescriptorProtobuf clusterCompositionsCount](self, "clusterCompositionsCount"))
  {
    objc_msgSend(v42, "clearClusterCompositions");
    v11 = -[_MRAVOutputDeviceDescriptorProtobuf clusterCompositionsCount](self, "clusterCompositionsCount");
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        -[_MRAVOutputDeviceDescriptorProtobuf clusterCompositionAtIndex:](self, "clusterCompositionAtIndex:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addClusterComposition:", v14);

      }
    }
  }
  v15 = v42;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v42 + 18) = self->_clusterType;
    *(_QWORD *)(v42 + 324) |= 2uLL;
  }
  if (self->_primaryUID)
  {
    objc_msgSend(v42, "setPrimaryUID:");
    v15 = v42;
  }
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 4) != 0)
  {
    *((_DWORD *)v15 + 19) = self->_configuredClusterSize;
    *(_QWORD *)(v15 + 324) |= 4uLL;
    v16 = self->_has;
  }
  if ((*(_QWORD *)&v16 & 0x1000000000000) != 0)
  {
    v15[318] = self->_supportsRapportRemoteControlTransport;
    *(_QWORD *)(v15 + 324) |= 0x1000000000000uLL;
  }
  if (self->_currentBluetoothListeningMode)
    objc_msgSend(v42, "setCurrentBluetoothListeningMode:");
  if (-[_MRAVOutputDeviceDescriptorProtobuf availableBluetoothListeningModesCount](self, "availableBluetoothListeningModesCount"))
  {
    objc_msgSend(v42, "clearAvailableBluetoothListeningModes");
    v17 = -[_MRAVOutputDeviceDescriptorProtobuf availableBluetoothListeningModesCount](self, "availableBluetoothListeningModesCount");
    if (v17)
    {
      v18 = v17;
      for (j = 0; j != v18; ++j)
      {
        -[_MRAVOutputDeviceDescriptorProtobuf availableBluetoothListeningModesAtIndex:](self, "availableBluetoothListeningModesAtIndex:", j);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addAvailableBluetoothListeningModes:", v20);

      }
    }
  }
  v21 = self->_has;
  v22 = v42;
  if ((*(_QWORD *)&v21 & 0x400000000000) != 0)
  {
    v42[316] = self->_supportsMultiplayer;
    *(_QWORD *)(v42 + 324) |= 0x400000000000uLL;
    v21 = self->_has;
    if ((*(_QWORD *)&v21 & 0x2000000000) == 0)
    {
LABEL_81:
      if ((*(_BYTE *)&v21 & 0x40) == 0)
        goto LABEL_83;
      goto LABEL_82;
    }
  }
  else if ((*(_QWORD *)&v21 & 0x2000000000) == 0)
  {
    goto LABEL_81;
  }
  v42[307] = self->_producesLowFidelityAudio;
  *(_QWORD *)(v42 + 324) |= 0x2000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
  {
LABEL_82:
    *((_DWORD *)v42 + 38) = self->_hostDeviceClass;
    *(_QWORD *)(v42 + 324) |= 0x40uLL;
  }
LABEL_83:
  if (self->_airPlayGroupID)
  {
    objc_msgSend(v42, "setAirPlayGroupID:");
    v22 = v42;
  }
  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x2000000000000) == 0)
  {
    if ((*(_BYTE *)&v23 & 0x20) == 0)
      goto LABEL_87;
LABEL_167:
    *((_DWORD *)v22 + 26) = LODWORD(self->_distance);
    *(_QWORD *)(v22 + 324) |= 0x20uLL;
    if ((*(_QWORD *)&self->_has & 0x40000) == 0)
      goto LABEL_89;
    goto LABEL_88;
  }
  v22[319] = self->_supportsSharePlayHandoff;
  *(_QWORD *)(v22 + 324) |= 0x2000000000000uLL;
  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 0x20) != 0)
    goto LABEL_167;
LABEL_87:
  if ((*(_DWORD *)&v23 & 0x40000) != 0)
  {
LABEL_88:
    v22[288] = self->_discoveredOnSameInfra;
    *(_QWORD *)(v22 + 324) |= 0x40000uLL;
  }
LABEL_89:
  if (-[_MRAVOutputDeviceDescriptorProtobuf activatedClusterMembersCount](self, "activatedClusterMembersCount"))
  {
    objc_msgSend(v42, "clearActivatedClusterMembers");
    v24 = -[_MRAVOutputDeviceDescriptorProtobuf activatedClusterMembersCount](self, "activatedClusterMembersCount");
    if (v24)
    {
      v25 = v24;
      for (k = 0; k != v25; ++k)
      {
        -[_MRAVOutputDeviceDescriptorProtobuf activatedClusterMembersAtIndex:](self, "activatedClusterMembersAtIndex:", k);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addActivatedClusterMembers:", v27);

      }
    }
  }
  v28 = self->_has;
  v29 = v42;
  if ((*(_QWORD *)&v28 & 0x800000000) != 0)
  {
    v42[305] = self->_pickable;
    *(_QWORD *)(v42 + 324) |= 0x800000000uLL;
    v28 = self->_has;
  }
  if ((*(_BYTE *)&v28 & 0x80) != 0)
  {
    *((_DWORD *)v42 + 64) = self->_transportType;
    *(_QWORD *)(v42 + 324) |= 0x80uLL;
  }
  if (self->_clusterID)
  {
    objc_msgSend(v42, "setClusterID:");
    v29 = v42;
  }
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x1000000) != 0)
  {
    v29[294] = self->_isClusterLeader;
    *(_QWORD *)(v29 + 324) |= 0x1000000uLL;
    v30 = self->_has;
  }
  if ((*(_DWORD *)&v30 & 0x800000) != 0)
  {
    v29[293] = self->_isAppleAccessory;
    *(_QWORD *)(v29 + 324) |= 0x800000uLL;
  }
  if (self->_parentUniqueIdentifier)
    objc_msgSend(v42, "setParentUniqueIdentifier:");
  if (self->_roomID)
    objc_msgSend(v42, "setRoomID:");
  if (self->_roomName)
    objc_msgSend(v42, "setRoomName:");
  if (-[_MRAVOutputDeviceDescriptorProtobuf allClusterMembersCount](self, "allClusterMembersCount"))
  {
    objc_msgSend(v42, "clearAllClusterMembers");
    v31 = -[_MRAVOutputDeviceDescriptorProtobuf allClusterMembersCount](self, "allClusterMembersCount");
    if (v31)
    {
      v32 = v31;
      for (m = 0; m != v32; ++m)
      {
        -[_MRAVOutputDeviceDescriptorProtobuf allClusterMembersAtIndex:](self, "allClusterMembersAtIndex:", m);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addAllClusterMembers:", v34);

      }
    }
  }
  v35 = self->_has;
  v36 = v42;
  if ((*(_QWORD *)&v35 & 0x40000000000) != 0)
  {
    v42[312] = self->_supportsConversationDetection;
    *(_QWORD *)(v42 + 324) |= 0x40000000000uLL;
    v35 = self->_has;
    if ((*(_DWORD *)&v35 & 0x20000) == 0)
    {
LABEL_115:
      if ((*(_DWORD *)&v35 & 0x80000) == 0)
        goto LABEL_116;
      goto LABEL_171;
    }
  }
  else if ((*(_DWORD *)&v35 & 0x20000) == 0)
  {
    goto LABEL_115;
  }
  v42[287] = self->_conversationDetectionEnabled;
  *(_QWORD *)(v42 + 324) |= 0x20000uLL;
  v35 = self->_has;
  if ((*(_DWORD *)&v35 & 0x80000) == 0)
  {
LABEL_116:
    if ((*(_QWORD *)&v35 & 0x8000000000000) == 0)
      goto LABEL_118;
    goto LABEL_117;
  }
LABEL_171:
  v42[289] = self->_engageOnClusterActivate;
  *(_QWORD *)(v42 + 324) |= 0x80000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
  {
LABEL_117:
    v42[321] = self->_volumeMuted;
    *(_QWORD *)(v42 + 324) |= 0x8000000000000uLL;
  }
LABEL_118:
  if (self->_groupSessionInfo)
  {
    objc_msgSend(v42, "setGroupSessionInfo:");
    v36 = v42;
  }
  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
  {
    v36[310] = self->_supportsBluetoothSharing;
    *(_QWORD *)(v36 + 324) |= 0x10000000000uLL;
  }
  if (self->_deviceEnclosureColor)
  {
    objc_msgSend(v42, "setDeviceEnclosureColor:");
    v36 = v42;
  }
  if (self->_playingPairedDeviceName)
  {
    objc_msgSend(v42, "setPlayingPairedDeviceName:");
    v36 = v42;
  }
  v37 = self->_has;
  if ((*(_QWORD *)&v37 & 0x800000000000) != 0)
  {
    v36[317] = self->_supportsRapport;
    *(_QWORD *)(v36 + 324) |= 0x800000000000uLL;
    v37 = self->_has;
    if ((*(_DWORD *)&v37 & 0x40000000) == 0)
    {
LABEL_128:
      if ((*(_QWORD *)&v37 & 0x200000000000) == 0)
        goto LABEL_129;
      goto LABEL_175;
    }
  }
  else if ((*(_DWORD *)&v37 & 0x40000000) == 0)
  {
    goto LABEL_128;
  }
  v36[300] = self->_isPickedOnPairedDevice;
  *(_QWORD *)(v36 + 324) |= 0x40000000uLL;
  v37 = self->_has;
  if ((*(_QWORD *)&v37 & 0x200000000000) == 0)
  {
LABEL_129:
    if ((*(_WORD *)&v37 & 0x400) == 0)
      goto LABEL_130;
    goto LABEL_176;
  }
LABEL_175:
  v36[315] = self->_supportsHeadTrackedSpatialAudio;
  *(_QWORD *)(v36 + 324) |= 0x200000000000uLL;
  v37 = self->_has;
  if ((*(_WORD *)&v37 & 0x400) == 0)
  {
LABEL_130:
    if ((*(_DWORD *)&v37 & 0x10000000) == 0)
      goto LABEL_132;
    goto LABEL_131;
  }
LABEL_176:
  v36[280] = self->_allowsHeadTrackedSpatialAudio;
  *(_QWORD *)(v36 + 324) |= 0x400uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_131:
    v36[298] = self->_isHeadTrackedSpatialAudioActive;
    *(_QWORD *)(v36 + 324) |= 0x10000000uLL;
  }
LABEL_132:
  if (self->_headTrackedSpatialAudioMode)
    objc_msgSend(v42, "setHeadTrackedSpatialAudioMode:");
  if (-[_MRAVOutputDeviceDescriptorProtobuf dnsNamesCount](self, "dnsNamesCount"))
  {
    objc_msgSend(v42, "clearDnsNames");
    v38 = -[_MRAVOutputDeviceDescriptorProtobuf dnsNamesCount](self, "dnsNamesCount");
    if (v38)
    {
      v39 = v38;
      for (n = 0; n != v39; ++n)
      {
        -[_MRAVOutputDeviceDescriptorProtobuf dnsNamesAtIndex:](self, "dnsNamesAtIndex:", n);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addDnsNames:", v41);

      }
    }
  }

}

- (unint64_t)hash
{
  $F5690C47DB6193B0809CC40AF9394DD6 has;
  $F5690C47DB6193B0809CC40AF9394DD6 v4;
  unint64_t v5;
  float batteryLevel;
  float v7;
  float v8;
  float v9;
  $F5690C47DB6193B0809CC40AF9394DD6 v10;
  $F5690C47DB6193B0809CC40AF9394DD6 v11;
  unint64_t v12;
  float volume;
  float v14;
  float v15;
  float v16;
  $F5690C47DB6193B0809CC40AF9394DD6 v17;
  $F5690C47DB6193B0809CC40AF9394DD6 v18;
  $F5690C47DB6193B0809CC40AF9394DD6 v19;
  $F5690C47DB6193B0809CC40AF9394DD6 v20;
  $F5690C47DB6193B0809CC40AF9394DD6 v21;
  float distance;
  float v23;
  float v24;
  float v25;
  unint64_t v26;
  $F5690C47DB6193B0809CC40AF9394DD6 v27;
  $F5690C47DB6193B0809CC40AF9394DD6 v28;
  $F5690C47DB6193B0809CC40AF9394DD6 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  $F5690C47DB6193B0809CC40AF9394DD6 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSUInteger v44;
  NSUInteger v45;
  uint64_t v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  uint64_t v51;
  uint64_t v52;
  NSUInteger v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  NSUInteger v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSUInteger v65;
  uint64_t v66;
  uint64_t v67;
  NSUInteger v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSUInteger v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSUInteger v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  NSUInteger v88;
  uint64_t v89;
  NSUInteger v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSUInteger v107;
  NSUInteger v108;
  NSUInteger v109;
  NSUInteger v110;

  v110 = -[NSString hash](self->_name, "hash");
  v109 = -[NSString hash](self->_uniqueIdentifier, "hash");
  v108 = -[NSString hash](self->_groupID, "hash");
  v107 = -[NSString hash](self->_modelID, "hash");
  v106 = -[NSData hash](self->_macAddress, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v105 = 2654435761 * self->_canAccessRemoteAssets;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
    {
LABEL_3:
      v104 = 2654435761 * self->_isRemoteControllable;
      if ((*(_DWORD *)&has & 0x4000000) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v105 = 0;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_3;
  }
  v104 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_4:
    v103 = 2654435761 * self->_isGroupLeader;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v103 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_5:
    v102 = 2654435761 * self->_isGroupable;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v101 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v102 = 0;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v101 = 2654435761 * self->_deviceType;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_7:
    v100 = 2654435761 * self->_deviceSubType;
    goto LABEL_14;
  }
LABEL_13:
  v100 = 0;
LABEL_14:
  v99 = -[NSData hash](self->_modelSpecificInfoData, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
    batteryLevel = self->_batteryLevel;
    v7 = -batteryLevel;
    if (batteryLevel >= 0.0)
      v7 = self->_batteryLevel;
    v8 = floorf(v7 + 0.5);
    v9 = (float)(v7 - v8) * 1.8447e19;
    v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((*(_DWORD *)&v4 & 0x20000000) == 0)
  {
    v97 = 0;
    if ((*(_QWORD *)&v4 & 0x80000000000) != 0)
      goto LABEL_24;
LABEL_27:
    v96 = 0;
    if ((*(_QWORD *)&v4 & 0x4000000000) != 0)
      goto LABEL_25;
    goto LABEL_28;
  }
  v97 = 2654435761 * self->_isLocalDevice;
  if ((*(_QWORD *)&v4 & 0x80000000000) == 0)
    goto LABEL_27;
LABEL_24:
  v96 = 2654435761 * self->_supportsExternalScreen;
  if ((*(_QWORD *)&v4 & 0x4000000000) != 0)
  {
LABEL_25:
    v95 = 2654435761 * self->_requiresAuthorization;
    goto LABEL_29;
  }
LABEL_28:
  v95 = 0;
LABEL_29:
  v98 = v5;
  if ((*(_QWORD *)&v4 & 0x8000000000) != 0)
    v94 = 2654435761 * self->_shouldForceRemoteControlabillity;
  else
    v94 = 0;
  v93 = -[_MRAVOutputDeviceSourceInfoProtobuf hash](self->_sourceInfo, "hash");
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x2000000) != 0)
  {
    v92 = 2654435761 * self->_isDeviceGroupable;
    if ((*(_DWORD *)&v10 & 0x10000) != 0)
      goto LABEL_34;
  }
  else
  {
    v92 = 0;
    if ((*(_DWORD *)&v10 & 0x10000) != 0)
    {
LABEL_34:
      v91 = 2654435761 * self->_canRelayCommunicationChannel;
      goto LABEL_37;
    }
  }
  v91 = 0;
LABEL_37:
  v90 = -[NSString hash](self->_logicalDeviceID, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
    v89 = 2654435761 * self->_isProxyGroupPlayer;
  else
    v89 = 0;
  v88 = -[NSString hash](self->_firmwareVersion, "hash");
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    volume = self->_volume;
    v14 = -volume;
    if (volume >= 0.0)
      v14 = self->_volume;
    v15 = floorf(v14 + 0.5);
    v16 = (float)(v14 - v15) * 1.8447e19;
    v12 = 2654435761u * (unint64_t)fmodf(v15, 1.8447e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabsf(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  if ((*(_QWORD *)&v11 & 0x200000000) != 0)
  {
    v86 = 2654435761 * self->_isVolumeControlAvailable;
    if ((*(_WORD *)&v11 & 0x800) != 0)
    {
LABEL_50:
      v85 = 2654435761 * self->_canAccessAppleMusic;
      if ((*(_WORD *)&v11 & 0x2000) != 0)
        goto LABEL_51;
      goto LABEL_59;
    }
  }
  else
  {
    v86 = 0;
    if ((*(_WORD *)&v11 & 0x800) != 0)
      goto LABEL_50;
  }
  v85 = 0;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
LABEL_51:
    v84 = 2654435761 * self->_canAccessiCloudMusicLibrary;
    if ((*(_DWORD *)&v11 & 0x100000) != 0)
      goto LABEL_52;
    goto LABEL_60;
  }
LABEL_59:
  v84 = 0;
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
LABEL_52:
    v83 = 2654435761 * self->_groupContainsGroupLeader;
    if ((*(_QWORD *)&v11 & 0x20000000000) != 0)
      goto LABEL_53;
    goto LABEL_61;
  }
LABEL_60:
  v83 = 0;
  if ((*(_QWORD *)&v11 & 0x20000000000) != 0)
  {
LABEL_53:
    v82 = 2654435761 * self->_supportsBufferedAirPlay;
    if ((*(_WORD *)&v11 & 0x8000) != 0)
      goto LABEL_54;
    goto LABEL_62;
  }
LABEL_61:
  v82 = 0;
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
LABEL_54:
    v81 = 2654435761 * self->_canPlayEncryptedProgressiveDownloadAssets;
    if ((*(_WORD *)&v11 & 0x4000) != 0)
      goto LABEL_55;
LABEL_63:
    v80 = 0;
    if ((*(_QWORD *)&v11 & 0x1000000000) != 0)
      goto LABEL_56;
    goto LABEL_64;
  }
LABEL_62:
  v81 = 0;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
    goto LABEL_63;
LABEL_55:
  v80 = 2654435761 * self->_canFetchMediaDataFromSender;
  if ((*(_QWORD *)&v11 & 0x1000000000) != 0)
  {
LABEL_56:
    v79 = 2654435761 * self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
    goto LABEL_65;
  }
LABEL_64:
  v79 = 0;
LABEL_65:
  v87 = v12;
  if ((*(_DWORD *)&v11 & 0x400000) != 0)
    v78 = 2654435761 * self->_isAirPlayReceiverSessionActive;
  else
    v78 = 0;
  v77 = -[NSString hash](self->_parentGroupIdentifier, "hash");
  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x400000000) == 0)
  {
    v76 = 0;
    if ((*(_DWORD *)&v17 & 0x200000) != 0)
      goto LABEL_70;
LABEL_73:
    v75 = 0;
    if ((*(_WORD *)&v17 & 0x200) != 0)
      goto LABEL_71;
    goto LABEL_74;
  }
  v76 = 2654435761 * self->_parentGroupContainsDiscoverableLeader;
  if ((*(_DWORD *)&v17 & 0x200000) == 0)
    goto LABEL_73;
LABEL_70:
  v75 = 2654435761 * self->_isAddedToHomeKit;
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
LABEL_71:
    v74 = 2654435761 * self->_volumeCapabilities;
    goto LABEL_75;
  }
LABEL_74:
  v74 = 0;
LABEL_75:
  v73 = -[NSString hash](self->_bluetoothID, "hash");
  v18 = self->_has;
  if ((*(_QWORD *)&v18 & 0x100000000000) != 0)
  {
    v72 = 2654435761 * self->_supportsHAP;
    if ((*(_QWORD *)&v18 & 0x4000000000000) != 0)
      goto LABEL_77;
  }
  else
  {
    v72 = 0;
    if ((*(_QWORD *)&v18 & 0x4000000000000) != 0)
    {
LABEL_77:
      v71 = 2654435761 * self->_usingJSONProtocol;
      goto LABEL_80;
    }
  }
  v71 = 0;
LABEL_80:
  v70 = -[NSMutableArray hash](self->_clusterCompositions, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v69 = 2654435761 * self->_clusterType;
  else
    v69 = 0;
  v68 = -[NSString hash](self->_primaryUID, "hash");
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 4) != 0)
  {
    v67 = 2654435761 * self->_configuredClusterSize;
    if ((*(_QWORD *)&v19 & 0x1000000000000) != 0)
      goto LABEL_85;
  }
  else
  {
    v67 = 0;
    if ((*(_QWORD *)&v19 & 0x1000000000000) != 0)
    {
LABEL_85:
      v66 = 2654435761 * self->_supportsRapportRemoteControlTransport;
      goto LABEL_88;
    }
  }
  v66 = 0;
LABEL_88:
  v65 = -[NSString hash](self->_currentBluetoothListeningMode, "hash");
  v64 = -[NSMutableArray hash](self->_availableBluetoothListeningModes, "hash");
  v20 = self->_has;
  if ((*(_QWORD *)&v20 & 0x400000000000) == 0)
  {
    v63 = 0;
    if ((*(_QWORD *)&v20 & 0x2000000000) != 0)
      goto LABEL_90;
LABEL_93:
    v62 = 0;
    if ((*(_BYTE *)&v20 & 0x40) != 0)
      goto LABEL_91;
    goto LABEL_94;
  }
  v63 = 2654435761 * self->_supportsMultiplayer;
  if ((*(_QWORD *)&v20 & 0x2000000000) == 0)
    goto LABEL_93;
LABEL_90:
  v62 = 2654435761 * self->_producesLowFidelityAudio;
  if ((*(_BYTE *)&v20 & 0x40) != 0)
  {
LABEL_91:
    v61 = 2654435761 * self->_hostDeviceClass;
    goto LABEL_95;
  }
LABEL_94:
  v61 = 0;
LABEL_95:
  v60 = -[NSString hash](self->_airPlayGroupID, "hash");
  v21 = self->_has;
  if ((*(_QWORD *)&v21 & 0x2000000000000) != 0)
  {
    v59 = 2654435761 * self->_supportsSharePlayHandoff;
    if ((*(_BYTE *)&v21 & 0x20) != 0)
      goto LABEL_97;
LABEL_102:
    v26 = 0;
    goto LABEL_105;
  }
  v59 = 0;
  if ((*(_BYTE *)&v21 & 0x20) == 0)
    goto LABEL_102;
LABEL_97:
  distance = self->_distance;
  v23 = -distance;
  if (distance >= 0.0)
    v23 = self->_distance;
  v24 = floorf(v23 + 0.5);
  v25 = (float)(v23 - v24) * 1.8447e19;
  v26 = 2654435761u * (unint64_t)fmodf(v24, 1.8447e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0)
      v26 += (unint64_t)v25;
  }
  else
  {
    v26 -= (unint64_t)fabsf(v25);
  }
LABEL_105:
  v58 = v26;
  if ((*(_DWORD *)&v21 & 0x40000) != 0)
    v57 = 2654435761 * self->_discoveredOnSameInfra;
  else
    v57 = 0;
  v56 = -[NSMutableArray hash](self->_activatedClusterMembers, "hash");
  v27 = self->_has;
  if ((*(_QWORD *)&v27 & 0x800000000) != 0)
  {
    v55 = 2654435761 * self->_pickable;
    if ((*(_BYTE *)&v27 & 0x80) != 0)
      goto LABEL_110;
  }
  else
  {
    v55 = 0;
    if ((*(_BYTE *)&v27 & 0x80) != 0)
    {
LABEL_110:
      v54 = 2654435761 * self->_transportType;
      goto LABEL_113;
    }
  }
  v54 = 0;
LABEL_113:
  v53 = -[NSString hash](self->_clusterID, "hash");
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x1000000) != 0)
  {
    v52 = 2654435761 * self->_isClusterLeader;
    if ((*(_DWORD *)&v28 & 0x800000) != 0)
      goto LABEL_115;
  }
  else
  {
    v52 = 0;
    if ((*(_DWORD *)&v28 & 0x800000) != 0)
    {
LABEL_115:
      v51 = 2654435761 * self->_isAppleAccessory;
      goto LABEL_118;
    }
  }
  v51 = 0;
LABEL_118:
  v50 = -[NSString hash](self->_parentUniqueIdentifier, "hash");
  v49 = -[NSString hash](self->_roomID, "hash");
  v48 = -[NSString hash](self->_roomName, "hash");
  v47 = -[NSMutableArray hash](self->_allClusterMembers, "hash");
  v29 = self->_has;
  if ((*(_QWORD *)&v29 & 0x40000000000) != 0)
  {
    v30 = 2654435761 * self->_supportsConversationDetection;
    if ((*(_DWORD *)&v29 & 0x20000) != 0)
    {
LABEL_120:
      v31 = 2654435761 * self->_conversationDetectionEnabled;
      if ((*(_DWORD *)&v29 & 0x80000) != 0)
        goto LABEL_121;
LABEL_125:
      v32 = 0;
      if ((*(_QWORD *)&v29 & 0x8000000000000) != 0)
        goto LABEL_122;
      goto LABEL_126;
    }
  }
  else
  {
    v30 = 0;
    if ((*(_DWORD *)&v29 & 0x20000) != 0)
      goto LABEL_120;
  }
  v31 = 0;
  if ((*(_DWORD *)&v29 & 0x80000) == 0)
    goto LABEL_125;
LABEL_121:
  v32 = 2654435761 * self->_engageOnClusterActivate;
  if ((*(_QWORD *)&v29 & 0x8000000000000) != 0)
  {
LABEL_122:
    v33 = 2654435761 * self->_volumeMuted;
    goto LABEL_127;
  }
LABEL_126:
  v33 = 0;
LABEL_127:
  v34 = -[_MRGroupSessionInfoProtobuf hash](self->_groupSessionInfo, "hash");
  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
    v35 = 2654435761 * self->_supportsBluetoothSharing;
  else
    v35 = 0;
  v36 = -[NSString hash](self->_deviceEnclosureColor, "hash");
  v37 = -[NSString hash](self->_playingPairedDeviceName, "hash");
  v38 = self->_has;
  if ((*(_QWORD *)&v38 & 0x800000000000) != 0)
  {
    v39 = 2654435761 * self->_supportsRapport;
    if ((*(_DWORD *)&v38 & 0x40000000) != 0)
    {
LABEL_132:
      v40 = 2654435761 * self->_isPickedOnPairedDevice;
      if ((*(_QWORD *)&v38 & 0x200000000000) != 0)
        goto LABEL_133;
      goto LABEL_138;
    }
  }
  else
  {
    v39 = 0;
    if ((*(_DWORD *)&v38 & 0x40000000) != 0)
      goto LABEL_132;
  }
  v40 = 0;
  if ((*(_QWORD *)&v38 & 0x200000000000) != 0)
  {
LABEL_133:
    v41 = 2654435761 * self->_supportsHeadTrackedSpatialAudio;
    if ((*(_WORD *)&v38 & 0x400) != 0)
      goto LABEL_134;
LABEL_139:
    v42 = 0;
    if ((*(_DWORD *)&v38 & 0x10000000) != 0)
      goto LABEL_135;
LABEL_140:
    v43 = 0;
    goto LABEL_141;
  }
LABEL_138:
  v41 = 0;
  if ((*(_WORD *)&v38 & 0x400) == 0)
    goto LABEL_139;
LABEL_134:
  v42 = 2654435761 * self->_allowsHeadTrackedSpatialAudio;
  if ((*(_DWORD *)&v38 & 0x10000000) == 0)
    goto LABEL_140;
LABEL_135:
  v43 = 2654435761 * self->_isHeadTrackedSpatialAudioActive;
LABEL_141:
  v44 = v109 ^ v110 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
  v45 = v35 ^ v36 ^ v37 ^ v39 ^ v40 ^ v41 ^ v42 ^ v43 ^ -[NSString hash](self->_headTrackedSpatialAudioMode, "hash");
  return v44 ^ v45 ^ -[NSMutableArray hash](self->_dnsNames, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _MRAVOutputDeviceSourceInfoProtobuf *sourceInfo;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  _MRGroupSessionInfoProtobuf *groupSessionInfo;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t n;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
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
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 24))
    -[_MRAVOutputDeviceDescriptorProtobuf setName:](self, "setName:");
  if (*((_QWORD *)v4 + 33))
    -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](self, "setUniqueIdentifier:");
  if (*((_QWORD *)v4 + 16))
    -[_MRAVOutputDeviceDescriptorProtobuf setGroupID:](self, "setGroupID:");
  if (*((_QWORD *)v4 + 22))
    -[_MRAVOutputDeviceDescriptorProtobuf setModelID:](self, "setModelID:");
  if (*((_QWORD *)v4 + 21))
    -[_MRAVOutputDeviceDescriptorProtobuf setMacAddress:](self, "setMacAddress:");
  v5 = *(_QWORD *)(v4 + 324);
  if ((v5 & 0x1000) != 0)
  {
    self->_canAccessRemoteAssets = v4[282];
    *(_QWORD *)&self->_has |= 0x1000uLL;
    v5 = *(_QWORD *)(v4 + 324);
    if ((v5 & 0x100000000) == 0)
    {
LABEL_13:
      if ((v5 & 0x4000000) == 0)
        goto LABEL_14;
      goto LABEL_31;
    }
  }
  else if ((v5 & 0x100000000) == 0)
  {
    goto LABEL_13;
  }
  self->_isRemoteControllable = v4[302];
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *(_QWORD *)(v4 + 324);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  self->_isGroupLeader = v4[296];
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *(_QWORD *)(v4 + 324);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  self->_isGroupable = v4[297];
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *(_QWORD *)(v4 + 324);
  if ((v5 & 0x10) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_33:
  self->_deviceType = *((_DWORD *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x10uLL;
  if ((*(_QWORD *)(v4 + 324) & 8) != 0)
  {
LABEL_17:
    self->_deviceSubType = *((_DWORD *)v4 + 24);
    *(_QWORD *)&self->_has |= 8uLL;
  }
LABEL_18:
  if (*((_QWORD *)v4 + 23))
    -[_MRAVOutputDeviceDescriptorProtobuf setModelSpecificInfoData:](self, "setModelSpecificInfoData:");
  v6 = *(_QWORD *)(v4 + 324);
  if ((v6 & 1) != 0)
  {
    self->_batteryLevel = *((float *)v4 + 10);
    *(_QWORD *)&self->_has |= 1uLL;
    v6 = *(_QWORD *)(v4 + 324);
    if ((v6 & 0x20000000) == 0)
    {
LABEL_22:
      if ((v6 & 0x80000000000) == 0)
        goto LABEL_23;
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x20000000) == 0)
  {
    goto LABEL_22;
  }
  self->_isLocalDevice = v4[299];
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v6 = *(_QWORD *)(v4 + 324);
  if ((v6 & 0x80000000000) == 0)
  {
LABEL_23:
    if ((v6 & 0x4000000000) == 0)
      goto LABEL_24;
    goto LABEL_38;
  }
LABEL_37:
  self->_supportsExternalScreen = v4[313];
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v6 = *(_QWORD *)(v4 + 324);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x8000000000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_38:
  self->_requiresAuthorization = v4[308];
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  if ((*(_QWORD *)(v4 + 324) & 0x8000000000) != 0)
  {
LABEL_25:
    self->_shouldForceRemoteControlabillity = v4[309];
    *(_QWORD *)&self->_has |= 0x8000000000uLL;
  }
LABEL_26:
  sourceInfo = self->_sourceInfo;
  v8 = *((_QWORD *)v4 + 31);
  if (sourceInfo)
  {
    if (v8)
      -[_MRAVOutputDeviceSourceInfoProtobuf mergeFrom:](sourceInfo, "mergeFrom:");
  }
  else if (v8)
  {
    -[_MRAVOutputDeviceDescriptorProtobuf setSourceInfo:](self, "setSourceInfo:");
  }
  v9 = *(_QWORD *)(v4 + 324);
  if ((v9 & 0x2000000) != 0)
  {
    self->_isDeviceGroupable = v4[295];
    *(_QWORD *)&self->_has |= 0x2000000uLL;
    v9 = *(_QWORD *)(v4 + 324);
  }
  if ((v9 & 0x10000) != 0)
  {
    self->_canRelayCommunicationChannel = v4[286];
    *(_QWORD *)&self->_has |= 0x10000uLL;
  }
  if (*((_QWORD *)v4 + 20))
    -[_MRAVOutputDeviceDescriptorProtobuf setLogicalDeviceID:](self, "setLogicalDeviceID:");
  if (v4[327] < 0)
  {
    self->_isProxyGroupPlayer = v4[301];
    *(_QWORD *)&self->_has |= 0x80000000uLL;
  }
  if (*((_QWORD *)v4 + 15))
    -[_MRAVOutputDeviceDescriptorProtobuf setFirmwareVersion:](self, "setFirmwareVersion:");
  v10 = *(_QWORD *)(v4 + 324);
  if ((v10 & 0x100) != 0)
  {
    self->_volume = *((float *)v4 + 68);
    *(_QWORD *)&self->_has |= 0x100uLL;
    v10 = *(_QWORD *)(v4 + 324);
    if ((v10 & 0x200000000) == 0)
    {
LABEL_54:
      if ((v10 & 0x800) == 0)
        goto LABEL_55;
      goto LABEL_149;
    }
  }
  else if ((v10 & 0x200000000) == 0)
  {
    goto LABEL_54;
  }
  self->_isVolumeControlAvailable = v4[303];
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v10 = *(_QWORD *)(v4 + 324);
  if ((v10 & 0x800) == 0)
  {
LABEL_55:
    if ((v10 & 0x2000) == 0)
      goto LABEL_56;
    goto LABEL_150;
  }
LABEL_149:
  self->_canAccessAppleMusic = v4[281];
  *(_QWORD *)&self->_has |= 0x800uLL;
  v10 = *(_QWORD *)(v4 + 324);
  if ((v10 & 0x2000) == 0)
  {
LABEL_56:
    if ((v10 & 0x100000) == 0)
      goto LABEL_57;
    goto LABEL_151;
  }
LABEL_150:
  self->_canAccessiCloudMusicLibrary = v4[283];
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v10 = *(_QWORD *)(v4 + 324);
  if ((v10 & 0x100000) == 0)
  {
LABEL_57:
    if ((v10 & 0x20000000000) == 0)
      goto LABEL_58;
    goto LABEL_152;
  }
LABEL_151:
  self->_groupContainsGroupLeader = v4[290];
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v10 = *(_QWORD *)(v4 + 324);
  if ((v10 & 0x20000000000) == 0)
  {
LABEL_58:
    if ((v10 & 0x8000) == 0)
      goto LABEL_59;
    goto LABEL_153;
  }
LABEL_152:
  self->_supportsBufferedAirPlay = v4[311];
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v10 = *(_QWORD *)(v4 + 324);
  if ((v10 & 0x8000) == 0)
  {
LABEL_59:
    if ((v10 & 0x4000) == 0)
      goto LABEL_60;
    goto LABEL_154;
  }
LABEL_153:
  self->_canPlayEncryptedProgressiveDownloadAssets = v4[285];
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v10 = *(_QWORD *)(v4 + 324);
  if ((v10 & 0x4000) == 0)
  {
LABEL_60:
    if ((v10 & 0x1000000000) == 0)
      goto LABEL_61;
    goto LABEL_155;
  }
LABEL_154:
  self->_canFetchMediaDataFromSender = v4[284];
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v10 = *(_QWORD *)(v4 + 324);
  if ((v10 & 0x1000000000) == 0)
  {
LABEL_61:
    if ((v10 & 0x400000) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
LABEL_155:
  self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets = v4[306];
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  if ((*(_QWORD *)(v4 + 324) & 0x400000) != 0)
  {
LABEL_62:
    self->_isAirPlayReceiverSessionActive = v4[292];
    *(_QWORD *)&self->_has |= 0x400000uLL;
  }
LABEL_63:
  if (*((_QWORD *)v4 + 25))
    -[_MRAVOutputDeviceDescriptorProtobuf setParentGroupIdentifier:](self, "setParentGroupIdentifier:");
  v11 = *(_QWORD *)(v4 + 324);
  if ((v11 & 0x400000000) != 0)
  {
    self->_parentGroupContainsDiscoverableLeader = v4[304];
    *(_QWORD *)&self->_has |= 0x400000000uLL;
    v11 = *(_QWORD *)(v4 + 324);
    if ((v11 & 0x200000) == 0)
    {
LABEL_67:
      if ((v11 & 0x200) == 0)
        goto LABEL_69;
      goto LABEL_68;
    }
  }
  else if ((v11 & 0x200000) == 0)
  {
    goto LABEL_67;
  }
  self->_isAddedToHomeKit = v4[291];
  *(_QWORD *)&self->_has |= 0x200000uLL;
  if ((*(_QWORD *)(v4 + 324) & 0x200) != 0)
  {
LABEL_68:
    self->_volumeCapabilities = *((_DWORD *)v4 + 69);
    *(_QWORD *)&self->_has |= 0x200uLL;
  }
LABEL_69:
  if (*((_QWORD *)v4 + 6))
    -[_MRAVOutputDeviceDescriptorProtobuf setBluetoothID:](self, "setBluetoothID:");
  v12 = *(_QWORD *)(v4 + 324);
  if ((v12 & 0x100000000000) != 0)
  {
    self->_supportsHAP = v4[314];
    *(_QWORD *)&self->_has |= 0x100000000000uLL;
    v12 = *(_QWORD *)(v4 + 324);
  }
  if ((v12 & 0x4000000000000) != 0)
  {
    self->_usingJSONProtocol = v4[320];
    *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v13 = *((id *)v4 + 7);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v64 != v16)
          objc_enumerationMutation(v13);
        -[_MRAVOutputDeviceDescriptorProtobuf addClusterComposition:](self, "addClusterComposition:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v15);
  }

  if ((v4[324] & 2) != 0)
  {
    self->_clusterType = *((_DWORD *)v4 + 18);
    *(_QWORD *)&self->_has |= 2uLL;
  }
  if (*((_QWORD *)v4 + 28))
    -[_MRAVOutputDeviceDescriptorProtobuf setPrimaryUID:](self, "setPrimaryUID:");
  v18 = *(_QWORD *)(v4 + 324);
  if ((v18 & 4) != 0)
  {
    self->_configuredClusterSize = *((_DWORD *)v4 + 19);
    *(_QWORD *)&self->_has |= 4uLL;
    v18 = *(_QWORD *)(v4 + 324);
  }
  if ((v18 & 0x1000000000000) != 0)
  {
    self->_supportsRapportRemoteControlTransport = v4[318];
    *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  }
  if (*((_QWORD *)v4 + 10))
    -[_MRAVOutputDeviceDescriptorProtobuf setCurrentBluetoothListeningMode:](self, "setCurrentBluetoothListeningMode:");
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v19 = *((id *)v4 + 4);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v60 != v22)
          objc_enumerationMutation(v19);
        -[_MRAVOutputDeviceDescriptorProtobuf addAvailableBluetoothListeningModes:](self, "addAvailableBluetoothListeningModes:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v21);
  }

  v24 = *(_QWORD *)(v4 + 324);
  if ((v24 & 0x400000000000) != 0)
  {
    self->_supportsMultiplayer = v4[316];
    *(_QWORD *)&self->_has |= 0x400000000000uLL;
    v24 = *(_QWORD *)(v4 + 324);
    if ((v24 & 0x2000000000) == 0)
    {
LABEL_101:
      if ((v24 & 0x40) == 0)
        goto LABEL_103;
      goto LABEL_102;
    }
  }
  else if ((v24 & 0x2000000000) == 0)
  {
    goto LABEL_101;
  }
  self->_producesLowFidelityAudio = v4[307];
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  if ((*(_QWORD *)(v4 + 324) & 0x40) != 0)
  {
LABEL_102:
    self->_hostDeviceClass = *((_DWORD *)v4 + 38);
    *(_QWORD *)&self->_has |= 0x40uLL;
  }
LABEL_103:
  if (*((_QWORD *)v4 + 2))
    -[_MRAVOutputDeviceDescriptorProtobuf setAirPlayGroupID:](self, "setAirPlayGroupID:");
  v25 = *(_QWORD *)(v4 + 324);
  if ((v25 & 0x2000000000000) != 0)
  {
    self->_supportsSharePlayHandoff = v4[319];
    *(_QWORD *)&self->_has |= 0x2000000000000uLL;
    v25 = *(_QWORD *)(v4 + 324);
    if ((v25 & 0x20) == 0)
    {
LABEL_107:
      if ((v25 & 0x40000) == 0)
        goto LABEL_109;
      goto LABEL_108;
    }
  }
  else if ((v25 & 0x20) == 0)
  {
    goto LABEL_107;
  }
  self->_distance = *((float *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x20uLL;
  if ((*(_QWORD *)(v4 + 324) & 0x40000) != 0)
  {
LABEL_108:
    self->_discoveredOnSameInfra = v4[288];
    *(_QWORD *)&self->_has |= 0x40000uLL;
  }
LABEL_109:
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v26 = *((id *)v4 + 1);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v56 != v29)
          objc_enumerationMutation(v26);
        -[_MRAVOutputDeviceDescriptorProtobuf addActivatedClusterMembers:](self, "addActivatedClusterMembers:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v28);
  }

  v31 = *(_QWORD *)(v4 + 324);
  if ((v31 & 0x800000000) != 0)
  {
    self->_pickable = v4[305];
    *(_QWORD *)&self->_has |= 0x800000000uLL;
    v31 = *(_QWORD *)(v4 + 324);
  }
  if ((v31 & 0x80) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 64);
    *(_QWORD *)&self->_has |= 0x80uLL;
  }
  if (*((_QWORD *)v4 + 8))
    -[_MRAVOutputDeviceDescriptorProtobuf setClusterID:](self, "setClusterID:");
  v32 = *(_QWORD *)(v4 + 324);
  if ((v32 & 0x1000000) != 0)
  {
    self->_isClusterLeader = v4[294];
    *(_QWORD *)&self->_has |= 0x1000000uLL;
    v32 = *(_QWORD *)(v4 + 324);
  }
  if ((v32 & 0x800000) != 0)
  {
    self->_isAppleAccessory = v4[293];
    *(_QWORD *)&self->_has |= 0x800000uLL;
  }
  if (*((_QWORD *)v4 + 26))
    -[_MRAVOutputDeviceDescriptorProtobuf setParentUniqueIdentifier:](self, "setParentUniqueIdentifier:");
  if (*((_QWORD *)v4 + 29))
    -[_MRAVOutputDeviceDescriptorProtobuf setRoomID:](self, "setRoomID:");
  if (*((_QWORD *)v4 + 30))
    -[_MRAVOutputDeviceDescriptorProtobuf setRoomName:](self, "setRoomName:");
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v33 = *((id *)v4 + 3);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v52;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(v33);
        -[_MRAVOutputDeviceDescriptorProtobuf addAllClusterMembers:](self, "addAllClusterMembers:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m));
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    }
    while (v35);
  }

  v38 = *(_QWORD *)(v4 + 324);
  if ((v38 & 0x40000000000) != 0)
  {
    self->_supportsConversationDetection = v4[312];
    *(_QWORD *)&self->_has |= 0x40000000000uLL;
    v38 = *(_QWORD *)(v4 + 324);
    if ((v38 & 0x20000) == 0)
    {
LABEL_141:
      if ((v38 & 0x80000) == 0)
        goto LABEL_142;
      goto LABEL_168;
    }
  }
  else if ((v38 & 0x20000) == 0)
  {
    goto LABEL_141;
  }
  self->_conversationDetectionEnabled = v4[287];
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v38 = *(_QWORD *)(v4 + 324);
  if ((v38 & 0x80000) == 0)
  {
LABEL_142:
    if ((v38 & 0x8000000000000) == 0)
      goto LABEL_144;
    goto LABEL_143;
  }
LABEL_168:
  self->_engageOnClusterActivate = v4[289];
  *(_QWORD *)&self->_has |= 0x80000uLL;
  if ((*(_QWORD *)(v4 + 324) & 0x8000000000000) != 0)
  {
LABEL_143:
    self->_volumeMuted = v4[321];
    *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  }
LABEL_144:
  groupSessionInfo = self->_groupSessionInfo;
  v40 = *((_QWORD *)v4 + 17);
  if (groupSessionInfo)
  {
    if (v40)
      -[_MRGroupSessionInfoProtobuf mergeFrom:](groupSessionInfo, "mergeFrom:");
  }
  else if (v40)
  {
    -[_MRAVOutputDeviceDescriptorProtobuf setGroupSessionInfo:](self, "setGroupSessionInfo:");
  }
  if ((v4[329] & 1) != 0)
  {
    self->_supportsBluetoothSharing = v4[310];
    *(_QWORD *)&self->_has |= 0x10000000000uLL;
  }
  if (*((_QWORD *)v4 + 11))
    -[_MRAVOutputDeviceDescriptorProtobuf setDeviceEnclosureColor:](self, "setDeviceEnclosureColor:");
  if (*((_QWORD *)v4 + 27))
    -[_MRAVOutputDeviceDescriptorProtobuf setPlayingPairedDeviceName:](self, "setPlayingPairedDeviceName:");
  v41 = *(_QWORD *)(v4 + 324);
  if ((v41 & 0x800000000000) != 0)
  {
    self->_supportsRapport = v4[317];
    *(_QWORD *)&self->_has |= 0x800000000000uLL;
    v41 = *(_QWORD *)(v4 + 324);
    if ((v41 & 0x40000000) == 0)
    {
LABEL_180:
      if ((v41 & 0x200000000000) == 0)
        goto LABEL_181;
      goto LABEL_196;
    }
  }
  else if ((v41 & 0x40000000) == 0)
  {
    goto LABEL_180;
  }
  self->_isPickedOnPairedDevice = v4[300];
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v41 = *(_QWORD *)(v4 + 324);
  if ((v41 & 0x200000000000) == 0)
  {
LABEL_181:
    if ((v41 & 0x400) == 0)
      goto LABEL_182;
    goto LABEL_197;
  }
LABEL_196:
  self->_supportsHeadTrackedSpatialAudio = v4[315];
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v41 = *(_QWORD *)(v4 + 324);
  if ((v41 & 0x400) == 0)
  {
LABEL_182:
    if ((v41 & 0x10000000) == 0)
      goto LABEL_184;
    goto LABEL_183;
  }
LABEL_197:
  self->_allowsHeadTrackedSpatialAudio = v4[280];
  *(_QWORD *)&self->_has |= 0x400uLL;
  if ((*(_QWORD *)(v4 + 324) & 0x10000000) != 0)
  {
LABEL_183:
    self->_isHeadTrackedSpatialAudioActive = v4[298];
    *(_QWORD *)&self->_has |= 0x10000000uLL;
  }
LABEL_184:
  if (*((_QWORD *)v4 + 18))
    -[_MRAVOutputDeviceDescriptorProtobuf setHeadTrackedSpatialAudioMode:](self, "setHeadTrackedSpatialAudioMode:");
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v42 = *((id *)v4 + 14);
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v48;
    do
    {
      for (n = 0; n != v44; ++n)
      {
        if (*(_QWORD *)v48 != v45)
          objc_enumerationMutation(v42);
        -[_MRAVOutputDeviceDescriptorProtobuf addDnsNames:](self, "addDnsNames:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * n), (_QWORD)v47);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
    }
    while (v44);
  }

}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (BOOL)supportsExternalScreen
{
  return self->_supportsExternalScreen;
}

- (BOOL)requiresAuthorization
{
  return self->_requiresAuthorization;
}

- (BOOL)shouldForceRemoteControlabillity
{
  return self->_shouldForceRemoteControlabillity;
}

- (NSString)logicalDeviceID
{
  return self->_logicalDeviceID;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareVersion, a3);
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)isVolumeControlAvailable
{
  return self->_isVolumeControlAvailable;
}

- (int)volumeCapabilities
{
  return self->_volumeCapabilities;
}

- (void)setClusterCompositions:(id)a3
{
  objc_storeStrong((id *)&self->_clusterCompositions, a3);
}

- (unsigned)clusterType
{
  return self->_clusterType;
}

- (NSString)primaryUID
{
  return self->_primaryUID;
}

- (unsigned)configuredClusterSize
{
  return self->_configuredClusterSize;
}

- (BOOL)supportsRapportRemoteControlTransport
{
  return self->_supportsRapportRemoteControlTransport;
}

- (NSString)currentBluetoothListeningMode
{
  return self->_currentBluetoothListeningMode;
}

- (NSMutableArray)availableBluetoothListeningModes
{
  return self->_availableBluetoothListeningModes;
}

- (BOOL)producesLowFidelityAudio
{
  return self->_producesLowFidelityAudio;
}

- (NSString)airPlayGroupID
{
  return self->_airPlayGroupID;
}

- (BOOL)supportsSharePlayHandoff
{
  return self->_supportsSharePlayHandoff;
}

- (float)distance
{
  return self->_distance;
}

- (void)setActivatedClusterMembers:(id)a3
{
  objc_storeStrong((id *)&self->_activatedClusterMembers, a3);
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (BOOL)isClusterLeader
{
  return self->_isClusterLeader;
}

- (BOOL)isAppleAccessory
{
  return self->_isAppleAccessory;
}

- (NSString)parentUniqueIdentifier
{
  return self->_parentUniqueIdentifier;
}

- (NSString)roomID
{
  return self->_roomID;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setAllClusterMembers:(id)a3
{
  objc_storeStrong((id *)&self->_allClusterMembers, a3);
}

- (BOOL)supportsConversationDetection
{
  return self->_supportsConversationDetection;
}

- (BOOL)conversationDetectionEnabled
{
  return self->_conversationDetectionEnabled;
}

- (BOOL)engageOnClusterActivate
{
  return self->_engageOnClusterActivate;
}

- (BOOL)volumeMuted
{
  return self->_volumeMuted;
}

- (_MRGroupSessionInfoProtobuf)groupSessionInfo
{
  return self->_groupSessionInfo;
}

- (void)setGroupSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_groupSessionInfo, a3);
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (NSString)playingPairedDeviceName
{
  return self->_playingPairedDeviceName;
}

- (BOOL)supportsRapport
{
  return self->_supportsRapport;
}

- (BOOL)isPickedOnPairedDevice
{
  return self->_isPickedOnPairedDevice;
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
  return self->_isHeadTrackedSpatialAudioActive;
}

- (NSString)headTrackedSpatialAudioMode
{
  return self->_headTrackedSpatialAudioMode;
}

- (NSMutableArray)dnsNames
{
  return self->_dnsNames;
}

- (void)setDnsNames:(id)a3
{
  objc_storeStrong((id *)&self->_dnsNames, a3);
}

@end
