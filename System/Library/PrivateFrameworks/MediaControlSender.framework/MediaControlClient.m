@implementation MediaControlClient

- (MediaControlClient)init
{
  id v2;
  dispatch_queue_t v3;
  CFAllocatorRef Default;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlClient;
  v2 = -[MediaControlClient init](&v6, sel_init);
  if (v2
    && (v3 = dispatch_queue_create("MediaControlClient", 0), (*((_QWORD *)v2 + 1) = v3) != 0)
    && (Default = CFAllocatorGetDefault(),
        !MediaControlClient_Create((uint64_t)Default, 0, (uint64_t *)v2 + 2)))
  {
    MediaControlClient_SetDispatchQueue(*((_QWORD *)v2 + 2), *((NSObject **)v2 + 1));
  }
  else
  {
    APSLogErrorAt();

    return 0;
  }
  return (MediaControlClient *)v2;
}

- (void)dealloc
{
  NSObject *queue;
  NSObject *eventHandlerQueue;
  objc_super v5;

  CFRelease(self->_client);
  self->_client = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  eventHandlerQueue = self->_eventHandlerQueue;
  if (eventHandlerQueue)
  {
    dispatch_release(eventHandlerQueue);
    self->_eventHandlerQueue = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)MediaControlClient;
  -[MediaControlClient dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  MediaControlClientImp *client;
  NSObject *queue;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD block[5];

  client = self->_client;
  if (client)
  {
    MediaControlClient_Cancel((uint64_t)client);
    -[MediaControlClient ensureDisconnected](self, "ensureDisconnected");
  }
  queue = self->_queue;
  if (queue)
  {
    if (self->_client)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __32__MediaControlClient_invalidate__block_invoke;
      block[3] = &unk_24DA38898;
      block[4] = self;
      dispatch_async(queue, block);
    }
    v5 = dispatch_semaphore_create(0);
    if (v5)
    {
      v6 = v5;
      dispatch_set_context((dispatch_object_t)self->_queue, v5);
      dispatch_set_finalizer_f((dispatch_object_t)self->_queue, (dispatch_function_t)__invalidateDone);
      dispatch_release((dispatch_object_t)self->_queue);
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v6);
      self->_queue = 0;
    }
  }
}

- (void)setHost:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__MediaControlClient_setHost___block_invoke;
  v4[3] = &unk_24DA388C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setPassword:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__MediaControlClient_setPassword___block_invoke;
  v4[3] = &unk_24DA388C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)ensureConnected
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__MediaControlClient_ensureConnected__block_invoke;
  block[3] = &unk_24DA38898;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)ensureDisconnected
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__MediaControlClient_ensureDisconnected__block_invoke;
    block[3] = &unk_24DA38898;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)performRemoteAction:(id)a3 withParams:(id)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  if (a5)
    dispatch_retain((dispatch_object_t)a5);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__MediaControlClient_performRemoteAction_withParams_completionQueue_completionBlock___block_invoke;
  block[3] = &unk_24DA38910;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)setEventHandlerQueue:(id)a3 eventHandlerBlock:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__MediaControlClient_setEventHandlerQueue_eventHandlerBlock___block_invoke;
  block[3] = &unk_24DA38938;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)startPresentation:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  NSObject *queue;
  _QWORD v10[8];

  if (a4)
    dispatch_retain((dispatch_object_t)a4);
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__MediaControlClient_startPresentation_completionQueue_completionBlock___block_invoke;
  v10[3] = &unk_24DA38988;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  dispatch_async(queue, v10);
}

- (void)sendPhotoData:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  -[MediaControlClient sendPhotoData:options:completionQueue:completionBlock:](self, "sendPhotoData:options:completionQueue:completionBlock:", a3, 0, a4, a5);
}

- (void)sendPhotoData:(id)a3 options:(id)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  if (a5)
    dispatch_retain((dispatch_object_t)a5);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__MediaControlClient_sendPhotoData_options_completionQueue_completionBlock___block_invoke;
  block[3] = &unk_24DA38910;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)getProperty:(id)a3 qualifier:(id)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  dispatch_retain((dispatch_object_t)a5);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__MediaControlClient_getProperty_qualifier_completionQueue_completionBlock___block_invoke;
  block[3] = &unk_24DA38910;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 completionQueue:(id)a6 completionBlock:(id)a7
{
  NSObject *queue;
  _QWORD v14[10];

  if (a6)
    dispatch_retain((dispatch_object_t)a6);
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __82__MediaControlClient_setProperty_qualifier_value_completionQueue_completionBlock___block_invoke;
  v14[3] = &unk_24DA38A00;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  v14[8] = a6;
  v14[9] = a7;
  dispatch_async(queue, v14);
}

- (void)getSlideshowFeaturesWithOptions:(unsigned int)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  NSObject *queue;
  _QWORD v10[7];
  unsigned int v11;

  if (a4)
    dispatch_retain((dispatch_object_t)a4);
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__MediaControlClient_getSlideshowFeaturesWithOptions_completionQueue_completionBlock___block_invoke;
  v10[3] = &unk_24DA38A28;
  v11 = a3;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a5;
  dispatch_async(queue, v10);
}

- (void)getSlideshowInfoWithOptions:(unsigned int)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  if (a4)
    dispatch_retain((dispatch_object_t)a4);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__MediaControlClient_getSlideshowInfoWithOptions_completionQueue_completionBlock___block_invoke;
  block[3] = &unk_24DA38938;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)setSlideshowInfo:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  NSObject *queue;
  _QWORD v10[8];

  if (a4)
    dispatch_retain((dispatch_object_t)a4);
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__MediaControlClient_setSlideshowInfo_completionQueue_completionBlock___block_invoke;
  v10[3] = &unk_24DA38988;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  dispatch_async(queue, v10);
}

void __71__MediaControlClient_setSlideshowInfo_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void **v3;
  const __CFDictionary *v4;
  int v5;
  int v6;
  const __CFString *Value;
  const __CFString *v8;
  CFTypeID v9;
  int v10;
  const __CFData *Data;
  const char *BytePtr;
  CFIndex Length;
  int v14;
  const __CFData *v15;
  const __CFData *v16;
  CFTypeID v17;
  const __CFData *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[6];
  int v22;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = (void **)(v2 + 279600);
  if (!*(_QWORD *)(v2 + 844680) || !*(_QWORD *)(v2 + 844688))
  {
    APSLogErrorAt();
    v18 = 0;
    v10 = 0;
    Data = 0;
    v14 = -6745;
    goto LABEL_16;
  }
  v4 = *(const __CFDictionary **)(a1 + 40);
  v5 = MediaControlClient_EnsureConnected(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  if (v5)
  {
    v14 = v5;
LABEL_39:
    APSLogErrorAt();
    v18 = 0;
    v10 = 0;
    goto LABEL_15;
  }
  v6 = _MediaControlClient_EnsureReverseConnected(v2, (_BYTE *)(v2 + 563288));
  if (v6)
  {
    v14 = v6;
    goto LABEL_39;
  }
  Value = (const __CFString *)CFDictionaryGetValue(v4, CFSTR("state"));
  if (Value
    && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFStringGetTypeID())
    && CFStringCompare(v8, CFSTR("playing"), 0) == kCFCompareEqualTo)
  {
    if (*(double *)(v2 + 844720) == 0.0)
    {
      *(CFAbsoluteTime *)(v2 + 844720) = CFAbsoluteTimeGetCurrent();
      UUIDGet();
      *(_QWORD *)(v2 + 844740) = 0;
      *(_QWORD *)(v2 + 844732) = 0;
      *(_DWORD *)(v2 + 844748) = 0;
      if (gLogCategory_MediaControlClientCore <= 50
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    _MediaControlClient_EnsureMirroringSuspended(v2);
    v10 = 1;
  }
  else
  {
    _MediaControlClient_LogSlideshowEnded(v2);
    _MediaControlClient_EnsureMirroringResumed(v2);
    v10 = 0;
  }
  Data = CFPropertyListCreateData(0, v4, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (Data)
  {
    HTTPHeader_InitRequest();
    HTTPHeader_SetField();
    BytePtr = (const char *)CFDataGetBytePtr(Data);
    Length = CFDataGetLength(Data);
    v14 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)v2, v2 + 416, BytePtr, Length);
    CFRelease(Data);
    if (v14)
    {
      v18 = 0;
      goto LABEL_15;
    }
    v15 = CFDataCreate(0, *(const UInt8 **)(v2 + 279608), *(_QWORD *)(v2 + 279616));
    if (v15)
    {
      v16 = v15;
      Data = (const __CFData *)CFPropertyListCreateWithData(0, v15, 0, 0, 0);
      CFRelease(v16);
      if (Data)
      {
        v17 = CFGetTypeID(Data);
        if (v17 == CFDictionaryGetTypeID())
        {
          v14 = 0;
          v18 = Data;
LABEL_15:
          Data = 0;
          goto LABEL_16;
        }
        APSLogErrorAt();
        v18 = 0;
        v14 = -6756;
      }
      else
      {
        APSLogErrorAt();
        v18 = 0;
        v14 = -6717;
      }
    }
    else
    {
      APSLogErrorAt();
      v18 = 0;
      Data = 0;
      v14 = -6728;
    }
  }
  else
  {
    APSLogErrorAt();
    v18 = 0;
    v14 = -6700;
  }
LABEL_16:
  if (*v3)
  {
    free(*v3);
    *v3 = 0;
  }
  if (Data)
    CFRelease(Data);
  if (v14)
  {
    if (v10)
      _MediaControlClient_EnsureMirroringResumed(v2);
    if (gLogCategory_MediaControlClientCore <= 60
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v19 = *(NSObject **)(a1 + 48);
  if (v19)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__MediaControlClient_setSlideshowInfo_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_24DA38960;
    v22 = v14;
    v20 = *(_QWORD *)(a1 + 56);
    block[4] = v18;
    block[5] = v20;
    dispatch_async(v19, block);

    dispatch_release(*(dispatch_object_t *)(a1 + 48));
  }
}

void __71__MediaControlClient_setSlideshowInfo_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;

  if (*(_DWORD *)(a1 + 48))
  {
    v2 = objc_alloc(MEMORY[0x24BDD1540]);
    v3 = objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], *(int *)(a1 + 48), 0);
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__MediaControlClient_getSlideshowInfoWithOptions_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void **v3;
  int v4;
  int v5;
  const __CFData *v6;
  const __CFData *v7;
  CFPropertyListRef v8;
  CFTypeID v9;
  int v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[6];
  int v15;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = (void **)(v2 + 279600);
  v4 = MediaControlClient_EnsureConnected(v2);
  if (v4)
  {
    v10 = v4;
    APSLogErrorAt();
LABEL_22:
    v11 = 0;
    goto LABEL_7;
  }
  HTTPHeader_InitRequest();
  v5 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)v2, v2 + 416, 0, 0);
  if (v5)
  {
    v10 = v5;
    goto LABEL_22;
  }
  v6 = CFDataCreate(0, *(const UInt8 **)(v2 + 279608), *(_QWORD *)(v2 + 279616));
  if (v6)
  {
    v7 = v6;
    v8 = CFPropertyListCreateWithData(0, v6, 0, 0, 0);
    CFRelease(v7);
    if (v8)
    {
      v9 = CFGetTypeID(v8);
      if (v9 == CFDictionaryGetTypeID())
      {
        v10 = 0;
        v11 = (void *)v8;
LABEL_7:
        v8 = 0;
        goto LABEL_8;
      }
      APSLogErrorAt();
      v11 = 0;
      v10 = -6756;
    }
    else
    {
      APSLogErrorAt();
      v11 = 0;
      v10 = -6717;
    }
  }
  else
  {
    APSLogErrorAt();
    v11 = 0;
    v8 = 0;
    v10 = -6728;
  }
LABEL_8:
  if (*v3)
  {
    free(*v3);
    *v3 = 0;
  }
  if (v8)
    CFRelease(v8);
  if (v10
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v12 = *(NSObject **)(a1 + 40);
  if (v12)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__MediaControlClient_getSlideshowInfoWithOptions_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_24DA38960;
    v15 = v10;
    v13 = *(_QWORD *)(a1 + 48);
    block[4] = v11;
    block[5] = v13;
    dispatch_async(v12, block);

    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
}

void __82__MediaControlClient_getSlideshowInfoWithOptions_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;

  if (*(_DWORD *)(a1 + 48))
  {
    v2 = objc_alloc(MEMORY[0x24BDD1540]);
    v3 = objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], *(int *)(a1 + 48), 0);
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86__MediaControlClient_getSlideshowFeaturesWithOptions_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  void **v5;
  int v6;
  int v7;
  const __CFData *v8;
  const __CFData *v9;
  CFPropertyListRef v10;
  CFTypeID v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD block[6];
  int v17;

  if ((*(_BYTE *)(a1 + 56) & 1) != 0
    || (v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "preferredLocalizations"),
        !objc_msgSend(v2, "count")))
  {
    v3 = 0;
  }
  else
  {
    v3 = (_BYTE *)objc_msgSend((id)objc_msgSend(v2, "objectAtIndex:", 0), "UTF8String");
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = (void **)(v4 + 279600);
  v6 = MediaControlClient_EnsureConnected(v4);
  if (v6)
  {
    v12 = v6;
    APSLogErrorAt();
LABEL_29:
    v13 = 0;
    goto LABEL_14;
  }
  HTTPHeader_InitRequest();
  if (v3 && *v3)
    HTTPHeader_SetField();
  v7 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)v4, v4 + 416, 0, 0);
  if (v7)
  {
    v12 = v7;
    goto LABEL_29;
  }
  v8 = CFDataCreate(0, *(const UInt8 **)(v4 + 279608), *(_QWORD *)(v4 + 279616));
  if (v8)
  {
    v9 = v8;
    v10 = CFPropertyListCreateWithData(0, v8, 0, 0, 0);
    CFRelease(v9);
    if (v10)
    {
      v11 = CFGetTypeID(v10);
      if (v11 == CFDictionaryGetTypeID())
      {
        v12 = 0;
        v13 = (void *)v10;
LABEL_14:
        v10 = 0;
        goto LABEL_15;
      }
      APSLogErrorAt();
      v13 = 0;
      v12 = -6756;
    }
    else
    {
      APSLogErrorAt();
      v13 = 0;
      v12 = -6717;
    }
  }
  else
  {
    APSLogErrorAt();
    v13 = 0;
    v10 = 0;
    v12 = -6728;
  }
LABEL_15:
  if (*v5)
  {
    free(*v5);
    *v5 = 0;
  }
  if (v10)
    CFRelease(v10);
  if (v12
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v14 = *(NSObject **)(a1 + 40);
  if (v14)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__MediaControlClient_getSlideshowFeaturesWithOptions_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_24DA38960;
    v17 = v12;
    v15 = *(_QWORD *)(a1 + 48);
    block[4] = v13;
    block[5] = v15;
    dispatch_async(v14, block);

    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
}

void __86__MediaControlClient_getSlideshowFeaturesWithOptions_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;

  if (*(_DWORD *)(a1 + 48))
  {
    v2 = objc_alloc(MEMORY[0x24BDD1540]);
    v3 = objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], *(int *)(a1 + 48), 0);
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__MediaControlClient_setProperty_qualifier_value_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _QWORD v4[5];
  int v5;

  v2 = MediaControlClient_SetProperty(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(NSObject **)(a1 + 64);
  if (v3)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __82__MediaControlClient_setProperty_qualifier_value_completionQueue_completionBlock___block_invoke_2;
    v4[3] = &unk_24DA389B0;
    v5 = v2;
    v4[4] = *(_QWORD *)(a1 + 72);
    dispatch_async(v3, v4);
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
  }
}

void __82__MediaControlClient_setProperty_qualifier_value_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;

  if (*(_DWORD *)(a1 + 40))
  {
    v2 = objc_alloc(MEMORY[0x24BDD1540]);
    v3 = objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], *(int *)(a1 + 40), 0);
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__MediaControlClient_getProperty_qualifier_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[6];
  int v5;
  int v6;

  v6 = 0;
  v2 = MediaControlClient_CopyProperty(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(const void **)(a1 + 40), *(_QWORD *)(a1 + 48), &v6);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__MediaControlClient_getProperty_qualifier_completionQueue_completionBlock___block_invoke_2;
  block[3] = &unk_24DA389D8;
  v5 = v6;
  v3 = *(NSObject **)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 64);
  block[5] = v2;
  dispatch_async(v3, block);
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

void __76__MediaControlClient_getProperty_qualifier_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  const void *v4;

  if (*(_DWORD *)(a1 + 48))
  {
    v2 = objc_alloc(MEMORY[0x24BDD1540]);
    v3 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], *(int *)(a1 + 48), 0);
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
}

void __76__MediaControlClient_sendPhotoData_options_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;
  const char *v4;
  unint64_t v5;
  const __CFDictionary *v6;
  int v7;
  _DWORD *v8;
  const void *Value;
  const void *v10;
  CFTypeID v11;
  _BOOL4 v12;
  const void *v13;
  void **v14;
  CFTypeID v15;
  const void *v16;
  CFTypeID v17;
  double Current;
  int v19;
  double v20;
  double v21;
  unsigned int v22;
  int v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD block[5];
  int v28;

  v1 = a1;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = (void **)(v2 + 279600);
  v4 = (const char *)objc_msgSend(*(id *)(a1 + 40), "bytes");
  v5 = objc_msgSend(*(id *)(v1 + 40), "length");
  v6 = *(const __CFDictionary **)(v1 + 48);
  v7 = MediaControlClient_EnsureConnected(v2);
  v8 = &unk_255031000;
  if (*(double *)(v2 + 563256) == 0.0)
  {
    *(CFAbsoluteTime *)(v2 + 563256) = CFAbsoluteTimeGetCurrent();
    UUIDGet();
    *(_QWORD *)(v2 + 563276) = 0;
    *(_QWORD *)(v2 + 563268) = 0;
    *(_DWORD *)(v2 + 563284) = 0;
    if (gLogCategory_MediaControlClientCore <= 50
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!v7)
  {
    _MediaControlClient_EnsureMirroringSuspended(v2);
    HTTPHeader_InitRequest();
    v26 = v1;
    if (!v6)
    {
      v12 = 1;
      goto LABEL_21;
    }
    Value = CFDictionaryGetValue(v6, CFSTR("assetAction"));
    if (!Value)
    {
      v12 = 1;
LABEL_13:
      v13 = CFDictionaryGetValue(v6, CFSTR("assetKey"));
      if (v13)
      {
        v14 = v3;
        v15 = CFGetTypeID(v13);
        if (v15 != CFStringGetTypeID())
        {
          APSLogErrorAt();
          if (gLogCategory_MediaControlClientCore <= 90
            && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v7 = -6705;
          v3 = v14;
          v8 = (_DWORD *)&unk_255031000;
          goto LABEL_35;
        }
        HTTPHeader_SetField();
        v3 = v14;
        v8 = &unk_255031000;
      }
      if (*(_BYTE *)(v2 + 281780))
        HTTPHeader_SetField();
      v16 = CFDictionaryGetValue(v6, CFSTR("Transition"));
      if (v16)
      {
        v17 = CFGetTypeID(v16);
        if (v17 != CFStringGetTypeID())
        {
          APSLogErrorAt();
          if (gLogCategory_MediaControlClientCore <= 90
            && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v7 = -6705;
          goto LABEL_35;
        }
        HTTPHeader_SetField();
      }
LABEL_21:
      Current = CFAbsoluteTimeGetCurrent();
      v19 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)v2, v2 + 416, v4, v5);
      if (v19)
      {
        v7 = v19;
      }
      else
      {
        v20 = CFAbsoluteTimeGetCurrent();
        if (v12)
        {
          if (v5 && (v21 = v20 - Current, v21 > 0.0))
          {
            v22 = vcvtd_n_u64_f64((double)v5 / v21, 3uLL);
            v23 = *(_DWORD *)(v2 + 563268);
            if (v23)
            {
              v1 = v26;
              if (v5 < *(unsigned int *)(v2 + 563272))
                *(_DWORD *)(v2 + 563272) = v5;
              if (v5 > *(unsigned int *)(v2 + 563276))
                *(_DWORD *)(v2 + 563276) = v5;
              if (*(_DWORD *)(v2 + 563280) > v22)
                *(_DWORD *)(v2 + 563280) = v22;
              if (*(_DWORD *)(v2 + 563284) < v22)
                *(_DWORD *)(v2 + 563284) = v22;
              goto LABEL_39;
            }
            *(_DWORD *)(v2 + 563272) = v5;
            *(_DWORD *)(v2 + 563276) = v5;
            *(_DWORD *)(v2 + 563280) = v22;
            *(_DWORD *)(v2 + 563284) = v22;
          }
          else
          {
            v23 = *(_DWORD *)(v2 + 563268);
          }
          v1 = v26;
LABEL_39:
          v7 = 0;
          *(_DWORD *)(v2 + 563268) = v23 + 1;
          goto LABEL_40;
        }
        v7 = 0;
      }
LABEL_35:
      v1 = v26;
      goto LABEL_40;
    }
    v10 = Value;
    v11 = CFGetTypeID(Value);
    if (v11 == CFStringGetTypeID())
    {
      v12 = CFEqual(v10, CFSTR("displayCached")) == 0;
      HTTPHeader_SetField();
      v3 = (void **)(v2 + 279600);
      goto LABEL_13;
    }
    APSLogErrorAt();
    if (gLogCategory_MediaControlClientCore <= 90
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = -6705;
    v3 = (void **)(v2 + 279600);
  }
LABEL_40:
  if (*v3)
  {
    free(*v3);
    *v3 = 0;
  }
  if (v7)
  {
    v24 = v8[878];
    if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  v25 = *(NSObject **)(v1 + 56);
  if (v25)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__MediaControlClient_sendPhotoData_options_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_24DA389B0;
    v28 = v7;
    block[4] = *(_QWORD *)(v1 + 64);
    dispatch_async(v25, block);
    dispatch_release(*(dispatch_object_t *)(v1 + 56));
  }
}

void __76__MediaControlClient_sendPhotoData_options_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;

  if (*(_DWORD *)(a1 + 40))
  {
    v2 = objc_alloc(MEMORY[0x24BDD1540]);
    v3 = objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], *(int *)(a1 + 40), 0);
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __72__MediaControlClient_startPresentation_completionQueue_completionBlock___block_invoke(_QWORD *a1)
{
  CFMutableDictionaryRef Mutable;
  uint64_t v3;
  void **v4;
  int v5;
  CFMutableDictionaryRef v6;
  const char *BytePtr;
  CFIndex Length;
  int v9;
  const __CFData *v10;
  const __CFData *v11;
  void *v12;
  CFTypeID v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD block[6];
  int v17;

  Mutable = (CFMutableDictionaryRef)a1[5];
  v3 = *(_QWORD *)(a1[4] + 16);
  v4 = (void **)(v3 + 279600);
  v5 = MediaControlClient_EnsureConnected(v3);
  if (v5)
  {
    v9 = v5;
    APSLogErrorAt();
    Mutable = 0;
    v6 = 0;
    goto LABEL_12;
  }
  if (Mutable)
  {
    v6 = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v6 = Mutable;
    if (!Mutable)
    {
      APSLogErrorAt();
      goto LABEL_35;
    }
  }
  Mutable = CFPropertyListCreateData(0, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Mutable)
  {
    APSLogErrorAt();
    v12 = 0;
    v9 = -6700;
    goto LABEL_13;
  }
  HTTPHeader_InitRequest();
  HTTPHeader_SetField();
  BytePtr = (const char *)CFDataGetBytePtr(Mutable);
  Length = CFDataGetLength(Mutable);
  v9 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)v3, v3 + 416, BytePtr, Length);
  CFRelease(Mutable);
  if (v9)
  {
    Mutable = 0;
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v10 = CFDataCreate(0, *(const UInt8 **)(v3 + 279608), *(_QWORD *)(v3 + 279616));
  if (!v10)
  {
    APSLogErrorAt();
    Mutable = 0;
LABEL_35:
    v12 = 0;
    v9 = -6728;
    goto LABEL_13;
  }
  v11 = v10;
  v12 = (void *)CFPropertyListCreateWithData(0, v10, 0, 0, 0);
  CFRelease(v11);
  if (v12)
  {
    v13 = CFGetTypeID(v12);
    if (v13 == CFDictionaryGetTypeID())
    {
      v9 = 0;
      Mutable = (CFMutableDictionaryRef)v12;
      goto LABEL_12;
    }
    APSLogErrorAt();
    Mutable = 0;
    v9 = -6756;
  }
  else
  {
    APSLogErrorAt();
    Mutable = 0;
    v9 = -6717;
  }
LABEL_13:
  if (*v4)
  {
    free(*v4);
    *v4 = 0;
  }
  if (v6)
    CFRelease(v6);
  if (v12)
    CFRelease(v12);
  if (v9
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v14 = a1[6];
  if (v14)
  {
    v15 = a1[7];
    if (!v15)
      goto LABEL_27;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__MediaControlClient_startPresentation_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_24DA38960;
    v17 = v9;
    block[4] = Mutable;
    block[5] = v15;
    dispatch_async(v14, block);
    v14 = a1[6];
    if (v14)
LABEL_27:
      dispatch_release(v14);
  }
}

void __72__MediaControlClient_startPresentation_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;

  if (*(_DWORD *)(a1 + 48))
  {
    v2 = objc_alloc(MEMORY[0x24BDD1540]);
    v3 = objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], *(int *)(a1 + 48), 0);
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __61__MediaControlClient_setEventHandlerQueue_eventHandlerBlock___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(uint64_t, uint64_t, uint64_t);
  BOOL v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  v2 = a1[4];
  v3 = a1[5];
  v4 = *(NSObject **)(v3 + 24);
  if (v2 != v4)
  {
    if (v2)
    {
      dispatch_retain(v2);
      v3 = a1[5];
      v4 = *(NSObject **)(v3 + 24);
    }
    if (v4)
    {
      dispatch_release(v4);
      v3 = a1[5];
    }
    *(_QWORD *)(v3 + 24) = a1[4];
    v2 = a1[4];
  }
  if (v2)
    dispatch_release(v2);
  v5 = (void *)a1[6];
  if (v5 != *(void **)(a1[5] + 32))
  {
    v6 = v5;

    *(_QWORD *)(a1[5] + 32) = a1[6];
    v7 = a1[5];
    v8 = a1[6];
    v9 = (void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 + 16) + 563216);
    v10 = v8 == 0;
    if (v8)
      v11 = __eventHandler;
    else
      v11 = 0;
    if (v10)
      v7 = 0;
    *v9 = v11;
    v9[1] = (void (*)(uint64_t, uint64_t, uint64_t))v7;
  }
}

void __85__MediaControlClient_performRemoteAction_withParams_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD block[6];
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v9 = 0;
  v8 = 0;
  v2 = MediaControlClient_DoAction(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 16), *(const void **)(a1 + 40), *(const void **)(a1 + 48), &v9, &v8);
  v3 = *(NSObject **)(a1 + 56);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (!v4)
      goto LABEL_4;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__MediaControlClient_performRemoteAction_withParams_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_24DA388E8;
    v6 = v2;
    v7 = v9;
    block[4] = v4;
    block[5] = v8;
    dispatch_async(v3, block);
    v3 = *(NSObject **)(a1 + 56);
    if (v3)
LABEL_4:
      dispatch_release(v3);
  }
}

void __85__MediaControlClient_performRemoteAction_withParams_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  const void *v5;
  id v6;

  v2 = (_QWORD *)MEMORY[0x24BDD1100];
  if (*(_DWORD *)(a1 + 48))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], *(int *)(a1 + 48), 0);
  else
    v3 = 0;
  if (*(_DWORD *)(a1 + 52))
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", *v2, *(int *)(a1 + 52), 0);
  else
    v4 = 0;
  v6 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);

}

uint64_t __40__MediaControlClient_ensureDisconnected__block_invoke(uint64_t a1)
{
  return MediaControlClient_EnsureDisconnected(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __37__MediaControlClient_ensureConnected__block_invoke(uint64_t a1)
{
  return MediaControlClient_EnsureConnected(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __34__MediaControlClient_setPassword___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "UTF8String");
  return ReplaceDifferentString();
}

uint64_t __30__MediaControlClient_setHost___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "UTF8String");
  return ReplaceDifferentString();
}

void __32__MediaControlClient_invalidate__block_invoke(uint64_t a1)
{
  MediaControlClient_Invalidate(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t ___MediaControlClient_PlaybackPaused_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 845068);
  if ((_DWORD)result)
  {
    result = IOPMAssertionRelease(result);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 845068) = 0;
    if (gLogCategory_MediaControlClientCore <= 40)
    {
      if (gLogCategory_MediaControlClientCore != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

@end
