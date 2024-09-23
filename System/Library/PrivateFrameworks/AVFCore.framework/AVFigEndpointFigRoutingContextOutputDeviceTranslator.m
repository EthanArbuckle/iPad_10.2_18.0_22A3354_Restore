@implementation AVFigEndpointFigRoutingContextOutputDeviceTranslator

+ (id)sharedOutputDeviceTranslator
{
  return objc_alloc_init((Class)a1);
}

- (AVFigEndpointFigRoutingContextOutputDeviceTranslator)init
{
  return (AVFigEndpointFigRoutingContextOutputDeviceTranslator *)-[AVFigEndpointFigRoutingContextOutputDeviceTranslator initForUsingRouteConfigUpdatedNotification:](self, "initForUsingRouteConfigUpdatedNotification:", AVOutputContextUsesRouteConfigUpdatedNotification());
}

- (id)initForUsingRouteConfigUpdatedNotification:(BOOL)a3
{
  AVFigEndpointFigRoutingContextOutputDeviceTranslator *v4;
  AVFigEndpointFigRoutingContextOutputDeviceTranslator *v5;
  AVFigEndpointFigRoutingContextOutputDeviceTranslator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVFigEndpointFigRoutingContextOutputDeviceTranslator;
  v4 = -[AVFigEndpointFigRoutingContextOutputDeviceTranslator init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_useRouteConfigUpdatedNotification = a3;
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)outputDeviceFromRoutingContext:(OpaqueFigRoutingContext *)a3
{
  uint64_t (*v4)(OpaqueFigRoutingContext *, CFTypeRef *);
  int v5;
  CFTypeRef v6;
  AVOutputDevice *v7;
  CFTypeRef cf;

  cf = 0;
  v4 = *(uint64_t (**)(OpaqueFigRoutingContext *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 24);
  if (!v4)
    return 0;
  v5 = v4(a3, &cf);
  v6 = cf;
  if (v5)
  {
    v7 = 0;
    if (!cf)
      return v7;
    goto LABEL_4;
  }
  v7 = +[AVOutputDevice outputDeviceWithFigEndpoint:](AVOutputDevice, "outputDeviceWithFigEndpoint:", cf);
  v6 = cf;
  if (cf)
LABEL_4:
    CFRelease(v6);
  return v7;
}

- (void)setOutputDevice:(id)a3 withOptions:(__CFDictionary *)a4 onRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6
{
  AVEventWaiter *v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  AVOutputContextDestinationChange *v13;
  _QWORD v14[7];
  CFTypeRef v15;

  v15 = 0;
  v11 = objc_alloc_init(AVEventWaiter);
  if (AVOutputDeviceGetFigEndpoint(a3, &v15))
  {
    v12 = AVMakeSelectEndpointOperation(a5, v15, a4, self->_useRouteConfigUpdatedNotification);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __119__AVFigEndpointFigRoutingContextOutputDeviceTranslator_setOutputDevice_withOptions_onRoutingContext_completionHandler___block_invoke;
    v14[3] = &unk_1E3031B30;
    v14[5] = v11;
    v14[6] = a6;
    v14[4] = v12;
    -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setCompletionBlock:](v12, "setCompletionBlock:", v14);
    -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation start](v12, "start");
    if (-[AVOperation isFinished](v12, "isFinished"))
      -[AVEventWaiter waitUntilEventIsCompleted](v11, "waitUntilEventIsCompleted");
  }
  else
  {
    v13 = objc_alloc_init(AVOutputContextDestinationChange);
    -[AVOutputContextDestinationChange markAsFailed](v13, "markAsFailed");
    (*((void (**)(id, AVOutputContextDestinationChange *))a6 + 2))(a6, v13);

  }
}

uint64_t __119__AVFigEndpointFigRoutingContextOutputDeviceTranslator_setOutputDevice_withOptions_onRoutingContext_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "result"));
  return objc_msgSend(*(id *)(a1 + 40), "markEventAsCompleted");
}

- (id)outputDevicesFromRoutingContext:(OpaqueFigRoutingContext *)a3
{
  void *v4;
  unsigned int (*v5)(OpaqueFigRoutingContext *, CFArrayRef *);
  CFIndex i;
  CFIndex Count;
  AVOutputDevice *v8;
  CFArrayRef theArray;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  theArray = 0;
  v5 = *(unsigned int (**)(OpaqueFigRoutingContext *, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 56);
  if (v5 && !v5(a3, &theArray))
  {
    for (i = 0; ; ++i)
    {
      Count = (CFIndex)theArray;
      if (theArray)
        Count = CFArrayGetCount(theArray);
      if (i >= Count)
        break;
      v8 = +[AVOutputDevice outputDeviceWithFigEndpoint:](AVOutputDevice, "outputDeviceWithFigEndpoint:", CFArrayGetValueAtIndex(theArray, i));
      if (v8)
        objc_msgSend(v4, "addObject:", v8);
    }
  }
  if (theArray)
    CFRelease(theArray);
  return v4;
}

- (void)setOutputDevices:(id)a3 withOptions:(__CFDictionary *)a4 onRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6
{
  CFMutableArrayRef Mutable;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v17;
  AVOutputContextDestinationChange *v18;
  _QWORD v19[6];
  void *value;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(a3);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        value = 0;
        if (!AVOutputDeviceGetFigEndpoint(v16, &value))
        {
          if (Mutable)
            CFRelease(Mutable);
          goto LABEL_15;
        }
        if (value)
          CFArrayAppendValue(Mutable, value);
      }
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
        continue;
      break;
    }
  }
  if (Mutable)
  {
    v17 = AVMakeSelectEndpointsOperation(a5, Mutable, a4, self->_useRouteConfigUpdatedNotification);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __120__AVFigEndpointFigRoutingContextOutputDeviceTranslator_setOutputDevices_withOptions_onRoutingContext_completionHandler___block_invoke;
    v19[3] = &unk_1E3032448;
    v19[4] = v17;
    v19[5] = a6;
    -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setCompletionBlock:](v17, "setCompletionBlock:", v19);
    objc_msgSend(+[AVGlobalOperationQueue defaultQueue](AVGlobalOperationQueue, "defaultQueue"), "enqueueOperation:", v17);
    CFRelease(Mutable);
  }
  else
  {
LABEL_15:
    v18 = objc_alloc_init(AVOutputContextDestinationChange);
    -[AVOutputContextDestinationChange markAsFailed](v18, "markAsFailed");
    (*((void (**)(id, AVOutputContextDestinationChange *))a6 + 2))(a6, v18);

  }
}

uint64_t __120__AVFigEndpointFigRoutingContextOutputDeviceTranslator_setOutputDevices_withOptions_onRoutingContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "result"));
}

- (void)addOutputDevice:(id)a3 withOptions:(__CFDictionary *)a4 toRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6
{
  int FigEndpoint;
  char v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  AVOutputContextDestinationChange *v13;
  _QWORD v14[6];
  CFTypeRef v15;

  v15 = 0;
  FigEndpoint = AVOutputDeviceGetFigEndpoint(a3, &v15);
  v11 = FigEndpoint;
  if (FigEndpoint && v15)
  {
    v12 = AVMakeAddEndpointOperation(a5, v15, a4, self->_useRouteConfigUpdatedNotification);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __119__AVFigEndpointFigRoutingContextOutputDeviceTranslator_addOutputDevice_withOptions_toRoutingContext_completionHandler___block_invoke;
    v14[3] = &unk_1E3032448;
    v14[4] = v12;
    v14[5] = a6;
    -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setCompletionBlock:](v12, "setCompletionBlock:", v14);
    objc_msgSend(+[AVGlobalOperationQueue defaultQueue](AVGlobalOperationQueue, "defaultQueue"), "enqueueOperation:", v12);
  }
  if ((v11 & 1) == 0)
  {
    v13 = objc_alloc_init(AVOutputContextDestinationChange);
    -[AVOutputContextDestinationChange markAsFailed](v13, "markAsFailed");
    (*((void (**)(id, AVOutputContextDestinationChange *))a6 + 2))(a6, v13);

  }
}

uint64_t __119__AVFigEndpointFigRoutingContextOutputDeviceTranslator_addOutputDevice_withOptions_toRoutingContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "result"));
}

- (void)removeOutputDevice:(id)a3 withOptions:(__CFDictionary *)a4 fromRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6
{
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v10;
  AVOutputContextDestinationChange *v11;
  _QWORD v12[6];
  CFTypeRef v13;

  v13 = 0;
  if (AVOutputDeviceGetFigEndpoint(a3, &v13) && v13)
  {
    v10 = AVMakeRemoveEndpointOperation(a5, v13, a4, self->_useRouteConfigUpdatedNotification);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __124__AVFigEndpointFigRoutingContextOutputDeviceTranslator_removeOutputDevice_withOptions_fromRoutingContext_completionHandler___block_invoke;
    v12[3] = &unk_1E3032448;
    v12[4] = v10;
    v12[5] = a6;
    -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setCompletionBlock:](v10, "setCompletionBlock:", v12);
    objc_msgSend(+[AVGlobalOperationQueue defaultQueue](AVGlobalOperationQueue, "defaultQueue"), "enqueueOperation:", v10);
  }
  else
  {
    v11 = objc_alloc_init(AVOutputContextDestinationChange);
    -[AVOutputContextDestinationChange markAsFailed](v11, "markAsFailed");
    (*((void (**)(id, AVOutputContextDestinationChange *))a6 + 2))(a6, v11);

  }
}

uint64_t __124__AVFigEndpointFigRoutingContextOutputDeviceTranslator_removeOutputDevice_withOptions_fromRoutingContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "result"));
}

- (id)predictedOutputDeviceFromRoutingContext:(OpaqueFigRoutingContext *)a3
{
  return 0;
}

@end
