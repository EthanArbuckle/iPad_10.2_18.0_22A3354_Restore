@implementation AVPlayer

id __23__AVPlayer_currentItem__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __18__AVPlayer_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 160);
  return result;
}

uint64_t __48__AVPlayer__setPendingFigPlayerProperty_forKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[4];
  v3 = *(void **)(*(_QWORD *)(a1[5] + 8) + 208);
  if (v2)
    return objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
  else
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
}

__n128 __48__AVPlayer__cachedPresentationSizeOfCurrentItem__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 504);
  result = *v1;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *v1;
  return result;
}

void __84__AVPlayer__updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression__block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "currentItem");
  v3 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFigPlayer");
  if (v2)
  {
    v4 = objc_msgSend(v2, "_preferredPixelBufferAttributes");
    v5 = objc_msgSend(v2, "_suppressesVideoLayers");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "setRequestedPixelBufferAttributes:forKey:", v4, CFSTR("currentItem"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "setLayersAreSuppressed:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "removeRequestedPixelBufferAttributesAttributesForKey:", CFSTR("currentItem"));
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateDecoderPixelBufferAttributes:onFigPlayer:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "mediatedPixelBufferAttributes"), v3);
  if (v3)
    CFRelease(v3);
}

- (void)_updateDecoderPixelBufferAttributes:(id)a3 onFigPlayer:(OpaqueFigPlayer *)a4
{
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, id);

  if (a4)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v6(FigBaseObject, *MEMORY[0x1E0CC59B0], a3);
  }
}

- (void)_updateClosedCaptionLayerBounds:(id)a3 videoRelativeToViewport:(const CGRect *)a4 captionsAvoidanceMargins:(const NSEdgeInsets *)a5
{
  OpaqueFigPlayer *v9;
  void *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  CFNumberRef v13;
  CFDictionaryRef DictionaryRepresentation;
  void *v15;
  void *v16;
  uint64_t FigBaseObject;
  void (*v18)(uint64_t, _QWORD, void *);
  CFIndex valuePtr[2];
  CFRange v20;
  CGRect v21;

  v9 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v10 = (void *)MEMORY[0x1940343FC]();
  if (!a3 || !v9)
  {
    if (!v9)
      goto LABEL_32;
    goto LABEL_31;
  }
  valuePtr[0] = 0;
  v11 = -[AVPlayer _closedCaptionLayers](self, "_closedCaptionLayers");
  if (v11
    && (v12 = v11,
        v20.length = CFArrayGetCount(v11),
        v20.location = 0,
        valuePtr[0] = CFArrayGetFirstIndexOfValue(v12, v20, a3),
        valuePtr[0] < 0))
  {
    a4 = 0;
    DictionaryRepresentation = 0;
    v13 = 0;
  }
  else
  {
    v13 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberCFIndexType, valuePtr);
    if (!v13)
    {
      DictionaryRepresentation = 0;
      goto LABEL_27;
    }
    objc_msgSend(a3, "bounds");
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v21);
    if (!DictionaryRepresentation)
      goto LABEL_27;
    if (!a4 || (a4 = (const CGRect *)CGRectCreateDictionaryRepresentation(*a4)) != 0)
    {
      if (!a5
        || (FigGeometryDimensionMake(),
            FigGeometryDimensionMake(),
            FigGeometryDimensionMake(),
            FigGeometryDimensionMake(),
            FigGeometryMarginsMake(),
            (a5 = (const NSEdgeInsets *)FigGeometryMarginsCopyAsDictionary()) != 0))
      {
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E0CC5648], DictionaryRepresentation, *MEMORY[0x1E0CC5638], 0);
        if (v15)
        {
          v16 = v15;
          if (a4)
            objc_msgSend(v15, "setObject:forKey:", a4, *MEMORY[0x1E0CC5650]);
          if (a5)
            objc_msgSend(v16, "setObject:forKey:", a5, *MEMORY[0x1E0CC5640]);
          FigBaseObject = FigPlayerGetFigBaseObject();
          v18 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
          if (v18)
            v18(FigBaseObject, *MEMORY[0x1E0CC5978], v16);
        }
        if (a5)
        {
          CFRelease(a5);
          if (!a4)
            goto LABEL_27;
          goto LABEL_26;
        }
      }
    }
  }
  if (a4)
LABEL_26:
    CFRelease(a4);
LABEL_27:
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  if (v13)
    CFRelease(v13);
LABEL_31:
  CFRelease(v9);
LABEL_32:
  objc_autoreleasePoolPop(v10);
}

void __51__AVPlayer__evaluateDisplaySizeOfAllAttachedLayers__block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, CFDictionaryRef);

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFigPlayer");
  objc_msgSend(*(id *)(a1 + 32), "_maximumAVPlayerLayerDisplaySize");
  if (v2)
  {
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)&v3);
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, *MEMORY[0x1E0CC5B08], DictionaryRepresentation);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
    CFRelease(v2);
  }
}

- (OpaqueFigPlayer)_copyFigPlayer
{
  NSObject *ivarAccessQueue;
  OpaqueFigPlayer *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__AVPlayer__copyFigPlayer__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (OpaqueFigPlayer *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CGSize)_maximumAVPlayerLayerDisplaySize
{
  double v2;
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v17;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = -[AVPlayer _avPlayerLayers](self, "_avPlayerLayers", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    v8 = v3;
    v9 = v2;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "_displaySize");
        v13 = v12;
        v15 = v14;
        if (objc_msgSend(v11, "context"))
        {
          if (v13 != v2 || v15 != v3)
          {
            objc_msgSend(v11, "opacity");
            if (v17 != 0.0 && v13 * v15 > v8 * v9)
            {
              v8 = v15;
              v9 = v13;
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }
  else
  {
    v8 = v3;
    v9 = v2;
  }
  v19 = v9;
  v20 = v8;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)_avPlayerLayers
{
  NSObject *layersQ;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayer__avPlayerLayers__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CGSize)_cachedPresentationSizeOfCurrentItem
{
  NSObject *ivarAccessQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1935931BF;
  v12 = *MEMORY[0x1E0C9D820];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__AVPlayer__cachedPresentationSizeOfCurrentItem__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_evaluateDisplaySizeOfAllAttachedLayers
{
  NSObject *layerInteractionQueue;
  _QWORD block[5];

  layerInteractionQueue = self->_player->layerInteractionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVPlayer__evaluateDisplaySizeOfAllAttachedLayers__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(layerInteractionQueue, block);
}

- (AVPlayerItem)currentItem
{
  NSObject *ivarAccessQueue;
  AVPlayerItem *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__AVPlayer_currentItem__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (AVPlayerItem *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_closedCaptionLayers
{
  NSObject *layersQ;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__AVPlayer__closedCaptionLayers__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)outputObscuredDueToInsufficientExternalProtection
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__AVPlayer_AVPlayerProtectedContentPrivate__outputObscuredDueToInsufficientExternalProtection__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)prerollOperationDidComplete:(BOOL)a3 notificationPayload:(__CFDictionary *)a4
{
  _BOOL8 v5;
  CFTypeID v7;
  const __CFNumber *Value;
  const __CFNumber *v9;
  CFTypeID v10;
  AVPlayerInternal *player;
  void (**v12)(id, _BOOL8);
  int valuePtr;

  if (a4)
  {
    v5 = a3;
    v7 = CFGetTypeID(a4);
    if (v7 == CFDictionaryGetTypeID())
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x1E0CC58B0]);
      if (Value)
      {
        v9 = Value;
        v10 = CFGetTypeID(Value);
        if (v10 == CFNumberGetTypeID())
        {
          valuePtr = 0;
          CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
          MEMORY[0x194033BF8](self->_player->prerollIDMutex);
          player = self->_player;
          if (valuePtr == player->pendingPrerollID && player->prerollCompletionHandler)
          {
            v12 = -[AVPlayer _unregisterAndReturnRetainedPrerollCompletionHandler](self, "_unregisterAndReturnRetainedPrerollCompletionHandler");
            MEMORY[0x194033C04](self->_player->prerollIDMutex);
            if (v12)
            {
              v12[2](v12, v5);

            }
          }
          else
          {
            MEMORY[0x194033C04](player->prerollIDMutex);
          }
        }
      }
    }
  }
}

- (BOOL)isMuted
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __19__AVPlayer_isMuted__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __26__AVPlayer__copyFigPlayer__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 728);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id __22__AVPlayer__rateState__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __66__AVPlayer__updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t FigBaseObject;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t result;
  uint64_t (*v11)(uint64_t, _QWORD, uint64_t);

  v2 = objc_msgSend(*(id *)(a1 + 32), "automaticallyWaitsToMinimizeStalling");
  v3 = *MEMORY[0x1E0C9AE40];
  if (v2)
    v4 = *MEMORY[0x1E0C9AE50];
  else
    v4 = *MEMORY[0x1E0C9AE40];
  v5 = *(_QWORD **)(a1 + 32);
  v6 = *MEMORY[0x1E0CC5940];
  if (*(_QWORD *)(v5[1] + 728))
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v8)
      v8(FigBaseObject, v6, v4);
    v9 = FigPlayerGetFigBaseObject();
    result = CMBaseObjectGetVTable();
    v11 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
    if (v11)
      return v11(v9, *MEMORY[0x1E0CC5920], v3);
  }
  else
  {
    objc_msgSend(v5, "_setPendingFigPlayerProperty:forKey:", v4, *MEMORY[0x1E0CC5940]);
    return objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", v3, *MEMORY[0x1E0CC5920]);
  }
  return result;
}

- (BOOL)automaticallyWaitsToMinimizeStalling
{
  return objc_msgSend(-[AVPlayer _rateState](self, "_rateState"), "automaticallyWaitsToMinimizeStalling");
}

- (AVPlayerWaitingReason)reasonForWaitingToPlay
{
  return (AVPlayerWaitingReason)objc_msgSend(-[AVPlayer _rateState](self, "_rateState"), "reasonForWaitingToPlay");
}

- (float)rate
{
  float result;

  objc_msgSend(-[AVPlayer _rateState](self, "_rateState"), "rate");
  return result;
}

- (AVPlayerTimeControlStatus)timeControlStatus
{
  return objc_msgSend(-[AVPlayer _rateState](self, "_rateState"), "timeControlStatus");
}

- (id)_rateState
{
  NSObject *ivarAccessQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__AVPlayer__rateState__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v7;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_DWORD *)(v3 + 496) + 1;
  *(_DWORD *)(v3 + 496) = v4;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488), "rateStateBySettingRate:nameForLogging:", *(_QWORD *)(a1 + 40), a2), "rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:hasCurrentInterstitialEvent:nameForLogging:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176) != 0, *(unsigned __int8 *)(a1 + 60), *(_QWORD *)(a1 + 40));
  if (dword_1ECDECF38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7 = v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488) = v5;
}

- (void)_setCurrentItem:(id)a3
{
  AVPlayerItem *currentItem;
  AVPlayerItem *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v8;
  NSObject *configurationQueue;
  _QWORD block[7];
  os_log_type_t type;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  currentItem = self->_player->currentItem;
  if (currentItem != a3)
  {
    v6 = currentItem;
    if (dword_1ECDECF38)
    {
      v12 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v8 = a3;

    self->_player->currentItem = (AVPlayerItem *)a3;
    configurationQueue = self->_player->configurationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__AVPlayer__setCurrentItem___block_invoke;
    block[3] = &unk_1E302FD88;
    block[4] = v6;
    block[5] = self;
    block[6] = a3;
    dispatch_async(configurationQueue, block);
  }
}

uint64_t __27__AVPlayer__nameForLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nameForLogging_fromIvarAccessQueue"), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_nameForLogging_fromIvarAccessQueue
{
  if (self->_player->loggingIdentifier)
    return (id)-[AVLoggingIdentifier name](self->_player->loggingIdentifier, "name");
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
}

- (void)setRate:(float)rate
{
  __int128 v3;
  uint64_t v4;

  v3 = *MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[AVPlayer _setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:](self, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v3, 0, 23, 1);
}

- (void)_setRate:(float)a3 withVolumeRampDuration:(id *)a4 playImmediately:(BOOL)a5 rateChangeReason:(int)a6 affectsCoordinatedPlayback:(BOOL)a7
{
  NSObject *stateDispatchQueue;
  void (*v13[5])(_QWORD);
  __int128 v14;
  int64_t var3;
  int v16;
  BOOL v17;
  BOOL v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;

  v19 = *a4;
  if (-[AVPlayer _handleSetRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:](self, "_handleSetRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v19))
  {
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v13[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v13[1] = (void (*)(_QWORD))3221225472;
    v13[2] = __104__AVPlayer__setRate_withVolumeRampDuration_playImmediately_rateChangeReason_affectsCoordinatedPlayback___block_invoke;
    v13[3] = (void (*)(_QWORD))&unk_1E30317A8;
    v13[4] = (void (*)(_QWORD))self;
    v14 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v17 = a5;
    v16 = a6;
    v18 = a7;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v13);
  }
}

- (BOOL)_setRate:(float)a3 rateChangeReason:(int)a4 figPlayerSetRateHandler:(id)a5
{
  uint64_t v6;
  BOOL v9;
  id v10;
  NSObject *ivarAccessQueue;
  uint64_t v12;
  NSObject *figConfigurationQueue;
  id v14;
  char v15;
  _QWORD v17[9];
  _QWORD block[7];
  float v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  char __dst[8];

  v6 = *(_QWORD *)&a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v9 = -[AVPlayer _hasCurrentInterstitialEvent](self, "_hasCurrentInterstitialEvent");
  v10 = -[AVPlayer _nameForLogging](self, "_nameForLogging");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rate"));
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("timeControlStatus"));
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke;
  block[3] = &unk_1E3031730;
  block[5] = v10;
  block[6] = &v21;
  v19 = a3;
  block[4] = self;
  v20 = v9;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    strncpy(__dst, (const char *)objc_msgSend(v10, "UTF8String"), 8uLL);
    kdebug_trace();
  }
  figConfigurationQueue = self->_player->figConfigurationQueue;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke_411;
  v17[3] = &unk_1E3031758;
  v17[6] = a5;
  v17[7] = &v21;
  v17[8] = &v25;
  v17[4] = self;
  v17[5] = v10;
  dispatch_sync(figConfigurationQueue, v17);
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rate"));
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("timeControlStatus"));
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
  v14 = -[AVPlayer _rateDidChangeNotificationPayloadForFigRateChangeReason:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForFigRateChangeReason:rateChangeIdentifier:rateChangeOriginator:", v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v22 + 6)), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVPlayerRateDidChangeNotification"), self, v14);
  v15 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  return v15;
}

- (void)_setActionAtItemEnd:(int64_t)a3 allowingAdvance:(BOOL)a4
{
  NSObject *ivarAccessQueue;
  uint64_t v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  __CFString *v10;
  OpaqueFigPlayerInterstitialCoordinator *v11;
  OpaqueFigPlayerInterstitialCoordinator *v12;
  __CFString *v13;
  void (*v14)(OpaqueFigPlayerInterstitialCoordinator *, __CFString *);
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  _QWORD v29[7];
  _QWORD v30[3];
  int v31;
  _QWORD block[6];

  if (!a3 && !a4)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    v19 = objc_msgSend(v17, "stringWithFormat:", CFSTR("AVPlayerActionAtItemEndAdvance is not allowed for a player of class %@"), NSStringFromClass(v18));
LABEL_18:
    v22 = v19;
    v23 = v15;
    v24 = v16;
    goto LABEL_20;
  }
  if (a3 == 3 && !a4)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = (objc_class *)objc_opt_class();
    v19 = objc_msgSend(v20, "stringWithFormat:", CFSTR("AVPlayerActionAtItemEndAdvanceUntilEndOfQueue is not allowed for a player of class %@"), NSStringFromClass(v21));
    goto LABEL_18;
  }
  if (!-[AVPlayer figPlayerActionForActionAtItemEnd:](self, "figPlayerActionForActionAtItemEnd:", a3))
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = (objc_class *)objc_opt_class();
    v22 = objc_msgSend(v27, "stringWithFormat:", CFSTR("%d is not a valid actionAtItemEnd for a player of class %@"), a3, NSStringFromClass(v28));
    v23 = v25;
    v24 = v26;
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v22, 0));
  }
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVPlayer__setActionAtItemEnd_allowingAdvance___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v8 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v8)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v29[0] = v7;
    v29[1] = 3221225472;
    v29[2] = __48__AVPlayer__setActionAtItemEnd_allowingAdvance___block_invoke_2;
    v29[3] = &unk_1E3031868;
    v29[4] = self;
    v29[5] = v30;
    v29[6] = v8;
    dispatch_sync(figConfigurationQueue, v29);
    _Block_object_dispose(v30, 8);
  }
  else
  {
    v10 = -[AVPlayer figPlayerActionForActionAtItemEnd:](self, "figPlayerActionForActionAtItemEnd:", a3);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v10, *MEMORY[0x1E0CC58D8]);
  }
  v11 = -[AVPlayer _copyInterstitialCoordinatorIfCreated](self, "_copyInterstitialCoordinatorIfCreated");
  if (v11)
  {
    v12 = v11;
    v13 = -[AVPlayer figPlayerActionForActionAtItemEnd:](self, "figPlayerActionForActionAtItemEnd:", -[AVPlayer actionAtItemEnd](self, "actionAtItemEnd"));
    v14 = *(void (**)(OpaqueFigPlayerInterstitialCoordinator *, __CFString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 64);
    if (v14)
      v14(v12, v13);
    CFRelease(v12);
  }
  if (v8)
    CFRelease(v8);
}

- (__CFString)figPlayerActionForActionAtItemEnd:(int64_t)a3
{
  __CFString **v3;
  __CFString *result;

  switch(a3)
  {
    case 0:
      v3 = (__CFString **)MEMORY[0x1E0CC5608];
      goto LABEL_7;
    case 1:
      v3 = (__CFString **)MEMORY[0x1E0CC5618];
      goto LABEL_7;
    case 2:
      v3 = (__CFString **)MEMORY[0x1E0CC5610];
      goto LABEL_7;
    case 3:
      v3 = (__CFString **)MEMORY[0x1E0CC5620];
LABEL_7:
      result = *v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)_hasCurrentInterstitialEvent
{
  OpaqueFigPlayerInterstitialCoordinator *v3;
  uint64_t (*v4)(OpaqueFigPlayerInterstitialCoordinator *);
  const void *v5;
  BOOL v6;

  v3 = -[AVPlayer _copyInterstitialCoordinatorIfCreated](self, "_copyInterstitialCoordinatorIfCreated");
  -[AVPlayer _nameForLogging](self, "_nameForLogging");
  if (!v3)
    return 0;
  v4 = *(uint64_t (**)(OpaqueFigPlayerInterstitialCoordinator *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 16);
  if (v4)
  {
    v5 = (const void *)v4(v3);
    v6 = v5 != 0;
    if (v5)
    {
      CFRelease(v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

- (id)_nameForLogging
{
  NSObject *ivarAccessQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayer__nameForLogging__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (OpaqueFigPlayerInterstitialCoordinator)_copyInterstitialCoordinatorIfCreated
{
  NSObject *ivarAccessQueue;
  OpaqueFigPlayerInterstitialCoordinator *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__AVPlayer_AVPlayerInterstitialSupport_Internal___copyInterstitialCoordinatorIfCreated__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (OpaqueFigPlayerInterstitialCoordinator *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_rateDidChangeNotificationPayloadForFigRateChangeReason:(int)a3 rateChangeIdentifier:(id)a4 rateChangeOriginator:(id)a5
{
  uint64_t v7;
  const __CFString *v8;

  if (a3 <= 12)
  {
    if (a3 > 3)
    {
      if (a3 == 4)
      {
        v7 = 1;
        v8 = CFSTR("AVPlayerRateDidChangeReasonPlaybackStalled");
        return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
      }
      if (a3 == 12)
      {
        v7 = 1;
        v8 = CFSTR("AVPlayerRateDidChangeReasonRouteChanged");
        return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
      }
    }
    else
    {
      if (a3 == 1)
      {
        v7 = 1;
        v8 = CFSTR("AVPlayerRateDidChangeReasonPauseAtItemEnd");
        return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
      }
      if (a3 == 2)
      {
        v7 = 0;
        v8 = CFSTR("AVPlayerRateDidChangeReasonSetRateFailed");
        return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
      }
    }
LABEL_23:
    v8 = 0;
    v7 = 1;
    return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
  }
  if (a3 <= 23)
  {
    if (a3 == 13)
    {
      v7 = 0;
      v8 = CFSTR("AVPlayerRateDidChangeReasonAudioSessionInterrupted");
      return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
    }
    if (a3 == 23)
    {
      v7 = 0;
      v8 = CFSTR("AVPlayerRateDidChangeReasonSetRateCalled");
      return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
    }
    goto LABEL_23;
  }
  if (a3 == 24)
  {
    v7 = 1;
    v8 = CFSTR("AVPlayerRateDidChangeReasonPlaybackResumed");
    return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
  }
  if (a3 == 25)
  {
    v7 = 0;
    v8 = CFSTR("AVPlayerRateDidChangeReasonAppBackgrounded");
    return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
  }
  if (a3 != 33)
    goto LABEL_23;
  v7 = 1;
  v8 = CFSTR("AVPlayerRateDidChangeReasonCoordinatedPlayback");
  return -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", v8, v7, a4, a5);
}

- (id)_rateDidChangeNotificationPayloadForAVFRateChangeReason:(id)a3 reasonIsExtendedDiagnostic:(BOOL)a4 rateChangeIdentifier:(id)a5 rateChangeOriginator:(id)a6
{
  _BOOL4 v8;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v14;

  if (!a3)
    return 0;
  v8 = a4;
  v11 = -[AVPlayer _rateDidChangeNotificationIncludesExtendedDiagnosticPayload](self, "_rateDidChangeNotificationIncludesExtendedDiagnosticPayload");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = v12;
  if (!v8 || v11)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", a3, CFSTR("AVPlayerRateDidChangeReasonKey"));
  if (a5)
    v14 = v11;
  else
    v14 = 0;
  if (v14)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", a5, CFSTR("AVPlayerRateDidChangeRateChangeIdentifierKey"));
  if (a6)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(-[AVPlayer _playbackCoordinatorWithoutTriggeringFullSetup](self, "_playbackCoordinatorWithoutTriggeringFullSetup"), "participantForIdentifier:", a6), CFSTR("AVPlayerRateDidChangeOriginatingParticipantKey"));
  return v13;
}

- (BOOL)_rateDidChangeNotificationIncludesExtendedDiagnosticPayload
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__AVPlayer__rateDidChangeNotificationIncludesExtendedDiagnosticPayload__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVPlayer_isExternalPlaybackActive__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_BYTE *)(v1 + 466))
    v2 = 1;
  else
    v2 = *(_BYTE *)(v1 + 469) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

CFTypeRef __87__AVPlayer_AVPlayerInterstitialSupport_Internal___copyInterstitialCoordinatorIfCreated__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 264);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __48__AVPlayer__setActionAtItemEnd_allowingAdvance___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 368) = *(_QWORD *)(result + 40);
  return result;
}

void __65__AVPlayer__noteNewNonForcedSubtitleDisplayEnabledForPlayerItem___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  char v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "currentItem");
  if (*(void **)(a1 + 40) == v2)
  {
    v3 = objc_msgSend(v2, "isNonForcedSubtitleDisplayEnabled");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(*(_QWORD *)(v4 + 8) + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__AVPlayer__noteNewNonForcedSubtitleDisplayEnabledForPlayerItem___block_invoke_2;
    v6[3] = &unk_1E302FD38;
    v6[4] = v4;
    v7 = v3;
    av_readwrite_dispatch_queue_write(v5, v6);
  }
}

id __78__AVPlayer_AVPlayerInterstitialSupport_Internal___interstitialPlayerIfCreated__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 248);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __38__AVPlayer_setAllowsExternalPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 407) = *(_BYTE *)(result + 40);
  return result;
}

__n128 __50__AVPlayer__noteNewPresentationSizeForPlayerItem___block_invoke_2(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 504) = result;
  return result;
}

uint64_t __91__AVPlayer_AVPlayerAutomaticMediaSelection__setAppliesMediaSelectionCriteriaAutomatically___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 397) = *(_BYTE *)(result + 40);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfRate
{
  return 0;
}

uint64_t __22__AVPlayer__addLayer___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = addObjectToArray(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 656), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = addObjectToArray(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 672), *(_QWORD *)(a1 + 48));
  result = addObjectToArray(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 664), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = result;
  if (*(_QWORD *)(a1 + 64))
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 680), "containsObject:");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(a1 + 64), "_willManageSublayersAsSwappedLayers");
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 680), "addObject:", *(_QWORD *)(a1 + 64));
    }
  }
  return result;
}

id __27__AVPlayer__avPlayerLayers__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 680), "allObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __77__AVPlayer_AVPlayerSupportForMediaPlayer___isConnectedToPhysicalSecondScreen__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 469);
  return result;
}

id __44__AVPlayer__pendingFigPlayerPropertyForKey___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 208), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __38__AVPlayer_isDisplayingClosedCaptions__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 465);
  return result;
}

float __23__AVPlayer_defaultRate__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 500);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __71__AVPlayer__rateDidChangeNotificationIncludesExtendedDiagnosticPayload__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 616);
  return result;
}

uint64_t __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 496);
  return result;
}

id __24__AVPlayer__videoLayers__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 656));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __27__AVPlayer__subtitleLayers__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 664));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __32__AVPlayer__closedCaptionLayers__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 672));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)pause
{
  double v2;

  LODWORD(v2) = 0;
  -[AVPlayer setRate:](self, "setRate:", v2);
}

uint64_t __19__AVPlayer_isMuted__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 395);
  return result;
}

uint64_t __41__AVPlayer__externalPlaybackVideoGravity__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 360), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_removePropertyObserversOfCurrentItemCalledOnStateDispatchQueueChecked:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3), "removeObserver:", self->_player->currentItemSuppressesVideoLayersNotificationToken);

  self->_player->currentItemSuppressesVideoLayersNotificationToken = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_player->currentItemPreferredPixelBufferAttributesNotificationToken);

  self->_player->currentItemPreferredPixelBufferAttributesNotificationToken = 0;
}

- (void)dealloc
{
  AVPlayerInternal *player;
  AVPlayerInternal *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  AVPlayerInternal *v6;
  uint64_t FigBaseObject;
  uint64_t v8;
  void (*v9)(uint64_t);
  AVPlayerInternal *v10;
  __CFDictionary *videoTargetsForInterstitialPlayer;
  AVPlayerInternal *v12;
  OpaqueCMTimebase *proxyTimebase;
  AVPlayerInternal *v14;
  NSObject *layersQ;
  AVPlayerInternal *v16;
  OpaqueFigPlayer *figPlayer;
  OpaqueCMClock *figSourceClock;
  AVPlayerInternal *v19;
  NSObject *stateDispatchQueue;
  NSObject *figConfigurationQueue;
  NSObject *layerInteractionQueue;
  NSObject *ivarAccessQueue;
  NSObject *currentItemPropertyUpdateQueue;
  NSObject *configurationQueue;
  AVPlayerInternal *v26;
  OpaqueFigPlayerInterstitialCoordinator *interstitialEventCoordinator;
  objc_super v28;

  player = self->_player;
  if (player)
  {
    player->fullyInitializedAndNotDeallocating = 0;
    v4 = self->_player;
    if (v4->didFinishSuspensionNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_player->didFinishSuspensionNotificationToken);

      v4 = self->_player;
    }
    if (v4->didEnterBackgroundNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_player->didEnterBackgroundNotificationToken);

      v4 = self->_player;
    }
    if (v4->willEnterForegroundNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_player->willEnterForegroundNotificationToken);

      v4 = self->_player;
    }
    if (v4->layerForegroundingChangeToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_player->layerForegroundingChangeToken);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self->_player->IAPDCallbackToken, CFSTR("com.apple.iapd.notify.extendedMode"), 0);
    objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "unregisterCallbackContextForToken:", self->_player->IAPDCallbackToken);
    -[AVPlayer _removeFPListeners](self, "_removeFPListeners");
    -[AVPlayer _removePropertyObserversOfCurrentItemCalledOnStateDispatchQueueChecked:](self, "_removePropertyObserversOfCurrentItemCalledOnStateDispatchQueueChecked:", self->_player->currentItem);
    -[AVPlayer _removeAllLayers](self, "_removeAllLayers");
    -[AVPlayer _removeListenersFromInterstitialCoordinator:](self, "_removeListenersFromInterstitialCoordinator:", self->_player->interstitialEventCoordinator);
    v6 = self->_player;
    if (v6->figPlayer)
    {
      if (v6->IOwnTheFigPlayer)
      {
        FigBaseObject = FigPlayerGetFigBaseObject();
        if (FigBaseObject)
        {
          v8 = FigBaseObject;
          v9 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
          if (v9)
            v9(v8);
        }
      }
    }

    v10 = self->_player;
    videoTargetsForInterstitialPlayer = v10->videoTargetsForInterstitialPlayer;
    if (videoTargetsForInterstitialPlayer)
    {
      CFRelease(videoTargetsForInterstitialPlayer);
      v10 = self->_player;
    }

    v12 = self->_player;
    proxyTimebase = v12->proxyTimebase;
    if (proxyTimebase)
    {
      CFRelease(proxyTimebase);
      v12 = self->_player;
    }
    if (v12->currentItemSuppressesVideoLayersNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_player->currentItemSuppressesVideoLayersNotificationToken);

      v12 = self->_player;
    }
    if (v12->currentItemPreferredPixelBufferAttributesNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_player->currentItemPreferredPixelBufferAttributesNotificationToken);

      v12 = self->_player;
    }

    v14 = self->_player;
    layersQ = v14->layersQ;
    if (layersQ)
    {
      dispatch_release(layersQ);
      v14 = self->_player;
    }

    v16 = self->_player;
    figPlayer = v16->figPlayer;
    if (figPlayer)
    {
      CFRelease(figPlayer);
      v16 = self->_player;
    }
    figSourceClock = v16->figSourceClock;
    if (figSourceClock)
    {
      CFRelease(figSourceClock);
      v16 = self->_player;
    }

    if (self->_player->prerollCompletionHandler)
      NSLog(&CFSTR("AVPlayer %p deallocated while a pending preroll is still in progress; leaking completion handler. Use -cancelPe"
               "ndingPrerolls to deallocate an AVPlayer safely while a preroll is still pending.").isa,
        self);
    FigSimpleMutexDestroy();
    v19 = self->_player;
    stateDispatchQueue = v19->stateDispatchQueue;
    if (stateDispatchQueue)
    {
      dispatch_release(stateDispatchQueue);
      v19 = self->_player;
    }
    figConfigurationQueue = v19->figConfigurationQueue;
    if (figConfigurationQueue)
    {
      dispatch_release(figConfigurationQueue);
      v19 = self->_player;
    }
    layerInteractionQueue = v19->layerInteractionQueue;
    if (layerInteractionQueue)
    {
      dispatch_release(layerInteractionQueue);
      v19 = self->_player;
    }
    ivarAccessQueue = v19->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      v19 = self->_player;
    }
    currentItemPropertyUpdateQueue = v19->currentItemPropertyUpdateQueue;
    if (currentItemPropertyUpdateQueue)
    {
      dispatch_release(currentItemPropertyUpdateQueue);
      v19 = self->_player;
    }
    configurationQueue = v19->configurationQueue;
    if (configurationQueue)
    {
      dispatch_release(configurationQueue);
      v19 = self->_player;
    }

    v26 = self->_player;
    interstitialEventCoordinator = v26->interstitialEventCoordinator;
    if (interstitialEventCoordinator)
    {
      CFRelease(interstitialEventCoordinator);
      v26 = self->_player;
    }

  }
  v28.receiver = self;
  v28.super_class = (Class)AVPlayer;
  -[AVPlayer dealloc](&v28, sel_dealloc);
}

- (void)_removeFPListeners
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_player->figPlayer)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVPlayer _weakReference](self, "_weakReference");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[AVPlayer _fpNotificationNames](self, "_fpNotificationNames", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, avplayer_fpNotificationCallback, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), self->_player->figPlayer);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

void __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD block[5];
  _QWORD v9[5];
  __int128 v10;
  char v11;
  __int128 v12;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(*(id *)(a1 + 32), "currentItem");
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    if (!objc_msgSend(v2, "_isReadyForInspectionOfPresentationSize"))
      return;
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isNonForcedSubtitleDisplayEnabled");
    v12 = *MEMORY[0x1E0C9D820];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_getCachedPresentationSize:", &v12);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(*(_QWORD *)(v4 + 8) + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke_2;
    v9[3] = &unk_1E3031410;
    v9[4] = v4;
    v10 = v12;
    v11 = v3;
    v6 = v9;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(*(_QWORD *)(v7 + 8) + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke_3;
    block[3] = &unk_1E302FA10;
    block[4] = v7;
    v6 = block;
  }
  av_readwrite_dispatch_queue_write(v5, v6);
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)preventsDisplaySleepDuringVideoPlayback
{
  NSObject *ivarAccessQueue;
  void (*v5)(_QWORD);
  NSObject *stateDispatchQueue;
  void (*v7[5])(_QWORD);
  _QWORD block[5];
  BOOL v9;

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__AVPlayer_AVPlayerVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v9 = preventsDisplaySleepDuringVideoPlayback;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v7[0] = v5;
  v7[1] = (void (*)(_QWORD))3221225472;
  v7[2] = __92__AVPlayer_AVPlayerVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke_2;
  v7[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v7[4] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v7);
}

void __92__AVPlayer_AVPlayerVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke_2(uint64_t a1)
{
  const void *v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, uint64_t);

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFigPlayer");
  v3 = objc_msgSend(*(id *)(a1 + 32), "preventsDisplaySleepDuringVideoPlayback");
  v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  if (v2)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, *MEMORY[0x1E0CC5B00], v5);
    CFRelease(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", *v4, *MEMORY[0x1E0CC5B00]);
  }
}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__AVPlayer_AVPlayerVideoDisplaySleepPrevention__preventsDisplaySleepDuringVideoPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setMuted:(BOOL)muted
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = muted;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__AVPlayer_setMuted___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = muted;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __21__AVPlayer_setMuted___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5A80]);
  }
}

void __50__AVPlayer__noteNewPresentationSizeForPlayerItem___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  __int128 v6;
  __int128 v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "currentItem");
  if (*(void **)(a1 + 40) == v2)
  {
    v7 = *MEMORY[0x1E0C9D820];
    objc_msgSend(v2, "_getCachedPresentationSize:", &v7);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(*(_QWORD *)(v3 + 8) + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AVPlayer__noteNewPresentationSizeForPlayerItem___block_invoke_2;
    block[3] = &unk_1E30314D8;
    block[4] = v3;
    v6 = v7;
    av_readwrite_dispatch_queue_write(v4, block);
  }
}

- (AVPlayer)init
{
  AVPlayer *v2;
  AVPlayerInternal *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const __CFAllocator *v10;
  OpaqueCMClock *HostTimeClock;
  int v12;
  AVPlayerRateState *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  objc_super v31;
  CMTimebaseRef timebaseOut;

  v31.receiver = self;
  v31.super_class = (Class)AVPlayer;
  v2 = -[AVPlayer init](&v31, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVPlayerInternal);
    v2->_player = v3;
    if (v3)
    {
      v2->_player->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v2);
      v2->_player->stateDispatchQueue = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      dispatch_retain((dispatch_object_t)v2->_player->stateDispatchQueue);
      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->figConfigurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.figplayer", v4);
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->layerInteractionQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.playerlayer", v5);
      v2->_player->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayer.ivars");
      v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->currentItemPropertyUpdateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.current-item-properties", v6);
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->configurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.configuration", v7);
      if (objc_msgSend((id)objc_opt_class(), "worksAroundConcurrentKVOCrash"))
        v8 = AVMakeBlockSchedulerThatSerializesBlocksPrefersSynchronousExecutionAndAllowsReentrantExecution();
      else
        v8 = AVMakeBlockSchedulerThatExecutesBlocksSynchronously();
      v2->_player->KVOChangeSerializer = (AVBlockScheduler *)v8;
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->layersQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.layers", v9);
      v2->_player->videoLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v2->_player->closedCaptionLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v2->_player->subtitleLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v2->_player->avPlayerLayers = (NSHashTable *)(id)objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v2->_player->videoTargets = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v2->_player->videoTargetsForInterstitialPlayer = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v2->_player->playerCaptionLayers = (NSHashTable *)(id)objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v2->_player->items = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
      v2->_player->itemsInFigPlayQueue = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_player->queueModifications = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_player->externalPlaybackVideoGravity = (NSString *)CFSTR("AVLayerVideoGravityResizeAspect");
      v2->_player->pixelBufferAttributeMediator = objc_alloc_init(AVPixelBufferAttributeMediator);
      v2->_player->volume = 1.0;
      v2->_player->minRateForAudioPlayback = -INFINITY;
      v2->_player->maxRateForAudioPlayback = INFINITY;
      v2->_player->currentItemPresentationSize = (CGSize)*MEMORY[0x1E0C9D820];
      v2->_player->currentItemNonForcedSubtitlesEnabled = 0;
      v2->_player->pendingFigPlayerProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v2->_player->preventsDisplaySleepDuringVideoPlayback = 1;
      v2->_player->preventsAutomaticBackgroundingDuringVideoPlayback = 1;
      v2->_player->handlersToCallWhenReadyToPlay = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v2->_player->displaysUsedForPlayback = 0;
      v2->_player->needsToCreateFigPlayer = 1;
      timebaseOut = 0;
      HostTimeClock = CMClockGetHostTimeClock();
      if (!CMTimebaseCreateWithSourceClock(v10, HostTimeClock, &timebaseOut))
        CMTimebaseCreateReadOnlyTimebase();
      if (timebaseOut)
        CFRelease(timebaseOut);
      v2->_player->loggingIdentifier = (AVLoggingIdentifier *)+[AVPlayer makePlayerLoggingIdentifier](AVPlayer, "makePlayerLoggingIdentifier");
      v2->_player->audiovisualBackgroundPlaybackPolicy = 1;
      v2->_player->ensuresActiveAudioSessionWhenStartingPlayback = 1;
      v2->_player->prerollIDMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      v2->_player->nextPrerollIDToGenerate = 0;
      v2->_player->pendingPrerollID = 0;
      v2->_player->prerollCompletionHandler = 0;
      v2->_player->rateChangeIdentifier = 0;
      -[AVPlayer setActionAtItemEnd:](v2, "setActionAtItemEnd:", 1);
      -[AVPlayer setAllowsExternalPlayback:](v2, "setAllowsExternalPlayback:", dyld_program_sdk_at_least());
      if (dyld_program_sdk_at_least())
        -[AVPlayer setAppliesMediaSelectionCriteriaAutomatically:](v2, "setAppliesMediaSelectionCriteriaAutomatically:", 1);
      -[AVPlayer _setPendingFigPlayerProperty:forKey:](v2, "_setPendingFigPlayerProperty:forKey:", &unk_1E30935B0, *MEMORY[0x1E0CC5A98]);
      v12 = sWaitsToMinimizeStallingByDefault;
      v13 = [AVPlayerRateState alloc];
      if (v12 == 1)
      {
        v14 = 1;
        v15 = 0;
      }
      else
      {
        v14 = 0;
        v15 = 1;
      }
      v2->_player->rateState = -[AVPlayerRateState initWithAutomaticallyWaitsToMinimizeStalling:usesLegacyAutomaticWaitingBehavior:timeControlStatus:](v13, "initWithAutomaticallyWaitsToMinimizeStalling:usesLegacyAutomaticWaitingBehavior:timeControlStatus:", v14, v15, 0);
      -[AVPlayer _updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer](v2, "_updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer");
      v2->_player->playbackCoordinator = -[AVPlayerPlaybackCoordinator initWithPlayer:]([AVPlayerPlaybackCoordinator alloc], "initWithPlayer:", v2);
      v2->_player->applicationStateMonitor = (AVApplicationStateMonitor *)+[AVApplicationStateMonitor sharedApplicationStateMonitor](AVApplicationStateMonitor, "sharedApplicationStateMonitor");
      objc_initWeak((id *)&timebaseOut, v2);
      v16 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __16__AVPlayer_init__block_invoke;
      v29[3] = &unk_1E302FA38;
      objc_copyWeak(&v30, (id *)&timebaseOut);
      v2->_player->didFinishSuspensionNotificationToken = (id)objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIApplicationDidFinishSuspensionSnapshotNotification"), 0, 0, v29);
      v18 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27[0] = v17;
      v27[1] = 3221225472;
      v27[2] = __16__AVPlayer_init__block_invoke_2;
      v27[3] = &unk_1E302FA38;
      objc_copyWeak(&v28, (id *)&timebaseOut);
      v2->_player->didEnterBackgroundNotificationToken = (id)objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, 0, v27);
      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25[0] = v17;
      v25[1] = 3221225472;
      v25[2] = __16__AVPlayer_init__block_invoke_3;
      v25[3] = &unk_1E302FA38;
      objc_copyWeak(&v26, (id *)&timebaseOut);
      v2->_player->willEnterForegroundNotificationToken = (id)objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillEnterForegroundNotification"), 0, 0, v25);
      v20 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23[0] = v17;
      v23[1] = 3221225472;
      v23[2] = __16__AVPlayer_init__block_invoke_4;
      v23[3] = &unk_1E302FA38;
      objc_copyWeak(&v24, (id *)&timebaseOut);
      v2->_player->layerForegroundingChangeToken = (id)objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", CFSTR("AVPlayerLayerIsPartOfForegroundSceneDidChangeNotification"), 0, 0, v23);
      v2->_player->IAPDCallbackToken = (void *)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "registerCallbackContextObject:", v2);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2->_player->IAPDCallbackToken, (CFNotificationCallback)avplayer_iapdNotificationCallback, CFSTR("com.apple.iapd.notify.extendedMode"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v2->_player->logPerformanceData = CFPreferencesGetAppBooleanValue(CFSTR("avplayer_logperformance"), CFSTR("com.apple.avfoundation"), 0) == 1;
      v2->_player->fullyInitializedAndNotDeallocating = 1;
      v2->_player->defaultRate = 1.0;
      v2->_player->participatesInAudioSession = 1;
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)&timebaseOut);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)_updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer
{
  NSObject *figConfigurationQueue;
  _QWORD block[5];

  figConfigurationQueue = self->_player->figConfigurationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AVPlayer__updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(figConfigurationQueue, block);
}

+ (id)makePlayerLoggingIdentifier
{
  return objc_alloc_init(AVPlayerLoggingIdentifier);
}

+ (BOOL)worksAroundConcurrentKVOCrash
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AvoidConcurrentKVOForAVPlayerCurrentItem"), CFSTR("com.apple.avfoundation"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (void)setActionAtItemEnd:(AVPlayerActionAtItemEnd)actionAtItemEnd
{
  -[AVPlayer _setActionAtItemEnd:allowingAdvance:](self, "_setActionAtItemEnd:allowingAdvance:", actionAtItemEnd, 0);
}

void __104__AVPlayer__setRate_withVolumeRampDuration_playImmediately_rateChangeReason_affectsCoordinatedPlayback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;
  BOOL v5;
  uint64_t (*v7)(const void *);
  uint64_t v8;
  void *v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_interstitialPlayerIfCreated");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_copyInterstitialCoordinatorIfCreated");
  v4 = (const void *)v3;
  if (v3)
    v5 = v2 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    if (!FigPlayerInterstitialCoordinatorIsRemote())
    {
      v7 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      if (v7)
      {
        v8 = v7(v4);
        if (v8)
        {
          v9 = (void *)v8;
          objc_msgSend(*(id *)(a1 + 32), "rate");
          v11 = v10;
          v12 = objc_msgSend(v9, "restrictions") & 4;
          if (v11 >= 1.0 && v12 != 0)
            v11 = 1.0;
          CFRelease(v9);
          v14 = *(unsigned __int8 *)(a1 + 68);
          v15 = *(unsigned int *)(a1 + 64);
          v16 = *(unsigned __int8 *)(a1 + 69);
          v17 = *(_OWORD *)(a1 + 40);
          v18 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v2, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v17, v14, v15, v16, COERCE_DOUBLE(__PAIR64__(DWORD1(v17), LODWORD(v11))));
        }
      }
    }
    goto LABEL_17;
  }
  if (v3)
LABEL_17:
    CFRelease(v4);
}

- (void)setAppliesMediaSelectionCriteriaAutomatically:(BOOL)appliesMediaSelectionCriteriaAutomatically
{
  _BOOL8 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  uint64_t v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = appliesMediaSelectionCriteriaAutomatically;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__AVPlayer_AVPlayerAutomaticMediaSelection__setAppliesMediaSelectionCriteriaAutomatically___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = appliesMediaSelectionCriteriaAutomatically;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __91__AVPlayer_AVPlayerAutomaticMediaSelection__setAppliesMediaSelectionCriteriaAutomatically___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v10, *MEMORY[0x1E0CC5910]);
  }
}

- (void)_addLayer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  OpaqueFigPlayer *v8;
  NSObject *layersQ;
  void (*v10)(_QWORD);
  NSObject *stateDispatchQueue;
  NSObject *v12;
  NSString *captionRenderingStrategy;
  uint64_t v14;
  id v15;
  void (*v16[6])(_QWORD);
  void (*v17[7])(_QWORD);
  _QWORD block[12];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v5 = objc_msgSend(a3, "_videoLayer");
  v6 = objc_msgSend(a3, "_closedCaptionLayer");
  v7 = (void *)objc_msgSend(a3, "_subtitleLayer");
  v8 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  layersQ = self->_player->layersQ;
  v10 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__AVPlayer__addLayer___block_invoke;
  block[3] = &unk_1E3031918;
  block[4] = self;
  block[5] = v5;
  block[10] = &v23;
  block[11] = &v19;
  block[6] = v6;
  block[7] = v7;
  block[8] = a3;
  block[9] = &v27;
  dispatch_sync(layersQ, block);
  if (*((_BYTE *)v28 + 24))
  {
    -[AVPlayer _updatePixelBufferAttributesForLayer:](self, "_updatePixelBufferAttributesForLayer:", a3);
    if (v8)
      CFRetain(v8);
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v17[0] = v10;
    v17[1] = (void (*)(_QWORD))3221225472;
    v17[2] = __22__AVPlayer__addLayer___block_invoke_2;
    v17[3] = (void (*)(_QWORD))&unk_1E302FEE0;
    v17[5] = (void (*)(_QWORD))a3;
    v17[6] = (void (*)(_QWORD))v8;
    v17[4] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v17);
  }
  if (*((_BYTE *)v24 + 24))
  {
    v12 = self->_player->stateDispatchQueue;
    v16[0] = v10;
    v16[1] = (void (*)(_QWORD))3221225472;
    v16[2] = (void (*)(_QWORD))__22__AVPlayer__addLayer___block_invoke_3;
    v16[3] = (void (*)(_QWORD))&unk_1E302FE78;
    v16[4] = (void (*)(_QWORD))self;
    v16[5] = (void (*)(_QWORD))v8;
    AVSerializeOnQueueAsyncIfNecessary(v12, v16);
  }
  if (v7)
  {
    captionRenderingStrategy = self->_player->captionRenderingStrategy;
    if (captionRenderingStrategy)
    {
      if (-[NSString isEqualToString:](captionRenderingStrategy, "isEqualToString:", CFSTR("CoreTextSubtitleRenderer")))
      {
        v14 = *MEMORY[0x1E0CC5630];
      }
      else if (-[NSString isEqualToString:](self->_player->captionRenderingStrategy, "isEqualToString:", CFSTR("CaptionDisplayService")))
      {
        v14 = *MEMORY[0x1E0CC5628];
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v7, "setCaptionRenderingStrategy:", v14);
  }
  if (*((_BYTE *)v20 + 24))
    objc_msgSend(v7, "setPlayer:", v8);
  v15 = -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated");
  if (v15)
  {
    objc_msgSend((id)objc_msgSend(a3, "_interstitialLayer"), "setPlayer:", v15);
    if (-[NSString isEqualToString:](-[AVPlayer reasonForWaitingToPlay](self, "reasonForWaitingToPlay"), "isEqualToString:", CFSTR("AVPlayerWaitingDuringInterstitialEventReason")))
    {
      objc_msgSend(a3, "_setShowInterstitialInstead:", 1);
    }
  }
  if (v8)
    CFRelease(v8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

- (void)setAllowsExternalPlayback:(BOOL)allowsExternalPlayback
{
  _BOOL8 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[6];
  _QWORD block[5];
  BOOL v15;

  v3 = allowsExternalPlayback;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVPlayer_setAllowsExternalPlayback___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = allowsExternalPlayback;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __38__AVPlayer_setAllowsExternalPlayback___block_invoke_2;
    v13[3] = &unk_1E302FE78;
    v13[4] = self;
    v13[5] = v8;
    dispatch_sync(figConfigurationQueue, v13);
    CFRelease(v8);
  }
  else
  {
    v10 = (uint64_t *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v11 = *v10;
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC58F8]);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v11, *MEMORY[0x1E0CC5908]);
  }
  v12 = -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated");
  if (v12)
    objc_msgSend(v12, "setAllowsExternalPlayback:", v3);
}

- (id)_interstitialPlayerIfCreated
{
  NSObject *ivarAccessQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__AVPlayer_AVPlayerInterstitialSupport_Internal___interstitialPlayerIfCreated__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__AVPlayer__addLayer___block_invoke_3(uint64_t result)
{
  if (*(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_attachClosedCaptionLayersToFigPlayer");
  return result;
}

- (void)_updatePixelBufferAttributesForLayer:(id)a3
{
  uint64_t v5;
  OpaqueFigPlayer *v6;
  NSObject *figConfigurationQueue;
  _QWORD v8[8];

  v5 = objc_msgSend(a3, "_videoLayer");
  v6 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  -[AVPixelBufferAttributeMediator removeRequestedPixelBufferAttributesAttributesForKey:](self->_player->pixelBufferAttributeMediator, "removeRequestedPixelBufferAttributesAttributesForKey:", v5);
  figConfigurationQueue = self->_player->figConfigurationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__AVPlayer__updatePixelBufferAttributesForLayer___block_invoke;
  v8[3] = &unk_1E3031940;
  v8[4] = a3;
  v8[5] = self;
  v8[6] = v5;
  v8[7] = v6;
  dispatch_sync(figConfigurationQueue, v8);
  if (v6)
    CFRelease(v6);
}

- (void)_setPendingFigPlayerProperty:(id)a3 forKey:(id)a4
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVPlayer__setPendingFigPlayerProperty_forKey___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (id)_pendingFigPlayerPropertyForKey:(id)a3
{
  NSObject *ivarAccessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVPlayer__pendingFigPlayerPropertyForKey___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (AVPlayerMediaSelectionCriteria)legibleFallbackMediaSelectionCriteria
{
  NSObject *ivarAccessQueue;
  AVPlayerMediaSelectionCriteria *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__AVPlayer_AVPlayerLegibleFallback__legibleFallbackMediaSelectionCriteria__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (AVPlayerMediaSelectionCriteria *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowsLegibleFallbackForAllAudibleMediaSelections
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__AVPlayer_AVPlayerLegibleFallback__allowsLegibleFallbackForAllAudibleMediaSelections__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_cachedMediaSelectionCriteria
{
  NSObject *ivarAccessQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__AVPlayer_AVPlayerAutomaticMediaSelection___cachedMediaSelectionCriteria__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__AVPlayer__noteNewNonForcedSubtitleDisplayEnabledForPlayerItem___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 520) = *(_BYTE *)(result + 40);
  return result;
}

void __50__AVPlayer__updateProxyTimebaseFromNewCurrentItem__block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  OpaqueCMClock *HostTimeClock;
  OpaqueCMTimebase *v4;
  CMTime v5;
  CMTimebaseRef timebaseOut;

  timebaseOut = (CMTimebaseRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "_copyProxyTimebase");
  if (!timebaseOut)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    HostTimeClock = CMClockGetHostTimeClock();
    CMTimebaseCreateWithSourceClock(v2, HostTimeClock, &timebaseOut);
    v4 = timebaseOut;
    CMTimebaseGetTime(&v5, *(CMTimebaseRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80));
    CMTimebaseSetTime(v4, &v5);
  }
  FigReadOnlyTimebaseSetTargetTimebase();
  if (timebaseOut)
    CFRelease(timebaseOut);
}

id __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke(uint64_t a1)
{
  id result;
  uint64_t v3;

  v3 = 0;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) == 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "markAsFailedWithError:", v3);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 176);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = result;
  return result;
}

uint64_t __34__AVPlayer__insertItem_afterItem___block_invoke(uint64_t a1, BOOL *a2, uint64_t *a3)
{
  int v6;

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 192), "containsObject:", *(_QWORD *)(a1 + 40));
  if (v6)
    *a3 = AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("An AVPlayerItem can occupy only one position in a player's queue at a time."), 0));
  else
    *a2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176) == 0;
  return v6 ^ 1u;
}

- (void)_addItemToLinkedList_invokeOnIvarAccessQueue:(id)a3 afterItem:(id)a4
{
  AVPlayerItem *lastItem;
  AVPlayerInternal *player;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVPlayer.m"), 5092, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));
  -[NSMutableSet addObject:](self->_player->items, "addObject:", a3);
  lastItem = (AVPlayerItem *)a4;
  if (!a4 && (player = self->_player, (lastItem = player->lastItem) == 0)
    || (objc_msgSend(a3, "_insertAfterItem:", lastItem), player = self->_player, lastItem == player->lastItem))
  {
    player->lastItem = (AVPlayerItem *)a3;
    player = self->_player;
  }
  if (!player->currentItem)
    -[AVPlayer _setCurrentItem:](self, "_setCurrentItem:", a3);
  -[AVPlayer _enqueuePlayQueueModification_invokeOnIvarAccessQueue:](self, "_enqueuePlayQueueModification_invokeOnIvarAccessQueue:", +[AVPlayerQueueModificationDescription modificationForInsertingItem:afterItem:](AVPlayerQueueModificationDescription, "modificationForInsertingItem:afterItem:", a3, a4));
}

uint64_t __34__AVPlayer__insertItem_afterItem___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  if (*(_QWORD *)(a1 + 32))
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 192), "containsObject:");
    if (!(_DWORD)result)
      return result;
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_addItemToLinkedList_invokeOnIvarAccessQueue:afterItem:", *(_QWORD *)(a1 + 48), v3);
}

uint64_t __45__AVPlayer_replaceCurrentItemWithPlayerItem___block_invoke(uint64_t a1, _BYTE *a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5 == *(_QWORD *)(v6 + 176))
  {
    *a2 = 0;
    return 1;
  }
  else if (v5 && objc_msgSend(*(id *)(v6 + 192), "containsObject:"))
  {
    v13 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 40), *(const char **)(a1 + 48), (uint64_t)CFSTR("An AVPlayerItem can occupy only one position in a player's queue at a time."), v8, v9, v10, v11, v12, v16), 0);
    v14 = AVErrorForClientProgrammingError(v13);
    result = 0;
    *a3 = v14;
  }
  else
  {
    result = 1;
    *a2 = 1;
  }
  return result;
}

uint64_t __31__AVPlayer_initWithPlayerItem___block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
  return 1;
}

void __45__AVPlayer_replaceCurrentItemWithPlayerItem___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176);
  v3 = v2;
  v4 = *(id *)(a1 + 40);
  if (v4 != v2)
  {
    v5 = v2;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_addItemToLinkedList_invokeOnIvarAccessQueue:afterItem:", v4, v2);
      v3 = v5;
    }
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_removeItemFromLinkedList_invokeOnIvarAccessQueue:", v3);
      v3 = v5;
    }
  }

}

uint64_t __31__AVPlayer_initWithPlayerItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addItemToLinkedList_invokeOnIvarAccessQueue:afterItem:", *(_QWORD *)(a1 + 40), 0);
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVPlayer;
  -[AVPlayer addObserver:forKeyPath:options:context:](&v13, sel_addObserver_forKeyPath_options_context_, a3, a4, a5 & 0xFFFFFFFFFFFFFFFBLL);
  if ((a5 & 4) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)AVPlayer;
    -[AVPlayer addObserver:forKeyPath:options:context:](&v12, sel_addObserver_forKeyPath_options_context_, a3, a4, a5, a6);
    v11.receiver = self;
    v11.super_class = (Class)AVPlayer;
    -[AVPlayer removeObserver:forKeyPath:context:](&v11, sel_removeObserver_forKeyPath_context_, a3, a4, a6);
  }
}

id __57__AVPlayer_AVPlayerAudioSessionParticipant__audioSession__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 216);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __94__AVPlayer_AVPlayerProtectedContentPrivate__outputObscuredDueToInsufficientExternalProtection__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 470);
  return result;
}

uint64_t __92__AVPlayer_AVPlayerVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 404) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __21__AVPlayer_setMuted___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 395) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __16__AVPlayer_init__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_layerForegroundStateChanged:", a2);
}

void __28__AVPlayer__setCurrentItem___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_stopObservingPropertiesOfCurrentItem:");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 40), "_startObservingPropertiesOfCurrentItem:");

}

- (OpaqueFigPlayerInterstitialCoordinator)_copyInterstitialEventCoordinatorEnsuringItIsRemote:(BOOL)a3
{
  OpaqueFigPlayerInterstitialCoordinator *v5;
  id v6;
  NSObject *ivarAccessQueue;
  OpaqueFigPlayerInterstitialCoordinator *v8;
  _QWORD v10[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = -[AVPlayer _copyInterstitialCoordinatorIfCreated](self, "_copyInterstitialCoordinatorIfCreated");
  v13[3] = (uint64_t)v5;
  v6 = -[AVPlayer interstitialPlayer](self, "interstitialPlayer");
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__AVPlayer_AVPlayerInterstitialSupport_Internal___copyInterstitialEventCoordinatorEnsuringItIsRemote___block_invoke;
  v10[3] = &unk_1E3031A90;
  v11 = a3;
  v10[5] = v6;
  v10[6] = &v12;
  v10[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v10);
  v8 = (OpaqueFigPlayerInterstitialCoordinator *)v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (id)interstitialPlayer
{
  NSObject *ivarAccessQueue;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AVPlayer_AVPlayerInterstitialSupport_Internal__interstitialPlayer__block_invoke;
  block[3] = &unk_1E3031A40;
  block[4] = self;
  block[5] = &v20;
  block[6] = &v24;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (*((_BYTE *)v21 + 24))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3052000000;
    v12 = __Block_byref_object_copy__5;
    v13 = __Block_byref_object_dispose__5;
    v14 = 0;
    v5 = self->_player->ivarAccessQueue;
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __68__AVPlayer_AVPlayerInterstitialSupport_Internal__interstitialPlayer__block_invoke_2;
    v8[3] = &unk_1E3031A68;
    v8[4] = self;
    v8[5] = &v24;
    v8[6] = &v9;
    v8[7] = &v15;
    av_readwrite_dispatch_queue_write(v5, v8);
    if (*((_BYTE *)v16 + 24))
    {
      -[AVPlayer _linkAndSyncAudioSessionWithInterstitialPlayer:](self, "_linkAndSyncAudioSessionWithInterstitialPlayer:", -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated"));
      if (v10[5])
        objc_msgSend((id)v25[5], "setOutputContext:");
      objc_msgSend((id)v25[5], "setAllowsExternalPlayback:", -[AVPlayer allowsExternalPlayback](self, "allowsExternalPlayback"));
      objc_msgSend((id)v25[5], "setUsesExternalPlaybackWhileExternalScreenIsActive:", -[AVPlayer usesExternalPlaybackWhileExternalScreenIsActive](self, "usesExternalPlaybackWhileExternalScreenIsActive"));
    }

    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v15, 8);
  }
  v6 = (id)v25[5];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v6;
}

- (BOOL)allowsExternalPlayback
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
  v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayer_allowsExternalPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (OpaqueFigPlayerInterstitialCoordinator)_copyInterstitialCoordinator
{
  return -[AVPlayer _copyInterstitialEventCoordinatorEnsuringItIsRemote:](self, "_copyInterstitialEventCoordinatorEnsuringItIsRemote:", 0);
}

- (BOOL)usesExternalPlaybackWhileExternalScreenIsActive
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayer_usesExternalPlaybackWhileExternalScreenIsActive__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isInterstitialPlayer
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__AVPlayer_AVPlayerInterstitialSupport_Internal___isInterstitialPlayer__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_enqueuePlayQueueModification_invokeOnIvarAccessQueue:(id)a3
{
  NSArray *v4;

  v4 = -[NSArray arrayByAddingObject:](self->_player->queueModifications, "arrayByAddingObject:", a3);

  self->_player->queueModifications = (NSArray *)-[NSArray copy](v4, "copy");
}

- (void)_addFPListeners
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v4 = -[AVPlayer _weakReference](self, "_weakReference");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[AVPlayer _fpNotificationNames](self, "_fpNotificationNames", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, avplayer_fpNotificationCallback, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), self->_player->figPlayer, 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (id)_fpNotificationNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC57C8], *MEMORY[0x1E0CC57F8], *MEMORY[0x1E0CC5798], *MEMORY[0x1E0CC5760], *MEMORY[0x1E0CC57F0], *MEMORY[0x1E0CC57D0], *MEMORY[0x1E0CC5788], *MEMORY[0x1E0CC57D8], *MEMORY[0x1E0CC5778], *MEMORY[0x1E0CC5780], *MEMORY[0x1E0CC57A0], *MEMORY[0x1E0CC57B8], *MEMORY[0x1E0CC57C0], *MEMORY[0x1E0CC5770], *MEMORY[0x1E0CC5768], *MEMORY[0x1E0CC57A8], *MEMORY[0x1E0CC57E0],
               *MEMORY[0x1E0CC57B0],
               *MEMORY[0x1E0CC5758],
               *MEMORY[0x1E0CC5790],
               *MEMORY[0x1E0CA4B88],
               *MEMORY[0x1E0CC57E8],
               0);
}

- (void)_insertItem:(id)a3 afterItem:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[7];
  _QWORD v11[6];
  os_log_type_t type;
  int v13;
  id v14[27];

  v14[24] = *(id *)MEMORY[0x1E0C80C00];
  v14[0] = 0;
  if (dword_1ECDECF38)
  {
    v13 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a3, "_attachToPlayer:", self, v8, v9);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__AVPlayer__insertItem_afterItem___block_invoke;
  v11[3] = &unk_1E30315C8;
  v11[4] = self;
  v11[5] = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__AVPlayer__insertItem_afterItem___block_invoke_2;
  v10[3] = &unk_1E302FD88;
  v10[4] = a4;
  v10[5] = self;
  v10[6] = a3;
  if (!-[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:](self, "_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:", v11, v10, v14)&& objc_msgSend(v14[0], "code") == -11999)
  {
    objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v14[0], "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey")));
  }
}

- (id)_stateDispatchQueue
{
  return self->_player->stateDispatchQueue;
}

- (void)_startObservingPropertiesOfCurrentItem:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v5 = -[AVPlayer _weakReference](self, "_weakReference");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__AVPlayer__startObservingPropertiesOfCurrentItem___block_invoke;
  v9[3] = &unk_1E3031500;
  v9[4] = v5;
  self->_player->currentItemSuppressesVideoLayersNotificationToken = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("AVPlayerItemSuppressesVideoLayersDidChangeNotification"), a3, 0, v9);
  -[AVPlayer _updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression](self, "_updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression");
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __51__AVPlayer__startObservingPropertiesOfCurrentItem___block_invoke_2;
  v8[3] = &unk_1E3031500;
  v8[4] = v5;
  self->_player->currentItemPreferredPixelBufferAttributesNotificationToken = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", 0x1E303C218, a3, 0, v8);
  -[AVPlayer _updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression](self, "_updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression");
}

- (void)_updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression
{
  NSObject *figConfigurationQueue;
  _QWORD block[5];

  figConfigurationQueue = self->_player->figConfigurationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__AVPlayer__updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(figConfigurationQueue, block);
}

- (id)_weakReference
{
  return self->_player->weakReference;
}

- (void)setUsesExternalPlaybackWhileExternalScreenIsActive:(BOOL)usesExternalPlaybackWhileExternalScreenIsActive
{
  _BOOL8 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[6];
  _QWORD block[5];
  BOOL v15;

  v3 = usesExternalPlaybackWhileExternalScreenIsActive;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVPlayer_setUsesExternalPlaybackWhileExternalScreenIsActive___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = usesExternalPlaybackWhileExternalScreenIsActive;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __63__AVPlayer_setUsesExternalPlaybackWhileExternalScreenIsActive___block_invoke_2;
    v13[3] = &unk_1E302FE78;
    v13[4] = self;
    v13[5] = v8;
    dispatch_sync(figConfigurationQueue, v13);
    CFRelease(v8);
  }
  else
  {
    v10 = (uint64_t *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v11 = *v10;
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5B80]);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v11, *MEMORY[0x1E0CC5B78]);
  }
  v12 = -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated");
  if (v12)
    objc_msgSend(v12, "setUsesExternalPlaybackWhileExternalScreenIsActive:", v3);
}

uint64_t __34__AVPlayer_allowsExternalPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 407);
  return result;
}

- (void)_removeAllLayers
{
  AVPlayerInternal *player;

  player = self->_player;
  if (player->figPlayer)
  {
    -[AVPlayer _detachVideoLayersFromFigPlayer:](self, "_detachVideoLayersFromFigPlayer:");
    -[AVPlayer _detachClosedCaptionLayersFromFigPlayer:](self, "_detachClosedCaptionLayersFromFigPlayer:", self->_player->figPlayer);
    -[AVPlayer _detachFigPlayerFromSubtitleLayers](self, "_detachFigPlayerFromSubtitleLayers");
    player = self->_player;
  }
  -[NSMutableArray removeAllObjects](player->videoLayers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_player->closedCaptionLayers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_player->subtitleLayers, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_player->avPlayerLayers, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_player->playerCaptionLayers, "removeAllObjects");
}

uint64_t __59__AVPlayer_usesExternalPlaybackWhileExternalScreenIsActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 408);
  return result;
}

- (void)_updateConnectionToSecondScreen
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  NSObject *ivarAccessQueue;
  _QWORD v10[5];
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = -[AVPlayer _avPlayerLayers](self, "_avPlayerLayers");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v4)
  {
    if (!-[AVPlayer _isConnectedToPhysicalSecondScreen](self, "_isConnectedToPhysicalSecondScreen"))
      return;
    LOBYTE(v6) = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v3);
      v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_isConnectedToSecondScreen");
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v5);
  if ((v6 & 1) != -[AVPlayer _isConnectedToPhysicalSecondScreen](self, "_isConnectedToPhysicalSecondScreen"))
  {
LABEL_12:
    -[AVPlayer _setCALayerDestinationIsTVOut:](self, "_setCALayerDestinationIsTVOut:", v6 & 1);
    -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("externalPlaybackActive"));
    ivarAccessQueue = self->_player->ivarAccessQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__AVPlayer_AVPlayerSupportForMediaPlayer___updateConnectionToSecondScreen__block_invoke;
    v10[3] = &unk_1E302FD38;
    v10[4] = self;
    v11 = v6 & 1;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v10);
    -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("externalPlaybackActive"));
  }
}

- (BOOL)_isConnectedToPhysicalSecondScreen
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__AVPlayer_AVPlayerSupportForMediaPlayer___isConnectedToPhysicalSecondScreen__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)currentItemPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:key:notificationName:](AVPropertyValuePublisher, "propertyValuePublisherWithObject:key:notificationName:", self, CFSTR("currentItem"), CFSTR("AVPlayerCurrentItemDidChangeForPublishersNotification"));
}

- (id)closedCaptionsDisplayPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:key:notificationName:](AVPropertyValuePublisher, "propertyValuePublisherWithObject:key:notificationName:", self, CFSTR("isDisplayingClosedCaptions"), CFSTR("AVPlayerIsDisplayingClosedCaptionsDidChangeNotification"));
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_6(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 468) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __86__AVPlayer_AVPlayerLegibleFallback__allowsLegibleFallbackForAllAudibleMediaSelections__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 745);
  return result;
}

uint64_t __81__AVPlayer_AVPlayerAdvanceWithOverlap___supportsAdvanceTimeForOverlappedPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 409);
  return result;
}

uint64_t __77__AVPlayer_AVPlayerAudioSessionParticipant___preservesAudioSessionSampleRate__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 552);
  return result;
}

uint64_t __72__AVPlayer_AVPlayerAudioSessionParticipant___participatesInAudioSession__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 352);
  return result;
}

uint64_t __69__AVPlayer_PlaybackCoordination___clientRequestedPlaybackCoordinator__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 600);
  return result;
}

uint64_t __59__AVPlayer_FigVideoTargetSupport__shouldWaitForVideoTarget__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 584);
  return result;
}

uint64_t __51__AVPlayer_AVPlayer_PIPSupport___isPIPModePossible__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 464);
  return result;
}

uint64_t __33__AVPlayer__isAirPlayVideoActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 467);
  return result;
}

uint64_t __88__AVPlayer_AVPlayerVideoDisplaySleepPrevention__preventsDisplaySleepDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 404);
  return result;
}

id __80__AVPlayer_PlaybackCoordination___playbackCoordinatorWithoutTriggeringFullSetup__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 592);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __76__AVPlayer_AVPlayerAudioSessionParticipant___setParticipatesInAudioSession___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 352) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __71__AVPlayer_AVPlayerInterstitialSupport_Internal___isInterstitialPlayer__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 556);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfCurrentItem
{
  return 0;
}

- (id)addBoundaryTimeObserverForTimes:(NSArray *)times queue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;

  v5 = block;
  if (!block)
  {
    if (dyld_program_sdk_at_least())
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"block != nil"), 0);
      objc_exception_throw(v16);
    }
    v5 = &__block_literal_global_445;
  }
  return -[AVOccasionalTimebaseObserver initWithTimebase:times:queue:block:]([AVOccasionalTimebaseObserver alloc], "initWithTimebase:times:queue:block:", self->_player->proxyTimebase, times, queue, v5);
}

void __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_2(uint64_t a1)
{
  char v2;
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  void (*v6)(_QWORD);
  __int128 v7;
  int8x16_t v8;
  NSObject *v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26[5])(_QWORD);
  _QWORD block[4];
  int8x16_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t *v31;
  char v32;
  os_log_type_t type;
  unsigned int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  int v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_hasCurrentInterstitialEvent");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_nameForLogging");
  if (dword_1ECDECF38)
  {
    v34 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("currentItem"), v18, v22);
  if (dword_1ECDECF38)
  {
    v34 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("timeControlStatus"), v19, v23);
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
  v6 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  v7 = *(_OWORD *)(a1 + 48);
  v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v9 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
  block[1] = 3221225472;
  block[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_355;
  block[3] = &unk_1E3031460;
  v31 = &v35;
  v30 = v7;
  v28 = v8;
  v32 = v2;
  v29 = v3;
  av_readwrite_dispatch_queue_write(v9, block);
  if ((objc_msgSend(*(id *)(a1 + 40), "isFailed") & 1) == 0 && *((_BYTE *)v36 + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_synchronizeWithNewCurrentItem");
    objc_msgSend(*(id *)(a1 + 32), "_updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression");
  }
  if (dword_1ECDECF38)
  {
    v34 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = v34;
    if (os_log_type_enabled(v10, type))
      v12 = v11;
    else
      v12 = v11 & 0xFFFFFFFE;
    if (v12)
    {
      v39 = 136315394;
      v40 = "-[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:]_block_invoke";
      v41 = 2114;
      v42 = v3;
      LODWORD(v24) = 22;
      v20 = &v39;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("currentItem"), v20, v24);
  if (dword_1ECDECF38)
  {
    v34 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v14 = v34;
    if (os_log_type_enabled(v13, type))
      v15 = v14;
    else
      v15 = v14 & 0xFFFFFFFE;
    if (v15)
    {
      v39 = 136315394;
      v40 = "-[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:]_block_invoke";
      v41 = 2114;
      v42 = v3;
      LODWORD(v25) = 22;
      v21 = &v39;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("timeControlStatus"), v21, v25);
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVPlayerCurrentItemDidChangeForPublishersNotification"), *(_QWORD *)(a1 + 32), 0);
  if ((objc_msgSend(*(id *)(a1 + 40), "isFailed") & 1) == 0)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(NSObject **)(*(_QWORD *)(v16 + 8) + 32);
    v26[0] = v6;
    v26[1] = (void (*)(_QWORD))3221225472;
    v26[2] = (void (*)(_QWORD))__109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_356;
    v26[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v26[4] = (void (*)(_QWORD))v16;
    AVSerializeOnQueueAsyncIfNecessary(v17, v26);
    if (*((_BYTE *)v36 + 24))
      objc_msgSend(*(id *)(a1 + 32), "_updateProxyTimebaseFromNewCurrentItem");
  }
  _Block_object_dispose(&v35, 8);
}

- (id)_synchronizeWithNewCurrentItem
{
  NSObject *currentItemPropertyUpdateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cachedPresentationSizeOfCurrentItem"));
  currentItemPropertyUpdateQueue = self->_player->currentItemPropertyUpdateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke;
  v6[3] = &unk_1E302FD60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(currentItemPropertyUpdateQueue, v6);
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cachedPresentationSizeOfCurrentItem"));
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_noteNewPresentationSizeForPlayerItem:(id)a3
{
  NSObject *currentItemPropertyUpdateQueue;
  _QWORD v6[6];

  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cachedPresentationSizeOfCurrentItem"));
  currentItemPropertyUpdateQueue = self->_player->currentItemPropertyUpdateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__AVPlayer__noteNewPresentationSizeForPlayerItem___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(currentItemPropertyUpdateQueue, v6);
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cachedPresentationSizeOfCurrentItem"));
}

- (void)_noteNewNonForcedSubtitleDisplayEnabledForPlayerItem:(id)a3
{
  NSObject *currentItemPropertyUpdateQueue;
  _QWORD v4[6];

  currentItemPropertyUpdateQueue = self->_player->currentItemPropertyUpdateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__AVPlayer__noteNewNonForcedSubtitleDisplayEnabledForPlayerItem___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(currentItemPropertyUpdateQueue, v4);
}

- (void)_itemIsReadyToPlay:(id)a3
{
  void (*v5[5])(_QWORD);

  if (-[AVPlayer currentItem](self, "currentItem") == a3
    && objc_msgSend(a3, "status") == 1
    && self->_player->reevaluateBackgroundPlayback)
  {
    v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v5[1] = (void (*)(_QWORD))3221225472;
    v5[2] = __31__AVPlayer__itemIsReadyToPlay___block_invoke;
    v5[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v5[4] = (void (*)(_QWORD))self;
    AVEnsureNotOnMainThread(v5);
    self->_player->reevaluateBackgroundPlayback = 0;
  }
}

- (void)_updateProxyTimebaseFromNewCurrentItem
{
  NSObject *figConfigurationQueue;
  _QWORD block[5];

  figConfigurationQueue = self->_player->figConfigurationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVPlayer__updateProxyTimebaseFromNewCurrentItem__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(figConfigurationQueue, block);
}

- (void)_applyPlayQueueChangesToFigPlayerWithCompletionHandler:(id)a3
{
  AVPlayerInternal *player;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  _QWORD block[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  player = self->_player;
  if (player->figPlayer)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    v17 = 0;
    v17 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E30315F0;
    v11[4] = self;
    v11[5] = &v12;
    -[AVPlayer _applyLinkedListOfItemsToFigPlayerUsingBlock:](self, "_applyLinkedListOfItemsToFigPlayerUsingBlock:", v11);
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v13[5]);
  }
  else
  {
    if (!player->needsToCreateFigPlayer)
    {
      (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(MEMORY[0x1E0C99D20], "array"));
      return;
    }
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    v17 = 0;
    ivarAccessQueue = player->ivarAccessQueue;
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E302FD60;
    block[4] = self;
    block[5] = &v12;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    v8 = (void *)v13[5];
    if (v8)
    {
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke_3;
      v9[3] = &unk_1E30316B8;
      v9[4] = self;
      v9[5] = a3;
      AVPlayerGetFigPlayerTypeForAsset((void *)objc_msgSend((id)objc_msgSend(v8, "item"), "asset"), (uint64_t)v9);
      self->_player->needsToCreateFigPlayer = 0;
    }
    else
    {
      (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(MEMORY[0x1E0C99D20], "array"));
    }

  }
  _Block_object_dispose(&v12, 8);
}

- (void)_setFigPlaybackItemToMakeCurrent:(OpaqueFigPlaybackItem *)a3
{
  self->_player->figPlaybackItemToIdentifyNextCurrentItem = a3;
}

- (int64_t)_extractFPExternalProtectionStatus:(id)a3
{
  uint64_t v4;

  if (!a3)
    return 1;
  v4 = objc_msgSend((id)objc_msgSend(a3, "allKeysForObject:", *MEMORY[0x1E0CC5690]), "count");
  return v4 != objc_msgSend(a3, "count");
}

- (AVPlayer)initWithURL:(NSURL *)URL
{
  return -[AVPlayer initWithPlayerItem:](self, "initWithPlayerItem:", +[AVPlayerItem playerItemWithURL:](AVPlayerItem, "playerItemWithURL:", URL));
}

_QWORD *__68__AVPlayer_AVPlayerInterstitialSupport_Internal__interstitialPlayer__block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = result;
  v2 = *(_QWORD *)(result[4] + 8);
  v3 = *(void **)(v2 + 248);
  if (v3 || *(_BYTE *)(v2 + 556))
  {
    result = v3;
    *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40) = result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfExternalPlaybackActive
{
  return 0;
}

uint64_t __49__AVPlayer__updatePixelBufferAttributesForLayer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), "setRequestedPixelBufferAttributes:forKey:", objc_msgSend(*(id *)(a1 + 32), "pixelBufferAttributes"), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "_updateDecoderPixelBufferAttributes:onFigPlayer:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), "mediatedPixelBufferAttributes"), *(_QWORD *)(a1 + 56));
}

uint64_t __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createAndConfigureFigPlayerWithType:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

id __68__AVPlayer_AVPlayerInterstitialSupport_Internal__interstitialPlayer__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id result;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 248);
  if (v3 || *(_BYTE *)(v2 + 556))
  {
    result = v3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(AVQueuePlayer);
    objc_msgSend(*(id *)(a1 + 32), "_setInterstitialPlayerGuts_invokeOnIvarAccessQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    result = (id)objc_msgSend(*(id *)(a1 + 32), "_setInterstitialPlayerOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 232);
    if (v5)
    {
      result = v5;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (void)_setInterstitialPlayerGuts_invokeOnIvarAccessQueue:(id)a3
{
  id v5;
  AVPlayerInternal *player;
  AVPlayerPlaybackCoordinator *playbackCoordinator;
  uint64_t v8;
  void *v9;

  v5 = a3;

  self->_player->interstitialPlayer = (AVQueuePlayer *)a3;
  objc_msgSend(a3, "_setIsInterstitialPlayer:", 1);
  objc_msgSend(a3, "_setWeakReferenceToPrimaryPlayer:", -[AVPlayer _weakReference](self, "_weakReference"));
  player = self->_player;
  playbackCoordinator = player->playbackCoordinator;
  if (player->clientRequestedPlaybackCoordinator)
    v8 = objc_msgSend(a3, "playbackCoordinator");
  else
    v8 = objc_msgSend(a3, "_playbackCoordinatorWithoutTriggeringFullSetup");
  v9 = (void *)v8;
  -[AVPlayerPlaybackCoordinator setInterstitialPlaybackCoordinator:](playbackCoordinator, "setInterstitialPlaybackCoordinator:", v8);
  objc_msgSend(v9, "setWeakReferenceToPrimaryPlaybackCoordinator:", playbackCoordinator);
  objc_msgSend(a3, "_setPrimaryPlayerNameForInterstitial:", self->_player->playerName);
}

- (void)_setIsInterstitialPlayer:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__AVPlayer_AVPlayerInterstitialSupport_Internal___setIsInterstitialPlayer___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

- (void)_setPrimaryPlayerNameForInterstitial:(id)a3
{
  -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", a3, *MEMORY[0x1E0CC5818]);
}

- (AVPlayerPlaybackCoordinator)playbackCoordinator
{
  NSObject *stateDispatchQueue;
  void (*v5[5])(_QWORD);

  stateDispatchQueue = self->_player->stateDispatchQueue;
  v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v5[1] = (void (*)(_QWORD))3221225472;
  v5[2] = (void (*)(_QWORD))__53__AVPlayer_PlaybackCoordination__playbackCoordinator__block_invoke;
  v5[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v5[4] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v5);
  return (AVPlayerPlaybackCoordinator *)-[AVPlayer _playbackCoordinatorWithoutTriggeringFullSetup](self, "_playbackCoordinatorWithoutTriggeringFullSetup");
}

uint64_t __53__AVPlayer_PlaybackCoordination__playbackCoordinator__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(v2 + 8) + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AVPlayer_PlaybackCoordination__playbackCoordinator__block_invoke_2;
  block[3] = &unk_1E302FA10;
  block[4] = v2;
  av_readwrite_dispatch_queue_write(v3, block);
  objc_msgSend(*(id *)(a1 + 32), "_ensureFigPlaybackCoordinatorIsConnected");
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interstitialPlayer"), "playbackCoordinator");
}

- (void)_ensureFigPlaybackCoordinatorIsConnected
{
  id v3;
  OpaqueFigPlayer *v4;
  OpaqueFigPlayer *v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef cf;

  v3 = -[AVPlayer _playbackCoordinatorWithoutTriggeringFullSetup](self, "_playbackCoordinatorWithoutTriggeringFullSetup");
  if ((objc_msgSend(v3, "_hasFigPlaybackCoordinator") & 1) == 0)
  {
    v4 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
    if (v4)
    {
      v5 = v4;
      cf = 0;
      FigBaseObject = FigPlayerGetFigBaseObject();
      v7 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
      if (v7)
      {
        v7(FigBaseObject, *MEMORY[0x1E0CC5AC0], *MEMORY[0x1E0C9AE00], &cf);
        if (cf)
        {
          objc_msgSend(v3, "setFigPlaybackCoordinator:");
          if (cf)
            CFRelease(cf);
        }
      }
      CFRelease(v5);
    }
  }
}

- (void)_linkAndSyncAudioSessionWithInterstitialPlayer:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  OpaqueFigVideoTarget *v10;
  OpaqueFigVideoTarget *v11;
  void (*v12)(OpaqueFigVideoTarget *, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void (*v17[6])(_QWORD);
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v17[1] = (void (*)(_QWORD))3221225472;
  v17[2] = (void (*)(_QWORD))__97__AVPlayer_AVPlayerInterstitialSupport_Internal___linkAndSyncAudioSessionWithInterstitialPlayer___block_invoke;
  v17[3] = (void (*)(_QWORD))&unk_1E302FCE8;
  v17[4] = (void (*)(_QWORD))self;
  v17[5] = (void (*)(_QWORD))a3;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v17);
  if (a3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = -[AVPlayer videoTargets](self, "videoTargets", 0);
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = -[AVPlayer _interstitialVideoTargetForPrimaryVideoTarget:](self, "_interstitialVideoTargetForPrimaryVideoTarget:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
          if (v10)
          {
            v11 = v10;
            v12 = *(void (**)(OpaqueFigVideoTarget *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 80);
            if (v12)
              v12(v11, 0);
            objc_msgSend(a3, "addVideoTarget:", v11);
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }
  }
  -[AVPlayer syncAudioSessionToInterstitialPlayer:](self, "syncAudioSessionToInterstitialPlayer:", a3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVPlayerInterstitialPlayerDidChangeNotification"), self, 0);
}

uint64_t __97__AVPlayer_AVPlayerInterstitialSupport_Internal___linkAndSyncAudioSessionWithInterstitialPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_avPlayerLayers", 0);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_interstitialLayer"), "setPlayer:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (NSArray)videoTargets
{
  NSObject *ivarAccessQueue;
  NSArray *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayer_FigVideoTargetSupport__videoTargets__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)syncAudioSessionToInterstitialPlayer:(id)a3
{
  if (!-[AVPlayer audioSession](self, "audioSession"))
    -[AVPlayer setAudioSession:](self, "setAudioSession:", objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance"));
  objc_msgSend(a3, "setAudioSession:", -[AVPlayer audioSession](self, "audioSession"));
}

- (void)_layerForegroundStateChanged:(id)a3
{
  NSObject *stateDispatchQueue;
  void (*v4[6])(_QWORD);

  stateDispatchQueue = self->_player->stateDispatchQueue;
  v4[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v4[1] = (void (*)(_QWORD))3221225472;
  v4[2] = (void (*)(_QWORD))__67__AVPlayer_AVPlayerMultitaskSupport___layerForegroundStateChanged___block_invoke;
  v4[3] = (void (*)(_QWORD))&unk_1E302FCE8;
  v4[4] = (void (*)(_QWORD))self;
  v4[5] = (void (*)(_QWORD))a3;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v4);
}

uint64_t __67__AVPlayer_AVPlayerMultitaskSupport___layerForegroundStateChanged___block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;
  void *v4;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_avPlayerLayers"), "containsObject:", objc_msgSend(*(id *)(a1 + 40), "object"));
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers");
    v4 = *(void **)(a1 + 32);
    if ((v3 & 1) != 0)
      return objc_msgSend(v4, "_ensureVideoLayersAreAttached");
    else
      return objc_msgSend(v4, "_detachVideoLayersForSuspension");
  }
  return result;
}

- (void)_ensureVideoLayersAreAttached
{
  NSObject *stateDispatchQueue;
  void (*v3[5])(_QWORD);

  stateDispatchQueue = self->_player->stateDispatchQueue;
  v3[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v3[1] = (void (*)(_QWORD))3221225472;
  v3[2] = __67__AVPlayer_AVPlayerMultitaskSupport___ensureVideoLayersAreAttached__block_invoke;
  v3[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v3[4] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v3);
}

void __67__AVPlayer_AVPlayerMultitaskSupport___ensureVideoLayersAreAttached__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  const void *v4;
  _QWORD *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (!*(_BYTE *)(v2[1] + 780))
  {
    v3 = objc_msgSend(v2, "_copyFigPlayer");
    if (v3)
    {
      v4 = (const void *)v3;
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_videoLayers"), "count"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_attachVideoLayersToFigPlayer");
        if ((dyld_program_sdk_at_least() & 1) == 0
          && ((dyld_program_sdk_at_least() & 1) != 0
           || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_clientName"), "isEqualToString:", CFSTR("MusicPlayer"))))
        {
          v5 = *(_QWORD **)(a1 + 32);
          if (*(_BYTE *)(v5[1] + 777))
            objc_msgSend((id)objc_msgSend(v5, "currentItem"), "_hasEnabledVideo");
        }
      }
      CFRelease(v4);
    }
  }
}

void __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  __int128 v5;
  NSObject *v6;
  uint64_t FigBaseObject;
  uint64_t (*v8)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  int v9;
  CFNumberRef v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v23;
  uint64_t v24;
  NSObject *v25;
  int AppBooleanValue;
  int v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, _QWORD);
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, _QWORD, _QWORD);
  uint64_t v46;
  void (*v47)(uint64_t, _QWORD, _QWORD);
  uint64_t v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  const void *v58;
  void (*v59)(const void *);
  const void *v60;
  const void *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[6];
  _QWORD v69[6];
  _QWORD v70[5];
  _QWORD v71[6];
  _QWORD v72[7];
  _QWORD v73[5];
  _QWORD v74[5];
  char v75;
  os_log_type_t type;
  int v77;
  _QWORD v78[6];
  _QWORD v79[5];
  char v80;
  _QWORD v81[5];
  char v82;
  _QWORD v83[5];
  char v84;
  CFNumberRef number;
  _QWORD block[4];
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  void (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  uint64_t v94;
  _BYTE v95[128];
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v89 = 0;
  v90 = &v89;
  v91 = 0x3052000000;
  v92 = __Block_byref_object_copy__5;
  v93 = __Block_byref_object_dispose__5;
  v94 = 0;
  v94 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("status"));
  v2 = *(_QWORD *)(a1 + 64);
  if (!v2)
    goto LABEL_47;
  v3 = (_DWORD *)(a1 + 80);
  if (*(_DWORD *)(a1 + 80))
    goto LABEL_47;
  if (*(_DWORD *)(a1 + 84))
    goto LABEL_45;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
  block[1] = 3221225472;
  block[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_3;
  block[3] = &unk_1E302FEE0;
  v88 = v2;
  v87 = v5;
  av_readwrite_dispatch_queue_write(v6, block);
  objc_msgSend(*(id *)(a1 + 32), "_addFPListeners");
  number = 0;
  FigBaseObject = FigPlayerGetFigBaseObject();
  v8 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v8)
    goto LABEL_8;
  v9 = v8(FigBaseObject, *MEMORY[0x1E0CC5B40], *MEMORY[0x1E0C9AE00], &number);
  v10 = number;
  if (!v9 && number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, (void *)(a1 + 80));
LABEL_8:
    v10 = number;
  }
  if (v10)
    CFRelease(v10);
  if (!*v3)
  {
    v11 = *(unsigned __int8 *)(a1 + 88);
    if (v11 != objc_msgSend(*(id *)(a1 + 32), "_isAirPlayVideoActive"))
    {
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("airPlayVideoActive"));
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(NSObject **)(*(_QWORD *)(v12 + 8) + 56);
      v83[0] = v4;
      v83[1] = 3221225472;
      v83[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_4;
      v83[3] = &unk_1E302FD38;
      v83[4] = v12;
      v84 = *(_BYTE *)(a1 + 88);
      av_readwrite_dispatch_queue_write(v13, v83);
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("airPlayVideoActive"));
    }
    v14 = *(unsigned __int8 *)(a1 + 89);
    if (v14 != objc_msgSend(*(id *)(a1 + 32), "isExternalPlaybackActive"))
    {
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("externalPlaybackActive"));
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(NSObject **)(*(_QWORD *)(v15 + 8) + 56);
      v81[0] = v4;
      v81[1] = 3221225472;
      v81[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_5;
      v81[3] = &unk_1E302FD38;
      v81[4] = v15;
      v82 = *(_BYTE *)(a1 + 89);
      av_readwrite_dispatch_queue_write(v16, v81);
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("externalPlaybackActive"));
    }
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(NSObject **)(*(_QWORD *)(v17 + 8) + 56);
    v79[0] = v4;
    v79[1] = 3221225472;
    v79[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_6;
    v79[3] = &unk_1E302FD38;
    v79[4] = v17;
    v80 = *(_BYTE *)(a1 + 90);
    av_readwrite_dispatch_queue_write(v18, v79);
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("mxSessionID"));
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(NSObject **)(*(_QWORD *)(v19 + 8) + 56);
      v78[0] = v4;
      v78[1] = 3221225472;
      v78[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_7;
      v78[3] = &unk_1E302FE78;
      v21 = *(_QWORD *)(a1 + 72);
      v78[4] = v19;
      v78[5] = v21;
      av_readwrite_dispatch_queue_write(v20, v78);
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("mxSessionID"));
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_updateAudioSessionOnFigPlayer") != *(_QWORD *)(a1 + 48) && dword_1ECDECF38)
    {
      v77 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v23 = *(unsigned __int8 *)(a1 + 91);
    if (v23 != objc_msgSend(*(id *)(a1 + 32), "_isPIPModePossible", v62, v63))
    {
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("PIPModePossible"));
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(NSObject **)(*(_QWORD *)(v24 + 8) + 56);
      v74[0] = v4;
      v74[1] = 3221225472;
      v74[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_380;
      v74[3] = &unk_1E302FD38;
      v74[4] = v24;
      v75 = *(_BYTE *)(a1 + 91);
      av_readwrite_dispatch_queue_write(v25, v74);
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("PIPModePossible"));
    }
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("avplaybackcoordinator_always"), CFSTR("com.apple.avfoundation"), 0);
    v27 = objc_msgSend(*(id *)(a1 + 32), "_clientRequestedPlaybackCoordinator");
    if (AppBooleanValue == 1)
      v28 = 1;
    else
      v28 = v27;
    if (v28 == 1)
      objc_msgSend(*(id *)(a1 + 32), "_ensureFigPlaybackCoordinatorIsConnected");
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(NSObject **)(*(_QWORD *)(v29 + 8) + 40);
    v73[0] = v4;
    v73[1] = 3221225472;
    v73[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_2_383;
    v73[3] = &unk_1E302FA10;
    v73[4] = v29;
    dispatch_sync(v30, v73);
    v31 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC5BA8], *MEMORY[0x1E0CC5A80], *MEMORY[0x1E0CC58D8], *MEMORY[0x1E0CC59C8], *MEMORY[0x1E0CC5B18], *MEMORY[0x1E0CC5AE0], *MEMORY[0x1E0CC5A60], *MEMORY[0x1E0CC5948], *MEMORY[0x1E0CC58F8], *MEMORY[0x1E0CC5B78], *MEMORY[0x1E0CC5908], *MEMORY[0x1E0CC5B80], *MEMORY[0x1E0CC5A00], *MEMORY[0x1E0CC5B68], *MEMORY[0x1E0CC5A90], *MEMORY[0x1E0CC5B60], *MEMORY[0x1E0CC5AB8],
            *MEMORY[0x1E0CC5A40],
            *MEMORY[0x1E0CC5A70],
            *MEMORY[0x1E0CC5A58],
            *MEMORY[0x1E0CC5960],
            *MEMORY[0x1E0CC5B28],
            *MEMORY[0x1E0CC5968],
            *MEMORY[0x1E0CC5B98],
            *MEMORY[0x1E0CC59C0],
            *MEMORY[0x1E0CC58F0],
            *MEMORY[0x1E0CC5B10],
            *MEMORY[0x1E0CC59F8],
            *MEMORY[0x1E0CC5910],
            *MEMORY[0x1E0CC5928],
            *MEMORY[0x1E0CC5938],
            *MEMORY[0x1E0CC5AF0],
            *MEMORY[0x1E0CC58E8],
            *MEMORY[0x1E0CC5A78],
            *MEMORY[0x1E0CC5AE8],
            *MEMORY[0x1E0CC5940],
            *MEMORY[0x1E0CC5920],
            *MEMORY[0x1E0CC5B38],
            0,
            *MEMORY[0x1E0CC5908],
            *MEMORY[0x1E0CC5B78],
            *MEMORY[0x1E0CC58F8],
            *MEMORY[0x1E0CC5948],
            *MEMORY[0x1E0CC5A60],
            *MEMORY[0x1E0CC5AE0],
            *MEMORY[0x1E0CC5B18],
            *MEMORY[0x1E0CC59C8],
            *MEMORY[0x1E0CC58D8],
            *MEMORY[0x1E0CC5A80],
            *MEMORY[0x1E0CC5BA8],
            MEMORY[0x1E0C99E60]);
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(NSObject **)(*(_QWORD *)(v32 + 8) + 40);
    v34 = MEMORY[0x1E0C809B0];
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_3_389;
    v72[3] = &unk_1E302FEE0;
    v72[4] = v31;
    v72[5] = v32;
    v72[6] = *(_QWORD *)(a1 + 64);
    dispatch_sync(v33, v72);
    v35 = objc_msgSend(*(id *)(a1 + 32), "_pendingFigPlayerProperties");
    v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 728);
    v37 = *(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
    if (v37)
      v37(v36, v35, 0);
    if (objc_msgSend(*(id *)(a1 + 32), "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E0CC5B88]))
    {
      v38 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 728);
      v39 = *(_QWORD *)(CMBaseObjectGetVTable() + 24);
      if (v39)
      {
        v40 = *(void (**)(uint64_t))(v39 + 8);
        if (v40)
          v40(v38);
      }
    }
    v41 = *(_QWORD *)(a1 + 32);
    v42 = *(NSObject **)(*(_QWORD *)(v41 + 8) + 40);
    v71[0] = v34;
    v71[1] = 3221225472;
    v71[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_4_390;
    v71[3] = &unk_1E302FE78;
    v43 = *(_QWORD *)(a1 + 64);
    v71[4] = v41;
    v71[5] = v43;
    dispatch_sync(v42, v71);
    v44 = FigPlayerGetFigBaseObject();
    v45 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v45)
      v45(v44, *MEMORY[0x1E0CC5B30], *MEMORY[0x1E0C9AE40]);
    v46 = FigPlayerGetFigBaseObject();
    v47 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v47)
      v47(v46, *MEMORY[0x1E0CC5918], *MEMORY[0x1E0C9AE50]);
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground") & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers") & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "_isVideoPlaybackAllowedWhileInBackground") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 32), "_hasAssociatedAVPlayerLayerInPIPMode"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers");
      objc_msgSend(*(id *)(a1 + 32), "_isVideoPlaybackAllowedWhileInBackground");
      objc_msgSend(*(id *)(a1 + 32), "_hasAssociatedAVPlayerLayerInPIPMode");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground");
      objc_msgSend(*(id *)(a1 + 32), "_attachVideoLayersToFigPlayer");
    }
    objc_msgSend(*(id *)(a1 + 32), "_attachClosedCaptionLayersToFigPlayer");
    objc_msgSend(*(id *)(a1 + 32), "_attachFigPlayerToSubtitleLayers");
    objc_msgSend(*(id *)(a1 + 32), "_setNeroVideoGravityOnFigPlayer");
    v48 = *(_QWORD *)(a1 + 32);
    v49 = *(NSObject **)(*(_QWORD *)(v48 + 8) + 56);
    v70[0] = v34;
    v70[1] = 3221225472;
    v70[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_5_395;
    v70[3] = &unk_1E302FA10;
    v70[4] = v48;
    av_readwrite_dispatch_queue_write(v49, v70);
    v50 = *(void **)(a1 + 32);
    v69[0] = v34;
    v69[1] = 3221225472;
    v69[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_6_396;
    v69[3] = &unk_1E30315F0;
    v69[4] = v50;
    v69[5] = &v89;
    objc_msgSend(v50, "_applyLinkedListOfItemsToFigPlayerUsingBlock:", v69);
  }
  if (!*(_QWORD *)(a1 + 64))
    goto LABEL_47;
LABEL_45:
  if (*v3 || *(_DWORD *)(a1 + 84))
LABEL_47:
    objc_msgSend(*(id *)(a1 + 32), "_changeStatusToFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(*(_DWORD *)(a1 + 80), 0));
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("status"));
  v51 = *(_QWORD *)(a1 + 56);
  if (v51)
    (*(void (**)(uint64_t, uint64_t))(v51 + 16))(v51, v90[5]);
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v96 = 0;
    v97 = &v96;
    v98 = 0x3052000000;
    v99 = __Block_byref_object_copy__5;
    v100 = __Block_byref_object_dispose__5;
    v101 = 0;
    v52 = *(_QWORD *)(a1 + 32);
    v53 = *(NSObject **)(*(_QWORD *)(v52 + 8) + 56);
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_7_398;
    v68[3] = &unk_1E302FD60;
    v68[4] = v52;
    v68[5] = &v96;
    av_readwrite_dispatch_queue_read(v53, v68);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v54 = (void *)v97[5];
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v64, v95, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v65 != v56)
            objc_enumerationMutation(v54);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i) + 16))();
        }
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v64, v95, 16);
      }
      while (v55);
    }

    _Block_object_dispose(&v96, 8);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_interstitialPlayerIfCreated"), "_setPrimaryPlayerNameForInterstitial:", *(_QWORD *)(a1 + 40));
  v58 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyInterstitialCoordinatorIfCreated");
  if (v58)
  {
    v59 = *(void (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
    if (v59)
      v59(v58);
    CFRelease(v58);
  }
  v60 = *(const void **)(a1 + 64);
  if (v60)
    CFRelease(v60);
  v61 = *(const void **)(a1 + 72);
  if (v61)
    CFRelease(v61);
  _Block_object_dispose(&v89, 8);
}

- (AVPlayerStatus)status
{
  NSObject *ivarAccessQueue;
  AVPlayerStatus v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__AVPlayer_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isExternalPlaybackActive
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayer_isExternalPlaybackActive__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __22__AVPlayer__addLayer___block_invoke_2(uint64_t a1)
{
  const void *v2;

  if (*(_QWORD *)(a1 + 48)
    && ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground") & 1) != 0
     || (objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers") & 1) != 0
     || (objc_msgSend(*(id *)(a1 + 32), "_isIAPDExtendedModeActive") & 1) != 0
     || (objc_msgSend(*(id *)(a1 + 32), "_isVideoPlaybackAllowedWhileInBackground") & 1) != 0
     || (objc_msgSend(*(id *)(a1 + 32), "_hasAssociatedAVPlayerLayerInPIPMode") & 1) != 0
     || objc_msgSend(*(id *)(a1 + 40), "_willManageSublayersAsSwappedLayers")))
  {
    objc_msgSend(*(id *)(a1 + 32), "_attachVideoLayersToFigPlayer");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers");
    objc_msgSend(*(id *)(a1 + 32), "_isVideoPlaybackAllowedWhileInBackground");
    objc_msgSend(*(id *)(a1 + 32), "_hasAssociatedAVPlayerLayerInPIPMode");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground");
  }
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

- (BOOL)_hasForegroundLayers
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[AVPlayer _avPlayerLayers](self, "_avPlayerLayers", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      if ((v5 & 1) != 0)
        v5 = 1;
      else
        v5 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "_isPartOfForegroundScene");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (BOOL)_isVideoPlaybackAllowedWhileInBackground
{
  return 0;
}

- (BOOL)_hasAssociatedAVPlayerLayerInPIPMode
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[AVPlayer _avPlayerLayers](self, "_avPlayerLayers", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "isPIPModeEnabled") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)_clientRequestedPlaybackCoordinator
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayer_PlaybackCoordination___clientRequestedPlaybackCoordinator__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isPIPModePossible
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayer_AVPlayer_PIPSupport___isPIPModePossible__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setNeroVideoGravityOnFigPlayer
{
  OpaqueFigPlayer *v3;
  OpaqueFigPlayer *v4;
  NSObject *figConfigurationQueue;
  _QWORD block[7];
  _QWORD v7[3];
  int v8;

  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v3)
  {
    v4 = v3;
    if (_setNeroVideoGravityOnFigPlayer_sCreatesAVLayerVideoGravityToFigGravityOnce != -1)
      dispatch_once(&_setNeroVideoGravityOnFigPlayer_sCreatesAVLayerVideoGravityToFigGravityOnce, &__block_literal_global_452);
    if (objc_msgSend((id)_setNeroVideoGravityOnFigPlayer_sAVLayerVideoGravityToFigGravity, "objectForKey:", -[AVPlayer _externalPlaybackVideoGravity](self, "_externalPlaybackVideoGravity")))
    {
      v7[0] = 0;
      v7[1] = v7;
      v7[2] = 0x2020000000;
      v8 = 0;
      figConfigurationQueue = self->_player->figConfigurationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43__AVPlayer__setNeroVideoGravityOnFigPlayer__block_invoke_2;
      block[3] = &unk_1E3031868;
      block[4] = self;
      block[5] = v7;
      block[6] = v4;
      dispatch_sync(figConfigurationQueue, block);
      _Block_object_dispose(v7, 8);
    }
    CFRelease(v4);
  }
}

uint64_t __43__AVPlayer__setNeroVideoGravityOnFigPlayer__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend((id)_setNeroVideoGravityOnFigPlayer_sAVLayerVideoGravityToFigGravity, "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "_externalPlaybackVideoGravity"));
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5A88], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_externalPlaybackVideoGravity
{
  NSObject *ivarAccessQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AVPlayer__externalPlaybackVideoGravity__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_pendingFigPlayerProperties
{
  NSObject *ivarAccessQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayer__pendingFigPlayerProperties__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAirPlayVideoActive
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayer__isAirPlayVideoActive__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_attachVideoLayersToFigPlayer
{
  OpaqueFigPlayer *v3;
  uint64_t FigBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD);
  uint64_t v6;
  unsigned int (*v7)(uint64_t, _QWORD, _QWORD);
  const __CFArray *v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, _QWORD, const __CFArray *);
  BOOL v11;

  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
  {
    if (!v5(FigBaseObject, *MEMORY[0x1E0CC5B30], *MEMORY[0x1E0C9AE40]))
    {
      v6 = FigPlayerGetFigBaseObject();
      v7 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v7)
      {
        if (!v7(v6, *MEMORY[0x1E0CC5918], *MEMORY[0x1E0C9AE50]))
        {
          v8 = -[AVPlayer _videoLayers](self, "_videoLayers");
          v9 = FigPlayerGetFigBaseObject();
          v10 = *(unsigned int (**)(uint64_t, _QWORD, const __CFArray *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 8)
                                                                                  + 56);
          if (v10)
          {
            if (!v10(v9, *MEMORY[0x1E0CC5B90], v8))
            {
              -[AVPlayer _evaluateDisplaySizeOfAllAttachedLayers](self, "_evaluateDisplaySizeOfAllAttachedLayers");
              v11 = v8 && CFArrayGetCount(v8) > 0;
              self->_player->videoLayersAreAttached = v11;
            }
          }
        }
      }
    }
  }
  if (v3)
    CFRelease(v3);
}

- (id)_videoLayers
{
  NSObject *layersQ;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__AVPlayer__videoLayers__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_attachFigPlayerToSubtitleLayers
{
  OpaqueFigPlayer *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[AVPlayer _subtitleLayers](self, "_subtitleLayers", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPlayer:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  if (v3)
    CFRelease(v3);
}

- (id)_subtitleLayers
{
  NSObject *layersQ;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayer__subtitleLayers__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_attachClosedCaptionLayersToFigPlayer
{
  OpaqueFigPlayer *v3;
  id v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, id);

  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v4 = -[AVPlayer _closedCaptionLayers](self, "_closedCaptionLayers");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v6 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
    v6(FigBaseObject, *MEMORY[0x1E0CC5970], v4);
  if (v3)
    CFRelease(v3);
}

- (void)_applyLinkedListOfItemsToFigPlayerUsingBlock:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVPlayer__applyLinkedListOfItemsToFigPlayerUsingBlock___block_invoke;
  block[3] = &unk_1E3031690;
  block[4] = self;
  block[5] = &v13;
  block[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v8[5], v14[5]);

  self->_player->itemsInFigPlayQueue = (NSArray *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
}

- (void)setAudioSession:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *ivarAccessQueue;
  void *v11;
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (!a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"audioSession != nil"), 0);
    objc_exception_throw(v11);
  }
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AVPlayer_AVPlayerAudioSessionParticipant__setAudioSession___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v13;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v14 + 24))
    -[AVPlayer _updateAudioSessionOnFigPlayer](self, "_updateAudioSessionOnFigPlayer");
  objc_msgSend(-[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated"), "setAudioSession:", a3);
  _Block_object_dispose(&v13, 8);
}

- (id)_updateAudioSessionOnFigPlayer
{
  NSObject *figConfigurationQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  figConfigurationQueue = self->_player->figConfigurationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayer__updateAudioSessionOnFigPlayer__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(figConfigurationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_playbackCoordinatorWithoutTriggeringFullSetup
{
  NSObject *ivarAccessQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__AVPlayer_PlaybackCoordination___playbackCoordinatorWithoutTriggeringFullSetup__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __18__AVPlayer_volume__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 376);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __57__AVPlayer__applyLinkedListOfItemsToFigPlayerUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 200);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 200) = objc_alloc_init(MEMORY[0x1E0C99D20]);
  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_items_invokeOnIvarAccessQueue"), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)_items_invokeOnIvarAccessQueue
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableSet count](self->_player->items, "count"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayer__items_invokeOnIvarAccessQueue__block_invoke;
  v5[3] = &unk_1E3031708;
  v5[4] = v3;
  -[AVPlayer _enumerateItemsUsingBlock:](self, "_enumerateItemsUsingBlock:", v5);
  return v3;
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
  AVPlayerItem *currentItem;
  uint64_t v5;
  char v6;

  currentItem = self->_player->currentItem;
  do
  {
    if (!currentItem)
      break;
    v5 = -[AVPlayerItem _nextItem](currentItem, "_nextItem");
    v6 = 0;
    (*((void (**)(id, AVPlayerItem *, char *))a3 + 2))(a3, currentItem, &v6);
    currentItem = (AVPlayerItem *)v5;
  }
  while (!v6);
}

uint64_t __42__AVPlayer__items_invokeOnIvarAccessQueue__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

id __74__AVPlayer_AVPlayerLegibleFallback__legibleFallbackMediaSelectionCriteria__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 752);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __74__AVPlayer_AVPlayerAutomaticMediaSelection___cachedMediaSelectionCriteria__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 632), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __39__AVPlayer__pendingFigPlayerProperties__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 208), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

_QWORD *__61__AVPlayer_AVPlayerAudioSessionParticipant__setAudioSession___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  if (*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 216) != result[5])
  {
    v1 = result;
    *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 1;

    result = (id)v1[5];
    *(_QWORD *)(*(_QWORD *)(v1[4] + 8) + 216) = result;
  }
  return result;
}

- (BOOL)isDisplayingClosedCaptions
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayer_isDisplayingClosedCaptions__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVPlayer_setUsesExternalPlaybackWhileExternalScreenIsActive___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 408) = *(_BYTE *)(result + 40);
  return result;
}

- (void)play
{
  double v3;
  float v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
  {
    -[AVPlayer defaultRate](self, "defaultRate");
    v4 = *(float *)&v3;
  }
  else
  {
    v4 = 1.0;
    if (dword_1ECDECF38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  *(float *)&v3 = v4;
  -[AVPlayer setRate:](self, "setRate:", v3, v6, v7);
}

- (float)defaultRate
{
  NSObject *ivarAccessQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 1065353216;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__AVPlayer_defaultRate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
    FigKTraceInit();
    if (dyld_program_sdk_at_least())
    {
      sWaitsToMinimizeStallingByDefault = 1;
      sSetRateAtHostTimeThrowsWhenWaitingToMinimizeStalling = 1;
    }
    objc_msgSend(a1, "registerForScreenConnectionChanges");
  }
}

+ (id)keyPathsForValuesAffectingVolume
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("status"));
}

id __17__AVPlayer_error__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 168);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (AVPlayer)initWithPlayerItem:(AVPlayerItem *)item
{
  AVPlayer *v5;
  AVPlayer *v6;
  AVPlayer *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15[6];

  v5 = -[AVPlayer init](self, "init");
  v6 = v5;
  if (item && v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = v6;
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)CFSTR("Item must be an instance of AVPlayerItem."), v9, v10, v11, v12, v13, v15[0]), 0);
      objc_exception_throw(v14);
    }
    -[AVPlayerItem _attachToPlayer:](item, "_attachToPlayer:", v6);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = (uint64_t)__31__AVPlayer_initWithPlayerItem___block_invoke_2;
    v15[3] = (uint64_t)&unk_1E302FCE8;
    v15[4] = (uint64_t)v6;
    v15[5] = (uint64_t)item;
    -[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:](v6, "_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:", &__block_literal_global_5, v15, 0);
  }
  return v6;
}

- (void)replaceCurrentItemWithPlayerItem:(AVPlayerItem *)item
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD v16[7];
  os_log_type_t type;
  int v18;
  id v19[23];

  v19[22] = *(id *)MEMORY[0x1E0C80C00];
  v19[0] = 0;
  if (item)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Item must be an instance of AVPlayerItem."), v6, v7, v8, v9, v10, v13), 0);
      objc_exception_throw(v12);
    }
  }
  if (dword_1ECDECF38)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVPlayerItem _attachToPlayer:](item, "_attachToPlayer:", self, v13, v14);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__AVPlayer_replaceCurrentItemWithPlayerItem___block_invoke;
  v16[3] = &unk_1E30316E0;
  v16[4] = item;
  v16[5] = self;
  v16[6] = a2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__AVPlayer_replaceCurrentItemWithPlayerItem___block_invoke_2;
  v15[3] = &unk_1E302FCE8;
  v15[4] = self;
  v15[5] = item;
  if (!-[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:](self, "_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:", v16, v15, v19)&& objc_msgSend(v19[0], "code") == -11999)
  {
    objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v19[0], "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey")));
  }
}

id __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 200), "firstObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:(id)a3 modificationBlock:(id)a4 error:(id *)a5
{
  AVResult *v9;
  NSObject *ivarAccessQueue;
  void (*v11)(_QWORD);
  id v12;
  AVPlayerInternal *player;
  AVBlockScheduler *KVOChangeSerializer;
  NSObject *stateDispatchQueue;
  BOOL v16;
  void (*v18[5])(_QWORD);
  _QWORD v19[9];
  _QWORD block[10];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v9 = objc_alloc_init(AVResult);
  v31 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v11 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke;
  block[3] = &unk_1E3031438;
  block[8] = &v27;
  block[9] = &v21;
  block[4] = v9;
  block[5] = self;
  block[6] = a3;
  block[7] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v12 = (id)v22[5];
  if (!-[AVResult isFailed](v9, "isFailed"))
  {
    player = self->_player;
    if (*((_BYTE *)v28 + 24))
    {
      KVOChangeSerializer = player->KVOChangeSerializer;
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_2;
      v19[3] = &unk_1E30314B0;
      v19[4] = self;
      v19[5] = v9;
      v19[6] = a3;
      v19[7] = a4;
      v19[8] = &v21;
      -[AVBlockScheduler scheduleBlock:](KVOChangeSerializer, "scheduleBlock:", v19);
      if (-[AVResult isFailed](v9, "isFailed"))
        goto LABEL_7;
    }
    else
    {
      stateDispatchQueue = player->stateDispatchQueue;
      v18[0] = v11;
      v18[1] = (void (*)(_QWORD))3221225472;
      v18[2] = (void (*)(_QWORD))__109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_3;
      v18[3] = (void (*)(_QWORD))&unk_1E302FA10;
      v18[4] = (void (*)(_QWORD))self;
      AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v18);
    }
    -[AVResult markAsCompleted](v9, "markAsCompleted");
  }
LABEL_7:
  -[AVResult getStatus:error:](v9, "getStatus:error:", &v31, a5);

  v16 = v31 == 1;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v16;
}

uint64_t __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 656);
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "removeObject:", v2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v4 != objc_msgSend(v3, "count");
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 672);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "removeObject:", v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v7 != objc_msgSend(v5, "count");
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 664);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = objc_msgSend(v8, "count");
  objc_msgSend(v8, "removeObject:", v9);
  result = objc_msgSend(v8, "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v10 != (_DWORD)result;
  if (*(_QWORD *)(a1 + 64))
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 680), "containsObject:");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(a1 + 64), "_willManageSublayersAsSwappedLayers");
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 680), "removeObject:", *(_QWORD *)(a1 + 64));
    }
  }
  return result;
}

void __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_3(_QWORD *a1)
{
  CFTypeRef v2;
  const void *v3;
  uint64_t v4;
  const void *v5;

  v2 = (CFTypeRef)a1[6];
  if (v2)
    v2 = CFRetain(v2);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 728) = v2;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 240) = 1;
  v3 = (const void *)a1[5];
  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = *(const void **)(v4 + 280);
  *(_QWORD *)(v4 + 280) = v3;
  if (v3)
    CFRetain(v3);
  if (v5)
    CFRelease(v5);
}

void __76__AVPlayer_AVPlayerMultichannelAudioStrategy__setMultichannelAudioStrategy___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 448) = *(_QWORD *)(a1 + 40);
}

+ (AVPlayerHDRMode)availableHDRModes
{
  AVPlayerHDRMode result;
  const __CFArray *v3;
  AVPlayerHDRMode context;
  CFRange v5;

  context = 0;
  result = FPSupport_CreateAllVideoRangesSupportedByDisplays();
  if (result)
  {
    v3 = (const __CFArray *)result;
    v5.length = CFArrayGetCount((CFArrayRef)result);
    v5.location = 0;
    CFArrayApplyFunction(v3, v5, (CFArrayApplierFunction)addToHDRModes, &context);
    CFRelease(v3);
    return context;
  }
  return result;
}

uint64_t __75__AVPlayer_AVPlayerInterstitialSupport_Internal___setIsInterstitialPlayer___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 556) = *(_BYTE *)(result + 40);
  return result;
}

float __27__AVPlayer_setDefaultRate___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 500) = result;
  return result;
}

float __22__AVPlayer_setVolume___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 376) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingMuted
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("status"));
}

+ (void)registerForScreenConnectionChanges
{
  CMNotificationCenterGetDefaultLocalCenter();
  objc_opt_class();
  FPSupport_GetDisplayVideoRangeNotificationSingleton();
  CMNotificationCenterAddListener();
}

- (id)outputContext
{
  OpaqueFigPlayer *v3;
  uint64_t v4;
  OpaqueFigPlayer *v5;
  uint64_t FigBaseObject;
  unsigned int (*v7)(uint64_t, uint64_t, _QWORD, CFTypeRef *);
  id v8;
  id v9;
  CFTypeRef v10;
  CFTypeRef cf;

  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  cf = 0;
  v4 = *MEMORY[0x1E0CC5AB8];
  if (v3)
  {
    v5 = v3;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
    if (!v7 || v7(FigBaseObject, v4, *MEMORY[0x1E0C9AE00], &cf))
      v8 = 0;
    else
      v8 = +[AVOutputContext outputContextForID:](AVOutputContext, "outputContextForID:", cf);
    CFRelease(v5);
    v10 = cf;
    if (cf)
      goto LABEL_9;
  }
  else
  {
    v9 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E0CC5AB8]);
    if (v9)
      v10 = CFRetain(v9);
    else
      v10 = 0;
    cf = v10;
    v8 = +[AVOutputContext outputContextForID:](AVOutputContext, "outputContextForID:", v10);
    if (v10)
LABEL_9:
      CFRelease(v10);
  }
  return v8;
}

- (void)_createAndConfigureFigPlayerWithType:(int64_t)a3 completionHandler:(id)a4
{
  id v7;
  __CFDictionary *Mutable;
  const void *v9;
  _BOOL4 v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  id v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  AVAudioSession *v22;
  AVAudioSession *v23;
  const void *v24;
  int v25;
  void (*v26)(_QWORD);
  void (*v27[9])(_QWORD);
  int v28;
  CFTypeRef v29;

  v29 = 0;
  v7 = +[AVPlayer _makePlayerName](AVPlayer, "_makePlayerName");
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC5820], -[AVPlayer _nameForLogging](self, "_nameForLogging"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC5830], v7);
  v9 = (const void *)*MEMORY[0x1E0CC5838];
  v10 = -[AVPlayer _preservesAudioSessionSampleRate](self, "_preservesAudioSessionSampleRate");
  v11 = (const void *)*MEMORY[0x1E0C9AE50];
  v12 = (const void *)*MEMORY[0x1E0C9AE40];
  if (v10)
    v13 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v13 = (const void *)*MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(Mutable, v9, v13);
  v14 = (const void *)*MEMORY[0x1E0CC5828];
  if (-[AVPlayer _participatesInAudioSession](self, "_participatesInAudioSession"))
    v15 = v11;
  else
    v15 = v12;
  CFDictionarySetValue(Mutable, v14, v15);
  v16 = (const void *)*MEMORY[0x1E0CC5818];
  v17 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E0CC5818]);
  if (v17)
  {
    CFDictionarySetValue(Mutable, v16, v17);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC5800], v12);
  }
  v18 = (const void *)*MEMORY[0x1E0CC5848];
  if (-[AVPlayer _supportsAdvanceTimeForOverlappedPlayback](self, "_supportsAdvanceTimeForOverlappedPlayback"))
    v19 = v11;
  else
    v19 = v12;
  CFDictionarySetValue(Mutable, v18, v19);
  v20 = (const void *)*MEMORY[0x1E0CC5810];
  if (-[AVPlayer supportsSpeedRamps](self, "supportsSpeedRamps"))
    v21 = v11;
  else
    v21 = v12;
  CFDictionarySetValue(Mutable, v20, v21);
  v22 = -[AVPlayer audioSession](self, "audioSession");
  v23 = v22;
  if (v22)
  {
    -[AVAudioSession opaqueSessionID](v22, "opaqueSessionID");
    FigCFDictionarySetInt32();
  }
  if (-[AVPlayer shouldWaitForVideoTarget](self, "shouldWaitForVideoTarget"))
    v24 = v11;
  else
    v24 = v12;
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC5840], v24);
  v25 = objc_msgSend((id)objc_opt_class(), "_createFigPlayerWithType:options:player:", a3, Mutable, &v29);
  if (Mutable)
    CFRelease(Mutable);
  if (v29)
  {
    CFRetain(v29);
    v26 = (void (*)(_QWORD))v29;
  }
  else
  {
    v26 = 0;
  }
  v27[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v27[1] = (void (*)(_QWORD))3221225472;
  v27[2] = (void (*)(_QWORD))__67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke;
  v27[3] = (void (*)(_QWORD))&unk_1E3031640;
  v27[7] = (void (*)(_QWORD))a4;
  v27[8] = v26;
  v28 = v25;
  v27[4] = (void (*)(_QWORD))self;
  v27[5] = (void (*)(_QWORD))v7;
  v27[6] = (void (*)(_QWORD))v23;
  AVEnsureNotOnMainThread(v27);
  if (v29)
    CFRelease(v29);
}

- (BOOL)shouldWaitForVideoTarget
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayer_FigVideoTargetSupport__shouldWaitForVideoTarget__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_preservesAudioSessionSampleRate
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
  v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__AVPlayer_AVPlayerAudioSessionParticipant___preservesAudioSessionSampleRate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_participatesInAudioSession
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
  v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayer_AVPlayerAudioSessionParticipant___participatesInAudioSession__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_supportsAdvanceTimeForOverlappedPlayback
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
  v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__AVPlayer_AVPlayerAdvanceWithOverlap___supportsAdvanceTimeForOverlappedPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (int)_createFigPlayerWithType:(int64_t)a3 options:(__CFDictionary *)a4 player:(OpaqueFigPlayer *)a5
{
  int v6;

  CFPreferencesGetAppBooleanValue(CFSTR("surrogate_player_disabled"), CFSTR("com.apple.avfoundation"), 0);
  CFPreferencesGetAppBooleanValue(CFSTR("coordinator_player_disabled"), CFSTR("com.apple.avfoundation"), 0);
  FigSharedPlayerGetDefaultEngineTopology();
  v6 = FigSharedPlayerCreateWithOptions();
  if (a5)
    *a5 = 0;
  return v6;
}

__n128 __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  uint64_t FigBaseObject;
  uint64_t (*v11)(uint64_t, _QWORD, uint64_t, CFBooleanRef *);
  int v12;
  CFBooleanRef v13;
  BOOL v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, _QWORD, uint64_t, CFBooleanRef *);
  int v17;
  CFBooleanRef v18;
  BOOL v19;
  _BOOL4 v20;
  uint64_t v21;
  void (*v22)(uint64_t, _QWORD, uint64_t, uint64_t *);
  uint64_t v23;
  uint64_t (*v24)(uint64_t, _QWORD, uint64_t, CFBooleanRef *);
  int v25;
  CFBooleanRef v26;
  BOOL v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, _QWORD, uint64_t, CFBooleanRef *);
  int v30;
  CFBooleanRef v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, _QWORD);
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  __n128 result;
  void (*v46[4])(_QWORD);
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  BOOL v53;
  BOOL v54;
  BOOL v55;
  BOOL v56;
  CFBooleanRef v57;
  CFBooleanRef v58;
  CFBooleanRef BOOLean;
  uint64_t v60;
  _QWORD v61[4];
  _QWORD v62[5];

  v62[4] = *MEMORY[0x1E0C80C00];
  v60 = 0;
  v2 = *(_QWORD *)(a1 + 64);
  if (!v2 || *(_DWORD *)(a1 + 72))
  {
    v3 = 0;
    LOBYTE(v4) = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    goto LABEL_56;
  }
  BOOLean = 0;
  v9 = *MEMORY[0x1E0C9AE00];
  FigBaseObject = FigPlayerGetFigBaseObject();
  v11 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v11)
  {
    v4 = 0;
    goto LABEL_15;
  }
  v12 = v11(FigBaseObject, *MEMORY[0x1E0CC5A20], v9, &BOOLean);
  v13 = BOOLean;
  if (v12)
    v14 = 1;
  else
    v14 = BOOLean == 0;
  if (v14)
  {
    v4 = 0;
    if (BOOLean)
    {
LABEL_14:
      CFRelease(v13);
      BOOLean = 0;
    }
  }
  else
  {
    v4 = CFBooleanGetValue(BOOLean) != 0;
    v13 = BOOLean;
    if (BOOLean)
      goto LABEL_14;
  }
LABEL_15:
  v58 = 0;
  v15 = FigPlayerGetFigBaseObject();
  v16 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v16)
  {
    v6 = 0;
    goto LABEL_26;
  }
  v17 = v16(v15, *MEMORY[0x1E0CC5A28], v9, &v58);
  v18 = v58;
  if (v17)
    v19 = 1;
  else
    v19 = v58 == 0;
  if (v19)
  {
    v6 = 0;
    if (v58)
    {
LABEL_25:
      CFRelease(v18);
      v58 = 0;
    }
  }
  else
  {
    v6 = CFBooleanGetValue(v58) != 0;
    v18 = v58;
    if (v58)
      goto LABEL_25;
  }
LABEL_26:
  if (v4)
  {
    v20 = 1;
  }
  else
  {
    v57 = 0;
    v28 = FigPlayerGetFigBaseObject();
    v29 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
    if (v29)
    {
      v30 = v29(v28, *MEMORY[0x1E0CC5A30], v9, &v57);
      v31 = v57;
      if (v30)
        v32 = 1;
      else
        v32 = v57 == 0;
      if (v32)
      {
        v20 = 0;
      }
      else
      {
        v20 = CFBooleanGetValue(v57) != 0;
        v31 = v57;
      }
      if (v31)
        CFRelease(v31);
    }
    else
    {
      v20 = 0;
    }
  }
  v21 = FigPlayerGetFigBaseObject();
  v22 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v22)
    v22(v21, *MEMORY[0x1E0CC5A48], v9, &v60);
  v57 = 0;
  v23 = FigPlayerGetFigBaseObject();
  v24 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v24)
  {
    v25 = v24(v23, *MEMORY[0x1E0CC5AB0], v9, &v57);
    v26 = v57;
    if (v25)
      v27 = 1;
    else
      v27 = v57 == 0;
    if (v27)
    {
      v7 = 0;
      if (v25 == -12784)
        v8 = 0;
      else
        v8 = v25;
      if (!v57)
        goto LABEL_51;
    }
    else
    {
      v8 = 0;
      v7 = CFBooleanGetValue(v57) != 0;
      v26 = v57;
      if (!v57)
        goto LABEL_51;
    }
    CFRelease(v26);
  }
  else
  {
    v7 = 0;
    v8 = -12782;
  }
LABEL_51:
  v33 = *MEMORY[0x1E0C9AE50];
  v34 = *MEMORY[0x1E0CC5998];
  v61[0] = *MEMORY[0x1E0CC58E0];
  v61[1] = v34;
  v62[0] = v33;
  v62[1] = v33;
  v35 = *MEMORY[0x1E0CC59D8];
  v61[2] = *MEMORY[0x1E0CC59F8];
  v61[3] = v35;
  v62[2] = v33;
  v62[3] = v33;
  v36 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 4), "mutableCopy");
  v37 = v36;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88))
    objc_msgSend(v36, "setObject:forKey:", v33, *MEMORY[0x1E0CC5A18]);
  v38 = *(_QWORD *)(a1 + 64);
  v39 = *(void (**)(uint64_t, void *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
  if (v39)
    v39(v38, v37, 0);

  v5 = v20;
  v2 = *(_QWORD *)(a1 + 64);
  v3 = v60;
LABEL_56:
  v40 = *(_OWORD *)(a1 + 32);
  v41 = *(_OWORD *)(a1 + 48);
  v42 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v46[1] = (void (*)(_QWORD))3221225472;
  v46[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v43 = *(_DWORD *)(a1 + 72);
  v44 = *(NSObject **)(v42 + 32);
  v46[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_2;
  v46[3] = (void (*)(_QWORD))&unk_1E3031618;
  v51 = v8;
  v52 = v43;
  v53 = v4;
  v54 = v5;
  v55 = v6;
  v49 = v2;
  v50 = v3;
  v56 = v7;
  v47 = v40;
  v48 = v41;
  AVSerializeOnQueueAsyncIfNecessary(v44, v46);
  return result;
}

+ (id)_makePlayerName
{
  uint64_t v2;

  v2 = getpid();
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.avfoundation.AVPlayer.%d-%d"), v2, FigAtomicIncrement32());
}

void __42__AVPlayer__updateAudioSessionOnFigPlayer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  uint64_t SInt32;
  const void *v6;
  uint64_t FigBaseObject;
  void (*v8)(uint64_t, _QWORD, const void *);
  NSObject *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyFigPlayer");
  if (v2)
  {
    v3 = (const void *)v2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(*(id *)(a1 + 32), "audioSession");
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v4)
    {
      objc_msgSend(v4, "opaqueSessionID");
      SInt32 = FigCFNumberCreateSInt32();
      if (SInt32)
      {
        v6 = (const void *)SInt32;
        FigBaseObject = FigPlayerGetFigBaseObject();
        v8 = *(void (**)(uint64_t, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v8)
          v8(FigBaseObject, *MEMORY[0x1E0CC5930], v6);
        if (dword_1ECDECF38)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        CFRelease(v6);
      }
      else
      {
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    CFRelease(v3);
  }
}

- (AVAudioSession)audioSession
{
  NSObject *ivarAccessQueue;
  AVAudioSession *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AVPlayer_AVPlayerAudioSessionParticipant__audioSession__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (AVAudioSession *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_7(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 560) = result;
  return result;
}

- (void)_setParticipatesInAudioSession:(BOOL)a3
{
  AVPlayerInternal *player;
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  player = self->_player;
  if (!player->needsToCreateFigPlayer)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set participatesInAudioSession after the AVPlayer has begun preparing for playback."), 0));
  ivarAccessQueue = player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__AVPlayer_AVPlayerAudioSessionParticipant___setParticipatesInAudioSession___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
}

_QWORD *__51__AVPlayer_setAudiovisualBackgroundPlaybackPolicy___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 288) != result[6];
  *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 288) = result[6];
  return result;
}

void __102__AVPlayer_AVPlayerInterstitialSupport_Internal___copyInterstitialEventCoordinatorEnsuringItIsRemote___block_invoke(uint64_t a1)
{
  CFTypeRef v2;
  const void *v3;

  if (!*(_BYTE *)(a1 + 56))
  {
    v2 = 0;
    goto LABEL_13;
  }
  if (FigPlayerInterstitialCoordinatorIsRemote())
  {
    v2 = 0;
  }
  else
  {
    v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v3)
      v2 = CFRetain(v3);
    else
      v2 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:", 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_13:
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 556))
    {
      FigPlayerInterstitialCoordinatorCreate();
      objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinatorOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      objc_msgSend(*(id *)(a1 + 32), "_setExternalPlaybackInterstitialSchedulingStrategyOnCoordinator_invokeOnIvarAccessQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      if (!v2)
        return;
LABEL_16:
      CFRelease(v2);
      return;
    }
LABEL_15:
    if (!v2)
      return;
    goto LABEL_16;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    goto LABEL_15;
  FigPlayerInterstitialRemoteCoordinatorCreate();
  objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinatorOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (v2)
    goto LABEL_16;
}

- (void)_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  AVPlayerInternal *player;
  OpaqueFigPlayerInterstitialCoordinator *interstitialEventCoordinator;

  -[AVPlayer _removeListenersFromInterstitialCoordinator:](self, "_removeListenersFromInterstitialCoordinator:", self->_player->interstitialEventCoordinator);
  player = self->_player;
  interstitialEventCoordinator = player->interstitialEventCoordinator;
  player->interstitialEventCoordinator = a3;
  if (a3)
    CFRetain(a3);
  if (interstitialEventCoordinator)
    CFRelease(interstitialEventCoordinator);
  -[AVPlayer _addListenersToInterstitialCoordinator:](self, "_addListenersToInterstitialCoordinator:", a3);
}

- (void)_removeListenersFromInterstitialCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = -[AVPlayer _weakReference](self, "_weakReference");
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, avplayer_fpInterstitialCoordinatorNotificationCallback, *MEMORY[0x1E0CC56C8], a3);
  }
}

- (void)_addListenersToInterstitialCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = -[AVPlayer _weakReference](self, "_weakReference");
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, avplayer_fpInterstitialCoordinatorNotificationCallback, *MEMORY[0x1E0CC56C8], a3, 0);
  }
}

uint64_t __63__AVPlayer_AVPlayerPIPSupport__backgroundPIPAuthorizationToken__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 608), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __85__AVPlayer_AVPlayerAdvanceWithOverlap___setSupportsAdvanceTimeForOverlappedPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 409) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __75__AVPlayer__setRateDidChangeNotificationIncludesExtendedDiagnosticPayload___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 616) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __53__AVPlayer_PlaybackCoordination__playbackCoordinator__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 600) = 1;
  return result;
}

- (float)volume
{
  NSObject *ivarAccessQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 1065353216;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__AVPlayer_volume__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVPlayer__setNeroVideoGravityOnFigPlayer__block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", *MEMORY[0x1E0CC5740], CFSTR("AVLayerVideoGravityResize"), *MEMORY[0x1E0CC5748], CFSTR("AVLayerVideoGravityResizeAspect"), *MEMORY[0x1E0CC5750], CFSTR("AVLayerVideoGravityResizeAspectFill"), 0);
  _setNeroVideoGravityOnFigPlayer_sAVLayerVideoGravityToFigGravity = result;
  return result;
}

id __47__AVPlayer_FigVideoTargetSupport__videoTargets__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 568);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSError)error
{
  NSObject *ivarAccessQueue;
  NSError *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __17__AVPlayer_error__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)addPeriodicTimeObserverForInterval:(CMTime *)interval queue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AVPeriodicTimebaseObserver *v15;
  OpaqueCMTimebase *proxyTimebase;
  void *v18;
  __int128 v19;
  CMTimeEpoch epoch;

  v5 = block;
  if (!block)
  {
    if (dyld_program_sdk_at_least())
    {
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"block != nil"), 0);
      objc_exception_throw(v18);
    }
    v5 = &__block_literal_global_443;
  }
  v15 = [AVPeriodicTimebaseObserver alloc];
  proxyTimebase = self->_player->proxyTimebase;
  v19 = *(_OWORD *)&interval->value;
  epoch = interval->epoch;
  return -[AVPeriodicTimebaseObserver initWithTimebase:interval:queue:block:](v15, "initWithTimebase:interval:queue:block:", proxyTimebase, &v19, queue, v5);
}

- (CMTime)currentTime
{
  CMTime *result;
  uint64_t v5;

  result = -[AVPlayer currentItem](self, "currentItem");
  if (result)
    return (CMTime *)-[CMTime currentTime](result, "currentTime");
  v5 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&retstr->value = *MEMORY[0x1E0CA2E18];
  retstr->epoch = *(_QWORD *)(v5 + 16);
  return result;
}

- (void)setDefaultRate:(float)defaultRate
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  float v5;

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__AVPlayer_setDefaultRate___block_invoke;
  v4[3] = &unk_1E30317D0;
  v4[4] = self;
  v5 = defaultRate;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

- (void)setAudiovisualBackgroundPlaybackPolicy:(AVPlayerAudiovisualBackgroundPlaybackPolicy)audiovisualBackgroundPlaybackPolicy
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVPlayer_setAudiovisualBackgroundPlaybackPolicy___block_invoke;
  block[3] = &unk_1E3031988;
  block[4] = self;
  block[5] = &v6;
  block[6] = audiovisualBackgroundPlaybackPolicy;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v7 + 24))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVPlayerAudiovisualBackgroundPlaybackPolicyDidChangeNotification"), self, 0);
  _Block_object_dispose(&v6, 8);
}

- (NSString)backgroundPIPAuthorizationToken
{
  NSObject *ivarAccessQueue;
  NSString *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVPlayer_AVPlayerPIPSupport__backgroundPIPAuthorizationToken__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setRateDidChangeNotificationIncludesExtendedDiagnosticPayload:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__AVPlayer__setRateDidChangeNotificationIncludesExtendedDiagnosticPayload___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter
{
  AVPlayerItem *v8;
  __int128 v9;
  CMTimeEpoch v10;
  __int128 v11;
  CMTimeEpoch v12;
  __int128 v13;
  CMTimeEpoch epoch;

  v8 = -[AVPlayer currentItem](self, "currentItem");
  if (v8)
  {
    v13 = *(_OWORD *)&time->value;
    epoch = time->epoch;
    v11 = *(_OWORD *)&toleranceBefore->value;
    v12 = toleranceBefore->epoch;
    v9 = *(_OWORD *)&toleranceAfter->value;
    v10 = toleranceAfter->epoch;
    -[AVPlayerItem seekToTime:toleranceBefore:toleranceAfter:completionHandler:](v8, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v13, &v11, &v9, 0);
  }
}

- (void)setMultichannelAudioStrategy:(id)a3
{
  uint64_t v4;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD v10[7];
  _QWORD v11[3];
  int v12;
  _QWORD block[6];

  v4 = objc_msgSend(a3, "copy");
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVPlayer_AVPlayerMultichannelAudioStrategy__setMultichannelAudioStrategy___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __76__AVPlayer_AVPlayerMultichannelAudioStrategy__setMultichannelAudioStrategy___block_invoke_2;
    v10[3] = &unk_1E3031988;
    v10[5] = v11;
    v10[6] = v8;
    v10[4] = self;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v8);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v4, *MEMORY[0x1E0CC5A78]);
  }
  -[AVPlayer _canOverlapPlaybackConditionsChanged](self, "_canOverlapPlaybackConditionsChanged");
}

- (void)setVolume:(float)volume
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  double v7;
  uint64_t v8;
  OpaqueFigPlayer *v9;
  OpaqueFigPlayer *v10;
  NSObject *figConfigurationQueue;
  _QWORD v12[7];
  _QWORD v13[3];
  int v14;
  _QWORD block[5];
  float v16;

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__AVPlayer_setVolume___block_invoke;
  block[3] = &unk_1E30317D0;
  block[4] = self;
  v16 = volume;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  *(float *)&v7 = volume;
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v8, *MEMORY[0x1E0CC5BA8]);
  v9 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v9)
  {
    v10 = v9;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v14 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __22__AVPlayer_setVolume___block_invoke_2;
    v12[3] = &unk_1E3031868;
    v12[4] = self;
    v12[5] = v13;
    v12[6] = v10;
    dispatch_sync(figConfigurationQueue, v12);
    _Block_object_dispose(v13, 8);
    CFRelease(v10);
  }
}

- (void)_setSupportsAdvanceTimeForOverlappedPlayback:(BOOL)a3
{
  AVPlayerInternal *player;
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  player = self->_player;
  if (!player->needsToCreateFigPlayer)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set supportsAdvanceTimeForOverlappedPlayback after the AVPlayer has begun preparing for playback."), 0));
  ivarAccessQueue = player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__AVPlayer_AVPlayerAdvanceWithOverlap___setSupportsAdvanceTimeForOverlappedPlayback___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
}

void __94__AVPlayer_AVPlayerAutomaticMediaSelection__setMediaSelectionCriteria_forMediaCharacteristic___block_invoke_2(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, uint64_t);

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFigPlayer");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_cachedMediaSelectionCriteria");
  if (v2)
  {
    v4 = v3;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v6(FigBaseObject, *MEMORY[0x1E0CC5A68], v4);
    CFRelease(v2);
  }
}

uint64_t __94__AVPlayer_AVPlayerAutomaticMediaSelection__setMediaSelectionCriteria_forMediaCharacteristic___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t result;

  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 632), "mutableCopy");
  if (!v2)
    v2 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)a1[5];
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", objc_msgSend(v3, "figDictionary"), AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(a1[6]));
  else
    objc_msgSend(v2, "removeObjectForKey:", AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(a1[6]));

  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 632) = result;
  return result;
}

uint64_t __90__AVPlayer_AVPlayerLegibleFallback__setAllowsLegibleFallbackForAllAudibleMediaSelections___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 745) = *(_BYTE *)(result + 40);
  return result;
}

void __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_4(uint64_t a1)
{
  const void *v2;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_attachClosedCaptionLayersToFigPlayer");
    v2 = *(const void **)(a1 + 40);
    if (v2)
      CFRelease(v2);
  }
}

void __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_3(uint64_t a1)
{
  const void *v2;

  if (*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_videoLayers"), "count")
      && ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground") & 1) != 0
       || (objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers") & 1) != 0
       || (objc_msgSend(*(id *)(a1 + 32), "_isIAPDExtendedModeActive") & 1) != 0
       || (objc_msgSend(*(id *)(a1 + 32), "_isVideoPlaybackAllowedWhileInBackground") & 1) != 0
       || (objc_msgSend(*(id *)(a1 + 32), "_hasAssociatedAVPlayerLayerInPIPMode") & 1) != 0
       || objc_msgSend(*(id *)(a1 + 40), "_willManageSublayersAsSwappedLayers")))
    {
      objc_msgSend(*(id *)(a1 + 32), "_attachVideoLayersToFigPlayer");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers");
      objc_msgSend(*(id *)(a1 + 32), "_isVideoPlaybackAllowedWhileInBackground");
      objc_msgSend(*(id *)(a1 + 32), "_hasAssociatedAVPlayerLayerInPIPMode");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground");
      objc_msgSend(*(id *)(a1 + 32), "_detachVideoLayersFromFigPlayer:", *(_QWORD *)(a1 + 48));
    }
    v2 = *(const void **)(a1 + 48);
    if (v2)
      CFRelease(v2);
  }
}

uint64_t __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDecoderPixelBufferAttributes:onFigPlayer:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "mediatedPixelBufferAttributes"), *(_QWORD *)(a1 + 40));
}

uint64_t __86__AVPlayer_AVPlayerOutOfBandTextTrackRendering__setAllowsOutOfBandTextTrackRendering___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 394) = *(_BYTE *)(result + 40);
  return result;
}

void __78__AVPlayer_AVPlayerLegibleFallback__setLegibleFallbackMediaSelectionCriteria___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 752) = *(_QWORD *)(a1 + 32);
}

float __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMinRateForAudioPlayback___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 384) = result;
  return result;
}

void __52__AVPlayer_setAutomaticallyWaitsToMinimizeStalling___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v4;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488), "rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:hasCurrentInterstitialEvent:nameForLogging:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176) != 0, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40)), "rateStateBySettingAutomaticallyWaitsToMinimizeStalling:", *(unsigned __int8 *)(a1 + 49));
  if (dword_1ECDECF38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488) = v2;
}

uint64_t __47__AVPlayer_audiovisualBackgroundPlaybackPolicy__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 288);
  return result;
}

__n128 __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke_3(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)MEMORY[0x1E0C9D820];
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 504) = *MEMORY[0x1E0C9D820];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 520) = 0;
  return result;
}

uint64_t __41__AVPlayer__setSuppressesAudioRendering___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 555) = *(_BYTE *)(result + 40);
  return result;
}

void __30__AVPlayer__advanceToNextItem__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_removeItemFromLinkedList_invokeOnIvarAccessQueue:", v2);
    v2 = v3;
  }

}

uint64_t __30__AVPlayer__advanceToNextItem__block_invoke(uint64_t a1, BOOL *a2)
{
  *a2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176) != 0;
  return 1;
}

uint64_t __27__AVPlayer_actionAtItemEnd__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 368);
  return result;
}

id __27__AVPlayer__removeAllItems__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 184);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __21__AVPlayer_setMuted___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isMuted");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5A80], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __18__AVPlayer__items__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_items_invokeOnIvarAccessQueue"), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a2);
        objc_msgSend(*(id *)(a1 + 32), "_removeItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_4;
  v3[3] = &unk_1E3031488;
  v3[4] = v1;
  return objc_msgSend(v1, "_applyPlayQueueChangesToFigPlayerWithCompletionHandler:", v3);
}

- (void)setAllowsOutOfBandTextTrackRendering:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__AVPlayer_AVPlayerOutOfBandTextTrackRendering__setAllowsOutOfBandTextTrackRendering___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __86__AVPlayer_AVPlayerOutOfBandTextTrackRendering__setAllowsOutOfBandTextTrackRendering___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC58E8]);
  }
}

- (void)setLegibleFallbackMediaSelectionCriteria:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  OpaqueFigPlayer *v6;
  OpaqueFigPlayer *v7;
  NSObject *figConfigurationQueue;
  _QWORD v9[7];
  _QWORD v10[3];
  int v11;
  _QWORD block[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AVPlayer_AVPlayerLegibleFallback__setLegibleFallbackMediaSelectionCriteria___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = a3;
  block[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v6 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v6)
  {
    v7 = v6;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __78__AVPlayer_AVPlayerLegibleFallback__setLegibleFallbackMediaSelectionCriteria___block_invoke_2;
    v9[3] = &unk_1E3031988;
    v9[5] = v10;
    v9[6] = v7;
    v9[4] = self;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
    CFRelease(v7);
  }
}

- (void)setAllowsLegibleFallbackForAllAudibleMediaSelections:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  OpaqueFigPlayer *v6;
  OpaqueFigPlayer *v7;
  NSObject *figConfigurationQueue;
  _QWORD v9[7];
  _QWORD v10[3];
  int v11;
  _QWORD block[5];
  BOOL v13;

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__AVPlayer_AVPlayerLegibleFallback__setAllowsLegibleFallbackForAllAudibleMediaSelections___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v13 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v6 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v6)
  {
    v7 = v6;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __90__AVPlayer_AVPlayerLegibleFallback__setAllowsLegibleFallbackForAllAudibleMediaSelections___block_invoke_2;
    v9[3] = &unk_1E3031988;
    v9[5] = v10;
    v9[6] = v7;
    v9[4] = self;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
    CFRelease(v7);
  }
}

- (void)setMediaSelectionCriteria:(AVPlayerMediaSelectionCriteria *)criteria forMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  NSObject *figConfigurationQueue;
  _QWORD v8[5];
  _QWORD block[7];

  if (mediaCharacteristic)
  {
    ivarAccessQueue = self->_player->ivarAccessQueue;
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__AVPlayer_AVPlayerAutomaticMediaSelection__setMediaSelectionCriteria_forMediaCharacteristic___block_invoke;
    block[3] = &unk_1E302FD88;
    block[4] = self;
    block[5] = criteria;
    block[6] = mediaCharacteristic;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __94__AVPlayer_AVPlayerAutomaticMediaSelection__setMediaSelectionCriteria_forMediaCharacteristic___block_invoke_2;
    v8[3] = &unk_1E302FA10;
    v8[4] = self;
    dispatch_sync(figConfigurationQueue, v8);
  }
}

- (void)setMinRateForAudioPlayback:(float)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  OpaqueFigPlayer *v6;
  CFNumberRef v7;
  NSObject *figConfigurationQueue;
  _QWORD v9[7];
  _QWORD v10[3];
  int v11;
  _QWORD block[5];
  float v13;
  float valuePtr;

  valuePtr = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMinRateForAudioPlayback___block_invoke;
  block[3] = &unk_1E30317D0;
  block[4] = self;
  v13 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v6 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v6)
  {
    v7 = (CFNumberRef)v6;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMinRateForAudioPlayback___block_invoke_2;
    v9[3] = &unk_1E3031868;
    v9[4] = self;
    v9[5] = v10;
    v9[6] = v7;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
  }
  else
  {
    v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v7, *MEMORY[0x1E0CC5A70]);
  }
  CFRelease(v7);
}

- (void)setAutomaticallyWaitsToMinimizeStalling:(BOOL)automaticallyWaitsToMinimizeStalling
{
  BOOL v5;
  id v6;
  NSObject *ivarAccessQueue;
  _QWORD block[6];
  BOOL v9;
  BOOL v10;

  v5 = -[AVPlayer _hasCurrentInterstitialEvent](self, "_hasCurrentInterstitialEvent");
  v6 = -[AVPlayer _nameForLogging](self, "_nameForLogging");
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("timeControlStatus"));
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVPlayer_setAutomaticallyWaitsToMinimizeStalling___block_invoke;
  block[3] = &unk_1E30317F8;
  v9 = v5;
  block[4] = self;
  block[5] = v6;
  v10 = automaticallyWaitsToMinimizeStalling;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  -[AVPlayer _updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer](self, "_updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer");
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("timeControlStatus"));
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
}

- (int64_t)externalPlaybackType
{
  if (-[AVPlayer _isAirPlayVideoActive](self, "_isAirPlayVideoActive"))
    return 1;
  if (-[AVPlayer isExternalPlaybackActive](self, "isExternalPlaybackActive"))
    return 2;
  return 0;
}

- (AVPlayerAudiovisualBackgroundPlaybackPolicy)audiovisualBackgroundPlaybackPolicy
{
  NSObject *ivarAccessQueue;
  AVPlayerAudiovisualBackgroundPlaybackPolicy v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayer_audiovisualBackgroundPlaybackPolicy__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AVPlayerActionAtItemEnd)actionAtItemEnd
{
  NSObject *ivarAccessQueue;
  AVPlayerActionAtItemEnd v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayer_actionAtItemEnd__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setSuppressesAudioRendering:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t FigBaseObject;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  _QWORD v11[5];
  BOOL v12;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__AVPlayer__setSuppressesAudioRendering___block_invoke;
  v11[3] = &unk_1E302FD38;
  v11[4] = self;
  v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v11);
  v6 = (uint64_t *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v6 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v7 = *v6;
  v8 = *MEMORY[0x1E0CC5B50];
  if (self->_player->figPlayer)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v10)
      v10(FigBaseObject, v8, v7);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v7, *MEMORY[0x1E0CC5B50]);
  }
}

- (void)_removeLayer:(id)a3 videoLayer:(id)a4 closedCaptionLayer:(id)a5 subtitleLayer:(id)a6 interstitialLayer:(id)a7
{
  OpaqueFigPlayer *v13;
  NSObject *layersQ;
  void (*v15)(_QWORD);
  NSObject *figConfigurationQueue;
  NSObject *stateDispatchQueue;
  NSObject *v18;
  void (*v19[6])(_QWORD);
  void (*v20[7])(_QWORD);
  _QWORD v21[6];
  _QWORD block[12];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v13 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  layersQ = self->_player->layersQ;
  v15 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke;
  block[3] = &unk_1E3031918;
  block[4] = self;
  block[5] = a4;
  block[10] = &v27;
  block[11] = &v23;
  block[6] = a5;
  block[7] = a6;
  block[8] = a3;
  block[9] = &v31;
  dispatch_sync(layersQ, block);
  if (*((_BYTE *)v32 + 24))
  {
    -[AVPixelBufferAttributeMediator removeRequestedPixelBufferAttributesAttributesForKey:](self->_player->pixelBufferAttributeMediator, "removeRequestedPixelBufferAttributesAttributesForKey:", a4);
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_2;
    v21[3] = &unk_1E302FE78;
    v21[4] = self;
    v21[5] = v13;
    dispatch_sync(figConfigurationQueue, v21);
    if (v13)
      CFRetain(v13);
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v20[0] = v15;
    v20[1] = (void (*)(_QWORD))3221225472;
    v20[2] = __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_3;
    v20[3] = (void (*)(_QWORD))&unk_1E302FEE0;
    v20[5] = (void (*)(_QWORD))a3;
    v20[6] = (void (*)(_QWORD))v13;
    v20[4] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v20);
  }
  if (*((_BYTE *)v28 + 24))
  {
    if (v13)
      CFRetain(v13);
    v18 = self->_player->stateDispatchQueue;
    v19[0] = v15;
    v19[1] = (void (*)(_QWORD))3221225472;
    v19[2] = __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_4;
    v19[3] = (void (*)(_QWORD))&unk_1E302FE78;
    v19[4] = (void (*)(_QWORD))self;
    v19[5] = (void (*)(_QWORD))v13;
    AVSerializeOnQueueAsyncIfNecessary(v18, v19);
  }
  if (*((_BYTE *)v24 + 24))
    objc_msgSend(a6, "setPlayer:", 0);
  if (-[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated"))
    objc_msgSend(a7, "setPlayer:", 0);
  if (v13)
    CFRelease(v13);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
}

- (void)_removeItemFromLinkedList_invokeOnIvarAccessQueue:(id)a3
{
  AVPlayerInternal *player;
  AVPlayerItem *currentItem;
  AVPlayerItem *lastItem;
  uint64_t v8;
  AVPlayerItem *v9;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVPlayer.m"), 5264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));
  player = self->_player;
  currentItem = player->currentItem;
  lastItem = player->lastItem;
  if (currentItem == a3)
    v8 = objc_msgSend(a3, "_nextItem");
  else
    v8 = 0;
  if (lastItem == a3)
    v9 = (AVPlayerItem *)objc_msgSend(a3, "_previousItem");
  else
    v9 = 0;
  -[NSMutableSet removeObject:](self->_player->items, "removeObject:", a3);
  objc_msgSend(a3, "_removeFromItems");
  if (lastItem == a3)
    self->_player->lastItem = v9;
  if (currentItem == a3)
    -[AVPlayer _setCurrentItem:](self, "_setCurrentItem:", v8);
  -[AVPlayer _enqueuePlayQueueModification_invokeOnIvarAccessQueue:](self, "_enqueuePlayQueueModification_invokeOnIvarAccessQueue:", +[AVPlayerQueueModificationDescription modificationForRemovingItem:](AVPlayerQueueModificationDescription, "modificationForRemovingItem:", a3));
}

- (void)_removeAllItems
{
  uint64_t v3;
  NSObject *ivarAccessQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v3 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__5;
    v10 = __Block_byref_object_dispose__5;
    v11 = 0;
    ivarAccessQueue = self->_player->ivarAccessQueue;
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __27__AVPlayer__removeAllItems__block_invoke;
    v5[3] = &unk_1E302FD60;
    v5[4] = self;
    v5[5] = &v6;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
    if (!v7[5])
      break;
    -[AVPlayer _removeItem:](self, "_removeItem:");

    _Block_object_dispose(&v6, 8);
  }
  _Block_object_dispose(&v6, 8);
}

- (id)_items
{
  NSObject *ivarAccessQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__AVPlayer__items__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_detachVideoLayersFromFigPlayer:(OpaqueFigPlayer *)a3
{
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD);

  FigBaseObject = FigPlayerGetFigBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(FigBaseObject, *MEMORY[0x1E0CC5B90], 0);
  self->_player->videoLayersAreAttached = 0;
}

- (void)_detachFigPlayerFromSubtitleLayers
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[AVPlayer _subtitleLayers](self, "_subtitleLayers", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setPlayer:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)_detachClosedCaptionLayersFromFigPlayer:(OpaqueFigPlayer *)a3
{
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD);

  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC5970], 0);
}

- (void)_advanceToNextItem
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  os_log_type_t type;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECF38)
  {
    v9 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__AVPlayer__advanceToNextItem__block_invoke;
  v7[3] = &unk_1E3031528;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__AVPlayer__advanceToNextItem__block_invoke_2;
  v6[3] = &unk_1E302FA10;
  -[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:](self, "_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:", v7, v6, 0, v4, v5);
}

+ (AVPlayer)playerWithPlayerItem:(AVPlayerItem *)item
{
  return (AVPlayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPlayerItem:", item);
}

+ (AVPlayer)playerWithURL:(NSURL *)URL
{
  return (AVPlayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", URL);
}

uint64_t __16__AVPlayer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_didFinishSuspension:", a2);
}

uint64_t __16__AVPlayer_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_didEnterBackground:", a2);
}

uint64_t __16__AVPlayer_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_willEnterForeground:", a2);
}

- (AVPlayer)initWithDispatchQueue:(id)a3
{
  AVPlayer *v4;
  AVPlayer *v5;
  AVPlayerInternal *player;
  NSObject *stateDispatchQueue;

  v4 = -[AVPlayer init](self, "init");
  v5 = v4;
  if (a3 && v4)
  {
    player = v4->_player;
    stateDispatchQueue = player->stateDispatchQueue;
    if (stateDispatchQueue)
    {
      dispatch_release(stateDispatchQueue);
      player = v5->_player;
    }
    player->stateDispatchQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)v5->_player->stateDispatchQueue);
  }
  return v5;
}

- (AVPlayer)initWithFigPlayer:(OpaqueFigPlayer *)a3
{
  AVPlayer *v4;
  AVPlayer *v5;

  v4 = -[AVPlayer init](self, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_player->figPlayer = (OpaqueFigPlayer *)CFRetain(a3);
      v5->_player->needsToCreateFigPlayer = 0;
      v5->_player->IOwnTheFigPlayer = 0;
      v5->_player->status = 1;
      -[AVPlayer _addFPListeners](v5, "_addFPListeners");
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

+ (AVPlayer)playerWithFigPlayer:(OpaqueFigPlayer *)a3
{
  return (AVPlayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithFigPlayer:", a3);
}

- (id)valueForUndefinedKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("masterClock")))
    return -[AVPlayer masterClock](self, "masterClock");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("sourceClock")))
    return -[AVPlayer sourceClock](self, "sourceClock");
  v6.receiver = self;
  v6.super_class = (Class)AVPlayer;
  return -[AVPlayer valueForUndefinedKey:](&v6, sel_valueForUndefinedKey_, a3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  objc_super v7;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("masterClock")))
  {
    -[AVPlayer setMasterClock:](self, "setMasterClock:", a3);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("sourceClock")))
  {
    -[AVPlayer setSourceClock:](self, "setSourceClock:", a3);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayer;
    -[AVPlayer setValue:forUndefinedKey:](&v7, sel_setValue_forUndefinedKey_, a3, a4);
  }
}

- (void)_changeStatusToFailedWithError:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *ivarAccessQueue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[7];
  os_log_type_t type;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12 = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rate"));
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVPlayer__changeStatusToFailedWithError___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v13;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v14 + 24))
    objc_msgSend(-[AVPlayer _items](self, "_items"), "makeObjectsPerformSelector:withObject:", sel__playerChangeStatusToFailedWithError_, a3);
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rate"), v8, v9);
  v7 = -[AVPlayer _rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForAVFRateChangeReason:reasonIsExtendedDiagnostic:rateChangeIdentifier:rateChangeOriginator:", CFSTR("AVPlayerRateDidChangeReasonStatusChanged"), 1, 0, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVPlayerRateDidChangeNotification"), self, v7);
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
  _Block_object_dispose(&v13, 8);
}

uint64_t __43__AVPlayer__changeStatusToFailedWithError___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v1 + 160) != 2)
  {
    v2 = result;
    *(_QWORD *)(v1 + 160) = 2;
    result = objc_msgSend(*(id *)(result + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 168) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

__n128 __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke_2(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 504) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 520) = *(_BYTE *)(a1 + 56);
  return result;
}

void __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_355(uint64_t a1)
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v4;

  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 488), "rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:hasCurrentInterstitialEvent:nameForLogging:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 176) != 0, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 48));
      if (dword_1ECDECF38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v4 = v2;

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 488) = v2;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "markAsFailedWithError:", 0);
  }
}

uint64_t __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_356(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_2_357;
  v3[3] = &unk_1E3031488;
  v3[4] = v1;
  return objc_msgSend(v1, "_applyPlayQueueChangesToFigPlayerWithCompletionHandler:", v3);
}

uint64_t __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_2_357(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a2);
        objc_msgSend(*(id *)(a1 + 32), "_removeItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)_cachedNonForcedSubtitleDisplayEnabledForCurrentItem
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__AVPlayer__cachedNonForcedSubtitleDisplayEnabledForCurrentItem__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__AVPlayer__cachedNonForcedSubtitleDisplayEnabledForCurrentItem__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 520);
  return result;
}

uint64_t __51__AVPlayer__startObservingPropertiesOfCurrentItem___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), "_updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression");
}

uint64_t __51__AVPlayer__startObservingPropertiesOfCurrentItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), "_updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression");
}

void __31__AVPlayer__itemIsReadyToPlay___block_invoke(uint64_t a1)
{
  void (*v2)(_QWORD);
  uint64_t v3;
  NSObject *v4;
  void (*v5[6])(_QWORD);

  v2 = (void (*)(_QWORD))objc_msgSend(*(id *)(a1 + 32), "_itemOkayToPlayWhileTransitioningToBackground:", objc_msgSend(*(id *)(a1 + 32), "currentItem"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(v3 + 8) + 32);
  v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v5[1] = (void (*)(_QWORD))3221225472;
  v5[2] = (void (*)(_QWORD))__31__AVPlayer__itemIsReadyToPlay___block_invoke_2;
  v5[3] = (void (*)(_QWORD))&unk_1E302FE78;
  v5[4] = (void (*)(_QWORD))v3;
  v5[5] = v2;
  AVSerializeOnQueueAsyncIfNecessary(v4, v5);
}

uint64_t __31__AVPlayer__itemIsReadyToPlay___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground");
  if ((result & 1) == 0 && !*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "pause");
  return result;
}

- (void)_advanceCurrentItemAccordingToFigPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  void *v7;
  OpaqueFigPlayer *v8;
  void (*v9)(OpaqueFigPlayer *, _QWORD, CFTypeRef *);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  os_log_type_t type;
  int v22;
  _BYTE v23[128];
  CFTypeRef cf;
  id v25[17];

  v25[16] = *(id *)MEMORY[0x1E0C80C00];
  if (dword_1ECDECF38)
  {
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = (void *)-[NSArray copy](self->_player->itemsInFigPlayQueue, "copy", v15, v16);
  v7 = v6;
  v25[0] = (id)MEMORY[0x1E0C9AA60];
  if (!a3 || !AVPlayerFindItemMatchingFigPlaybackItem(v6, a3, v25))
  {
    v8 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
    cf = 0;
    v9 = *(void (**)(OpaqueFigPlayer *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v9)
      v9(v8, 0, &cf);
    if (v8)
      CFRelease(v8);
    if (cf)
    {
      if (!AVPlayerFindItemMatchingFigPlaybackItem(v7, cf, v25))
        v25[0] = v7;
      if (cf)
        CFRelease(cf);
    }
    else
    {
      v25[0] = v7;
    }
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v25[0];
  v11 = objc_msgSend(v25[0], "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[AVPlayer _removeItem:](self, "_removeItem:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v12);
  }

}

- (void)prepareItem:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *stateDispatchQueue;
  void *v14;
  uint64_t v15;
  void (*v16[7])(_QWORD);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Item must be a non-nil instance of AVPlayerItem."), v8, v9, v10, v11, v12, v15), 0);
    objc_exception_throw(v14);
  }
  objc_msgSend(a3, "_attachToPlayer:", self);
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v16[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v16[1] = (void (*)(_QWORD))3221225472;
  v16[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke;
  v16[3] = (void (*)(_QWORD))&unk_1E3031070;
  v16[4] = (void (*)(_QWORD))self;
  v16[5] = (void (*)(_QWORD))a3;
  v16[6] = (void (*)(_QWORD))a4;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v16);
}

void __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD block[7];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  if (*(_QWORD *)(v3 + 728))
  {
    objc_msgSend(*(id *)(a1 + 40), "_makeReadyForEnqueueingWithCompletionHandler:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = *(NSObject **)(v3 + 56);
    block[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E3031578;
    v5 = *(_QWORD *)(a1 + 40);
    block[6] = *(_QWORD *)(a1 + 48);
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[4] = v5;
    block[5] = v2;
    av_readwrite_dispatch_queue_write(v4, block);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v7 + 744))
    {
      *(_BYTE *)(v7 + 744) = 0;
      v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "asset");
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_4;
      v9[3] = &unk_1E30315A0;
      v9[4] = *(_QWORD *)(a1 + 32);
      AVPlayerGetFigPlayerTypeForAsset(v8, (uint64_t)v9);
    }
  }
}

void __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_3;
  v4[3] = &unk_1E3031550;
  v2 = a1[6];
  v4[4] = a1[4];
  v4[5] = v2;
  v3 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 296), "addObject:", v3);

}

uint64_t __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makeReadyForEnqueueingWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_5;
  v4[3] = &unk_1E3031488;
  v4[4] = v2;
  return objc_msgSend(v2, "_createAndConfigureFigPlayerWithType:completionHandler:", a2, v4);
}

uint64_t __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a2);
        objc_msgSend(*(id *)(a1 + 32), "_removeItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 467) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_5(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 466) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_380(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 464) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_2_383(uint64_t a1)
{
  void *v2;
  float v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  void (*v10)(uint64_t, _OWORD *, __n128);
  uint64_t v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v15;
  void (*v16)(uint64_t, float);
  __n128 v17;
  uint64_t v18;
  __n128 v19;
  uint64_t v20;
  __n128 v21;
  uint64_t v22;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_pendingFigPlayerPropertyForKey:", CFSTR("AVPlayer_FigPlayerProperty_Rate"));
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v4 = v3;
    v5 = objc_msgSend(*(id *)(a1 + 32), "_pendingFigPlayerPropertyForKey:", CFSTR("AVPlayer_FigPlayerProperty_RateOptions"));
    v6 = *(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 728);
    v8 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
    if (v6)
    {
      v10 = *(void (**)(uint64_t, _OWORD *, __n128))(v8 + 104);
      if (v10)
      {
        v11 = v7;
        v9.n128_f32[0] = v4;
        v12 = (_OWORD *)v5;
LABEL_8:
        v10(v11, v12, v9);
      }
    }
    else if (*(_QWORD *)(v8 + 56))
    {
      v19 = *(__n128 *)MEMORY[0x1E0CA2E18];
      v20 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      FigCFDictionaryGetCMTimeIfPresent();
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 728);
      v17 = v19;
      v18 = v20;
      v10 = *(void (**)(uint64_t, _OWORD *, __n128))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
      if (v10)
      {
        v9 = v19;
        v21 = v19;
        v22 = v20;
        v12 = &v21;
        v11 = v13;
        v9.n128_f32[0] = v4;
        goto LABEL_8;
      }
    }
    else
    {
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 728);
      v16 = *(void (**)(uint64_t, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v16)
        v16(v15, v4);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", 0, CFSTR("AVPlayer_FigPlayerProperty_Rate"), *(_OWORD *)&v17, v18);
  return objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", 0, CFSTR("AVPlayer_FigPlayerProperty_RateOptions"));
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_3_389(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, _QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t FigBaseObject;
  void (*v15)(uint64_t, _QWORD, uint64_t);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, _QWORD, uint64_t);
  int v20;
  uint64_t v21;
  uint64_t result;
  uint64_t (*v23)(uint64_t, _QWORD, uint64_t);
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v9 = objc_msgSend(*(id *)(a1 + 40), "_pendingFigPlayerPropertyForKey:", v8);
        if (v9)
          objc_msgSend(v2, "setObject:forKey:", v9, v8);
        objc_msgSend(*(id *)(a1 + 40), "_setPendingFigPlayerProperty:forKey:", 0, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 728);
  v11 = *(void (**)(uint64_t, void *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
  if (v11)
    v11(v10, v2, 0);
  v12 = objc_msgSend(*(id *)(a1 + 40), "_cachedMediaSelectionCriteria");
  if (v12)
  {
    v13 = v12;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v15 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v15)
      v15(FigBaseObject, *MEMORY[0x1E0CC5A68], v13);
  }
  v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "legibleFallbackMediaSelectionCriteria");
  if (v16)
  {
    v17 = objc_msgSend(v16, "figDictionary");
    v18 = FigPlayerGetFigBaseObject();
    v19 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v19)
      v19(v18, *MEMORY[0x1E0CC5A38], v17);
  }
  v20 = objc_msgSend(*(id *)(a1 + 40), "allowsLegibleFallbackForAllAudibleMediaSelections");
  v21 = FigPlayerGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v23 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v23)
  {
    if (v20)
      v24 = *MEMORY[0x1E0C9AE50];
    else
      v24 = *MEMORY[0x1E0C9AE40];
    return v23(v21, *MEMORY[0x1E0CC5900], v24);
  }
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_4_390(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDecoderPixelBufferAttributes:onFigPlayer:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "mediatedPixelBufferAttributes"), *(_QWORD *)(a1 + 40));
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_5_395(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 160) = 1;
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_6_396(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(a2);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_msgSend(v8, "_addToPlayQueueOfFigPlayerOfPlayer:afterFigPlaybackItemOfItem:", *(_QWORD *)(a1 + 32), 0) & 1) == 0)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_7_398(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 296), "copy");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 296), "removeAllObjects");
}

- (id)expectedAssetTypes
{
  return self->_player->expectedAssetTypes;
}

- (void)setExpectedAssetTypes:(id)a3
{
  id v5;
  void (*v6[6])(_QWORD);

  if (!self->_player->needsToCreateFigPlayer)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("AVPlayer's expectedAssetTypes can't be after any AVPlayerItems have been enqueued or after the AVPlayer's status changes from AVPlayerStatusUnknown."), 0));
  v5 = a3;

  self->_player->expectedAssetTypes = (NSArray *)a3;
  v6[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v6[1] = (void (*)(_QWORD))3221225472;
  v6[2] = __34__AVPlayer_setExpectedAssetTypes___block_invoke;
  v6[3] = (void (*)(_QWORD))&unk_1E302FCE8;
  v6[4] = (void (*)(_QWORD))a3;
  v6[5] = (void (*)(_QWORD))self;
  AVEnsureNotOnMainThread(v6);
}

void __34__AVPlayer_setExpectedAssetTypes___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  char v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v6 |= objc_msgSend(+[AVURLAsset _fileUTTypes](AVURLAsset, "_fileUTTypes"), "containsObject:", v9);
        v5 |= objc_msgSend(+[AVURLAsset _streamingUTTypes](AVURLAsset, "_streamingUTTypes"), "containsObject:", v9);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
    LOBYTE(v6) = 0;
  }
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(v10 + 8) + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__AVPlayer_setExpectedAssetTypes___block_invoke_2;
  v12[3] = &unk_1E3031668;
  v13 = v6 & 1;
  v14 = v5 & 1;
  v12[4] = v10;
  dispatch_async(v11, v12);
}

uint64_t __34__AVPlayer_setExpectedAssetTypes___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  _QWORD v5[5];

  v1 = *(unsigned __int8 *)(result + 41);
  if (*(unsigned __int8 *)(result + 40) != (_DWORD)v1)
  {
    v2 = result;
    result = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(*(_QWORD *)(result + 8) + 744))
    {
      v3 = (_QWORD *)MEMORY[0x1E0CC3C88];
      if (!(_DWORD)v1)
        v3 = (_QWORD *)MEMORY[0x1E0CC3C80];
      objc_msgSend((id)result, "_setPendingFigPlayerProperty:forKey:", *v3, *MEMORY[0x1E0CC5A08]);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 744) = 0;
      v4 = *(void **)(v2 + 32);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __34__AVPlayer_setExpectedAssetTypes___block_invoke_3;
      v5[3] = &unk_1E3031488;
      v5[4] = v4;
      return objc_msgSend(v4, "_createAndConfigureFigPlayerWithType:completionHandler:", v1, v5);
    }
  }
  return result;
}

uint64_t __34__AVPlayer_setExpectedAssetTypes___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a2);
        objc_msgSend(*(id *)(a1 + 32), "_removeItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)_setAncillaryPerformanceInformationForDisplay:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__AVPlayer__setAncillaryPerformanceInformationForDisplay___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __58__AVPlayer__setAncillaryPerformanceInformationForDisplay___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 480) = result;
  return result;
}

- (id)_ancillaryPerformanceInformationForDisplay
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayer__ancillaryPerformanceInformationForDisplay__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayer__ancillaryPerformanceInformationForDisplay__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 480);
  return result;
}

uint64_t __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)objc_msgSend(v9, "item");
        v11 = objc_msgSend(v9, "modificationType");
        if (v11 == 1)
        {
          objc_msgSend(v10, "_removeFromPlayQueueOfFigPlayerOfAttachedPlayer");
        }
        else if (!v11
               && (objc_msgSend(v10, "_addToPlayQueueOfFigPlayerOfPlayer:afterFigPlaybackItemOfItem:", *(_QWORD *)(a1 + 32), objc_msgSend(v9, "afterItem")) & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);
        }
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

- (void)_removeItem:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v6;
  _QWORD v7[6];
  _QWORD v8[6];
  os_log_type_t type;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECF38)
  {
    v10 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = a3;
  if (a3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __24__AVPlayer__removeItem___block_invoke;
    v8[3] = &unk_1E30315C8;
    v8[4] = a3;
    v8[5] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __24__AVPlayer__removeItem___block_invoke_2;
    v7[3] = &unk_1E302FCE8;
    v7[4] = self;
    v7[5] = a3;
    -[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:](self, "_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:", v8, v7, 0);
  }

}

uint64_t __24__AVPlayer__removeItem___block_invoke(uint64_t a1, BOOL *a2)
{
  *a2 = *(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 176);
  return 1;
}

uint64_t __24__AVPlayer__removeItem___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 192), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_removeItemFromLinkedList_invokeOnIvarAccessQueue:", *(_QWORD *)(a1 + 40));
  return result;
}

- (float)_rate
{
  OpaqueFigPlayer *v3;
  OpaqueFigPlayer *v4;
  void (*v5)(OpaqueFigPlayer *, float *);
  float result;
  id v7;
  float v8;

  v8 = 0.0;
  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v3)
  {
    v4 = v3;
    v5 = *(void (**)(OpaqueFigPlayer *, float *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
    if (v5)
      v5(v4, &v8);
    CFRelease(v4);
    return v8;
  }
  else
  {
    v7 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", CFSTR("AVPlayer_FigPlayerProperty_Rate"));
    if (v7)
      objc_msgSend(v7, "floatValue");
    else
      return 0.0;
  }
  return result;
}

void __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke_411(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  char v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = a1[4];
  v3 = *(NSObject **)(*(_QWORD *)(v2 + 8) + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke_2;
  block[3] = &unk_1E302FD60;
  block[4] = v2;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(v3, block);
  if (*((_DWORD *)v8 + 6) == *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    (*(void (**)(void))(a1[6] + 16))();
    v4 = 1;
  }
  else
  {
    v4 = dword_1ECDECF38;
    if (dword_1ECDECF38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v4 = 0;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v4;
  _Block_object_dispose(&v7, 8);
}

- (BOOL)_handleSetRate:(float)a3 withVolumeRampDuration:(id *)a4 playImmediately:(BOOL)a5 rateChangeReason:(int)a6 affectsCoordinatedPlayback:(BOOL)a7
{
  _QWORD v8[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  int v10;
  float v11;
  BOOL v12;
  BOOL v13;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__AVPlayer__handleSetRate_withVolumeRampDuration_playImmediately_rateChangeReason_affectsCoordinatedPlayback___block_invoke;
  v8[3] = &unk_1E3031780;
  v12 = a5;
  v9 = *a4;
  v10 = a6;
  v13 = a7;
  v8[4] = self;
  v11 = a3;
  return -[AVPlayer _setRate:rateChangeReason:figPlayerSetRateHandler:](self, "_setRate:rateChangeReason:figPlayerSetRateHandler:", *(_QWORD *)&a6, v8);
}

uint64_t __110__AVPlayer__handleSetRate_withVolumeRampDuration_playImmediately_rateChangeReason_affectsCoordinatedPlayback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unsigned __int32 v11;
  uint64_t result;
  __n128 v13;
  uint64_t (*v14)(uint64_t, CMTime *, __n128);
  uint64_t v15;
  CMTime *v16;
  uint64_t VTable;
  float v18;
  uint64_t (*v19)(uint64_t, float);
  CMTime v20;
  CMTime v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0CC5BE0];
  v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
  v22[1] = *MEMORY[0x1E0CC5BD0];
  v21 = *(CMTime *)(a1 + 40);
  v23[1] = NSDictionaryFromCMTime(&v21);
  v22[2] = *MEMORY[0x1E0CC5BF0];
  v23[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v22[3] = *MEMORY[0x1E0CC5BE8];
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v22[4] = *MEMORY[0x1E0CC5BD8];
  if (*(_BYTE *)(a1 + 73))
    v7 = (uint64_t *)MEMORY[0x1E0C9AE50];
  else
    v7 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v8 = *v7;
  v23[3] = v6;
  v23[4] = v8;
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  if (!a2)
  {
    LODWORD(v10) = *(_DWORD *)(a1 + 68);
    objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10), CFSTR("AVPlayer_FigPlayerProperty_Rate"));
    return objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", v9, CFSTR("AVPlayer_FigPlayerProperty_RateOptions"));
  }
  if (*(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104))
  {
    v11 = *(_DWORD *)(a1 + 68);
    result = CMBaseObjectGetVTable();
    v14 = *(uint64_t (**)(uint64_t, CMTime *, __n128))(*(_QWORD *)(result + 16) + 104);
    if (!v14)
      return result;
    v15 = a2;
    v13.n128_u32[0] = v11;
    v16 = (CMTime *)v9;
    return v14(v15, v16, v13);
  }
  VTable = CMBaseObjectGetVTable();
  v18 = *(float *)(a1 + 68);
  if (*(_QWORD *)(*(_QWORD *)(VTable + 16) + 56))
  {
    *(_OWORD *)&v20.value = *(_OWORD *)(a1 + 40);
    v20.epoch = *(_QWORD *)(a1 + 56);
    result = CMBaseObjectGetVTable();
    v14 = *(uint64_t (**)(uint64_t, CMTime *, __n128))(*(_QWORD *)(result + 16) + 56);
    if (!v14)
      return result;
    v13 = *(__n128 *)&v20.value;
    v21 = v20;
    v16 = &v21;
    v15 = a2;
    v13.n128_f32[0] = v18;
    return v14(v15, v16, v13);
  }
  result = CMBaseObjectGetVTable();
  v19 = *(uint64_t (**)(uint64_t, float))(*(_QWORD *)(result + 16) + 40);
  if (v19)
    return v19(a2, v18);
  return result;
}

- (void)setRate:(float)a3 withVolumeRampDuration:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a4;
  -[AVPlayer _setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:](self, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v4, 0, 23, 1);
}

- (void)playImmediatelyAtRate:(float)rate
{
  __int128 v3;
  uint64_t v4;

  v3 = *MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[AVPlayer _setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:](self, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v3, 1, 23, 1);
}

- (void)pauseWithoutAffectingCoordinatedPlayback
{
  double v2;
  __int128 v3;
  uint64_t v4;

  v3 = *MEMORY[0x1E0CA2E18];
  HIDWORD(v2) = DWORD1(v3);
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  LODWORD(v2) = 0;
  -[AVPlayer _setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:](self, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v3, 0, 23, 0, v2);
}

- (void)_setUsesLegacyAutomaticWaitingBehavior:(BOOL)a3
{
  AVPlayerInternal *player;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  NSObject *figConfigurationQueue;
  _QWORD v8[5];
  _QWORD block[6];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  player = self->_player;
  if (!player->needsToCreateFigPlayer)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("AVPlayer's _usesLegacyAutomaticWaitingBehavior can't be set after any AVPlayerItems have been enqueued or after the AVPlayer's status changes from AVPlayerStatusUnknown."), 0));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  ivarAccessQueue = player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVPlayer__setUsesLegacyAutomaticWaitingBehavior___block_invoke;
  block[3] = &unk_1E3031820;
  v10 = a3;
  block[4] = self;
  block[5] = &v11;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v12 + 24))
  {
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __51__AVPlayer__setUsesLegacyAutomaticWaitingBehavior___block_invoke_2;
    v8[3] = &unk_1E302FA10;
    v8[4] = self;
    dispatch_sync(figConfigurationQueue, v8);
  }
  _Block_object_dispose(&v11, 8);
}

void __51__AVPlayer__setUsesLegacyAutomaticWaitingBehavior___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488), "usesLegacyAutomaticWaitingBehavior");
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 != v2)
  {
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488), "rateStateBySettingUsesLegacyAutomaticWaitingBehavior:", v3 != 0);
    v5 = v4;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488) = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __51__AVPlayer__setUsesLegacyAutomaticWaitingBehavior___block_invoke_2(uint64_t a1)
{
  int v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_usesLegacyAutomaticWaitingBehavior");
  v3 = v2;
  v4 = *MEMORY[0x1E0C9AE50];
  v5 = *MEMORY[0x1E0C9AE40];
  if (v2)
    v6 = *MEMORY[0x1E0C9AE50];
  else
    v6 = *MEMORY[0x1E0C9AE40];
  result = objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", v6, *MEMORY[0x1E0CC5920]);
  if ((v3 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    if (sWaitsToMinimizeStallingByDefault != 1)
      return result;
    if (objc_msgSend(*(id *)(a1 + 32), "automaticallyWaitsToMinimizeStalling"))
      v8 = v4;
    else
      v8 = v5;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", v8, *MEMORY[0x1E0CC5940]);
}

- (BOOL)_usesLegacyAutomaticWaitingBehavior
{
  return objc_msgSend(-[AVPlayer _rateState](self, "_rateState"), "usesLegacyAutomaticWaitingBehavior");
}

+ (BOOL)automaticallyNotifiesObserversOfUsesLegacyAutomaticWaitingBehavior
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentUnfoldedTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v5;

  result = -[AVPlayer currentItem](self, "currentItem");
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE currentUnfoldedTime](result, "currentUnfoldedTime");
  v5 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
  retstr->var3 = *(_QWORD *)(v5 + 16);
  return result;
}

- (void)seekToDate:(NSDate *)date
{
  AVPlayerItem *v4;

  v4 = -[AVPlayer currentItem](self, "currentItem");
  if (v4)
    -[AVPlayerItem seekToDate:completionHandler:](v4, "seekToDate:completionHandler:", date, 0);
}

- (void)seekToDate:(NSDate *)date completionHandler:(void *)completionHandler
{
  AVPlayerItem *v6;

  v6 = -[AVPlayer currentItem](self, "currentItem");
  if (v6)
    -[AVPlayerItem seekToDate:completionHandler:](v6, "seekToDate:completionHandler:", date, completionHandler);
  else
    (*((void (**)(void *, _QWORD))completionHandler + 2))(completionHandler, 0);
}

- (void)seekToTime:(CMTime *)time
{
  AVPlayerItem *v4;
  __int128 v5;
  CMTimeEpoch epoch;

  v4 = -[AVPlayer currentItem](self, "currentItem");
  if (v4)
  {
    v5 = *(_OWORD *)&time->value;
    epoch = time->epoch;
    -[AVPlayerItem seekToTime:completionHandler:](v4, "seekToTime:completionHandler:", &v5, 0);
  }
}

- (void)seekToTime:(CMTime *)time completionHandler:(void *)completionHandler
{
  AVPlayerItem *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  CMTimeEpoch epoch;

  v6 = -[AVPlayer currentItem](self, "currentItem");
  if (v6)
  {
    v11 = *(_OWORD *)&time->value;
    epoch = time->epoch;
    v9 = *MEMORY[0x1E0CA2E30];
    v10 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
    v7 = v9;
    v8 = v10;
    -[AVPlayerItem seekToTime:toleranceBefore:toleranceAfter:completionHandler:](v6, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v11, &v9, &v7, completionHandler);
  }
  else
  {
    (*((void (**)(void *, _QWORD))completionHandler + 2))(completionHandler, 0);
  }
}

- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter completionHandler:(void *)completionHandler
{
  AVPlayerItem *v10;
  __int128 v11;
  CMTimeEpoch v12;
  __int128 v13;
  CMTimeEpoch v14;
  __int128 v15;
  CMTimeEpoch epoch;

  v10 = -[AVPlayer currentItem](self, "currentItem");
  if (v10)
  {
    v15 = *(_OWORD *)&time->value;
    epoch = time->epoch;
    v13 = *(_OWORD *)&toleranceBefore->value;
    v14 = toleranceBefore->epoch;
    v11 = *(_OWORD *)&toleranceAfter->value;
    v12 = toleranceAfter->epoch;
    -[AVPlayerItem seekToTime:toleranceBefore:toleranceAfter:completionHandler:](v10, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v15, &v13, &v11, completionHandler);
  }
  else
  {
    (*((void (**)(void *, _QWORD))completionHandler + 2))(completionHandler, 0);
  }
}

- (void)setRate:(float)rate time:(CMTime *)itemTime atHostTime:(CMTime *)hostClockTime
{
  CMTime v5;
  CMTime v6;

  v6 = *itemTime;
  v5 = *hostClockTime;
  -[AVPlayer setRate:time:atHostTime:options:](self, "setRate:time:atHostTime:options:", &v6, &v5, 0);
}

- (void)setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5 options:(id)a6
{
  OpaqueFigPlayer *v11;
  OpaqueFigPlayer *v12;
  int v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[4];
  float v18;
  __int128 v19;
  int64_t var3;
  __int128 v21;
  int64_t v22;
  int v23;

  v11 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (!v11)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("AVPlayer cannot service a synchronized playback request via setRate:time:atHostTime: until its status is AVPlayerStatusReadyToPlay.");
    goto LABEL_11;
  }
  v12 = v11;
  if (!a6 || (objc_msgSend(a6, "preferCoordinatedPlaybackBehavior") & 1) == 0)
  {
    if (sSetRateAtHostTimeThrowsWhenWaitingToMinimizeStalling != 1
      || !-[AVPlayer automaticallyWaitsToMinimizeStalling](self, "automaticallyWaitsToMinimizeStalling"))
    {
      v13 = 0;
      goto LABEL_8;
    }
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("AVPlayer cannot service a synchronized playback request via setRate:time:atHostTime: when automaticallyWaitsToMinimizeStalling is YES");
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0));
  }
  v13 = 1;
LABEL_8:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__AVPlayer_setRate_time_atHostTime_options___block_invoke;
  v17[3] = &__block_descriptor_88_e29_v20__0__OpaqueFigPlayer__8i16l;
  v18 = a3;
  v19 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v21 = *(_OWORD *)&a5->var0;
  v22 = a5->var3;
  v23 = v13;
  -[AVPlayer _setRate:rateChangeReason:figPlayerSetRateHandler:](self, "_setRate:rateChangeReason:figPlayerSetRateHandler:", 23, v17, COERCE_DOUBLE(__PAIR64__(DWORD1(v21), LODWORD(a3))));
  CFRelease(v12);
}

uint64_t __44__AVPlayer_setRate_time_atHostTime_options___block_invoke(uint64_t a1, uint64_t a2)
{
  float v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(uint64_t, __int128 *, __int128 *, uint64_t, float);
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v3 = *(float *)(a1 + 32);
  v4 = *(unsigned int *)(a1 + 84);
  v9 = *(_OWORD *)(a1 + 36);
  v10 = *(_QWORD *)(a1 + 52);
  v7 = *(_OWORD *)(a1 + 60);
  v8 = *(_QWORD *)(a1 + 76);
  result = CMBaseObjectGetVTable();
  v6 = *(uint64_t (**)(uint64_t, __int128 *, __int128 *, uint64_t, float))(*(_QWORD *)(result + 16) + 88);
  if (v6)
  {
    v13 = v9;
    v14 = v10;
    v11 = v7;
    v12 = v8;
    return v6(a2, &v13, &v11, v4, v3);
  }
  return result;
}

- (int)_createPrerollID
{
  AVPlayerInternal *player;
  int v3;
  AVPlayerInternal *v4;
  int pendingPrerollID;

  player = self->_player;
  v3 = player->nextPrerollIDToGenerate + 1;
  player->nextPrerollIDToGenerate = v3;
  self->_player->pendingPrerollID = v3;
  v4 = self->_player;
  pendingPrerollID = v4->pendingPrerollID;
  if (pendingPrerollID <= 0)
  {
    v4->pendingPrerollID = 1;
    return self->_player->pendingPrerollID;
  }
  return pendingPrerollID;
}

- (int)_cancelPendingPrerollAndRegisterPrerollCompletionHandler:(id)a3
{
  AVPlayerInternal *player;
  void (**prerollCompletionHandler)(_QWORD, _QWORD);
  int v7;

  MEMORY[0x194033BF8](self->_player->prerollIDMutex, a2);
  player = self->_player;
  prerollCompletionHandler = (void (**)(_QWORD, _QWORD))player->prerollCompletionHandler;
  if (prerollCompletionHandler)
    player->prerollCompletionHandler = 0;
  if (a3)
  {
    v7 = -[AVPlayer _createPrerollID](self, "_createPrerollID");
    self->_player->prerollCompletionHandler = (id)objc_msgSend(a3, "copy");
  }
  else
  {
    v7 = 0;
  }
  MEMORY[0x194033C04](self->_player->prerollIDMutex);
  if (prerollCompletionHandler)
  {
    prerollCompletionHandler[2](prerollCompletionHandler, 0);

  }
  return v7;
}

- (id)_unregisterAndReturnRetainedPrerollCompletionHandler
{
  AVPlayerInternal *player;
  id prerollCompletionHandler;

  player = self->_player;
  prerollCompletionHandler = player->prerollCompletionHandler;
  player->pendingPrerollID = 0;
  self->_player->prerollCompletionHandler = 0;
  return prerollCompletionHandler;
}

- (void)prerollAtRate:(float)rate completionHandler:(void *)completionHandler
{
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  uint64_t v9;
  unsigned int (*v10)(OpaqueFigPlayer *, uint64_t, float);

  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (!v7)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("AVPlayer cannot service a preroll request until its status is AVPlayerStatusReadyToPlay."), 0));
  v8 = v7;
  v9 = -[AVPlayer _cancelPendingPrerollAndRegisterPrerollCompletionHandler:](self, "_cancelPendingPrerollAndRegisterPrerollCompletionHandler:", completionHandler);
  v10 = *(unsigned int (**)(OpaqueFigPlayer *, uint64_t, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 64);
  if (!v10 || v10(v8, v9, rate))
    -[AVPlayer _cancelPendingPrerollAndRegisterPrerollCompletionHandler:](self, "_cancelPendingPrerollAndRegisterPrerollCompletionHandler:", 0);
  CFRelease(v8);
}

- (void)cancelPendingPrerolls
{
  -[AVPlayer _cancelPendingPrerollAndRegisterPrerollCompletionHandler:](self, "_cancelPendingPrerollAndRegisterPrerollCompletionHandler:", 0);
}

- (CMClockRef)masterClock
{
  NSObject *ivarAccessQueue;
  OpaqueCMClock *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__AVPlayer_masterClock__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (OpaqueCMClock *)(id)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __23__AVPlayer_masterClock__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 784);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMasterClock:(CMClockRef)masterClock
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD v10[7];
  _QWORD v11[3];
  int v12;
  _QWORD block[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AVPlayer_setMasterClock___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  block[5] = masterClock;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", masterClock, *MEMORY[0x1E0CC5A50]);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __27__AVPlayer_setMasterClock___block_invoke_2;
    v10[3] = &unk_1E3031868;
    v10[4] = self;
    v10[5] = v11;
    v10[6] = v8;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v8);
  }
}

void __27__AVPlayer_setMasterClock___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRetain(v2);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(const void **)(v3 + 784);
  if (v4)
  {
    CFRelease(v4);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v3 + 784) = *(_QWORD *)(a1 + 40);
}

uint64_t __27__AVPlayer_setMasterClock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "sourceClock");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5A50], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (float)_userVolume
{
  OpaqueFigPlayer *v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, uint64_t, _QWORD, CFTypeRef *);
  void *v7;
  id v8;
  float v9;
  AVAudioSession *v11;
  uint64_t v12;
  void *v13;
  CFTypeRef cf;
  float v15;

  v15 = 0.5;
  cf = 0;
  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v4 = *MEMORY[0x1E0CC5B70];
  if (v3)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v6 = *(void (**)(uint64_t, uint64_t, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (!v6 || (v6(FigBaseObject, v4, *MEMORY[0x1E0C9AE00], &cf), (v7 = (void *)cf) == 0))
    {
LABEL_10:
      CFRelease(v3);
      return v15;
    }
  }
  else
  {
    v8 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E0CC5B70]);
    cf = v8;
    if (!v8)
    {
      v11 = -[AVPlayer audioSession](self, "audioSession");
      if (v11)
        v12 = -[AVAudioSession category](v11, "category");
      else
        v12 = 0;
      v13 = (void *)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController", cf);
      if (!v13)
        return 0.5;
      objc_msgSend(v13, "getVolume:forCategory:", &v15, v12);
      return v15;
    }
    v7 = v8;
    CFRetain(v8);
  }
  objc_msgSend(v7, "floatValue", cf);
  v15 = v9;
  if (cf)
    CFRelease(cf);
  if (v3)
    goto LABEL_10;
  return v15;
}

- (void)_setUserVolume:(float)a3
{
  NSObject *ivarAccessQueue;
  OpaqueFigPlayer *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t FigBaseObject;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  _QWORD v12[5];
  float v13;

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __27__AVPlayer__setUserVolume___block_invoke;
  v12[3] = &unk_1E30317D0;
  v12[4] = self;
  v13 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v12);
  v6 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  *(float *)&v7 = a3;
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v9 = *MEMORY[0x1E0CC5B70];
  if (v6)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(FigBaseObject, v9, v8);
    CFRelease(v6);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v8, *MEMORY[0x1E0CC5B70]);
  }
}

float __27__AVPlayer__setUserVolume___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 380) = result;
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfUserVolume
{
  return 0;
}

- (id)vibrationPattern
{
  NSObject *ivarAccessQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__AVPlayer_vibrationPattern__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __28__AVPlayer_vibrationPattern__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setVibrationPattern:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  uint64_t v8;
  OpaqueFigPlayer *v9;
  uint64_t FigBaseObject;
  void (*v11)(uint64_t, uint64_t, id);
  uint64_t v12;
  void (*v13)(OpaqueFigPlayer *);
  AVPlayerInternal *player;
  _QWORD v15[5];
  _QWORD block[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AVPlayer_setVibrationPattern___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v8 = *MEMORY[0x1E0CC5B88];
  if (v7)
  {
    v9 = v7;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v11 = *(void (**)(uint64_t, uint64_t, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(FigBaseObject, v8, a3);
    if (a3)
    {
      v12 = *(_QWORD *)(CMBaseObjectGetVTable() + 24);
      if (v12)
      {
        v13 = *(void (**)(OpaqueFigPlayer *))(v12 + 8);
        if (v13)
          v13(v9);
      }
    }
    CFRelease(v9);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", a3, *MEMORY[0x1E0CC5B88]);
    player = self->_player;
    if (player->needsToCreateFigPlayer)
    {
      player->needsToCreateFigPlayer = 0;
      v15[0] = v6;
      v15[1] = 3221225472;
      v15[2] = __32__AVPlayer_setVibrationPattern___block_invoke_2;
      v15[3] = &unk_1E3031488;
      v15[4] = self;
      -[AVPlayer _createAndConfigureFigPlayerWithType:completionHandler:](self, "_createAndConfigureFigPlayerWithType:completionHandler:", 0, v15);
    }
  }
}

id __32__AVPlayer_setVibrationPattern___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224) = result;
  return result;
}

uint64_t __32__AVPlayer_setVibrationPattern___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a2);
        objc_msgSend(*(id *)(a1 + 32), "_removeItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfVibrationPattern
{
  return 0;
}

- (float)_playerVolume
{
  OpaqueFigPlayer *v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, uint64_t, _QWORD, CFTypeRef *);
  float v7;
  void *v8;
  id v9;
  float v10;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v4 = *MEMORY[0x1E0CC5BA8];
  if (v3)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v6 = *(void (**)(uint64_t, uint64_t, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    v7 = 1.0;
    if (!v6 || (v6(FigBaseObject, v4, *MEMORY[0x1E0C9AE00], &cf), (v8 = (void *)cf) == 0))
    {
LABEL_10:
      CFRelease(v3);
      return v7;
    }
  }
  else
  {
    v9 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E0CC5BA8]);
    cf = v9;
    if (!v9)
      return 1.0;
    v8 = v9;
    CFRetain(v9);
  }
  objc_msgSend(v8, "floatValue");
  v7 = v10;
  if (cf)
    CFRelease(cf);
  if (v3)
    goto LABEL_10;
  return v7;
}

uint64_t __22__AVPlayer_setVolume___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t FigBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "volume");
  v3 = objc_msgSend(v2, "numberWithFloat:");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    result = v5(FigBaseObject, *MEMORY[0x1E0CC5BA8], v3);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isMuted
{
  uint64_t FigBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v4;
  id v5;
  CFBooleanRef BOOLean;

  if (self->_player->figPlayer)
  {
    BOOLean = (CFBooleanRef)*MEMORY[0x1E0C9AE40];
    FigBaseObject = FigPlayerGetFigBaseObject();
    v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 48);
    if (v3 && !v3(FigBaseObject, *MEMORY[0x1E0CC5A80], *MEMORY[0x1E0C9AE00], &BOOLean))
    {
      v4 = CFBooleanGetValue(BOOLean) != 0;
      if (BOOLean)
        CFRelease(BOOLean);
      return v4;
    }
  }
  else
  {
    v5 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E0CC5A80]);
    if (v5)
      return objc_msgSend(v5, "BOOLValue");
  }
  return 0;
}

uint64_t __48__AVPlayer__setActionAtItemEnd_allowingAdvance___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "figPlayerActionForActionAtItemEnd:", objc_msgSend(*(id *)(a1 + 32), "actionAtItemEnd"));
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC58D8], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingActionAtItemEnd
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("status"));
}

- (BOOL)isClosedCaptionDisplayEnabled
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AVPlayer_isClosedCaptionDisplayEnabled__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__AVPlayer_isClosedCaptionDisplayEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 396);
  return result;
}

- (void)setClosedCaptionDisplayEnabled:(BOOL)closedCaptionDisplayEnabled
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = closedCaptionDisplayEnabled;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVPlayer_setClosedCaptionDisplayEnabled___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = closedCaptionDisplayEnabled;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __43__AVPlayer_setClosedCaptionDisplayEnabled___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC59C8]);
  }
}

uint64_t __43__AVPlayer_setClosedCaptionDisplayEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 396) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __43__AVPlayer_setClosedCaptionDisplayEnabled___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isClosedCaptionDisplayEnabled");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC59C8], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingClosedCaptionDisplayEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("status"));
}

- (BOOL)_isDisplayingClosedCaptions
{
  OpaqueFigPlayer *v2;
  OpaqueFigPlayer *v3;
  CFBooleanRef v4;
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  int v7;
  BOOL v8;
  CFBooleanRef BOOLean;

  v2 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (CFBooleanRef)*MEMORY[0x1E0C9AE40];
  BOOLean = (CFBooleanRef)*MEMORY[0x1E0C9AE40];
  FigBaseObject = FigPlayerGetFigBaseObject();
  v6 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
  if (v6)
  {
    v7 = v6(FigBaseObject, *MEMORY[0x1E0CC59E8], *MEMORY[0x1E0C9AE00], &BOOLean);
    v4 = BOOLean;
    if (!v7)
    {
      v8 = CFBooleanGetValue(BOOLean) != 0;
      v4 = BOOLean;
      if (!BOOLean)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  v8 = 0;
  if (v4)
LABEL_5:
    CFRelease(v4);
LABEL_6:
  CFRelease(v3);
  return v8;
}

- (BOOL)shouldReduceResourceUsage
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayer_shouldReduceResourceUsage__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__AVPlayer_shouldReduceResourceUsage__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 304);
  return result;
}

- (void)setShouldReduceResourceUsage:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  BOOL v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  _QWORD block[5];
  BOOL v16;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AVPlayer_setShouldReduceResourceUsage___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v16 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __41__AVPlayer_setShouldReduceResourceUsage___block_invoke_2;
    v14[3] = &unk_1E302FE78;
    v14[4] = self;
    v14[5] = v8;
    dispatch_sync(figConfigurationQueue, v14);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    v11 = !v3;
    if (v3)
    {
      v12 = &unk_1E30935C8;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
      v12 = 0;
    }
    if (v11)
      v13 = 0;
    else
      v13 = &unk_1E30935E0;
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5B18]);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v12, *MEMORY[0x1E0CC5AE0]);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v13, *MEMORY[0x1E0CC5A60]);
  }
}

uint64_t __41__AVPlayer_setShouldReduceResourceUsage___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 304) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __41__AVPlayer_setShouldReduceResourceUsage___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t (*v9)(uint64_t, uint64_t, _QWORD);
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldReduceResourceUsage") & 1) != 0)
  {
    v2 = *MEMORY[0x1E0C9AE50];
    v3 = &unk_1E30935E0;
    v4 = &unk_1E30935C8;
  }
  else
  {
    v2 = *MEMORY[0x1E0C9AE40];
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  }
  v5 = *MEMORY[0x1E0CC5AE0];
  v10[0] = *MEMORY[0x1E0CC5B18];
  v10[1] = v5;
  v11[0] = v2;
  v11[1] = v4;
  v10[2] = *MEMORY[0x1E0CC5A60];
  v11[2] = v3;
  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = *(_QWORD *)(a1 + 40);
  result = CMBaseObjectGetVTable();
  v9 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(result + 16) + 112);
  if (v9)
    return v9(v7, v6, 0);
  return result;
}

- (int64_t)resourceConservationLevelWhilePaused
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayer_resourceConservationLevelWhilePaused__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayer_resourceConservationLevelWhilePaused__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 312);
  return result;
}

- (void)setResourceConservationLevelWhilePaused:(int64_t)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD block[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVPlayer_setResourceConservationLevelWhilePaused___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __52__AVPlayer_setResourceConservationLevelWhilePaused___block_invoke_2;
    v11[3] = &unk_1E302FE78;
    v11[4] = self;
    v11[5] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    CFRelease(v8);
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v10, *MEMORY[0x1E0CC5B20]);
  }
}

uint64_t __52__AVPlayer_setResourceConservationLevelWhilePaused___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 312) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __52__AVPlayer_setResourceConservationLevelWhilePaused___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "resourceConservationLevelWhilePaused");
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
  FigBaseObject = FigPlayerGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v5)
    return v5(FigBaseObject, *MEMORY[0x1E0CC5B20], v2);
  return result;
}

- (id)playerRole
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__AVPlayer_playerRole__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__AVPlayer_playerRole__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 320);
  return result;
}

- (void)setPlayerRole:(id)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *ivarAccessQueue;
  uint64_t v8;
  OpaqueFigPlayer *v9;
  uint64_t v10;
  OpaqueFigPlayer *v11;
  uint64_t FigBaseObject;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef cf;
  _QWORD block[6];

  v4 = a4;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AVPlayer_setPlayerRole_synchronously___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Scanning")))
  {
    v8 = *MEMORY[0x1E0CC5BC0];
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("PIP")))
  {
    v8 = *MEMORY[0x1E0CC5BB8];
  }
  else
  {
    v8 = 0;
  }
  v9 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v10 = *MEMORY[0x1E0CC5AD0];
  if (v9)
  {
    v11 = v9;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v13)
      v13(FigBaseObject, v10, v8);
    if (v4)
    {
      cf = 0;
      v14 = FigPlayerGetFigBaseObject();
      v15 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
      if (v15)
      {
        v15(v14, *MEMORY[0x1E0CC5B58], *MEMORY[0x1E0C9AE00], &cf);
        if (cf)
          CFRelease(cf);
      }
    }
    CFRelease(v11);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v8, *MEMORY[0x1E0CC5AD0]);
  }
}

uint64_t __40__AVPlayer_setPlayerRole_synchronously___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 320) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setPlayerRole:(id)a3
{
  -[AVPlayer setPlayerRole:synchronously:](self, "setPlayerRole:synchronously:", a3, 0);
}

uint64_t __38__AVPlayer_setAllowsExternalPlayback___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, uint64_t);
  uint64_t v6;
  uint64_t result;
  uint64_t (*v8)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "allowsExternalPlayback");
  v2 = (uint64_t *)MEMORY[0x1E0C9AE50];
  if (!v1)
    v2 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v3 = *v2;
  FigBaseObject = FigPlayerGetFigBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(FigBaseObject, *MEMORY[0x1E0CC58F8], v3);
  v6 = FigPlayerGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v8 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v8)
    return v8(v6, *MEMORY[0x1E0CC5908], v3);
  return result;
}

uint64_t __63__AVPlayer_setUsesExternalPlaybackWhileExternalScreenIsActive___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, uint64_t);
  uint64_t v6;
  uint64_t result;
  uint64_t (*v8)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "usesExternalPlaybackWhileExternalScreenIsActive");
  v2 = (uint64_t *)MEMORY[0x1E0C9AE50];
  if (!v1)
    v2 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v3 = *v2;
  FigBaseObject = FigPlayerGetFigBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(FigBaseObject, *MEMORY[0x1E0CC5B80], v3);
  v6 = FigPlayerGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v8 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v8)
    return v8(v6, *MEMORY[0x1E0CC5B78], v3);
  return result;
}

- (BOOL)_externalPlaybackActive
{
  OpaqueFigPlayer *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, uint64_t, uint64_t, CFBooleanRef *);
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, uint64_t, CFBooleanRef *);
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  BOOL v12;
  CFBooleanRef v14;
  CFBooleanRef BOOLean;

  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v14 = 0;
  BOOLean = 0;
  v4 = *MEMORY[0x1E0CC5A30];
  if (v3)
  {
    v5 = *MEMORY[0x1E0C9AE00];
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
    if (v7)
      v7(FigBaseObject, v4, v5, &BOOLean);
    v8 = FigPlayerGetFigBaseObject();
    v9 = *(void (**)(uint64_t, _QWORD, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
    if (v9)
      v9(v8, *MEMORY[0x1E0CC5A20], v5, &v14);
  }
  else
  {
    v10 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E0CC5A30]);
    BOOLean = v10;
    if (v10)
      CFRetain(v10);
    v11 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E0CC5A20], v14);
    v14 = v11;
    if (v11)
      CFRetain(v11);
  }
  if (BOOLean)
  {
    v12 = CFBooleanGetValue(BOOLean) != 0;
    if (v12)
      goto LABEL_16;
  }
  else
  {
    v12 = 0;
  }
  if (v14)
    v12 = CFBooleanGetValue(v14) != 0;
LABEL_16:
  if (BOOLean)
    CFRelease(BOOLean);
  if (v14)
    CFRelease(v14);
  if (v3)
    CFRelease(v3);
  return v12;
}

- (BOOL)_isBufferedAirPlayActive
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayer__isBufferedAirPlayActive__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVPlayer__isBufferedAirPlayActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 468);
  return result;
}

- (BOOL)usesDedicatedNotificationQueueForMediaServices
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayer_usesDedicatedNotificationQueueForMediaServices__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVPlayer_usesDedicatedNotificationQueueForMediaServices__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 328);
  return result;
}

- (void)setUsesDedicatedNotificationQueueForMediaServices:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AVPlayer_setUsesDedicatedNotificationQueueForMediaServices___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __62__AVPlayer_setUsesDedicatedNotificationQueueForMediaServices___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5B68]);
  }
}

uint64_t __62__AVPlayer_setUsesDedicatedNotificationQueueForMediaServices___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 328) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __62__AVPlayer_setUsesDedicatedNotificationQueueForMediaServices___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "usesDedicatedNotificationQueueForMediaServices");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5B68], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGSize)dimensionsOfReservedVideoMemory
{
  NSObject *ivarAccessQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1935931BF;
  v12 = *MEMORY[0x1E0C9D820];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AVPlayer_dimensionsOfReservedVideoMemory__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

__n128 __43__AVPlayer_dimensionsOfReservedVideoMemory__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 336);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (__CFDictionary)_createDictionaryWithDimensionsOfReservedVideoMemory:(CGSize)a3
{
  __CFDictionary *Mutable;

  Mutable = 0;
  if (a3.width != 0.0 && a3.height != 0.0)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    FigCFDictionarySetCGSize();
  }
  return Mutable;
}

- (void)setDimensionsOfReservedVideoMemory:(CGSize)a3
{
  double height;
  double width;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  OpaqueFigPlayer *v8;
  __CFDictionary *v9;
  NSObject *figConfigurationQueue;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  CGSize v15;

  height = a3.height;
  width = a3.width;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVPlayer_setDimensionsOfReservedVideoMemory___block_invoke;
  block[3] = &unk_1E30314D8;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v8 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v8)
  {
    v9 = (__CFDictionary *)v8;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __47__AVPlayer_setDimensionsOfReservedVideoMemory___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v9;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
  }
  else
  {
    v9 = -[AVPlayer _createDictionaryWithDimensionsOfReservedVideoMemory:](self, "_createDictionaryWithDimensionsOfReservedVideoMemory:", width, height);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v9, *MEMORY[0x1E0CC5A90]);
    if (!v9)
      return;
  }
  CFRelease(v9);
}

__n128 __47__AVPlayer_setDimensionsOfReservedVideoMemory___block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 336) = result;
  return result;
}

void __47__AVPlayer_setDimensionsOfReservedVideoMemory___block_invoke_2(uint64_t a1)
{
  void *v2;
  const void *v3;
  uint64_t FigBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, const void *);
  int v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "dimensionsOfReservedVideoMemory");
  v3 = (const void *)objc_msgSend(v2, "_createDictionaryWithDimensionsOfReservedVideoMemory:");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v6 = v5(FigBaseObject, *MEMORY[0x1E0CC5A90], v3);
  else
    v6 = -12782;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  if (v3)
    CFRelease(v3);
}

- (BOOL)usesAudioOnlyModeForExternalPlayback
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayer_usesAudioOnlyModeForExternalPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayer_usesAudioOnlyModeForExternalPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 399);
  return result;
}

- (void)setUsesAudioOnlyModeForExternalPlayback:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("usesAudioOnlyModeForExternalPlayback"));
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVPlayer_setUsesAudioOnlyModeForExternalPlayback___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = v3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __52__AVPlayer_setUsesAudioOnlyModeForExternalPlayback___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("usesAudioOnlyModeForExternalPlayback"));
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5B60]);
    -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("usesAudioOnlyModeForExternalPlayback"));
  }
}

uint64_t __52__AVPlayer_setUsesAudioOnlyModeForExternalPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 399) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __52__AVPlayer_setUsesAudioOnlyModeForExternalPlayback___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "usesAudioOnlyModeForExternalPlayback");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5B60], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfUsesAudioOnlyModeForExternalPlayback
{
  return 0;
}

- (void)setOutputContext:(id)a3
{
  uint64_t v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  OpaqueFigPlayer *v8;
  OpaqueFigPlayer *v9;
  NSObject *figConfigurationQueue;
  id v11;
  _QWORD v12[7];
  _QWORD v13[3];
  int v14;
  _QWORD block[6];

  v5 = objc_msgSend(a3, "contextID");
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__AVPlayer_setOutputContext___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v8 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v8)
  {
    v9 = v8;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v14 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __29__AVPlayer_setOutputContext___block_invoke_2;
    v12[3] = &unk_1E3031868;
    v12[4] = self;
    v12[5] = v13;
    v12[6] = v9;
    dispatch_sync(figConfigurationQueue, v12);
    _Block_object_dispose(v13, 8);
    CFRelease(v9);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v5, *MEMORY[0x1E0CC5AB8]);
  }
  v11 = -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated");
  if (v11)
    objc_msgSend(v11, "setOutputContext:", a3);
}

_QWORD *__29__AVPlayer_setOutputContext___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(*(_QWORD *)(result[4] + 8) + 232);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(*(_QWORD *)(v2[4] + 8) + 232) = result;
  }
  return result;
}

void __29__AVPlayer_setOutputContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, _QWORD, uint64_t);
  int v7;
  const void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(v2 + 8) + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__AVPlayer_setOutputContext___block_invoke_3;
  v9[3] = &unk_1E302FD60;
  v9[4] = v2;
  v9[5] = &v10;
  av_readwrite_dispatch_queue_read(v3, v9);
  v4 = v11[3];
  FigBaseObject = FigPlayerGetFigBaseObject();
  v6 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
    v7 = v6(FigBaseObject, *MEMORY[0x1E0CC5AB8], v4);
  else
    v7 = -12782;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  v8 = (const void *)v11[3];
  if (v8)
    CFRelease(v8);
  _Block_object_dispose(&v10, 8);
}

CFTypeRef __29__AVPlayer_setOutputContext___block_invoke_3(uint64_t a1)
{
  CFTypeRef result;

  result = (CFTypeRef)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 232), "contextID");
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_airPlayVideoActive
{
  OpaqueFigPlayer *v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, uint64_t, _QWORD, CFBooleanRef *);
  const __CFBoolean *v7;
  const __CFBoolean *v8;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v4 = *MEMORY[0x1E0CC5A20];
  if (v3)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v6 = *(void (**)(uint64_t, uint64_t, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
    if (!v6)
    {
      LOBYTE(v7) = 0;
LABEL_12:
      CFRelease(v3);
      return (char)v7;
    }
    v6(FigBaseObject, v4, *MEMORY[0x1E0C9AE00], &BOOLean);
    v7 = BOOLean;
    if (!BOOLean)
      goto LABEL_12;
  }
  else
  {
    v8 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E0CC5A20]);
    v7 = v8;
    BOOLean = v8;
    if (!v8)
      return (char)v7;
    CFRetain(v8);
  }
  LOBYTE(v7) = CFBooleanGetValue(v7) != 0;
  if (BOOLean)
    CFRelease(BOOLean);
  if (v3)
    goto LABEL_12;
  return (char)v7;
}

+ (BOOL)automaticallyNotifiesObserversOfAirPlayVideoActive
{
  return 0;
}

- (void)setUsesAirPlayVideoWhileAirPlayScreenIsActive:(BOOL)usesAirPlayVideoWhileAirPlayScreenIsActive
{
  _BOOL8 v3;

  v3 = usesAirPlayVideoWhileAirPlayScreenIsActive;
  -[AVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("usesAirPlayVideoWhileAirPlayScreenIsActive"));
  -[AVPlayer setUsesExternalPlaybackWhileExternalScreenIsActive:](self, "setUsesExternalPlaybackWhileExternalScreenIsActive:", v3);
  -[AVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("usesAirPlayVideoWhileAirPlayScreenIsActive"));
}

+ (BOOL)automaticallyNotifiesObserversOfUsesAirPlayVideoWhileAirPlayScreenIsActive
{
  return 0;
}

- (void)removeTimeObserver:(id)observer
{
  OpaqueCMTimebase *proxyTimebase;
  void *v6;
  uint64_t v7;
  const __CFString *v8;

  if (observer)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      proxyTimebase = self->_player->proxyTimebase;
      if (proxyTimebase == (OpaqueCMTimebase *)objc_msgSend(observer, "timebase"))
      {
        objc_msgSend(observer, "invalidate");
        return;
      }
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99778];
      v8 = CFSTR("An instance of AVPlayer cannot remove a time observer that was added by a different instance of AVPlayer.");
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99778];
      v8 = CFSTR("You did not supply a reference to an object returned by either -addPeriodicTimeObserverForInterval:queue:usingBlock: or -addBoundaryTimeObserverForTimes:queue:usingBlock:");
    }
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0));
  }
}

- (id)_pixelBufferAttributeMediator
{
  return self->_player->pixelBufferAttributeMediator;
}

- (id)_playerCaptionLayers
{
  NSObject *layersQ;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__AVPlayer__playerCaptionLayers__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __32__AVPlayer__playerCaptionLayers__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 688), "allObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setOptions:(id)a3 onClosedCaptionLayer:(id)a4
{
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t FigBaseObject;
  void (*v15)(uint64_t, _QWORD, void *);

  if (a4)
  {
    v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
    if (v7)
    {
      v8 = v7;
      v9 = -[AVPlayer _closedCaptionLayers](self, "_closedCaptionLayers");
      if (v9)
      {
        v10 = objc_msgSend(v9, "indexOfObject:", a4);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v11 = v10;
          v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend(v12, "addEntriesFromDictionary:", a3);
          v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
          objc_msgSend(v12, "setValue:forKey:", v13, *MEMORY[0x1E0CC5660]);
          FigBaseObject = FigPlayerGetFigBaseObject();
          v15 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
          if (v15)
            v15(FigBaseObject, *MEMORY[0x1E0CC5980], v12);
        }
      }
      CFRelease(v8);
    }
  }
}

- (void)_setSeparated:(BOOL)a3 onClosedCaptionLayer:(id)a4
{
  _BOOL4 v5;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t FigBaseObject;
  void (*v16)(uint64_t, _QWORD, uint64_t);
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = a3;
    v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
    if (v7)
    {
      v8 = v7;
      v9 = -[AVPlayer _closedCaptionLayers](self, "_closedCaptionLayers");
      if (v9)
      {
        v10 = objc_msgSend(v9, "indexOfObject:", a4);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17[0] = *MEMORY[0x1E0CC5670];
          v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
          v17[1] = *MEMORY[0x1E0CC5678];
          v12 = (uint64_t *)MEMORY[0x1E0C9AE50];
          if (!v5)
            v12 = (uint64_t *)MEMORY[0x1E0C9AE40];
          v13 = *v12;
          v18[0] = v11;
          v18[1] = v13;
          v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
          FigBaseObject = FigPlayerGetFigBaseObject();
          v16 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
          if (v16)
            v16(FigBaseObject, *MEMORY[0x1E0CC5988], v14);
        }
      }
      CFRelease(v8);
    }
  }
}

- (void)_addPlayerCaptionLayer:(id)a3
{
  OpaqueFigPlayer *v5;
  uint64_t v6;
  void *v7;
  NSObject *layersQ;
  void (*v9)(_QWORD);
  NSObject *stateDispatchQueue;
  id v11;
  void (*v12[6])(_QWORD);
  _QWORD block[10];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v5 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = objc_msgSend(a3, "_closedCaptionLayer");
  v7 = (void *)objc_msgSend(a3, "_subtitleLayer");
  layersQ = self->_player->layersQ;
  v9 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AVPlayer__addPlayerCaptionLayer___block_invoke;
  block[3] = &unk_1E30318F0;
  block[4] = self;
  block[5] = v7;
  block[8] = &v14;
  block[9] = &v18;
  block[6] = v6;
  block[7] = a3;
  dispatch_sync(layersQ, block);
  if (*((_BYTE *)v15 + 24))
    objc_msgSend(v7, "setPlayer:", v5);
  if (*((_BYTE *)v19 + 24))
  {
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v12[0] = v9;
    v12[1] = (void (*)(_QWORD))3221225472;
    v12[2] = (void (*)(_QWORD))__35__AVPlayer__addPlayerCaptionLayer___block_invoke_2;
    v12[3] = (void (*)(_QWORD))&unk_1E302FE78;
    v12[4] = (void (*)(_QWORD))self;
    v12[5] = (void (*)(_QWORD))v5;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v12);
  }
  v11 = -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated");
  if (v11)
  {
    objc_msgSend((id)objc_msgSend(a3, "_interstitialLayer"), "setPlayer:", v11);
    if (-[NSString isEqualToString:](-[AVPlayer reasonForWaitingToPlay](self, "reasonForWaitingToPlay"), "isEqualToString:", CFSTR("AVPlayerWaitingDuringInterstitialEventReason")))
    {
      objc_msgSend(a3, "_setShowInterstitialInstead:", 1);
    }
  }
  if (v5)
    CFRelease(v5);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

uint64_t __35__AVPlayer__addPlayerCaptionLayer___block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = addObjectToArray(*(void **)(*(_QWORD *)(a1[4] + 8) + 664), a1[5]);
  result = addObjectToArray(*(void **)(*(_QWORD *)(a1[4] + 8) + 672), a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = result;
  if (a1[7])
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 688), "containsObject:");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 688), "addObject:", a1[7]);
  }
  return result;
}

uint64_t __35__AVPlayer__addPlayerCaptionLayer___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_attachClosedCaptionLayersToFigPlayer");
  return result;
}

- (void)_removePlayerCaptionLayer:(id)a3
{
  OpaqueFigPlayer *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *layersQ;
  void (*v10)(_QWORD);
  NSObject *stateDispatchQueue;
  void (*v12[6])(_QWORD);
  _QWORD block[10];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v5 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = objc_msgSend(a3, "_closedCaptionLayer");
  v7 = (void *)objc_msgSend(a3, "_subtitleLayer");
  if (-[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated"))
    v8 = (void *)objc_msgSend(a3, "_interstitialLayer");
  else
    v8 = 0;
  layersQ = self->_player->layersQ;
  v10 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVPlayer__removePlayerCaptionLayer___block_invoke;
  block[3] = &unk_1E30318F0;
  block[4] = self;
  block[5] = v6;
  block[8] = &v18;
  block[9] = &v14;
  block[6] = v7;
  block[7] = a3;
  dispatch_sync(layersQ, block);
  if (*((_BYTE *)v19 + 24))
  {
    if (v5)
      CFRetain(v5);
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v12[0] = v10;
    v12[1] = (void (*)(_QWORD))3221225472;
    v12[2] = __38__AVPlayer__removePlayerCaptionLayer___block_invoke_2;
    v12[3] = (void (*)(_QWORD))&unk_1E302FE78;
    v12[4] = (void (*)(_QWORD))self;
    v12[5] = (void (*)(_QWORD))v5;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v12);
  }
  if (*((_BYTE *)v15 + 24))
    objc_msgSend(v7, "setPlayer:", 0);
  if (-[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated"))
    objc_msgSend(v8, "setPlayer:", 0);
  if (v5)
    CFRelease(v5);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

uint64_t __38__AVPlayer__removePlayerCaptionLayer___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t result;

  v2 = a1[5];
  v3 = *(void **)(*(_QWORD *)(a1[4] + 8) + 672);
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "removeObject:", v2);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v4 != objc_msgSend(v3, "count");
  v5 = *(void **)(*(_QWORD *)(a1[4] + 8) + 664);
  v6 = a1[6];
  v7 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "removeObject:", v6);
  result = objc_msgSend(v5, "count");
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = v7 != (_DWORD)result;
  if (a1[7])
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 688), "containsObject:");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 688), "removeObject:", a1[7]);
  }
  return result;
}

void __38__AVPlayer__removePlayerCaptionLayer___block_invoke_2(uint64_t a1)
{
  const void *v2;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_attachClosedCaptionLayersToFigPlayer");
    v2 = *(const void **)(a1 + 40);
    if (v2)
      CFRelease(v2);
  }
}

- (__CVBuffer)_copyDisplayedPixelBuffer
{
  float v3;
  __CVBuffer *result;
  __CVBuffer *v5;
  uint64_t FigBaseObject;
  unsigned int (*v7)(uint64_t, _QWORD, _QWORD, _QWORD *);
  NSObject *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v10[23];

  v10[22] = *MEMORY[0x1E0C80C00];
  -[AVPlayer rate](self, "rate");
  v10[0] = 0;
  if (v3 == 0.0)
  {
    result = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
    if (result)
    {
      v5 = result;
      FigBaseObject = FigPlayerGetFigBaseObject();
      v7 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
      if (!v7 || v7(FigBaseObject, *MEMORY[0x1E0CC5990], *MEMORY[0x1E0C9AE00], v10))
      {
        if (dword_1ECDECF38)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      CFRelease(v5);
      return (__CVBuffer *)v10[0];
    }
  }
  else
  {
    if (dword_1ECDECF38)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  return result;
}

- (void)_removeLayer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend(a3, "_videoLayer");
  v6 = objc_msgSend(a3, "_closedCaptionLayer");
  v7 = objc_msgSend(a3, "_subtitleLayer");
  if (-[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated"))
    v8 = objc_msgSend(a3, "_interstitialLayer");
  else
    v8 = 0;
  -[AVPlayer _removeLayer:videoLayer:closedCaptionLayer:subtitleLayer:interstitialLayer:](self, "_removeLayer:videoLayer:closedCaptionLayer:subtitleLayer:interstitialLayer:", a3, v5, v6, v7, v8);
}

- (id)_performanceDictionary
{
  OpaqueFigPlayer *v2;
  OpaqueFigPlayer *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, void **);
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v2 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
    {
      v5(FigBaseObject, *MEMORY[0x1E0CC5AA0], 0, &v34);
      v6 = v34;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;
    CFRelease(v3);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CC5600]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v9)
  {
    v10 = v9;
    v25 = *(_QWORD *)v31;
    v11 = *MEMORY[0x1E0CC6360];
    v12 = *MEMORY[0x1E0CC6368];
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v15 = (void *)objc_msgSend(v14, "objectForKey:", v11);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
LABEL_14:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v19);
            v21 = (void *)objc_msgSend(v20, "objectForKey:", v12);
            if (v21)
            {
              if (!objc_msgSend(v21, "intValue"))
                break;
            }
            if (v17 == ++v19)
            {
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
              if (v17)
                goto LABEL_14;
              goto LABEL_23;
            }
          }
          if (!v20)
            continue;
          v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v14);
          objc_msgSend(v22, "addEntriesFromDictionary:", v20);
          return v22;
        }
LABEL_23:
        ;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v10)
        continue;
      break;
    }
  }
  return 0;
}

- (void)setExternalPlaybackVideoGravity:(AVLayerVideoGravity)externalPlaybackVideoGravity
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVPlayer_setExternalPlaybackVideoGravity___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = externalPlaybackVideoGravity;
  block[5] = self;
  block[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v7 + 24))
    -[AVPlayer _setNeroVideoGravityOnFigPlayer](self, "_setNeroVideoGravityOnFigPlayer");
  _Block_object_dispose(&v6, 8);
}

uint64_t __44__AVPlayer_setExternalPlaybackVideoGravity___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 360));
  if ((result & 1) == 0)
  {

    result = objc_msgSend(*(id *)(a1 + 32), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 360) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)_getDisplayVideoRange:(id *)a3 displaySize:(CGSize *)a4 refreshRate:(id *)a5
{
  OpaqueFigPlayer *v8;
  uint64_t FigBaseObject;
  void (*v10)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CGSize v12;
  CFTypeRef cf;

  cf = 0;
  v12 = (CGSize)*MEMORY[0x1E0C9D820];
  v8 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v8)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v10 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v10)
      v10(FigBaseObject, *MEMORY[0x1E0CC59D0], 0, &cf);
    FPSupport_GetCurrentDisplayModeVideoRangeAndSizeAndFrameRate();
    *a3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", FPSupport_GetModeString());
    *a4 = v12;
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    CFRelease(v8);
    if (cf)
      CFRelease(cf);
  }
  return v8 != 0;
}

- (BOOL)_shouldLogPerformanceData
{
  return self->_player->logPerformanceData;
}

- (void)_logPerformanceDataForPreviousItem
{
  OpaqueFigPlayer *v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD, id *);
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  id v10;

  v10 = 0;
  v2 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v4)
  {
    v4(FigBaseObject, *MEMORY[0x1E0CC5AA8], 0, &v10);
    if (v10)
    {
      v5 = objc_msgSend(v10, "count");
      if (v5 >= 1)
      {
        v6 = (void *)objc_msgSend(v10, "objectAtIndex:", v5 - 1);
        if (v6)
        {
          v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "description"), "componentsSeparatedByString:", CFSTR("\n"));
          v8 = objc_msgSend(v7, "count");
          NSLog(CFSTR("++++++++++++++++++++++++++++++++++++++++++"));
          if (v8 >= 1)
          {
            for (i = 0; i != v8; ++i)
              NSLog(CFSTR("%@"), objc_msgSend(v7, "objectAtIndex:", i));
          }
          NSLog(CFSTR("------------------------------------------"));
        }
      }

    }
  }
  if (v2)
    CFRelease(v2);
}

- (id)_copyPerformanceDataForCurrentItem
{
  id result;
  id v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, void **);
  void *v6;

  v6 = 0;
  result = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (result)
  {
    v3 = result;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC5AA0], 0, &v6);
    CFRelease(v3);
    return v6;
  }
  return result;
}

- (void)_logPerformanceDataForCurrentItem
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  id v6;

  v2 = -[AVPlayer _copyPerformanceDataForCurrentItem](self, "_copyPerformanceDataForCurrentItem");
  if (v2)
  {
    v6 = v2;
    v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "description"), "componentsSeparatedByString:", CFSTR("\n"));
    v4 = objc_msgSend(v3, "count");
    NSLog(CFSTR("++++++++++++++++++++++++++++++++++++++++++"));
    if (v4 >= 1)
    {
      for (i = 0; i != v4; ++i)
        NSLog(CFSTR("%@"), objc_msgSend(v3, "objectAtIndex:", i));
    }
    NSLog(CFSTR("------------------------------------------"));

  }
}

- (void)_setLimitsBandwidthForCellularAccess:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVPlayer__setLimitsBandwidthForCellularAccess___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __49__AVPlayer__setLimitsBandwidthForCellularAccess___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5A40]);
  }
}

uint64_t __49__AVPlayer__setLimitsBandwidthForCellularAccess___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 398) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __49__AVPlayer__setLimitsBandwidthForCellularAccess___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_limitsBandwidthForCellularAccess");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5A40], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_limitsBandwidthForCellularAccess
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayer__limitsBandwidthForCellularAccess__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVPlayer__limitsBandwidthForCellularAccess__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 398);
  return result;
}

- (void)_setPausesAudioVisualPlaybackInBackground:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 3;
  -[AVPlayer setAudiovisualBackgroundPlaybackPolicy:](self, "setAudiovisualBackgroundPlaybackPolicy:", v3);
}

- (BOOL)_pausesAudioVisualPlaybackInBackground
{
  return -[AVPlayer audiovisualBackgroundPlaybackPolicy](self, "audiovisualBackgroundPlaybackPolicy") == AVPlayerAudiovisualBackgroundPlaybackPolicyPauses;
}

+ (void)checkForAvailableHDRModesChanges
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, "availableHDRModes");
  v4 = v3;
  if (previousAvailableHDRModes != v3)
  {
    previousAvailableHDRModes = v3;
    objc_msgSend(a1, "fireAvailableHDRModesDidChangeNotification");
  }
  if (previousEligibleForHDR != (v4 != 0))
  {
    previousEligibleForHDR = v4 != 0;
    objc_msgSend(a1, "fireEligibleForHDRPlaybackDidChangeNotification");
  }
}

+ (void)fireAvailableHDRModesDidChangeNotification
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVPlayerAvailableHDRModesDidChangeNotification"), objc_opt_class());
}

+ (void)fireEligibleForHDRPlaybackDidChangeNotification
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVPlayerEligibleForHDRPlaybackDidChangeNotification"), objc_opt_class());
}

+ (BOOL)eligibleForHDRPlayback
{
  return objc_msgSend(a1, "availableHDRModes") != 0;
}

- (BOOL)_suppressesAudioRendering
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayer__suppressesAudioRendering__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__AVPlayer__suppressesAudioRendering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 555);
  return result;
}

- (void)setPreventsAutomaticBackgroundingDuringVideoPlayback:(BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
{
  NSObject *ivarAccessQueue;
  void (*v5)(_QWORD);
  NSObject *stateDispatchQueue;
  void (*v7[5])(_QWORD);
  _QWORD block[5];
  BOOL v9;

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__AVPlayer_AVPlayerAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v9 = preventsAutomaticBackgroundingDuringVideoPlayback;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v7[0] = v5;
  v7[1] = (void (*)(_QWORD))3221225472;
  v7[2] = __104__AVPlayer_AVPlayerAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke_2;
  v7[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v7[4] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v7);
}

uint64_t __104__AVPlayer_AVPlayerAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 405) = *(_BYTE *)(result + 40);
  return result;
}

void __104__AVPlayer_AVPlayerAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke_2(uint64_t a1)
{
  const void *v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, uint64_t);

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFigPlayer");
  v3 = objc_msgSend(*(id *)(a1 + 32), "preventsAutomaticBackgroundingDuringVideoPlayback");
  v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  if (v2)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, *MEMORY[0x1E0CC5AF8], v5);
    CFRelease(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", *v4, *MEMORY[0x1E0CC5AF8]);
  }
}

- (BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100__AVPlayer_AVPlayerAutomaticBackgroundPrevention__preventsAutomaticBackgroundingDuringVideoPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __100__AVPlayer_AVPlayerAutomaticBackgroundPrevention__preventsAutomaticBackgroundingDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 405);
  return result;
}

- (id)_playbackDisplaysForFigPlayer
{
  NSArray *displaysUsedForPlayback;
  void *v4;
  unint64_t v5;

  displaysUsedForPlayback = self->_player->displaysUsedForPlayback;
  if (!displaysUsedForPlayback)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](displaysUsedForPlayback, "count"));
  if (-[NSArray count](self->_player->displaysUsedForPlayback, "count"))
  {
    v5 = 0;
    do
      objc_msgSend(v4, "addObject:", objc_msgSend(-[NSArray objectAtIndex:](self->_player->displaysUsedForPlayback, "objectAtIndex:", v5++), "name"));
    while (v5 < -[NSArray count](self->_player->displaysUsedForPlayback, "count"));
  }
  return v4;
}

- (NSArray)_displaysUsedForPlayback
{
  return self->_player->displaysUsedForPlayback;
}

- (void)_setDisplaysUsedForPlayback:(id)a3
{
  NSArray *v4;

  v4 = (NSArray *)objc_msgSend(a3, "copy");

  self->_player->displaysUsedForPlayback = v4;
}

- (int64_t)_externalProtectionStatusCopiedFromFig
{
  OpaqueFigPlayer *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef v6;
  int64_t v7;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v3
    && (FigBaseObject = FigPlayerGetFigBaseObject(),
        (v5 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48)) != 0))
  {
    v5(FigBaseObject, *MEMORY[0x1E0CC5A10], *MEMORY[0x1E0C9AE00], &cf);
    v6 = cf;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[AVPlayer _extractFPExternalProtectionStatus:](self, "_extractFPExternalProtectionStatus:", v6);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v3)
    CFRelease(v3);
  return v7;
}

- (int64_t)_externalProtectionStatus
{
  OpaqueFigPlayer *v3;
  NSObject *ivarAccessQueue;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v3)
  {
    ivarAccessQueue = self->_player->ivarAccessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__AVPlayer_AVPlayerProtectedContentPrivate___externalProtectionStatus__block_invoke;
    v7[3] = &unk_1E302FD60;
    v7[4] = self;
    v7[5] = &v8;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
    CFRelease(v3);
    v5 = v9[3];
  }
  else
  {
    v5 = 0;
    v9[3] = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __70__AVPlayer_AVPlayerProtectedContentPrivate___externalProtectionStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 472);
  return result;
}

- (void)removeAudioPlaybackRateLimits
{
  uint64_t v3;
  NSObject *ivarAccessQueue;
  OpaqueFigPlayer *v5;
  OpaqueFigPlayer *v6;
  NSObject *figConfigurationQueue;
  _QWORD v8[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__AVPlayer_AVPlayerAudioPlaybackRateLimits__removeAudioPlaybackRateLimits__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v5 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v5)
  {
    v6 = v5;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __74__AVPlayer_AVPlayerAudioPlaybackRateLimits__removeAudioPlaybackRateLimits__block_invoke_2;
    v8[3] = &__block_descriptor_40_e5_v8__0l;
    v8[4] = v6;
    dispatch_sync(figConfigurationQueue, v8);
    CFRelease(v6);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", 0, *MEMORY[0x1E0CC5A70]);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", 0, *MEMORY[0x1E0CC5A58]);
  }
}

uint64_t __74__AVPlayer_AVPlayerAudioPlaybackRateLimits__removeAudioPlaybackRateLimits__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 384) = -8388608;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 388) = 2139095040;
  return result;
}

uint64_t __74__AVPlayer_AVPlayerAudioPlaybackRateLimits__removeAudioPlaybackRateLimits__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD);
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0CC5A70];
  v7[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6[1] = *MEMORY[0x1E0CC5A58];
  v7[1] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = *(_QWORD *)(a1 + 32);
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(result + 16) + 112);
  if (v5)
    return v5(v3, v2, 0);
  return result;
}

- (BOOL)isAudioPlaybackEnabledAtAllRates
{
  float v3;
  float v4;

  -[AVPlayer minRateForAudioPlayback](self, "minRateForAudioPlayback");
  if (v3 != -INFINITY)
    return 0;
  -[AVPlayer maxRateForAudioPlayback](self, "maxRateForAudioPlayback");
  return v4 == INFINITY;
}

uint64_t __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMinRateForAudioPlayback___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t FigBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "minRateForAudioPlayback");
  v3 = objc_msgSend(v2, "numberWithFloat:");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    result = v5(FigBaseObject, *MEMORY[0x1E0CC5A70], v3);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (float)minRateForAudioPlayback
{
  NSObject *ivarAccessQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = -8388608;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayer_AVPlayerAudioPlaybackRateLimits__minRateForAudioPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __68__AVPlayer_AVPlayerAudioPlaybackRateLimits__minRateForAudioPlayback__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 384);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMaxRateForAudioPlayback:(float)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  OpaqueFigPlayer *v6;
  CFNumberRef v7;
  NSObject *figConfigurationQueue;
  _QWORD v9[7];
  _QWORD v10[3];
  int v11;
  _QWORD block[5];
  float v13;
  float valuePtr;

  valuePtr = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMaxRateForAudioPlayback___block_invoke;
  block[3] = &unk_1E30317D0;
  block[4] = self;
  v13 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v6 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v6)
  {
    v7 = (CFNumberRef)v6;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMaxRateForAudioPlayback___block_invoke_2;
    v9[3] = &unk_1E3031868;
    v9[4] = self;
    v9[5] = v10;
    v9[6] = v7;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
  }
  else
  {
    v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v7, *MEMORY[0x1E0CC5A58]);
  }
  CFRelease(v7);
}

float __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMaxRateForAudioPlayback___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 388) = result;
  return result;
}

uint64_t __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMaxRateForAudioPlayback___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t FigBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "maxRateForAudioPlayback");
  v3 = objc_msgSend(v2, "numberWithFloat:");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    result = v5(FigBaseObject, *MEMORY[0x1E0CC5A58], v3);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (float)maxRateForAudioPlayback
{
  NSObject *ivarAccessQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 2139095040;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayer_AVPlayerAudioPlaybackRateLimits__maxRateForAudioPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __68__AVPlayer_AVPlayerAudioPlaybackRateLimits__maxRateForAudioPlayback__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 388);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock
{
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock_sniffUIApplicationOnce != -1)
    dispatch_once(&_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock_sniffUIApplicationOnce, &__block_literal_global_766);
  if (_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock_uiApplicationClass)
  {
    v3 = SBSGetScreenLockStatus();
    if (v3)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = -[AVPlayer _videoLayers](self, "_videoLayers", 0);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        v8 = *MEMORY[0x1E0CD2A20];
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "context"), "options"), "objectForKey:", v8);
            if (v10 && !objc_msgSend(v10, "isEqualToString:", CFSTR("LCD")))
            {
              LOBYTE(v3) = 1;
              return v3;
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            continue;
          break;
        }
      }
      LOBYTE(v3) = -[AVPlayer isExternalPlaybackActive](self, "isExternalPlaybackActive");
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

Class __105__AVPlayer_AVPlayerMultitaskSupport___applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("UIApplication"));
  _applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock_uiApplicationClass = (uint64_t)result;
  return result;
}

- (BOOL)_hasAssociatedOnscreenAVPlayerLayer
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[AVPlayer _videoLayers](self, "_videoLayers", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "context"))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

+ (BOOL)isIAPDExtendedModeActive
{
  uint32_t v2;
  BOOL result;
  int v4;
  int out_token;
  uint64_t state64;

  state64 = 0;
  out_token = 0;
  v2 = notify_register_check("com.apple.iapd.notify.extendedMode", &out_token);
  result = 0;
  if (!v2)
  {
    v4 = 0;
    notify_check(out_token, &v4);
    if (v4)
      notify_get_state(out_token, &state64);
    notify_cancel(out_token);
    return state64 == 1;
  }
  return result;
}

- (BOOL)_isIAPDExtendedModeActive
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (AVPlayerInitializeIAPD_onceToken != -1)
    dispatch_once(&AVPlayerInitializeIAPD_onceToken, &__block_literal_global_1125);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __AVPlayerGetCachedIAPDModeActive_block_invoke;
  block[3] = &unk_1E3031C38;
  block[4] = &v5;
  av_readwrite_dispatch_queue_read((dispatch_queue_t)sAVPlayerIAPDReadWriteQueue, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_carplayIsActive
{
  return +[AVExternalDevice currentCarPlayExternalDevice](AVExternalDevice, "currentCarPlayExternalDevice") != 0;
}

- (BOOL)_canContinuePlaybackInBackgrounBasedOnAudiovisualBackgroundPlaybackPolicy:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return objc_msgSend((id)objc_msgSend(-[AVPlayer _playbackCoordinatorWithoutTriggeringFullSetup](self, "_playbackCoordinatorWithoutTriggeringFullSetup", v3, v4), "otherParticipants"), "count") != 0;
  else
    return a3 == 3;
}

- (int64_t)_itemOkayToPlayWhileTransitioningToBackground:(id)a3
{
  int64_t v5;
  BOOL v7;
  AVPlayerAudiovisualBackgroundPlaybackPolicy v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (_CFMZEnabled()
    || !objc_msgSend(-[AVPlayer _videoLayers](self, "_videoLayers"), "count")
    || -[AVPlayer _airPlayVideoActive](self, "_airPlayVideoActive")
    || -[AVPlayer _CALayerDestinationIsTVOut](self, "_CALayerDestinationIsTVOut")
    || -[AVPlayer _hasAssociatedAVPlayerLayerInPIPMode](self, "_hasAssociatedAVPlayerLayerInPIPMode")
    || -[AVPlayer _carplayIsActive](self, "_carplayIsActive")
    || -[AVPlayer _applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock](self, "_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock"))
  {
    -[AVPlayer audiovisualBackgroundPlaybackPolicy](self, "audiovisualBackgroundPlaybackPolicy");
  }
  else
  {
    v7 = -[AVPlayer _isIAPDExtendedModeActive](self, "_isIAPDExtendedModeActive");
    v8 = -[AVPlayer audiovisualBackgroundPlaybackPolicy](self, "audiovisualBackgroundPlaybackPolicy");
    if (!v7
      && !-[AVPlayer _canContinuePlaybackInBackgrounBasedOnAudiovisualBackgroundPlaybackPolicy:](self, "_canContinuePlaybackInBackgrounBasedOnAudiovisualBackgroundPlaybackPolicy:", v8))
    {
      v9 = objc_msgSend(a3, "status");
      if (!v9)
        return 2;
      if (v9 != 1)
        return 0;
      v10 = (void *)objc_msgSend(a3, "tracks");
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        v5 = 1;
LABEL_17:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "assetTrack"), "mediaType"), "isEqualToString:", CFSTR("vide")))
          {
            if ((objc_msgSend((id)objc_msgSend(a3, "asset"), "_isStreaming") & 1) != 0
              || (objc_msgSend(v15, "isEnabled") & 1) != 0)
            {
              return 0;
            }
          }
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v12)
              goto LABEL_17;
            return v5;
          }
        }
      }
    }
  }
  return 1;
}

- (BOOL)_shouldDetachVideoLayersFromFigPlayer
{
  if (-[AVPlayer _hasAssociatedAVPlayerLayerInPIPMode](self, "_hasAssociatedAVPlayerLayerInPIPMode")
    || -[AVPlayer _applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock](self, "_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock")|| -[AVPlayer _isIAPDExtendedModeActive](self, "_isIAPDExtendedModeActive"))
  {
    return 0;
  }
  if (-[AVApplicationStateMonitor isHostApplicationInForeground](self->_player->applicationStateMonitor, "isHostApplicationInForeground"))
  {
    return !-[AVPlayer _hasForegroundLayers](self, "_hasForegroundLayers");
  }
  return 1;
}

- (id)_acquireBackgroundAssertion
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D87C98]);
  v3 = objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v7[0] = objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskInterruptable"));
  v4 = (id)objc_msgSend(v2, "initWithExplanation:target:attributes:", CFSTR("AVPlayer background assertion"), v3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
  v6 = 0;
  if (objc_msgSend(v4, "acquireWithError:", &v6))
    return v4;
  else
    return 0;
}

- (void)_didEnterBackground:(id)a3
{
  NSObject *stateDispatchQueue;
  void (*v4[5])(_QWORD);

  stateDispatchQueue = self->_player->stateDispatchQueue;
  v4[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v4[1] = (void (*)(_QWORD))3221225472;
  v4[2] = __58__AVPlayer_AVPlayerMultitaskSupport___didEnterBackground___block_invoke;
  v4[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v4[4] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v4);
}

void __58__AVPlayer_AVPlayerMultitaskSupport___didEnterBackground___block_invoke(uint64_t a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[6];

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "setHostApplicationInForeground:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 778) = 1;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_acquireBackgroundAssertion");
  v3 = dispatch_time(0, 1000000000);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(*(_QWORD *)(v4 + 8) + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AVPlayer_AVPlayerMultitaskSupport___didEnterBackground___block_invoke_2;
  v6[3] = &unk_1E302FCE8;
  v6[4] = v4;
  v6[5] = v2;
  dispatch_after(v3, v5, v6);
}

void *__58__AVPlayer_AVPlayerMultitaskSupport___didEnterBackground___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 778) && (objc_msgSend(*(id *)(v2 + 544), "isHostApplicationInForeground") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_didFinishSuspension:", 0);
  result = *(void **)(a1 + 40);
  if (result)
    return (void *)objc_msgSend(result, "invalidate");
  return result;
}

- (void)_detachVideoLayersForSuspension
{
  NSObject *stateDispatchQueue;
  void (*v3[5])(_QWORD);

  stateDispatchQueue = self->_player->stateDispatchQueue;
  v3[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v3[1] = (void (*)(_QWORD))3221225472;
  v3[2] = __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke;
  v3[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v3[4] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v3);
}

void __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke(uint64_t a1)
{
  const void *v2;
  void (*v3)(_QWORD);
  float v4;
  void (*v5[6])(_QWORD);
  void (*v6[5])(_QWORD);

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFigPlayer");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 778) = 0;
  objc_msgSend(*(id *)(a1 + 32), "rate");
  v3 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  if (v4 != 0.0)
  {
    v6[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v6[1] = (void (*)(_QWORD))3221225472;
    v6[2] = __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_2;
    v6[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v6[4] = *(void (**)(_QWORD))(a1 + 32);
    AVEnsureNotOnMainThread(v6);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasAssociatedOnscreenAVPlayerLayer"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 777) = 1;
  if (v2)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_videoLayers"), "count"))
    {
      CFRetain(v2);
      v5[0] = v3;
      v5[1] = (void (*)(_QWORD))3221225472;
      v5[2] = __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_4;
      v5[3] = (void (*)(_QWORD))&unk_1E302FE78;
      v5[4] = *(void (**)(_QWORD))(a1 + 32);
      v5[5] = (void (*)(_QWORD))v2;
      AVEnsureNotOnMainThread(v5);
    }
    CFRelease(v2);
  }
}

void __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_2(uint64_t a1)
{
  void (*v2)(_QWORD);
  uint64_t v3;
  NSObject *v4;
  void (*v5[6])(_QWORD);

  v2 = (void (*)(_QWORD))objc_msgSend(*(id *)(a1 + 32), "_itemOkayToPlayWhileTransitioningToBackground:", objc_msgSend(*(id *)(a1 + 32), "currentItem"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(v3 + 8) + 32);
  v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v5[1] = (void (*)(_QWORD))3221225472;
  v5[2] = (void (*)(_QWORD))__69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_3;
  v5[3] = (void (*)(_QWORD))&unk_1E302FE78;
  v5[4] = (void (*)(_QWORD))v3;
  v5[5] = v2;
  AVSerializeOnQueueAsyncIfNecessary(v4, v5);
}

uint64_t __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_3(uint64_t a1)
{
  char v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  double v6;
  __int128 v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground"))v2 = objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers");
  else
    v2 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "_hasAssociatedAVPlayerLayerInPIPMode");
  if ((v2 & 1) == 0 && (result & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 == 2)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 776) = 1;
    }
    else if (!v4)
    {
      v5 = *(void **)(a1 + 32);
      v7 = *MEMORY[0x1E0CA2E18];
      HIDWORD(v6) = DWORD1(v7);
      v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      LODWORD(v6) = 0;
      result = objc_msgSend(v5, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v7, 0, 25, 1, v6);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 779) = 1;
  }
  return result;
}

void __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_4(uint64_t a1)
{
  __int128 v2;
  NSObject *v3;
  const void *v4;
  void (*v5[4])(_QWORD);
  __int128 v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldDetachVideoLayersFromFigPlayer"))
  {
    v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v2 = *(_OWORD *)(a1 + 32);
    v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
    v5[1] = (void (*)(_QWORD))3221225472;
    v5[2] = __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_5;
    v5[3] = (void (*)(_QWORD))&unk_1E302FE78;
    v6 = v2;
    AVSerializeOnQueueAsyncIfNecessary(v3, v5);
  }
  else
  {
    v4 = *(const void **)(a1 + 40);
    if (v4)
      CFRelease(v4);
  }
}

void __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_5(uint64_t a1)
{
  char v2;
  char v3;
  const void *v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground"))v2 = objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers");
  else
    v2 = 0;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_hasAssociatedAVPlayerLayerInPIPMode");
  if ((v2 & 1) == 0 && (v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_detachVideoLayersFromFigPlayer:", *(_QWORD *)(a1 + 40));
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
}

- (BOOL)_rateUpdateDuringTransitionDecided
{
  return self->_player->rateUpdateDuringTransitionDecided;
}

- (void)_willEnterForeground:(id)a3
{
  NSObject *stateDispatchQueue;
  void (*v5[5])(_QWORD);

  -[AVApplicationStateMonitor setHostApplicationInForeground:](self->_player->applicationStateMonitor, "setHostApplicationInForeground:", 1);
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v5[1] = (void (*)(_QWORD))3221225472;
  v5[2] = (void (*)(_QWORD))__59__AVPlayer_AVPlayerMultitaskSupport___willEnterForeground___block_invoke;
  v5[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v5[4] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v5);
}

uint64_t __59__AVPlayer_AVPlayerMultitaskSupport___willEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 544), "isHostApplicationInForeground");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_ensureVideoLayersAreAttached");
  return result;
}

- (void)_setWantsVolumeChangesWhenPausedOrInactive:(BOOL)a3
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  v4 = *v3;
  v5 = *MEMORY[0x1E0CC5BB0];
  if (self->_player->figPlayer)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, v5, v4);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v3, *MEMORY[0x1E0CC5BB0]);
  }
}

- (void)_setEQPreset:(int)a3
{
  CFNumberRef v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, uint64_t, CFNumberRef);
  int valuePtr;

  valuePtr = a3;
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  v5 = *MEMORY[0x1E0CC59F0];
  if (!self->_player->figPlayer)
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v4, *MEMORY[0x1E0CC59F0]);
    if (!v4)
      return;
    goto LABEL_5;
  }
  FigBaseObject = FigPlayerGetFigBaseObject();
  v7 = *(void (**)(uint64_t, uint64_t, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    v7(FigBaseObject, v5, v4);
  if (v4)
LABEL_5:
    CFRelease(v4);
}

- (void)_setStoppingFadeOutDuration:(float)a3
{
  CFNumberRef v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, uint64_t, CFNumberRef);
  float valuePtr;

  valuePtr = a3;
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
  v5 = *MEMORY[0x1E0CC5B48];
  if (self->_player->figPlayer)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(void (**)(uint64_t, uint64_t, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, v5, v4);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v4, *MEMORY[0x1E0CC5B48]);
  }
  CFRelease(v4);
}

- (id)_clientName
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayer_AVPlayerSupportForMediaPlayer___clientName__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayer_AVPlayerSupportForMediaPlayer___clientName__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 432);
  return result;
}

- (void)_setClientName:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD v10[7];
  _QWORD v11[3];
  int v12;
  _QWORD block[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AVPlayer_AVPlayerSupportForMediaPlayer___setClientName___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __58__AVPlayer_AVPlayerSupportForMediaPlayer___setClientName___block_invoke_2;
    v10[3] = &unk_1E3031868;
    v10[4] = self;
    v10[5] = v11;
    v10[6] = v8;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v8);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", a3, *MEMORY[0x1E0CC5960]);
  }
}

uint64_t __58__AVPlayer_AVPlayerSupportForMediaPlayer___setClientName___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 432) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __58__AVPlayer_AVPlayerSupportForMediaPlayer___setClientName___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_clientName");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5960], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_clientPriority
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayer_AVPlayerSupportForMediaPlayer___clientPriority__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVPlayer_AVPlayerSupportForMediaPlayer___clientPriority__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 456);
  return result;
}

- (void)_setClientPriority:(int64_t)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  uint64_t v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AVPlayer_AVPlayerSupportForMediaPlayer___setClientPriority___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __62__AVPlayer_AVPlayerSupportForMediaPlayer___setClientPriority___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v10, *MEMORY[0x1E0CC5968]);
  }
}

uint64_t __62__AVPlayer_AVPlayerSupportForMediaPlayer___setClientPriority___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 456) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __62__AVPlayer_AVPlayerSupportForMediaPlayer___setClientPriority___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_clientPriority"));
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5968], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setCALayerDestinationIsTVOut:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AVPlayer_AVPlayerSupportForMediaPlayer___setCALayerDestinationIsTVOut___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __73__AVPlayer_AVPlayerSupportForMediaPlayer___setCALayerDestinationIsTVOut___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5B98]);
  }
}

uint64_t __73__AVPlayer_AVPlayerSupportForMediaPlayer___setCALayerDestinationIsTVOut___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 403) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __73__AVPlayer_AVPlayerSupportForMediaPlayer___setCALayerDestinationIsTVOut___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_CALayerDestinationIsTVOut");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5B98], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_CALayerDestinationIsTVOut
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayer_AVPlayerSupportForMediaPlayer___CALayerDestinationIsTVOut__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __69__AVPlayer_AVPlayerSupportForMediaPlayer___CALayerDestinationIsTVOut__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 403);
  return result;
}

uint64_t __74__AVPlayer_AVPlayerSupportForMediaPlayer___updateConnectionToSecondScreen__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 469) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  -[AVPlayer _setCALayerDestinationIsTVOut:](self, "_setCALayerDestinationIsTVOut:", !a3);
}

- (BOOL)_preventsSleepDuringVideoPlayback
{
  return !-[AVPlayer _CALayerDestinationIsTVOut](self, "_CALayerDestinationIsTVOut");
}

- (void)_setDisallowsVideoLayerDisplayCompositing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__AVPlayer_AVPlayerSupportForMediaPlayer___setDisallowsVideoLayerDisplayCompositing___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __85__AVPlayer_AVPlayerSupportForMediaPlayer___setDisallowsVideoLayerDisplayCompositing___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC59C0]);
  }
}

uint64_t __85__AVPlayer_AVPlayerSupportForMediaPlayer___setDisallowsVideoLayerDisplayCompositing___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 406) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __85__AVPlayer_AVPlayerSupportForMediaPlayer___setDisallowsVideoLayerDisplayCompositing___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_disallowsVideoLayerDisplayCompositing");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC59C0], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_disallowsVideoLayerDisplayCompositing
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__AVPlayer_AVPlayerSupportForMediaPlayer___disallowsVideoLayerDisplayCompositing__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __81__AVPlayer_AVPlayerSupportForMediaPlayer___disallowsVideoLayerDisplayCompositing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 406);
  return result;
}

- (void)_setPreferredLanguageList:(id)a3
{
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, uint64_t, id);

  v4 = *MEMORY[0x1E0CC5AD8];
  if (self->_player->figPlayer)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v6 = *(void (**)(uint64_t, uint64_t, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v6(FigBaseObject, v4, a3);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", a3, *MEMORY[0x1E0CC5AD8]);
  }
}

- (BOOL)_resumePlayback:(double)a3 error:(id *)a4
{
  OpaqueFigPlayer *v6;
  OpaqueFigPlayer *v7;
  CFDictionaryRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(OpaqueFigPlayer *, CMTime *, __n128);
  __n128 v13;
  OpaqueFigPlayer *v14;
  CMTime *v15;
  BOOL v16;
  int v17;
  uint64_t (*v18)(OpaqueFigPlayer *, float);
  CMTime v20;
  CMTime v21;
  CMTime v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v6 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v6)
  {
    v7 = v6;
    if (*(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104))
    {
      v23[0] = *MEMORY[0x1E0CC5BD0];
      CMTimeMakeWithSeconds(&v21, a3, 1000);
      v8 = NSDictionaryFromCMTime(&v21);
      v9 = *MEMORY[0x1E0CC5BF0];
      v24[0] = v8;
      v24[1] = &unk_1E30935F8;
      v10 = *MEMORY[0x1E0CC5BD8];
      v23[1] = v9;
      v23[2] = v10;
      v24[2] = *MEMORY[0x1E0C9AE50];
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v12 = *(uint64_t (**)(OpaqueFigPlayer *, CMTime *, __n128))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 104);
      if (v12)
      {
        v13.n128_u32[0] = 1.0;
        v14 = v7;
        v15 = (CMTime *)v11;
        goto LABEL_9;
      }
    }
    else if (*(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56))
    {
      CMTimeMakeWithSeconds(&v20, a3, 1000);
      v12 = *(uint64_t (**)(OpaqueFigPlayer *, CMTime *, __n128))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 56);
      if (v12)
      {
        v13 = *(__n128 *)&v20.value;
        v22 = v20;
        v13.n128_u32[0] = 1.0;
        v15 = &v22;
        v14 = v7;
LABEL_9:
        v17 = v12(v14, v15, v13);
        if (v17)
          goto LABEL_10;
        goto LABEL_14;
      }
    }
    else
    {
      v18 = *(uint64_t (**)(OpaqueFigPlayer *, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v18)
      {
        v17 = v18(v7, 1.0);
        if (v17)
        {
LABEL_10:
          if (a4)
          {
LABEL_11:
            v16 = 0;
            *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v17, 0);
LABEL_17:
            CFRelease(v7);
            return v16;
          }
LABEL_16:
          v16 = 0;
          goto LABEL_17;
        }
LABEL_14:
        v16 = 1;
        goto LABEL_17;
      }
    }
    v17 = -12782;
    if (a4)
      goto LABEL_11;
    goto LABEL_16;
  }
  return 0;
}

- (BOOL)allowsPixelBufferPoolSharing
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayer_AVPlayerPixelBufferPoolSharing__allowsPixelBufferPoolSharing__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__AVPlayer_AVPlayerPixelBufferPoolSharing__allowsPixelBufferPoolSharing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 400);
  return result;
}

- (void)setAllowsPixelBufferPoolSharing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVPlayer_AVPlayerPixelBufferPoolSharing__setAllowsPixelBufferPoolSharing___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __76__AVPlayer_AVPlayerPixelBufferPoolSharing__setAllowsPixelBufferPoolSharing___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC58F0]);
  }
}

uint64_t __76__AVPlayer_AVPlayerPixelBufferPoolSharing__setAllowsPixelBufferPoolSharing___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 400) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __76__AVPlayer_AVPlayerPixelBufferPoolSharing__setAllowsPixelBufferPoolSharing___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "allowsPixelBufferPoolSharing");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC58F0], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)disallowsAMRAudio
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AVPlayer_AVPlayerFormatRestrictions__disallowsAMRAudio__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__AVPlayer_AVPlayerFormatRestrictions__disallowsAMRAudio__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 401);
  return result;
}

- (void)setDisallowsAMRAudio:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AVPlayer_AVPlayerFormatRestrictions__setDisallowsAMRAudio___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __61__AVPlayer_AVPlayerFormatRestrictions__setDisallowsAMRAudio___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5B10]);
  }
}

uint64_t __61__AVPlayer_AVPlayerFormatRestrictions__setDisallowsAMRAudio___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 401) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __61__AVPlayer_AVPlayerFormatRestrictions__setDisallowsAMRAudio___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "disallowsAMRAudio");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5B10], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)disallowsHardwareAcceleratedVideoDecoder
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__AVPlayer_AVPlayerFormatRestrictions__disallowsHardwareAcceleratedVideoDecoder__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __80__AVPlayer_AVPlayerFormatRestrictions__disallowsHardwareAcceleratedVideoDecoder__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 402);
  return result;
}

- (void)setDisallowsHardwareAcceleratedVideoDecoder:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__AVPlayer_AVPlayerFormatRestrictions__setDisallowsHardwareAcceleratedVideoDecoder___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __84__AVPlayer_AVPlayerFormatRestrictions__setDisallowsHardwareAcceleratedVideoDecoder___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC59F8]);
  }
}

uint64_t __84__AVPlayer_AVPlayerFormatRestrictions__setDisallowsHardwareAcceleratedVideoDecoder___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 402) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __84__AVPlayer_AVPlayerFormatRestrictions__setDisallowsHardwareAcceleratedVideoDecoder___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "disallowsHardwareAcceleratedVideoDecoder");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE40];
    else
      v5 = *MEMORY[0x1E0C9AE50];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC59F8], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __91__AVPlayer_AVPlayerAutomaticMediaSelection__setAppliesMediaSelectionCriteriaAutomatically___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "appliesMediaSelectionCriteriaAutomatically"));
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5910], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)appliesMediaSelectionCriteriaAutomatically
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
  v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__AVPlayer_AVPlayerAutomaticMediaSelection__appliesMediaSelectionCriteriaAutomatically__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __87__AVPlayer_AVPlayerAutomaticMediaSelection__appliesMediaSelectionCriteriaAutomatically__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 397);
  return result;
}

- (AVPlayerMediaSelectionCriteria)mediaSelectionCriteriaForMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  OpaqueFigPlayer *v5;
  id v6;
  uint64_t FigBaseObject;
  void (*v8)(uint64_t, _QWORD, _QWORD, void **);
  void *v9;
  AVPlayerMediaSelectionCriteria *v10;
  void *v12;

  v5 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v6 = -[AVPlayer _cachedMediaSelectionCriteria](self, "_cachedMediaSelectionCriteria");
  if (v5)
  {
    v12 = 0;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v8 = *(void (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v8)
    {
      v8(FigBaseObject, *MEMORY[0x1E0CC5A68], *MEMORY[0x1E0C9AE00], &v12);
      v9 = v12;
    }
    else
    {
      v9 = 0;
    }
    v6 = v9;
  }
  if (!v6)
  {
    v10 = 0;
    if (!v5)
      return v10;
    goto LABEL_10;
  }
  v10 = (AVPlayerMediaSelectionCriteria *)objc_msgSend(v6, "objectForKey:", AVTranslateAVMediaCharacteristicToFigMediaCharacteristic((uint64_t)mediaCharacteristic));
  if (v10)
    v10 = -[AVPlayerMediaSelectionCriteria initWithFigDictionary:]([AVPlayerMediaSelectionCriteria alloc], "initWithFigDictionary:", v10);
  if (v5)
LABEL_10:
    CFRelease(v5);
  return v10;
}

- (id)defaultMediaSelectionCriteriaForMediaCharacteristic:(id)a3
{
  OpaqueFigPlayer *v4;
  OpaqueFigPlayer *v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD, id *);
  id v8;
  id v9;
  id v11;

  v4 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v5 = v4;
  if (!a3)
  {
    if (!v4)
      return a3;
    goto LABEL_13;
  }
  v11 = 0;
  if (v4)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v7)
    {
      v7(FigBaseObject, *MEMORY[0x1E0CC59A0], *MEMORY[0x1E0C9AE00], &v11);
      v8 = v11;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;
    if (v11)
    {
      a3 = (id)objc_msgSend(v11, "objectForKey:", AVTranslateAVMediaCharacteristicToFigMediaCharacteristic((uint64_t)a3));
      if (a3)
        a3 = -[AVPlayerMediaSelectionCriteria initWithFigDictionary:]([AVPlayerMediaSelectionCriteria alloc], "initWithFigDictionary:", a3);
    }
    else
    {
      a3 = 0;
    }
LABEL_13:
    CFRelease(v5);
    return a3;
  }
  return 0;
}

- (NSString)audioOutputDeviceUniqueID
{
  NSObject *ivarAccessQueue;
  NSString *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AVPlayer_AVPlayerAudioDeviceSupport__audioOutputDeviceUniqueID__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__AVPlayer_AVPlayerAudioDeviceSupport__audioOutputDeviceUniqueID__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 424);
  return result;
}

- (void)setAudioOutputDeviceUniqueID:(NSString *)audioOutputDeviceUniqueID
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD v10[7];
  _QWORD v11[3];
  int v12;
  _QWORD block[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AVPlayer_AVPlayerAudioDeviceSupport__setAudioOutputDeviceUniqueID___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = audioOutputDeviceUniqueID;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __69__AVPlayer_AVPlayerAudioDeviceSupport__setAudioOutputDeviceUniqueID___block_invoke_2;
    v10[3] = &unk_1E3031868;
    v10[4] = self;
    v10[5] = v11;
    v10[6] = v8;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v8);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", audioOutputDeviceUniqueID, *MEMORY[0x1E0CC5928]);
  }
}

uint64_t __69__AVPlayer_AVPlayerAudioDeviceSupport__setAudioOutputDeviceUniqueID___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 424) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __69__AVPlayer_AVPlayerAudioDeviceSupport__setAudioOutputDeviceUniqueID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "audioOutputDeviceUniqueID");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5928], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)autoSwitchStreamVariants
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__AVPlayer_AVPlayerAudioDeviceSupport__autoSwitchStreamVariants__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__AVPlayer_AVPlayerAudioDeviceSupport__autoSwitchStreamVariants__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 392);
  return result;
}

- (void)setAutoSwitchStreamVariants:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AVPlayer_AVPlayerAudioDeviceSupport__setAutoSwitchStreamVariants___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __68__AVPlayer_AVPlayerAudioDeviceSupport__setAutoSwitchStreamVariants___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5938]);
  }
}

uint64_t __68__AVPlayer_AVPlayerAudioDeviceSupport__setAutoSwitchStreamVariants___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 392) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __68__AVPlayer_AVPlayerAudioDeviceSupport__setAutoSwitchStreamVariants___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "autoSwitchStreamVariants");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5938], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfAutoSwitchStreamVariants
{
  return 0;
}

- (BOOL)preparesItemsForPlaybackAsynchronously
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__AVPlayer_AVPlayerAudioDeviceSupport__preparesItemsForPlaybackAsynchronously__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __78__AVPlayer_AVPlayerAudioDeviceSupport__preparesItemsForPlaybackAsynchronously__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 393);
  return result;
}

- (void)setPreparesItemsForPlaybackAsynchronously:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__AVPlayer_AVPlayerAudioDeviceSupport__setPreparesItemsForPlaybackAsynchronously___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __82__AVPlayer_AVPlayerAudioDeviceSupport__setPreparesItemsForPlaybackAsynchronously___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v10, *MEMORY[0x1E0CC5AF0]);
  }
}

uint64_t __82__AVPlayer_AVPlayerAudioDeviceSupport__setPreparesItemsForPlaybackAsynchronously___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 393) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __82__AVPlayer_AVPlayerAudioDeviceSupport__setPreparesItemsForPlaybackAsynchronously___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "preparesItemsForPlaybackAsynchronously");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5AF0], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)allowsOutOfBandTextTrackRendering
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__AVPlayer_AVPlayerOutOfBandTextTrackRendering__allowsOutOfBandTextTrackRendering__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __82__AVPlayer_AVPlayerOutOfBandTextTrackRendering__allowsOutOfBandTextTrackRendering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 394);
  return result;
}

uint64_t __86__AVPlayer_AVPlayerOutOfBandTextTrackRendering__setAllowsOutOfBandTextTrackRendering___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "allowsOutOfBandTextTrackRendering");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC58E8], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __76__AVPlayer_AVPlayerMultichannelAudioStrategy__setMultichannelAudioStrategy___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "multichannelAudioStrategy");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5A78], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)multichannelAudioStrategy
{
  NSObject *ivarAccessQueue;
  NSString *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayer_AVPlayerMultichannelAudioStrategy__multichannelAudioStrategy__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __72__AVPlayer_AVPlayerMultichannelAudioStrategy__multichannelAudioStrategy__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 448);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setCaptionPipelineStrategy:(id)a3
{
  NSObject *ivarAccessQueue;
  id v6;
  OpaqueFigPlayer *v7;
  uint64_t v8;
  OpaqueFigPlayer *v9;
  uint64_t FigBaseObject;
  void (*v11)(uint64_t, uint64_t, id);
  _QWORD v12[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__AVPlayer_AVPlayerCaptionStrategySelection__setCaptionPipelineStrategy___block_invoke;
  v12[3] = &unk_1E302FCE8;
  v12[4] = self;
  v12[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v12);
  v6 = (id)objc_msgSend(a3, "copy");
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v8 = *MEMORY[0x1E0CC5950];
  if (v7)
  {
    v9 = v7;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v11 = *(void (**)(uint64_t, uint64_t, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(FigBaseObject, v8, v6);
    CFRelease(v9);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v6, *MEMORY[0x1E0CC5950]);
  }
}

id __73__AVPlayer_AVPlayerCaptionStrategySelection__setCaptionPipelineStrategy___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 416) = result;
  return result;
}

- (NSString)captionPipelineStrategy
{
  NSObject *ivarAccessQueue;
  NSString *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayer_AVPlayerCaptionStrategySelection__captionPipelineStrategy__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __69__AVPlayer_AVPlayerCaptionStrategySelection__captionPipelineStrategy__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 416);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setCaptionRenderingStrategy:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  unsigned int (*v7)(uint64_t, uint64_t, id);

  v4 = (id)objc_msgSend(a3, "copy");
  v5 = *MEMORY[0x1E0CC5958];
  if (!self->_player->figPlayer)
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v4, *MEMORY[0x1E0CC5958]);
LABEL_6:
    self->_player->captionRenderingStrategy = (NSString *)v4;
    return;
  }
  FigBaseObject = FigPlayerGetFigBaseObject();
  v7 = *(unsigned int (**)(uint64_t, uint64_t, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7 && !v7(FigBaseObject, v5, v4))
    goto LABEL_6;
}

- (NSString)captionRenderingStrategy
{
  return self->_player->captionRenderingStrategy;
}

- (void)_setPreservesAudioSessionSampleRate:(BOOL)a3
{
  AVPlayerInternal *player;
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  player = self->_player;
  if (!player->needsToCreateFigPlayer)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set preservesAudioSessionSampleRate after the AVPlayer has begun preparing for playback."), 0));
  ivarAccessQueue = player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__AVPlayer_AVPlayerAudioSessionParticipant___setPreservesAudioSessionSampleRate___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
}

uint64_t __81__AVPlayer_AVPlayerAudioSessionParticipant___setPreservesAudioSessionSampleRate___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 552) = *(_BYTE *)(result + 40);
  return result;
}

- (uint64_t)preferredVideoDecoderGPURegistryID
{
  NSObject *ivarAccessQueue;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__AVPlayer_AVPlayerVideoDecoderGPUSupport__preferredVideoDecoderGPURegistryID__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __78__AVPlayer_AVPlayerVideoDecoderGPUSupport__preferredVideoDecoderGPURegistryID__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 528);
  return result;
}

- (void)setPreferredVideoDecoderGPURegistryID:(uint64_t)preferredVideoDecoderGPURegistryID
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  OpaqueFigPlayer *v6;
  const void *SInt64;
  NSObject *figConfigurationQueue;
  _QWORD v9[7];
  _QWORD v10[3];
  int v11;
  _QWORD block[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__AVPlayer_AVPlayerVideoDecoderGPUSupport__setPreferredVideoDecoderGPURegistryID___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  block[5] = preferredVideoDecoderGPURegistryID;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v6 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v6)
  {
    SInt64 = v6;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __82__AVPlayer_AVPlayerVideoDecoderGPUSupport__setPreferredVideoDecoderGPURegistryID___block_invoke_2;
    v9[3] = &unk_1E3031868;
    v9[4] = self;
    v9[5] = v10;
    v9[6] = SInt64;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
  }
  else
  {
    SInt64 = (const void *)FigCFNumberCreateSInt64();
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", SInt64, *MEMORY[0x1E0CC5AE8]);
    if (!SInt64)
      return;
  }
  CFRelease(SInt64);
}

uint64_t __82__AVPlayer_AVPlayerVideoDecoderGPUSupport__setPreferredVideoDecoderGPURegistryID___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 528) = *(_QWORD *)(result + 40);
  return result;
}

void __82__AVPlayer_AVPlayerVideoDecoderGPUSupport__setPreferredVideoDecoderGPURegistryID___block_invoke_2(uint64_t a1)
{
  const void *SInt64;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, const void *);
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "preferredVideoDecoderGPURegistryID");
  SInt64 = (const void *)FigCFNumberCreateSInt64();
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v5 = v4(FigBaseObject, *MEMORY[0x1E0CC5AE8], SInt64);
  else
    v5 = -12782;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  if (SInt64)
    CFRelease(SInt64);
}

- (AVLoggingIdentifier)loggingIdentifier
{
  NSObject *ivarAccessQueue;
  AVLoggingIdentifier *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayer_AVPlayerLoggingIdentifier__loggingIdentifier__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (AVLoggingIdentifier *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __56__AVPlayer_AVPlayerLoggingIdentifier__loggingIdentifier__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 624);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setLoggingIdentifier:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__AVPlayer_AVPlayerLoggingIdentifier__setLoggingIdentifier___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

_QWORD *__60__AVPlayer_AVPlayerLoggingIdentifier__setLoggingIdentifier___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(*(_QWORD *)(result[4] + 8) + 624);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(*(_QWORD *)(v2[4] + 8) + 624) = result;
  }
  return result;
}

- (void)_setDisallowsAutoPauseOnRouteRemovalIfNoAudio:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  OpaqueFigPlayer *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  OpaqueFigPlayer *v10;
  uint64_t FigBaseObject;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  _QWORD v13[5];
  BOOL v14;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__AVPlayer_AVPlayerAutoPauseOnRouteRemoval___setDisallowsAutoPauseOnRouteRemovalIfNoAudio___block_invoke;
  v13[3] = &unk_1E302FD38;
  v13[4] = self;
  v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v13);
  v6 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v7 = (uint64_t *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v8 = *v7;
  v9 = *MEMORY[0x1E0CC59B8];
  if (v6)
  {
    v10 = v6;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v12)
      v12(FigBaseObject, v9, v8);
    CFRelease(v10);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v8, *MEMORY[0x1E0CC59B8]);
  }
}

uint64_t __91__AVPlayer_AVPlayerAutoPauseOnRouteRemoval___setDisallowsAutoPauseOnRouteRemovalIfNoAudio___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 536) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)_disallowsAutoPauseOnRouteRemovalIfNoAudio
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__AVPlayer_AVPlayerAutoPauseOnRouteRemoval___disallowsAutoPauseOnRouteRemovalIfNoAudio__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __87__AVPlayer_AVPlayerAutoPauseOnRouteRemoval___disallowsAutoPauseOnRouteRemovalIfNoAudio__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 536);
  return result;
}

- (void)_setEnsuresActiveAudioSessionWhenStartingPlayback:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  _QWORD *v7;
  OpaqueFigPlayer *v8;
  OpaqueFigPlayer *v9;
  NSObject *figConfigurationQueue;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__AVPlayer_AVPlayerImplicitInterruption___setEnsuresActiveAudioSessionWhenStartingPlayback___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (_QWORD *)MEMORY[0x1E0C9AE40];
  -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", *v7, *MEMORY[0x1E0CC5A00]);
  v8 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v8)
  {
    v9 = v8;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __92__AVPlayer_AVPlayerImplicitInterruption___setEnsuresActiveAudioSessionWhenStartingPlayback___block_invoke_2;
    v11[3] = &unk_1E3031868;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v9;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v9);
  }
}

uint64_t __92__AVPlayer_AVPlayerImplicitInterruption___setEnsuresActiveAudioSessionWhenStartingPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 537) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __92__AVPlayer_AVPlayerImplicitInterruption___setEnsuresActiveAudioSessionWhenStartingPlayback___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_ensuresActiveAudioSessionWhenStartingPlayback");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5A00], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_ensuresActiveAudioSessionWhenStartingPlayback
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__AVPlayer_AVPlayerImplicitInterruption___ensuresActiveAudioSessionWhenStartingPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __88__AVPlayer_AVPlayerImplicitInterruption___ensuresActiveAudioSessionWhenStartingPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 537);
  return result;
}

- (NSString)_STSLabel
{
  NSObject *ivarAccessQueue;
  NSString *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayer_AVPlayerSTSLabel___STSLabel__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __39__AVPlayer_AVPlayerSTSLabel___STSLabel__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 440);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setSTSLabel:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  OpaqueFigPlayer *v8;
  NSObject *figConfigurationQueue;
  _QWORD v10[7];
  _QWORD v11[3];
  int v12;
  _QWORD block[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVPlayer_AVPlayerSTSLabel___setSTSLabel___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v7)
  {
    v8 = v7;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __43__AVPlayer_AVPlayerSTSLabel___setSTSLabel___block_invoke_2;
    v10[3] = &unk_1E3031868;
    v10[4] = self;
    v10[5] = v11;
    v10[6] = v8;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v8);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", a3, *MEMORY[0x1E0CC5B28]);
  }
}

id __43__AVPlayer_AVPlayerSTSLabel___setSTSLabel___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 440) = result;
  return result;
}

uint64_t __43__AVPlayer_AVPlayerSTSLabel___setSTSLabel___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_STSLabel");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5B28], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)prefersPlayingSilentlyWhenConflictingWithOtherPlayback
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__AVPlayer_AVPlayerPIPSupport__prefersPlayingSilentlyWhenConflictingWithOtherPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __86__AVPlayer_AVPlayerPIPSupport__prefersPlayingSilentlyWhenConflictingWithOtherPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 554);
  return result;
}

- (void)setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  void *v8;
  OpaqueFigPlayer *v9;
  NSObject *figConfigurationQueue;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__AVPlayer_AVPlayerPIPSupport__setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v3)
    v8 = &unk_1E3093610;
  else
    v8 = &unk_1E30935B0;
  if (v7)
  {
    v9 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __90__AVPlayer_AVPlayerPIPSupport__setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback___block_invoke_930;
    v11[3] = &unk_1E3031988;
    v11[5] = v12;
    v11[6] = v9;
    v11[4] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v9);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v8, *MEMORY[0x1E0CC59A8]);
  }
}

uint64_t __90__AVPlayer_AVPlayerPIPSupport__setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 554) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __90__AVPlayer_AVPlayerPIPSupport__setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback___block_invoke_930(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC59A8], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isSilencedDueToConflictWithOtherPlayback
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayer_AVPlayerPIPSupport__isSilencedDueToConflictWithOtherPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__AVPlayer_AVPlayerPIPSupport__isSilencedDueToConflictWithOtherPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 557);
  return result;
}

- (BOOL)_silencesOtherPlaybackDuringPIP
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVPlayer_AVPlayerPIPSupport___silencesOtherPlaybackDuringPIP__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVPlayer_AVPlayerPIPSupport___silencesOtherPlaybackDuringPIP__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 553);
  return result;
}

- (void)_setSilencesOtherPlaybackDuringPIP:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlayer *v7;
  void *v8;
  OpaqueFigPlayer *v9;
  NSObject *figConfigurationQueue;
  _QWORD v11[7];
  _QWORD v12[3];
  int v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVPlayer_AVPlayerPIPSupport___setSilencesOtherPlaybackDuringPIP___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v3)
    v8 = &unk_1E3093628;
  else
    v8 = &unk_1E3093610;
  if (v7)
  {
    v9 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __67__AVPlayer_AVPlayerPIPSupport___setSilencesOtherPlaybackDuringPIP___block_invoke_932;
    v11[3] = &unk_1E3031988;
    v11[5] = v12;
    v11[6] = v9;
    v11[4] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v9);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", v8, *MEMORY[0x1E0CC5A98]);
  }
}

uint64_t __67__AVPlayer_AVPlayerPIPSupport___setSilencesOtherPlaybackDuringPIP___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 553) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __67__AVPlayer_AVPlayerPIPSupport___setSilencesOtherPlaybackDuringPIP___block_invoke_932(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5A98], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSNumber)mxSessionID
{
  NSObject *ivarAccessQueue;
  NSNumber *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayer_AVPlayerPIPSupport__mxSessionID__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__AVPlayer_AVPlayerPIPSupport__mxSessionID__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 560);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setBackgroundPIPAuthorizationToken:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVPlayer_AVPlayerPIPSupport__setBackgroundPIPAuthorizationToken___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v6;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v7 + 24))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVPlayerBackgroundPIPAuthorizationTokenDidChangeNotification"), self, 0);
  _Block_object_dispose(&v6, 8);
}

uint64_t __67__AVPlayer_AVPlayerPIPSupport__setBackgroundPIPAuthorizationToken___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 608), "isEqualToString:", *(_QWORD *)(a1 + 40)) ^ 1;
  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 608) = result;
  return result;
}

- (void)setActiveVideoTargetsForInterstitials:(unsigned __int8)a3
{
  int v3;
  AVPlayer *v5;
  void *v6;
  BOOL v7;
  AVPlayer *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated");
  v6 = 0;
  v7 = v3 == 0;
  if (v3)
    v8 = v5;
  else
    v8 = self;
  v9 = 0;
  if (!v7)
    v5 = self;
  if (v5 && v8)
  {
    v6 = (void *)-[NSArray copy](-[AVPlayer videoTargets](v5, "videoTargets"), "copy");
    v9 = (void *)-[NSArray copy](-[AVPlayer videoTargets](v8, "videoTargets"), "copy");
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
        v15 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
        if (v15)
          v15(v14, 0);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v11);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v9);
        v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19);
        v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
        if (v21)
          v21(v20, 1);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

}

- (OpaqueFigVideoTarget)_interstitialVideoTargetForPrimaryVideoTarget:(OpaqueFigVideoTarget *)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  OpaqueFigVideoTarget *v9;
  _QWORD v11[7];
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__AVPlayer_FigVideoTargetSupport___interstitialVideoTargetForPrimaryVideoTarget___block_invoke;
  block[3] = &unk_1E3031988;
  block[4] = self;
  block[5] = &v13;
  block[6] = a3;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v7 = (void *)v14[3];
  if (!v7)
  {
    FigVideoTargetCreateSharingVideoReceiverFromVideoTarget();
    if (v14[3])
    {
      v8 = self->_player->ivarAccessQueue;
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __81__AVPlayer_FigVideoTargetSupport___interstitialVideoTargetForPrimaryVideoTarget___block_invoke_2;
      v11[3] = &unk_1E3031868;
      v11[4] = self;
      v11[5] = &v13;
      v11[6] = a3;
      av_readwrite_dispatch_queue_write(v8, v11);
      v7 = (void *)v14[3];
    }
    else
    {
      v7 = 0;
    }
  }
  v9 = v7;
  _Block_object_dispose(&v13, 8);
  return v9;
}

const void *__81__AVPlayer_FigVideoTargetSupport___interstitialVideoTargetForPrimaryVideoTarget___block_invoke(uint64_t a1)
{
  const void *result;

  result = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 576), *(const void **)(a1 + 48));
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __81__AVPlayer_FigVideoTargetSupport___interstitialVideoTargetForPrimaryVideoTarget___block_invoke_2(uint64_t a1)
{
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 576), *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)_updateVideoTargetOnFigPlayer:(id)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  OpaqueFigPlayer *v7;
  uint64_t v8;
  OpaqueFigPlayer *v9;
  uint64_t FigBaseObject;
  void (*v11)(uint64_t, uint64_t, id);
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef cf;

  v4 = a4;
  v7 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  v8 = *MEMORY[0x1E0CC5BA0];
  if (v7)
  {
    v9 = v7;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v11 = *(void (**)(uint64_t, uint64_t, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(FigBaseObject, v8, a3);
    if (v4)
    {
      cf = 0;
      v12 = FigPlayerGetFigBaseObject();
      v13 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
      if (v13)
      {
        v13(v12, *MEMORY[0x1E0CC5B58], *MEMORY[0x1E0C9AE00], &cf);
        if (cf)
          CFRelease(cf);
      }
    }
    CFRelease(v9);
  }
  else
  {
    -[AVPlayer _setPendingFigPlayerProperty:forKey:](self, "_setPendingFigPlayerProperty:forKey:", a3, *MEMORY[0x1E0CC5BA0]);
  }
}

- (void)addVideoTarget:(OpaqueFigVideoTarget *)a3
{
  NSObject *ivarAccessQueue;
  id v6;
  OpaqueFigVideoTarget *v7;
  void (*v8)(OpaqueFigVideoTarget *, _QWORD);
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVPlayer_FigVideoTargetSupport__addVideoTarget___block_invoke;
  block[3] = &unk_1E3031988;
  block[4] = self;
  block[5] = &v10;
  block[6] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (!*((_BYTE *)v11 + 24))
    -[AVPlayer _updateVideoTargetOnFigPlayer:synchronously:](self, "_updateVideoTargetOnFigPlayer:synchronously:", -[AVPlayer videoTargets](self, "videoTargets"), 0);
  v6 = -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated");
  if (v6)
  {
    v7 = -[AVPlayer _interstitialVideoTargetForPrimaryVideoTarget:](self, "_interstitialVideoTargetForPrimaryVideoTarget:", a3);
    if (v7)
    {
      v8 = *(void (**)(OpaqueFigVideoTarget *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
      if (v8)
        v8(v7, 0);
      objc_msgSend(v6, "addVideoTarget:", v7);
      if (-[NSString isEqualToString:](-[AVPlayer reasonForWaitingToPlay](self, "reasonForWaitingToPlay"), "isEqualToString:", CFSTR("AVPlayerWaitingDuringInterstitialEventReason")))
      {
        -[AVPlayer setActiveVideoTargetsForInterstitials:](self, "setActiveVideoTargetsForInterstitials:", 1);
      }
    }
  }
  _Block_object_dispose(&v10, 8);
}

void __50__AVPlayer_FigVideoTargetSupport__addVideoTarget___block_invoke(_QWORD *a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 568), "containsObject:", a1[6]);
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 568), "arrayByAddingObject:", a1[6]);

    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 568) = v2;
  }
}

- (void)removeVideoTarget:(OpaqueFigVideoTarget *)a3
{
  -[AVPlayer removeVideoTarget:synchronously:](self, "removeVideoTarget:synchronously:", a3, 0);
}

- (void)setShouldWaitForVideoTarget:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  NSObject *figConfigurationQueue;
  _QWORD v7[5];
  _QWORD block[5];
  BOOL v9;

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVPlayer_FigVideoTargetSupport__setShouldWaitForVideoTarget___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v9 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  figConfigurationQueue = self->_player->figConfigurationQueue;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __63__AVPlayer_FigVideoTargetSupport__setShouldWaitForVideoTarget___block_invoke_2;
  v7[3] = &unk_1E302FA10;
  v7[4] = self;
  dispatch_sync(figConfigurationQueue, v7);
}

uint64_t __63__AVPlayer_FigVideoTargetSupport__setShouldWaitForVideoTarget___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 584) = *(_BYTE *)(result + 40);
  return result;
}

void __63__AVPlayer_FigVideoTargetSupport__setShouldWaitForVideoTarget___block_invoke_2(uint64_t a1)
{
  const void *v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, uint64_t);

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFigPlayer");
  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldWaitForVideoTarget");
  v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  if (v2)
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, *MEMORY[0x1E0CC5B38], v5);
    CFRelease(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", *v4, *MEMORY[0x1E0CC5B38]);
  }
}

- (void)removeVideoTarget:(OpaqueFigVideoTarget *)a3 synchronously:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *ivarAccessQueue;
  uint64_t v8;
  id v9;
  OpaqueFigVideoTarget *v10;
  NSObject *v11;
  _QWORD v12[6];
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVPlayer_FigVideoTargetSupport_Internal__removeVideoTarget_synchronously___block_invoke;
  block[3] = &unk_1E3031988;
  block[4] = self;
  block[5] = &v14;
  block[6] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v15 + 24))
    -[AVPlayer _updateVideoTargetOnFigPlayer:synchronously:](self, "_updateVideoTargetOnFigPlayer:synchronously:", -[AVPlayer videoTargets](self, "videoTargets"), v4);
  v9 = -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated");
  if (v9)
  {
    v10 = -[AVPlayer _interstitialVideoTargetForPrimaryVideoTarget:](self, "_interstitialVideoTargetForPrimaryVideoTarget:", a3);
    if (v10)
    {
      objc_msgSend(v9, "removeVideoTarget:", v10);
      v11 = self->_player->ivarAccessQueue;
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __76__AVPlayer_FigVideoTargetSupport_Internal__removeVideoTarget_synchronously___block_invoke_2;
      v12[3] = &unk_1E302FE78;
      v12[4] = self;
      v12[5] = a3;
      av_readwrite_dispatch_queue_write(v11, v12);
    }
  }
  _Block_object_dispose(&v14, 8);
}

void __76__AVPlayer_FigVideoTargetSupport_Internal__removeVideoTarget_synchronously___block_invoke(_QWORD *a1)
{
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 568), "containsObject:", a1[6]);
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 568), "mutableCopy");
    objc_msgSend(v2, "removeObject:", a1[6]);

    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 568) = v2;
  }
}

void __76__AVPlayer_FigVideoTargetSupport_Internal__removeVideoTarget_synchronously___block_invoke_2(uint64_t a1)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 576), *(const void **)(a1 + 40));
}

- (NSArray)taggedBufferOutputs
{
  NSArray *v3;
  NSObject *ivarAccessQueue;
  _QWORD v6[6];

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__AVPlayer_AVPlayerTaggedBufferOutputSupport__taggedBufferOutputs__block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = v3;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  return v3;
}

uint64_t __66__AVPlayer_AVPlayerTaggedBufferOutputSupport__taggedBufferOutputs__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 648))
    return objc_msgSend(*(id *)(result + 40), "addObject:");
  return result;
}

- (void)setVideoOutput:(id)a3 withOwningTaggedBufferOutput:(id)a4
{
  NSObject *ivarAccessQueue;
  uint64_t v8;
  NSObject *configurationQueue;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[9];
  _QWORD block[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3052000000;
  v26[3] = __Block_byref_object_copy__5;
  v26[4] = __Block_byref_object_dispose__5;
  v26[5] = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  v25 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__AVPlayer_AVPlayerTaggedBufferOutputSupport__setVideoOutput_withOwningTaggedBufferOutput___block_invoke;
  block[3] = &unk_1E30319F0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = v26;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  configurationQueue = self->_player->configurationQueue;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __91__AVPlayer_AVPlayerTaggedBufferOutputSupport__setVideoOutput_withOwningTaggedBufferOutput___block_invoke_2;
  v18[3] = &unk_1E3031A18;
  v18[4] = self;
  v18[5] = a3;
  v18[6] = v26;
  v18[7] = &v20;
  v18[8] = &v27;
  dispatch_sync(configurationQueue, v18);
  if (*((_BYTE *)v28 + 24))
  {
    v15 = (const __CFString *)v21[5];
    if (!v15)
    {
      v15 = CFSTR("AVPlayerVideoOutput can only attach to a single AVPlayer at a time");
      v21[5] = (uint64_t)CFSTR("AVPlayerVideoOutput can only attach to a single AVPlayer at a time");
    }
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v15, v10, v11, v12, v13, v14, v17), 0);
    objc_exception_throw(v16);
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
}

void __91__AVPlayer_AVPlayerTaggedBufferOutputSupport__setVideoOutput_withOwningTaggedBufferOutput___block_invoke(uint64_t a1)
{
  id v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 640);
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 648);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 640) = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 648) = *(id *)(a1 + 48);

}

uint64_t __91__AVPlayer_AVPlayerTaggedBufferOutputSupport__setVideoOutput_withOwningTaggedBufferOutput___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  char v3;

  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "videoOutput"), "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) & 1) == 0)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_detachFromPlayer:", *(_QWORD *)(a1 + 32));

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "videoOutput"), "isEqual:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "_attachToPlayer:exceptionReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v3 = result ^ 1;
    if (!*(_QWORD *)(a1 + 40))
      v3 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  return result;
}

- (void)addTaggedBufferOutput:(id)a3
{
  if (-[AVPlayer videoOutput](self, "videoOutput"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Currently only one video output is supported at a time"), 0));
  -[AVPlayer setVideoOutput:withOwningTaggedBufferOutput:](self, "setVideoOutput:withOwningTaggedBufferOutput:", objc_msgSend(a3, "realOutput"), a3);
}

- (void)removeTaggedBufferOutput:(id)a3
{
  if (-[AVPlayerVideoOutput isEqual:](-[AVPlayer videoOutput](self, "videoOutput"), "isEqual:", objc_msgSend(a3, "realOutput")))-[AVPlayer setVideoOutput:withOwningTaggedBufferOutput:](self, "setVideoOutput:withOwningTaggedBufferOutput:", 0, 0);
}

- (AVPlayerVideoOutput)videoOutput
{
  NSObject *ivarAccessQueue;
  AVPlayerVideoOutput *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayer_AVPlayerOutputSupport__videoOutput__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (AVPlayerVideoOutput *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __46__AVPlayer_AVPlayerOutputSupport__videoOutput__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 640);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setVideoOutput:(id)a3
{
  -[AVPlayer setVideoOutput:withOwningTaggedBufferOutput:](self, "setVideoOutput:withOwningTaggedBufferOutput:", a3, 0);
}

- (id)_weakReferenceToPrimaryPlayer
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__AVPlayer_AVPlayerInterstitialSupport_Internal___weakReferenceToPrimaryPlayer__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __79__AVPlayer_AVPlayerInterstitialSupport_Internal___weakReferenceToPrimaryPlayer__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 256);
  return result;
}

- (void)_setWeakReferenceToPrimaryPlayer:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__AVPlayer_AVPlayerInterstitialSupport_Internal___setWeakReferenceToPrimaryPlayer___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

id __83__AVPlayer_AVPlayerInterstitialSupport_Internal___setWeakReferenceToPrimaryPlayer___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 256) = result;
  return result;
}

- (void)_setInterstitialEventCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__AVPlayer_AVPlayerInterstitialSupport_Internal___setInterstitialEventCoordinator___block_invoke;
  v4[3] = &unk_1E302FE78;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __83__AVPlayer_AVPlayerInterstitialSupport_Internal___setInterstitialEventCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:", *(_QWORD *)(a1 + 40));
}

- (void)_setInterstitialEventCoordinatorOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[AVPlayer _items_invokeOnIvarAccessQueue](self, "_items_invokeOnIvarAccessQueue", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "_copyIntegratedTimelineIfCreated");
        objc_msgSend(v9, "_attachCoordinator:", a3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (void)_setInterstitialPlayerOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[AVPlayer _items_invokeOnIvarAccessQueue](self, "_items_invokeOnIvarAccessQueue", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "_copyIntegratedTimelineIfCreated");
        objc_msgSend(v9, "_attachInterstitialPlayer:", a3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (void)_setInterstitialPlayer:(id)a3
{
  NSObject *ivarAccessQueue;
  OpaqueFigPlayerInterstitialCoordinator *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (!-[AVPlayer _isInterstitialPlayer](self, "_isInterstitialPlayer"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    ivarAccessQueue = self->_player->ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__AVPlayer_AVPlayerInterstitialSupport_Internal___setInterstitialPlayer___block_invoke;
    block[3] = &unk_1E302FE00;
    block[4] = self;
    block[5] = a3;
    block[6] = &v8;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    if (*((_BYTE *)v9 + 24))
    {
      v6 = -[AVPlayer _copyInterstitialEventCoordinatorEnsuringItIsRemote:](self, "_copyInterstitialEventCoordinatorEnsuringItIsRemote:", 1);
      if (v6)
        CFRelease(v6);
    }
    -[AVPlayer _linkAndSyncAudioSessionWithInterstitialPlayer:](self, "_linkAndSyncAudioSessionWithInterstitialPlayer:", -[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated"));
    _Block_object_dispose(&v8, 8);
  }
}

uint64_t __73__AVPlayer_AVPlayerInterstitialSupport_Internal___setInterstitialPlayer___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setInterstitialPlayerGuts_invokeOnIvarAccessQueue:", *(_QWORD *)(a1 + 40));
  result = FigPlayerInterstitialCoordinatorIsRemote();
  if (!(_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)_noteRemoteInterstitialEvents:(id)a3 forItem:(id)a4
{
  OpaqueFigPlayerInterstitialCoordinator *v5;
  OpaqueFigPlayerInterstitialCoordinator *v6;
  OpaqueFigPlayerInterstitialCoordinator *v7;

  v5 = -[AVPlayer _copyInterstitialCoordinatorIfCreated](self, "_copyInterstitialCoordinatorIfCreated");
  if (v5)
  {
    v6 = v5;
    if (!FigPlayerInterstitialCoordinatorIsRemote())
    {
      v7 = -[AVPlayer _copyInterstitialEventCoordinatorEnsuringItIsRemote:](self, "_copyInterstitialEventCoordinatorEnsuringItIsRemote:", 1);
      CFRelease(v6);
      v6 = v7;
    }
    if (FigPlayerInterstitialCoordinatorIsRemote())
      FigPlayerInterstitialRemoteCoordinatorSetEvents();
    CFRelease(v6);
  }
}

- (void)_noteCurrentRemoteInterstitialEvent:(id)a3
{
  OpaqueFigPlayerInterstitialCoordinator *v4;
  OpaqueFigPlayerInterstitialCoordinator *v5;
  OpaqueFigPlayerInterstitialCoordinator *v6;

  v4 = -[AVPlayer _copyInterstitialCoordinatorIfCreated](self, "_copyInterstitialCoordinatorIfCreated");
  if (v4)
  {
    v5 = v4;
    if (!FigPlayerInterstitialCoordinatorIsRemote())
    {
      v6 = -[AVPlayer _copyInterstitialEventCoordinatorEnsuringItIsRemote:](self, "_copyInterstitialEventCoordinatorEnsuringItIsRemote:", 1);
      CFRelease(v5);
      v5 = v6;
    }
    if (FigPlayerInterstitialCoordinatorIsRemote())
      FigPlayerInterstitialRemoteCoordinatorSetCurrentEvent();
    CFRelease(v5);
  }
}

- (int64_t)externalPlaybackInterstitialSchedulingStrategy
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
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __96__AVPlayer_AVPlayerInterstitialSupport_Internal__externalPlaybackInterstitialSchedulingStrategy__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __96__AVPlayer_AVPlayerInterstitialSupport_Internal__externalPlaybackInterstitialSchedulingStrategy__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 272);
  return result;
}

- (void)_setExternalPlaybackInterstitialSchedulingStrategyOnCoordinator_invokeOnIvarAccessQueue:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  CFNumberRef v4;
  void (*v5)(OpaqueFigPlayerInterstitialCoordinator *, _QWORD, CFNumberRef);

  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &self->_player->externalPlaybackInterstitialSchedulingStrategy);
  if (a3)
  {
    v5 = *(void (**)(OpaqueFigPlayerInterstitialCoordinator *, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                              + 56);
    if (v5)
      v5(a3, *MEMORY[0x1E0CC5698], v4);
  }
  if (v4)
    CFRelease(v4);
}

- (void)setExternalPlaybackInterstitialSchedulingStrategy:(int64_t)a3
{
  OpaqueFigPlayerInterstitialCoordinator *v5;
  NSObject *ivarAccessQueue;
  _QWORD block[7];

  v5 = -[AVPlayer _copyInterstitialCoordinatorIfCreated](self, "_copyInterstitialCoordinatorIfCreated");
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__AVPlayer_AVPlayerInterstitialSupport_Internal__setExternalPlaybackInterstitialSchedulingStrategy___block_invoke;
  block[3] = &unk_1E30314D8;
  block[4] = self;
  block[5] = a3;
  block[6] = v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
    CFRelease(v5);
}

uint64_t __100__AVPlayer_AVPlayerInterstitialSupport_Internal__setExternalPlaybackInterstitialSchedulingStrategy___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 272) = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "_setExternalPlaybackInterstitialSchedulingStrategyOnCoordinator_invokeOnIvarAccessQueue:");
  return result;
}

uint64_t __90__AVPlayer_AVPlayerLegibleFallback__setAllowsLegibleFallbackForAllAudibleMediaSelections___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "allowsLegibleFallbackForAllAudibleMediaSelections");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5900], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __78__AVPlayer_AVPlayerLegibleFallback__setLegibleFallbackMediaSelectionCriteria___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "legibleFallbackMediaSelectionCriteria"), "figDictionary");
  FigBaseObject = FigPlayerGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, *MEMORY[0x1E0CC5A38], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isDefunct
{
  OpaqueFigPlayer *v2;
  OpaqueFigPlayer *v3;
  _QWORD *v4;
  uint64_t (*v5)(OpaqueFigPlayer *, char *);
  int v6;
  char v8;

  v8 = 0;
  v2 = -[AVPlayer _copyFigPlayer](self, "_copyFigPlayer");
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
    if (*v4 < 5uLL
      || (v5 = (uint64_t (*)(OpaqueFigPlayer *, char *))v4[11]) == 0
      || (v6 = v5(v3, &v8), !v8) && v6)
    {
      v8 = 1;
    }
    CFRelease(v3);
    LOBYTE(v2) = v8 == 1;
  }
  return (char)v2;
}

- (void)setSupportsSpeedRamps:(BOOL)a3
{
  AVPlayerInternal *player;
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  player = self->_player;
  if (!player->needsToCreateFigPlayer)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set supportsSpeedRamps after the AVPlayer has begun preparing for playback."), 0));
  ivarAccessQueue = player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayer_AVPlayerSpeedRamp__setSupportsSpeedRamps___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
}

uint64_t __53__AVPlayer_AVPlayerSpeedRamp__setSupportsSpeedRamps___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 410) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)supportsSpeedRamps
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
  v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayer_AVPlayerSpeedRamp__supportsSpeedRamps__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayer_AVPlayerSpeedRamp__supportsSpeedRamps__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 410);
  return result;
}

@end
