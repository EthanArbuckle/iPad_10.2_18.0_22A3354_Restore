@implementation AVSampleBufferDisplayLayer

- (void)_updateLayerTreeGeometryWithVideoGravity:(id)a3 presentationSize:(CGSize)a4 videoGravityShouldTriggerAnimation:(BOOL)a5
{
  void (*v6[6])(_QWORD);
  CGSize v7;
  BOOL v8;

  v6[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v6[1] = (void (*)(_QWORD))3221225472;
  v6[2] = (void (*)(_QWORD))__123__AVSampleBufferDisplayLayer__updateLayerTreeGeometryWithVideoGravity_presentationSize_videoGravityShouldTriggerAnimation___block_invoke;
  v6[3] = (void (*)(_QWORD))&unk_1E302FBA0;
  v7 = a4;
  v6[4] = (void (*)(_QWORD))self;
  v6[5] = (void (*)(_QWORD))a3;
  v8 = a5;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v6);
  -[AVSampleBufferDisplayLayer postVideoRectDidChangeNotification](self, "postVideoRectDidChangeNotification");
}

uint64_t __123__AVSampleBufferDisplayLayer__updateLayerTreeGeometryWithVideoGravity_presentationSize_videoGravityShouldTriggerAnimation___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v39;
  CATransform3D v40;
  CATransform3D v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  +[AVSampleBufferDisplayLayer _destRectForAspectRatio:](AVSampleBufferDisplayLayer, "_destRectForAspectRatio:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v8 = v7;
  v10 = v9;
  v11 = v6;
  v13 = v12;
  v14 = (v6 - v3) * 0.5;
  v15 = (v12 - v5) * 0.5;
  v16 = v12 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v6 == *MEMORY[0x1E0C9D820];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setHidden:", v16);
  memset(&v41, 0, sizeof(v41));
  CATransform3DMakeTranslation(&v41, v14, v15, 0.0);
  memset(&v40, 0, sizeof(v40));
  AVLayerTransformForPlacement(*(void **)(a1 + 40), 1, (uint64_t)&v40, v3, v5, v11, v13);
  memset(&v39, 0, sizeof(v39));
  a = v41;
  b = v40;
  CATransform3DConcat(&v39, &a, &b);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = (void *)objc_msgSend(*(id *)(a1 + 32), "animationKeys", 0);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v17);
        v23 = (void *)objc_msgSend(*(id *)(a1 + 32), "animationForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          v23 = 0;
        if (objc_msgSend((id)objc_msgSend(v23, "keyPath"), "hasPrefix:", CFSTR("bounds")))
          v20 = (id)objc_msgSend(v23, "copy");
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v20, "duration");
  if (v24 > 0.0 || *(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v20, "duration");
    v26 = v25;
    v27 = objc_msgSend(v20, "timingFunction");
    v28 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("sublayerTransform"));
    objc_msgSend(v28, "setDuration:", v26);
    objc_msgSend(v28, "setTimingFunction:", v27);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addAnimation:forKey:", v28, CFSTR("sublayerTransform"));
    v29 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
    objc_msgSend(v29, "setDuration:", v26);
    objc_msgSend(v29, "setTimingFunction:", v27);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addAnimation:forKey:", v29, CFSTR("position"));
    v30 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
    objc_msgSend(v30, "setDuration:", v26);
    objc_msgSend(v30, "setTimingFunction:", v27);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addAnimation:forKey:", v30, CFSTR("bounds"));
  }
  v31 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  a = v39;
  objc_msgSend(v31, "setSublayerTransform:", &a);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPosition:", v8 + v11 * 0.5, v10 + v13 * 0.5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setBounds:", v8, v10, v11, v13);
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_updatePresentationSize:(CGSize)a3
{
  double height;
  double width;
  NSObject *serialQueue;
  _QWORD block[7];
  CGSize v8;
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

  height = a3.height;
  width = a3.width;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__37;
  v13 = __Block_byref_object_dispose__37;
  serialQueue = self->_serialQueue;
  v14 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVSampleBufferDisplayLayer__updatePresentationSize___block_invoke;
  block[3] = &unk_1E30352B8;
  v8 = a3;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v16 + 24))
    -[AVSampleBufferDisplayLayer _updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:](self, "_updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:", v10[5], 0, width, height);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
}

uint64_t __54__AVSampleBufferDisplayLayer__updatePresentationSize___block_invoke(uint64_t result)
{
  uint64_t v2;

  if (*(double *)(*(_QWORD *)(result + 32) + 48) != *(double *)(result + 56)
    || *(double *)(*(_QWORD *)(result + 32) + 56) != *(double *)(result + 64))
  {
    v2 = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *(_OWORD *)(*(_QWORD *)(result + 32) + 48) = *(_OWORD *)(result + 56);
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40) = result;
  }
  return result;
}

+ (CGRect)_destRectForAspectRatio:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;
  CGRect v10;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (a3.width > 0.0 && a3.height > 0.0)
  {
    v10.size.width = 1600.0;
    v10.origin.x = 0.0;
    v10.origin.y = 0.0;
    v10.size.height = 1600.0;
    *(CGRect *)(&v5 - 2) = AVMakeRectWithAspectRatioInsideRect(a3, v10);
  }
  v7 = v3;
  v8 = v4;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (AVSampleBufferDisplayLayer)init
{
  AVSampleBufferDisplayLayer *v2;
  NSObject *v3;
  AVSampleBufferDisplayLayerContentLayer *v4;
  CGSize v5;
  AVSampleBufferVideoRenderer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVSampleBufferDisplayLayer;
  v2 = -[AVSampleBufferDisplayLayer init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferDisplayLayerQueue", v3);
    v4 = objc_alloc_init(AVSampleBufferDisplayLayerContentLayer);
    v2->_contentLayer = &v4->super;
    -[AVSampleBufferDisplayLayer addSublayer:](v2, "addSublayer:", v4);
    -[CALayer setEdgeAntialiasingMask:](v2->_contentLayer, "setEdgeAntialiasingMask:", 0);
    -[AVSampleBufferDisplayLayer setVideoGravity:](v2, "setVideoGravity:", CFSTR("AVLayerVideoGravityResizeAspect"));
    v2->_presentationSize = (CGSize)*MEMORY[0x1E0C9D820];
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v2->_bounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v2->_bounds.size = v5;
    -[CALayer setHidden:](v2->_contentLayer, "setHidden:", 1);
    -[CALayer setMasksToBounds:](v2->_contentLayer, "setMasksToBounds:", 1);
    v6 = (AVSampleBufferVideoRenderer *)-[AVSampleBufferDisplayLayer makeVideoRenderer](v2, "makeVideoRenderer");
    v2->_sampleBufferVideoRenderer = v6;
    if (v6)
    {
      -[AVSampleBufferVideoRenderer addSampleBufferDisplayLayer:](v6, "addSampleBufferDisplayLayer:", v2);
      -[AVSampleBufferDisplayLayer resetUpcomingSampleBufferPresentationTimeExpectations](v2, "resetUpcomingSampleBufferPresentationTimeExpectations");
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  NSObject *serialQueue;
  objc_super v4;

  -[AVSampleBufferVideoRenderer removeDisplayLayer](self->_sampleBufferVideoRenderer, "removeDisplayLayer");
  serialQueue = self->_serialQueue;
  if (serialQueue)
  {
    dispatch_release(serialQueue);
    self->_serialQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferDisplayLayer;
  -[AVSampleBufferDisplayLayer dealloc](&v4, sel_dealloc);
}

- (void)setControlTimebase:(CMTimebaseRef)controlTimebase
{
  -[AVSampleBufferVideoRenderer setControlTimebase:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "setControlTimebase:", controlTimebase);
}

- (CMTimebaseRef)controlTimebase
{
  return -[AVSampleBufferVideoRenderer controlTimebase](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "controlTimebase");
}

- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity
{
  NSObject *serialQueue;
  _QWORD v6[8];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0C9D820];
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AVSampleBufferDisplayLayer_setVideoGravity___block_invoke;
  v6[3] = &unk_1E302FDD8;
  v6[4] = self;
  v6[5] = videoGravity;
  v6[6] = &v7;
  v6[7] = &v12;
  dispatch_sync(serialQueue, v6);
  if (*((_BYTE *)v13 + 24))
    -[AVSampleBufferDisplayLayer _updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:](self, "_updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:", videoGravity, objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions") ^ 1, v8[4], v8[5]);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v12, 8);
}

__n128 __46__AVSampleBufferDisplayLayer_setVideoGravity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __n128 result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if ((v3 != 0) != (v2 == 0))
  {
    if ((objc_msgSend(v3, "isEqualToString:") & 1) != 0)
      return result;
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(*(id *)(a1 + 40), "copy");
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 48);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

- (AVLayerVideoGravity)videoGravity
{
  NSObject *serialQueue;
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
  v9 = __Block_byref_object_copy__37;
  v10 = __Block_byref_object_dispose__37;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVSampleBufferDisplayLayer_videoGravity__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__AVSampleBufferDisplayLayer_videoGravity__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isReadyForDisplay
{
  return -[AVSampleBufferVideoRenderer isReadyForDisplay](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "isReadyForDisplay");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferDisplayLayer;
  -[AVSampleBufferDisplayLayer setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AVSampleBufferDisplayLayer postVideoRectDidChangeNotification](self, "postVideoRectDidChangeNotification");
}

- (void)layoutSublayers
{
  NSObject *serialQueue;
  CALayer *STSLayer;
  _QWORD block[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVSampleBufferDisplayLayer;
  -[AVSampleBufferDisplayLayer layoutSublayers](&v17, sel_layoutSublayers);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__37;
  v15 = __Block_byref_object_dispose__37;
  v16 = 0;
  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x3010000000;
  v9 = &unk_1935931BF;
  v10 = *MEMORY[0x1E0C9D820];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AVSampleBufferDisplayLayer_layoutSublayers__block_invoke;
  block[3] = &unk_1E3031690;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v6;
  dispatch_sync(serialQueue, block);
  -[AVSampleBufferDisplayLayer _updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:](self, "_updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:", v12[5], 0, v7[4], v7[5]);

  STSLayer = self->_STSLayer;
  -[AVSampleBufferDisplayLayer bounds](self, "bounds");
  -[CALayer setFrame:](STSLayer, "setFrame:");
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v11, 8);
}

__n128 __45__AVSampleBufferDisplayLayer_layoutSublayers__block_invoke(_QWORD *a1)
{
  __n128 result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = objc_msgSend(*(id *)(a1[4] + 40), "copy");
  result = *(__n128 *)(a1[4] + 48);
  *(__n128 *)(*(_QWORD *)(a1[6] + 8) + 32) = result;
  return result;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferDisplayLayer;
  -[AVSampleBufferDisplayLayer layerDidBecomeVisible:](&v5, sel_layerDidBecomeVisible_);
  -[AVSampleBufferVideoRenderer setDisplayLayerVisibility:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "setDisplayLayerVisibility:", v3);
}

- (CGRect)videoRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *serialQueue;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD block[7];
  uint64_t v25;
  double *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  CGRect result;

  -[AVSampleBufferDisplayLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy__37;
  v34 = __Block_byref_object_dispose__37;
  v35 = 0;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x3010000000;
  v28 = &unk_1935931BF;
  v29 = *MEMORY[0x1E0C9D820];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AVSampleBufferDisplayLayer_videoRect__block_invoke;
  block[3] = &unk_1E3031690;
  block[4] = self;
  block[5] = &v25;
  block[6] = &v30;
  dispatch_sync(serialQueue, block);
  AVLayerVideoRectForPlayerLayerBoundsPresentationSizeAndVideoGravity((void *)v31[5], v4, v6, v8, v10, v26[4], v26[5]);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v30, 8);
  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

uint64_t __39__AVSampleBufferDisplayLayer_videoRect__block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_OWORD *)(*(_QWORD *)(a1[5] + 8) + 32) = *(_OWORD *)(a1[4] + 48);
  result = objc_msgSend(*(id *)(a1[4] + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)postVideoRectDidChangeNotification
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVSampleBufferDisplayLayerVideoRectDidChangeNotification"), self);
}

- (BOOL)setRenderSynchronizer:(id)a3 error:(id *)a4
{
  return -[AVSampleBufferVideoRenderer setRenderSynchronizer:error:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "setRenderSynchronizer:error:", a3, a4);
}

- (void)copyFigSampleBufferAudioRenderer:(OpaqueFigSampleBufferAudioRenderer *)a3
{
  if (a3)
    *a3 = 0;
}

- (void)setSTSLabel:(id)a3
{
  void (*v5[6])(_QWORD);

  if (-[AVSampleBufferDisplayLayer _STSLabel](self, "_STSLabel") != a3)
  {
    -[AVSampleBufferVideoRenderer setSTSLabel:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "setSTSLabel:", a3);
    v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v5[1] = (void (*)(_QWORD))3221225472;
    v5[2] = (void (*)(_QWORD))__42__AVSampleBufferDisplayLayer_setSTSLabel___block_invoke;
    v5[3] = (void (*)(_QWORD))&unk_1E302FCE8;
    v5[4] = (void (*)(_QWORD))a3;
    v5[5] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v5);
  }
}

uint64_t __42__AVSampleBufferDisplayLayer_setSTSLabel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
  if (v2)
  {
    if (!v3)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120) = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v4 = *(_QWORD **)(a1 + 40);
      v5 = (void *)v4[15];
      objc_msgSend(v4, "bounds");
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(*(id *)(a1 + 40), "addSublayer:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
    }
    objc_msgSend(v3, "setValue:forKeyPath:", v2, CFSTR("separatedOptions.STSLabel"));
  }
  else if (v3)
  {
    objc_msgSend(v3, "removeFromSuperlayer");

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120) = 0;
  }
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (id)_STSLabel
{
  return -[AVSampleBufferVideoRenderer _STSLabel](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "_STSLabel");
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[AVSampleBufferVideoRenderer setToneMapToStandardDynamicRange:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "setToneMapToStandardDynamicRange:", a3);
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferDisplayLayer;
  -[AVSampleBufferDisplayLayer setToneMapToStandardDynamicRange:](&v5, sel_setToneMapToStandardDynamicRange_, v3);
}

- (id)makeVideoRenderer
{
  return objc_alloc_init(AVSampleBufferVideoRenderer);
}

+ (id)keyPathsForValuesAffectingStatus
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("sampleBufferVideoRenderer.status"));
}

+ (id)keyPathsForValuesAffectingError
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("sampleBufferVideoRenderer.error"));
}

+ (id)keyPathsForValuesAffectingOutputObscuredDueToInsufficientExternalProtection
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("sampleBufferVideoRenderer.outputObscuredDueToInsufficientExternalProtection"));
}

- (BOOL)isReadyForMoreMediaData
{
  return -[AVSampleBufferVideoRenderer isReadyForMoreMediaData](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "isReadyForMoreMediaData");
}

- (AVQueuedSampleBufferRenderingStatus)status
{
  return -[AVSampleBufferVideoRenderer status](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "status");
}

- (NSError)error
{
  return -[AVSampleBufferVideoRenderer error](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "error");
}

- (id)_contentLayer
{
  return self->_contentLayer;
}

- (AVSampleBufferVideoRenderer)_sampleBufferVideoRenderer
{
  return self->_sampleBufferVideoRenderer;
}

- (BOOL)mayRequireContentKeysForMediaDataProcessing
{
  return 1;
}

- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  return -[AVSampleBufferVideoRenderer attachToContentKeySession:contentKeyBoss:failedSinceAlreadyAttachedToAnotherSession:](self->_sampleBufferVideoRenderer, "attachToContentKeySession:contentKeyBoss:failedSinceAlreadyAttachedToAnotherSession:", a3, a4, a5);
}

- (BOOL)_attachedToExternalContentKeySession
{
  return -[AVSampleBufferVideoRenderer attachedToExternalContentKeySession](self->_sampleBufferVideoRenderer, "attachedToExternalContentKeySession");
}

- (id)contentKeySession
{
  return -[AVSampleBufferVideoRenderer contentKeySession](self->_sampleBufferVideoRenderer, "contentKeySession");
}

- (CMTimebaseRef)timebase
{
  return -[AVSampleBufferVideoRenderer timebase](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "timebase");
}

- (void)enqueueSampleBuffer:(CMSampleBufferRef)sampleBuffer
{
  const opaqueCMFormatDescription *FormatDescription;
  CGSize PresentationDimensions;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[8];

  FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
  if (FormatDescription)
  {
    PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions(FormatDescription, 1u, 1u);
    -[AVSampleBufferDisplayLayer _updatePresentationSize:](self, "_updatePresentationSize:", 0, 0, *(_QWORD *)&PresentationDimensions.width, *(_QWORD *)&PresentationDimensions.height);
    +[AVSampleBufferDisplayLayer _destRectForAspectRatio:](AVSampleBufferDisplayLayer, "_destRectForAspectRatio:", PresentationDimensions.width, PresentationDimensions.height);
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = v9;
    v11[7] = v10;
    -[AVSampleBufferVideoRenderer enqueueSampleBuffer:bufferEnqueueingInfo:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "enqueueSampleBuffer:bufferEnqueueingInfo:", sampleBuffer, v11);
  }
}

- (void)flush
{
  -[AVSampleBufferVideoRenderer flush](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "flush");
}

- (void)flushAndRemoveImage
{
  -[AVSampleBufferVideoRenderer flushAndRemoveImage](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "flushAndRemoveImage");
}

- (void)flushWithRemovalOfDisplayedImage:(BOOL)a3 completionHandler:(id)a4
{
  -[AVSampleBufferVideoRenderer flushWithRemovalOfDisplayedImage:completionHandler:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "flushWithRemovalOfDisplayedImage:completionHandler:", a3, a4);
}

- (void)prerollDecodeWithCompletionHandler:(id)a3
{
  -[AVSampleBufferVideoRenderer prerollDecodeWithCompletionHandler:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "prerollDecodeWithCompletionHandler:", a3);
}

- (void)requestMediaDataWhenReadyOnQueue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  -[AVSampleBufferVideoRenderer requestMediaDataWhenReadyOnQueue:usingBlock:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "requestMediaDataWhenReadyOnQueue:usingBlock:", queue, block);
}

- (void)stopRequestingMediaData
{
  -[AVSampleBufferVideoRenderer stopRequestingMediaData](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "stopRequestingMediaData");
}

- (BOOL)hasSufficientMediaDataForReliablePlaybackStart
{
  return -[AVSampleBufferVideoRenderer hasSufficientMediaDataForReliablePlaybackStart](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "hasSufficientMediaDataForReliablePlaybackStart");
}

- (BOOL)requiresFlushToResumeDecoding
{
  return -[AVSampleBufferVideoRenderer requiresFlushToResumeDecoding](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "requiresFlushToResumeDecoding");
}

- (id)videoPerformanceMetrics
{
  return -[AVSampleBufferVideoRenderer videoPerformanceMetrics](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "videoPerformanceMetrics");
}

- (BOOL)outputObscuredDueToInsufficientExternalProtection
{
  return -[AVSampleBufferVideoRenderer outputObscuredDueToInsufficientExternalProtection](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "outputObscuredDueToInsufficientExternalProtection");
}

- (void)setPreventsCapture:(BOOL)preventsCapture
{
  -[AVSampleBufferVideoRenderer setPreventsCapture:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "setPreventsCapture:", preventsCapture);
}

- (BOOL)preventsCapture
{
  return -[AVSampleBufferVideoRenderer preventsCapture](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "preventsCapture");
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)preventsDisplaySleepDuringVideoPlayback
{
  -[AVSampleBufferVideoRenderer setPreventsDisplaySleepDuringVideoPlayback:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "setPreventsDisplaySleepDuringVideoPlayback:", preventsDisplaySleepDuringVideoPlayback);
}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
{
  return -[AVSampleBufferVideoRenderer preventsDisplaySleepDuringVideoPlayback](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "preventsDisplaySleepDuringVideoPlayback");
}

- (void)setPreventsAutomaticBackgroundingDuringVideoPlayback:(BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
{
  -[AVSampleBufferVideoRenderer setPreventsAutomaticBackgroundingDuringVideoPlayback:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "setPreventsAutomaticBackgroundingDuringVideoPlayback:", preventsAutomaticBackgroundingDuringVideoPlayback);
}

- (BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
{
  return -[AVSampleBufferVideoRenderer preventsAutomaticBackgroundingDuringVideoPlayback](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "preventsAutomaticBackgroundingDuringVideoPlayback");
}

- (void)_setDisallowsVideoLayerDisplayCompositing:(BOOL)a3
{
  -[AVSampleBufferVideoRenderer _setDisallowsVideoLayerDisplayCompositing:](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "_setDisallowsVideoLayerDisplayCompositing:", a3);
}

- (BOOL)_disallowsVideoLayerDisplayCompositing
{
  return -[AVSampleBufferVideoRenderer _disallowsVideoLayerDisplayCompositing](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "_disallowsVideoLayerDisplayCompositing");
}

- (void)expectMinimumUpcomingSampleBufferPresentationTime:(id *)a3
{
  AVSampleBufferVideoRenderer *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v4 = -[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer");
  v5 = *a3;
  -[AVSampleBufferVideoRenderer expectMinimumUpcomingSampleBufferPresentationTime:](v4, "expectMinimumUpcomingSampleBufferPresentationTime:", &v5);
}

- (void)expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes
{
  -[AVSampleBufferVideoRenderer expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes");
}

- (void)resetUpcomingSampleBufferPresentationTimeExpectations
{
  -[AVSampleBufferVideoRenderer resetUpcomingSampleBufferPresentationTimeExpectations](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "resetUpcomingSampleBufferPresentationTimeExpectations");
}

- (AVSampleBufferVideoOutput)output
{
  NSObject *serialQueue;
  NSArray *v4;
  AVSampleBufferVideoOutput *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__37;
  v12 = __Block_byref_object_dispose__37;
  v13 = 0;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__AVSampleBufferDisplayLayer_AVSampleBufferDisplayLayerOutput__output__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(serialQueue, v7);
  v4 = -[AVSampleBufferVideoRenderer outputs](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "outputs");
  if (-[NSArray containsObject:](v4, "containsObject:", v9[5]))
    v5 = (AVSampleBufferVideoOutput *)v9[5];
  else
    v5 = 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __70__AVSampleBufferDisplayLayer_AVSampleBufferDisplayLayerOutput__output__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 112);
  return result;
}

- (void)setOutput:(id)a3
{
  id v3;
  NSObject *serialQueue;
  AVSampleBufferVideoRenderer *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__37;
  v12 = __Block_byref_object_dispose__37;
  v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__AVSampleBufferDisplayLayer_AVSampleBufferDisplayLayerOutput__setOutput___block_invoke;
  block[3] = &unk_1E3035178;
  block[5] = self;
  block[6] = &v8;
  block[4] = a3;
  dispatch_sync(serialQueue, block);
  if ((id)v9[5] != v3)
  {
    v6 = -[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer");
    -[AVSampleBufferVideoRenderer removeOutput:](v6, "removeOutput:", v9[5]);
    -[AVSampleBufferVideoRenderer addOutput:](v6, "addOutput:", v3);
    v3 = (id)v9[5];
  }

  _Block_object_dispose(&v8, 8);
}

void __74__AVSampleBufferDisplayLayer_AVSampleBufferDisplayLayerOutput__setOutput___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 40) + 112);

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) = *(_QWORD *)(a1 + 32);
}

- (__CVBuffer)copyDisplayedPixelBuffer
{
  return -[AVSampleBufferVideoRenderer copyDisplayedPixelBuffer](-[AVSampleBufferDisplayLayer _sampleBufferVideoRenderer](self, "_sampleBufferVideoRenderer"), "copyDisplayedPixelBuffer");
}

- (BOOL)isDefunct
{
  return 0;
}

@end
