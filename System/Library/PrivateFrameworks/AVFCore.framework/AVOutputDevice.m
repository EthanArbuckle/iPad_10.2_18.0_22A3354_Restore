@implementation AVOutputDevice

- (int64_t)deviceType
{
  return self->_outputDevice->deviceType;
}

- (int64_t)deviceSubType
{
  return self->_outputDevice->deviceSubType;
}

- (id)modelID
{
  return self->_outputDevice->modelID;
}

- (id)identifyingMACAddress
{
  return self->_outputDevice->MACAddress;
}

- (unint64_t)deviceFeatures
{
  return self->_outputDevice->deviceFeatures;
}

- (id)groupID
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "groupID");
}

- (BOOL)isMuted
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isMuted");
}

- (BOOL)requiresAuthorization
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "requiresAuthorization");
}

- (id)availableBluetoothListeningModes
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "availableBluetoothListeningModes");
}

- (id)logicalDeviceID
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "logicalDeviceID");
}

- (id)currentBluetoothListeningMode
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "currentBluetoothListeningMode");
}

- (int64_t)configuredClusterSize
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "configuredClusterSize");
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "supportsHeadTrackedSpatialAudio");
}

- (BOOL)isConversationDetectionEnabled
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isConversationDetectionEnabled");
}

- (BOOL)isClusterLeader
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isClusterLeader");
}

- (id)headTrackedSpatialAudioMode
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "headTrackedSpatialAudioMode");
}

- (BOOL)isAppleAccessory
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isAppleAccessory");
}

- (id)clusterID
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "clusterID");
}

- (BOOL)supportsConversationDetection
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "supportsConversationDetection");
}

- (id)connectedPairedDevices
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "connectedPairedDevices");
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isHeadTrackedSpatialAudioActive");
}

- (BOOL)producesLowFidelityAudio
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "producesLowFidelityAudio");
}

- (BOOL)isInUseByPairedDevice
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isInUseByPairedDevice");
}

- (int64_t)clusterType
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "clusterType");
}

- (id)modelSpecificInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v4 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "caseBatteryLevel");
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("AVOutputDeviceBatteryLevelCaseKey"));
  v5 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "leftBatteryLevel");
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("AVOutputDeviceBatteryLevelLeftKey"));
  v6 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "rightBatteryLevel");
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("AVOutputDeviceBatteryLevelRightKey"));
  v7 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "supportsDataOverACLProtocol");
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("AVOutputDeviceSupportsDataOverACLProtocolKey"));
  v8 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isInEar");
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("AVOutputDeviceIsInEarKey"));
  return (id)objc_msgSend(v3, "copy");
}

- (int64_t)HAPConformance
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "HAPConformance");
}

- (BOOL)supportsBluetoothSharing
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "supportsBluetoothSharing");
}

- (BOOL)groupContainsGroupLeader
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "groupContainsGroupLeader");
}

- (BOOL)canRelayCommunicationChannel
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canRelayCommunicationChannel");
}

- (BOOL)canAccessRemoteAssets
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canAccessRemoteAssets");
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canAccessiCloudMusicLibrary");
}

- (BOOL)canAccessAppleMusic
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canAccessAppleMusic");
}

- (BOOL)canBeGroupLeader
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canBeGroupLeader");
}

- (BOOL)supportsBufferedAirPlay
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "supportsBufferedAirPlay");
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canPlayEncryptedProgressiveDownloadAssets");
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets");
}

- (BOOL)canFetchMediaDataFromSender
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canFetchMediaDataFromSender");
}

- (BOOL)hasBatteryLevel
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "batteryLevel") != 0;
}

- (id)clusteredDeviceDescriptions
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "clusteredDeviceDescriptions");
}

- (int64_t)volumeControlType
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "volumeControlType");
}

- (BOOL)isGroupLeader
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isGroupLeader");
}

- (BOOL)canBeGrouped
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canBeGrouped");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isEqual:", objc_msgSend(a3, "impl"));
  else
    return 0;
}

- (id)airPlayProperties
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "airPlayProperties");
}

- (id)impl
{
  return self->_outputDevice->impl;
}

+ (id)sharedLocalDevice
{
  AVLocalOutputDeviceImpl *v2;
  AVOutputDevice *v3;

  v2 = objc_alloc_init(AVLocalOutputDeviceImpl);
  v3 = -[AVOutputDevice initWithOutputDeviceImpl:commChannelManager:]([AVOutputDevice alloc], "initWithOutputDeviceImpl:commChannelManager:", v2, 0);

  return v3;
}

- (AVOutputDevice)initWithOutputDeviceImpl:(id)a3 commChannelManager:(id)a4
{
  AVOutputDevice *v6;
  AVOutputDevice *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVOutputDevice;
  v6 = -[AVOutputDevice init](&v9, sel_init);
  if (v6
    && (v6->_outputDevice = objc_alloc_init(AVOutputDeviceInternal),
        (v6->_outputDevice->impl = (AVOutputDeviceImpl *)a3) != 0))
  {
    v6->_outputDevice->name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
    v6->_outputDevice->ID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "ID"), "copy");
    v6->_outputDevice->deviceType = objc_msgSend(a3, "deviceType");
    v6->_outputDevice->deviceSubType = objc_msgSend(a3, "deviceSubType");
    v6->_outputDevice->manufacturer = (NSString *)objc_msgSend((id)objc_msgSend(a3, "manufacturer"), "copy");
    v6->_outputDevice->modelID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "modelID"), "copy");
    v6->_outputDevice->serialNumber = (NSString *)objc_msgSend((id)objc_msgSend(a3, "serialNumber"), "copy");
    v6->_outputDevice->firmwareVersion = (NSString *)objc_msgSend((id)objc_msgSend(a3, "firmwareVersion"), "copy");
    v6->_outputDevice->MACAddress = (NSData *)objc_msgSend((id)objc_msgSend(a3, "identifyingMACAddress"), "copy");
    v6->_outputDevice->deviceFeatures = objc_msgSend(a3, "deviceFeatures");
    -[AVOutputDeviceImpl setImplEventListener:](v6->_outputDevice->impl, "setImplEventListener:", v6);
    v6->_outputDevice->commChannelManager = (AVOutputDeviceCommunicationChannelManager *)a4;
    -[AVOutputDeviceCommunicationChannelManager setParentOutputDevice:](v6->_outputDevice->commChannelManager, "setParentOutputDevice:", v6);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)name
{
  return self->_outputDevice->name;
}

- (double)frecencyScore
{
  double result;

  +[AVOutputDeviceFrecencyManager frecencyScoreForDeviceID:](AVOutputDeviceFrecencyManager, "frecencyScoreForDeviceID:", -[AVOutputDevice ID](self, "ID"));
  return result;
}

- (id)deviceID
{
  return self->_outputDevice->ID;
}

+ (BOOL)prefersRouteDescriptors
{
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("UseFigRouteDescriptor"), CFSTR("com.apple.avfoundation"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    AppBooleanValue = objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier") != (_QWORD)CFSTR("AVPlatformIdentifierMacOS");
  return AppBooleanValue != 0;
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 routeDiscoverer:(OpaqueFigRouteDiscoverer *)a4
{
  uint64_t v6;
  AVFigRouteDescriptorOutputDeviceImpl *v7;
  AVSystemRemotePoolOutputDeviceCommunicationChannelManager *v8;
  AVOutputDevice *v9;

  FigVolumeControllerCopySharedControllerRemote();
  v6 = AVDefaultRoutingContextFactory();
  v7 = -[AVFigRouteDescriptorOutputDeviceImpl initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:]([AVFigRouteDescriptorOutputDeviceImpl alloc], "initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:", a3, a4, 0, v6, AVOutputContextUsesRouteConfigUpdatedNotification(), 0);
  v8 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager initWithDeviceID:]([AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc], "initWithDeviceID:", -[AVFigRouteDescriptorOutputDeviceImpl ID](v7, "ID"));
  v9 = -[AVOutputDevice initWithOutputDeviceImpl:commChannelManager:]([AVOutputDevice alloc], "initWithOutputDeviceImpl:commChannelManager:", v7, v8);

  return v9;
}

- (void)dealloc
{
  AVOutputDeviceInternal *outputDevice;
  objc_super v4;

  outputDevice = self->_outputDevice;
  if (outputDevice)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVOutputDevice;
  -[AVOutputDevice dealloc](&v4, sel_dealloc);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3
{
  return (AVOutputDevice *)objc_msgSend(a1, "outputDeviceWithRouteDescriptor:withRoutingContext:", a3, 0);
}

- (AVOutputDevice)init
{
  AVOutputDevice *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = self;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available"), v5, v6, v7, v8, v9, v11), 0);
  objc_exception_throw(v10);
}

- (unint64_t)hash
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), -[AVOutputDevice name](self, "name"), -[AVOutputDevice ID](self, "ID"));
}

- (id)manufacturer
{
  return self->_outputDevice->manufacturer;
}

- (id)serialNumber
{
  return self->_outputDevice->serialNumber;
}

- (id)firmwareVersion
{
  return self->_outputDevice->firmwareVersion;
}

- (BOOL)isEligibleToBePredictedOutputDevice
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isEligibleToBePredictedOutputDevice");
}

- (BOOL)isActivatedForContinuityScreen
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isActivatedForContinuityScreen");
}

- (float)batteryLevel
{
  float result;

  objc_msgSend((id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "batteryLevel"), "floatValue");
  return result;
}

- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "automaticallyAllowsConnectionsFromPeersInHomeGroup");
}

- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "onlyAllowsConnectionsFromPeersInHomeGroup");
}

- (void)setSecondDisplayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "setSecondDisplayEnabled:", v3);
}

- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  os_log_type_t type;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    v13 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = -[AVOutputDevice impl](self, "impl", v9, v10);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__AVOutputDevice_setSecondDisplayMode_completionHandler___block_invoke;
  v11[3] = &unk_1E30338A8;
  v11[4] = a4;
  objc_msgSend(v8, "setSecondDisplayMode:completionHandler:", a3, v11);
}

uint64_t __57__AVOutputDevice_setSecondDisplayMode_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (float)volume
{
  float result;

  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "volume");
  return result;
}

- (void)outputDeviceImplDidChangeVolume:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputDeviceVolumeDidChangeNotification"), self);
}

- (BOOL)canSetVolume
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canSetVolume");
}

- (void)outputDeviceImplDidChangeCanChangeVolume:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputDeviceCanSetVolumeDidChangeNotification"), self);
}

- (void)outputDeviceImplDidChangeVolumeControlType:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputDeviceVolumeControlTypeDidChangeNotification"), self);
}

- (void)outputDeviceImplDidChangeMute:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputDeviceMutedDidChangeNotification"), self);
}

- (void)postNotification:(id)a3 fromImpl:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4, v7, v8), "postNotificationName:object:", a3, self);
}

- (void)postNotification:(id)a3 withPayload:(id)a4 fromImpl:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4, a5, v9, v10), "postNotificationName:object:userInfo:", a3, self, a4);
}

- (void)outputDeviceImplCanMuteDidChange:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputDeviceCanMuteDidChangeNotification"), self);
}

- (void)activatedDeviceClusterMembersDidChangeVolume:(id)a3 forRoomID:(__CFString *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  _QWORD v11[21];

  v11[20] = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = CFSTR("AVOutputDeviceActivatedClusterMembersRoomIDKey");
  v11[0] = a4;
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1, v8, v9);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVOutputDeviceActivatedClusterMembersRoomVolumeDidChangeNotification"), self, v7);
}

+ (void)localDeviceDidChange
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v3, v4), "postNotificationName:object:", CFSTR("AVOutputDeviceLocalDeviceDidChangeNotification"), objc_opt_class());
}

- (void)setVolume:(float)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = -[AVOutputDevice impl](self, "impl", v8, v9);
  *(float *)&v7 = a3;
  objc_msgSend(v6, "setVolume:", v7);
}

- (void)increaseVolumeByCount:(int64_t)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "increaseVolumeByCount:", a3);
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "decreaseVolumeByCount:", a3);
}

- (void)setActivatedDeviceClusterMembersVolume:(float)a3 withRoomID:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = -[AVOutputDevice impl](self, "impl", v10, v11);
  *(float *)&v9 = a3;
  objc_msgSend(v8, "setActivatedDeviceClusterMembersVolume:withRoomID:", a4, v9);
}

- (float)volumeForActivatedDeviceClusterMembersWithRoomID:(id)a3
{
  float result;

  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "volumeForActivatedDeviceClusterMembersWithRoomID:", a3);
  return result;
}

- (BOOL)canMute
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canMute");
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "setMuted:", v3);
}

- (id)proposedGroupID
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "proposedGroupID");
}

- (void)outputDeviceImplDidChangeProposedGroupID:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputDeviceProposedGroupIDDidChangeNotification"), self);
}

- (BOOL)participatesInGroupPlayback
{
  id v3;

  v3 = -[AVOutputDevice groupID](self, "groupID");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "participatesInGroupPlayback");
  return (char)v3;
}

- (BOOL)isLogicalDeviceLeader
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isLogicalDeviceLeader");
}

- (BOOL)canCommunicateWithAllLogicalDeviceMembers
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "canCommunicateWithAllLogicalDeviceMembers");
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "allowsHeadTrackedSpatialAudio");
}

- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(-[AVOutputDevice impl](self, "impl", v9, v10), "setAllowsHeadTrackedSpatialAudio:error:", v5, a4);
}

- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "setConversationDetectionEnabled:error:", a3, a4);
}

- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(-[AVOutputDevice impl](self, "impl", v9, v10), "setHeadTrackedSpatialAudioMode:error:", a3, a4);
}

- (void)setCurrentBluetoothListeningMode:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputDevice setCurrentBluetoothListeningMode:error:](self, "setCurrentBluetoothListeningMode:error:", a3, 0, v6, v7);
}

- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  signed int v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id v17[21];

  v17[20] = *(id *)MEMORY[0x1E0C80C00];
  v17[0] = 0;
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = objc_msgSend(-[AVOutputDevice impl](self, "impl", v15, v16), "setCurrentBluetoothListeningMode:error:", a3, v17);
  v9 = v8;
  if (a4 && !v8 && v17[0])
  {
    v10 = objc_msgSend(v17[0], "code");
    if (v10 == 1852797029)
    {
      v11 = (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11910, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v17[0], *MEMORY[0x1E0CB3388]));
    }
    else
    {
      v12 = v10;
      v13 = (void *)objc_msgSend(v17[0], "domain");
      if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
        v11 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v12, 0);
      else
        v11 = v17[0];
    }
    *a4 = v11;
  }
  return v9;
}

- (BOOL)supportsFitnessDataDestination
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "supportsFitnessDataDestination");
}

- (BOOL)supportsScreenMirroringControls
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "supportsScreenMirroringControls");
}

- (void)openCommunicationChannelWithOptions:(id)a3 completionHandler:(id)a4
{
  -[AVOutputDevice openCommunicationChannelToDestination:options:completionHandler:](self, "openCommunicationChannelToDestination:options:completionHandler:", CFSTR("AVOutputDeviceCommunicationChannelDataDestinationMediaRemote"), a3, a4);
}

- (void)openCommunicationChannelToDestination:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[14];
  os_log_type_t type;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionCancelIfAuthRequired"));
  v9 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionCorrelationID"));
  v10 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionInitiator"));
  v11 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionAuthorizationToken"));
  v24 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionControlType"));
  v12 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionClientUUID"));
  v23 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionQualityOfService"));
  v22 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionStreamPriority"));
  v21 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionAwaitReply"));
  if (dword_1ECDECED8)
  {
    v28 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[AVOutputDevice deviceType](self, "deviceType", v19, v20) == 2)
    v14 = +[AVOutputContext sharedSystemRemoteDisplayContext](AVOutputContext, "sharedSystemRemoteDisplayContext");
  else
    v14 = +[AVOutputContext sharedSystemRemotePoolContext](AVOutputContext, "sharedSystemRemotePoolContext");
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = v16;
    if (v9)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, 0x1E3046F78);
    if (v10)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, CFSTR("AVOutputContextAddOutputDeviceOptionInitiator"));
    if (objc_msgSend(v8, "BOOLValue"))
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v8, CFSTR("AVOutputContextAddOutputDeviceCancelIfAuthRequiredKey"));
    if (v11)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, CFSTR("AVOutputContextAddOutputDeviceOptionAuthorizationToken"));
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __82__AVOutputDevice_openCommunicationChannelToDestination_options_completionHandler___block_invoke;
    v26[3] = &unk_1E30338D0;
    v26[4] = v24;
    v26[5] = a3;
    v26[6] = v9;
    v26[7] = v12;
    v26[8] = v23;
    v26[9] = v22;
    v26[10] = v21;
    v26[11] = v15;
    v26[12] = self;
    v26[13] = a5;
    objc_msgSend(v15, "addOutputDevice:options:completionHandler:", self, v17, v26);
  }
  else
  {
    v18 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Error retrieving system remote pool context."), *MEMORY[0x1E0CB2938]));
    (*((void (**)(id, _QWORD, uint64_t, _QWORD))a5 + 2))(a5, 0, v18, 0);
  }
}

void __82__AVOutputDevice_openCommunicationChannelToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void **p_vtable;
  uint64_t v5;
  __CFDictionary *Mutable;
  void *v7;
  char v8;
  uint64_t v9;
  AVOutputDeviceCommunicationChannel *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, CFArrayRef *);
  signed int v15;
  CFIndex Count;
  CFIndex v17;
  CFIndex v18;
  uint64_t v19;
  const void *ValueAtIndex;
  uint64_t CMBaseObject;
  void (*v22)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t (*v24)(const void *, __CFDictionary *, CFTypeRef *);
  signed int v25;
  AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *v26;
  AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *v27;
  NSObject *v28;
  CFTypeRef v29;
  CFArrayRef theArray;
  CFTypeRef cf[18];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v29 = 0;
  theArray = 0;
  p_vtable = &OBJC_METACLASS___AVObservationBlockFactory.vtable;
  if (objc_msgSend(a2, "status") != 2)
  {
    objc_msgSend(a2, "cancellationReason");
    Mutable = 0;
    v10 = 0;
    goto LABEL_44;
  }
  v5 = *MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelControlTypeDirect")) & 1) != 0)
    {
      v8 = 0;
      v9 = 2;
    }
    else
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelControlTypeRelayed"));
      v8 = v11 ^ 1;
      v9 = v11;
    }
  }
  else
  {
    v9 = 0;
    v8 = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelDataDestinationMediaRemote"))|| objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelDataDestinationFitness"))|| objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelDataDestinationCarPlayData"))|| objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelDataDestinationCarPlayDataVersionTwo"))|| objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelDataDestinationCarPlayDataUpdate"))
    || objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelDataDestinationCarPlayDataLogging")))
  {
    if ((v8 & 1) != 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelDataDestinationCarPlayClusterControl"));
  if ((v8 & 1) == 0)
LABEL_15:
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA4528], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9));
LABEL_16:
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  FigCFDictionarySetInt32();
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  v12 = *(void **)(a1 + 80);
  if (v12)
  {
    objc_msgSend(v12, "BOOLValue");
    FigCFDictionarySetValue();
  }
  v13 = objc_msgSend(*(id *)(a1 + 88), "figRoutingContext");
  if (!v13)
  {
    AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
    goto LABEL_43;
  }
  v14 = *(uint64_t (**)(uint64_t, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
  if (v14)
  {
    v15 = v14(v13, &theArray);
    if (v15)
    {
      v25 = v15;
      goto LABEL_42;
    }
    if (!theArray)
      goto LABEL_37;
    Count = CFArrayGetCount(theArray);
    if (Count < 1)
      goto LABEL_37;
    v17 = Count;
    v18 = 0;
    v19 = *MEMORY[0x1E0CA4258];
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v18);
      cf[0] = 0;
      CMBaseObject = FigEndpointGetCMBaseObject();
      v22 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
      if (v22)
        v22(CMBaseObject, v19, v5, cf);
      objc_msgSend(*(id *)(a1 + 96), "deviceID");
      if (FigCFEqual())
        break;
      if (cf[0])
        CFRelease(cf[0]);
      if (v17 == ++v18)
        goto LABEL_37;
    }
    if (cf[0])
      CFRelease(cf[0]);
    if (!ValueAtIndex || (FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass()))
    {
LABEL_37:
      AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
      v10 = 0;
      p_vtable = (void **)(&OBJC_METACLASS___AVObservationBlockFactory + 24);
      goto LABEL_44;
    }
    p_vtable = &OBJC_METACLASS___AVObservationBlockFactory.vtable;
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      p_vtable = (void **)(&OBJC_METACLASS___AVObservationBlockFactory + 24);
    }
    v24 = *(uint64_t (**)(const void *, __CFDictionary *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 24)
                                                                                + 80);
    if (v24)
    {
      v25 = v24(ValueAtIndex, Mutable, &v29);
      if (!v25)
      {
        v26 = [AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl alloc];
        v27 = -[AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl initWithRemoteControlSession:](v26, "initWithRemoteControlSession:", v29);
        v10 = -[AVOutputDeviceCommunicationChannel initWithOutputDeviceCommunicationChannelImpl:]([AVOutputDeviceCommunicationChannel alloc], "initWithOutputDeviceCommunicationChannelImpl:", v27);

        goto LABEL_44;
      }
      goto LABEL_42;
    }
  }
  v25 = -12782;
LABEL_42:
  AVLocalizedErrorWithUnderlyingOSStatus(v25, 0);
LABEL_43:
  v10 = 0;
LABEL_44:
  (*(void (**)(_QWORD, AVOutputDeviceCommunicationChannel *))(*(_QWORD *)(a1 + 104) + 16))(*(_QWORD *)(a1 + 104), v10);
  if (*((_DWORD *)p_vtable + 950))
  {
    v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (Mutable)
    CFRelease(Mutable);
  if (v29)
    CFRelease(v29);
  if (theArray)
    CFRelease(theArray);

}

- (void)setCommunicationChannelDelegate:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_storeWeak((id *)&self->_outputDevice->communicationChannelDelegate, a3);
}

- (id)communicationChannelDelegate
{
  return objc_loadWeak((id *)&self->_outputDevice->communicationChannelDelegate);
}

- (void)communicationChannelManager:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5
{
  id Weak;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak((id *)&self->_outputDevice->communicationChannelDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(Weak, "outputDevice:didReceiveData:fromCommunicationChannel:", self, a4, a5, v11, v12);
  }
  else if (dword_1ECDECED8)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)communicationChannelManager:(id)a3 didCloseCommunicationChannel:(id)a4
{
  id Weak;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak((id *)&self->_outputDevice->communicationChannelDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(Weak, "outputDevice:didCloseCommunicationChannel:", self, a4, v9, v10);
  }
  else if (dword_1ECDECED8)
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)configureUsingBlock:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  os_log_type_t type;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceConfigurationOptionCancelConfigurationIfAuthRequired"));
  if (dword_1ECDECED8)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = -[AVOutputDevice impl](self, "impl", v11, v12);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__AVOutputDevice_configureUsingBlock_options_completionHandler___block_invoke;
  v13[3] = &unk_1E30338F8;
  v13[4] = a5;
  objc_msgSend(v10, "configureUsingBlock:options:completionHandler:", a3, a4, v13);
}

uint64_t __64__AVOutputDevice_configureUsingBlock_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
}

- (void)configureUsingBlock:(id)a3 completionHandler:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  os_log_type_t type;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    v12 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__AVOutputDevice_configureUsingBlock_completionHandler___block_invoke;
  v10[3] = &unk_1E30338F8;
  v10[4] = a4;
  -[AVOutputDevice configureUsingBlock:options:completionHandler:](self, "configureUsingBlock:options:completionHandler:", a3, 0, v10, v8, v9);
}

uint64_t __56__AVOutputDevice_configureUsingBlock_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3);
}

- (void)setMediaRemoteData:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "setMediaRemoteData:completionHandler:", a3, a4);
}

- (void)updateFrecencyScore
{
  +[AVOutputDeviceFrecencyManager updateFrecencyListForDeviceID:](AVOutputDeviceFrecencyManager, "updateFrecencyListForDeviceID:", -[AVOutputDevice ID](self, "ID"));
}

- (id)OEMIcons
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "OEMIcons");
}

- (id)OEMIconLabel
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "OEMIconLabel");
}

- (BOOL)OEMIconVisible
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "OEMIconVisible");
}

- (id)outputDeviceHIDs
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "outputDeviceHIDs");
}

- (BOOL)nightMode
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "nightMode");
}

- (BOOL)isNightModeSupported
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isNightModeSupported");
}

- (BOOL)rightHandDrive
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "rightHandDrive");
}

- (id)limitedUIElements
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "limitedUIElements");
}

- (BOOL)limitedUI
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "limitedUI");
}

- (BOOL)carOwnsScreen
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "carOwnsScreen");
}

- (BOOL)ownsTurnByTurnNavigation
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "ownsTurnByTurnNavigation");
}

- (BOOL)recognizingSpeech
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "recognizingSpeech");
}

- (id)supportedFeatures
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "supportedFeatures");
}

- (int64_t)electronicTollCollection
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "electronicTollCollection");
}

- (int64_t)navigationAidedDriving
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "navigationAidedDriving");
}

- (int64_t)transportType
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "transportType");
}

- (id)MFiCertificateSerialNumber
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "MFiCertificateSerialNumber");
}

- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4
{
  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "requestViewArea:forScreenID:", a3, a4);
}

- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4
{
  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "requestCarUIForURL:withUUID:", a3, a4);
}

- (id)requestTurnByTurnNavigationOwnership
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "requestTurnByTurnNavigationOwnership");
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "borrowScreenForClient:reason:", a3, a4);
}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "takeScreenForClient:reason:", a3, a4);
}

- (BOOL)siriForwardingEnabled
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "siriForwardingEnabled");
}

- (void)setSiriForwardingEnabled:(BOOL)a3
{
  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "setSiriForwardingEnabled:", a3);
}

- (BOOL)carOwnsMainAudio
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "carOwnsMainAudio");
}

- (id)displayCornerMasks
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "displayCornerMasks");
}

- (void)setDisplayCornerMasks:(id)a3
{
  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "setDisplayCornerMasks:", a3);
}

- (int64_t)voiceTriggerMode
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "voiceTriggerMode");
}

- (int64_t)authenticationType
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "authenticationType");
}

- (id)currentScreenViewAreaForScreenID:(id)a3
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "currentScreenViewAreaForScreenID:", a3);
}

- (BOOL)isActivated
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isActivated");
}

- (id)screens
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "screens");
}

- (id)outputDeviceInfo
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "outputDeviceInfo");
}

- (void)suggestUIWithURLs:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "suggestUIWithURLs:completionHandler:", a3, a4);
}

- (void)performHapticFeedbackForUUID:(id)a3 withHapticType:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(-[AVOutputDevice impl](self, "impl"), "performHapticFeedbackForUUID:withHapticType:completionHandler:", a3, a4, a5);
}

- (void)setDelegate:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "setDelegate:", a3);
}

- (id)delegate
{
  return (id)objc_msgSend(-[AVOutputDevice impl](self, "impl"), "delegate");
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 volumeController:(OpaqueFigVolumeControllerState *)a4
{
  const void *v6;
  uint64_t v7;
  AVFigRouteDescriptorOutputDeviceImpl *v8;
  AVSystemRemotePoolOutputDeviceCommunicationChannelManager *v9;
  AVOutputDevice *v10;

  v6 = (const void *)AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor((uint64_t)a3);
  v7 = AVDefaultRoutingContextFactory();
  v8 = -[AVFigRouteDescriptorOutputDeviceImpl initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:]([AVFigRouteDescriptorOutputDeviceImpl alloc], "initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:", a3, v6, a4, v7, AVOutputContextUsesRouteConfigUpdatedNotification(), 0);
  v9 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager initWithDeviceID:]([AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc], "initWithDeviceID:", -[AVFigRouteDescriptorOutputDeviceImpl ID](v8, "ID"));
  v10 = -[AVOutputDevice initWithOutputDeviceImpl:commChannelManager:]([AVOutputDevice alloc], "initWithOutputDeviceImpl:commChannelManager:", v8, v9);
  if (v6)
    CFRelease(v6);

  return v10;
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 routingContextFactory:(id)a4
{
  const void *v6;
  AVFigRouteDescriptorOutputDeviceImpl *v7;
  AVSystemRemotePoolOutputDeviceCommunicationChannelManager *v8;
  AVOutputDevice *v9;

  v6 = (const void *)AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor((uint64_t)a3);
  FigVolumeControllerCopySharedControllerRemote();
  v7 = -[AVFigRouteDescriptorOutputDeviceImpl initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:]([AVFigRouteDescriptorOutputDeviceImpl alloc], "initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:", a3, v6, 0, a4, AVOutputContextUsesRouteConfigUpdatedNotification(), 0);
  v8 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager initWithDeviceID:]([AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc], "initWithDeviceID:", -[AVFigRouteDescriptorOutputDeviceImpl ID](v7, "ID"));
  v9 = -[AVOutputDevice initWithOutputDeviceImpl:commChannelManager:]([AVOutputDevice alloc], "initWithOutputDeviceImpl:commChannelManager:", v7, v8);
  if (v6)
    CFRelease(v6);

  return v9;
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 withRoutingContext:(OpaqueFigRoutingContext *)a4
{
  const void *v6;
  uint64_t v7;
  AVFigRouteDescriptorOutputDeviceImpl *v8;
  AVSystemRemotePoolOutputDeviceCommunicationChannelManager *v9;
  AVOutputDevice *v10;

  if (a3)
  {
    v6 = (const void *)AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor((uint64_t)a3);
    FigVolumeControllerCopySharedControllerRemote();
    v7 = AVDefaultRoutingContextFactory();
    v8 = -[AVFigRouteDescriptorOutputDeviceImpl initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:]([AVFigRouteDescriptorOutputDeviceImpl alloc], "initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:", a3, v6, 0, v7, AVOutputContextUsesRouteConfigUpdatedNotification(), a4);
    v9 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager initWithDeviceID:]([AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc], "initWithDeviceID:", -[AVFigRouteDescriptorOutputDeviceImpl ID](v8, "ID"));
    v10 = -[AVOutputDevice initWithOutputDeviceImpl:commChannelManager:]([AVOutputDevice alloc], "initWithOutputDeviceImpl:commChannelManager:", v8, v9);
    if (v6)
      CFRelease(v6);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (AVOutputDevice)outputDeviceWithFigEndpoint:(OpaqueFigEndpoint *)a3
{
  uint64_t v5;
  AVFigEndpointOutputDeviceImpl *v6;
  void *v7;

  FigVolumeControllerCopySharedControllerRemote();
  v5 = AVDefaultRoutingContextFactory();
  if (a3)
  {
    v6 = -[AVFigEndpointOutputDeviceImpl initWithFigEndpoint:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:]([AVFigEndpointOutputDeviceImpl alloc], "initWithFigEndpoint:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:", a3, 0, v5, AVOutputContextUsesRouteConfigUpdatedNotification());
    a3 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager initWithDeviceID:]([AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc], "initWithDeviceID:", -[AVFigEndpointOutputDeviceImpl ID](v6, "ID"));
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOutputDeviceImpl:commChannelManager:", v6, a3);

  }
  else
  {
    v7 = 0;
  }

  return (AVOutputDevice *)v7;
}

+ (AVOutputDevice)outputDeviceWithFigEndpoint:(OpaqueFigEndpoint *)a3 volumeController:(OpaqueFigVolumeControllerState *)a4
{
  uint64_t v7;
  AVFigEndpointOutputDeviceImpl *v8;
  AVSystemRemotePoolOutputDeviceCommunicationChannelManager *v9;
  void *v10;

  v7 = AVDefaultRoutingContextFactory();
  v8 = -[AVFigEndpointOutputDeviceImpl initWithFigEndpoint:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:]([AVFigEndpointOutputDeviceImpl alloc], "initWithFigEndpoint:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:", a3, a4, v7, AVOutputContextUsesRouteConfigUpdatedNotification());
  v9 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager initWithDeviceID:]([AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc], "initWithDeviceID:", -[AVFigEndpointOutputDeviceImpl ID](v8, "ID"));
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOutputDeviceImpl:commChannelManager:", v8, v9);

  return (AVOutputDevice *)v10;
}

+ (AVOutputDevice)outputDeviceWithFigEndpoint:(OpaqueFigEndpoint *)a3 routingContextFactory:(id)a4
{
  AVFigEndpointOutputDeviceImpl *v7;
  AVSystemRemotePoolOutputDeviceCommunicationChannelManager *v8;
  void *v9;

  FigVolumeControllerCopySharedControllerRemote();
  v7 = -[AVFigEndpointOutputDeviceImpl initWithFigEndpoint:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:]([AVFigEndpointOutputDeviceImpl alloc], "initWithFigEndpoint:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:", a3, 0, a4, AVOutputContextUsesRouteConfigUpdatedNotification());
  v8 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager initWithDeviceID:]([AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc], "initWithDeviceID:", -[AVFigEndpointOutputDeviceImpl ID](v7, "ID"));
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOutputDeviceImpl:commChannelManager:", v7, v8);

  return (AVOutputDevice *)v9;
}

- (id)figEndpointOutputDeviceImpl
{
  id v2;

  v2 = -[AVOutputDevice impl](self, "impl");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

@end
