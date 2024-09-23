@implementation MRAVDistantOutputDevice

- (MRAVDistantOutputDevice)initWithDescriptor:(id)a3
{
  id v5;
  MRAVDistantOutputDevice *v6;
  MRAVDistantOutputDevice *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *modelSpecificInfo;
  void *v15;
  MRAVOutputDeviceSourceInfo *v16;
  void *v17;
  uint64_t v18;
  MRAVOutputDeviceSourceInfo *sourceInfo;
  void *v20;
  uint64_t v21;
  NSArray *clusterComposition;
  void *v23;
  uint64_t v24;
  NSArray *activatedClusterMemebers;
  void *v26;
  uint64_t v27;
  NSArray *allClusterMembers;
  void *v29;
  MRAVDistantOutputDevice *v30;
  uint64_t v31;
  NSArray *rooms;
  MRAVDistantOutputDevice *v33;
  _QWORD v35[4];
  MRAVDistantOutputDevice *v36;
  objc_super v37;

  v5 = a3;
  if (v5)
  {
    v37.receiver = self;
    v37.super_class = (Class)MRAVDistantOutputDevice;
    v6 = -[MRAVDistantOutputDevice init](&v37, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_protobuf, a3);
      -[_MRAVOutputDeviceDescriptorProtobuf modelSpecificInfoData](v7->_protobuf, "modelSpecificInfoData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C99E60];
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MRCreateFromData(v8, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      modelSpecificInfo = v7->_modelSpecificInfo;
      v7->_modelSpecificInfo = (NSDictionary *)v13;

      objc_msgSend(v5, "sourceInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = [MRAVOutputDeviceSourceInfo alloc];
      objc_msgSend(v15, "routingContextUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[MRAVOutputDeviceSourceInfo initWithRoutingContextUID:multipleBuiltInDevices:](v16, "initWithRoutingContextUID:multipleBuiltInDevices:", v17, objc_msgSend(v15, "multipleBuiltInDevices"));
      sourceInfo = v7->_sourceInfo;
      v7->_sourceInfo = (MRAVOutputDeviceSourceInfo *)v18;

      objc_msgSend(v5, "clusterCompositions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mr_map:", &__block_literal_global_15);
      v21 = objc_claimAutoreleasedReturnValue();
      clusterComposition = v7->_clusterComposition;
      v7->_clusterComposition = (NSArray *)v21;

      objc_msgSend(v5, "activatedClusterMembers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "msv_map:", &__block_literal_global_7);
      v24 = objc_claimAutoreleasedReturnValue();
      activatedClusterMemebers = v7->_activatedClusterMemebers;
      v7->_activatedClusterMemebers = (NSArray *)v24;

      objc_msgSend(v5, "allClusterMembers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "msv_map:", &__block_literal_global_9_0);
      v27 = objc_claimAutoreleasedReturnValue();
      allClusterMembers = v7->_allClusterMembers;
      v7->_allClusterMembers = (NSArray *)v27;

      -[MRAVOutputDevice roomsLookupTable](v7, "roomsLookupTable");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke_4;
      v35[3] = &unk_1E30C70E0;
      v30 = v7;
      v36 = v30;
      objc_msgSend(v29, "msv_map:", v35);
      v31 = objc_claimAutoreleasedReturnValue();
      rooms = v30->_rooms;
      v30->_rooms = (NSArray *)v31;

    }
    self = v7;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)activatedClusterMembersOutputDevices
{
  return self->_activatedClusterMemebers;
}

- (id)uid
{
  return -[_MRAVOutputDeviceDescriptorProtobuf uniqueIdentifier](self->_protobuf, "uniqueIdentifier");
}

- (id)descriptor
{
  return (id)-[_MRAVOutputDeviceDescriptorProtobuf copy](self->_protobuf, "copy");
}

- (_MRAVOutputDeviceDescriptorProtobuf)protobuf
{
  return self->_protobuf;
}

- (unsigned)deviceType
{
  return -[_MRAVOutputDeviceDescriptorProtobuf deviceType](self->_protobuf, "deviceType");
}

- (id)modelSpecificInfo
{
  return self->_modelSpecificInfo;
}

- (int64_t)transportType
{
  return -[_MRAVOutputDeviceDescriptorProtobuf transportType](self->_protobuf, "transportType");
}

- (BOOL)supportsMultiplayer
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsMultiplayer](self->_protobuf, "supportsMultiplayer");
}

- (unsigned)deviceSubtype
{
  return -[_MRAVOutputDeviceDescriptorProtobuf deviceSubType](self->_protobuf, "deviceSubType");
}

- (BOOL)isLocalDevice
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isLocalDevice](self->_protobuf, "isLocalDevice");
}

- (BOOL)supportsHAP
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsHAP](self->_protobuf, "supportsHAP");
}

- (BOOL)supportsBufferedAirPlay
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsBufferedAirPlay](self->_protobuf, "supportsBufferedAirPlay");
}

- (BOOL)supportsBluetoothSharing
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsBluetoothSharing](self->_protobuf, "supportsBluetoothSharing");
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return -[_MRAVOutputDeviceDescriptorProtobuf presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets](self->_protobuf, "presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets");
}

- (id)parentGroupIdentifier
{
  return -[_MRAVOutputDeviceDescriptorProtobuf parentGroupIdentifier](self->_protobuf, "parentGroupIdentifier");
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  return -[_MRAVOutputDeviceDescriptorProtobuf parentGroupContainsDiscoverableLeader](self->_protobuf, "parentGroupContainsDiscoverableLeader");
}

- (id)name
{
  return -[_MRAVOutputDeviceDescriptorProtobuf name](self->_protobuf, "name");
}

- (id)modelID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf modelID](self->_protobuf, "modelID");
}

- (id)logicalDeviceID
{
  void *v3;
  char v4;
  void *v5;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useClusterDevices");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[_MRAVOutputDeviceDescriptorProtobuf logicalDeviceID](self->_protobuf, "logicalDeviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isUsingJSONProtocol
{
  return -[_MRAVOutputDeviceDescriptorProtobuf usingJSONProtocol](self->_protobuf, "usingJSONProtocol");
}

- (BOOL)isRemoteControllable
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isRemoteControllable](self->_protobuf, "isRemoteControllable");
}

- (BOOL)isProxyGroupPlayer
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isProxyGroupPlayer](self->_protobuf, "isProxyGroupPlayer");
}

- (BOOL)isGroupable
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isGroupable](self->_protobuf, "isGroupable");
}

- (BOOL)isGroupLeader
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isGroupLeader](self->_protobuf, "isGroupLeader");
}

- (BOOL)isDeviceGroupable
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isDeviceGroupable](self->_protobuf, "isDeviceGroupable");
}

- (BOOL)isAirPlayReceiverSessionActive
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isAirPlayReceiverSessionActive](self->_protobuf, "isAirPlayReceiverSessionActive");
}

- (BOOL)isAddedToHomeKit
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isAddedToHomeKit](self->_protobuf, "isAddedToHomeKit");
}

- (BOOL)hasBatteryLevel
{
  return -[_MRAVOutputDeviceDescriptorProtobuf hasBatteryLevel](self->_protobuf, "hasBatteryLevel");
}

- (id)groupID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf groupID](self->_protobuf, "groupID");
}

- (BOOL)groupContainsGroupLeader
{
  return -[_MRAVOutputDeviceDescriptorProtobuf groupContainsGroupLeader](self->_protobuf, "groupContainsGroupLeader");
}

- (id)clusterComposition
{
  return self->_clusterComposition;
}

- (BOOL)canRelayCommunicationChannel
{
  return -[_MRAVOutputDeviceDescriptorProtobuf canRelayCommunicationChannel](self->_protobuf, "canRelayCommunicationChannel");
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return -[_MRAVOutputDeviceDescriptorProtobuf canPlayEncryptedProgressiveDownloadAssets](self->_protobuf, "canPlayEncryptedProgressiveDownloadAssets");
}

- (BOOL)canFetchMediaDataFromSender
{
  return -[_MRAVOutputDeviceDescriptorProtobuf canFetchMediaDataFromSender](self->_protobuf, "canFetchMediaDataFromSender");
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return -[_MRAVOutputDeviceDescriptorProtobuf canAccessiCloudMusicLibrary](self->_protobuf, "canAccessiCloudMusicLibrary");
}

- (BOOL)canAccessRemoteAssets
{
  return -[_MRAVOutputDeviceDescriptorProtobuf canAccessRemoteAssets](self->_protobuf, "canAccessRemoteAssets");
}

- (BOOL)canAccessAppleMusic
{
  return -[_MRAVOutputDeviceDescriptorProtobuf canAccessAppleMusic](self->_protobuf, "canAccessAppleMusic");
}

- (id)bluetoothID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf bluetoothID](self->_protobuf, "bluetoothID");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rooms, 0);
  objc_storeStrong((id *)&self->_allClusterMembers, 0);
  objc_storeStrong((id *)&self->_activatedClusterMemebers, 0);
  objc_storeStrong((id *)&self->_clusterComposition, 0);
  objc_storeStrong((id *)&self->_modelSpecificInfo, 0);
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
}

MRAVOutputDeviceDescription *__46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVOutputDeviceDescription *v3;

  v2 = a2;
  v3 = -[MRAVOutputDeviceDescription initWithDescriptor:]([MRAVOutputDeviceDescription alloc], "initWithDescriptor:", v2);

  return v3;
}

MRAVDistantOutputDevice *__46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantOutputDevice *v3;

  v2 = a2;
  v3 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v2);

  return v3;
}

MRAVOutputDeviceDescription *__46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  MRAVOutputDeviceDescription *v3;

  v2 = a2;
  v3 = -[MRAVOutputDeviceDescription initWithDescriptor:]([MRAVOutputDeviceDescription alloc], "initWithDescriptor:", v2);

  return v3;
}

MRAVRoomOutputDevice *__46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  MRAVRoomOutputDevice *v5;

  v4 = a3;
  v5 = -[MRAVRoomOutputDevice initWithOutputDevice:memberOutputDevices:]([MRAVRoomOutputDevice alloc], "initWithOutputDevice:memberOutputDevices:", *(_QWORD *)(a1 + 32), v4);

  return v5;
}

- (MRAVDistantOutputDevice)initWithSkeleton:(id)a3
{
  id v4;
  _MRAVOutputDeviceDescriptorProtobuf *v5;
  void *v6;
  void *v7;
  void *v8;
  MRAVDistantOutputDevice *v9;

  v4 = a3;
  v5 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](v5, "setUniqueIdentifier:", v6);

  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setName:](v5, "setName:", v7);

  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceType:](v5, "setDeviceType:", objc_msgSend(v4, "deviceType"));
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceSubType:](v5, "setDeviceSubType:", objc_msgSend(v4, "deviceSubType"));
  objc_msgSend(v4, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setModelID:](v5, "setModelID:", v8);

  if (objc_msgSend(v4, "isVolumeControlAvailable"))
  {
    -[_MRAVOutputDeviceDescriptorProtobuf setIsVolumeControlAvailable:](v5, "setIsVolumeControlAvailable:", objc_msgSend(v4, "isVolumeControlAvailable"));
    objc_msgSend(v4, "volume");
    -[_MRAVOutputDeviceDescriptorProtobuf setVolume:](v5, "setVolume:");
  }
  -[_MRAVOutputDeviceDescriptorProtobuf setVolumeCapabilities:](v5, "setVolumeCapabilities:", objc_msgSend(v4, "volumeCapabilities"));
  -[_MRAVOutputDeviceDescriptorProtobuf setHostDeviceClass:](v5, "setHostDeviceClass:", objc_msgSend(v4, "hostDeviceClass"));
  v9 = -[MRAVDistantOutputDevice initWithDescriptor:](self, "initWithDescriptor:", v5);

  return v9;
}

- (MRAVDistantOutputDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MRAVDistantOutputDevice *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MRAVDistantOutputDevice initWithDescriptor:](self, "initWithDescriptor:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_protobuf, CFSTR("protobuf"));
}

- (_MRAVOutputDeviceDescriptorProtobuf)generateDescriptor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRAVDistantOutputDevice;
  -[MRAVOutputDevice descriptor](&v3, sel_descriptor);
  return (_MRAVOutputDeviceDescriptorProtobuf *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)firmwareVersion
{
  return -[_MRAVOutputDeviceDescriptorProtobuf firmwareVersion](self->_protobuf, "firmwareVersion");
}

- (id)tightSyncID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf logicalDeviceID](self->_protobuf, "logicalDeviceID");
}

- (id)MACAddress
{
  return -[_MRAVOutputDeviceDescriptorProtobuf macAddress](self->_protobuf, "macAddress");
}

- (int64_t)hostDeviceClass
{
  return MRDeviceClassFromProtobuf(-[_MRAVOutputDeviceDescriptorProtobuf hostDeviceClass](self->_protobuf, "hostDeviceClass"));
}

- (float)batteryLevel
{
  float result;

  -[_MRAVOutputDeviceDescriptorProtobuf batteryLevel](self->_protobuf, "batteryLevel");
  return result;
}

- (BOOL)supportsExternalScreen
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsExternalScreen](self->_protobuf, "supportsExternalScreen");
}

- (BOOL)requiresAuthorization
{
  return -[_MRAVOutputDeviceDescriptorProtobuf requiresAuthorization](self->_protobuf, "requiresAuthorization");
}

- (float)volume
{
  float result;

  -[_MRAVOutputDeviceDescriptorProtobuf volume](self->_protobuf, "volume");
  return result;
}

- (BOOL)isVolumeMuted
{
  return -[_MRAVOutputDeviceDescriptorProtobuf volumeMuted](self->_protobuf, "volumeMuted");
}

- (id)sourceInfo
{
  return self->_sourceInfo;
}

- (unsigned)volumeCapabilities
{
  return -[_MRAVOutputDeviceDescriptorProtobuf volumeCapabilities](self->_protobuf, "volumeCapabilities");
}

- (unsigned)clusterType
{
  return -[_MRAVOutputDeviceDescriptorProtobuf clusterType](self->_protobuf, "clusterType");
}

- (id)primaryID
{
  if (-[_MRAVOutputDeviceDescriptorProtobuf hasPrimaryUID](self->_protobuf, "hasPrimaryUID"))
    -[_MRAVOutputDeviceDescriptorProtobuf primaryUID](self->_protobuf, "primaryUID");
  else
    -[MRAVDistantOutputDevice uid](self, "uid");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)configuredClusterSize
{
  return -[_MRAVOutputDeviceDescriptorProtobuf configuredClusterSize](self->_protobuf, "configuredClusterSize");
}

- (BOOL)supportsRapportRemoteControlTransport
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsRapportRemoteControlTransport](self->_protobuf, "supportsRapportRemoteControlTransport");
}

- (id)availableBluetoothListeningModes
{
  return -[_MRAVOutputDeviceDescriptorProtobuf availableBluetoothListeningModes](self->_protobuf, "availableBluetoothListeningModes");
}

- (id)currentBluetoothListeningMode
{
  return -[_MRAVOutputDeviceDescriptorProtobuf currentBluetoothListeningMode](self->_protobuf, "currentBluetoothListeningMode");
}

- (BOOL)supportsConversationDetection
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsConversationDetection](self->_protobuf, "supportsConversationDetection");
}

- (BOOL)isConversationDetectionEnabled
{
  return -[_MRAVOutputDeviceDescriptorProtobuf conversationDetectionEnabled](self->_protobuf, "conversationDetectionEnabled");
}

- (BOOL)producesLowFidelityAudio
{
  return -[_MRAVOutputDeviceDescriptorProtobuf producesLowFidelityAudio](self->_protobuf, "producesLowFidelityAudio");
}

- (id)airPlayGroupID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf airPlayGroupID](self->_protobuf, "airPlayGroupID");
}

- (BOOL)supportsSharePlayHandoff
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsSharePlayHandoff](self->_protobuf, "supportsSharePlayHandoff");
}

- (float)distance
{
  float result;

  -[_MRAVOutputDeviceDescriptorProtobuf distance](self->_protobuf, "distance");
  return result;
}

- (BOOL)discoveredOnSameInfra
{
  return -[_MRAVOutputDeviceDescriptorProtobuf discoveredOnSameInfra](self->_protobuf, "discoveredOnSameInfra");
}

- (id)allClusterMembers
{
  return self->_allClusterMembers;
}

- (BOOL)isPickable
{
  return -[_MRAVOutputDeviceDescriptorProtobuf pickable](self->_protobuf, "pickable");
}

- (id)clusterID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf clusterID](self->_protobuf, "clusterID");
}

- (BOOL)isClusterLeader
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isClusterLeader](self->_protobuf, "isClusterLeader");
}

- (BOOL)isAppleAccessory
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isAppleAccessory](self->_protobuf, "isAppleAccessory");
}

- (id)parentUID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf parentUniqueIdentifier](self->_protobuf, "parentUniqueIdentifier");
}

- (id)roomID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf roomID](self->_protobuf, "roomID");
}

- (id)roomName
{
  return -[_MRAVOutputDeviceDescriptorProtobuf roomName](self->_protobuf, "roomName");
}

- (BOOL)supportsEngageOnClusterActivation
{
  return -[_MRAVOutputDeviceDescriptorProtobuf engageOnClusterActivate](self->_protobuf, "engageOnClusterActivate");
}

- (id)rooms
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[MRAVOutputDevice roomsLookupTable](self, "roomsLookupTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__MRAVDistantOutputDevice_rooms__block_invoke;
  v6[3] = &unk_1E30C70E0;
  v6[4] = self;
  objc_msgSend(v3, "msv_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

MRAVRoomOutputDevice *__32__MRAVDistantOutputDevice_rooms__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  MRAVRoomOutputDevice *v5;

  v4 = a3;
  v5 = -[MRAVRoomOutputDevice initWithOutputDevice:memberOutputDevices:]([MRAVRoomOutputDevice alloc], "initWithOutputDevice:memberOutputDevices:", *(_QWORD *)(a1 + 32), v4);

  return v5;
}

- (id)groupableOutputDevice
{
  MRAVDistantOutputDevice *v3;
  void *v4;

  if (-[MRAVDistantOutputDevice isGroupable](self, "isGroupable"))
  {
    v3 = self;
  }
  else
  {
    -[MRAVDistantOutputDevice descriptor](self, "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsGroupable:", 1);
    v3 = (MRAVDistantOutputDevice *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDescriptor:", v4);

  }
  return v3;
}

- (id)groupSessionInfo
{
  MRGroupSessionInfo *v3;
  void *v4;
  MRGroupSessionInfo *v5;

  if (-[_MRAVOutputDeviceDescriptorProtobuf hasGroupSessionInfo](self->_protobuf, "hasGroupSessionInfo"))
  {
    v3 = [MRGroupSessionInfo alloc];
    -[_MRAVOutputDeviceDescriptorProtobuf groupSessionInfo](self->_protobuf, "groupSessionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MRGroupSessionInfo initWithProtobuf:](v3, "initWithProtobuf:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)deviceEnclosureColor
{
  return -[_MRAVOutputDeviceDescriptorProtobuf deviceEnclosureColor](self->_protobuf, "deviceEnclosureColor");
}

- (id)playingPairedDeviceName
{
  return -[_MRAVOutputDeviceDescriptorProtobuf playingPairedDeviceName](self->_protobuf, "playingPairedDeviceName");
}

- (BOOL)supportsRapport
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsRapport](self->_protobuf, "supportsRapport");
}

- (BOOL)isPickedOnPairedDevice
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isPickedOnPairedDevice](self->_protobuf, "isPickedOnPairedDevice");
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  return -[_MRAVOutputDeviceDescriptorProtobuf supportsHeadTrackedSpatialAudio](self->_protobuf, "supportsHeadTrackedSpatialAudio");
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  return -[_MRAVOutputDeviceDescriptorProtobuf allowsHeadTrackedSpatialAudio](self->_protobuf, "allowsHeadTrackedSpatialAudio");
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isHeadTrackedSpatialAudioActive](self->_protobuf, "isHeadTrackedSpatialAudioActive");
}

- (id)headTrackedSpatialAudioMode
{
  return -[_MRAVOutputDeviceDescriptorProtobuf headTrackedSpatialAudioMode](self->_protobuf, "headTrackedSpatialAudioMode");
}

- (id)dnsNames
{
  return -[_MRAVOutputDeviceDescriptorProtobuf dnsNames](self->_protobuf, "dnsNames");
}

@end
