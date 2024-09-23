@implementation AVFigRouteDescriptorOutputDeviceImpl

- (NSDictionary)airPlayProperties
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSDictionary *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48790]);
}

- (NSArray)clusteredDeviceDescriptions
{
  __CFDictionary *v2;
  void *Value;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D488F0]);
  return (NSArray *)AVOutputDeviceDescriptionsFromFigDescriptions(Value);
}

- (BOOL)canBeGrouped
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)isGroupLeader
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (NSString)clusterID
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSString *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48A08]);
}

- (NSString)logicalDeviceID
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSString *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48A90]);
}

- (NSNumber)supportsDataOverACLProtocol
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSNumber *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D488D8]);
}

- (NSNumber)rightBatteryLevel
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSNumber *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D488A8]);
}

- (NSNumber)leftBatteryLevel
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSNumber *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D488A0]);
}

- (NSNumber)isInEar
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSNumber *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48A10]);
}

- (NSNumber)caseBatteryLevel
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSNumber *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48898]);
}

- (NSNumber)batteryLevel
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSNumber *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D488B0]);
}

- (NSString)groupID
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSString *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48940]);
}

- (BOOL)isMuted
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  return volumeController
      && AVOutputDeviceImplIsMutedForEndpointID((uint64_t)volumeController, (uint64_t)-[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID"));
}

- (int64_t)volumeControlType
{
  OpaqueFigVolumeControllerState *volumeController;
  NSString *v3;
  void (*v4)(OpaqueFigVolumeControllerState *, NSString *, uint64_t *);
  uint64_t v5;
  uint64_t v7;

  volumeController = self->_volumeController;
  if (!volumeController)
    return 0;
  v7 = 0;
  v3 = -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID");
  v4 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 88);
  if (v4)
  {
    v4(volumeController, v3, &v7);
    v5 = v7;
  }
  else
  {
    v5 = 0;
  }
  return AVOutputDeviceVolumeControlTypeFromFigType(v5);
}

- (NSString)ID
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSString *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48A50]);
}

- (void)setImplEventListener:(id)a3
{
  objc_storeWeak((id *)&self->_implSupportEventListener, a3);
}

- (NSString)serialNumber
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSString *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48A58]);
}

- (NSString)name
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSString *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48A28]);
}

- (NSString)modelID
{
  __CFDictionary *v3;
  NSString *result;
  __CFDictionary *v5;
  NSString *Value;

  v3 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  result = (NSString *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0D489D0]);
  if (!result)
  {
    v5 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
    Value = (NSString *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0D48A30]);
    AVStringForOSType(0x6A333237u);
    if (FigCFEqual())
      return Value;
    else
      return 0;
  }
  return result;
}

- (NSString)manufacturer
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSString *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D489C8]);
}

- (NSData)identifyingMACAddress
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSData *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D489C0]);
}

- (NSString)firmwareVersion
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return (NSString *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48930]);
}

- (int64_t)deviceType
{
  uint64_t v3;

  v3 = 0;
  AVOutputDeviceGetDeviceTypeAndSubTypeFromRouteDescriptor(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), &v3, 0);
  return v3;
}

- (int64_t)deviceSubType
{
  uint64_t v3;

  v3 = 0;
  AVOutputDeviceGetDeviceTypeAndSubTypeFromRouteDescriptor(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), 0, &v3);
  return v3;
}

- (unint64_t)deviceFeatures
{
  __CFDictionary *v3;
  unint64_t v4;
  __CFDictionary *v5;
  __CFDictionary *v6;

  v3 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  v4 = objc_msgSend((id)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0D48A48]), "BOOLValue");
  v5 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  if (objc_msgSend((id)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0D48A40]), "BOOLValue"))
    v4 |= 4uLL;
  v6 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  if (objc_msgSend((id)CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E0D48A38]), "BOOLValue"))
    return v4 | 2;
  else
    return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](-[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID"), "isEqualToString:", objc_msgSend(a3, "ID"));
}

- (BOOL)canAccessRemoteAssets
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48A20]), "BOOLValue");
}

- (BOOL)canAccessiCloudMusicLibrary
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D488E0]), "BOOLValue");
}

- (BOOL)canAccessAppleMusic
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48960]), "BOOLValue");
}

- (BOOL)supportsBluetoothSharing
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48968]), "BOOLValue");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_implSupportEventListener);
}

- (BOOL)supportsBufferedAirPlay
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48A60]), "BOOLValue");
}

- (NSString)currentBluetoothListeningMode
{
  __CFDictionary *v2;
  int v3;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  v3 = objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D488C8]), "unsignedIntegerValue");
  return (NSString *)AVOutputDeviceAVFListeningModeForFigListeningMode(v3);
}

- (NSArray)availableBluetoothListeningModes
{
  __CFDictionary *v2;
  char v3;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  v3 = objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D488D0]), "unsignedIntegerValue");
  return (NSArray *)AVOutputDeviceSupportedListeningModesForFigListeningModes(v3);
}

- (BOOL)groupContainsGroupLeader
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)canRelayCommunicationChannel
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)canBeGroupLeader
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)supportsConversationDetection
{
  int IsConversationDetectionFeatureEnabled;

  IsConversationDetectionFeatureEnabled = AVOutputDeviceIsConversationDetectionFeatureEnabled();
  if (IsConversationDetectionFeatureEnabled)
    LOBYTE(IsConversationDetectionFeatureEnabled) = objc_msgSend((id)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("SupportsConversationDetect")), "BOOLValue");
  return IsConversationDetectionFeatureEnabled;
}

- (BOOL)isConversationDetectionEnabled
{
  int IsConversationDetectionFeatureEnabled;

  IsConversationDetectionFeatureEnabled = AVOutputDeviceIsConversationDetectionFeatureEnabled();
  if (IsConversationDetectionFeatureEnabled)
    LOBYTE(IsConversationDetectionFeatureEnabled) = objc_msgSend((id)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("ConversationDetectEnable")), "BOOLValue");
  return IsConversationDetectionFeatureEnabled;
}

- (BOOL)isInUseByPairedDevice
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48978]), "BOOLValue");
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48A70]), "BOOLValue");
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48950]), "BOOLValue");
}

- (NSString)headTrackedSpatialAudioMode
{
  __CFDictionary *v2;
  const __CFNumber *Value;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  Value = (const __CFNumber *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48958]);
  return (NSString *)AVOutputDeviceHeadTrackedSpatialAudioModeFromFigMode(Value);
}

- (int64_t)configuredClusterSize
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48908]), "integerValue");
}

- (BOOL)requiresAuthorization
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48798]);
  return FigCFEqual() == 0;
}

- (BOOL)producesLowFidelityAudio
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)isClusterLeader
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (int64_t)clusterType
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48910]);
  if (FigCFEqual())
    return 2;
  else
    return FigCFEqual() != 0;
}

- (BOOL)isAppleAccessory
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
    FigCFDictionaryGetBooleanIfPresent();
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (int64_t)HAPConformance
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  if (objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48788]), "BOOLValue"))
    return 2;
  else
    return 0;
}

- (BOOL)canFetchMediaDataFromSender
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48918]), "BOOLValue") ^ 1;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48928]), "BOOLValue") ^ 1;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48920]), "BOOLValue") ^ 1;
}

- (void)dealloc
{
  id v3;
  void *v4;
  AVWeakReference *weakObserver;
  __CFDictionary *routeDescriptor;
  OpaqueFigRouteDiscoverer *routeDiscoverer;
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *routingContext;
  objc_super v10;

  if (self->_weakObserver)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = v3;
    if (self->_volumeController)
    {
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDescriptorOutputDeviceImplCanSetEndpointVolumeDidChange, *MEMORY[0x1E0D48E20]);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointVolumeDidChange, *MEMORY[0x1E0D48E48], self->_volumeController);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointVolumeControlTypeDidChange, *MEMORY[0x1E0D48E40], self->_volumeController);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointMutedDidChange, *MEMORY[0x1E0D48E38], self->_volumeController);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointCanMuteDidChange, *MEMORY[0x1E0D48E60], self->_volumeController);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointRoomVolumeDidChange, *MEMORY[0x1E0D48E78], self->_volumeController);
    }
    weakObserver = self->_weakObserver;
    if (self->_routingContext)
    {
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", weakObserver, AVFigRouteDescriptorOutputDeviceImplRouteDescriptionEvent, CFSTR("routeDescriptionEvent"));
      weakObserver = self->_weakObserver;
    }
  }
  else
  {
    weakObserver = 0;
  }

  routeDescriptor = self->_routeDescriptor;
  if (routeDescriptor)
    CFRelease(routeDescriptor);
  routeDiscoverer = self->_routeDiscoverer;
  if (routeDiscoverer)
    CFRelease(routeDiscoverer);
  volumeController = self->_volumeController;
  if (volumeController)
    CFRelease(volumeController);
  routingContext = self->_routingContext;
  if (routingContext)
    CFRelease(routingContext);
  if (self->_routeDescriptionRWLock)
  {
    FigReadWriteLockDestroy();
    self->_routeDescriptionRWLock = 0;
  }

  v10.receiver = self;
  v10.super_class = (Class)AVFigRouteDescriptorOutputDeviceImpl;
  -[AVFigRouteDescriptorOutputDeviceImpl dealloc](&v10, sel_dealloc);
}

- (NSArray)connectedPairedDevices
{
  __CFDictionary *v3;
  const __CFArray *Value;
  CFIndex v5;
  const void *v6;
  const void *v7;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  AVPairedDevice *v14;
  void *v16;
  void *v17;
  void *key;
  NSArray *v19;

  v19 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  Value = (const __CFArray *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0D489D8]);
  v5 = 0;
  v17 = (void *)*MEMORY[0x1E0D489E8];
  key = (void *)*MEMORY[0x1E0D48A00];
  v16 = (void *)*MEMORY[0x1E0D489E0];
  v6 = (const void *)*MEMORY[0x1E0D489F8];
  v7 = (const void *)*MEMORY[0x1E0D489F0];
  if (!Value)
    goto LABEL_3;
LABEL_2:
  for (i = CFArrayGetCount(Value); v5 < i; i = 0)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v5);
    v10 = CFDictionaryGetValue(ValueAtIndex, key);
    v11 = CFDictionaryGetValue(ValueAtIndex, v17);
    v12 = CFDictionaryGetValue(ValueAtIndex, v16);
    v13 = CFDictionaryGetValue(ValueAtIndex, v6);
    v14 = -[AVPairedDevice initWithName:ID:modelID:playing:productName:]([AVPairedDevice alloc], "initWithName:ID:modelID:playing:productName:", v11, v10, v12, objc_msgSend((id)CFDictionaryGetValue(ValueAtIndex, v7), "BOOLValue"), v13);
    -[NSArray addObject:](v19, "addObject:", v14);

    ++v5;
    if (Value)
      goto LABEL_2;
LABEL_3:
    ;
  }
  return v19;
}

- (AVFigRouteDescriptorOutputDeviceImpl)init
{
  return -[AVFigRouteDescriptorOutputDeviceImpl initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:](self, "initWithRouteDescriptor:routeDiscoverer:volumeController:routingContextFactory:useRouteConfigUpdatedNotification:routingContext:", 0, 0, 0, 0, 0, 0);
}

- (AVFigRouteDescriptorOutputDeviceImpl)initWithRouteDescriptor:(__CFDictionary *)a3 routeDiscoverer:(OpaqueFigRouteDiscoverer *)a4 volumeController:(OpaqueFigVolumeControllerState *)a5 routingContextFactory:(id)a6 useRouteConfigUpdatedNotification:(BOOL)a7 routingContext:(OpaqueFigRoutingContext *)a8
{
  id v15;
  AVFigRouteDescriptorOutputDeviceImpl *v16;
  AVFigRouteDescriptorOutputDeviceImpl *v17;
  __CFDictionary *v18;
  OpaqueFigRouteDiscoverer *v19;
  OpaqueFigVolumeControllerState *v20;
  AVFigRouteDescriptorOutputDeviceImpl *v21;
  FigRoutingContextFactory *v22;
  OpaqueFigRoutingContext *v23;
  AVWeakReference *v24;
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *routingContext;
  objc_super v28;

  v15 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v28.receiver = self;
  v28.super_class = (Class)AVFigRouteDescriptorOutputDeviceImpl;
  v16 = -[AVFigRouteDescriptorOutputDeviceImpl init](&v28, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_21;
  if (!a3)
  {
    v21 = 0;
    v16->_routeDescriptor = 0;
    goto LABEL_20;
  }
  v18 = (__CFDictionary *)CFRetain(a3);
  v17->_routeDescriptor = v18;
  if (!v18)
    goto LABEL_21;
  if (!a4)
  {
    v21 = 0;
    v17->_routeDiscoverer = 0;
    goto LABEL_20;
  }
  v19 = (OpaqueFigRouteDiscoverer *)CFRetain(a4);
  v17->_routeDiscoverer = v19;
  if (!v19
    || (!a5 ? (v20 = 0) : (v20 = (OpaqueFigVolumeControllerState *)CFRetain(a5)),
        v17->_volumeController = v20,
        v22 = (FigRoutingContextFactory *)a6,
        (v17->_routingContextFactory = v22) == 0))
  {
LABEL_21:
    v21 = 0;
    goto LABEL_20;
  }
  v17->_useRouteConfigUpdatedNotification = a7;
  if (a8)
    v23 = (OpaqueFigRoutingContext *)CFRetain(a8);
  else
    v23 = 0;
  v17->_routingContext = v23;
  v17->_routeDescriptionRWLock = (OpaqueFigReadWriteLock *)FigReadWriteLockCreate();
  v24 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v17);
  v17->_weakObserver = v24;
  volumeController = v17->_volumeController;
  if (volumeController)
  {
    objc_msgSend(v15, "addListenerWithWeakReference:callback:name:object:flags:", v24, AVFigRouteDescriptorOutputDeviceImplCanSetEndpointVolumeDidChange, *MEMORY[0x1E0D48E20], volumeController, 0);
    objc_msgSend(v15, "addListenerWithWeakReference:callback:name:object:flags:", v17->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointVolumeDidChange, *MEMORY[0x1E0D48E48], v17->_volumeController, 0);
    objc_msgSend(v15, "addListenerWithWeakReference:callback:name:object:flags:", v17->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointVolumeControlTypeDidChange, *MEMORY[0x1E0D48E40], v17->_volumeController, 0);
    objc_msgSend(v15, "addListenerWithWeakReference:callback:name:object:flags:", v17->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointMutedDidChange, *MEMORY[0x1E0D48E38], v17->_volumeController, 0);
    objc_msgSend(v15, "addListenerWithWeakReference:callback:name:object:flags:", v17->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointCanMuteDidChange, *MEMORY[0x1E0D48E60], v17->_volumeController, 0);
    objc_msgSend(v15, "addListenerWithWeakReference:callback:name:object:flags:", v17->_weakObserver, AVFigRouteDescriptorOutputDeviceImplEndpointRoomVolumeDidChange, *MEMORY[0x1E0D48E78], v17->_volumeController, 0);
  }
  routingContext = v17->_routingContext;
  if (routingContext)
    objc_msgSend(v15, "addListenerWithWeakReference:callback:name:object:flags:", v17->_weakObserver, AVFigRouteDescriptorOutputDeviceImplRouteDescriptionEvent, CFSTR("routeDescriptionEvent"), routingContext, 0);
  v21 = v17;
LABEL_20:

  return v21;
}

- (unint64_t)hash
{
  return -[NSString hash](-[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID"), "hash");
}

- (__CFDictionary)routeDescriptor
{
  __CFDictionary *v3;

  FigReadWriteLockLockForRead();
  v3 = self->_routeDescriptor;
  FigReadWriteLockUnlockForRead();
  return v3;
}

- (void)setRouteDescriptor:(__CFDictionary *)a3
{
  __CFDictionary *routeDescriptor;

  FigReadWriteLockLockForWrite();
  routeDescriptor = self->_routeDescriptor;
  self->_routeDescriptor = a3;
  if (a3)
    CFRetain(a3);
  if (routeDescriptor)
    CFRelease(routeDescriptor);
  FigReadWriteLockUnlockForWrite();
}

- (BOOL)isEligibleToBePredictedOutputDevice
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)isActivatedForContinuityScreen
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup
{
  __CFDictionary *v2;
  const __CFBoolean *Value;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  Value = (const __CFBoolean *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D48990]);
  if (Value)
    LOBYTE(Value) = CFBooleanGetValue(Value) != 0;
  return (char)Value;
}

- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup
{
  _BOOL4 v3;
  __CFDictionary *v4;

  v3 = -[AVFigRouteDescriptorOutputDeviceImpl automaticallyAllowsConnectionsFromPeersInHomeGroup](self, "automaticallyAllowsConnectionsFromPeersInHomeGroup");
  if (v3)
  {
    v4 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E0D48948]);
    LOBYTE(v3) = FigCFEqual() == 0;
  }
  return v3;
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  __CFDictionary *v2;

  v2 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0D487A8]), "BOOLValue");
}

- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4
{
  signed int v5;
  signed int v6;
  _QWORD v8[4];
  BOOL v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__AVFigRouteDescriptorOutputDeviceImpl_setAllowsHeadTrackedSpatialAudio_error___block_invoke;
  v8[3] = &__block_descriptor_33_e28_i16__0__OpaqueFigEndpoint__8l;
  v9 = a3;
  v5 = -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v8);
  v6 = v5;
  if (a4 && v5)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  return v6 == 0;
}

uint64_t __79__AVFigRouteDescriptorOutputDeviceImpl_setAllowsHeadTrackedSpatialAudio_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceSetAllowsHeadTrackedSpatialAudioOnEndpoint(a2, *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4
{
  signed int v5;
  signed int v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__AVFigRouteDescriptorOutputDeviceImpl_setHeadTrackedSpatialAudioMode_error___block_invoke;
  v8[3] = &unk_1E30339B8;
  v8[4] = a3;
  v5 = -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v8);
  v6 = v5;
  if (a4 && v5)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  return v6 == 0;
}

uint64_t __77__AVFigRouteDescriptorOutputDeviceImpl_setHeadTrackedSpatialAudioMode_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceSetHeadTrackedSpatialAudioModeOnEndpoint(a2, *(void **)(a1 + 32));
}

- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4
{
  signed int v7;
  signed int v8;
  BOOL result;
  void *v10;
  _QWORD v11[4];
  BOOL v12;

  if (AVOutputDeviceIsConversationDetectionFeatureEnabled())
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__AVFigRouteDescriptorOutputDeviceImpl_setConversationDetectionEnabled_error___block_invoke;
    v11[3] = &__block_descriptor_33_e28_i16__0__OpaqueFigEndpoint__8l;
    v12 = a3;
    v7 = -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v11);
    v8 = v7;
    if (a4)
    {
      if (v7)
        *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
    }
    return v8 == 0;
  }
  else if (a4)
  {
    v10 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(-11862, 0);
    result = 0;
    *a4 = v10;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t __78__AVFigRouteDescriptorOutputDeviceImpl_setConversationDetectionEnabled_error___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t CMBaseObject;
  uint64_t (*v3)(uint64_t, const __CFString *, uint64_t);
  uint64_t v4;

  v1 = *(unsigned __int8 *)(a1 + 32);
  CMBaseObject = FigEndpointGetCMBaseObject();
  v3 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v3)
    return 4294954514;
  if (v1)
    v4 = *MEMORY[0x1E0C9AE50];
  else
    v4 = *MEMORY[0x1E0C9AE40];
  return v3(CMBaseObject, CFSTR("ConversationDetectEnable"), v4);
}

- (int)_withEndpoint:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRoutingContext *routingContext;
  uint64_t (*v7)(OpaqueFigRoutingContext *, CFArrayRef *);
  int v8;
  CFIndex v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex Count;
  const void *ValueAtIndex;
  uint64_t CMBaseObject;
  void (*v15)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  NSString *v16;
  OpaqueFigRouteDiscoverer *routeDiscoverer;
  __CFDictionary *v18;
  uint64_t (*v19)(OpaqueFigRouteDiscoverer *, __CFDictionary *, CFTypeRef *);
  CFTypeRef v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  CFArrayRef theArray;
  CFTypeRef v26;
  CFTypeRef cf[17];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  theArray = 0;
  v26 = 0;
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  routingContext = self->_routingContext;
  if (routingContext)
  {
    v7 = *(uint64_t (**)(OpaqueFigRoutingContext *, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 56);
    if (v7)
    {
      v8 = v7(routingContext, &theArray);
      if (!v8)
      {
        v9 = 0;
        v10 = *MEMORY[0x1E0CA4258];
        v11 = *MEMORY[0x1E0C9AE00];
        while (1)
        {
          Count = (CFIndex)theArray;
          if (theArray)
            Count = CFArrayGetCount(theArray);
          if (v9 >= Count)
            goto LABEL_27;
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, v9);
          cf[0] = 0;
          CMBaseObject = FigEndpointGetCMBaseObject();
          v15 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
          if (v15)
            v15(CMBaseObject, v10, v11, cf);
          v16 = -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID", v23, v24);
          if (-[NSString isEqualToString:](v16, "isEqualToString:", cf[0]))
          {
            if (ValueAtIndex)
              v20 = CFRetain(ValueAtIndex);
            else
              v20 = 0;
            v26 = v20;
            if (cf[0])
              CFRelease(cf[0]);
            if (v20)
              goto LABEL_19;
            goto LABEL_27;
          }
          if (cf[0])
            CFRelease(cf[0]);
          ++v9;
        }
      }
      goto LABEL_28;
    }
LABEL_20:
    v21 = -12782;
    goto LABEL_29;
  }
  routeDiscoverer = self->_routeDiscoverer;
  v18 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  v19 = *(uint64_t (**)(OpaqueFigRouteDiscoverer *, __CFDictionary *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                            + 8);
  if (!v19)
    goto LABEL_20;
  v8 = v19(routeDiscoverer, v18, &v26);
  if (!v8)
  {
    v20 = v26;
    if (!v26)
    {
LABEL_27:
      v8 = FigSignalErrorAt();
      goto LABEL_28;
    }
LABEL_19:
    v8 = (*((uint64_t (**)(id, CFTypeRef))a3 + 2))(a3, v20);
  }
LABEL_28:
  v21 = v8;
LABEL_29:
  if (v26)
    CFRelease(v26);
  if (theArray)
    CFRelease(theArray);
  return v21;
}

- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRouteDiscoverer *routeDiscoverer;
  __CFDictionary *v9;
  uint64_t (*v10)(OpaqueFigRouteDiscoverer *, __CFDictionary *, CFTypeRef *);
  int v11;
  CFNumberRef v12;
  NSObject *v13;
  uint64_t CMBaseObject;
  uint64_t (*v15)(uint64_t, _QWORD, CFNumberRef);
  int v16;
  uint64_t v18;
  uint64_t v19;
  CFTypeRef cf;
  int valuePtr;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  cf = 0;
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  routeDiscoverer = self->_routeDiscoverer;
  v9 = -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor", v18, v19);
  v10 = *(uint64_t (**)(OpaqueFigRouteDiscoverer *, __CFDictionary *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                            + 8);
  if (!v10)
  {
    v12 = 0;
LABEL_11:
    v16 = -12782;
    goto LABEL_12;
  }
  v11 = v10(routeDiscoverer, v9, &cf);
  if (v11)
  {
    v16 = v11;
    v12 = 0;
    goto LABEL_12;
  }
  if (!cf)
  {
    v16 = 0;
    return v16 == 0;
  }
  valuePtr = AVOutputDeviceFigListeningModeForAVFListeningMode(a3);
  v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (dword_1ECDECED8)
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMBaseObject = FigEndpointGetCMBaseObject();
  v15 = *(uint64_t (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v15)
    goto LABEL_11;
  v16 = v15(CMBaseObject, *MEMORY[0x1E0CA4308], v12);
LABEL_12:
  if (cf)
    CFRelease(cf);
  if (v12)
    CFRelease(v12);
  if (a4 && v16)
  {
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v16, 0);
    v16 = 1;
  }
  return v16 == 0;
}

- (void)setSecondDisplayEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__AVFigRouteDescriptorOutputDeviceImpl_setSecondDisplayEnabled___block_invoke;
  v3[3] = &unk_1E30339E0;
  v3[4] = self;
  v4 = a3;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v3);
}

uint64_t __64__AVFigRouteDescriptorOutputDeviceImpl_setSecondDisplayEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceSetSecondDisplayEnabledOnEndpoint(a2, objc_msgSend(*(id *)(a1 + 32), "name"), *(unsigned __int8 *)(a1 + 40));
}

- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4
{
  signed int v5;
  uint64_t v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__AVFigRouteDescriptorOutputDeviceImpl_setSecondDisplayMode_completionHandler___block_invoke;
  v7[3] = &unk_1E3033A08;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = &v8;
  v5 = -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v7);
  if (v5)
    v6 = AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  else
    v6 = 0;
  if (*((_BYTE *)v9 + 24))
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, v6);
  _Block_object_dispose(&v8, 8);
}

uint64_t __79__AVFigRouteDescriptorOutputDeviceImpl_setSecondDisplayMode_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  AVOutputDeviceSetSecondDisplayModeOnEndpoint(a2, *(void **)(a1 + 32), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  return 0;
}

- (void)setMediaRemoteData:(id)a3 completionHandler:(id)a4
{
  signed int v5;
  uint64_t v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__AVFigRouteDescriptorOutputDeviceImpl_setMediaRemoteData_completionHandler___block_invoke;
  v7[3] = &unk_1E3033A08;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = &v8;
  v5 = -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v7);
  if (v5)
    v6 = AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  else
    v6 = 0;
  if (*((_BYTE *)v9 + 24))
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v6);
  _Block_object_dispose(&v8, 8);
}

uint64_t __77__AVFigRouteDescriptorOutputDeviceImpl_setMediaRemoteData_completionHandler___block_invoke(uint64_t *a1, uint64_t a2)
{
  AVOutputDeviceSetMediaRemoteDataOnEndpoint(a2, a1[4], a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  return 0;
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
    v4 = -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID");
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

- (void)_mutedDidChangeForEndpointWithID:(__CFString *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID")))
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceImplSupport outputDeviceImplDidChangeMute:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener", v5, v6), "outputDeviceImplDidChangeMute:", self);
  }
}

- (void)_canMuteDidChangeForEndpointWithID:(__CFString *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID")))
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceImplSupport outputDeviceImplCanMuteDidChange:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener", v5, v6), "outputDeviceImplCanMuteDidChange:", self);
  }
}

- (void)_routeDescriptionDidChange:(__CFDictionary *)a3
{
  if (objc_msgSend((id)FigCFDictionaryGetValue(), "isEqual:", -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID")))-[AVFigRouteDescriptorOutputDeviceImpl setRouteDescriptor:](self, "setRouteDescriptor:", a3);
}

- (void)_handleRouteDescriptionEvent:(__CFString *)a3 payload:(id)a4
{
  void *v7;

  if (FigCFEqual())
  {
    -[AVFigRouteDescriptorOutputDeviceImpl _vehicleInformationDidChange:](self, "_vehicleInformationDidChange:", a4);
  }
  else if (FigCFEqual())
  {
    if (-[AVFigRouteDescriptorOutputDeviceImpl delegate](self, "delegate"))
    {
      -[AVFigRouteDescriptorOutputDeviceImpl delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[AVOutputDeviceDelegate setViewAreaIndex:andAdjacentViewAreas:forScreenID:](-[AVFigRouteDescriptorOutputDeviceImpl delegate](self, "delegate"), "setViewAreaIndex:andAdjacentViewAreas:forScreenID:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("viewAreaIndex")), "integerValue"), objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("adjacentViewAreas")), objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("uuid")));
    }
  }
  else
  {
    v7 = (void *)AVOutputDeviceNotificationFromFigNotification((uint64_t)a3);
    if (objc_msgSend(v7, "isEqual:", CFSTR("AVOutputDeviceCarPlayTestNotification")))
    {
      -[AVFigRouteDescriptorOutputDeviceImpl _carPlayTestNotification:](self, "_carPlayTestNotification:", a4);
    }
    else if (objc_msgSend(v7, "isEqual:", CFSTR("AVOutputDeviceiOSUIRequestedNotification")))
    {
      -[AVFigRouteDescriptorOutputDeviceImpl _iOSUIRequestedNotification:](self, "_iOSUIRequestedNotification:", a4);
    }
    else if (objc_msgSend(v7, "isEqual:", CFSTR("AVOutputDeviceSiriRequestedNotification")))
    {
      -[AVFigRouteDescriptorOutputDeviceImpl _siriRequestedNotification:](self, "_siriRequestedNotification:", a4);
    }
    else if (objc_msgSend(v7, "isEqual:", CFSTR("AVOutputDeviceUnhandledRemoteEventNotification")))
    {
      -[AVFigRouteDescriptorOutputDeviceImpl _unhandledRemoteCommandNotification:](self, "_unhandledRemoteCommandNotification:", a4);
    }
    else if (v7)
    {
      -[AVOutputDeviceImplSupport postNotification:fromImpl:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:fromImpl:", v7, self);
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
  -[AVOutputDeviceImplSupport postNotification:withPayload:fromImpl:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:withPayload:fromImpl:", CFSTR("AVOutputDeviceiOSUIRequestedNotification"), v7, self);
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
  -[AVOutputDeviceImplSupport postNotification:withPayload:fromImpl:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:withPayload:fromImpl:", CFSTR("AVOutputDeviceCarPlayTestNotification"), v7, self);
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
  -[AVOutputDeviceImplSupport postNotification:withPayload:fromImpl:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:withPayload:fromImpl:", CFSTR("AVOutputDeviceSiriRequestedNotification"), v7, self);
}

- (void)_unhandledRemoteCommandNotification:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA49A0]), CFSTR("AVOutputDeviceUnhandledRemoteEventCommandTypeKey"));
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA4998]), CFSTR("AVOutputDeviceUnhandledRemoteEventCommandParametersKey"));
  -[AVOutputDeviceImplSupport postNotification:withPayload:fromImpl:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:withPayload:fromImpl:", CFSTR("AVOutputDeviceUnhandledRemoteEventNotification"), v5, self);
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
      -[AVOutputDeviceImplSupport postNotification:fromImpl:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:fromImpl:", CFSTR("AVOutputDeviceElectronicTollCollectionStateChangedNotification"), self);
    if (objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0CA49B8]))
      -[AVOutputDeviceImplSupport postNotification:fromImpl:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener"), "postNotification:fromImpl:", CFSTR("AVOutputDeviceNavigationAidedDrivingStateChangedNotification"), self);
  }
}

- (void)_volumeDidChangeForEndpointWithID:(__CFString *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID")))
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceImplSupport outputDeviceImplDidChangeVolume:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener", v5, v6), "outputDeviceImplDidChangeVolume:", self);
  }
}

- (void)_volumeForEndpointDidChange:(__CFString *)a3 forRoomID:(__CFString *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID")))
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceImplSupport activatedDeviceClusterMembersDidChangeVolume:forRoomID:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener", v7, v8), "activatedDeviceClusterMembersDidChangeVolume:forRoomID:", self, a4);
  }
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
  v3 = -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID");
  v4 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, char *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 80);
  if (!v4)
    return 0;
  v4(volumeController, v3, &v6);
  return v6 != 0;
}

- (void)_canSetEndpointVolumeDidChangeForEndpointWithID:(__CFString *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqual:](a3, "isEqual:", -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID")))
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceImplSupport outputDeviceImplDidChangeCanChangeVolume:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener", v5, v6), "outputDeviceImplDidChangeCanChangeVolume:", self);
  }
}

- (void)_endpointVolumeControlTypeDidChangeForEndpointWithID:(__CFString *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqualToString:](a3, "isEqualToString:", -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID")))
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceImplSupport outputDeviceImplDidChangeVolumeControlType:](-[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener", v5, v6), "outputDeviceImplDidChangeVolumeControlType:", self);
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
    v5 = -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID");
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
    AVOutputDeviceImplChangeVolumeByCount((uint64_t)volumeController, (uint64_t)-[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID"), a3);
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  if (volumeController)
    AVOutputDeviceImplChangeVolumeByCount((uint64_t)volumeController, (uint64_t)-[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID"), -a3);
}

- (void)setActivatedDeviceClusterMembersVolume:(float)a3 withRoomID:(id)a4
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  if (volumeController)
    AVOutputDeviceImplChangeRoomVolumeForEndpoint((uint64_t)volumeController, (uint64_t)-[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID"), (uint64_t)a4, a3);
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
    v6 = -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID");
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
      && AVOutputDeviceImplCanMuteForEndpointID((uint64_t)volumeController, (uint64_t)-[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID"));
}

- (void)setMuted:(BOOL)a3
{
  OpaqueFigVolumeControllerState *volumeController;

  volumeController = self->_volumeController;
  if (volumeController)
    AVOutputDeviceImplSetMutedForEndpointID((uint64_t)volumeController, (uint64_t)-[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID"), a3);
}

- (NSString)proposedGroupID
{
  return 0;
}

- (BOOL)participatesInGroupPlayback
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 1;
}

- (BOOL)isLogicalDeviceLeader
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)canCommunicateWithAllLogicalDeviceMembers
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 1;
}

- (BOOL)supportsFitnessDataDestination
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)supportsScreenMirroringControls
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
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
    v14 = AVMakeSelectRouteDescriptorOperation(cf, -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), Mutable, self->_useRouteConfigUpdatedNotification);
    v15 = [AVFigRoutingContextSendConfigureDeviceCommandOperation alloc];
    v16 = -[AVFigRoutingContextSendConfigureDeviceCommandOperation initWithRoutingContext:configuratorBlock:](v15, "initWithRoutingContext:configuratorBlock:", cf, a3);
    -[AVFigRoutingContextSendConfigureDeviceCommandOperation setName:](v16, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Set configuration on device represented by %@ (impl=%@)"), -[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener"), self));
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
    v22[2] = __86__AVFigRouteDescriptorOutputDeviceImpl_configureUsingBlock_options_completionHandler___block_invoke;
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

void __86__AVFigRouteDescriptorOutputDeviceImpl_configureUsingBlock_options_completionHandler___block_invoke(uint64_t a1)
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
    v6 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v6)
      v6(v5, 0, 0);
  }
  v7 = *(const void **)(a1 + 56);
  if (v7)
    CFRelease(v7);
}

- (NSArray)OEMIcons
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("OEMIcons"));
  return (NSArray *)AVOutputDeviceAVOutputDeviceIconsFromOEMIcons(Value);
}

- (NSString)OEMIconLabel
{
  return (NSString *)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("OEMIconLabel"));
}

- (BOOL)OEMIconVisible
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (NSArray)outputDeviceHIDs
{
  NSArray *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__AVFigRouteDescriptorOutputDeviceImpl_outputDeviceHIDs__block_invoke;
  v4[3] = &unk_1E3033A58;
  v4[4] = self;
  v4[5] = &v5;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v4);
  v2 = (NSArray *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __56__AVFigRouteDescriptorOutputDeviceImpl_outputDeviceHIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  void *Value;

  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)objc_msgSend(*(id *)(a1 + 32), "routeDescriptor"), CFSTR("HIDs"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = AVOutputDeviceMakeAVOutputDeviceHIDsFromFigHIDs(Value, a2);
  return 0;
}

- (BOOL)nightMode
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)isNightModeSupported
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  return FigCFDictionaryGetValue() != 0;
}

- (BOOL)rightHandDrive
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (NSArray)limitedUIElements
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("LimitedUIElements"));
  if (Value)
    return (NSArray *)Value;
  else
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (BOOL)limitedUI
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)carOwnsScreen
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)ownsTurnByTurnNavigation
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (BOOL)recognizingSpeech
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (NSArray)supportedFeatures
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("ExtendedFeatures"));
  if (Value)
    return (NSArray *)Value;
  else
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (int64_t)electronicTollCollection
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("VehicleInformation"));
  return AVOutputDeviceElectronicTollCollectionStateFromVehicleInfo(Value);
}

- (int64_t)navigationAidedDriving
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("VehicleInformation"));
  return AVOutputDeviceNavigationAidedDrivingStateFromVehicleInfo(Value);
}

- (int64_t)transportType
{
  CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("TransportType"));
  return AVOutputDeviceTransportTypeFromFigTransportType();
}

- (NSData)MFiCertificateSerialNumber
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("AuthenticationData"));
  if (Value)
    return (NSData *)Value;
  else
    return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
}

- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AVFigRouteDescriptorOutputDeviceImpl_requestViewArea_forScreenID___block_invoke;
  v4[3] = &unk_1E3033A80;
  v4[4] = a4;
  v4[5] = a3;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v4);
}

uint64_t __68__AVFigRouteDescriptorOutputDeviceImpl_requestViewArea_forScreenID___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceRequestViewAreaForFigEndpoint(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AVFigRouteDescriptorOutputDeviceImpl_requestCarUIForURL_withUUID___block_invoke;
  v4[3] = &unk_1E3033AA8;
  v4[4] = a4;
  v4[5] = a3;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v4);
}

uint64_t __68__AVFigRouteDescriptorOutputDeviceImpl_requestCarUIForURL_withUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceRequestCarUIForEndpoint(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)requestTurnByTurnNavigationOwnership
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__AVFigRouteDescriptorOutputDeviceImpl_requestTurnByTurnNavigationOwnership__block_invoke;
  v4[3] = &unk_1E3033AD0;
  v4[4] = &v5;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __76__AVFigRouteDescriptorOutputDeviceImpl_requestTurnByTurnNavigationOwnership__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = -[AVOutputDeviceTurnByTurnToken initWithEndpoint:]([AVOutputDeviceTurnByTurnToken alloc], "initWithEndpoint:", a2);
  return 0;
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__21;
  v11 = __Block_byref_object_dispose__21;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__AVFigRouteDescriptorOutputDeviceImpl_borrowScreenForClient_reason___block_invoke;
  v6[3] = &unk_1E3033AF8;
  v6[5] = a4;
  v6[6] = &v7;
  v6[4] = a3;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __69__AVFigRouteDescriptorOutputDeviceImpl_borrowScreenForClient_reason___block_invoke(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = -[AVOutputDeviceScreenBorrowToken initWithEndpoint:client:reason:]([AVOutputDeviceScreenBorrowToken alloc], "initWithEndpoint:client:reason:", a2, a1[4], a1[5]);
  return 0;
}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__AVFigRouteDescriptorOutputDeviceImpl_takeScreenForClient_reason___block_invoke;
  v4[3] = &unk_1E3033AA8;
  v4[4] = a3;
  v4[5] = a4;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v4);
}

uint64_t __67__AVFigRouteDescriptorOutputDeviceImpl_takeScreenForClient_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceTakeScreenForClient(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)siriForwardingEnabled
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (void)setSiriForwardingEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__AVFigRouteDescriptorOutputDeviceImpl_setSiriForwardingEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e28_i16__0__OpaqueFigEndpoint__8l;
  v4 = a3;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v3);
}

uint64_t __65__AVFigRouteDescriptorOutputDeviceImpl_setSiriForwardingEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceSetAlternateSiriOnEndpoint(a2, *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)carOwnsMainAudio
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (NSDictionary)displayCornerMasks
{
  NSDictionary *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__AVFigRouteDescriptorOutputDeviceImpl_displayCornerMasks__block_invoke;
  v4[3] = &unk_1E3033AD0;
  v4[4] = &v5;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v4);
  v2 = (NSDictionary *)v6[5];
  if (!v2)
    v2 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __58__AVFigRouteDescriptorOutputDeviceImpl_displayCornerMasks__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = AVOutputDeviceGetDisplayCornerMasksFromEndpoint();
  return 0;
}

- (void)setDisplayCornerMasks:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__AVFigRouteDescriptorOutputDeviceImpl_setDisplayCornerMasks___block_invoke;
  v3[3] = &unk_1E30339B8;
  v3[4] = a3;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v3);
}

uint64_t __62__AVFigRouteDescriptorOutputDeviceImpl_setDisplayCornerMasks___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceSetDisplayCornerMasksEndpoint(a2, *(_QWORD *)(a1 + 32));
}

- (int64_t)voiceTriggerMode
{
  int64_t result;

  result = (int64_t)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("VoiceActivationType"));
  if (result)
    return objc_msgSend((id)result, "unsignedIntegerValue");
  return result;
}

- (int64_t)authenticationType
{
  CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("AuthenticationType"));
  return AVOutputDeviceAuthenticationTypeFromFigAuthenticationType();
}

- (id)currentScreenViewAreaForScreenID:(id)a3
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__21;
  v10 = __Block_byref_object_dispose__21;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__AVFigRouteDescriptorOutputDeviceImpl_currentScreenViewAreaForScreenID___block_invoke;
  v5[3] = &unk_1E3033A58;
  v5[4] = a3;
  v5[5] = &v6;
  -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v5);
  v3 = (void *)v7[5];
  if (!v3)
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __73__AVFigRouteDescriptorOutputDeviceImpl_currentScreenViewAreaForScreenID___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = AVOutputDeviceGetCurrentScreenViewAreaFromEndpoint(a2, *(_QWORD *)(a1 + 32));
  return 0;
}

- (BOOL)isActivated
{
  -[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor");
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

- (NSArray)screens
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("ScreenInfo"));
  return (NSArray *)AVOutputDeviceAVOutputDeviceScreenInfoFromFigScreens(Value);
}

- (NSDictionary)outputDeviceInfo
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(-[AVFigRouteDescriptorOutputDeviceImpl routeDescriptor](self, "routeDescriptor"), CFSTR("EndpointInfo"));
  if (Value)
    return (NSDictionary *)Value;
  else
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (void)suggestUIWithURLs:(id)a3 completionHandler:(id)a4
{
  signed int v5;
  uint64_t v6;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__AVFigRouteDescriptorOutputDeviceImpl_suggestUIWithURLs_completionHandler___block_invoke;
  v7[3] = &unk_1E3033B20;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = &v9;
  v8 = 0;
  v5 = -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v7);
  if (v5)
    v6 = AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  else
    v6 = 0;
  if (*((_BYTE *)v10 + 24))
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v6);
  _Block_object_dispose(&v9, 8);
}

uint64_t __76__AVFigRouteDescriptorOutputDeviceImpl_suggestUIWithURLs_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  AVOutputDeviceSuggestUIWithURLSAndCompletionHandler(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  return *(unsigned int *)(a1 + 56);
}

- (void)performHapticFeedbackForUUID:(id)a3 withHapticType:(id)a4 completionHandler:(id)a5
{
  signed int v6;
  uint64_t v7;
  _QWORD v8[8];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__AVFigRouteDescriptorOutputDeviceImpl_performHapticFeedbackForUUID_withHapticType_completionHandler___block_invoke;
  v8[3] = &unk_1E3033B48;
  v8[4] = a3;
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = &v10;
  v9 = 0;
  v6 = -[AVFigRouteDescriptorOutputDeviceImpl _withEndpoint:](self, "_withEndpoint:", v8);
  if (v6)
    v7 = AVLocalizedErrorWithUnderlyingOSStatus(v6, 0);
  else
    v7 = 0;
  if (*((_BYTE *)v11 + 24))
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v7);
  _Block_object_dispose(&v10, 8);
}

uint64_t __102__AVFigRouteDescriptorOutputDeviceImpl_performHapticFeedbackForUUID_withHapticType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  AVOutputDevicePerformHapticFeedback(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  return *(unsigned int *)(a1 + 64);
}

- (AVOutputDeviceImplSupport)implEventListener
{
  return (AVOutputDeviceImplSupport *)objc_loadWeak((id *)&self->_implSupportEventListener);
}

- (AVOutputDeviceDelegate)delegate
{
  return (AVOutputDeviceDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

@end
