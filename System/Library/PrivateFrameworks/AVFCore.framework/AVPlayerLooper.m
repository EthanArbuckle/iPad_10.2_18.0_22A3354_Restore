@implementation AVPlayerLooper

uint64_t __78__AVPlayerLooper_initWithPlayer_templateItem_timeRange_existingItemsOrdering___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = 0;
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16), "asset"), "statusOfValueForKey:error:", CFSTR("duration"), &v6) == 2)
  {
    v5 = 0;
    result = objc_msgSend(*(id *)(a1 + 32), "_setupLoopingReturningError:", &v5);
    if ((result & 1) != 0)
      return result;
    v3 = *(void **)(a1 + 32);
    v4 = v5;
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = v6;
  }
  return objc_msgSend(v3, "_changeStatusToFailedWithError:", v4);
}

- (AVPlayerLooper)initWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop timeRange:(CMTimeRange *)loopRange existingItemsOrdering:(AVPlayerLooperItemOrdering)itemOrdering
{
  AVPlayerLooper *v11;
  AVPlayerLooper *v12;
  CMTime *p_duration;
  CMTimeEpoch v14;
  CMTimeFlags flags;
  CMTimeFlags v16;
  AVPlayerLooperInternal *v17;
  AVPlayerLooperInternal *v18;
  AVPlayerLooperInternal *looper;
  uint64_t v20;
  AVPlayerLooperInternal *v21;
  __int128 v22;
  __int128 v23;
  AVAsset *v24;
  AVPlayerLooper *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  AVPlayerLooper *v35;
  void *v36;
  AVPlayerLooper *v37;
  AVPlayerLooper *v38;
  AVPlayerLooper *v39;
  __int128 v40;
  _QWORD v41[5];
  CMTime time2;
  CMTime time1;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)AVPlayerLooper;
  v11 = -[AVPlayerLooper init](&v44, sel_init);
  v12 = v11;
  if (!v11)
    return v12;
  if (!player)
  {
    v26 = v11;
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = "player != nil";
    goto LABEL_23;
  }
  if (!itemToLoop)
  {
    v35 = v11;
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = "itemToLoop != nil";
    goto LABEL_23;
  }
  if ((loopRange->start.flags & 1) != 0 && (loopRange->duration.flags & 1) != 0 && !loopRange->duration.epoch)
  {
    p_duration = &loopRange->duration;
    if ((loopRange->duration.value & 0x8000000000000000) == 0)
    {
      *(_OWORD *)&time1.value = *(_OWORD *)&p_duration->value;
      time1.epoch = loopRange->duration.epoch;
      v40 = *MEMORY[0x1E0CA2E68];
      *(_OWORD *)&time2.value = *MEMORY[0x1E0CA2E68];
      v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      time2.epoch = v14;
      if (CMTimeCompare(&time1, &time2))
      {
        flags = loopRange->start.flags;
        if ((flags & 1) != 0
          && (v16 = loopRange->duration.flags, (v16 & 1) != 0)
          && !loopRange->duration.epoch
          && (p_duration->value & 0x8000000000000000) == 0
          && ((v16 | flags) & 0x10) != 0)
        {
          v39 = v12;
          v32 = (void *)MEMORY[0x1E0C99DA0];
          v33 = *MEMORY[0x1E0C99778];
          v34 = "! CMTIMERANGE_IS_INDEFINITE(loopRange)";
        }
        else
        {
          time1 = loopRange->start;
          *(_OWORD *)&time2.value = v40;
          time2.epoch = v14;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
            goto LABEL_15;
          v38 = v12;
          v32 = (void *)MEMORY[0x1E0C99DA0];
          v33 = *MEMORY[0x1E0C99778];
          v34 = "CMTIME_COMPARE_INLINE(loopRange.start, >=, kCMTimeZero)";
        }
      }
      else
      {
        v37 = v12;
        v32 = (void *)MEMORY[0x1E0C99DA0];
        v33 = *MEMORY[0x1E0C99778];
        v34 = "! CMTIMERANGE_IS_EMPTY(loopRange)";
      }
LABEL_23:
      v36 = (void *)objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v12, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v27, v28, v29, v30, v31, (uint64_t)v34), 0);
      objc_exception_throw(v36);
    }
  }
LABEL_15:
  v17 = objc_alloc_init(AVPlayerLooperInternal);
  v12->_looper = v17;
  if (v17
    && (v12->_looper->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayerlooper.ivars")) != 0
    && (v12->_looper->loopingItemCopies = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0), v18 = v12->_looper, v18->loopingItemCopies))
  {
    v18->status = 0;
    v12->_looper->loopCount = 0;
    looper = v12->_looper;
    v20 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&looper->forwardPlaybackStartTime.value = *MEMORY[0x1E0CA2E68];
    looper->forwardPlaybackStartTime.epoch = *(_QWORD *)(v20 + 16);
    v12->_looper->loopingPlayer = player;
    v12->_looper->loopingItem = itemToLoop;
    v21 = v12->_looper;
    v23 = *(_OWORD *)&loopRange->start.epoch;
    v22 = *(_OWORD *)&loopRange->duration.timescale;
    *(_OWORD *)&v21->loopRange.start.value = *(_OWORD *)&loopRange->start.value;
    *(_OWORD *)&v21->loopRange.start.epoch = v23;
    *(_OWORD *)&v21->loopRange.duration.timescale = v22;
    v12->_looper->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v12);
    v12->_looper->existingItemsPrecede = itemOrdering == AVPlayerLooperItemOrderingLoopingItemsPrecedeExistingItems;
    v24 = -[AVPlayerItem asset](v12->_looper->loopingItem, "asset");
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __78__AVPlayerLooper_initWithPlayer_templateItem_timeRange_existingItemsOrdering___block_invoke;
    v41[3] = &unk_1E302FA10;
    v41[4] = v12;
    -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](v24, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E3093A78, v41);
  }
  else
  {

    return 0;
  }
  return v12;
}

void __78__AVPlayerLooper_initWithPlayer_templateItem_timeRange_existingItemsOrdering___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void (*v3[5])(_QWORD);

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "dispatchQueue");
  v3[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v3[1] = (void (*)(_QWORD))3221225472;
  v3[2] = (void (*)(_QWORD))__78__AVPlayerLooper_initWithPlayer_templateItem_timeRange_existingItemsOrdering___block_invoke_2;
  v3[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v3[4] = *(void (**)(_QWORD))(a1 + 32);
  AVSerializeOnQueueAsyncIfNecessary(v2, v3);
}

void __33__AVPlayerLooper__turnOffLooping__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 128) = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "currentItem");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        if (*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i) == v2)
          v6 = 1;
        else
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "removeItem:");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
    if ((v6 & 1) != 0)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(NSObject **)(*(_QWORD *)(v9 + 8) + 88);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__AVPlayerLooper__turnOffLooping__block_invoke_3;
      block[3] = &unk_1E302FA10;
      block[4] = v9;
      av_readwrite_dispatch_queue_write(v10, block);
    }
  }
}

uint64_t __33__AVPlayerLooper__turnOffLooping__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v1 + 144) != 2)
    *(_QWORD *)(v1 + 144) = 3;
  return result;
}

uint64_t __25__AVPlayerLooper_dealloc__block_invoke(uint64_t a1)
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
  v2 = *(void **)(a1 + 32);
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
        objc_msgSend(*(id *)(a1 + 40), "removeItem:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  if (*(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 40), "setActionAtItemEnd:");
  return result;
}

uint64_t __24__AVPlayerLooper_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 144);
  return result;
}

- (AVPlayerLooperStatus)status
{
  NSObject *ivarAccessQueue;
  AVPlayerLooperStatus v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__AVPlayerLooper_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AVPlayerLooper)initWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop timeRange:(CMTimeRange *)loopRange
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)&loopRange->start.epoch;
  v7[0] = *(_OWORD *)&loopRange->start.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&loopRange->duration.timescale;
  return -[AVPlayerLooper initWithPlayer:templateItem:timeRange:existingItemsOrdering:](self, "initWithPlayer:templateItem:timeRange:existingItemsOrdering:", player, itemToLoop, v7, 0);
}

- (void)dealloc
{
  AVPlayerLooperInternal *looper;
  AVPlayerLooperInternal *v4;
  id v5;
  NSMutableArray *loopingItemCopies;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  AVQueuePlayer *loopingPlayer;
  NSMutableArray *v12;
  void (*playerOriginalActionAtItemEnd)(_QWORD);
  AVPlayerLooperInternal *v14;
  NSObject *ivarAccessQueue;
  objc_super v16;
  void (*block[7])(_QWORD);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  looper = self->_looper;
  if (looper)
  {

    v4 = self->_looper;
    if (v4->listeningForItemFailedToPlayToEndTime)
    {
      v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      loopingItemCopies = self->_looper->loopingItemCopies;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loopingItemCopies, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(loopingItemCopies);
            objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_looper->weakReference, _avplLoopingItemFailedToPlayToEndTimeNotificationHandler, CFSTR("AVPlayerItemFailedToPlayToEndTimeNotification"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          }
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loopingItemCopies, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v8);
      }
      self->_looper->listeningForItemFailedToPlayToEndTime = 0;
      v4 = self->_looper;
    }
    loopingPlayer = v4->loopingPlayer;
    if (loopingPlayer)
    {
      v12 = v4->loopingItemCopies;
      playerOriginalActionAtItemEnd = (void (*)(_QWORD))v4->playerOriginalActionAtItemEnd;
      block[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
      block[1] = (void (*)(_QWORD))3221225472;
      block[2] = (void (*)(_QWORD))__25__AVPlayerLooper_dealloc__block_invoke;
      block[3] = (void (*)(_QWORD))&unk_1E302FEE0;
      block[4] = (void (*)(_QWORD))v12;
      block[5] = (void (*)(_QWORD))loopingPlayer;
      block[6] = playerOriginalActionAtItemEnd;
      if ((dyld_program_sdk_at_least() & 1) != 0
        || (dyld_program_sdk_at_least() & 1) != 0
        || (dyld_program_sdk_at_least() & 1) != 0
        || (dyld_program_sdk_at_least() & 1) != 0)
      {
        dispatch_async((dispatch_queue_t)-[AVPlayer dispatchQueue](loopingPlayer, "dispatchQueue"), block);
      }
      else
      {
        AVSerializeOnQueueAsyncIfNecessary(-[AVPlayer dispatchQueue](loopingPlayer, "dispatchQueue"), block);
      }
    }

    v14 = self->_looper;
    ivarAccessQueue = v14->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      self->_looper->ivarAccessQueue = 0;
      v14 = self->_looper;
    }

  }
  v16.receiver = self;
  v16.super_class = (Class)AVPlayerLooper;
  -[AVPlayerLooper dealloc](&v16, sel_dealloc);
}

- (void)_turnOffLooping
{
  void (*v3)(_QWORD);
  NSObject *ivarAccessQueue;
  NSObject *v5;
  void (*v6[5])(_QWORD);
  _QWORD block[5];

  -[AVPlayerLooper willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
  v3 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AVPlayerLooper__turnOffLooping__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  -[AVPlayerLooper didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
  v5 = -[AVPlayer dispatchQueue](self->_looper->loopingPlayer, "dispatchQueue");
  v6[0] = v3;
  v6[1] = (void (*)(_QWORD))3221225472;
  v6[2] = __33__AVPlayerLooper__turnOffLooping__block_invoke_2;
  v6[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v6[4] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(v5, v6);
}

- (BOOL)_setupLoopingReturningError:(id *)a3
{
  id v5;
  AVPlayerLooperInternal *looper;
  int v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *ivarAccessQueue;
  uint64_t v13;
  double v14;
  float v15;
  AVPlayerLooperInternal *v16;
  AVPlayerItem *v17;
  AVPlayerItem *v18;
  AVPlayerItem *v19;
  NSMutableArray *loopingItemCopies;
  uint64_t v21;
  AVPlayerItem *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  AVPlayerItem *v26;
  AVPlayerLooperInternal *v27;
  AVPlayerLooperInternal *v28;
  NSObject *v29;
  id v30;
  AVCallbackCancellation *v31;
  id v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  const __CFString **v40;
  uint64_t *v41;
  void *v42;
  AVPlayerItem *loopingItem;
  AVPlayerLooperInternal *v44;
  $11E8FAD63EF01618BAA11C8CE4E61C06 *p_loopRange;
  AVPlayerItem *v46;
  AVPlayerLooperInternal *v47;
  __int128 v48;
  AVPlayerItem *v49;
  NSMutableArray *obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD block[6];
  CMTime v62;
  CMTimeRange time1;
  CMTime v64;
  CMTime time2;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  _QWORD v76[3];

  v76[1] = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerLooper status](self, "status"))
    goto LABEL_2;
  looper = self->_looper;
  if ((looper->loopRange.start.flags & 1) != 0
    && (looper->loopRange.duration.flags & 1) != 0
    && !looper->loopRange.duration.epoch
    && (looper->loopRange.duration.value & 0x8000000000000000) == 0)
  {
    loopingItem = looper->loopingItem;
    if (loopingItem)
    {
      -[AVPlayerItem duration](loopingItem, "duration");
      if ((BYTE4(v67) & 0x1D) == 1)
      {
        v44 = self->_looper;
        p_loopRange = &v44->loopRange;
        v46 = v44->loopingItem;
        if (v46)
          -[AVPlayerItem duration](v46, "duration");
        else
          memset(&time2, 0, sizeof(time2));
        *(_OWORD *)&time1.start.value = *(_OWORD *)&p_loopRange->start.value;
        time1.start.epoch = p_loopRange->start.epoch;
        if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        {
          if (a3)
          {
            v75 = *MEMORY[0x1E0C9AFA8];
            v76[0] = CFSTR("Loop range must start within [0, item duration]");
            v39 = (void *)MEMORY[0x1E0C99D80];
            v40 = (const __CFString **)v76;
            v41 = &v75;
            goto LABEL_45;
          }
          goto LABEL_62;
        }
        v47 = self->_looper;
        v48 = *(_OWORD *)&v47->loopRange.start.epoch;
        *(_OWORD *)&time1.start.value = *(_OWORD *)&v47->loopRange.start.value;
        *(_OWORD *)&time1.start.epoch = v48;
        *(_OWORD *)&time1.duration.timescale = *(_OWORD *)&v47->loopRange.duration.timescale;
        CMTimeRangeGetEnd(&v64, &time1);
        v49 = self->_looper->loopingItem;
        if (v49)
          -[AVPlayerItem duration](v49, "duration");
        else
          memset(&v62, 0, sizeof(v62));
        if (CMTimeCompare(&v64, &v62) >= 1)
        {
          if (a3)
          {
            v73 = *MEMORY[0x1E0C9AFA8];
            v74 = CFSTR("Loop range must be within [0, item duration]");
            v39 = (void *)MEMORY[0x1E0C99D80];
            v40 = &v74;
            v41 = &v73;
            goto LABEL_45;
          }
          goto LABEL_62;
        }
      }
    }
    else
    {
      v66 = 0;
      v67 = 0;
      v68 = 0;
    }
  }
  v7 = -[AVPlayerLooper _calculateNumberOfCopiesNeeded](self, "_calculateNumberOfCopiesNeeded");
  if (!v7)
  {
    if (a3)
    {
      v71 = *MEMORY[0x1E0C9AFA8];
      v72 = CFSTR("Template AVPlayerItem's duration must not be 0");
      v39 = (void *)MEMORY[0x1E0C99D80];
      v40 = &v72;
      v41 = &v71;
LABEL_45:
      v42 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11838, (void *)objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, 1));
      LOBYTE(v5) = 0;
      *a3 = v42;
      return (char)v5;
    }
LABEL_62:
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  if (v8 < 1)
  {
LABEL_12:
    -[AVPlayerLooper willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("loopingPlayerItems"));
    ivarAccessQueue = self->_looper->ivarAccessQueue;
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__AVPlayerLooper__setupLoopingReturningError___block_invoke;
    block[3] = &unk_1E302FCE8;
    block[4] = self;
    block[5] = v9;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    -[AVPlayerLooper didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("loopingPlayerItems"));
    -[AVPlayer rate](self->_looper->loopingPlayer, "rate");
    v15 = *(float *)&v14;
    if (*(float *)&v14 != 0.0)
    {
      LODWORD(v14) = 0;
      -[AVPlayer setRate:](self->_looper->loopingPlayer, "setRate:", v14);
    }
    v16 = self->_looper;
    if ((v16->loopRange.start.flags & 1) != 0
      && (v16->loopRange.duration.flags & 1) != 0
      && !v16->loopRange.duration.epoch
      && (v16->loopRange.duration.value & 0x8000000000000000) == 0)
    {
      *(_OWORD *)&v16->forwardPlaybackStartTime.value = *(_OWORD *)&v16->loopRange.start.value;
      v16->forwardPlaybackStartTime.epoch = v16->loopRange.start.epoch;
      v16 = self->_looper;
    }
    v17 = -[AVPlayer currentItem](v16->loopingPlayer, "currentItem");
    v18 = v17;
    if (v17)
      v19 = v17;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    loopingItemCopies = self->_looper->loopingItemCopies;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loopingItemCopies, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    v22 = v18;
    if (v21)
    {
      v23 = v21;
      v24 = *(_QWORD *)v58;
      v22 = v18;
      do
      {
        v25 = 0;
        v26 = v22;
        do
        {
          if (*(_QWORD *)v58 != v24)
            objc_enumerationMutation(loopingItemCopies);
          v22 = *(AVPlayerItem **)(*((_QWORD *)&v57 + 1) + 8 * v25);
          -[AVPlayerLooper _configureLoopingItem:](self, "_configureLoopingItem:", v22);
          -[AVQueuePlayer insertItem:afterItem:](self->_looper->loopingPlayer, "insertItem:afterItem:", v22, v26);
          ++v25;
          v26 = v22;
        }
        while (v23 != v25);
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loopingItemCopies, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v23);
    }
    if (v18)
    {
      v27 = self->_looper;
      if (v27->existingItemsPrecede)
      {
        -[AVQueuePlayer removeItem:](v27->loopingPlayer, "removeItem:", v18);
        -[AVQueuePlayer insertItem:afterItem:](self->_looper->loopingPlayer, "insertItem:afterItem:", v18, v22);
      }

    }
    self->_looper->lastEnqueuedLoopingItem = v22;
    self->_looper->playerOriginalActionAtItemEnd = -[AVPlayer actionAtItemEnd](self->_looper->loopingPlayer, "actionAtItemEnd");
    v28 = self->_looper;
    if (v28->playerOriginalActionAtItemEnd)
      -[AVQueuePlayer setActionAtItemEnd:](v28->loopingPlayer, "setActionAtItemEnd:", 0);
    -[AVPlayerLooper willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
    v29 = self->_looper->ivarAccessQueue;
    v56[0] = v13;
    v56[1] = 3221225472;
    v56[2] = __46__AVPlayerLooper__setupLoopingReturningError___block_invoke_2;
    v56[3] = &unk_1E302FA10;
    v56[4] = self;
    av_readwrite_dispatch_queue_write(v29, v56);
    -[AVPlayerLooper didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
    v30 = +[AVKVODispatcher sharedKVODispatcher](AVKVODispatcher, "sharedKVODispatcher");
    self->_looper->playerCurrentItemKVOInvoker = (AVCallbackCancellation *)objc_msgSend(v30, "startObservingObject:weakObserver:forKeyPath:options:context:", self->_looper->loopingPlayer, self, CFSTR("currentItem"), 3, CFSTR("AVPlayerLooperObservationCurrentItemContext"));
    v31 = self->_looper->playerCurrentItemKVOInvoker;
    self->_looper->loopingItemStatusKVOInvokers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = self->_looper->loopingItemCopies;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
    if (v33)
    {
      v35 = v33;
      v36 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v53 != v36)
            objc_enumerationMutation(obj);
          v38 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          -[NSMutableArray addObject:](self->_looper->loopingItemStatusKVOInvokers, "addObject:", objc_msgSend(v30, "startObservingObject:weakObserver:forKeyPath:options:context:", v38, self, CFSTR("status"), 3, CFSTR("AVPlayerLooperObservationItemStatusContext")));
          objc_msgSend(v32, "addListenerWithWeakReference:callback:name:object:flags:", self->_looper->weakReference, _avplLoopingItemFailedToPlayToEndTimeNotificationHandler, CFSTR("AVPlayerItemFailedToPlayToEndTimeNotification"), v38, 0);
        }
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
      }
      while (v35);
    }
    LOBYTE(v5) = 1;
    self->_looper->listeningForItemFailedToPlayToEndTime = 1;
    if (v15 != 0.0)
    {
      *(float *)&v34 = v15;
      -[AVPlayer setRate:](self->_looper->loopingPlayer, "setRate:", v34);
LABEL_2:
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    v10 = v8 + 1;
    while (1)
    {
      v5 = -[AVPlayerItem copyWithZone:](self->_looper->loopingItem, "copyWithZone:", -[AVPlayerLooper zone](self, "zone"));
      if (!v5)
        break;
      v11 = v5;
      objc_msgSend(v9, "addObject:", v5);

      if (--v10 <= 1)
        goto LABEL_12;
    }
  }
  return (char)v5;
}

+ (AVPlayerLooper)playerLooperWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop
{
  id v6;
  __int128 v7;
  _OWORD v9[3];

  v6 = objc_alloc((Class)a1);
  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v9[0] = *MEMORY[0x1E0CA2E40];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  return (AVPlayerLooper *)(id)objc_msgSend(v6, "initWithPlayer:templateItem:timeRange:", player, itemToLoop, v9);
}

+ (void)initialize
{
  objc_opt_class();
}

+ (AVPlayerLooper)playerLooperWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop timeRange:(CMTimeRange *)loopRange
{
  id v8;
  __int128 v9;
  _OWORD v11[3];

  v8 = objc_alloc((Class)a1);
  v9 = *(_OWORD *)&loopRange->start.epoch;
  v11[0] = *(_OWORD *)&loopRange->start.value;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&loopRange->duration.timescale;
  return (AVPlayerLooper *)(id)objc_msgSend(v8, "initWithPlayer:templateItem:timeRange:", player, itemToLoop, v11);
}

- (AVPlayerLooper)init
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v4[0] = *MEMORY[0x1E0CA2E40];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  return -[AVPlayerLooper initWithPlayer:templateItem:timeRange:](self, "initWithPlayer:templateItem:timeRange:", 0, 0, v4);
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__AVPlayerLooper_error__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __23__AVPlayerLooper_error__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_changeStatusToFailedWithError:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v6[6];

  -[AVPlayerLooper willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
  -[AVPlayerLooper willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AVPlayerLooper__changeStatusToFailedWithError___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
  -[AVPlayerLooper didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
  -[AVPlayerLooper didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
}

uint64_t __49__AVPlayerLooper__changeStatusToFailedWithError___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 144) != 2)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 152) = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 144) = 2;
  }
  return result;
}

- (NSInteger)loopCount
{
  NSObject *ivarAccessQueue;
  NSInteger v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerLooper_loopCount__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__AVPlayerLooper_loopCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 80);
  return result;
}

- (NSArray)loopingPlayerItems
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerLooper_loopingPlayerItems__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSArray *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVPlayerLooper_loopingPlayerItems__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_configureLoopingItem:(id)a3
{
  AVPlayerLooperInternal *looper;
  AVPlayerLooperInternal *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  CMTimeRange range;
  CMTime v13;

  looper = self->_looper;
  if ((looper->loopRange.start.flags & 1) != 0
    && (looper->loopRange.duration.flags & 1) != 0
    && !looper->loopRange.duration.epoch
    && (looper->loopRange.duration.value & 0x8000000000000000) == 0)
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&looper->loopRange.start.value;
    range.start.epoch = looper->loopRange.start.epoch;
    objc_msgSend(a3, "setReversePlaybackEndTime:", &range);
    v6 = self->_looper;
    v7 = *(_OWORD *)&v6->loopRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&v6->loopRange.start.value;
    *(_OWORD *)&range.start.epoch = v7;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&v6->loopRange.duration.timescale;
    CMTimeRangeGetEnd(&v13, &range);
    objc_msgSend(a3, "setForwardPlaybackEndTime:", &v13);
    looper = self->_looper;
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&looper->forwardPlaybackStartTime.value;
  range.start.epoch = looper->forwardPlaybackStartTime.epoch;
  v10 = *MEMORY[0x1E0CA2E68];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v8 = v10;
  v9 = v11;
  objc_msgSend(a3, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &range, &v10, &v8, 0);
}

- (int)_calculateNumberOfCopiesNeeded
{
  AVPlayerLooperInternal *looper;
  double v4;
  AVPlayerItem *loopingItem;
  AVPlayerItem *v6;
  double Seconds;
  int result;
  CMTime v9;
  int v10;
  CMTime time;

  looper = self->_looper;
  v4 = 10.0;
  if ((looper->loopRange.start.flags & 1) != 0
    && (looper->loopRange.duration.flags & 1) != 0
    && !looper->loopRange.duration.epoch
    && (looper->loopRange.duration.value & 0x8000000000000000) == 0)
  {
    time = (CMTime)looper->loopRange.duration;
    v4 = fmin(CMTimeGetSeconds(&time), 10.0);
    looper = self->_looper;
  }
  loopingItem = looper->loopingItem;
  if (loopingItem)
  {
    -[AVPlayerItem duration](loopingItem, "duration");
    if ((v10 & 0x1D) == 1)
    {
      v6 = self->_looper->loopingItem;
      if (v6)
        -[AVPlayerItem duration](v6, "duration");
      else
        memset(&v9, 0, sizeof(v9));
      Seconds = CMTimeGetSeconds(&v9);
      if (Seconds < v4)
        v4 = Seconds;
    }
  }
  if (v4 * 3.0 >= 10.0)
    return 3;
  if (v4 <= 0.0)
    return 0;
  if (v4 > 0.1)
  {
    result = vcvtpd_s64_f64(10.0 / v4);
    if (result > 2)
      return result;
    return 0;
  }
  return 100;
}

uint64_t __46__AVPlayerLooper__setupLoopingReturningError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__AVPlayerLooper__setupLoopingReturningError___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_QWORD *)(v1 + 144))
    *(_QWORD *)(v1 + 144) = 1;
  return result;
}

uint64_t __33__AVPlayerLooper__turnOffLooping__block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 136) = 1;
  return result;
}

- (BOOL)_isWaitingForLastCopyToFinishSet
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
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerLooper__isWaitingForLastCopyToFinishSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AVPlayerLooper__isWaitingForLastCopyToFinishSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 136);
  return result;
}

- (void)_cleanupAfterPlayingLastLoopingCopy
{
  NSObject *ivarAccessQueue;
  AVPlayerLooperInternal *looper;
  id v5;
  NSMutableArray *loopingItemCopies;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *loopingItemStatusKVOInvokers;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  AVCallbackCancellation *playerCurrentItemKVOInvoker;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[5];
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerLooper _isWaitingForLastCopyToFinishSet](self, "_isWaitingForLastCopyToFinishSet"))
  {
    ivarAccessQueue = self->_looper->ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__AVPlayerLooper__cleanupAfterPlayingLastLoopingCopy__block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    looper = self->_looper;
    if (looper->playerOriginalActionAtItemEnd)
    {
      -[AVQueuePlayer setActionAtItemEnd:](looper->loopingPlayer, "setActionAtItemEnd:");
      looper = self->_looper;
    }
    if (looper->listeningForItemFailedToPlayToEndTime)
    {
      v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      loopingItemCopies = self->_looper->loopingItemCopies;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loopingItemCopies, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v22 != v9)
              objc_enumerationMutation(loopingItemCopies);
            objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_looper->weakReference, _avplLoopingItemFailedToPlayToEndTimeNotificationHandler, CFSTR("AVPlayerItemFailedToPlayToEndTimeNotification"), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          }
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loopingItemCopies, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        }
        while (v8);
      }
      self->_looper->listeningForItemFailedToPlayToEndTime = 0;
      looper = self->_looper;
    }
    loopingItemStatusKVOInvokers = looper->loopingItemStatusKVOInvokers;
    if (loopingItemStatusKVOInvokers)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loopingItemStatusKVOInvokers, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(loopingItemStatusKVOInvokers);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "cancelCallbacks");
          }
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loopingItemStatusKVOInvokers, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
        }
        while (v13);
      }

      self->_looper->loopingItemStatusKVOInvokers = 0;
      looper = self->_looper;
    }
    playerCurrentItemKVOInvoker = looper->playerCurrentItemKVOInvoker;
    if (playerCurrentItemKVOInvoker)
    {
      -[AVCallbackCancellation cancelCallbacks](playerCurrentItemKVOInvoker, "cancelCallbacks");

      self->_looper->playerCurrentItemKVOInvoker = 0;
    }
  }
}

uint64_t __53__AVPlayerLooper__cleanupAfterPlayingLastLoopingCopy__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 136) = 0;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  AVPlayerItem *v10;
  NSObject *ivarAccessQueue;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD block[5];

  if (-[AVPlayerLooper status](self, "status", a3) == AVPlayerLooperStatusReady
    || -[AVPlayerLooper _isWaitingForLastCopyToFinishSet](self, "_isWaitingForLastCopyToFinishSet"))
  {
    if (a6 == CFSTR("AVPlayerLooperObservationCurrentItemContext"))
    {
      v10 = (AVPlayerItem *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
      if (-[AVPlayerLooper status](self, "status") == AVPlayerLooperStatusReady)
      {
        if (v10 != (AVPlayerItem *)objc_msgSend(MEMORY[0x1E0C99E38], "null")
          && -[NSMutableArray indexOfObjectIdenticalTo:](self->_looper->loopingItemCopies, "indexOfObjectIdenticalTo:", v10) != 0x7FFFFFFFFFFFFFFFLL&& self->_looper->lastEnqueuedLoopingItem)
        {
          -[AVPlayerLooper _configureLoopingItem:](self, "_configureLoopingItem:", v10);
          -[AVQueuePlayer insertItem:afterItem:](self->_looper->loopingPlayer, "insertItem:afterItem:", v10, self->_looper->lastEnqueuedLoopingItem);
          self->_looper->lastEnqueuedLoopingItem = v10;
          -[AVPlayerLooper willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("loopCount"));
          ivarAccessQueue = self->_looper->ivarAccessQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __65__AVPlayerLooper_observeValueForKeyPath_ofObject_change_context___block_invoke;
          block[3] = &unk_1E302FA10;
          block[4] = self;
          av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
          -[AVPlayerLooper didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("loopCount"));
        }
      }
      else if (-[AVPlayerLooper _isWaitingForLastCopyToFinishSet](self, "_isWaitingForLastCopyToFinishSet")
             && v10 != (AVPlayerItem *)objc_msgSend(MEMORY[0x1E0C99E38], "null")
             && -[NSMutableArray indexOfObjectIdenticalTo:](self->_looper->loopingItemCopies, "indexOfObjectIdenticalTo:", v10) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[AVPlayerLooper willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("loopCount"));
        v12 = self->_looper->ivarAccessQueue;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __65__AVPlayerLooper_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v13[3] = &unk_1E302FA10;
        v13[4] = self;
        av_readwrite_dispatch_queue_write(v12, v13);
        -[AVPlayerLooper didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("loopCount"));
        -[AVPlayerLooper _cleanupAfterPlayingLastLoopingCopy](self, "_cleanupAfterPlayingLastLoopingCopy");
      }
    }
    else if (a4
           && a6 == CFSTR("AVPlayerLooperObservationItemStatusContext")
           && -[NSMutableArray indexOfObjectIdenticalTo:](self->_looper->loopingItemCopies, "indexOfObjectIdenticalTo:", a4) != 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(a4, "status") == 2)
    {
      -[AVPlayerLooper _changeStatusToFailedWithError:](self, "_changeStatusToFailedWithError:", objc_msgSend(a4, "error"));
      -[AVPlayerLooper _turnOffLooping](self, "_turnOffLooping");
    }
  }
}

uint64_t __65__AVPlayerLooper_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 80);
  return result;
}

uint64_t __65__AVPlayerLooper_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 80);
  return result;
}

@end
