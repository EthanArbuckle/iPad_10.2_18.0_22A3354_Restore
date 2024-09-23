@implementation AVOutputDeviceDiscoverySession

- (AVAudioSession)targetAudioSession
{
  return (AVAudioSession *)objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "targetAudioSession");
}

- (void)setDiscoveryMode:(int64_t)a3 forClientIdentifiers:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *ivarAccessQueue;
  _QWORD block[6];
  os_log_type_t type;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECE78)
  {
    v11 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AVOutputDeviceDiscoverySession_setDiscoveryMode_forClientIdentifiers___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "outputDeviceDiscoverySessionDidChangeDiscoveryMode:forClientIdentifiers:", self, a4);
}

- (void)outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification"), self, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v3);
}

- (int64_t)discoveryMode
{
  NSObject *ivarAccessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVOutputDeviceDiscoverySession_discoveryMode__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  -[AVOutputDeviceDiscoverySession setDiscoveryMode:forClientIdentifiers:](self, "setDiscoveryMode:forClientIdentifiers:", a3, MEMORY[0x1E0C9AA60]);
}

- (BOOL)devicePresenceDetected
{
  return objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "devicePresenceDetected");
}

uint64_t __56__AVOutputDeviceDiscoverySession_availableOutputDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "localizedStandardCompare:", objc_msgSend(a3, "name"));
}

id __38__AVOutputDeviceDiscoverySession_impl__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __72__AVOutputDeviceDiscoverySession_setDiscoveryMode_forClientIdentifiers___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(result + 40);
  return result;
}

- (NSArray)availableOutputDevices
{
  NSArray *v3;
  AVOutputDeviceDiscoverySessionAvailableOutputDevices *v4;
  AVOutputDeviceDiscoverySessionAvailableOutputDevices *v5;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[AVOutputDeviceDiscoverySession availableOutputDevicesObject](self, "availableOutputDevicesObject");
  if (v4)
  {
    v5 = v4;
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", -[AVOutputDeviceDiscoverySessionAvailableOutputDevices recentlyUsedDevices](v4, "recentlyUsedDevices"));
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", -[AVOutputDeviceDiscoverySessionAvailableOutputDevices otherDevices](v5, "otherDevices"));
    -[NSArray sortUsingComparator:](v3, "sortUsingComparator:", &__block_literal_global_7);
  }
  return v3;
}

- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)availableOutputDevicesObject
{
  return (AVOutputDeviceDiscoverySessionAvailableOutputDevices *)objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "availableOutputDevicesObject");
}

- (id)impl
{
  NSObject *ivarAccessQueue;
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v5;
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__8;
  v12 = __Block_byref_object_dispose__8;
  v13 = 0;
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVOutputDeviceDiscoverySession_impl__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v3 = (void *)v9[5];
  if (!v3)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v3 = (void *)v9[5];
  }
  v5 = v3;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __47__AVOutputDeviceDiscoverySession_discoveryMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (AVOutputDeviceDiscoverySession)initWithDeviceFeatures:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "outputDeviceDiscoverySessionFactory");
  v6 = objc_opt_class();

  return (AVOutputDeviceDiscoverySession *)(id)objc_msgSend(v5, "outputDeviceDiscoverySessionOfClass:withDeviceFeatures:", v6, a3);
}

- (void)dealloc
{
  AVOutputDeviceDiscoverySessionInternal *outputDeviceDiscoverySession;
  NSObject *ivarAccessQueue;
  objc_super v5;

  outputDeviceDiscoverySession = self->_outputDeviceDiscoverySession;
  if (outputDeviceDiscoverySession)
  {

    outputDeviceDiscoverySession = self->_outputDeviceDiscoverySession;
    ivarAccessQueue = outputDeviceDiscoverySession->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      outputDeviceDiscoverySession = self->_outputDeviceDiscoverySession;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVOutputDeviceDiscoverySession;
  -[AVOutputDeviceDiscoverySession dealloc](&v5, sel_dealloc);
}

- (AVOutputDeviceDiscoverySession)initWithOutputDeviceDiscoverySessionImpl:(id)a3
{
  AVOutputDeviceDiscoverySession *v4;
  AVOutputDeviceDiscoverySessionInternal *v5;
  AVOutputDeviceDiscoverySessionImpl *impl;
  AVOutputDeviceDiscoverySession *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVOutputDeviceDiscoverySession;
  v4 = -[AVOutputDeviceDiscoverySession init](&v9, sel_init);
  if (v4
    && (v5 = objc_alloc_init(AVOutputDeviceDiscoverySessionInternal),
        (v4->_outputDeviceDiscoverySession = v5) != 0)
    && (v4->_outputDeviceDiscoverySession->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avodds.ivars"), v4->_outputDeviceDiscoverySession->discoveryMode = 0, v4->_outputDeviceDiscoverySession->impl = (AVOutputDeviceDiscoverySessionImpl *)a3, (impl = v4->_outputDeviceDiscoverySession->impl) != 0))
  {
    -[AVOutputDeviceDiscoverySessionImpl setParentOutputDeviceDiscoverySession:](impl, "setParentOutputDeviceDiscoverySession:", v4);
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)outputDeviceDiscoverySessionFactory
{
  return objc_alloc_init(AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory);
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

- (AVOutputDeviceDiscoverySession)init
{
  return -[AVOutputDeviceDiscoverySession initWithDeviceFeatures:](self, "initWithDeviceFeatures:", 7);
}

- (void)setTargetAudioSession:(id)a3
{
  objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "setTargetAudioSession:", a3);
}

- (BOOL)onlyDiscoversBluetoothDevices
{
  NSObject *ivarAccessQueue;
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
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVOutputDeviceDiscoverySession_onlyDiscoversBluetoothDevices__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVOutputDeviceDiscoverySession_onlyDiscoversBluetoothDevices__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 32);
  return result;
}

- (void)setOnlyDiscoversBluetoothDevices:(BOOL)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *ivarAccessQueue;
  _QWORD block[5];
  BOOL v8;
  os_log_type_t type;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECE78)
  {
    v10 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVOutputDeviceDiscoverySession_setOnlyDiscoversBluetoothDevices___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v8 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "outputDeviceDiscoverySessionBluetoothOnlyDiscoveryDidChange:", self);
}

uint64_t __67__AVOutputDeviceDiscoverySession_setOnlyDiscoversBluetoothDevices___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = *(_BYTE *)(result + 40);
  return result;
}

- (void)outputDeviceDiscoverySessionImpl:(id)a3 didExpireWithReplacement:(id)a4
{
  NSObject *ivarAccessQueue;
  id v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__AVOutputDeviceDiscoverySession_outputDeviceDiscoverySessionImpl_didExpireWithReplacement___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a4;
  block[6] = &v9;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend((id)v10[5], "setParentOutputDeviceDiscoverySession:", 0);
  objc_msgSend(a4, "setParentOutputDeviceDiscoverySession:", self);
  -[AVOutputDeviceDiscoverySession outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:](self, "outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:", -[AVOutputDeviceDiscoverySession impl](self, "impl"));
  v7 = -[AVOutputDeviceDiscoverySession impl](self, "impl");
  objc_msgSend(v7, "outputDeviceDiscoverySessionDidChangeDiscoveryMode:forClientIdentifiers:", self, MEMORY[0x1E0C9AA60]);
  objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "outputDeviceDiscoverySessionBluetoothOnlyDiscoveryDidChange:", self);

  _Block_object_dispose(&v9, 8);
}

id __92__AVOutputDeviceDiscoverySession_outputDeviceDiscoverySessionImpl_didExpireWithReplacement___block_invoke(uint64_t a1)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 16));

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16) = result;
  return result;
}

- (void)outputDeviceDiscoverySessionImplDidChangeAvailableOutputDeviceGroups:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVOutputDeviceDiscoverySessionAvailableOutputDeviceGroupsDidChangeNotification"), self, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v3);
}

- (OpaqueFigRouteDiscoverer)routeDiscoverer
{
  id v2;

  v2 = -[AVOutputDeviceDiscoverySession impl](self, "impl");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (OpaqueFigRouteDiscoverer *)objc_msgSend(v2, "routeDiscoverer");
  else
    return 0;
}

@end
