@implementation AVPlayerCaptionLayer

+ (id)captionLayerWithPlayer:(id)a3
{
  AVPlayerCaptionLayer *v4;

  v4 = objc_alloc_init(AVPlayerCaptionLayer);
  -[AVPlayerCaptionLayer setPlayer:](v4, "setPlayer:", a3);
  return v4;
}

- (AVPlayerCaptionLayer)init
{
  char *v2;
  id v3;
  AVPlayerLayerIntermediateLayer *v4;
  __int128 v5;
  NSObject *v6;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVPlayerCaptionLayer;
  v2 = -[AVPlayerCaptionLayer init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CC3250]);
    *((_QWORD *)v2 + 4) = v3;
    objc_msgSend(v2, "addSublayer:", v3);
    objc_msgSend(*((id *)v2 + 4), "setEdgeAntialiasingMask:", 0);
    v4 = objc_alloc_init(AVPlayerLayerIntermediateLayer);
    *((_QWORD *)v2 + 5) = v4;
    objc_msgSend(v2, "addSublayer:", v4);
    v5 = *(_OWORD *)(MEMORY[0x1E0CB2990] + 16);
    *(_OWORD *)(v2 + 104) = *MEMORY[0x1E0CB2990];
    *(_OWORD *)(v2 + 120) = v5;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v2 + 6) = dispatch_queue_create("AVPlayerCaptionLayerQueue", v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v2 + 7) = dispatch_queue_create("com.apple.avfoundation.playercaptionlayer.configuration", v7);
    *((_QWORD *)v2 + 12) = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }
  return (AVPlayerCaptionLayer *)v2;
}

- (void)layoutSublayers
{
  void (*v3)(_QWORD);
  void (*v4)(_QWORD);
  void (*v5)(_QWORD);
  void (*v6)(_QWORD);
  void (*v7)(_QWORD);
  void (*v8)(_QWORD);
  void (*v9)(_QWORD);
  void (*v10)(_QWORD);
  NSObject *serialQueue;
  void (*v12)(_QWORD);
  objc_super v13;
  void (*v14[10])(_QWORD);
  _QWORD block[6];
  _QWORD v16[6];

  -[AVPlayerCaptionLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3052000000;
  v16[3] = __Block_byref_object_copy__29;
  v16[4] = __Block_byref_object_dispose__29;
  v16[5] = 0;
  serialQueue = self->_serialQueue;
  v12 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AVPlayerCaptionLayer_layoutSublayers__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = v16;
  dispatch_sync(serialQueue, block);
  v14[0] = v12;
  v14[1] = (void (*)(_QWORD))3221225472;
  v14[2] = __39__AVPlayerCaptionLayer_layoutSublayers__block_invoke_2;
  v14[3] = (void (*)(_QWORD))&unk_1E3034758;
  v14[6] = v4;
  v14[7] = v6;
  v14[8] = v8;
  v14[9] = v10;
  v14[4] = (void (*)(_QWORD))self;
  v14[5] = (void (*)(_QWORD))v16;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v14);
  -[AVPlayer _updateClosedCaptionLayerBounds:videoRelativeToViewport:captionsAvoidanceMargins:](-[AVPlayerCaptionLayer player](self, "player"), "_updateClosedCaptionLayerBounds:videoRelativeToViewport:captionsAvoidanceMargins:", self->_closedCaptionLayer, 0, &self->_legibleContentInsets);
  v13.receiver = self;
  v13.super_class = (Class)AVPlayerCaptionLayer;
  -[AVPlayerCaptionLayer layoutSublayers](&v13, sel_layoutSublayers);
  _Block_object_dispose(v16, 8);
}

id __39__AVPlayerCaptionLayer_layoutSublayers__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __39__AVPlayerCaptionLayer_layoutSublayers__block_invoke_2(uint64_t a1)
{
  void *v2;
  double MidX;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setViewport:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
  objc_msgSend(v2, "setPosition:", MidX, CGRectGetMidY(*(CGRect *)(a1 + 48)));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVPlayerCaptionLayer bounds](self, "bounds");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerCaptionLayer;
    -[AVPlayerCaptionLayer setBounds:](&v8, sel_setBounds_, x, y, width, height);
    -[AVPlayerCaptionLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)dealloc
{
  NSObject *serialQueue;
  NSObject *configurationQueue;
  objc_super v5;

  if (self->_playerBeingObserved)
    -[AVPlayerCaptionLayer _stopObservingPlayer:](self, "_stopObservingPlayer:");

  -[AVPlayer _removePlayerCaptionLayer:](self->_player, "_removePlayerCaptionLayer:", self);
  serialQueue = self->_serialQueue;
  if (serialQueue)
    dispatch_release(serialQueue);
  configurationQueue = self->_configurationQueue;
  if (configurationQueue)
    dispatch_release(configurationQueue);
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerCaptionLayer;
  -[AVPlayerCaptionLayer dealloc](&v5, sel_dealloc);
}

- (void)setPlayer:(id)a3
{
  AVPlayer *player;
  NSObject *serialQueue;
  AVPlayer *v7;
  _QWORD v8[6];

  player = self->_player;
  if (player != a3)
  {
    -[AVPlayer _removePlayerCaptionLayer:](player, "_removePlayerCaptionLayer:", self);
    serialQueue = self->_serialQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __34__AVPlayerCaptionLayer_setPlayer___block_invoke;
    v8[3] = &unk_1E302FCE8;
    v8[4] = self;
    v8[5] = a3;
    dispatch_sync(serialQueue, v8);
    v7 = self->_player;
    if (v7)
      -[AVPlayer _addPlayerCaptionLayer:](v7, "_addPlayerCaptionLayer:", self);
  }
}

void __34__AVPlayerCaptionLayer_setPlayer___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(NSObject **)(v3 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AVPlayerCaptionLayer_setPlayer___block_invoke_2;
  block[3] = &unk_1E302FD88;
  block[4] = v3;
  block[5] = v2;
  block[6] = v4;
  dispatch_async(v5, block);

}

uint64_t __34__AVPlayerCaptionLayer_setPlayer___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopObservingPlayer:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_startObservingPlayer:", *(_QWORD *)(a1 + 48));
}

- (AVPlayer)player
{
  NSObject *serialQueue;
  AVPlayer *v3;
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
  v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerCaptionLayer_player__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (AVPlayer *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__AVPlayerCaptionLayer_player__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_startObservingPlayer:(id)a3
{
  id v5;
  void *v6;

  if (self->_player)
  {
    if (!self->_playerBeingObserved)
    {
      self->_playerBeingObserved = (AVPlayer *)a3;
      v5 = +[AVKVODispatcher sharedKVODispatcher](AVKVODispatcher, "sharedKVODispatcher");
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      objc_msgSend(v6, "addObject:", objc_msgSend(v5, "startObservingObject:weakObserver:forTwoPartKeyPath:options:context:", a3, self, AVTwoPartKeyPathMake((uint64_t)CFSTR("currentItem"), (uint64_t)CFSTR("nonForcedSubtitleDisplayEnabled")), 5, AVPlayerLayerPlayerItemSubtitleDisplayEnabledObserverContext));
      objc_msgSend(v6, "addObject:", objc_msgSend(v5, "startObservingObject:weakObserver:forKeyPath:options:context:", a3, self, CFSTR("isDisplayingClosedCaptions"), 5, AVPlayerLayerDisplayingClosedCaptionsChangedObserverContext));

      self->_KVOInvokers = (NSSet *)objc_msgSend(v6, "copy");
    }
  }
}

- (void)_stopObservingPlayer:(id)a3
{
  AVPlayer *playerBeingObserved;
  NSSet *KVOInvokers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    playerBeingObserved = self->_playerBeingObserved;
    if (playerBeingObserved)
    {

      self->_playerBeingObserved = 0;
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      KVOInvokers = self->_KVOInvokers;
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](KVOInvokers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(KVOInvokers);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "cancelCallbacks");
          }
          v7 = -[NSSet countByEnumeratingWithState:objects:count:](KVOInvokers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

      self->_KVOInvokers = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    }
  }
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  NSObject *configurationQueue;
  objc_super v8;
  void (*v9[7])(_QWORD);

  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("separatedOptions")) & 1) != 0
    || objc_msgSend(a4, "isEqualToString:", CFSTR("styleOptions")))
  {
    configurationQueue = self->_configurationQueue;
    v9[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v9[1] = (void (*)(_QWORD))3221225472;
    v9[2] = (void (*)(_QWORD))__44__AVPlayerCaptionLayer_setValue_forKeyPath___block_invoke;
    v9[3] = (void (*)(_QWORD))&unk_1E302FD88;
    v9[4] = (void (*)(_QWORD))self;
    v9[5] = (void (*)(_QWORD))a3;
    v9[6] = (void (*)(_QWORD))a4;
    AVSerializeOnQueueAsyncIfNecessary(configurationQueue, v9);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerCaptionLayer;
    -[AVPlayerCaptionLayer setValue:forKeyPath:](&v8, sel_setValue_forKeyPath_, a3, a4);
  }
}

uint64_t __44__AVPlayerCaptionLayer_setValue_forKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setCaptionRendererOutputOptions:forKeyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4[0] = *MEMORY[0x1E0CC5668];
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
    v2 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4[1] = *MEMORY[0x1E0CC5658];
  v5[0] = v2;
  v5[1] = *(_QWORD *)(a1 + 48);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "player"), "_setOptions:onClosedCaptionLayer:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v8;
  void *v9;
  char v10;
  NSObject *configurationQueue;
  void (**v12)(_QWORD);
  uint64_t v13;
  void *v14;
  char v15;
  objc_super v16;
  _QWORD v17[6];
  char v18;
  _QWORD v19[6];
  char v20;

  if ((void *)AVPlayerLayerPlayerItemSubtitleDisplayEnabledObserverContext == a6)
  {
    v8 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    if (v8)
    {
      v9 = (void *)v8;
      if (v8 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      {
        v10 = objc_msgSend(v9, "BOOLValue");
        configurationQueue = self->_configurationQueue;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v19[3] = &unk_1E302FD10;
        v19[4] = self;
        v19[5] = a4;
        v20 = v10;
        v12 = (void (**)(_QWORD))v19;
LABEL_10:
        AVSerializeOnQueueAsyncIfNecessary(configurationQueue, v12);
      }
    }
  }
  else
  {
    if ((void *)AVPlayerLayerDisplayingClosedCaptionsChangedObserverContext != a6)
    {
      v16.receiver = self;
      v16.super_class = (Class)AVPlayerCaptionLayer;
      -[AVPlayerCaptionLayer observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
      return;
    }
    v13 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    if (v13)
    {
      v14 = (void *)v13;
      if (v13 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      {
        v15 = objc_msgSend(v14, "BOOLValue");
        configurationQueue = self->_configurationQueue;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v17[3] = &unk_1E302FD10;
        v17[4] = self;
        v17[5] = a4;
        v18 = v15;
        v12 = (void (**)(_QWORD))v17;
        goto LABEL_10;
      }
    }
  }
}

uint64_t __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(result + 40) == *(_QWORD *)(v1 + 88))
  {
    v2 = *(void **)(v1 + 32);
    if (v2)
      return objc_msgSend(v2, "updateNonForcedSubtitleDisplayEnabled:", *(unsigned __int8 *)(result + 48));
  }
  return result;
}

void __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[5];
  char v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(v1 + 88))
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    v2[3] = &unk_1E302FD38;
    v2[4] = v1;
    v3 = *(_BYTE *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v2);
  }
}

uint64_t __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 40), "setHidden:", *(_BYTE *)(result + 40) == 0);
  return result;
}

- (void)setCaptionContentInsets:(NSEdgeInsets)a3
{
  __int128 v4;
  FigSubtitleCALayer *subtitleLayer;
  _OWORD v6[4];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  *(CGFloat *)&v11 = a3.top;
  *((_QWORD *)&v11 + 1) = *(_QWORD *)&a3.left;
  *(CGFloat *)&v12 = a3.bottom;
  *((_QWORD *)&v12 + 1) = *(_QWORD *)&a3.right;
  v4 = v12;
  *(_OWORD *)&self->_legibleContentInsets.top = v11;
  *(_OWORD *)&self->_legibleContentInsets.bottom = v4;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  FigGeometryDimensionMake();
  FigGeometryDimensionMake();
  FigGeometryDimensionMake();
  FigGeometryDimensionMake();
  FigGeometryMarginsMake();
  subtitleLayer = self->_subtitleLayer;
  if (subtitleLayer)
  {
    v6[0] = v7;
    v6[1] = v8;
    v6[2] = v9;
    v6[3] = v10;
    -[FigSubtitleCALayer setCaptionsAvoidanceMargins:](subtitleLayer, "setCaptionsAvoidanceMargins:", v6);
  }
  -[AVPlayer _updateClosedCaptionLayerBounds:videoRelativeToViewport:captionsAvoidanceMargins:](-[AVPlayerCaptionLayer player](self, "player"), "_updateClosedCaptionLayerBounds:videoRelativeToViewport:captionsAvoidanceMargins:", self->_closedCaptionLayer, 0, &v11);
}

- (NSEdgeInsets)captionContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  top = self->_legibleContentInsets.top;
  left = self->_legibleContentInsets.left;
  bottom = self->_legibleContentInsets.bottom;
  right = self->_legibleContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setOverscanSubtitleSupportEnabled:(BOOL)a3
{
  -[FigSubtitleCALayer setOverscanSubtitleSupportEnabled:](self->_subtitleLayer, "setOverscanSubtitleSupportEnabled:", a3);
}

- (BOOL)isOverscanSubtitleSupportEnabled
{
  return -[FigSubtitleCALayer isOverscanSubtitleSupportEnabled](self->_subtitleLayer, "isOverscanSubtitleSupportEnabled");
}

- (id)_closedCaptionLayer
{
  return self->_closedCaptionLayer;
}

- (id)_subtitleLayer
{
  return self->_subtitleLayer;
}

- (id)_interstitialLayer
{
  NSObject *serialQueue;
  uint64_t v4;
  AVPlayerCaptionLayer *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[8];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__29;
  v19 = __Block_byref_object_dispose__29;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  serialQueue = self->_serialQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerCaptionLayer__interstitialLayer__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(serialQueue, block);
  if (!v16[5])
  {
    v5 = objc_alloc_init(AVPlayerCaptionLayer);
    -[AVPlayerCaptionLayer bounds](self, "bounds");
    -[AVPlayerCaptionLayer setFrame:](v5, "setFrame:");
    -[AVPlayerCaptionLayer setHidden:](v5, "setHidden:", 1);
    v6 = self->_serialQueue;
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __42__AVPlayerCaptionLayer__interstitialLayer__block_invoke_2;
    v9[3] = &unk_1E302FDD8;
    v9[4] = self;
    v9[5] = v5;
    v9[6] = &v15;
    v9[7] = &v11;
    dispatch_sync(v6, v9);
    -[AVPlayerCaptionLayer addSublayer:](self, "addSublayer:", v5);
    if (*((_BYTE *)v12 + 24))
      -[AVPlayerCaptionLayer _setShowInterstitialInstead:](self, "_setShowInterstitialInstead:", 1);
  }
  v7 = (id)v16[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

id __42__AVPlayerCaptionLayer__interstitialLayer__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __42__AVPlayerCaptionLayer__interstitialLayer__block_invoke_2(uint64_t a1)
{
  id result;
  uint64_t v3;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 80))
  {
    *(_BYTE *)(v3 + 80) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)_showInterstitialInstead
{
  NSObject *serialQueue;
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
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerCaptionLayer__showInterstitialInstead__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayerCaptionLayer__showInterstitialInstead__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)_setShowInterstitialInstead:(BOOL)a3
{
  NSObject *serialQueue;
  void (*v6)(_QWORD);
  void (*v7[6])(_QWORD);
  BOOL v8;
  _QWORD block[6];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  v16 = 0;
  serialQueue = self->_serialQueue;
  v6 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVPlayerCaptionLayer__setShowInterstitialInstead___block_invoke;
  block[3] = &unk_1E3031820;
  v10 = a3;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(serialQueue, block);
  if (v12[5])
  {
    v7[0] = v6;
    v7[1] = (void (*)(_QWORD))3221225472;
    v7[2] = __52__AVPlayerCaptionLayer__setShowInterstitialInstead___block_invoke_2;
    v7[3] = (void (*)(_QWORD))&unk_1E3031820;
    v8 = a3;
    v7[4] = (void (*)(_QWORD))self;
    v7[5] = (void (*)(_QWORD))&v11;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v7);
  }
  _Block_object_dispose(&v11, 8);
}

id __52__AVPlayerCaptionLayer__setShowInterstitialInstead___block_invoke(uint64_t a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = *(_BYTE *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __52__AVPlayerCaptionLayer__setShowInterstitialInstead___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("videoRect"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setHidden:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setHidden:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHidden:", *(_BYTE *)(a1 + 48) == 0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("videoRect"));

}

@end
