@implementation AVPlayerItemSampleBufferOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVPlayerItemSampleBufferOutput)init
{
  return -[AVPlayerItemSampleBufferOutput initWithConfiguration:](self, "initWithConfiguration:", 0);
}

- (AVPlayerItemSampleBufferOutput)initWithConfiguration:(id)a3
{
  AVPlayerItemSampleBufferOutput *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerItemSampleBufferOutput;
  v4 = -[AVPlayerItemOutput init](&v7, sel_init);
  if (v4)
  {
    v4->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create("AVPlayerItemSampleBufferOutput state", 0);
    v4->_weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v4);
    v4->_delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
    objc_msgSend(a3, "advanceIntervalForDataAvailability");
    v4->_advanceInterval = v5;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *stateQueue;
  objc_super v4;

  if (self->_figPlaybackItem)
  {
    -[AVPlayerItemSampleBufferOutput _removeFigPlaybackItemListeners](self, "_removeFigPlaybackItemListeners");
    CFRelease(self->_figPlaybackItem);
  }

  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemSampleBufferOutput;
  -[AVPlayerItemOutput dealloc](&v4, sel_dealloc);
}

- (void)_addFigPlaybackItemListeners
{
  id v3;
  id v4;

  if (self->_figPlaybackItem)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVPlayerItemSampleBufferOutput _weakReference](self, "_weakReference");
    CFRetain(v4);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, figPlaybackItemTrackSampleBufferDidBecomeAvailable, *MEMORY[0x1E0CC4DF8], self->_figPlaybackItem, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, figPlaybackItemTrackResetSampleBufferExtraction, *MEMORY[0x1E0CC4DF0], self->_figPlaybackItem, 0);
  }
}

- (void)_removeFigPlaybackItemListeners
{
  id v3;
  id v4;

  if (self->_figPlaybackItem)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVPlayerItemSampleBufferOutput _weakReference](self, "_weakReference");
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, figPlaybackItemTrackSampleBufferDidBecomeAvailable, *MEMORY[0x1E0CC4DF8], self->_figPlaybackItem);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, figPlaybackItemTrackResetSampleBufferExtraction, *MEMORY[0x1E0CC4DF0], self->_figPlaybackItem);
    CFRelease(self->_weakReference);
  }
}

- (id)_weakReference
{
  return self->_weakReference;
}

- (OpaqueFigPlaybackItem)_figPlaybackItem
{
  return self->_figPlaybackItem;
}

- (void)_setFigPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  OpaqueFigPlaybackItem *figPlaybackItem;
  OpaqueFigPlaybackItem *v6;

  figPlaybackItem = self->_figPlaybackItem;
  if (figPlaybackItem != a3)
  {
    if (figPlaybackItem)
    {
      -[AVPlayerItemSampleBufferOutput _removeFigPlaybackItemListeners](self, "_removeFigPlaybackItemListeners");
      CFRelease(self->_figPlaybackItem);
    }
    if (a3)
      v6 = (OpaqueFigPlaybackItem *)CFRetain(a3);
    else
      v6 = 0;
    self->_figPlaybackItem = v6;
    -[AVPlayerItemSampleBufferOutput _addFigPlaybackItemListeners](self, "_addFigPlaybackItemListeners");
  }
}

- (id)_weakReferenceToPlayerItemTrack
{
  return self->_weakReferenceToPlayerItemTrack;
}

- (opaqueCMSampleBuffer)copyNextSampleBufferForTrackID:(int)a3 flags:(unsigned int *)a4
{
  OpaqueFigPlaybackItem *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(OpaqueFigPlaybackItem *, uint64_t, uint64_t, opaqueCMSampleBuffer **);
  opaqueCMSampleBuffer *v11;

  if (self->_trackID != a3)
    return 0;
  v11 = 0;
  v6 = -[AVPlayerItemSampleBufferOutput _figPlaybackItem](self, "_figPlaybackItem");
  v7 = -[AVPlayerItemSampleBufferOutput _trackID](self, "_trackID");
  v8 = -[AVPlayerItemSampleBufferOutput _extractionID](self, "_extractionID");
  v9 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, uint64_t, opaqueCMSampleBuffer **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                 + 168);
  if (v9)
    v9(v6, v7, v8, &v11);
  if (a4)
    *a4 = 0;
  return v11;
}

- (void)_figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID:(int)a3 extractionID:(int)a4
{
  void *v7;
  NSObject *stateQueue;
  _QWORD block[5];

  v7 = (void *)MEMORY[0x1940343FC](self, a2);
  if (*(_QWORD *)&self->_trackID == __PAIR64__(a4, a3))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID_extractionID___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_sync(stateQueue, block);
  }
  objc_autoreleasePoolPop(v7);
}

uint64_t __109__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID_extractionID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __109__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID_extractionID___block_invoke_2;
  v4[3] = &unk_1E3032B48;
  v4[4] = v1;
  return objc_msgSend(v2, "invokeDelegateCallbackWithBlock:", v4);
}

uint64_t __109__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID_extractionID___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "outputMediaDataAvailable:trackID:", *(_QWORD *)(v3 + 32), *(unsigned int *)(*(_QWORD *)(v3 + 32) + 56));
  }
  return result;
}

- (void)_figPlaybackItemTrackOutputSequenceWasFlushedForTrackID:(int)a3 extractionID:(int)a4
{
  NSObject *stateQueue;
  _QWORD block[5];

  if (self->_trackID == a3 && self->_extractionID == a4)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackOutputSequenceWasFlushedForTrackID_extractionID___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_sync(stateQueue, block);
  }
}

uint64_t __103__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackOutputSequenceWasFlushedForTrackID_extractionID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __103__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackOutputSequenceWasFlushedForTrackID_extractionID___block_invoke_2;
  v4[3] = &unk_1E3032B48;
  v4[4] = v1;
  return objc_msgSend(v2, "invokeDelegateCallbackWithBlock:", v4);
}

uint64_t __103__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackOutputSequenceWasFlushedForTrackID_extractionID___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "outputSequenceWasFlushed:trackID:", *(_QWORD *)(v3 + 32), *(unsigned int *)(*(_QWORD *)(v3 + 32) + 56));
  }
  return result;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;

  if (a4)
    v8 = 1;
  else
    v8 = a3 == 0;
  if (!v8)
    a4 = (id)MEMORY[0x1E0C80D38];
  if (a3)
  {
    if (!a4)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99778];
      v11 = "newDelegateQueue != NULL";
      goto LABEL_12;
    }
  }
  else if (a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "newDelegateQueue == NULL";
LABEL_12:
    v12 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v11), 0);
    objc_exception_throw(v12);
  }
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_delegateStorage, "setDelegate:queue:");
}

- (AVPlayerItemSampleBufferOutputDelegate)delegate
{
  return (AVPlayerItemSampleBufferOutputDelegate *)-[AVWeakReferencingDelegateStorage delegate](self->_delegateStorage, "delegate");
}

- (OS_dispatch_queue)delegateQueue
{
  return -[AVWeakReferencingDelegateStorage delegateQueue](self->_delegateStorage, "delegateQueue");
}

- (void)_attachToPlayerItemTrack:(id)a3 figPlaybackItem:(OpaqueFigPlaybackItem *)a4
{
  NSObject *stateQueue;
  _QWORD block[7];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__AVPlayerItemSampleBufferOutput_AVPlayerItemSampleBufferOutput_Internal___attachToPlayerItemTrack_figPlaybackItem___block_invoke;
  block[3] = &unk_1E302FEE0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(stateQueue, block);
}

uint64_t __116__AVPlayerItemSampleBufferOutput_AVPlayerItemSampleBufferOutput_Internal___attachToPlayerItemTrack_figPlaybackItem___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setFigPlaybackItem:", *(_QWORD *)(a1 + 48));
}

- (void)_detachFromPlayerItemTrack
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__AVPlayerItemSampleBufferOutput_AVPlayerItemSampleBufferOutput_Internal___detachFromPlayerItemTrack__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __101__AVPlayerItemSampleBufferOutput_AVPlayerItemSampleBufferOutput_Internal___detachFromPlayerItemTrack__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_setFigPlaybackItem:", 0);
}

- (int)_trackID
{
  return self->_trackID;
}

- (void)_setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (int)_extractionID
{
  return self->_extractionID;
}

- (void)_setExtractionID:(int)a3
{
  self->_extractionID = a3;
}

- (double)_advanceInterval
{
  return self->_advanceInterval;
}

@end
