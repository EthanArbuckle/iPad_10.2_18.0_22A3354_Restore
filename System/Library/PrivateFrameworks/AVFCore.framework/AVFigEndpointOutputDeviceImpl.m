@implementation AVFigEndpointOutputDeviceImpl

- (AVFigEndpointOutputDeviceImpl)init
{
  return -[AVFigEndpointOutputDeviceImpl initWithFigEndpoint:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:](self, "initWithFigEndpoint:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:", 0, 0, 0, 0);
}

- (AVFigEndpointOutputDeviceImpl)initWithFigEndpoint:(OpaqueFigEndpoint *)a3 volumeController:(OpaqueFigVolumeControllerState *)a4 routingContextFactory:(id)a5 useRouteConfigUpdatedNotification:(BOOL)a6
{
  AVFigEndpointOutputDeviceImpl *v11;
  id v12;
  OpaqueFigVolumeControllerState *v13;
  AVWeakReference *v14;
  OpaqueFigVolumeControllerState *volumeController;
  AVFigEndpointOutputDeviceImpl *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  objc_super v25;

  if (!a3)
  {
    v18 = self;
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v19, v20, v21, v22, v23, (uint64_t)"figEndpoint != NULL"), 0);
    objc_exception_throw(v24);
  }
  v25.receiver = self;
  v25.super_class = (Class)AVFigEndpointOutputDeviceImpl;
  v11 = -[AVFigEndpointOutputDeviceImpl init](&v25, sel_init);
  if (v11)
  {
    v12 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v11->_figEndpoint = (OpaqueFigEndpoint *)CFRetain(a3);
    v13 = a4 ? (OpaqueFigVolumeControllerState *)CFRetain(a4) : 0;
    v11->_volumeController = v13;
    v11->_routingContextFactory = (FigRoutingContextFactory *)a5;
    v11->_useRouteConfigUpdatedNotification = a6;
    v14 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v11);
    v11->_weakObserver = v14;
    volumeController = v11->_volumeController;
    if (volumeController)
    {
      objc_msgSend(v12, "addListenerWithWeakReference:callback:name:object:flags:", v14, AVFigEndpointOutputDeviceImplCanSetEndpointVolumeDidChange, *MEMORY[0x1E0D48E20], volumeController, 0);
      objc_msgSend(v12, "addListenerWithWeakReference:callback:name:object:flags:", v11->_weakObserver, AVFigEndpointOutputDeviceImplEndpointVolumeDidChange, *MEMORY[0x1E0D48E48], v11->_volumeController, 0);
      objc_msgSend(v12, "addListenerWithWeakReference:callback:name:object:flags:", v11->_weakObserver, AVFigEndpointOutputDeviceImplEndpointVolumeControlTypeDidChange, *MEMORY[0x1E0D48E40], v11->_volumeController, 0);
      objc_msgSend(v12, "addListenerWithWeakReference:callback:name:object:flags:", v11->_weakObserver, AVFigEndpointOutputDeviceImplEndpointMutedDidChange, *MEMORY[0x1E0D48E38], v11->_volumeController, 0);
      objc_msgSend(v12, "addListenerWithWeakReference:callback:name:object:flags:", v11->_weakObserver, AVFigEndpointOutputDeviceImplEndpointCanMuteDidChange, *MEMORY[0x1E0D48E60], v11->_volumeController, 0);
      objc_msgSend(v12, "addListenerWithWeakReference:callback:name:object:flags:", v11->_weakObserver, AVFigEndpointOutputDeviceImplEndpointRoomVolumeDidChange, *MEMORY[0x1E0D48E78], v11->_volumeController, 0);
    }
  }
  if (v11->_figEndpoint)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddListeners();
  }
  return v11;
}

- (void)dealloc
{
  id v3;
  void *v4;
  OpaqueFigEndpoint *figEndpoint;
  OpaqueFigVolumeControllerState *volumeController;
  objc_super v7;

  if (self->_weakObserver)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    if (self->_volumeController)
    {
      v4 = v3;
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigEndpointOutputDeviceImplCanSetEndpointVolumeDidChange, *MEMORY[0x1E0D48E20]);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigEndpointOutputDeviceImplEndpointVolumeDidChange, *MEMORY[0x1E0D48E48], self->_volumeController);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigEndpointOutputDeviceImplEndpointVolumeControlTypeDidChange, *MEMORY[0x1E0D48E40], self->_volumeController);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigEndpointOutputDeviceImplEndpointMutedDidChange, *MEMORY[0x1E0D48E38], self->_volumeController);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigEndpointOutputDeviceImplEndpointCanMuteDidChange, *MEMORY[0x1E0D48E60], self->_volumeController);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigEndpointOutputDeviceImplEndpointRoomVolumeDidChange, *MEMORY[0x1E0D48E78], self->_volumeController);
    }
    if (self->_figEndpoint)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveListeners();
    }
  }

  figEndpoint = self->_figEndpoint;
  if (figEndpoint)
    CFRelease(figEndpoint);
  volumeController = self->_volumeController;
  if (volumeController)
    CFRelease(volumeController);

  v7.receiver = self;
  v7.super_class = (Class)AVFigEndpointOutputDeviceImpl;
  -[AVFigEndpointOutputDeviceImpl dealloc](&v7, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  -[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint");
  objc_msgSend(a3, "figEndpoint");
  return FigCFEqual() != 0;
}

- (unint64_t)hash
{
  return -[NSString hash](-[AVFigEndpointOutputDeviceImpl ID](self, "ID"), "hash");
}

- (id)_figEndpointPropertyValueForKey:(__CFString *)a3
{
  uint64_t CMBaseObject;
  void (*v5)(uint64_t, __CFString *, _QWORD, void **);
  void *v6;
  void *v8;

  v8 = 0;
  -[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint");
  CMBaseObject = FigEndpointGetCMBaseObject();
  v5 = *(void (**)(uint64_t, __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v5)
  {
    v5(CMBaseObject, a3, *MEMORY[0x1E0C9AE00], &v8);
    v6 = v8;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)name
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4348]);
}

- (NSString)ID
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4258]);
}

- (int64_t)deviceType
{
  id v2;

  v2 = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4468]);
  objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  if (!v2)
    return 0;
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA4970]) & 1) != 0)
    return 1;
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA4978]))
    return 2;
  return 0;
}

- (int64_t)deviceSubType
{
  id v2;

  v2 = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA43D8]);
  objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  return AVOutputDeviceSubTypeFromFigSubType((uint64_t)v2);
}

- (int64_t)clusterType
{
  -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA41A0]);
  if (FigCFEqual())
    return 2;
  else
    return FigCFEqual() != 0;
}

- (int64_t)configuredClusterSize
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4198]), "integerValue");
}

- (NSString)manufacturer
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4318]);
}

- (NSString)modelID
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4338]);
}

- (NSString)serialNumber
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA43A8]);
}

- (NSString)firmwareVersion
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4210]);
}

- (NSData)identifyingMACAddress
{
  return (NSData *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4310]);
}

- (NSArray)clusteredDeviceDescriptions
{
  return (NSArray *)AVOutputDeviceDescriptionsFromFigDescriptions(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4180]));
}

- (BOOL)isClusterLeader
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4278]), "BOOLValue");
}

- (BOOL)producesLowFidelityAudio
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA42B0]), "BOOLValue");
}

- (BOOL)isAppleAccessory
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", CFSTR("IsGenuineAppleAccessory")), "BOOLValue");
  return v3;
}

- (NSString)clusterID
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4380]);
}

- (NSNumber)batteryLevel
{
  NSNumber *result;

  result = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4138]);
  if (result)
    return (NSNumber *)-[NSNumber objectForKey:](result, "objectForKey:", *MEMORY[0x1E0CA3818]);
  return result;
}

- (NSNumber)caseBatteryLevel
{
  NSNumber *result;

  result = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4138]);
  if (result)
    return (NSNumber *)-[NSNumber objectForKey:](result, "objectForKey:", *MEMORY[0x1E0CA3800]);
  return result;
}

- (NSNumber)leftBatteryLevel
{
  NSNumber *result;

  result = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4138]);
  if (result)
    return (NSNumber *)-[NSNumber objectForKey:](result, "objectForKey:", *MEMORY[0x1E0CA3808]);
  return result;
}

- (NSNumber)rightBatteryLevel
{
  NSNumber *result;

  result = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4138]);
  if (result)
    return (NSNumber *)-[NSNumber objectForKey:](result, "objectForKey:", *MEMORY[0x1E0CA3810]);
  return result;
}

- (NSNumber)supportsDataOverACLProtocol
{
  objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  return 0;
}

- (NSNumber)isInEar
{
  objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  return 0;
}

- (OpaqueFigEndpoint)figEndpoint
{
  return self->_figEndpoint;
}

- (NSDictionary)airPlayProperties
{
  return (NSDictionary *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA40C0]);
}

- (BOOL)isInUseByPairedDevice
{
  objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  return 0;
}

- (NSArray)connectedPairedDevices
{
  objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unint64_t)deviceFeatures
{
  unint64_t v2;

  v2 = objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA43E0]), "unsignedIntegerValue");
  return v2 & 4 | (v2 >> 1) & 1 | (2 * (v2 & 1));
}

- (BOOL)requiresAuthorization
{
  -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA40D0]);
  return FigCFEqual() == 0;
}

- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup
{
  const __CFBoolean *v2;

  v2 = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA42A0]);
  if (v2)
    LOBYTE(v2) = CFBooleanGetValue(v2) != 0;
  return (char)v2;
}

- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup
{
  _BOOL4 v3;

  v3 = -[AVFigEndpointOutputDeviceImpl automaticallyAllowsConnectionsFromPeersInHomeGroup](self, "automaticallyAllowsConnectionsFromPeersInHomeGroup");
  if (v3)
  {
    -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4238]);
    LOBYTE(v3) = FigCFEqual() == 0;
  }
  return v3;
}

- (BOOL)canAccessRemoteAssets
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA40C8]), "BOOLValue");
}

- (BOOL)canAccessAppleMusic
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4268]), "BOOLValue");
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4170]), "BOOLValue");
}

- (BOOL)supportsBufferedAirPlay
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4400]), "BOOLValue");
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA41F8]), "BOOLValue") ^ 1;
}

- (BOOL)canFetchMediaDataFromSender
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA41D8]), "BOOLValue") ^ 1;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA41F0]), "BOOLValue") ^ 1;
}

- (BOOL)supportsBluetoothSharing
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4270]), "BOOLValue");
}

- (BOOL)isActivatedForContinuityScreen
{
  return 0;
}

- (int64_t)HAPConformance
{
  if (objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA40B8]), "BOOLValue"))return 2;
  else
    return 0;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4418]), "BOOLValue");
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4100]), "BOOLValue");
}

- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4
{
  signed int v5;
  signed int v6;

  v5 = AVOutputDeviceSetAllowsHeadTrackedSpatialAudioOnEndpoint((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), a3);
  v6 = v5;
  if (a4 && v5)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  return v6 == 0;
}

- (NSString)headTrackedSpatialAudioMode
{
  return (NSString *)AVOutputDeviceHeadTrackedSpatialAudioModeFromFigMode((const __CFNumber *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4248]));
}

- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4
{
  signed int v5;
  signed int v6;

  v5 = AVOutputDeviceSetHeadTrackedSpatialAudioModeOnEndpoint((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), a3);
  v6 = v5;
  if (a4 && v5)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  return v6 == 0;
}

- (BOOL)supportsConversationDetection
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", CFSTR("SupportsConversationDetect")), "BOOLValue");
  return v3;
}

- (BOOL)isConversationDetectionEnabled
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", CFSTR("ConversationDetectEnable")), "BOOLValue");
  return v3;
}

- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  uint64_t CMBaseObject;
  uint64_t (*v8)(uint64_t, const __CFString *, uint64_t);
  uint64_t v9;
  signed int v10;
  void *v11;
  BOOL result;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    -[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint");
    CMBaseObject = FigEndpointGetCMBaseObject();
    v8 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v8)
    {
      if (v5)
        v9 = *MEMORY[0x1E0C9AE50];
      else
        v9 = *MEMORY[0x1E0C9AE40];
      v10 = v8(CMBaseObject, CFSTR("ConversationDetectEnable"), v9);
      if (!a4)
        return v10 == 0;
    }
    else
    {
      v10 = -12782;
      if (!a4)
        return v10 == 0;
    }
    if (v10)
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v10, 0);
    return v10 == 0;
  }
  if (!a4)
    return 0;
  v11 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(-11862, 0);
  result = 0;
  *a4 = v11;
  return result;
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4240]), "BOOLValue");
}

- (NSArray)availableBluetoothListeningModes
{
  return (NSArray *)AVOutputDeviceSupportedListeningModesForFigListeningModes(objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA43E8]), "unsignedIntegerValue"));
}

- (NSString)currentBluetoothListeningMode
{
  return (NSString *)AVOutputDeviceAVFListeningModeForFigListeningMode(objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4308]), "unsignedIntegerValue"));
}

- (void)setCurrentBluetoothListeningMode:(id)a3
{
  CFNumberRef v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t CMBaseObject;
  void (*v7)(uint64_t, _QWORD, CFNumberRef);
  uint64_t v8;
  uint64_t v9;
  int valuePtr;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  valuePtr = AVOutputDeviceFigListeningModeForAVFListeningMode(a3);
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint", v8, v9);
  CMBaseObject = FigEndpointGetCMBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    v7(CMBaseObject, *MEMORY[0x1E0CA4308], v4);
  if (v4)
    CFRelease(v4);
}

- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4
{
  CFNumberRef v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t CMBaseObject;
  uint64_t (*v9)(uint64_t, _QWORD, CFNumberRef);
  int v10;
  uint64_t v12;
  uint64_t v13;
  int valuePtr;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  valuePtr = AVOutputDeviceFigListeningModeForAVFListeningMode(a3);
  v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint", v12, v13);
  CMBaseObject = FigEndpointGetCMBaseObject();
  v9 = *(uint64_t (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v9)
  {
    v10 = -12782;
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = v9(CMBaseObject, *MEMORY[0x1E0CA4308], v6);
  if (v6)
LABEL_5:
    CFRelease(v6);
LABEL_6:
  if (a4 && v10)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
  return v10 == 0;
}

- (void)setSecondDisplayEnabled:(BOOL)a3
{
  AVOutputDeviceSetSecondDisplayEnabledOnEndpoint((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), (uint64_t)-[AVFigEndpointOutputDeviceImpl name](self, "name"), a3);
}

- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4
{
  AVOutputDeviceSetSecondDisplayModeOnEndpoint((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), a3, (uint64_t)a4);
}

- (void)setMediaRemoteData:(id)a3 completionHandler:(id)a4
{
  AVOutputDeviceSetMediaRemoteDataOnEndpoint((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), (uint64_t)a3, (uint64_t)a4);
}

- (float)volume
{
  OpaqueFigVolumeControllerState *volumeController;
  float v3;
  NSString *v4;
  void (*v5)(OpaqueFigVolumeControllerState *, NSString *, float *);
  float v7;

  v7 = 0.0;
  volumeController = self->_volumeController;
  v3 = 0.0;
  if (volumeController)
  {
    v4 = -[AVFigEndpointOutputDeviceImpl ID](self, "ID");
    v5 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, float *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 72);
    if (v5)
    {
      v5(volumeController, v4, &v7);
      return v7;
    }
  }
  return v3;
}

- (void)_volumeDidChangeForEndpointWithID:(__CFString *)a3
{
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigEndpointOutputDeviceImpl ID](self, "ID")))
    -[AVOutputDeviceImplSupport outputDeviceImplDidChangeVolume:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "outputDeviceImplDidChangeVolume:", self);
}

- (BOOL)canSetVolume
{
  OpaqueFigVolumeControllerState *volumeController;
  NSString *v3;
  void (*v4)(OpaqueFigVolumeControllerState *, NSString *, char *);
  char v6;

  v6 = 0;
  volumeController = self->_volumeController;
  if (!volumeController)
    return 0;
  v3 = -[AVFigEndpointOutputDeviceImpl ID](self, "ID");
  v4 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, char *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 80);
  if (!v4)
    return 0;
  v4(volumeController, v3, &v6);
  return v6 != 0;
}

- (void)_handleFigEndpointEvent:(__CFString *)a3 payload:(id)a4
{
  void *v7;

  if (FigCFEqual())
  {
    -[AVFigEndpointOutputDeviceImpl _vehicleInformationDidChange:](self, "_vehicleInformationDidChange:", a4);
  }
  else if (FigCFEqual())
  {
    if (-[AVFigEndpointOutputDeviceImpl delegate](self, "delegate"))
    {
      -[AVFigEndpointOutputDeviceImpl delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[AVOutputDeviceDelegate setViewAreaIndex:andAdjacentViewAreas:forScreenID:](-[AVFigEndpointOutputDeviceImpl delegate](self, "delegate"), "setViewAreaIndex:andAdjacentViewAreas:forScreenID:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("viewAreaIndex")), "integerValue"), objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("adjacentViewAreas")), objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("uuid")));
    }
  }
  else
  {
    v7 = (void *)AVOutputDeviceNotificationFromFigNotification((uint64_t)a3);
    if (objc_msgSend(v7, "isEqual:", CFSTR("AVOutputDeviceCarPlayTestNotification")))
    {
      -[AVFigEndpointOutputDeviceImpl _carPlayTestNotification:](self, "_carPlayTestNotification:", a4);
    }
    else if (objc_msgSend(v7, "isEqual:", CFSTR("AVOutputDeviceiOSUIRequestedNotification")))
    {
      -[AVFigEndpointOutputDeviceImpl _iOSUIRequestedNotification:](self, "_iOSUIRequestedNotification:", a4);
    }
    else if (objc_msgSend(v7, "isEqual:", CFSTR("AVOutputDeviceSiriRequestedNotification")))
    {
      -[AVFigEndpointOutputDeviceImpl _siriRequestedNotification:](self, "_siriRequestedNotification:", a4);
    }
    else if (objc_msgSend(v7, "isEqual:", CFSTR("AVOutputDeviceUnhandledRemoteEventNotification")))
    {
      -[AVFigEndpointOutputDeviceImpl _unhandledRemoteCommandNotification:](self, "_unhandledRemoteCommandNotification:", a4);
    }
    else if (v7)
    {
      -[AVOutputDeviceImplSupport postNotification:fromImpl:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:fromImpl:", v7, self);
    }
  }
}

- (void)_iOSUIRequestedNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA49C0]);
  v6 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA49C8]);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("AVOutputDeviceiOSUIRequestedDisplayUUIDKey"));
  objc_msgSend(v7, "setValue:forKey:", v5, CFSTR("AVOutputDeviceiOSUIRequestedApplicationURLKey"));
  -[AVOutputDeviceImplSupport postNotification:withPayload:fromImpl:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:withPayload:fromImpl:", CFSTR("AVOutputDeviceiOSUIRequestedNotification"), v7, self);
}

- (void)_carPlayTestNotification:(id)a3
{
  uint64_t SiriRequestedActionFromFigAction;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA46A0]);
  SiriRequestedActionFromFigAction = AVOutputDeviceGetSiriRequestedActionFromFigAction();
  v6 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA46A8]);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", SiriRequestedActionFromFigAction), CFSTR("AVOutputDeviceSiriRequestedActionKey"));
  objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("AVOutputDeviceSiriRequestedTimestampKey"));
  -[AVOutputDeviceImplSupport postNotification:withPayload:fromImpl:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:withPayload:fromImpl:", CFSTR("AVOutputDeviceCarPlayTestNotification"), v7, self);
}

- (void)_siriRequestedNotification:(id)a3
{
  uint64_t SiriRequestedActionFromFigAction;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA46A0]);
  SiriRequestedActionFromFigAction = AVOutputDeviceGetSiriRequestedActionFromFigAction();
  v6 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA46A8]);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", SiriRequestedActionFromFigAction), CFSTR("AVOutputDeviceSiriRequestedActionKey"));
  objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("AVOutputDeviceSiriRequestedTimestampKey"));
  -[AVOutputDeviceImplSupport postNotification:withPayload:fromImpl:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:withPayload:fromImpl:", CFSTR("AVOutputDeviceSiriRequestedNotification"), v7, self);
}

- (void)_unhandledRemoteCommandNotification:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA49A0]), CFSTR("AVOutputDeviceUnhandledRemoteEventCommandTypeKey"));
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA4998]), CFSTR("AVOutputDeviceUnhandledRemoteEventCommandParametersKey"));
  -[AVOutputDeviceImplSupport postNotification:withPayload:fromImpl:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:withPayload:fromImpl:", CFSTR("AVOutputDeviceUnhandledRemoteEventNotification"), v5, self);
}

- (void)_vehicleInformationDidChange:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA49A8]);
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0CA49B0]))
      -[AVOutputDeviceImplSupport postNotification:fromImpl:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:fromImpl:", CFSTR("AVOutputDeviceElectronicTollCollectionStateChangedNotification"), self);
    if (objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0CA49B8]))
      -[AVOutputDeviceImplSupport postNotification:fromImpl:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:fromImpl:", CFSTR("AVOutputDeviceNavigationAidedDrivingStateChangedNotification"), self);
  }
}

- (void)_volumeForEndpointDidChange:(__CFString *)a3 forRoomID:(__CFString *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigEndpointOutputDeviceImpl ID](self, "ID")))
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceImplSupport activatedDeviceClusterMembersDidChangeVolume:forRoomID:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener", v7, v8), "activatedDeviceClusterMembersDidChangeVolume:forRoomID:", self, a4);
  }
}

- (void)_mutedDidChangeForEndpointWithID:(__CFString *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigEndpointOutputDeviceImpl ID](self, "ID")))
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceImplSupport outputDeviceImplDidChangeMute:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener", v5, v6), "outputDeviceImplDidChangeMute:", self);
  }
}

- (void)_canMuteDidChangeForEndpointWithID:(__CFString *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigEndpointOutputDeviceImpl ID](self, "ID")))
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceImplSupport outputDeviceImplCanMuteDidChange:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener", v5, v6), "outputDeviceImplCanMuteDidChange:", self);
  }
}

- (void)_endpointVolumeControlTypeDidChangeForEndpointWithID:(__CFString *)a3
{
  if (-[__CFString isEqualToString:](a3, "isEqualToString:", -[AVFigEndpointOutputDeviceImpl ID](self, "ID")))-[AVOutputDeviceImplSupport outputDeviceImplDidChangeVolumeControlType:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "outputDeviceImplDidChangeVolumeControlType:", self);
}

- (int64_t)volumeControlType
{
  OpaqueFigVolumeControllerState *volumeController;
  NSString *v3;
  void (*v4)(OpaqueFigVolumeControllerState *, NSString *, uint64_t *);
  uint64_t v6;

  volumeController = self->_volumeController;
  if (volumeController
    && (v6 = 0,
        v3 = -[AVFigEndpointOutputDeviceImpl ID](self, "ID"),
        (v4 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                             + 88)) != 0)
    && (v4(volumeController, v3, &v6), (unint64_t)(v6 - 1) <= 2))
  {
    return qword_19357D288[v6 - 1];
  }
  else
  {
    return 0;
  }
}

- (void)_canSetEndpointVolumeDidChangeForEndpointWithID:(__CFString *)a3
{
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigEndpointOutputDeviceImpl ID](self, "ID")))
  {
    -[AVOutputDeviceImplSupport outputDeviceImplDidChangeCanChangeVolume:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "outputDeviceImplDidChangeCanChangeVolume:", self);
    -[AVOutputDeviceImplSupport outputDeviceImplDidChangeVolumeControlType:](-[AVFigEndpointOutputDeviceImpl implEventListener](self, "implEventListener"), "outputDeviceImplDidChangeVolumeControlType:", self);
  }
}

- (void)setVolume:(float)a3
{
  NSString *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigVolumeControllerState *volumeController;
  void (*v8)(OpaqueFigVolumeControllerState *, NSString *, float);

  if (self->_volumeController)
  {
    v5 = -[AVFigEndpointOutputDeviceImpl ID](self, "ID");
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    volumeController = self->_volumeController;
    v8 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, float))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 64);
    if (v8)
      v8(volumeController, v5, a3);
  }
}

- (void)increaseVolumeByCount:(int64_t)a3
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  if (volumeController)
    AVOutputDeviceImplChangeVolumeByCount((uint64_t)volumeController, (uint64_t)-[AVFigEndpointOutputDeviceImpl ID](self, "ID"), a3);
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  if (volumeController)
    AVOutputDeviceImplChangeVolumeByCount((uint64_t)volumeController, (uint64_t)-[AVFigEndpointOutputDeviceImpl ID](self, "ID"), -a3);
}

- (void)setActivatedDeviceClusterMembersVolume:(float)a3 withRoomID:(id)a4
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  if (volumeController)
    AVOutputDeviceImplChangeRoomVolumeForEndpoint((uint64_t)volumeController, (uint64_t)-[AVFigEndpointOutputDeviceImpl ID](self, "ID"), (uint64_t)a4, a3);
}

- (float)volumeForActivatedDeviceClusterMembersWithRoomID:(id)a3
{
  OpaqueFigVolumeControllerState *volumeController;
  float v4;
  NSString *v6;
  void (*v7)(OpaqueFigVolumeControllerState *, NSString *, id, float *);
  float v9;

  v9 = 0.0;
  volumeController = self->_volumeController;
  v4 = 0.0;
  if (volumeController)
  {
    v6 = -[AVFigEndpointOutputDeviceImpl ID](self, "ID");
    v7 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, id, float *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 216);
    if (v7)
    {
      v7(volumeController, v6, a3, &v9);
      return v9;
    }
  }
  return v4;
}

- (BOOL)canMute
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  return volumeController
      && AVOutputDeviceImplCanMuteForEndpointID((uint64_t)volumeController, (uint64_t)-[AVFigEndpointOutputDeviceImpl ID](self, "ID"));
}

- (BOOL)isMuted
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  return volumeController
      && AVOutputDeviceImplIsMutedForEndpointID((uint64_t)volumeController, (uint64_t)-[AVFigEndpointOutputDeviceImpl ID](self, "ID"));
}

- (void)setMuted:(BOOL)a3
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  if (volumeController)
    AVOutputDeviceImplSetMutedForEndpointID((uint64_t)volumeController, (uint64_t)-[AVFigEndpointOutputDeviceImpl ID](self, "ID"), a3);
}

- (BOOL)canBeGrouped
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4298]), "BOOLValue");
}

- (NSString)groupID
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4228]);
}

- (NSString)proposedGroupID
{
  return 0;
}

- (BOOL)canBeGroupLeader
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4330]), "BOOLValue");
}

- (BOOL)isGroupLeader
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4290]), "BOOLValue");
}

- (BOOL)participatesInGroupPlayback
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA43B0]), "BOOLValue") ^ 1;
}

- (BOOL)groupContainsGroupLeader
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4220]), "BOOLValue");
}

- (NSString)logicalDeviceID
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4458]);
}

- (BOOL)isLogicalDeviceLeader
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4448]), "BOOLValue");
}

- (BOOL)canCommunicateWithAllLogicalDeviceMembers
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4440]), "BOOLValue") ^ 1;
}

- (BOOL)canRelayCommunicationChannel
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4428]), "BOOLValue");
}

- (void)configureUsingBlock:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9;
  uint64_t v10;
  __CFDictionary *Mutable;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  signed int v13;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v14;
  AVFigRoutingContextSendConfigureDeviceCommandOperation *v15;
  AVFigRoutingContextSendConfigureDeviceCommandOperation *v16;
  CFTypeRef v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[8];
  os_log_type_t type;
  int v24;
  CFTypeRef cf;
  uint64_t v26;
  _QWORD v27[21];

  v27[19] = *MEMORY[0x1E0C80C00];
  cf = 0;
  v9 = +[AVGlobalOperationQueue defaultQueue](AVGlobalOperationQueue, "defaultQueue");
  v10 = *MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceConfigurationOptionCancelConfigurationIfAuthRequired")), "BOOLValue"))CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D48D88], (const void *)*MEMORY[0x1E0C9AE50]);
  if (dword_1ECDECED8)
  {
    v24 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v13 = -[FigRoutingContextFactory createControlChannelOnlyContextWithAllocator:options:context:](self->_routingContextFactory, "createControlChannelOnlyContextWithAllocator:options:context:", v10, 0, &cf, v20, v21);
  if (v13)
  {
    v16 = 0;
    goto LABEL_11;
  }
  if (cf)
  {
    v14 = AVMakeSelectEndpointOperation(cf, self->_figEndpoint, Mutable, self->_useRouteConfigUpdatedNotification);
    v15 = [AVFigRoutingContextSendConfigureDeviceCommandOperation alloc];
    v16 = -[AVFigRoutingContextSendConfigureDeviceCommandOperation initWithRoutingContext:configuratorBlock:](v15, "initWithRoutingContext:configuratorBlock:", cf, a3);
    -[AVFigRoutingContextSendConfigureDeviceCommandOperation setName:](v16, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Set configuration on device represented by (impl=%@)"), self));
    -[AVFigRoutingContextSendConfigureDeviceCommandOperation addDependency:](v16, "addDependency:", v14);
    if (cf)
    {
      CFRetain(cf);
      v17 = cf;
    }
    else
    {
      v17 = 0;
    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __79__AVFigEndpointOutputDeviceImpl_configureUsingBlock_options_completionHandler___block_invoke;
    v22[3] = &unk_1E3033A30;
    v22[4] = v16;
    v22[5] = v14;
    v22[6] = a5;
    v22[7] = v17;
    -[AVFigRoutingContextSendConfigureDeviceCommandOperation setCompletionBlock:](v16, "setCompletionBlock:", v22);
    objc_msgSend(v9, "enqueueOperation:", v14);
    objc_msgSend(v9, "enqueueOperation:", v16);
LABEL_11:
    if (cf)
      goto LABEL_16;
    goto LABEL_12;
  }
  v16 = 0;
LABEL_12:
  v26 = *MEMORY[0x1E0C9AFA8];
  v27[0] = CFSTR("Failed to create FigRoutingContext");
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  if (v13)
    v19 = AVLocalizedErrorWithUnderlyingOSStatus(v13, v18);
  else
    v19 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, v18);
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, uint64_t))a5 + 2))(a5, 1, 0, 0, v19);
LABEL_16:
  if (Mutable)
    CFRelease(Mutable);

  if (cf)
    CFRelease(cf);
}

void __79__AVFigEndpointOutputDeviceImpl_configureUsingBlock_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, _QWORD);
  const void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  switch(v2)
  {
    case 4:
      (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 1, 0, 0, objc_msgSend(*(id *)(a1 + 32), "error"));
      break;
    case 3:
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "result"), "cancellationReason"), "isEqualToString:", CFSTR("AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped")))v3 = CFSTR("AVOutputDeviceConfigurationCancellationReasonAuthorizationSkipped");
      else
        v3 = 0;
      (*(void (**)(_QWORD, uint64_t, _QWORD, const __CFString *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 2, 0, v3, 0);
      break;
    case 2:
      (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, objc_msgSend(*(id *)(a1 + 32), "finalConfiguration"), 0, 0);
      break;
    default:
      (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 2, 0, 0, 0);
      break;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "status") == 2)
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v6)
      v6(v5, 0, 0);
  }
  v7 = *(const void **)(a1 + 56);
  if (v7)
    CFRelease(v7);
}

- (NSArray)OEMIcons
{
  return (NSArray *)AVOutputDeviceAVOutputDeviceIconsFromOEMIcons(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4368]));
}

- (NSString)OEMIconLabel
{
  return (NSString *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4358]);
}

- (BOOL)OEMIconVisible
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4360]), "BOOLValue");
}

- (NSArray)outputDeviceHIDs
{
  return (NSArray *)AVOutputDeviceMakeAVOutputDeviceHIDsFromFigHIDs(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4230]), (uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"));
}

- (BOOL)nightMode
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4350]), "BOOLValue");
}

- (BOOL)isNightModeSupported
{
  return -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4350]) != 0;
}

- (BOOL)rightHandDrive
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4390]), "BOOLValue");
}

- (NSArray)limitedUIElements
{
  id v2;

  v2 = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4300]);
  if (v2)
    return (NSArray *)v2;
  else
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (BOOL)limitedUI
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA42F8]), "BOOLValue");
}

- (BOOL)carOwnsScreen
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4160]), "BOOLValue");
}

- (BOOL)ownsTurnByTurnNavigation
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4148]), "BOOLValue");
}

- (BOOL)recognizingSpeech
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4150]), "BOOLValue");
}

- (NSArray)supportedFeatures
{
  NSArray *result;

  result = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA41D0]);
  if (!result)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (int64_t)electronicTollCollection
{
  return AVOutputDeviceElectronicTollCollectionStateFromVehicleInfo(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4490]));
}

- (int64_t)navigationAidedDriving
{
  return AVOutputDeviceNavigationAidedDrivingStateFromVehicleInfo(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4490]));
}

- (int64_t)transportType
{
  -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4460]);
  return AVOutputDeviceTransportTypeFromFigTransportType();
}

- (NSData)MFiCertificateSerialNumber
{
  return (NSData *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4118]);
}

- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4
{
  AVOutputDeviceRequestViewAreaForFigEndpoint((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), (uint64_t)a4, a3);
}

- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4
{
  AVOutputDeviceRequestCarUIForEndpoint((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), (uint64_t)a4, (uint64_t)a3);
}

- (id)requestTurnByTurnNavigationOwnership
{
  return -[AVOutputDeviceTurnByTurnToken initWithEndpoint:]([AVOutputDeviceTurnByTurnToken alloc], "initWithEndpoint:", -[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"));
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  return -[AVOutputDeviceScreenBorrowToken initWithEndpoint:client:reason:]([AVOutputDeviceScreenBorrowToken alloc], "initWithEndpoint:client:reason:", -[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), a3, a4);
}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  AVOutputDeviceTakeScreenForClient((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), (uint64_t)a3, (uint64_t)a4);
}

- (BOOL)siriForwardingEnabled
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4108]), "BOOLValue");
}

- (void)setSiriForwardingEnabled:(BOOL)a3
{
  AVOutputDeviceSetAlternateSiriOnEndpoint((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), a3);
}

- (BOOL)carOwnsMainAudio
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4158]), "BOOLValue");
}

- (NSDictionary)displayCornerMasks
{
  -[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint");
  return (NSDictionary *)AVOutputDeviceGetDisplayCornerMasksFromEndpoint();
}

- (void)setDisplayCornerMasks:(id)a3
{
  AVOutputDeviceSetDisplayCornerMasksEndpoint((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), (uint64_t)a3);
}

- (int64_t)voiceTriggerMode
{
  int64_t result;

  result = -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4498]);
  if (result)
    return objc_msgSend((id)result, "unsignedIntegerValue");
  return result;
}

- (int64_t)authenticationType
{
  -[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4120]);
  return AVOutputDeviceAuthenticationTypeFromFigAuthenticationType();
}

- (id)currentScreenViewAreaForScreenID:(id)a3
{
  return AVOutputDeviceGetCurrentScreenViewAreaFromEndpoint(-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), (uint64_t)a3);
}

- (BOOL)isActivated
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4260]), "BOOLValue");
}

- (NSArray)screens
{
  return (NSArray *)AVOutputDeviceAVOutputDeviceScreenInfoFromFigScreens(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA43A0]));
}

- (NSDictionary)outputDeviceInfo
{
  return (NSDictionary *)-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", CFSTR("EndpointInfo"));
}

- (void)suggestUIWithURLs:(id)a3 completionHandler:(id)a4
{
  AVOutputDeviceSuggestUIWithURLSAndCompletionHandler((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), (uint64_t)a3, (uint64_t)a4);
}

- (void)performHapticFeedbackForUUID:(id)a3 withHapticType:(id)a4 completionHandler:(id)a5
{
  AVOutputDevicePerformHapticFeedback((uint64_t)-[AVFigEndpointOutputDeviceImpl figEndpoint](self, "figEndpoint"), (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (AVOutputDeviceImplSupport)implEventListener
{
  return (AVOutputDeviceImplSupport *)objc_loadWeak((id *)&self->_implSupportEventListener);
}

- (void)setImplEventListener:(id)a3
{
  objc_storeWeak((id *)&self->_implSupportEventListener, a3);
}

- (AVOutputDeviceDelegate)delegate
{
  return (AVOutputDeviceDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_implSupportEventListener);
}

@end
