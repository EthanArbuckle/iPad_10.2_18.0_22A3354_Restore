@implementation AVFigRoutingContextOutputContextImpl

- (BOOL)providesControlForAllVolumeFeatures
{
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *routingContext;
  void (*v4)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *);
  char v6;

  v6 = 0;
  volumeController = self->_volumeController;
  if (!volumeController)
    return 0;
  routingContext = self->_routingContext;
  v4 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 8);
  if (!v4)
    return 0;
  v4(volumeController, routingContext, &v6);
  return v6 != 0;
}

- (AVFigRoutingContextOutputContextImpl)initWithFigRoutingContext:(OpaqueFigRoutingContext *)a3 routingContextReplacementBlock:(id)a4 outputDeviceTranslator:(id)a5 volumeController:(OpaqueFigVolumeControllerState *)a6 communicationChannelManagerCreator:(id)a7
{
  id v13;
  AVFigRoutingContextOutputContextImpl *v14;
  AVFigRoutingContextOutputDeviceTranslator *v15;
  OpaqueFigVolumeControllerState *v16;
  OpaqueFigRoutingContext *v17;
  OpaqueFigRoutingContext *v18;
  unsigned int (*v19)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFNumberRef *);
  AVFigRoutingContextCommunicationChannelManager *v20;
  AVWeakReference *weakObserver;
  OpaqueFigRoutingContext *routingContext;
  uint64_t v23;
  void *v24;
  OpaqueFigVolumeControllerState *volumeController;
  objc_super v27;
  int valuePtr;
  CFNumberRef number;

  v13 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  number = 0;
  valuePtr = 0;
  v27.receiver = self;
  v27.super_class = (Class)AVFigRoutingContextOutputContextImpl;
  v14 = -[AVFigRoutingContextOutputContextImpl init](&v27, sel_init);
  if (!v14)
    goto LABEL_18;
  v14->_routingContextCreator = (id)objc_msgSend(a4, "copy");
  v15 = (AVFigRoutingContextOutputDeviceTranslator *)a5;
  v14->_deviceTranslator = v15;
  if (!v15)
    goto LABEL_18;
  v16 = a6 ? (OpaqueFigVolumeControllerState *)CFRetain(a6) : 0;
  v14->_volumeController = v16;
  v14->_commChannelManagerCreator = (id)objc_msgSend(a7, "copy");
  if (!v14->_routingContextCreator)
    goto LABEL_18;
  if (!a3)
  {
    v14->_routingContext = 0;
    goto LABEL_23;
  }
  v17 = (OpaqueFigRoutingContext *)CFRetain(a3);
  a3 = 0;
  v14->_routingContext = v17;
  if (v14->_commChannelManagerCreator)
  {
    v18 = v17;
    if (v17)
    {
      v19 = *(unsigned int (**)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
      if (v19)
      {
        if (!v19(v18, *MEMORY[0x1E0D48D50], *MEMORY[0x1E0C9AE00], &number))
        {
          if (CFNumberGetValue(number, kCFNumberIntType, &valuePtr))
          {
            if (valuePtr == 9
              || (v20 = (AVFigRoutingContextCommunicationChannelManager *)objc_retain((id)(*((uint64_t (**)(void))v14->_commChannelManagerCreator
                                                                                           + 2))()),
                  (v14->_commChannelManager = v20) != 0))
            {
              v14->_usesRouteConfigUpdatedNotification = AVOutputContextUsesRouteConfigUpdatedNotification();
              v14->_weakObserver = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v14);
              v14->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputcontext.figroutingcontext");
              v14->_destinationChangesForRouteChangeIDs = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
              objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigRoutingContextSystemPickerVideoRouteChanged, *MEMORY[0x1E0D48D30], v14->_routingContext, 0);
              weakObserver = v14->_weakObserver;
              routingContext = v14->_routingContext;
              if (v14->_usesRouteConfigUpdatedNotification)
              {
                v23 = *MEMORY[0x1E0D48D20];
                v24 = AVFigRoutingContextRouteConfigUpdated;
              }
              else
              {
                objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", weakObserver, AVFigRoutingContextCurrentRouteChanged, *MEMORY[0x1E0D48CF0], routingContext, 0);
                objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigRoutingContextRouteChangeStarted, *MEMORY[0x1E0D48D18], v14->_routingContext, 0);
                objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigRoutingContextRouteChangeEnded, *MEMORY[0x1E0D48D10], v14->_routingContext, 0);
                weakObserver = v14->_weakObserver;
                v23 = *MEMORY[0x1E0D48CE8];
                routingContext = v14->_routingContext;
                v24 = AVFigRoutingContextGroupConfigurationChanged;
              }
              objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", weakObserver, v24, v23, routingContext, 0);
              objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigRoutingContextServerConnectionDied, *MEMORY[0x1E0D48D28], v14->_routingContext, 0);
              objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigRoutingContextRemoteControlChannelAvailabilityChanged, *MEMORY[0x1E0D48D08], v14->_routingContext, 0);
              objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigRoutingContextPredictedSelectedRouteDescriptorChanged, *MEMORY[0x1E0D48D00], v14->_routingContext, 0);
              volumeController = v14->_volumeController;
              if (volumeController)
              {
                objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigVolumeControllerCanUseForRoutingContextDidChange, *MEMORY[0x1E0D48E30], volumeController, 0);
                objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigVolumeControllerCanSetMasterVolumeDidChange, *MEMORY[0x1E0D48E28], v14->_volumeController, 0);
                objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigVolumeControllerMasterVolumeDidChange, *MEMORY[0x1E0D48E58], v14->_volumeController, 0);
                objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigVolumeControllerMasterVolumeControlTypeDidChange, *MEMORY[0x1E0D48E50], v14->_volumeController, 0);
                objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigVolumeControllerCanMuteDidChange, *MEMORY[0x1E0D48E68], v14->_volumeController, 0);
                objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14->_weakObserver, AVFigVolumeControllerMuteDidChange, *MEMORY[0x1E0D48E70], v14->_volumeController, 0);
              }
              -[AVFigRoutingContextCommunicationChannelManager setParentOutputContextImpl:](v14->_commChannelManager, "setParentOutputContextImpl:", v14);
              a3 = v14;
              goto LABEL_23;
            }
          }
        }
      }
LABEL_18:
      a3 = 0;
    }
  }
LABEL_23:
  if (number)
    CFRelease(number);

  return (AVFigRoutingContextOutputContextImpl *)a3;
}

- (NSArray)outputDevices
{
  return (NSArray *)-[AVFigRoutingContextOutputDeviceTranslator outputDevicesFromRoutingContext:](self->_deviceTranslator, "outputDevicesFromRoutingContext:", self->_routingContext);
}

- (NSString)ID
{
  return (NSString *)objc_msgSend(-[AVFigRoutingContextOutputContextImpl routingContextUUID](self, "routingContextUUID"), "UUIDString");
}

- (id)routingContextUUID
{
  OpaqueFigRoutingContext *routingContext;
  unsigned int (*v3)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFTypeRef *);
  id v4;
  void *v5;
  CFTypeRef v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef cf[21];

  cf[20] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  routingContext = self->_routingContext;
  v3 = *(unsigned int (**)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                             + 48);
  if (v3)
  {
    if (v3(routingContext, *MEMORY[0x1E0D48D58], *MEMORY[0x1E0C9AE00], cf))
    {
      v5 = 0;
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v5 = (void *)objc_msgSend(v4, "initWithUUIDString:", cf[0]);
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = cf[0];
  if (cf[0]
    || (os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(),
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT),
        fig_log_call_emit_and_clean_up_after_send_and_compose(),
        (v6 = cf[0]) != 0))
  {
    CFRelease(v6);
  }
  return v5;
}

- (AVOutputDevice)predictedOutputDevice
{
  return (AVOutputDevice *)objc_msgSend(AVOutputContextGetDefaultDeviceTranslator(self->_usesRouteConfigUpdatedNotification), "predictedOutputDeviceFromRoutingContext:", self->_routingContext);
}

- (void)setParentOutputContext:(id)a3
{
  objc_storeWeak((id *)&self->_parentContext, a3);
}

+ (id)outputContextImplForID:(id)a3 type:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRoutingContextUUID:type:", a3, a4);
}

+ (id)sharedAudioPresentationOutputContext
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = objc_msgSend(a1, "routingContextFactory");
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__AVFigRoutingContextOutputContextImpl_sharedAudioPresentationOutputContext__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

- (AVFigRoutingContextOutputContextImpl)initWithRoutingContextUUID:(id)a3 type:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef v13;
  unsigned int (*v14)(CFTypeRef, _QWORD, uint64_t, CFNumberRef *);
  AVFigRoutingContextOutputContextImpl *v15;
  _QWORD v17[6];
  int v18;
  int valuePtr;
  CFNumberRef number;
  CFTypeRef cf;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend((id)objc_opt_class(), "routingContextFactory");
  v22 = *MEMORY[0x1E0D48BE0];
  v23[0] = a3;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
  number = 0;
  cf = 0;
  valuePtr = 0;
  if (a4)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AVOutputContextTypeSharedSystemAudio")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AVOutputContextTypeSharedSystemScreen")) & 1) != 0)
    {
      v10 = 2;
    }
    else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AVOutputContextTypeSharedAudioPresentation")) & 1) != 0)
    {
      v10 = 3;
    }
    else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AVOutputContextTypeAudio")) & 1) != 0)
    {
      v10 = 4;
    }
    else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AVOutputContextTypeVideo")) & 1) != 0)
    {
      v10 = 5;
    }
    else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AVOutputContextTypeScreen")) & 1) != 0)
    {
      v10 = 6;
    }
    else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AVOutputContextTypeGroupControl")) & 1) != 0)
    {
      v10 = 8;
    }
    else if (objc_msgSend(a4, "isEqualToString:", 0x1E3047418))
    {
      v10 = 9;
    }
    else
    {
      v10 = 0;
    }
    v11 = objc_msgSend(v9, "numberWithUnsignedInt:", v10);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D48BD8]);
  }
  v12 = *MEMORY[0x1E0C9AE00];
  if (!objc_msgSend(v7, "copyContextForUUIDWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], v8, &cf)&& (v13 = cf) != 0&& (v14 = *(unsigned int (**)(CFTypeRef, _QWORD, uint64_t, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)+ 48)) != 0&& !v14(v13, *MEMORY[0x1E0D48D50], v12, &number)&& CFNumberGetValue(number, kCFNumberIntType, &valuePtr))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__AVFigRoutingContextOutputContextImpl_initWithRoutingContextUUID_type___block_invoke;
    v17[3] = &unk_1E3035858;
    v18 = valuePtr;
    v17[4] = v8;
    v17[5] = v7;
    self = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContext:routingContextReplacementBlock:](self, "initWithFigRoutingContext:routingContextReplacementBlock:", cf, v17);
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  if (number)
    CFRelease(number);
  if (cf)
    CFRelease(cf);
  return v15;
}

- (AVFigRoutingContextOutputContextImpl)initWithFigRoutingContext:(OpaqueFigRoutingContext *)a3 routingContextReplacementBlock:(id)a4
{
  _BOOL8 v7;
  id DefaultDeviceTranslator;
  AVFigRoutingContextOutputContextImpl *v9;
  AVFigRoutingContextOutputContextImpl *v10;

  v7 = AVOutputContextUsesRouteConfigUpdatedNotification();
  DefaultDeviceTranslator = AVOutputContextGetDefaultDeviceTranslator(v7);
  FigVolumeControllerCopySharedControllerRemote();
  v9 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:](self, "initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:", a3, a4, DefaultDeviceTranslator, 0, +[AVOutputContext defaultCommunicationChannelManagerCreator](AVOutputContext, "defaultCommunicationChannelManagerCreator"));
  v10 = v9;

  return v10;
}

- (AVFigRoutingContextOutputContextImpl)initWithFigRoutingContextCreator:(id)a3
{
  uint64_t v5;
  const void *v6;
  AVFigRoutingContextOutputContextImpl *v7;

  v5 = (*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContext:routingContextReplacementBlock:](self, "initWithFigRoutingContext:routingContextReplacementBlock:", v5, a3);
    CFRelease(v6);
    return v7;
  }
  else
  {

    return 0;
  }
}

uint64_t __76__AVFigRoutingContextOutputContextImpl_sharedAudioPresentationOutputContext__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "copySystemMusicContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v2);
  return v2;
}

+ (id)auxiliaryOutputContext
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = objc_msgSend(a1, "routingContextFactory");
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__AVFigRoutingContextOutputContextImpl_auxiliaryOutputContext__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

uint64_t __62__AVFigRoutingContextOutputContextImpl_auxiliaryOutputContext__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "createVideoContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v2);
  return v2;
}

+ (id)platformDependentScreenOrVideoContext
{
  void *v2;
  uint64_t PlatformDependentScreenOrVideoRoutingContext;
  const void *v4;
  unsigned int (*v5)(const void *, _QWORD, _QWORD, id *);
  id v6;
  AVFigRoutingContextOutputContextImpl *v7;
  AVFigRoutingContextOutputContextImpl *v8;
  _QWORD v10[6];
  id v11;

  v2 = (void *)objc_msgSend(a1, "routingContextFactory");
  PlatformDependentScreenOrVideoRoutingContext = AVOutputContextCreatePlatformDependentScreenOrVideoRoutingContext(v2, 0);
  v11 = 0;
  if (PlatformDependentScreenOrVideoRoutingContext)
  {
    v4 = (const void *)PlatformDependentScreenOrVideoRoutingContext;
    v5 = *(unsigned int (**)(const void *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
    if (!v5 || v5(v4, *MEMORY[0x1E0D48D58], *MEMORY[0x1E0C9AE00], &v11))
    {
      v8 = 0;
    }
    else
    {
      v6 = v11;
      v7 = [AVFigRoutingContextOutputContextImpl alloc];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __77__AVFigRoutingContextOutputContextImpl_platformDependentScreenOrVideoContext__block_invoke;
      v10[3] = &unk_1E3035810;
      v10[4] = v11;
      v10[5] = v2;
      v8 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContext:routingContextReplacementBlock:](v7, "initWithFigRoutingContext:routingContextReplacementBlock:", v4, v10);
    }
    CFRelease(v4);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

uint64_t __77__AVFigRoutingContextOutputContextImpl_platformDependentScreenOrVideoContext__block_invoke(uint64_t a1)
{
  CFDictionaryRef v2;
  uint64_t PlatformDependentScreenOrVideoRoutingContext;
  void *values;

  values = *(void **)(a1 + 32);
  v2 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0D48BE0], (const void **)&values, 1, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  PlatformDependentScreenOrVideoRoutingContext = AVOutputContextCreatePlatformDependentScreenOrVideoRoutingContext(*(void **)(a1 + 40), (uint64_t)v2);
  if (v2)
    CFRelease(v2);
  return PlatformDependentScreenOrVideoRoutingContext;
}

+ (id)sharedSystemAudioContext
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = objc_msgSend(a1, "routingContextFactory");
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__AVFigRoutingContextOutputContextImpl_sharedSystemAudioContext__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

uint64_t __64__AVFigRoutingContextOutputContextImpl_sharedSystemAudioContext__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "copySystemAudioContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v2);
  return v2;
}

+ (id)sharedSystemRemoteDisplayContext
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = objc_msgSend(a1, "routingContextFactory");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AVFigRoutingContextOutputContextImpl_sharedSystemRemoteDisplayContext__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

uint64_t __72__AVFigRoutingContextOutputContextImpl_sharedSystemRemoteDisplayContext__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "copySystemRemoteDisplayContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v2);
  return v2;
}

+ (id)sharedSystemScreenContext
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = objc_msgSend(a1, "routingContextFactory");
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AVFigRoutingContextOutputContextImpl_sharedSystemScreenContext__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

uint64_t __65__AVFigRoutingContextOutputContextImpl_sharedSystemScreenContext__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "copySystemMirroringContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v2);
  return v2;
}

+ (id)sharedSystemRemotePoolContext
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = objc_msgSend(a1, "routingContextFactory");
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__AVFigRoutingContextOutputContextImpl_sharedSystemRemotePoolContext__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

uint64_t __69__AVFigRoutingContextOutputContextImpl_sharedSystemRemotePoolContext__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "copySystemRemotePoolContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v2);
  return v2;
}

+ (id)allSharedAudioOutputContextImpls
{
  void *v2;
  void *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  uint64_t v7;
  const void *ValueAtIndex;
  AVFigRoutingContextOutputContextImpl *v9;
  AVFigRoutingContextOutputContextImpl *v10;
  _QWORD v12[5];
  CFArrayRef theArray;

  v2 = (void *)objc_msgSend(a1, "routingContextFactory");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  theArray = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "copyAllAudioContexts:", &theArray);
    if (theArray)
    {
      Count = CFArrayGetCount(theArray);
      if (Count >= 1)
      {
        v5 = Count;
        v6 = 0;
        v7 = MEMORY[0x1E0C809B0];
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, v6);
          v9 = [AVFigRoutingContextOutputContextImpl alloc];
          v12[0] = v7;
          v12[1] = 3221225472;
          v12[2] = __72__AVFigRoutingContextOutputContextImpl_allSharedAudioOutputContextImpls__block_invoke;
          v12[3] = &__block_descriptor_40_e31___OpaqueFigRoutingContext__8__0l;
          v12[4] = ValueAtIndex;
          v10 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v9, "initWithFigRoutingContextCreator:", v12);
          if (v10)
            objc_msgSend(v3, "addObject:", v10);

          ++v6;
        }
        while (v5 != v6);
      }
      if (theArray)
        CFRelease(theArray);
    }
  }
  return v3;
}

CFTypeRef __72__AVFigRoutingContextOutputContextImpl_allSharedAudioOutputContextImpls__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 32);
  if (result)
    return CFRetain(result);
  return result;
}

+ (id)iTunesAudioContext
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = objc_msgSend(a1, "routingContextFactory");
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVFigRoutingContextOutputContextImpl_iTunesAudioContext__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

uint64_t __58__AVFigRoutingContextOutputContextImpl_iTunesAudioContext__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "createAudioContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v2);
  return v2;
}

+ (id)addSharedAudioOutputContextImpl
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = objc_msgSend(a1, "routingContextFactory");
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__AVFigRoutingContextOutputContextImpl_addSharedAudioOutputContextImpl__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

uint64_t __71__AVFigRoutingContextOutputContextImpl_addSharedAudioOutputContextImpl__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "createAudioContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v2);
  return v2;
}

+ (id)defaultSharedOutputContextImpl
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = objc_msgSend(a1, "routingContextFactory");
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__AVFigRoutingContextOutputContextImpl_defaultSharedOutputContextImpl__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

uint64_t __70__AVFigRoutingContextOutputContextImpl_defaultSharedOutputContextImpl__block_invoke(uint64_t a1)
{
  char v2;
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  v2 = objc_opt_respondsToSelector();
  result = 0;
  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "copyDefaultContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v4);
    return v4;
  }
  return result;
}

+ (id)outputContextImplForControllingOutputDeviceGroupWithID:(id)a3 options:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD *v14;
  AVFigRoutingContextOutputContextImpl *v15;
  void *v17;
  _QWORD v18[6];

  if (!a3)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)"groupID != nil"), 0);
    objc_exception_throw(v17);
  }
  v10 = objc_msgSend(a1, "routingContextFactory");
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextDeviceGroupControlOptionCancelAddDeviceIfAuthRequired"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0D48BE8]);
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "BOOLValue");
      v14 = (_QWORD *)MEMORY[0x1E0C9AE50];
      if (!v13)
        v14 = (_QWORD *)MEMORY[0x1E0C9AE40];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", *v14, *MEMORY[0x1E0D48BD0]);
    }
  }
  v15 = [AVFigRoutingContextOutputContextImpl alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __103__AVFigRoutingContextOutputContextImpl_outputContextImplForControllingOutputDeviceGroupWithID_options___block_invoke;
  v18[3] = &unk_1E3035810;
  v18[4] = v10;
  v18[5] = v11;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v15, "initWithFigRoutingContextCreator:", v18);
}

uint64_t __103__AVFigRoutingContextOutputContextImpl_outputContextImplForControllingOutputDeviceGroupWithID_options___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "createRemoteMusicControllerContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], *(_QWORD *)(a1 + 40), &v2);
  return v2;
}

- (AVFigRoutingContextOutputContextImpl)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_initWithFigRoutingContextCreator_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

uint64_t __72__AVFigRoutingContextOutputContextImpl_initWithRoutingContextUUID_type___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = 0;
  v1 = *(_QWORD *)(a1 + 32);
  switch(*(_DWORD *)(a1 + 48))
  {
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "copySystemAudioContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v3);
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "copySystemMirroringContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v3);
      break;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "copySystemMusicContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v3);
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 40), "createAudioContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], v1, &v3);
      break;
    case 5:
      objc_msgSend(*(id *)(a1 + 40), "createVideoContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], v1, &v3);
      break;
    case 6:
      objc_msgSend(*(id *)(a1 + 40), "createPerAppSecondDisplayContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], v1, &v3);
      break;
    case 8:
      objc_msgSend(*(id *)(a1 + 40), "createRemoteMusicControllerContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], v1, &v3);
      break;
    default:
      objc_msgSend(*(id *)(a1 + 40), "copyContextForUUIDWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], v1, &v3);
      break;
  }
  return v3;
}

- (void)dealloc
{
  id v3;
  AVWeakReference *weakObserver;
  OpaqueFigRoutingContext *routingContext;
  uint64_t v6;
  void *v7;
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *v9;
  NSObject *ivarAccessQueue;
  objc_super v11;

  if (self->_routingContext)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRoutingContextSystemPickerVideoRouteChanged, *MEMORY[0x1E0D48D30], self->_routingContext);
    weakObserver = self->_weakObserver;
    routingContext = self->_routingContext;
    if (self->_usesRouteConfigUpdatedNotification)
    {
      v6 = *MEMORY[0x1E0D48D20];
      v7 = AVFigRoutingContextRouteConfigUpdated;
    }
    else
    {
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", weakObserver, AVFigRoutingContextCurrentRouteChanged, *MEMORY[0x1E0D48CF0], routingContext);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRoutingContextRouteChangeStarted, *MEMORY[0x1E0D48D18], self->_routingContext);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRoutingContextRouteChangeEnded, *MEMORY[0x1E0D48D10], self->_routingContext);
      weakObserver = self->_weakObserver;
      v6 = *MEMORY[0x1E0D48CE8];
      routingContext = self->_routingContext;
      v7 = AVFigRoutingContextGroupConfigurationChanged;
    }
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", weakObserver, v7, v6, routingContext);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRoutingContextServerConnectionDied, *MEMORY[0x1E0D48D28], self->_routingContext);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRoutingContextRemoteControlChannelAvailabilityChanged, *MEMORY[0x1E0D48D08], self->_routingContext);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRoutingContextPredictedSelectedRouteDescriptorChanged, *MEMORY[0x1E0D48D00], self->_routingContext);
    if (self->_volumeController)
    {
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigVolumeControllerCanUseForRoutingContextDidChange, *MEMORY[0x1E0D48E30]);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigVolumeControllerCanSetMasterVolumeDidChange, *MEMORY[0x1E0D48E28], self->_volumeController);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigVolumeControllerMasterVolumeDidChange, *MEMORY[0x1E0D48E58], self->_volumeController);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigVolumeControllerMasterVolumeControlTypeDidChange, *MEMORY[0x1E0D48E50], self->_volumeController);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigVolumeControllerCanMuteDidChange, *MEMORY[0x1E0D48E68], self->_volumeController);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigVolumeControllerMuteDidChange, *MEMORY[0x1E0D48E70], self->_volumeController);
    }
  }

  volumeController = self->_volumeController;
  if (volumeController)
    CFRelease(volumeController);

  v9 = self->_routingContext;
  if (v9)
    CFRelease(v9);

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
  v11.receiver = self;
  v11.super_class = (Class)AVFigRoutingContextOutputContextImpl;
  -[AVFigRoutingContextOutputContextImpl dealloc](&v11, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[AVFigRoutingContextOutputContextImpl routingContextUUID](self, "routingContextUUID"), "isEqual:", objc_msgSend(a3, "routingContextUUID"));
  else
    return 0;
}

- (unint64_t)hash
{
  return objc_msgSend(-[AVFigRoutingContextOutputContextImpl routingContextUUID](self, "routingContextUUID"), "hash");
}

- (AVOutputDevice)outputDevice
{
  return (AVOutputDevice *)-[AVFigRoutingContextOutputDeviceTranslator outputDeviceFromRoutingContext:](self->_deviceTranslator, "outputDeviceFromRoutingContext:", self->_routingContext);
}

- (NSString)outputContextType
{
  OpaqueFigRoutingContext *routingContext;
  unsigned int (*v3)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFNumberRef *);
  __CFString *v4;
  __CFString **v5;
  int valuePtr;
  CFNumberRef number;

  number = 0;
  routingContext = self->_routingContext;
  v3 = *(unsigned int (**)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                               + 48);
  if (v3
    && !v3(routingContext, *MEMORY[0x1E0D48D50], *MEMORY[0x1E0C9AE00], &number)
    && (valuePtr = 0, CFNumberGetValue(number, kCFNumberIntType, &valuePtr)))
  {
    v4 = 0;
    switch(valuePtr)
    {
      case 1:
        v5 = AVOutputContextTypeSharedSystemAudio;
        goto LABEL_15;
      case 2:
        v5 = AVOutputContextTypeSharedSystemScreen;
        goto LABEL_15;
      case 3:
        v5 = AVOutputContextTypeSharedAudioPresentation;
        goto LABEL_15;
      case 4:
        v5 = AVOutputContextTypeAudio;
        goto LABEL_15;
      case 5:
        v5 = AVOutputContextTypeVideo;
        goto LABEL_15;
      case 6:
        v5 = AVOutputContextTypeScreen;
        goto LABEL_15;
      case 8:
        v5 = AVOutputContextTypeGroupControl;
        goto LABEL_15;
      case 9:
        v4 = CFSTR("AVOutputContextTypeSharedSystemRemotePool");
        break;
      case 14:
        v5 = AVOutputContextTypeSystemRemoteDisplay;
LABEL_15:
        v4 = *v5;
        break;
      default:
        break;
    }
  }
  else
  {
    v4 = 0;
  }
  if (number)
    CFRelease(number);
  return &v4->isa;
}

- (void)_routeChangeStartedWithID:(id)a3
{
  AVOutputContextDestinationChange *v5;
  NSObject *ivarAccessQueue;
  _QWORD block[7];

  v5 = objc_alloc_init(AVOutputContextDestinationChange);
  -[AVOutputContextDestinationChange markAsInProgress](v5, "markAsInProgress");
  -[AVOutputContext outputContextImpl:didInitiateDestinationChange:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImpl:didInitiateDestinationChange:", self, v5);
  if (a3)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__AVFigRoutingContextOutputContextImpl__routeChangeStartedWithID___block_invoke;
    block[3] = &unk_1E302FD88;
    block[4] = self;
    block[5] = v5;
    block[6] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  }

}

uint64_t __66__AVFigRoutingContextOutputContextImpl__routeChangeStartedWithID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1[4] + 88));
  objc_msgSend(v2, "setObject:forKey:", a1[5], a1[6]);

  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(a1[4] + 88) = result;
  return result;
}

- (void)_routeChangeEndedWithID:(id)a3 reason:(__CFString *)a4
{
  NSObject *ivarAccessQueue;
  void *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__44;
  v12 = __Block_byref_object_dispose__44;
  v13 = 0;
  if (a3)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__AVFigRoutingContextOutputContextImpl__routeChangeEndedWithID_reason___block_invoke;
    block[3] = &unk_1E3035178;
    block[5] = a3;
    block[6] = &v8;
    block[4] = self;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    v6 = (void *)v9[5];
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "changeToTerminalStatusBasedOnRouteChangeEndedReason:", a4);

  _Block_object_dispose(&v8, 8);
}

uint64_t __71__AVFigRoutingContextOutputContextImpl__routeChangeEndedWithID_reason___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1[4] + 88));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = (id)objc_msgSend(v2, "objectForKey:", a1[5]);
  objc_msgSend(v2, "removeObjectForKey:", a1[5]);

  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(a1[4] + 88) = result;
  return result;
}

- (void)_currentRouteChanged
{
  -[AVOutputContext outputContextImpl:didChangeOutputDeviceWithInitiator:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImpl:didChangeOutputDeviceWithInitiator:", self, 0);
}

- (void)_groupConfigurationChanged
{
  -[AVOutputContext outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:", self, 0, 0, 0, 0);
}

- (void)_routeConfigUpdatedWithID:(__CFString *)a3 reason:(__CFString *)a4 initiator:(__CFString *)a5 endedError:(__CFString *)a6 deviceID:(__CFString *)a7 previousDeviceIDs:(__CFArray *)a8
{
  const __CFString *v14;
  AVOutputContext *v15;
  _BOOL4 v16;
  AVOutputContext *v17;
  _BOOL4 v18;

  if (FigCFEqual())
    v14 = CFSTR("AVOutputContextDestinationChangeReasonIdleDisconnect");
  else
    v14 = 0;
  if (FigCFEqual())
  {
    -[AVFigRoutingContextOutputContextImpl _routeConfigUpdateStartedWithID:](self, "_routeConfigUpdateStartedWithID:", a3);
  }
  else
  {
    if (FigCFEqual())
    {
      v15 = -[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext");
    }
    else
    {
      if (!FigCFEqual())
      {
        -[AVFigRoutingContextOutputContextImpl _routeConfigUpdateEndedWithID:reason:](self, "_routeConfigUpdateEndedWithID:reason:", a3, a4);
        goto LABEL_9;
      }
      v18 = -[AVFigRoutingContextOutputContextImpl supportsMultipleOutputDevices](self, "supportsMultipleOutputDevices");
      v15 = -[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext");
      if (!v18)
      {
        -[AVOutputContext outputContextImpl:didChangeOutputDeviceWithInitiator:](v15, "outputContextImpl:didChangeOutputDeviceWithInitiator:", self, a5);
        goto LABEL_9;
      }
    }
    -[AVOutputContext outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:](v15, "outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:", self, a5, v14, a7, a8);
  }
LABEL_9:
  if (FigCFEqual()
    || FigCFEqual()
    || FigCFEqual()
    || FigCFEqual())
  {
    v16 = -[AVFigRoutingContextOutputContextImpl supportsMultipleOutputDevices](self, "supportsMultipleOutputDevices");
    v17 = -[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext");
    if (!v16)
    {
LABEL_16:
      -[AVOutputContext outputContextImpl:didChangeOutputDeviceWithInitiator:](v17, "outputContextImpl:didChangeOutputDeviceWithInitiator:", self, a5);
      return;
    }
    -[AVOutputContext outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:](v17, "outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:", self, a5, v14, a7, a8);
    if (-[NSString isEqualToString:](-[AVFigRoutingContextOutputContextImpl outputContextType](self, "outputContextType"), "isEqualToString:", CFSTR("AVOutputContextTypeAudio")))
    {
      v17 = -[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext");
      goto LABEL_16;
    }
  }
}

- (void)_routeConfigUpdateStartedWithID:(__CFString *)a3
{
  AVOutputContextDestinationChange *v5;
  NSObject *ivarAccessQueue;
  _QWORD block[7];

  v5 = objc_alloc_init(AVOutputContextDestinationChange);
  -[AVOutputContextDestinationChange markAsInProgress](v5, "markAsInProgress");
  -[AVOutputContext outputContextImpl:didInitiateDestinationChange:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImpl:didInitiateDestinationChange:", self, v5);
  if (a3)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__AVFigRoutingContextOutputContextImpl__routeConfigUpdateStartedWithID___block_invoke;
    block[3] = &unk_1E302FEE0;
    block[4] = self;
    block[5] = v5;
    block[6] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  }

}

uint64_t __72__AVFigRoutingContextOutputContextImpl__routeConfigUpdateStartedWithID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1[4] + 88));
  objc_msgSend(v2, "setObject:forKey:", a1[5], a1[6]);

  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(a1[4] + 88) = result;
  return result;
}

- (void)_routeConfigUpdateEndedWithID:(__CFString *)a3 reason:(__CFString *)a4
{
  NSObject *ivarAccessQueue;
  void *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__44;
  v12 = __Block_byref_object_dispose__44;
  v13 = 0;
  if (a3)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__AVFigRoutingContextOutputContextImpl__routeConfigUpdateEndedWithID_reason___block_invoke;
    block[3] = &unk_1E3031868;
    block[4] = self;
    block[5] = &v8;
    block[6] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    v6 = (void *)v9[5];
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "changeToTerminalStatusBasedOnRouteConfigUpdatedReason:", a4);

  _Block_object_dispose(&v8, 8);
}

uint64_t __77__AVFigRoutingContextOutputContextImpl__routeConfigUpdateEndedWithID_reason___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1[4] + 88));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = (id)objc_msgSend(v2, "objectForKey:", a1[6]);
  objc_msgSend(v2, "removeObjectForKey:", a1[6]);

  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(a1[4] + 88) = result;
  return result;
}

- (void)_systemPickerVideoRouteChanged
{
  -[AVOutputContext outputContextImplDidChangeGlobalOutputDeviceConfiguration:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImplDidChangeGlobalOutputDeviceConfiguration:", self);
}

- (NSString)associatedAudioDeviceID
{
  OpaqueFigRoutingContext *routingContext;
  void (*v3)(OpaqueFigRoutingContext *, _QWORD, _QWORD, void **);
  void *v4;
  void *v6;

  v6 = 0;
  routingContext = self->_routingContext;
  v3 = *(void (**)(OpaqueFigRoutingContext *, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 48);
  if (v3)
  {
    v3(routingContext, *MEMORY[0x1E0D48D48], *MEMORY[0x1E0C9AE00], &v6);
    v4 = v6;
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (__CFDictionary)_createSelectRouteOptionsForSetOutputDeviceOptions:(id)a3
{
  const void *v5;
  void *v6;
  void *v7;
  const void *v8;
  void *v9;
  const void *v10;
  void *v11;
  __CFDictionary *Mutable;
  const void *v13;
  const void *v14;
  int v15;
  const void **v16;
  const void *v17;
  int v18;
  const void **v19;
  const void *v20;
  int v21;
  const void **v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const void **v29;
  void *v31;
  unsigned int v33;

  v5 = (const void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVOutputContextSetOutputDevicePasswordKey"));
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceCancelIfAuthRequiredKey"));
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceSuppressUserInteractionOnSenderOnlyKey"));
  v8 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceInitiatorKey"));
  v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceFadePlaybackKey"));
  v10 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceDidFailToConnectToOutputDeviceUserInfoKey"));
  v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceMuteUntilContextModificationIsFinishedKey"));
  v33 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  if (-[AVOutputContext getApplicationProcessID:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "getApplicationProcessID:", &v33))
  {
    v13 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v33);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48D98], v13);
  }
  if (v5)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48D80], v5);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (const void *)*MEMORY[0x1E0D48D88];
      v15 = objc_msgSend(v6, "BOOLValue");
      v16 = (const void **)MEMORY[0x1E0C9AE50];
      if (!v15)
        v16 = (const void **)MEMORY[0x1E0C9AE40];
      CFDictionarySetValue(Mutable, v14, *v16);
    }
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (const void *)*MEMORY[0x1E0D48DB8];
      v18 = objc_msgSend(v7, "BOOLValue");
      v19 = (const void **)MEMORY[0x1E0C9AE50];
      if (!v18)
        v19 = (const void **)MEMORY[0x1E0C9AE40];
      CFDictionarySetValue(Mutable, v17, *v19);
    }
  }
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48DB0], v8);
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (const void *)*MEMORY[0x1E0D48DA8];
      v21 = objc_msgSend(v9, "BOOLValue");
      v22 = (const void **)MEMORY[0x1E0C9AE50];
      if (!v21)
        v22 = (const void **)MEMORY[0x1E0C9AE40];
      CFDictionarySetValue(Mutable, v20, *v22);
    }
  }
  if ((AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(Mutable, v10) & 1) == 0)
  {
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Expected a NSDictionary for didFailToConnectToOutputDeviceUserInfo"), v23, v24, v25, v26, v27, (uint64_t)a2), 0);
    objc_exception_throw(v31);
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = objc_msgSend(v11, "BOOLValue");
      v29 = (const void **)MEMORY[0x1E0C9AE50];
      if (!v28)
        v29 = (const void **)MEMORY[0x1E0C9AE40];
      CFDictionarySetValue(Mutable, CFSTR("PreemptivePortConnection"), *v29);
    }
  }
  return Mutable;
}

- (void)setOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  __CFDictionary *v8;

  v8 = -[AVFigRoutingContextOutputContextImpl _createSelectRouteOptionsForSetOutputDeviceOptions:](self, "_createSelectRouteOptionsForSetOutputDeviceOptions:", a4);
  -[AVFigRoutingContextOutputDeviceTranslator setOutputDevice:withOptions:onRoutingContext:completionHandler:](self->_deviceTranslator, "setOutputDevice:withOptions:onRoutingContext:completionHandler:", a3, v8, self->_routingContext, a5);
  if (v8)
    CFRelease(v8);
}

+ (OpaqueFigRoutingContext)copySystemVideoRoutingContext
{
  void *v2;
  OpaqueFigRoutingContext *v4;

  v4 = 0;
  v2 = (void *)objc_msgSend(a1, "routingContextFactory");
  objc_msgSend(v2, "copyDisplayMenuVideoContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v4);
  return v4;
}

+ (void)resetOutputDeviceForAllOutputContexts
{
  uint64_t v2;
  const void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void (*v5)(const void *, _QWORD, _QWORD);

  v2 = objc_msgSend(a1, "copySystemVideoRoutingContext");
  if (v2)
  {
    v3 = (const void *)v2;
    if (dword_1ECDECEF8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = *(void (**)(const void *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v5)
      v5(v3, 0, 0);
    CFRelease(v3);
  }
}

+ (BOOL)outputContextExistsWithRemoteOutputDevice
{
  uint64_t v2;
  const void *v3;
  unsigned int (*v4)(const void *, CFTypeRef *);
  BOOL v5;
  BOOL v6;
  CFTypeRef cf;

  cf = 0;
  v2 = objc_msgSend(a1, "copySystemVideoRoutingContext");
  if (!v2)
    return 0;
  v3 = (const void *)v2;
  v4 = *(unsigned int (**)(const void *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v4)
  {
    if (v4(v3, &cf))
      v5 = 1;
    else
      v5 = cf == 0;
    v6 = !v5;
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v3);
  if (cf)
    CFRelease(cf);
  return v6;
}

- (BOOL)supportsMultipleOutputDevices
{
  OpaqueFigRoutingContext *routingContext;
  uint64_t (*v3)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFBooleanRef *);
  int v4;
  CFBooleanRef v5;
  BOOL v6;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  routingContext = self->_routingContext;
  v3 = *(uint64_t (**)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                           + 48);
  if (!v3)
    return 0;
  v4 = v3(routingContext, *MEMORY[0x1E0D48D70], *MEMORY[0x1E0C9AE00], &BOOLean);
  v5 = BOOLean;
  if (v4)
  {
    v6 = 0;
    if (!BOOLean)
      return v6;
    goto LABEL_5;
  }
  if (!BOOLean)
    return 0;
  v6 = CFBooleanGetValue(BOOLean) != 0;
  v5 = BOOLean;
  if (BOOLean)
LABEL_5:
    CFRelease(v5);
  return v6;
}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  OpaqueFigRoutingContext *routingContext;
  uint64_t (*v3)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFBooleanRef *);
  int v4;
  CFBooleanRef v5;
  BOOL v6;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  routingContext = self->_routingContext;
  v3 = *(uint64_t (**)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                           + 48);
  if (!v3)
    return 0;
  v4 = v3(routingContext, *MEMORY[0x1E0D48D68], *MEMORY[0x1E0C9AE00], &BOOLean);
  v5 = BOOLean;
  if (v4)
  {
    v6 = 0;
    if (!BOOLean)
      return v6;
    goto LABEL_5;
  }
  if (!BOOLean)
    return 0;
  v6 = CFBooleanGetValue(BOOLean) != 0;
  v5 = BOOLean;
  if (BOOLean)
LABEL_5:
    CFRelease(v5);
  return v6;
}

- (void)setOutputDevices:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  __CFDictionary *Mutable;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicesOptionInitiator")))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48DB0], (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicesOptionInitiator")));
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicesOptionFadePlayback")))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48DA8], (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicesOptionFadePlayback")));
  if ((AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(Mutable, (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicesOptionDidFailToConnectToOutputDeviceUserInfo"))) & 1) == 0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Expected a NSDictionary for didFailToConnectToOutputDeviceUserInfo"), v11, v12, v13, v14, v15, v17), 0);
    objc_exception_throw(v16);
  }
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicesOptionMuteUntilContextModificationIsFinished")))
  {
    CFDictionarySetValue(Mutable, CFSTR("PreemptivePortConnection"), (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicesOptionMuteUntilContextModificationIsFinished")));
  }
  -[AVFigRoutingContextOutputDeviceTranslator setOutputDevices:withOptions:onRoutingContext:completionHandler:](self->_deviceTranslator, "setOutputDevices:withOptions:onRoutingContext:completionHandler:", a3, Mutable, self->_routingContext, a5);
  if (Mutable)
    CFRelease(Mutable);
}

- (void)addOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  __CFDictionary *Mutable;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceCancelIfAuthRequiredKey")), "BOOLValue"))CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48D88], (const void *)*MEMORY[0x1E0C9AE50]);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionAuthorizationToken")))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48D80], (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionAuthorizationToken")));
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionInitiator")))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48DB0], (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionInitiator")));
  if (objc_msgSend(a4, "objectForKeyedSubscript:", 0x1E3046F78))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48D90], (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", 0x1E3046F78));
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionFadePlayback")))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48DA8], (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionFadePlayback")));
  if ((AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(Mutable, (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionDidFailToConnectToOutputDeviceUserInfo"))) & 1) == 0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Expected a NSDictionary for didFailToConnectToOutputDeviceUserInfo"), v11, v12, v13, v14, v15, v17), 0);
    objc_exception_throw(v16);
  }
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionMuteUntilContextModificationIsFinished")))
  {
    CFDictionarySetValue(Mutable, CFSTR("PreemptivePortConnection"), (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionMuteUntilContextModificationIsFinished")));
  }
  -[AVFigRoutingContextOutputDeviceTranslator addOutputDevice:withOptions:toRoutingContext:completionHandler:](self->_deviceTranslator, "addOutputDevice:withOptions:toRoutingContext:completionHandler:", a3, Mutable, self->_routingContext, a5);
  if (Mutable)
    CFRelease(Mutable);
}

- (void)removeOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  __CFDictionary *Mutable;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextRemoveOutputDeviceOptionInitiator")))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48DB0], (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextRemoveOutputDeviceOptionInitiator")));
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextRemoveOutputDeviceOptionContinuePlayingAfterLastDeviceRemoved")))
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48D78], (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextRemoveOutputDeviceOptionContinuePlayingAfterLastDeviceRemoved")));
  }
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextRemoveOutputDeviceOptionFadePlayback")))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48DA8], (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextRemoveOutputDeviceOptionFadePlayback")));
  if ((AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(Mutable, (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextRemoveOutputDeviceOptionDidFailToConnectToOutputDeviceUserInfo"))) & 1) == 0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Expected a NSDictionary for didFailToConnectToOutputDeviceUserInfo"), v11, v12, v13, v14, v15, v17), 0);
    objc_exception_throw(v16);
  }
  -[AVFigRoutingContextOutputDeviceTranslator removeOutputDevice:withOptions:fromRoutingContext:completionHandler:](self->_deviceTranslator, "removeOutputDevice:withOptions:fromRoutingContext:completionHandler:", a3, Mutable, self->_routingContext, a5);
  if (Mutable)
    CFRelease(Mutable);
}

- (void)_predictedSelectedRouteDescriptorChanged
{
  -[AVOutputContext outputContextImplDidChangePredictedOutputDevice:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImplDidChangePredictedOutputDevice:", self);
}

- (void)resetPredictedOutputDevice
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRoutingContext *routingContext;
  void (*v5)(OpaqueFigRoutingContext *);

  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  routingContext = self->_routingContext;
  v5 = *(void (**)(OpaqueFigRoutingContext *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 184);
  if (v5)
    v5(routingContext);
}

- (void)_canUseForRoutingContextDidChangeForRoutingContextWIthID:(__CFString *)a3
{
  if (-[__CFString isEqualToString:](a3, "isEqualToString:", -[AVFigRoutingContextOutputContextImpl ID](self, "ID")))-[AVOutputContext outputContextImplDidChangeProvidesControlForAllVolumeFeatures:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImplDidChangeProvidesControlForAllVolumeFeatures:", self);
}

- (float)volume
{
  OpaqueFigVolumeControllerState *volumeController;
  float v3;
  OpaqueFigRoutingContext *routingContext;
  void (*v5)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float *);
  float v7;

  v7 = 0.0;
  volumeController = self->_volumeController;
  v3 = 0.0;
  if (volumeController)
  {
    routingContext = self->_routingContext;
    v5 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v5)
    {
      v5(volumeController, routingContext, &v7);
      return v7;
    }
  }
  return v3;
}

- (void)_masterVolumeDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if (-[__CFString isEqualToString:](a3, "isEqualToString:", -[AVFigRoutingContextOutputContextImpl ID](self, "ID")))-[AVOutputContext outputContextImplDidChangeVolume:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImplDidChangeVolume:", self);
}

- (BOOL)canSetVolume
{
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *routingContext;
  void (*v4)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *);
  char v6;

  v6 = 0;
  volumeController = self->_volumeController;
  if (!volumeController)
    return 0;
  routingContext = self->_routingContext;
  v4 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 40);
  if (!v4)
    return 0;
  v4(volumeController, routingContext, &v6);
  return v6 != 0;
}

- (void)_canSetMasterVolumeDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if (-[__CFString isEqualToString:](a3, "isEqualToString:", -[AVFigRoutingContextOutputContextImpl ID](self, "ID")))-[AVOutputContext outputContextImplDidChangeCanSetVolume:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImplDidChangeCanSetVolume:", self);
}

- (void)_canMuteDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if (-[__CFString isEqualToString:](a3, "isEqualToString:", -[AVFigRoutingContextOutputContextImpl ID](self, "ID")))-[AVOutputContext outputContextImplDidChangeCanMute:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImplDidChangeCanMute:", self);
}

- (void)_muteDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if (-[__CFString isEqualToString:](a3, "isEqualToString:", -[AVFigRoutingContextOutputContextImpl ID](self, "ID")))-[AVOutputContext outputContextImplDidChangeMute:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImplDidChangeMute:", self);
}

- (void)_masterVolumeControlTypeDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if (-[__CFString isEqualToString:](a3, "isEqualToString:", -[AVFigRoutingContextOutputContextImpl ID](self, "ID")))-[AVOutputContext outputContextImplDidChangeVolumeControlType:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImplDidChangeVolumeControlType:", self);
}

- (int64_t)volumeControlType
{
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *routingContext;
  void (*v4)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, uint64_t *);
  uint64_t v6;

  volumeController = self->_volumeController;
  if (volumeController
    && (v6 = 0,
        routingContext = self->_routingContext,
        (v4 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48)) != 0)
    && (v4(volumeController, routingContext, &v6), (unint64_t)(v6 - 1) <= 2))
  {
    return qword_19357D380[v6 - 1];
  }
  else
  {
    return 0;
  }
}

- (void)setVolume:(float)a3
{
  OpaqueFigVolumeControllerState *volumeController;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRoutingContext *routingContext;
  void (*v8)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float);

  volumeController = self->_volumeController;
  if (volumeController)
  {
    if (dword_1ECDECEF8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      volumeController = self->_volumeController;
    }
    routingContext = self->_routingContext;
    v8 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v8)
      v8(volumeController, routingContext, a3);
  }
}

- (void)increaseVolumeByCount:(int64_t)a3
{
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *routingContext;
  void (*v6)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float);

  volumeController = self->_volumeController;
  if (volumeController)
  {
    routingContext = self->_routingContext;
    v6 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v6)
      v6(volumeController, routingContext, (float)a3);
  }
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *routingContext;
  void (*v6)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float);

  volumeController = self->_volumeController;
  if (volumeController)
  {
    routingContext = self->_routingContext;
    v6 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v6)
      v6(volumeController, routingContext, (float)-a3);
  }
}

- (BOOL)canMute
{
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *routingContext;
  void (*v4)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *);
  char v6;

  v6 = 0;
  volumeController = self->_volumeController;
  if (!volumeController)
    return 0;
  routingContext = self->_routingContext;
  v4 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 184);
  if (!v4)
    return 0;
  v4(volumeController, routingContext, &v6);
  return v6 != 0;
}

- (BOOL)isMuted
{
  OpaqueFigVolumeControllerState *volumeController;
  OpaqueFigRoutingContext *routingContext;
  void (*v4)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *);
  char v6;

  v6 = 0;
  volumeController = self->_volumeController;
  if (!volumeController)
    return 0;
  routingContext = self->_routingContext;
  v4 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 144);
  if (!v4)
    return 0;
  v4(volumeController, routingContext, &v6);
  return v6 != 0;
}

- (void)setMuted:(BOOL)a3
{
  OpaqueFigVolumeControllerState *volumeController;
  _BOOL8 v4;
  OpaqueFigRoutingContext *routingContext;
  void (*v6)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, _BOOL8);

  volumeController = self->_volumeController;
  if (volumeController)
  {
    v4 = a3;
    routingContext = self->_routingContext;
    v6 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, _BOOL8))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 136);
    if (v6)
      v6(volumeController, routingContext, v4);
  }
}

- (void)_sendCommand:(__CFString *)a3 completionHandler:(id)a4
{
  uint64_t v6;
  OpaqueFigRoutingContext *routingContext;
  void (*v8)(OpaqueFigRoutingContext *, __CFString *, _QWORD, void (*)(uint64_t, uint64_t, signed int, void (**)(_QWORD, _QWORD)), uint64_t);

  v6 = objc_msgSend(a4, "copy");
  routingContext = self->_routingContext;
  v8 = *(void (**)(OpaqueFigRoutingContext *, __CFString *, _QWORD, void (*)(uint64_t, uint64_t, signed int, void (**)(_QWORD, _QWORD)), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 136);
  if (v8)
    v8(routingContext, a3, 0, AVOutputContextSendCommandCompletion, v6);
}

- (void)_remoteControlChannelAvailabilityChanged
{
  OpaqueFigRoutingContext *routingContext;
  unsigned int (*v4)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFBooleanRef *);
  CFBooleanRef BOOLean;

  BOOLean = 0;
  routingContext = self->_routingContext;
  v4 = *(unsigned int (**)(OpaqueFigRoutingContext *, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                + 48);
  if (v4 && !v4(routingContext, *MEMORY[0x1E0D48D60], *MEMORY[0x1E0C9AE00], &BOOLean))
  {
    if (!BOOLean)
      return;
    if (CFBooleanGetValue(BOOLean))
      -[AVOutputContext outputContextImplOutgoingCommunicationChannelDidBecomeAvailable:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImplOutgoingCommunicationChannelDidBecomeAvailable:", self);
  }
  if (BOOLean)
    CFRelease(BOOLean);
}

- (AVOutputContextCommunicationChannel)outgoingCommunicationChannel
{
  return (AVOutputContextCommunicationChannel *)-[AVFigRoutingContextCommunicationChannelManager outgoingCommunicationChannel](self->_commChannelManager, "outgoingCommunicationChannel");
}

- (id)openCommunicationChannelWithOptions:(id)a3 error:(id *)a4
{
  return (id)-[AVFigRoutingContextCommunicationChannelManager openCommunicationChannelWithOptions:error:](self->_commChannelManager, "openCommunicationChannelWithOptions:error:", a3, a4);
}

- (void)communicationChannelManager:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5
{
  -[AVOutputContext outputContextImpl:didReceiveData:fromCommunicationChannel:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext", a3), "outputContextImpl:didReceiveData:fromCommunicationChannel:", self, a4, a5);
}

- (void)communicationChannelManager:(id)a3 didCloseCommunicationChannel:(id)a4
{
  -[AVOutputContext outputContextImpl:didCloseCommunicationChannel:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext", a3), "outputContextImpl:didCloseCommunicationChannel:", self, a4);
}

- (void)_serverConnectionDied
{
  const void *v3;
  id v4;

  v3 = (const void *)(*((uint64_t (**)(void))self->_routingContextCreator + 2))();
  v4 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:", v3, self->_routingContextCreator, self->_deviceTranslator, self->_volumeController, self->_commChannelManagerCreator);
  -[AVOutputContext outputContextImpl:didExpireWithReplacement:](-[AVFigRoutingContextOutputContextImpl parentOutputContext](self, "parentOutputContext"), "outputContextImpl:didExpireWithReplacement:", self, v4);
  if (v3)
    CFRelease(v3);

}

- (OpaqueFigRoutingContext)figRoutingContext
{
  return self->_routingContext;
}

- (AVOutputContext)parentOutputContext
{
  return (AVOutputContext *)objc_loadWeak((id *)&self->_parentContext);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentContext);
}

@end
