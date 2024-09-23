@implementation AVSystemRemotePoolOutputDeviceCommunicationChannelManager

- (void)setParentOutputDevice:(id)a3
{
  objc_storeWeak((id *)&self->_parentOutputDevice, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentOutputDevice);
}

- (AVSystemRemotePoolOutputDeviceCommunicationChannelManager)initWithDeviceID:(id)a3
{
  AVSystemRemotePoolOutputDeviceCommunicationChannelManager *v4;
  uint64_t v5;
  AVSystemRemotePoolOutputDeviceCommunicationChannelManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVSystemRemotePoolOutputDeviceCommunicationChannelManager;
  v4 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager init](&v8, sel_init);
  if (v4 && (v5 = objc_msgSend(a3, "copy"), (v4->_deviceID = (NSString *)v5) != 0))
  {
    v4->_outputContext = 0;
    v4->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.device-comm-channel-manager");
    v4->_communicationChannelsForUUIDs = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  AVOutputContext *outputContext;
  NSObject *ivarAccessQueue;
  __CFDictionary *communicationChannelsForUUIDs;
  objc_super v6;

  outputContext = self->_outputContext;
  if (outputContext && -[AVOutputContext figRoutingContext](outputContext, "figRoutingContext"))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    -[AVOutputContext figRoutingContext](self->_outputContext, "figRoutingContext");
    FigNotificationCenterRemoveWeakListener();
    -[AVOutputContext figRoutingContext](self->_outputContext, "figRoutingContext");
    FigNotificationCenterRemoveWeakListener();
  }

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
  communicationChannelsForUUIDs = self->_communicationChannelsForUUIDs;
  if (communicationChannelsForUUIDs)
    CFRelease(communicationChannelsForUUIDs);
  v6.receiver = self;
  v6.super_class = (Class)AVSystemRemotePoolOutputDeviceCommunicationChannelManager;
  -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager dealloc](&v6, sel_dealloc);
}

+ (id)sharedSystemRemotePoolImpl
{
  uint64_t v2;
  AVFigRoutingContextOutputContextImpl *v3;
  _QWORD v5[5];

  v2 = AVDefaultRoutingContextFactory();
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_sharedSystemRemotePoolImpl__block_invoke;
  v5[3] = &unk_1E3034348;
  v5[4] = v2;
  return -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:](v3, "initWithFigRoutingContextCreator:", v5);
}

uint64_t __87__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_sharedSystemRemotePoolImpl__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "copySystemRemotePoolContextWithAllocator:options:context:", *MEMORY[0x1E0C9AE00], 0, &v2);
  return v2;
}

+ (id)sharedSystemRemotePool
{
  return -[AVOutputContext initWithOutputContextImpl:]([AVOutputContext alloc], "initWithOutputContextImpl:", +[AVSystemRemotePoolOutputDeviceCommunicationChannelManager sharedSystemRemotePoolImpl](AVSystemRemotePoolOutputDeviceCommunicationChannelManager, "sharedSystemRemotePoolImpl"));
}

- (id)_initializeIfNeededAndGetSystemRemotePool
{
  NSObject *ivarAccessQueue;
  void *v4;
  void *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  CMNotificationCenterGetDefaultLocalCenter();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__25;
  v12 = __Block_byref_object_dispose__25;
  v13 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__initializeIfNeededAndGetSystemRemotePool__block_invoke;
  block[3] = &unk_1E3031A40;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v4 = (void *)v9[5];
  if (v4)
  {
    if (objc_msgSend(v4, "figRoutingContext"))
    {
      if (*((_BYTE *)v15 + 24))
      {
        -[AVOutputContext figRoutingContext](self->_outputContext, "figRoutingContext");
        if (!FigNotificationCenterAddWeakListener())
        {
          -[AVOutputContext figRoutingContext](self->_outputContext, "figRoutingContext");
          FigNotificationCenterAddWeakListener();
        }
      }
    }
  }
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

_QWORD *__102__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__initializeIfNeededAndGetSystemRemotePool__block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result[4] + 24);
  if (!v2)
  {
    result = +[AVSystemRemotePoolOutputDeviceCommunicationChannelManager sharedSystemRemotePool](AVSystemRemotePoolOutputDeviceCommunicationChannelManager, "sharedSystemRemotePool");
    *(_QWORD *)(v1[4] + 24) = result;
    *(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(v1[4] + 24);
  }
  *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40) = v2;
  return result;
}

- (void)openCommunicationChannelWithOptions:(id)a3 completionHandler:(id)a4
{
  AVOutputDevice *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[9];
  os_log_type_t type;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager parentOutputDevice](self, "parentOutputDevice");
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionCancelIfAuthRequired"));
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionCorrelationID"));
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionInitiator"));
  if (dword_1ECDECED8)
  {
    v21 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v7
    && (v12 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager _initializeIfNeededAndGetSystemRemotePool](self, "_initializeIfNeededAndGetSystemRemotePool")) != 0)
  {
    v13 = v12;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = v14;
    if (v9)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, 0x1E3046F78);
    if (v10)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("AVOutputContextAddOutputDeviceOptionInitiator"));
    if (objc_msgSend(v8, "BOOLValue", v17, v18))
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("AVOutputContextAddOutputDeviceCancelIfAuthRequiredKey"));
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __115__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_openCommunicationChannelWithOptions_completionHandler___block_invoke;
    v19[3] = &unk_1E3034370;
    v19[4] = a3;
    v19[5] = v9;
    v19[6] = v13;
    v19[7] = self;
    v19[8] = a4;
    objc_msgSend(v13, "addOutputDevice:options:completionHandler:", v7, v15, v19);
  }
  else
  {
    v16 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
    (*((void (**)(id, _QWORD, uint64_t, _QWORD))a4 + 2))(a4, 0, v16, 0);
  }
}

void __115__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_openCommunicationChannelWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  __CFDictionary *Mutable;
  const void **v5;
  void *v6;
  void *v7;
  uint64_t v8;
  signed int v9;
  AVOutputDeviceCommunicationChannel *v10;
  const void *v11;
  const void *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, __CFDictionary *, CFTypeRef *);
  signed int v17;
  AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *v18;
  AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[7];
  os_log_type_t type;
  unsigned int v29;
  CFTypeRef cf;
  int v31;
  const char *v32;
  __int16 v33;
  CFTypeRef v34;
  __int16 v35;
  signed int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  cf = 0;
  if (objc_msgSend(a2, "status") != 2)
  {
    objc_msgSend(a2, "cancellationReason");
    v9 = 0;
    Mutable = 0;
    v10 = 0;
    goto LABEL_20;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  v5 = (const void **)MEMORY[0x1E0CA38D0];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AVOutputDeviceCommunicationChannelOptionControlType"));
  v7 = v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelControlTypeDirect")) & 1) != 0)
    {
      v8 = 2;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("AVOutputDeviceCommunicationChannelControlTypeRelayed")))goto LABEL_9;
      v8 = 1;
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA38E8], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8));
  }
LABEL_9:
  v11 = *v5;
  v12 = *(const void **)(a1 + 40);
  if (v12)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA38D8], v12);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA38E0], v11);
  FigCFDictionarySetInt32();
  if (dword_1ECDECED8)
  {
    v29 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v14 = objc_msgSend(*(id *)(a1 + 48), "figRoutingContext", v25, v26);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16);
  v16 = *(uint64_t (**)(uint64_t, uint64_t, __CFDictionary *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 152);
  if (!v16)
  {
    v9 = -12782;
LABEL_18:
    AVLocalizedErrorWithUnderlyingOSStatus(v9, 0);
    goto LABEL_19;
  }
  v17 = v16(v14, v15, Mutable, &cf);
  if (v17)
  {
    v9 = v17;
    goto LABEL_18;
  }
  if (cf)
  {
    v18 = [AVSystemRemotePoolOutputDeviceCommunicationChannelImpl alloc];
    v19 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelImpl initWithDeviceID:channelUUID:outputContext:](v18, "initWithDeviceID:channelUUID:outputContext:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16), cf, *(_QWORD *)(a1 + 48));
    v10 = -[AVOutputDeviceCommunicationChannel initWithOutputDeviceCommunicationChannelImpl:]([AVOutputDeviceCommunicationChannel alloc], "initWithOutputDeviceCommunicationChannelImpl:", v19);

    v20 = *(_QWORD *)(a1 + 56);
    v21 = *(NSObject **)(v20 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __115__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_openCommunicationChannelWithOptions_completionHandler___block_invoke_11;
    block[3] = &unk_1E302FEE0;
    block[5] = v10;
    block[6] = cf;
    block[4] = v20;
    av_readwrite_dispatch_queue_write(v21, block);
    v9 = 0;
    goto LABEL_20;
  }
  AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
  v9 = 0;
LABEL_19:
  v10 = 0;
LABEL_20:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (cf)
    CFRelease(cf);
  if (Mutable)
    CFRelease(Mutable);

  if (dword_1ECDECED8)
  {
    v29 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v23 = v29;
    if (os_log_type_enabled(v22, type))
      v24 = v23;
    else
      v24 = v23 & 0xFFFFFFFE;
    if (v24)
    {
      v31 = 136315650;
      v32 = "-[AVSystemRemotePoolOutputDeviceCommunicationChannelManager openCommunicationChannelWithOptions:completionHa"
            "ndler:]_block_invoke_2";
      v33 = 2114;
      v34 = cf;
      v35 = 1024;
      v36 = v9;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __115__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_openCommunicationChannelWithOptions_completionHandler___block_invoke_11(uint64_t a1)
{
  __CFDictionary *MutableCopy;
  uint64_t v3;
  const void *v4;

  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40));
  CFDictionarySetValue(MutableCopy, *(const void **)(a1 + 48), *(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(const void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = MutableCopy;
  if (MutableCopy)
    CFRetain(MutableCopy);
  if (v4)
    CFRelease(v4);
  if (MutableCopy)
    CFRelease(MutableCopy);
}

- (void)_didReceiveData:(__CFData *)a3 fromDeviceWithID:(__CFString *)a4 fromChannelWithUUID:(__CFString *)a5
{
  NSObject *ivarAccessQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVOutputDevice *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__25;
  v18 = __Block_byref_object_dispose__25;
  v19 = 0;
  if (a5 && -[NSString isEqualToString:](self->_deviceID, "isEqualToString:", a4))
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__didReceiveData_fromDeviceWithID_fromChannelWithUUID___block_invoke;
    block[3] = &unk_1E3031988;
    block[4] = self;
    block[5] = &v14;
    block[6] = a5;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v10 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager parentOutputDevice](self, "parentOutputDevice", v11, v12);
    -[AVOutputDevice communicationChannelManager:didReceiveData:fromCommunicationChannel:](v10, "communicationChannelManager:didReceiveData:fromCommunicationChannel:", self, a3, v15[5]);
  }

  _Block_object_dispose(&v14, 8);
}

void __114__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__didReceiveData_fromDeviceWithID_fromChannelWithUUID___block_invoke(uint64_t a1)
{
  __CFDictionary *MutableCopy;
  uint64_t v3;
  const void *v4;
  AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40), *(const void **)(a1 + 48));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelImpl initWithDeviceID:channelUUID:outputContext:]([AVSystemRemotePoolOutputDeviceCommunicationChannelImpl alloc], "initWithDeviceID:channelUUID:outputContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[AVOutputDeviceCommunicationChannel initWithOutputDeviceCommunicationChannelImpl:]([AVOutputDeviceCommunicationChannel alloc], "initWithOutputDeviceCommunicationChannelImpl:", v5);
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40));
    CFDictionarySetValue(MutableCopy, *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(const void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = MutableCopy;
    if (MutableCopy)
      CFRetain(MutableCopy);
    if (v4)
      CFRelease(v4);
    if (MutableCopy)
      CFRelease(MutableCopy);

  }
}

- (void)_didCloseCommChannelWithUUID:(__CFString *)a3 forDeviceWithID:(__CFString *)a4
{
  NSObject *ivarAccessQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVOutputDevice *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__25;
  v16 = __Block_byref_object_dispose__25;
  v17 = 0;
  if (a3 && -[NSString isEqualToString:](self->_deviceID, "isEqualToString:", a4))
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__didCloseCommChannelWithUUID_forDeviceWithID___block_invoke;
    block[3] = &unk_1E3031988;
    block[4] = self;
    block[5] = &v12;
    block[6] = a3;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v8 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelManager parentOutputDevice](self, "parentOutputDevice", v9, v10);
    -[AVOutputDevice communicationChannelManager:didCloseCommunicationChannel:](v8, "communicationChannelManager:didCloseCommunicationChannel:", self, v13[5]);
  }

  _Block_object_dispose(&v12, 8);
}

void __106__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__didCloseCommChannelWithUUID_forDeviceWithID___block_invoke(uint64_t a1)
{
  __CFDictionary *MutableCopy;
  uint64_t v3;
  const void *v4;
  AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40), *(const void **)(a1 + 48));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40));
    CFDictionaryRemoveValue(MutableCopy, *(const void **)(a1 + 48));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(const void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = MutableCopy;
    if (MutableCopy)
      CFRetain(MutableCopy);
    if (v4)
      CFRelease(v4);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
  else
  {
    v5 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelImpl initWithDeviceID:channelUUID:outputContext:]([AVSystemRemotePoolOutputDeviceCommunicationChannelImpl alloc], "initWithDeviceID:channelUUID:outputContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[AVOutputDeviceCommunicationChannel initWithOutputDeviceCommunicationChannelImpl:]([AVOutputDeviceCommunicationChannel alloc], "initWithOutputDeviceCommunicationChannelImpl:", v5);

  }
}

- (AVOutputDevice)parentOutputDevice
{
  return (AVOutputDevice *)objc_loadWeak((id *)&self->_parentOutputDevice);
}

@end
