@implementation AVPlayerItemInterstitialEventCollector

- (AVPlayerItemInterstitialEventCollector)initWithCoordinatorGenerator:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVPlayerItemInterstitialEventCollector *v9;
  void *v11;
  objc_super v12;

  if (!a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"obtainCoordinator != nil"), 0);
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVPlayerItemInterstitialEventCollector;
  v9 = -[AVPlayerItemMediaDataCollector init](&v12, sel_init);
  if (v9)
  {
    v9->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeriteminterstitialeventcollector.ivars");
    v9->_obtainCoordinator = _Block_copy(a3);
  }
  return v9;
}

id __103__AVPlayerItemInterstitialEventCollector_AVPlayerItemMediaDataCollector_Internal___attachToPlayerItem___block_invoke(uint64_t a1)
{
  id result;

  result = objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  return result;
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *ivarAccessQueue;
  BOOL v9;
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
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"playerItem != nil"), 0);
    objc_exception_throw(v11);
  }
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__AVPlayerItemInterstitialEventCollector_AVPlayerItemMediaDataCollector_Internal___attachToPlayerItem___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v13;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v9 = *((_BYTE *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v9;
}

- (void)_updateTaggedRangeMetadataArray:(id)a3
{
  if (objc_msgSend(a3, "count"))
  {
    objc_loadWeak((id *)&self->_weakReferenceToPlayerItem);
    FigPlayerInterstitialEventsCreateFromTaggedRangeMetadata();
  }
}

- (void)dealloc
{
  NSObject *ivarAccessQueue;
  objc_super v4;

  objc_storeWeak((id *)&self->_weakReferenceToPlayerItem, 0);
  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
  _Block_release(self->_obtainCoordinator);
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemInterstitialEventCollector;
  -[AVPlayerItemMediaDataCollector dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakReferenceToPlayerItem);
}

- (void)_detatchFromPlayerItem
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__AVPlayerItemInterstitialEventCollector_AVPlayerItemMediaDataCollector_Internal___detatchFromPlayerItem__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

id __105__AVPlayerItemInterstitialEventCollector_AVPlayerItemMediaDataCollector_Internal___detatchFromPlayerItem__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), 0);
}

@end
