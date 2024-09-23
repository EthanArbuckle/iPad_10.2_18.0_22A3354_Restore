@implementation AVSynchronizedLayer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (AVSynchronizedLayer)synchronizedLayerWithPlayerItem:(AVPlayerItem *)playerItem
{
  AVSynchronizedLayer *v4;

  v4 = objc_alloc_init(AVSynchronizedLayer);
  -[AVSynchronizedLayer setPlayerItem:](v4, "setPlayerItem:", playerItem);
  return v4;
}

- (AVSynchronizedLayer)init
{
  AVSynchronizedLayer *v2;
  AVSynchronizedLayerInternal *v3;
  NSObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVSynchronizedLayer;
  v2 = -[AVSynchronizedLayer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVSynchronizedLayerInternal);
    v2->_syncLayer = v3;
    if (v3)
    {
      CFRetain(v3);
      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_syncLayer->serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSynchronizedLayerQueue", v4);
      v2->_syncLayer->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avsynchronizedlayer.ivars");
      v2->_syncLayer->oldPlayerItems = (NSMutableSet *)(id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (AVPlayerItem)playerItem
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
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  ivarAccessQueue = self->_syncLayer->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVSynchronizedLayer_playerItem__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (AVPlayerItem *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __33__AVSynchronizedLayer_playerItem__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_isVisible
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
  ivarAccessQueue = self->_syncLayer->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVSynchronizedLayer__isVisible__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__AVSynchronizedLayer__isVisible__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32)
                                                                            + 40);
  return result;
}

- (id)_popAllOldPlayerItems
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
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  ivarAccessQueue = self->_syncLayer->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVSynchronizedLayer__popAllOldPlayerItems__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVSynchronizedLayer__popAllOldPlayerItems__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 32), "copy");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 32), "removeAllObjects");
}

- (void)_removeSelfFromPlayerItem:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "_removeSyncLayer:", self);
    -[AVSynchronizedLayer setInheritsTiming:](self, "setInheritsTiming:", 1);
  }
}

- (void)_updatePlayerItemState
{
  void (*v2[5])(_QWORD);

  v2[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v2[1] = (void (*)(_QWORD))3221225472;
  v2[2] = (void (*)(_QWORD))__45__AVSynchronizedLayer__updatePlayerItemState__block_invoke;
  v2[3] = (void (*)(_QWORD))&unk_1E302FA10;
  v2[4] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v2);
}

uint64_t __45__AVSynchronizedLayer__updatePlayerItemState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "playerItem");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_popAllOldPlayerItems");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (*(void **)(*((_QWORD *)&v9 + 1) + 8 * i) != v2)
          objc_msgSend(*(id *)(a1 + 32), "_removeSelfFromPlayerItem:");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_isVisible"))
    return objc_msgSend(v2, "_addSyncLayer:", *(_QWORD *)(a1 + 32));
  else
    return objc_msgSend(*(id *)(a1 + 32), "_removeSelfFromPlayerItem:", v2);
}

- (void)setPlayerItem:(AVPlayerItem *)playerItem
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_syncLayer->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVSynchronizedLayer_setPlayerItem___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = playerItem;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVSynchronizedLayer _updatePlayerItemState](self, "_updatePlayerItemState");
}

_QWORD *__37__AVSynchronizedLayer_setPlayerItem___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;

  v1 = *(_QWORD *)(result[4] + 32);
  v2 = *(_QWORD *)(v1 + 24);
  if (v2 != result[5])
  {
    v3 = result;
    if (v2)
    {
      objc_msgSend(*(id *)(v1 + 32), "addObject:");
      v4 = *(void **)(*(_QWORD *)(v3[4] + 32) + 24);
    }
    else
    {
      v4 = 0;
    }

    result = (id)v3[5];
    *(_QWORD *)(*(_QWORD *)(v3[4] + 32) + 24) = result;
  }
  return result;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD block[5];
  BOOL v8;

  ivarAccessQueue = self->_syncLayer->ivarAccessQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AVSynchronizedLayer_layerDidBecomeVisible___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v8 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __45__AVSynchronizedLayer_layerDidBecomeVisible___block_invoke_2;
  v6[3] = &unk_1E302FA10;
  v6[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v6);
}

uint64_t __45__AVSynchronizedLayer_layerDidBecomeVisible___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32) + 40) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __45__AVSynchronizedLayer_layerDidBecomeVisible___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlayerItemState");
}

- (void)dealloc
{
  AVSynchronizedLayerInternal *syncLayer;
  NSObject *serialQueue;
  AVPlayerItem *playerItem;
  AVSynchronizedLayerInternal *v6;
  NSObject *ivarAccessQueue;
  objc_super v8;
  _QWORD block[5];

  syncLayer = self->_syncLayer;
  if (syncLayer)
  {
    serialQueue = syncLayer->serialQueue;
    if (serialQueue)
    {
      playerItem = syncLayer->playerItem;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __30__AVSynchronizedLayer_dealloc__block_invoke;
      block[3] = &unk_1E302FA10;
      block[4] = playerItem;
      dispatch_async(serialQueue, block);
      dispatch_release((dispatch_object_t)self->_syncLayer->serialQueue);
      syncLayer = self->_syncLayer;
    }

    v6 = self->_syncLayer;
    ivarAccessQueue = v6->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      v6 = self->_syncLayer;
    }

    CFRelease(self->_syncLayer);
  }
  v8.receiver = self;
  v8.super_class = (Class)AVSynchronizedLayer;
  -[AVSynchronizedLayer dealloc](&v8, sel_dealloc);
}

void __30__AVSynchronizedLayer_dealloc__block_invoke(uint64_t a1)
{

}

@end
