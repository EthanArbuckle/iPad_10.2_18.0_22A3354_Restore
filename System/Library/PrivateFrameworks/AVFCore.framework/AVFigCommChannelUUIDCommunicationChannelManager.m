@implementation AVFigCommChannelUUIDCommunicationChannelManager

- (void)setParentOutputContextImpl:(id)a3
{
  objc_storeWeak((id *)&self->_parentOutputContextImpl, a3);
}

- (AVFigCommChannelUUIDCommunicationChannelManager)initWithRoutingContext:(OpaqueFigRoutingContext *)a3
{
  id v5;
  AVFigCommChannelUUIDCommunicationChannelManager *v6;
  AVFigCommChannelUUIDCommunicationChannelManager *v7;
  OpaqueFigRoutingContext *v8;
  AVWeakReference *v9;
  AVFigCommChannelUUIDCommunicationChannelManager *v10;
  objc_super v12;

  v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v12.receiver = self;
  v12.super_class = (Class)AVFigCommChannelUUIDCommunicationChannelManager;
  v6 = -[AVFigCommChannelUUIDCommunicationChannelManager init](&v12, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  if (!a3)
  {
    v10 = 0;
    v6->_routingContext = 0;
    goto LABEL_6;
  }
  v8 = (OpaqueFigRoutingContext *)CFRetain(a3);
  v7->_routingContext = v8;
  if (!v8)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_6;
  }
  v7->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.communication-channel-manager");
  v7->_communicationChannelsForUUIDs = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v9 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v7);
  v7->_weakObserver = v9;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v9, AVCommChannelDidReceiveData, *MEMORY[0x1E0D48CF8], v7->_routingContext, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v7->_weakObserver, AVCommChannelDidClose, *MEMORY[0x1E0D48CE0], v7->_routingContext, 0);
  v10 = v7;
LABEL_6:

  return v10;
}

- (AVFigCommChannelUUIDCommunicationChannelManager)init
{
  return -[AVFigCommChannelUUIDCommunicationChannelManager initWithRoutingContext:](self, "initWithRoutingContext:", 0);
}

- (void)dealloc
{
  AVWeakReference *weakObserver;
  id v4;
  NSObject *ivarAccessQueue;
  OpaqueFigRoutingContext *routingContext;
  __CFString *outgoingCommChannelUUID;
  __CFDictionary *communicationChannelsForUUIDs;
  objc_super v9;

  weakObserver = self->_weakObserver;
  if (weakObserver)
  {
    v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVCommChannelDidReceiveData, *MEMORY[0x1E0D48CF8], self->_routingContext);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVCommChannelDidClose, *MEMORY[0x1E0D48CE0], self->_routingContext);
    weakObserver = self->_weakObserver;
  }

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
  routingContext = self->_routingContext;
  if (routingContext)
    CFRelease(routingContext);
  outgoingCommChannelUUID = self->_outgoingCommChannelUUID;
  if (outgoingCommChannelUUID)
    CFRelease(outgoingCommChannelUUID);
  communicationChannelsForUUIDs = self->_communicationChannelsForUUIDs;
  if (communicationChannelsForUUIDs)
    CFRelease(communicationChannelsForUUIDs);
  v9.receiver = self;
  v9.super_class = (Class)AVFigCommChannelUUIDCommunicationChannelManager;
  -[AVFigCommChannelUUIDCommunicationChannelManager dealloc](&v9, sel_dealloc);
}

- (AVOutputContextCommunicationChannel)outgoingCommunicationChannel
{
  uint64_t v3;
  OpaqueFigRoutingContext *routingContext;
  uint64_t (*v5)(OpaqueFigRoutingContext *, uint64_t, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  BOOL v8;
  AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *v9;
  AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *v10;
  AVOutputContextCommunicationChannel *v11;
  NSObject *ivarAccessQueue;
  AVOutputContextCommunicationChannel *v13;
  _QWORD v15[8];
  CFTypeRef cf;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__44;
  v21 = __Block_byref_object_dispose__44;
  v22 = 0;
  cf = 0;
  v23 = *MEMORY[0x1E0CA38E0];
  v24[0] = *MEMORY[0x1E0CA38D0];
  v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  routingContext = self->_routingContext;
  v5 = *(uint64_t (**)(OpaqueFigRoutingContext *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 112);
  if (!v5)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_9;
  }
  v6 = v5(routingContext, v3, &cf);
  v7 = cf;
  if (v6)
    v8 = 1;
  else
    v8 = cf == 0;
  if (v8)
  {
    v11 = 0;
    v10 = 0;
    if (!cf)
      goto LABEL_9;
    goto LABEL_7;
  }
  v9 = [AVFigCommChannelUUIDOutputContextCommunicationChannelImpl alloc];
  v10 = -[AVFigCommChannelUUIDOutputContextCommunicationChannelImpl initWithRoutingContext:commChannelUUID:](v9, "initWithRoutingContext:commChannelUUID:", self->_routingContext, cf);
  v11 = -[AVOutputContextCommunicationChannel initWithOutputContextCommunicationChannelImpl:]([AVOutputContextCommunicationChannel alloc], "initWithOutputContextCommunicationChannelImpl:", v10);
  ivarAccessQueue = self->_ivarAccessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__AVFigCommChannelUUIDCommunicationChannelManager_outgoingCommunicationChannel__block_invoke;
  v15[3] = &unk_1E30351A0;
  v15[6] = &v17;
  v15[7] = cf;
  v15[4] = self;
  v15[5] = v11;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v15);
  v7 = cf;
  if (cf)
LABEL_7:
    CFRelease(v7);
LABEL_9:

  v13 = (AVOutputContextCommunicationChannel *)(id)v18[5];
  _Block_object_dispose(&v17, 8);
  return v13;
}

void __79__AVFigCommChannelUUIDCommunicationChannelManager_outgoingCommunicationChannel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  __CFDictionary *MutableCopy;
  CFTypeRef v5;
  uint64_t v6;
  const void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 32);
  if (v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 40), v3);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFDictionaryRef *)(v2 + 40));
    v5 = *(CFTypeRef *)(a1 + 56);
    if (v5)
      v5 = CFRetain(v5);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v5;
    CFDictionarySetValue(MutableCopy, *(const void **)(a1 + 56), *(const void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(const void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MutableCopy;
    if (MutableCopy)
      CFRetain(MutableCopy);
    if (v7)
      CFRelease(v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(id *)(a1 + 40);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
}

- (id)openCommunicationChannelWithOptions:(id)a3 error:(id *)a4
{
  __CFDictionary *Mutable;
  const void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRoutingContext *routingContext;
  uint64_t (*v14)(OpaqueFigRoutingContext *, __CFDictionary *, CFTypeRef *);
  signed int v15;
  AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *v16;
  AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *v17;
  AVOutputContextCommunicationChannel *v18;
  NSObject *ivarAccessQueue;
  void *v20;
  _QWORD block[7];
  os_log_type_t type;
  int v24;
  CFTypeRef cf[23];

  cf[22] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  v8 = (const void *)*MEMORY[0x1E0CA38D0];
  v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVOutputContextCommunicationChannelOptionControlType"));
  v10 = v9;
  if (v9)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AVOutputContextCommunicationChannelControlTypeDirect")) & 1) != 0)
    {
      v11 = 2;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("AVOutputContextCommunicationChannelControlTypeRelayed")))goto LABEL_7;
      v11 = 1;
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA38E8], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11));
  }
LABEL_7:
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA38E0], v8);
  if (dword_1ECDECEF8)
  {
    v24 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  routingContext = self->_routingContext;
  v14 = *(uint64_t (**)(OpaqueFigRoutingContext *, __CFDictionary *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 112);
  if (!v14)
  {
    v15 = -12782;
    goto LABEL_15;
  }
  v15 = v14(routingContext, Mutable, cf);
  if (v15)
  {
LABEL_15:
    v20 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v15, 0);
    goto LABEL_16;
  }
  if (cf[0])
  {
    v16 = [AVFigCommChannelUUIDOutputContextCommunicationChannelImpl alloc];
    v17 = -[AVFigCommChannelUUIDOutputContextCommunicationChannelImpl initWithRoutingContext:commChannelUUID:](v16, "initWithRoutingContext:commChannelUUID:", self->_routingContext, cf[0]);
    v18 = -[AVOutputContextCommunicationChannel initWithOutputContextCommunicationChannelImpl:]([AVOutputContextCommunicationChannel alloc], "initWithOutputContextCommunicationChannelImpl:", v17);
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__AVFigCommChannelUUIDCommunicationChannelManager_openCommunicationChannelWithOptions_error___block_invoke;
    block[3] = &unk_1E302FEE0;
    block[5] = v18;
    block[6] = cf[0];
    block[4] = self;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    v20 = 0;
    if (!a4)
      goto LABEL_19;
    goto LABEL_17;
  }
  v20 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
LABEL_16:
  v17 = 0;
  v18 = 0;
  if (!a4)
    goto LABEL_19;
LABEL_17:
  if (!v18)
    *a4 = v20;
LABEL_19:
  if (cf[0])
    CFRelease(cf[0]);

  if (Mutable)
    CFRelease(Mutable);
  return v18;
}

void __93__AVFigCommChannelUUIDCommunicationChannelManager_openCommunicationChannelWithOptions_error___block_invoke(uint64_t a1)
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

- (void)_didReceiveData:(__CFData *)a3 fromCommChannelUUID:(__CFString *)a4
{
  NSObject *ivarAccessQueue;
  AVFigRoutingContextOutputContextImpl *v7;
  void *v8;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__44;
  v14 = __Block_byref_object_dispose__44;
  v15 = 0;
  if (a4)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__AVFigCommChannelUUIDCommunicationChannelManager__didReceiveData_fromCommChannelUUID___block_invoke;
    block[3] = &unk_1E3031988;
    block[4] = self;
    block[5] = &v10;
    block[6] = a4;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    v7 = -[AVFigCommChannelUUIDCommunicationChannelManager parentOutputContextImpl](self, "parentOutputContextImpl");
    -[AVFigRoutingContextOutputContextImpl communicationChannelManager:didReceiveData:fromCommunicationChannel:](v7, "communicationChannelManager:didReceiveData:fromCommunicationChannel:", self, a3, v11[5]);
    v8 = (void *)v11[5];
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v10, 8);
}

void __87__AVFigCommChannelUUIDCommunicationChannelManager__didReceiveData_fromCommChannelUUID___block_invoke(uint64_t a1)
{
  __CFDictionary *MutableCopy;
  uint64_t v3;
  const void *v4;
  AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40), *(const void **)(a1 + 48));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = -[AVFigCommChannelUUIDOutputContextCommunicationChannelImpl initWithRoutingContext:commChannelUUID:]([AVFigCommChannelUUIDOutputContextCommunicationChannelImpl alloc], "initWithRoutingContext:commChannelUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 48));
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[AVOutputContextCommunicationChannel initWithOutputContextCommunicationChannelImpl:]([AVOutputContextCommunicationChannel alloc], "initWithOutputContextCommunicationChannelImpl:", v5);
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

- (void)didCloseCommChannelUUID:(__CFString *)a3
{
  NSObject *ivarAccessQueue;
  AVFigRoutingContextOutputContextImpl *v5;
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
    block[2] = __75__AVFigCommChannelUUIDCommunicationChannelManager_didCloseCommChannelUUID___block_invoke;
    block[3] = &unk_1E3031988;
    block[4] = self;
    block[5] = &v8;
    block[6] = a3;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    v5 = -[AVFigCommChannelUUIDCommunicationChannelManager parentOutputContextImpl](self, "parentOutputContextImpl");
    -[AVFigRoutingContextOutputContextImpl communicationChannelManager:didCloseCommunicationChannel:](v5, "communicationChannelManager:didCloseCommunicationChannel:", self, v9[5]);
    v6 = (void *)v9[5];
  }
  else
  {
    v6 = 0;
  }

  _Block_object_dispose(&v8, 8);
}

void __75__AVFigCommChannelUUIDCommunicationChannelManager_didCloseCommChannelUUID___block_invoke(uint64_t a1)
{
  __CFDictionary *MutableCopy;
  const void *v3;
  uint64_t v4;
  const void *v5;
  const void *v7;
  AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40), *(const void **)(a1 + 48));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40));
    CFDictionaryRemoveValue(MutableCopy, *(const void **)(a1 + 48));
    v3 = *(const void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(const void **)(v4 + 32);
    if (v3 == v5 && v5 != 0)
    {
      CFRelease(v3);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
      v4 = *(_QWORD *)(a1 + 32);
    }
    v7 = *(const void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = MutableCopy;
    if (MutableCopy)
      CFRetain(MutableCopy);
    if (v7)
      CFRelease(v7);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
  else
  {
    v8 = -[AVFigCommChannelUUIDOutputContextCommunicationChannelImpl initWithRoutingContext:commChannelUUID:]([AVFigCommChannelUUIDOutputContextCommunicationChannelImpl alloc], "initWithRoutingContext:commChannelUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 48));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[AVOutputContextCommunicationChannel initWithOutputContextCommunicationChannelImpl:]([AVOutputContextCommunicationChannel alloc], "initWithOutputContextCommunicationChannelImpl:", v8);

  }
}

- (AVFigRoutingContextOutputContextImpl)parentOutputContextImpl
{
  return (AVFigRoutingContextOutputContextImpl *)objc_loadWeak((id *)&self->_parentOutputContextImpl);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentOutputContextImpl);
}

@end
