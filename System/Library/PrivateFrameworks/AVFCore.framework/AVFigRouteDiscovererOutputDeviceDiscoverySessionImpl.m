@implementation AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl

- (void)outputDeviceDiscoverySessionDidChangeDiscoveryMode:(id)a3 forClientIdentifiers:(id)a4
{
  const void **v6;
  const void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRouteDiscoverer *discoverer;
  void (*v10)(OpaqueFigRouteDiscoverer *, _QWORD, const void *);
  __CFDictionary *Mutable;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  OpaqueFigRouteDiscoverer *v16;
  void (*v17)(OpaqueFigRouteDiscoverer *, _QWORD, __CFDictionary *);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  os_log_type_t type;
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  switch(objc_msgSend(a3, "discoveryMode"))
  {
    case 0:
      v6 = (const void **)MEMORY[0x1E0D48B70];
      goto LABEL_7;
    case 1:
      v6 = (const void **)MEMORY[0x1E0D48B78];
      goto LABEL_7;
    case 2:
      v6 = (const void **)MEMORY[0x1E0D48B68];
      goto LABEL_7;
    case 3:
      v6 = (const void **)MEMORY[0x1E0D48B60];
LABEL_7:
      v7 = *v6;
      break;
    default:
      v7 = 0;
      break;
  }
  if (dword_1ECDECE78)
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  discoverer = self->_discoverer;
  v10 = *(void (**)(OpaqueFigRouteDiscoverer *, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 56);
  if (v10)
    v10(discoverer, *MEMORY[0x1E0D48BB8], v7);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(a4);
        CFDictionarySetValue(Mutable, *(const void **)(*((_QWORD *)&v18 + 1) + 8 * i), v7);
      }
      v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v13);
  }
  v16 = self->_discoverer;
  v17 = *(void (**)(OpaqueFigRouteDiscoverer *, _QWORD, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 56);
  if (v17)
    v17(v16, *MEMORY[0x1E0D48BC0], Mutable);
  if (Mutable)
    CFRelease(Mutable);
}

- (void)_availableRoutesChanged
{
  -[AVOutputDeviceDiscoverySession outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:](-[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl parentOutputDeviceDiscoverySession](self, "parentOutputDeviceDiscoverySession"), "outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:", self);
}

- (AVOutputDeviceDiscoverySession)parentOutputDeviceDiscoverySession
{
  return (AVOutputDeviceDiscoverySession *)objc_loadWeak((id *)&self->_parentSession);
}

- (BOOL)devicePresenceDetected
{
  OpaqueFigRouteDiscoverer *discoverer;
  uint64_t (*v3)(OpaqueFigRouteDiscoverer *, _QWORD, _QWORD, CFBooleanRef *);
  int v4;
  CFBooleanRef v5;
  BOOL v6;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  discoverer = self->_discoverer;
  v3 = *(uint64_t (**)(OpaqueFigRouteDiscoverer *, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                            + 48);
  if (!v3)
    return 0;
  v4 = v3(discoverer, *MEMORY[0x1E0D48BC8], *MEMORY[0x1E0C9AE00], &BOOLean);
  v5 = BOOLean;
  if (v4)
  {
    v6 = 0;
    if (!BOOLean)
      return v6;
    goto LABEL_4;
  }
  v6 = CFBooleanGetValue(BOOLean) != 0;
  v5 = BOOLean;
  if (BOOLean)
LABEL_4:
    CFRelease(v5);
  return v6;
}

- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)availableOutputDevicesObject
{
  OpaqueFigRouteDiscoverer *discoverer;
  const __CFAllocator *v4;
  unsigned int (*v5)(OpaqueFigRouteDiscoverer *, _QWORD, const __CFAllocator *, CFTypeRef *);
  BOOL v6;
  AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *v7;
  uint64_t v8;
  OpaqueFigRouteDiscoverer *v9;
  const __CFAllocator *v10;
  unsigned int (*v11)(OpaqueFigRouteDiscoverer *, _QWORD, const __CFAllocator *, CFTypeRef *);
  BOOL v12;
  AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *v13;
  void *v14;
  AVOutputDeviceDiscoverySessionAvailableOutputDevices *v15;
  CFTypeRef cf;

  if (+[AVOutputDevice prefersRouteDescriptors](AVOutputDevice, "prefersRouteDescriptors"))
  {
    cf = 0;
    discoverer = self->_discoverer;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = *(unsigned int (**)(OpaqueFigRouteDiscoverer *, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (!v5 || (!v5(discoverer, *MEMORY[0x1E0D48BA0], v4, &cf) ? (v6 = cf == 0) : (v6 = 1), v6))
      cf = CFArrayCreate(v4, 0, 0, MEMORY[0x1E0C9B378]);
    v7 = [AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl alloc];
    v8 = -[AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl initWithRouteDescriptors:routeDiscoverer:](v7, "initWithRouteDescriptors:routeDiscoverer:", cf, self->_discoverer);
  }
  else
  {
    cf = 0;
    v9 = self->_discoverer;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v11 = *(unsigned int (**)(OpaqueFigRouteDiscoverer *, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (!v11 || (!v11(v9, *MEMORY[0x1E0D48BA8], v10, &cf) ? (v12 = cf == 0) : (v12 = 1), v12))
      cf = CFArrayCreate(v10, 0, 0, MEMORY[0x1E0C9B378]);
    v13 = [AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl alloc];
    v8 = -[AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl initWithAvailableFigEndpoints:](v13, "initWithAvailableFigEndpoints:", cf);
  }
  v14 = (void *)v8;
  if (cf)
    CFRelease(cf);
  v15 = -[AVOutputDeviceDiscoverySessionAvailableOutputDevices initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:]([AVOutputDeviceDiscoverySessionAvailableOutputDevices alloc], "initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:", v14);

  return v15;
}

- (void)setParentOutputDeviceDiscoverySession:(id)a3
{
  objc_storeWeak((id *)&self->_parentSession, a3);
}

- (AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl)initWithFigRouteDiscovererCreator:(id)a3
{
  id v5;
  AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  BOOL v11;
  AVWeakReference *v12;
  AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *v13;
  objc_super v15;

  v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v15.receiver = self;
  v15.super_class = (Class)AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl;
  v6 = -[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl init](&v15, sel_init);
  v7 = objc_msgSend(a3, "copy");
  v6->_routeDiscovererCreator = (id)v7;
  if (!v7)
    goto LABEL_11;
  v8 = v7;
  v9 = 0;
  do
  {
    v10 = (*(uint64_t (**)(uint64_t))(v8 + 16))(v8);
    if (v10)
      v11 = 1;
    else
      v11 = v9 >= 4;
    ++v9;
  }
  while (!v11);
  v6->_discoverer = (OpaqueFigRouteDiscoverer *)v10;
  if (v10)
  {
    v12 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v6);
    v6->_weakObserver = v12;
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v12, AVFigRouteDiscovererAvailableRoutesChanged, *MEMORY[0x1E0D48B80], v6->_discoverer, 0);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6->_weakObserver, AVFigRouteDiscovererRoutePresentChanged, *MEMORY[0x1E0D48B88], v6->_discoverer, 0);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6->_weakObserver, AVFigRouteDiscovererRouteServerDied, *MEMORY[0x1E0D48B90], v6->_discoverer, 0);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6->_weakObserver, AVFigRouteDiscovererEndpointDescriptorChanged, CFSTR("Discoverer_EndpointDescriptorChanged"), v6->_discoverer, 0);
    v13 = v6;
  }
  else
  {
LABEL_11:
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  id v3;
  void *v4;
  OpaqueFigRouteDiscoverer *discoverer;
  void (*v6)(OpaqueFigRouteDiscoverer *, _QWORD, _QWORD);
  OpaqueFigRouteDiscoverer *v7;
  objc_super v8;

  v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  if (self->_discoverer)
  {
    v4 = v3;
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDiscovererAvailableRoutesChanged, *MEMORY[0x1E0D48B80]);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDiscovererRoutePresentChanged, *MEMORY[0x1E0D48B88], self->_discoverer);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDiscovererRouteServerDied, *MEMORY[0x1E0D48B90], self->_discoverer);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDiscovererEndpointDescriptorChanged, CFSTR("Discoverer_EndpointDescriptorChanged"), self->_discoverer);
    discoverer = self->_discoverer;
    v6 = *(void (**)(OpaqueFigRouteDiscoverer *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 56);
    if (v6)
      v6(discoverer, *MEMORY[0x1E0D48BB8], *MEMORY[0x1E0D48B70]);
    v7 = self->_discoverer;
    if (v7)
      CFRelease(v7);
  }

  v8.receiver = self;
  v8.super_class = (Class)AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl;
  -[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentSession);
}

- (AVAudioSession)targetAudioSession
{
  OpaqueFigRouteDiscoverer *discoverer;
  unsigned int (*v3)(OpaqueFigRouteDiscoverer *, _QWORD, _QWORD, CFNumberRef *);
  AVAudioSession *v4;
  CFNumberRef number;
  int valuePtr;

  valuePtr = 0;
  number = 0;
  discoverer = self->_discoverer;
  v3 = *(unsigned int (**)(OpaqueFigRouteDiscoverer *, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                + 48);
  if (!v3 || v3(discoverer, *MEMORY[0x1E0D48B98], *MEMORY[0x1E0C9AE00], &number))
    goto LABEL_6;
  if (!number)
    return 0;
  CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr)
    v4 = (AVAudioSession *)objc_msgSend(MEMORY[0x1E0C89AE8], "retrieveSessionWithID:");
  else
LABEL_6:
    v4 = 0;
  if (number)
    CFRelease(number);
  return v4;
}

- (AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl)init
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
  v6 = NSStringFromSelector(sel_initWithFigRouteDiscovererCreator_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (void)setTargetAudioSession:(id)a3
{
  const void *SInt32;
  OpaqueFigRouteDiscoverer *discoverer;
  void (*v6)(OpaqueFigRouteDiscoverer *, _QWORD, const void *);

  if (a3)
    objc_msgSend(a3, "opaqueSessionID");
  SInt32 = (const void *)FigCFNumberCreateSInt32();
  discoverer = self->_discoverer;
  v6 = *(void (**)(OpaqueFigRouteDiscoverer *, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                               + 56);
  if (v6)
    v6(discoverer, *MEMORY[0x1E0D48B98], SInt32);
  if (SInt32)
    CFRelease(SInt32);
}

- (void)_availableGroupsChanged
{
  -[AVOutputDeviceDiscoverySession outputDeviceDiscoverySessionImplDidChangeAvailableOutputDeviceGroups:](-[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl parentOutputDeviceDiscoverySession](self, "parentOutputDeviceDiscoverySession"), "outputDeviceDiscoverySessionImplDidChangeAvailableOutputDeviceGroups:", self);
}

- (void)_routePresentChanged
{
  usleep(0x186A0u);
  -[AVOutputDeviceDiscoverySession outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:](-[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl parentOutputDeviceDiscoverySession](self, "parentOutputDeviceDiscoverySession"), "outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:", self);
}

- (void)_endpointDescriptorChanged
{
  -[AVOutputDeviceDiscoverySession outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:](-[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl parentOutputDeviceDiscoverySession](self, "parentOutputDeviceDiscoverySession"), "outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:", self);
}

- (void)_serverDied
{
  AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = -[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl initWithFigRouteDiscovererCreator:]([AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl alloc], "initWithFigRouteDiscovererCreator:", self->_routeDiscovererCreator);
  if (v3)
  {
    -[AVOutputDeviceDiscoverySession outputDeviceDiscoverySessionImpl:didExpireWithReplacement:](-[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl parentOutputDeviceDiscoverySession](self, "parentOutputDeviceDiscoverySession"), "outputDeviceDiscoverySessionImpl:didExpireWithReplacement:", self, v3);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

}

- (void)outputDeviceDiscoverySessionBluetoothOnlyDiscoveryDidChange:(id)a3
{
  int v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRouteDiscoverer *discoverer;
  void (*v7)(OpaqueFigRouteDiscoverer *, const __CFString *, uint64_t);
  uint64_t v8;

  v4 = objc_msgSend(a3, "onlyDiscoversBluetoothDevices");
  if (dword_1ECDECE78)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  discoverer = self->_discoverer;
  v7 = *(void (**)(OpaqueFigRouteDiscoverer *, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 56);
  if (v7)
  {
    if (v4)
      v8 = *MEMORY[0x1E0C9AE50];
    else
      v8 = *MEMORY[0x1E0C9AE40];
    v7(discoverer, CFSTR("BluetoothRoutesOnly"), v8);
  }
}

- (OpaqueFigRouteDiscoverer)routeDiscoverer
{
  return self->_discoverer;
}

@end
