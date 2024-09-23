@implementation FigVideoLayer

- (void)_setupInternalFigVideoLayer
{
  self->_videoLayer->isPresentationLayer = 0;
  self->_videoLayer->visible = 0;
  self->_videoLayer->serializationMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  self->_videoLayer->notificationSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.videolayer.notificationqueue", 0);
}

- (FigVideoLayer)initWithDeferredTransaction:(OpaqueFigDeferredTransaction *)a3
{
  const void *v3;
  FigVideoLayerInternal *v5;
  objc_super v7;
  CFTypeRef cf;

  v3 = a3;
  cf = 0;
  if (!a3)
  {
    if (FigDeferredTransactionCreate(*MEMORY[0x1E0C9AE00], (uint64_t *)&cf))
      goto LABEL_11;
    v3 = cf;
  }
  v7.receiver = self;
  v7.super_class = (Class)FigVideoLayer;
  self = -[FigThreadSafeCALayer initWithDeferredTransaction:](&v7, sel_initWithDeferredTransaction_, v3);
  if (!self)
    goto LABEL_7;
  v5 = objc_alloc_init(FigVideoLayerInternal);
  self->_videoLayer = v5;
  if (v5)
  {
    CFRetain(v5);
    -[FigVideoLayer _setupTraceLevel](self, "_setupTraceLevel");
    FBLSupportAppendDeferredTransactionChangeToSetAllowsDisplayCompositing(v3, self, 1, (uint64_t)"-[FigVideoLayer initWithDeferredTransaction:]");
    -[FigVideoLayer _setupInternalFigVideoLayer](self, "_setupInternalFigVideoLayer");
    goto LABEL_7;
  }
  if (!FigSignalErrorAt())
  {
LABEL_7:
    if (cf)
    {
      FigDeferredTransactionCommit((uint64_t)cf);
      CFRelease(cf);
    }
    return self;
  }
LABEL_11:

  if (cf)
    CFRelease(cf);
  return 0;
}

- (FigVideoLayer)initWithoutDeferredTransaction
{
  FigVideoLayer *v2;
  FigVideoLayerInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigVideoLayer;
  v2 = -[FigThreadSafeCALayer initWithoutDeferredTransaction](&v5, sel_initWithoutDeferredTransaction);
  if (v2)
  {
    v3 = objc_alloc_init(FigVideoLayerInternal);
    v2->_videoLayer = v3;
    if (v3)
    {
      CFRetain(v3);
      -[FigVideoLayer _setupTraceLevel](v2, "_setupTraceLevel");
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      if (!pthread_main_np())
        objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[FigVideoLayer setAllowsDisplayCompositing:](v2, "setAllowsDisplayCompositing:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      -[FigVideoLayer _setupInternalFigVideoLayer](v2, "_setupInternalFigVideoLayer");
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (FigVideoLayer)initWithLayer:(id)a3
{
  FigVideoLayer *v5;
  FigVideoLayerInternal *v6;
  objc_super v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)FigVideoLayer;
  v5 = -[FigVideoLayer initWithLayer:](&v8, sel_initWithLayer_, a3);
  if (v5)
  {
    v6 = objc_alloc_init(FigVideoLayerInternal);
    v5->_videoLayer = v6;
    if (v6)
    {
      CFRetain(v6);
      v5->_videoLayer->isPresentationLayer = 1;
      v5->_videoLayer->visible = 0;
      return v5;
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  FigVideoLayerInternal *videoLayer;
  FigVideoLayerInternal *v4;
  objc_super v5;

  videoLayer = self->_videoLayer;
  if (videoLayer->serializationMutex)
  {
    FigSimpleMutexDestroy();
    videoLayer = self->_videoLayer;
  }
  if (videoLayer->notificationSerialQueue
    && (dispatch_release((dispatch_object_t)videoLayer->notificationSerialQueue), (videoLayer = self->_videoLayer) == 0))
  {
    v4 = 0;
  }
  else
  {
    CFRelease(videoLayer);
    v4 = self->_videoLayer;
  }

  v5.receiver = self;
  v5.super_class = (Class)FigVideoLayer;
  -[FigVideoLayer dealloc](&v5, sel_dealloc);
}

- (id)actionForKey:(id)a3
{
  return 0;
}

+ (id)defaultActionForKey:(id)a3
{
  return 0;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  FigVideoLayerInternal *videoLayer;
  NSObject *notificationSerialQueue;
  objc_super v7;
  _QWORD block[5];

  v3 = a3;
  videoLayer = self->_videoLayer;
  if (!videoLayer->isPresentationLayer)
  {
    MEMORY[0x19402EEEC](videoLayer->serializationMutex, a2);
    self->_videoLayer->visible = v3;
    MEMORY[0x19402EF04](self->_videoLayer->serializationMutex);
    notificationSerialQueue = self->_videoLayer->notificationSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__FigVideoLayer_layerDidBecomeVisible___block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = self;
    dispatch_async(notificationSerialQueue, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)FigVideoLayer;
  -[FigVideoLayer layerDidBecomeVisible:](&v7, sel_layerDidBecomeVisible_, v3);
}

uint64_t __39__FigVideoLayer_layerDidBecomeVisible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendVideoLayerIsBeingServicedNotification");
}

- (BOOL)isVideoLayerBeingServiced
{
  FigVideoLayer *v2;
  FigVideoLayerInternal *videoLayer;

  v2 = self;
  MEMORY[0x19402EEEC](self->_videoLayer->serializationMutex, a2);
  videoLayer = v2->_videoLayer;
  LOBYTE(v2) = videoLayer->visible;
  MEMORY[0x19402EF04](videoLayer->serializationMutex);
  return (char)v2;
}

- (id)layerDisplayName
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_videoLayer->visible)
    return 0;
  v2 = (void *)objc_msgSend((id)-[FigVideoLayer context](self, "context"), "options");
  v3 = (void *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CD2A18]);
  if (v3)
  {
    v4 = objc_msgSend(v3, "unsignedIntValue");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CD2728], "displays", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v4 == objc_msgSend(v10, "displayId"))
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            goto LABEL_5;
          goto LABEL_14;
        }
      }
      result = (id)objc_msgSend(v10, "name");
      if (result)
        return result;
    }
  }
LABEL_14:
  result = (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CD2A20]);
  if (!result)
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay"), "name");
  return result;
}

- (void)notificationBarrier
{
  NSObject *notificationSerialQueue;

  notificationSerialQueue = self->_videoLayer->notificationSerialQueue;
  if (notificationSerialQueue)
    dispatch_sync(notificationSerialQueue, &__block_literal_global_88);
}

- (void)_sendVideoLayerIsBeingServicedNotification
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
}

@end
