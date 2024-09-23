@implementation AVPlayerLayer

id __23__AVPlayerLayer_player__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 80);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  CGRect result;

  if (self->_playerLayer->showInterstitialInstead)
  {
    v17 = 0;
    -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v17);
    objc_msgSend(v17, "videoRect");
  }
  else
  {
    -[AVPlayerLayer bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[AVPlayerLayer _playerCurrentItemPresentationSize](self, "_playerCurrentItemPresentationSize");
    AVLayerVideoRectForPlayerLayerBoundsPresentationSizeAndVideoGravity(-[AVPlayerLayer videoGravity](self, "videoGravity"), v8, v10, v12, v14, v15, v16);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)layoutSublayers
{
  BOOL v3;
  double x;
  double y;
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  void (*v12)(_QWORD);
  void (*v13)(_QWORD);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  AVPlayer *v23;
  objc_super v24;
  void (*v25[16])(_QWORD);
  __int128 v26;
  __int128 v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  BOOL v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void (*v49)(_QWORD);
  void (*v50)(_QWORD);
  void (*v51)(_QWORD);
  void (*v52)(_QWORD);
  void (*v53)(_QWORD);
  CGRect v54;
  CGRect v55;

  v52 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v49 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", &v53, &v52, &v51, &v50, &v49);
  if (self->_playerLayer)
    v3 = v52 == 0;
  else
    v3 = 1;
  if (!v3)
  {
    -[AVPlayerLayer bounds](self, "bounds");
    x = v54.origin.x;
    y = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;
    v8 = fabs(CGRectGetMidX(v54));
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    v9 = fabs(CGRectGetMidY(v55));
    -[AVPlayerLayer _playerCurrentItemPresentationSize](self, "_playerCurrentItemPresentationSize");
    v11 = v10;
    v13 = v12;
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v45 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v46 = v14;
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v47 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v48 = v15;
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v41 = *MEMORY[0x1E0CD2610];
    v42 = v16;
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v43 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v44 = v17;
    v18 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v39 = *MEMORY[0x1E0C9D648];
    v40 = v18;
    AVLayerTransformForPlacement(-[AVPlayerLayer videoGravity](self, "videoGravity"), 0, (uint64_t)&v41, v10, *(double *)&v13, width, height);
    v19 = *(double *)(MEMORY[0x1E0C9D820] + 8) != *(double *)&v13 || *MEMORY[0x1E0C9D820] != v11;
    if (v19)
    {
      *(_QWORD *)&v39 = getVideoPresentationBounds(-[AVPlayerLayer videoGravity](self, "videoGravity", *MEMORY[0x1E0C9D820]), v11, *(double *)&v13, x, y, width, height);
      *((_QWORD *)&v39 + 1) = v20;
      *(_QWORD *)&v40 = v21;
      *((_QWORD *)&v40 + 1) = v22;
    }
    v25[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v25[1] = (void (*)(_QWORD))3221225472;
    v25[2] = (void (*)(_QWORD))__32__AVPlayerLayer_layoutSublayers__block_invoke;
    v25[3] = (void (*)(_QWORD))&unk_1E302FA80;
    v25[10] = *(void (**)(_QWORD))&x;
    v25[11] = *(void (**)(_QWORD))&y;
    v25[12] = *(void (**)(_QWORD))&width;
    v25[13] = *(void (**)(_QWORD))&height;
    v25[4] = (void (*)(_QWORD))self;
    v25[5] = v53;
    v25[6] = v49;
    v25[7] = v51;
    v38 = v19;
    v25[14] = *(void (**)(_QWORD))&v11;
    v25[15] = v13;
    v27 = v40;
    v26 = v39;
    v25[8] = v52;
    v25[9] = v50;
    v28 = v8;
    v29 = v9;
    v33 = v44;
    v32 = v43;
    v31 = v42;
    v30 = v41;
    v37 = v48;
    v36 = v47;
    v35 = v46;
    v34 = v45;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v25);
    v23 = -[AVPlayerLayer player](self, "player");
    -[AVPlayer _updateClosedCaptionLayerBounds:videoRelativeToViewport:captionsAvoidanceMargins:](v23, "_updateClosedCaptionLayerBounds:videoRelativeToViewport:captionsAvoidanceMargins:", v50, &v39, &self->_playerLayer->legibleContentInsets);
  }
  v24.receiver = self;
  v24.super_class = (Class)AVPlayerLayer;
  -[AVPlayerLayer layoutSublayers](&v24, sel_layoutSublayers);
}

- (AVLayerVideoGravity)videoGravity
{
  AVPlayerLayerInternal *playerLayer;
  NSString *videoGravity;
  NSObject *serialQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  const __CFString *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = CFSTR("AVLayerVideoGravityResizeAspect");
  playerLayer = self->_playerLayer;
  if (playerLayer->isPresentationLayer)
  {
    videoGravity = playerLayer->videoGravity;
    v12 = (const __CFString *)videoGravity;
  }
  else
  {
    serialQueue = playerLayer->serialQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __29__AVPlayerLayer_videoGravity__block_invoke;
    v6[3] = &unk_1E302FDB0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(serialQueue, v6);
    videoGravity = (NSString *)v8[5];
  }
  _Block_object_dispose(&v7, 8);
  return videoGravity;
}

- (void)_applyCurrentItemPresentationSizeChangeAndForceUpdate:(BOOL)a3
{
  void (*v5)(_QWORD);
  void (*v6)(_QWORD);
  void (*v7)(_QWORD);
  void (*v8)(_QWORD);
  void (*v9[8])(_QWORD);
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD);

  -[AVPlayerLayer _playerCurrentItemPresentationSize](self, "_playerCurrentItemPresentationSize");
  v6 = v5;
  v8 = v7;
  v12 = 0;
  v13 = 0;
  v11 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, &v13, &v12, &v11, 0);
  v9[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v9[1] = (void (*)(_QWORD))3221225472;
  v9[2] = (void (*)(_QWORD))__71__AVPlayerLayer__applyCurrentItemPresentationSizeChangeAndForceUpdate___block_invoke;
  v9[3] = (void (*)(_QWORD))&unk_1E302FBA0;
  v9[6] = v6;
  v9[7] = v8;
  v10 = a3;
  v9[4] = v13;
  v9[5] = (void (*)(_QWORD))self;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v9);
  -[AVPlayerLayer _notifyPlayerOfDisplaySize](self, "_notifyPlayerOfDisplaySize");
}

- (void)_getMaskLayer:(id *)a3 videoLayer:(id *)a4 subtitleLayer:(id *)a5 closedCaptionLayer:(id *)a6 interstitialLayer:(id *)a7
{
  NSObject *serialQueue;
  _QWORD v13[10];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;

  v38 = 0;
  v39 = &v38;
  v40 = 0x3052000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  serialQueue = self->_playerLayer->serialQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__AVPlayerLayer__getMaskLayer_videoLayer_subtitleLayer_closedCaptionLayer_interstitialLayer___block_invoke;
  v13[3] = &unk_1E302FE28;
  v13[4] = self;
  v13[5] = &v38;
  v13[6] = &v32;
  v13[7] = &v26;
  v13[8] = &v20;
  v13[9] = &v14;
  dispatch_sync(serialQueue, v13);
  if (a3)
    *a3 = (id)v39[5];
  if (a4)
    *a4 = (id)v33[5];
  if (a5)
    *a5 = (id)v27[5];
  if (a6)
    *a6 = (id)v21[5];
  if (a7)
    *a7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)_notifyPlayerOfDisplaySize
{
  -[AVPlayer _evaluateDisplaySizeOfAllAttachedLayers](-[AVPlayerLayer player](self, "player"), "_evaluateDisplaySizeOfAllAttachedLayers");
}

- (CGSize)_playerCurrentItemPresentationSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVPlayer _cachedPresentationSizeOfCurrentItem](-[AVPlayerLayer player](self, "player"), "_cachedPresentationSizeOfCurrentItem");
  result.height = v3;
  result.width = v2;
  return result;
}

- (AVPlayer)player
{
  AVPlayerLayerInternal *playerLayer;
  AVPlayer *v3;
  NSObject *serialQueue;
  AVPlayer *v5;
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
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  playerLayer = self->_playerLayer;
  if (playerLayer->isPresentationLayer)
  {
    v3 = playerLayer->player;
    v9[5] = (uint64_t)v3;
  }
  else
  {
    serialQueue = playerLayer->serialQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __23__AVPlayerLayer_player__block_invoke;
    v7[3] = &unk_1E302FD60;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(serialQueue, v7);
    v3 = (AVPlayer *)v9[5];
  }
  v5 = v3;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (CGSize)_displaySize
{
  AVPlayerLayerInternal *playerLayer;
  double v4;
  double screenScale;
  double v6;
  double b;
  double a;
  double d;
  double c;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  CGSize result;

  playerLayer = self->_playerLayer;
  if (playerLayer->honorContentScale)
  {
    -[AVPlayerLayer contentsScale](self, "contentsScale");
    screenScale = v4;
  }
  else
  {
    screenScale = playerLayer->screenScale;
  }
  if (-[AVPlayerLayer context](self, "context"))
  {
    v6 = 1.0;
    if (screenScale >= 1.0)
      v6 = screenScale;
    CGAffineTransformMakeScale(&v21, v6, v6);
    a = v21.a;
    b = v21.b;
    c = v21.c;
    d = v21.d;
    -[AVPlayerLayer bounds](self, "bounds");
    -[AVPlayerLayer convertRect:toLayer:](self, "convertRect:toLayer:", 0);
  }
  else
  {
    a = *MEMORY[0x1E0C9BAA8];
    b = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
    c = *(double *)(MEMORY[0x1E0C9BAA8] + 16);
    d = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
    -[AVPlayerLayer bounds](self, "bounds");
  }
  v13 = c * v12 + a * v11;
  v14 = d * v12 + b * v11;
  -[AVPlayerLayer _playerCurrentItemPresentationSize](self, "_playerCurrentItemPresentationSize");
  v17 = v14 > v13 && v16 < v15;
  if (!v17 && (v14 < v13 ? (v18 = v16 <= v15) : (v18 = 1), v18))
  {
    v19 = v14;
    v14 = v13;
  }
  else
  {
    v19 = v13;
  }
  v20 = v14;
  result.height = v19;
  result.width = v20;
  return result;
}

_QWORD *__71__AVPlayerLayer__applyCurrentItemPresentationSizeChangeAndForceUpdate___block_invoke(uint64_t a1)
{
  _OWORD *v2;
  double v3;
  double v4;
  _BOOL4 v6;
  double v7;
  double v8;
  _QWORD *result;
  uint64_t v10;
  BOOL v11;

  v2 = (_OWORD *)(a1 + 48);
  v4 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*(double *)(a1 + 48) == *MEMORY[0x1E0C9D820] && *(double *)(a1 + 56) == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v6 = v8 == v3 && v7 == v4;
  }
  else
  {
    v6 = 0;
  }
  result = *(_QWORD **)(a1 + 40);
  v10 = result[4];
  if (*(_BYTE *)(a1 + 64)
    || (*(double *)(v10 + 208) == *(double *)(a1 + 48)
      ? (v11 = *(double *)(v10 + 216) == *(double *)(a1 + 56))
      : (v11 = 0),
        !v11))
  {
    *(_OWORD *)(v10 + 208) = *v2;
    result = *(_QWORD **)(a1 + 40);
    return (_QWORD *)objc_msgSend(result, "setNeedsLayout");
  }
  if (v6)
    return (_QWORD *)objc_msgSend(result, "setNeedsLayout");
  return result;
}

uint64_t __32__AVPlayerLayer_layoutSublayers__block_invoke(uint64_t a1)
{
  double *v2;
  double *v3;
  void *v4;
  int v5;
  double VideoPresentationBounds;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  double MidX;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _OWORD v25[8];
  CGRect v26;
  CGRect v27;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v2 = (double *)(a1 + 96);
  v3 = (double *)(a1 + 104);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 248), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v4 = *(void **)(a1 + 56);
  if (v4)
  {
    if (*(_BYTE *)(a1 + 304))
    {
      objc_msgSend(v4, "setVideosize:", *(double *)(a1 + 112), *(double *)(a1 + 120));
      objc_msgSend(*(id *)(a1 + 56), "setVideoRelativeToViewport:", *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152));
      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "setViewport:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  v5 = *(unsigned __int8 *)(a1 + 304);
  if (*(_BYTE *)(a1 + 304))
  {
    v2 = (double *)(a1 + 112);
    v3 = (double *)(a1 + 120);
    VideoPresentationBounds = getVideoPresentationBounds(CFSTR("AVLayerVideoGravityResizeAspect"), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    VideoPresentationBounds = *(double *)(a1 + 80);
    v8 = *(double *)(a1 + 88);
    v10 = *(double *)(a1 + 96);
    v12 = *(double *)(a1 + 104);
  }
  v13 = v5 == 0;
  v14 = v5 != 0;
  v15 = v13;
  objc_msgSend(*(id *)(a1 + 64), "setHidden:", v15);
  objc_msgSend(*(id *)(a1 + 64), "setShouldResizeVideoLayer:", v14);
  objc_msgSend(*(id *)(a1 + 64), "setBounds:", 0.0, 0.0, *v2, *v3);
  objc_msgSend(*(id *)(a1 + 64), "setNeedsLayout");
  v16 = *(void **)(a1 + 72);
  v26.origin.x = VideoPresentationBounds;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  MidX = CGRectGetMidX(v26);
  v27.origin.x = VideoPresentationBounds;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  objc_msgSend(v16, "setPosition:", MidX, CGRectGetMidY(v27));
  objc_msgSend(*(id *)(a1 + 72), "setBounds:", VideoPresentationBounds, v8, v10, v12);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8), "setBounds:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 64), "setPosition:", *(double *)(a1 + 160), *(double *)(a1 + 168));
  v18 = *(void **)(a1 + 64);
  v19 = *(_OWORD *)(a1 + 256);
  v25[4] = *(_OWORD *)(a1 + 240);
  v25[5] = v19;
  v20 = *(_OWORD *)(a1 + 288);
  v25[6] = *(_OWORD *)(a1 + 272);
  v25[7] = v20;
  v21 = *(_OWORD *)(a1 + 192);
  v25[0] = *(_OWORD *)(a1 + 176);
  v25[1] = v21;
  v22 = *(_OWORD *)(a1 + 224);
  v25[2] = *(_OWORD *)(a1 + 208);
  v25[3] = v22;
  objc_msgSend(v18, "setSublayerTransform:", v25);
  if (objc_msgSend(*(id *)(a1 + 32), "isLanczosFilterDownscalingEnabled"))
  {
    v23 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_videoLayer"), "sublayers"), "firstObject");
    objc_msgSend(v23, "setMinificationFilter:", *MEMORY[0x1E0CD2B98]);
  }
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (BOOL)isLanczosFilterDownscalingEnabled
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
  serialQueue = self->_playerLayer->serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerLayer_isLanczosFilterDownscalingEnabled__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __93__AVPlayerLayer__getMaskLayer_videoLayer_subtitleLayer_closedCaptionLayer_interstitialLayer___block_invoke(_QWORD *a1)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 32) + 120);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 32) + 128);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 32) + 136);
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 32) + 144);
  result = *(id *)(*(_QWORD *)(a1[4] + 32) + 152);
  *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40) = result;
  return result;
}

uint64_t __41__AVPlayerLayer__isPartOfForegroundScene__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32)
                                                                            + 192);
  return result;
}

- (void)setPlayer:(AVPlayer *)player
{
  -[AVPlayerLayer _setPlayer:forPIP:](self, "_setPlayer:forPIP:", player, 0);
}

uint64_t __50__AVPlayerLayer_isLanczosFilterDownscalingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32)
                                                                            + 104);
  return result;
}

id __29__AVPlayerLayer_videoGravity__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 88);
  if (result)
  {
    result = (id)objc_msgSend(result, "copyWithZone:", 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

uint64_t __52__AVPlayerLayer__willManageSublayersAsSwappedLayers__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32)
                                                                            + 176);
  return result;
}

id __43__AVPlayerLayer__associatedRemoteModeLayer__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 168);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __21__AVPlayerLayer_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "hasEnqueuedVideoFrameChanged:", a2);
}

- (void)dealloc
{
  AVPlayerLayerInternal *playerLayer;
  AVPlayerLayerInternal *v4;
  AVPlayerLayerInternal *v5;
  AVPlayerLayerInternal *v6;
  NSObject *serialQueue;
  NSObject *configurationQueue;
  objc_super v9;

  playerLayer = self->_playerLayer;
  if (playerLayer)
  {

    v4 = self->_playerLayer;
    if (v4->playerBeingObserved)
    {
      -[AVPlayerLayer _stopObservingPlayer:](self, "_stopObservingPlayer:");
      v4 = self->_playerLayer;
    }
    if (v4->playerItemHasEnqueuedVideoFrameListener)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_playerLayer->playerItemHasEnqueuedVideoFrameListener);

      v4 = self->_playerLayer;
    }
    if (v4->windowSceneDidEnterBackgroundListener)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_playerLayer->windowSceneDidEnterBackgroundListener);

      v4 = self->_playerLayer;
    }
    if (v4->windowSceneWillEnterForegroundListener)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_playerLayer->windowSceneWillEnterForegroundListener);

      v4 = self->_playerLayer;
    }
    -[AVKeyPathDependencyManager cancelAllCallbacks](v4->dependencyManager, "cancelAllCallbacks");

    v5 = self->_playerLayer;
    if (!v5->isPresentationLayer)
    {
      -[AVPlayer _removeLayer:videoLayer:closedCaptionLayer:subtitleLayer:interstitialLayer:](v5->player, "_removeLayer:videoLayer:closedCaptionLayer:subtitleLayer:interstitialLayer:", 0, v5->videoLayer, v5->closedCaptionLayer, v5->subtitleLayer, v5->interstitialLayer);
      -[AVPlayer _updateConnectionToSecondScreen](self->_playerLayer->player, "_updateConnectionToSecondScreen");
      v5 = self->_playerLayer;
    }

    v6 = self->_playerLayer;
    if (!v6->isPresentationLayer)
    {
      -[AVPlayerLayer removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("contentsAreFlipped"));
      v6 = self->_playerLayer;
    }
    serialQueue = v6->serialQueue;
    if (serialQueue)
    {
      dispatch_release(serialQueue);
      v6 = self->_playerLayer;
    }
    if (v6->isReadyForDisplayMutex)
    {
      FigSimpleMutexDestroy();
      v6 = self->_playerLayer;
    }
    configurationQueue = v6->configurationQueue;
    if (configurationQueue)
    {
      dispatch_release(configurationQueue);
      v6 = self->_playerLayer;
    }

    CFRelease(self->_playerLayer);
  }
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerLayer;
  -[AVPlayerLayer dealloc](&v9, sel_dealloc);
}

uint64_t __35__AVPlayerLayer__setPlayer_forPIP___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopObservingPlayer:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_startObservingPlayer:", *(_QWORD *)(a1 + 48));
}

- (void)_stopObservingPlayer:(id)a3
{
  AVPlayer *playerBeingObserved;

  if (a3)
  {
    playerBeingObserved = self->_playerLayer->playerBeingObserved;
    if (playerBeingObserved)
    {

      self->_playerLayer->playerBeingObserved = 0;
      -[AVSinkSubscriber cancel](self->_playerLayer->playerCurrentItemSink, "cancel");

      self->_playerLayer->playerCurrentItemSink = 0;
      -[AVSinkSubscriber cancel](self->_playerLayer->currentItemPresentationSizeSink, "cancel");

      self->_playerLayer->currentItemPresentationSizeSink = 0;
      -[AVSinkSubscriber cancel](self->_playerLayer->currentItemTracksSink, "cancel");

      self->_playerLayer->currentItemTracksSink = 0;
      -[AVSinkSubscriber cancel](self->_playerLayer->currentItemNonForcedSubtitlesEnabledSink, "cancel");

      self->_playerLayer->currentItemNonForcedSubtitlesEnabledSink = 0;
      -[AVSinkSubscriber cancel](self->_playerLayer->playerIsDisplayingClosedCaptionsSink, "cancel");

      self->_playerLayer->playerIsDisplayingClosedCaptionsSink = 0;
    }
  }
}

void *__67__AVPlayerLayer__handleIsDisplayingClosedCaptionsDidChange_player___block_invoke_2(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "setHidden:", *(unsigned __int8 *)(a1 + 40) == 0);
  return result;
}

uint64_t __41__AVPlayerLayer__showInterstitialInstead__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32)
                                                                            + 193);
  return result;
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
  -[AVPlayerLayer bounds](self, "bounds");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer setBounds:](&v8, sel_setBounds_, x, y, width, height);
    -[AVPlayerLayer setNeedsLayout](self, "setNeedsLayout");
    -[AVPlayerLayer _notifyPlayerOfDisplaySize](self, "_notifyPlayerOfDisplaySize");
  }
}

+ (AVPlayerLayer)playerLayerWithPlayer:(AVPlayer *)player
{
  AVPlayerLayer *v4;

  v4 = objc_alloc_init(AVPlayerLayer);
  -[AVPlayerLayer setPlayer:](v4, "setPlayer:", player);
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void (*v7)(_QWORD);
  objc_super v8;
  void (*v9[6])(_QWORD);

  if (a6 == CFSTR("AVPlayerLayerContentsAreFlippedObservationContext"))
  {
    v7 = -[AVPlayerLayer _videoLayer](self, "_videoLayer", a3, a4, a5);
    v9[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v9[1] = (void (*)(_QWORD))3221225472;
    v9[2] = (void (*)(_QWORD))__64__AVPlayerLayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v9[3] = (void (*)(_QWORD))&unk_1E302FCE8;
    v9[4] = (void (*)(_QWORD))self;
    v9[5] = v7;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v9);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __64__AVPlayerLayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(*(id *)(a1 + 40), "setGeometryFlipped:", objc_msgSend(*(id *)(a1 + 32), "contentsAreFlipped") ^ 1);
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (id)_closedCaptionLayer
{
  void *v3;

  v3 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, &v3, 0);
  return v3;
}

- (id)_videoLayer
{
  void *v3;

  v3 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, &v3, 0, 0, 0);
  return v3;
}

- (void)_handlePlayerCurrentItemDidChangeForPlayer:(id)a3
{
  void (*v4)(_QWORD);
  void (*v5[5])(_QWORD);

  v4 = -[AVPlayerLayer _subtitleLayer](self, "_subtitleLayer", a3);
  if (v4)
  {
    v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v5[1] = (void (*)(_QWORD))3221225472;
    v5[2] = (void (*)(_QWORD))__60__AVPlayerLayer__handlePlayerCurrentItemDidChangeForPlayer___block_invoke;
    v5[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v5[4] = v4;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v5);
  }
  -[AVPlayerLayer _updateReadyForDisplayForPlayerCurrentItem](self, "_updateReadyForDisplayForPlayerCurrentItem");
  -[AVNetworkPlaybackPerfHUDLayer currentItemChanged](self->_playerLayer->hudLayer, "currentItemChanged");
}

void *__65__AVPlayerLayer__handleNonForcedSubtitleDisplayDidChange_player___block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "_subtitleLayer");
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 200) && result != 0)
    return (void *)objc_msgSend(result, "updateNonForcedSubtitleDisplayEnabled:", *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (id)_subtitleLayer
{
  void *v3;

  v3 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, &v3, 0, 0);
  return v3;
}

uint64_t __60__AVPlayerLayer__handlePlayerCurrentItemDidChangeForPlayer___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(*(id *)(a1 + 32), "clear");
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
  -[AVKeyPathDependencyManager addCallbackToCancel:](self->_playerLayer->dependencyManager, "addCallbackToCancel:", a3);
}

uint64_t __45__AVPlayerLayer__setIsPartOfForegroundScene___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 192) != v2)
    *(_BYTE *)(v1 + 192) = v2;
  return result;
}

- (void)_setPlayer:(id)a3 forPIP:(BOOL)a4
{
  AVPlayerLayerInternal *playerLayer;
  id v8;
  AVPlayerLayerInternal *v9;
  NSObject *serialQueue;
  uint64_t v11;
  uint64_t v12;
  NSObject *configurationQueue;
  _QWORD v14[5];
  _QWORD block[6];

  playerLayer = self->_playerLayer;
  if (!playerLayer->isPresentationLayer && playerLayer->player != a3)
  {
    if (!a4 && -[AVPlayerLayer _showInterstitialInstead](self, "_showInterstitialInstead"))
      -[AVPlayerLayer _setShowInterstitialInstead:](self, "_setShowInterstitialInstead:", 0);
    v8 = -[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer");
    if (v8)
    {
      if (!-[AVPlayerLayer _activeMode](self, "_activeMode"))
        -[AVPlayerLayer _configurePlayerWhenLeavingPIP](self, "_configurePlayerWhenLeavingPIP");
      +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:andPlayerLayer:](AVPlayerLayer, "_swapSublayersBetweenPlayerLayer:andPlayerLayer:", self, v8);
    }
    v9 = self->_playerLayer;
    if (v9->player)
    {
      -[AVPlayerLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("readyForDisplay"));
      MEMORY[0x194033BF8](self->_playerLayer->isReadyForDisplayMutex);
      self->_playerLayer->isReadyForDisplay = 0;
      MEMORY[0x194033C04](self->_playerLayer->isReadyForDisplayMutex);
      -[AVPlayerLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("readyForDisplay"));
      v9 = self->_playerLayer;
    }
    -[AVNetworkPlaybackPerfHUDLayer setPlayer:](v9->hudLayer, "setPlayer:", a3);
    if (!a4)
      -[AVPlayer _removeLayer:](self->_playerLayer->player, "_removeLayer:", self);
    -[AVPlayer _updateConnectionToSecondScreen](self->_playerLayer->player, "_updateConnectionToSecondScreen");
    serialQueue = self->_playerLayer->serialQueue;
    v11 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__AVPlayerLayer__setPlayer_forPIP___block_invoke;
    block[3] = &unk_1E302FCE8;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(serialQueue, block);
    v12 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AVPlayerLayerPlayerDidChangeNotification"), self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v12);
    if (!-[AVPlayerLayer _willManageSublayersAsSwappedLayers](self, "_willManageSublayersAsSwappedLayers"))
    {
      -[AVPlayerLayer _applyCurrentItemPresentationSizeChangeAndForceUpdate:](self, "_applyCurrentItemPresentationSizeChangeAndForceUpdate:", 0);
      configurationQueue = self->_playerLayer->configurationQueue;
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __35__AVPlayerLayer__setPlayer_forPIP___block_invoke_3;
      v14[3] = &unk_1E302FA10;
      v14[4] = self;
      dispatch_async(configurationQueue, v14);
    }
    if (!a4)
      -[AVPlayer _addLayer:](self->_playerLayer->player, "_addLayer:", self);
    -[AVPlayer _updateConnectionToSecondScreen](self->_playerLayer->player, "_updateConnectionToSecondScreen");
    -[AVPlayerLayer _notifyPlayerOfDisplaySize](self, "_notifyPlayerOfDisplaySize");
    if (v8)
    {
      +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:andPlayerLayer:](AVPlayerLayer, "_swapSublayersBetweenPlayerLayer:andPlayerLayer:", self, v8);
      objc_msgSend(v8, "_setPlayer:forPIP:", a3, 1);
      if (!-[AVPlayerLayer _activeMode](self, "_activeMode"))
        -[AVPlayerLayer _configurePlayerWhenEnteringPIP](self, "_configurePlayerWhenEnteringPIP");
    }
  }
}

- (BOOL)_showInterstitialInstead
{
  AVPlayerLayerInternal *playerLayer;
  int showInterstitialInstead;
  NSObject *serialQueue;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  playerLayer = self->_playerLayer;
  if (playerLayer->isPresentationLayer)
  {
    showInterstitialInstead = playerLayer->showInterstitialInstead;
    v11 = showInterstitialInstead;
  }
  else
  {
    serialQueue = playerLayer->serialQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__AVPlayerLayer__showInterstitialInstead__block_invoke;
    v7[3] = &unk_1E302FD60;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(serialQueue, v7);
    showInterstitialInstead = *((unsigned __int8 *)v9 + 24);
  }
  v5 = showInterstitialInstead != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)_isConnectedToSecondScreen
{
  return self->_playerLayer->isConnectedToSecondScreen;
}

- (AVPlayerLayer)init
{
  AVPlayerLayer *v2;
  AVPlayerLayerInternal *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  AVNetworkPlaybackPerfHUDLayer *hudLayer;
  _OWORD *p_top;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[5];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AVPlayerLayer;
  v2 = -[AVPlayerLayer init](&v22, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVPlayerLayerInternal);
    v2->_playerLayer = v3;
    if (v3)
    {
      CFRetain(v3);
      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_playerLayer->serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVPlayerLayerQueue", v4);
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_playerLayer->configurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.playerlayer.configuration", v5);
      v2->_playerLayer->maskLayer = (FigBaseCALayer *)objc_alloc_init(AVPlayerLayerIntermediateLayer);
      -[FigBaseCALayer setEdgeAntialiasingMask:](v2->_playerLayer->maskLayer, "setEdgeAntialiasingMask:", 0);
      -[FigBaseCALayer setMasksToBounds:](v2->_playerLayer->maskLayer, "setMasksToBounds:", 1);
      -[AVPlayerLayer addSublayer:](v2, "addSublayer:", v2->_playerLayer->maskLayer);
      v2->_playerLayer->videoLayer = (FigVideoContainerLayer *)objc_alloc_init(MEMORY[0x1E0CC3258]);
      -[FigBaseCALayer addSublayer:](v2->_playerLayer->maskLayer, "addSublayer:", v2->_playerLayer->videoLayer);
      -[FigVideoContainerLayer setEdgeAntialiasingMask:](v2->_playerLayer->videoLayer, "setEdgeAntialiasingMask:", 0);
      -[AVPlayerLayer setVideoGravity:](v2, "setVideoGravity:", CFSTR("AVLayerVideoGravityResizeAspect"));
      v2->_playerLayer->subtitleLayer = (FigSubtitleCALayer *)objc_alloc_init(MEMORY[0x1E0CC3250]);
      -[FigBaseCALayer addSublayer:](v2->_playerLayer->maskLayer, "addSublayer:", v2->_playerLayer->subtitleLayer);
      -[FigSubtitleCALayer setEdgeAntialiasingMask:](v2->_playerLayer->subtitleLayer, "setEdgeAntialiasingMask:", 0);
      v2->_playerLayer->closedCaptionLayer = (FigBaseCALayer *)(id)objc_msgSend((id)objc_opt_class(), "makeClosedCaptionLayer");
      -[FigBaseCALayer setHidden:](v2->_playerLayer->closedCaptionLayer, "setHidden:", 1);
      -[FigBaseCALayer addSublayer:](v2->_playerLayer->maskLayer, "addSublayer:", v2->_playerLayer->closedCaptionLayer);
      -[FigBaseCALayer setEdgeAntialiasingMask:](v2->_playerLayer->closedCaptionLayer, "setEdgeAntialiasingMask:", 0);
      v2->_playerLayer->hudLayer = objc_alloc_init(AVNetworkPlaybackPerfHUDLayer);
      v6 = MEMORY[0x1E0C809B0];
      hudLayer = v2->_playerLayer->hudLayer;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __21__AVPlayerLayer_init__block_invoke;
      v21[3] = &unk_1E302FA10;
      v21[4] = v2;
      -[AVNetworkPlaybackPerfHUDLayer readHudSettingsAndCallCompletionHandler:](hudLayer, "readHudSettingsAndCallCompletionHandler:", v21);
      -[FigSubtitleCALayer setSubtitleGravityNonObscuring:](v2->_playerLayer->subtitleLayer, "setSubtitleGravityNonObscuring:", 1);
      v2->_playerLayer->isReadyForDisplayMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      v2->_playerLayer->isReadyForDisplay = 0;
      v2->_playerLayer->latestAppliedPresentationSize = (CGSize)*MEMORY[0x1E0C9D820];
      v2->_playerLayer->lanczosDownscalingEnabled = 0;
      v2->_playerLayer->lanczosDownscalingFactor = 2;
      p_top = (_OWORD *)&v2->_playerLayer->legibleContentInsets.top;
      v9 = *(_OWORD *)(MEMORY[0x1E0CB2990] + 16);
      *p_top = *MEMORY[0x1E0CB2990];
      p_top[1] = v9;
      *(_WORD *)&v2->_playerLayer->isLegibleDisplayEnabled = 1;
      -[FigVideoContainerLayer setHidden:](v2->_playerLayer->videoLayer, "setHidden:", 1);
      -[AVPlayerLayer addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, CFSTR("contentsAreFlipped"), 4, CFSTR("AVPlayerLayerContentsAreFlippedObservationContext"));
      objc_initWeak(&location, v2);
      v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __21__AVPlayerLayer_init__block_invoke_2;
      v18[3] = &unk_1E302FA38;
      objc_copyWeak(&v19, &location);
      v2->_playerLayer->playerItemHasEnqueuedVideoFrameListener = (id)objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", CFSTR("AVPlayerItemHasEnqueuedVideoFrameDidChangeNotification"), 0, 0, v18);
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __21__AVPlayerLayer_init__block_invoke_3;
      v16[3] = &unk_1E302FA38;
      objc_copyWeak(&v17, &location);
      v2->_playerLayer->windowSceneDidEnterBackgroundListener = (id)objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("UISceneDidEnterBackgroundNotification"), 0, 0, v16);
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __21__AVPlayerLayer_init__block_invoke_4;
      v14[3] = &unk_1E302FA38;
      objc_copyWeak(&v15, &location);
      v2->_playerLayer->windowSceneWillEnterForegroundListener = (id)objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", CFSTR("UISceneWillEnterForegroundNotification"), 0, 0, v14);
      v2->_playerLayer->isPartOfForegroundScene = -[AVPlayerLayer _currentWindowSceneIsForegroundDefault](v2, "_currentWindowSceneIsForegroundDefault");
      v2->_playerLayer->dependencyManager = -[AVKeyPathDependencyManager initWithDependencyHost:]([AVKeyPathDependencyManager alloc], "initWithDependencyHost:", v2);
      -[AVKeyPathDependencyManager dependencyHostIsFullyInitialized](v2->_playerLayer->dependencyManager, "dependencyHostIsFullyInitialized");
      v2->_playerLayer->screenScale = 1.0;
      v2->_playerLayer->honorContentScale = 0;
      if (sniffUIWindowOnce != -1)
        dispatch_once(&sniffUIWindowOnce, &__block_literal_global);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (BOOL)_currentWindowSceneIsForegroundDefault
{
  int lastWindowSceneEvent;

  lastWindowSceneEvent = self->_playerLayer->lastWindowSceneEvent;
  if (lastWindowSceneEvent)
    return lastWindowSceneEvent == 2;
  else
    return -[AVPlayerLayer context](self, "context") != 0;
}

- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity
{
  AVPlayerLayerInternal *playerLayer;
  NSObject *serialQueue;
  _QWORD v7[8];
  id v8;
  id *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  playerLayer = self->_playerLayer;
  if (!playerLayer->isPresentationLayer)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3052000000;
    v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    v13 = 0;
    serialQueue = playerLayer->serialQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__AVPlayerLayer_setVideoGravity___block_invoke;
    v7[3] = &unk_1E302FDD8;
    v7[4] = self;
    v7[5] = videoGravity;
    v7[6] = &v14;
    v7[7] = &v8;
    dispatch_sync(serialQueue, v7);
    if (*((_BYTE *)v15 + 24))
    {
      if ((objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions") & 1) == 0)
        objc_msgSend(v9[5], "addAnimation:forKey:", objc_msgSend(MEMORY[0x1E0CD2710], "animation"), CFSTR("sublayerTransform"));
      -[AVPlayerLayer setNeedsLayout](self, "setNeedsLayout");
    }

    _Block_object_dispose(&v8, 8);
  }
  objc_msgSend(-[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer"), "setVideoGravity:", videoGravity);
  v8 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v8);
  if (v8)
    objc_msgSend(v8, "setVideoGravity:", videoGravity);
  _Block_object_dispose(&v14, 8);
}

- (id)_associatedRemoteModeLayer
{
  NSObject *serialQueue;
  id v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  AVPlayerLayer *v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  serialQueue = self->_playerLayer->serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVPlayerLayer__associatedRemoteModeLayer__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(serialQueue, block);
  if (!v13[5])
  {
    if (-[AVPlayerLayer superlayer](self, "superlayer"))
    {
      v6 = objc_opt_class();
      -[AVPlayerLayer superlayer](self, "superlayer");
      if (v6 == objc_opt_class())
      {
        v7 = (void *)-[AVPlayerLayer superlayer](self, "superlayer");
        v10 = 0;
        objc_msgSend(v7, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v10);
        if (v10 == self)
        {
          v8 = (void *)objc_msgSend(v7, "_associatedRemoteModeLayer");
          if (v8)
          {
            v9 = (id)objc_msgSend(v8, "_interstitialLayer");
            v13[5] = (uint64_t)v9;
          }
        }
      }
    }
  }
  v4 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (void)addSublayer:(id)a3
{
  objc_super v5;

  if (!-[AVPlayerLayer _preventsChangesToSublayerHierarchy](self, "_preventsChangesToSublayerHierarchy")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5.receiver = self;
    v5.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer addSublayer:](&v5, sel_addSublayer_, a3);
  }
}

- (BOOL)_preventsChangesToSublayerHierarchy
{
  return self->_playerLayer->preventsChangesToSublayerHierarchy;
}

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("playerCurrentItemPresentationSize"), AVTwoPartKeyPathMake((uint64_t)CFSTR("player"), (uint64_t)CFSTR("cachedPresentationSizeOfCurrentItem")));
}

+ (id)makeClosedCaptionLayer
{
  return objc_alloc_init(AVPlayerLayerIntermediateLayer);
}

- (void)_startObservingPlayer:(id)a3
{
  AVSwitchToLatestPublisher *v5;
  AVSinkSubscriber *v6;
  uint64_t v7;
  AVSinkSubscriber *v8;
  uint64_t v9;
  AVSwitchToLatestPublisher *v10;
  AVSinkSubscriber *v11;
  AVSwitchToLatestPublisher *v12;
  AVSinkSubscriber *v13;
  uint64_t v14;
  AVSinkSubscriber *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id location[2];

  if (a3)
  {
    if (!self->_playerLayer->playerBeingObserved)
    {
      self->_playerLayer->playerBeingObserved = (AVPlayer *)a3;
      objc_initWeak(location, self);
      v5 = +[AVSwitchToLatestPublisher switchToLatestPublisherWithUpstream:](AVSwitchToLatestPublisher, "switchToLatestPublisherWithUpstream:", +[AVMapPublisher mapPublisherWithUpstream:transform:](AVMapPublisher, "mapPublisherWithUpstream:transform:", objc_msgSend(a3, "currentItemPublisher"), &__block_literal_global_164));
      v6 = [AVSinkSubscriber alloc];
      v7 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_2;
      v24[3] = &unk_1E302FC08;
      objc_copyWeak(&v25, location);
      self->_playerLayer->currentItemPresentationSizeSink = -[AVSinkSubscriber initWithPublisher:requestingInitialValue:sink:](v6, "initWithPublisher:requestingInitialValue:sink:", v5, 0, v24);
      -[AVPlayerLayer _applyCurrentItemPresentationSizeChangeAndForceUpdate:](self, "_applyCurrentItemPresentationSizeChangeAndForceUpdate:", 0);
      LODWORD(v5) = -[AVPlayerLayer _willManageSublayersAsSwappedLayers](self, "_willManageSublayersAsSwappedLayers");
      v8 = [AVSinkSubscriber alloc];
      v9 = objc_msgSend(a3, "currentItemPublisher");
      v22[0] = v7;
      v22[1] = 3221225472;
      v22[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_3;
      v22[3] = &unk_1E302FC30;
      objc_copyWeak(&v23, location);
      v22[4] = a3;
      self->_playerLayer->playerCurrentItemSink = -[AVSinkSubscriber initWithPublisher:requestingInitialValue:sink:](v8, "initWithPublisher:requestingInitialValue:sink:", v9, v5 ^ 1, v22);
      v10 = +[AVSwitchToLatestPublisher switchToLatestPublisherWithUpstream:](AVSwitchToLatestPublisher, "switchToLatestPublisherWithUpstream:", +[AVMapPublisher mapPublisherWithUpstream:transform:](AVMapPublisher, "mapPublisherWithUpstream:transform:", objc_msgSend(a3, "currentItemPublisher"), &__block_literal_global_169));
      v11 = [AVSinkSubscriber alloc];
      v20[0] = v7;
      v20[1] = 3221225472;
      v20[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_5;
      v20[3] = &unk_1E302FC78;
      objc_copyWeak(&v21, location);
      self->_playerLayer->currentItemTracksSink = -[AVSinkSubscriber initWithPublisher:requestingInitialValue:sink:](v11, "initWithPublisher:requestingInitialValue:sink:", v10, 1, v20);
      v12 = +[AVSwitchToLatestPublisher switchToLatestPublisherWithUpstream:](AVSwitchToLatestPublisher, "switchToLatestPublisherWithUpstream:", +[AVMapPublisher mapPublisherWithUpstream:transform:](AVMapPublisher, "mapPublisherWithUpstream:transform:", objc_msgSend(a3, "currentItemPublisher"), &__block_literal_global_171));
      v13 = [AVSinkSubscriber alloc];
      v18[0] = v7;
      v18[1] = 3221225472;
      v18[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_7;
      v18[3] = &unk_1E302FCC0;
      objc_copyWeak(&v19, location);
      v18[4] = a3;
      self->_playerLayer->currentItemNonForcedSubtitlesEnabledSink = -[AVSinkSubscriber initWithPublisher:requestingInitialValue:sink:](v13, "initWithPublisher:requestingInitialValue:sink:", v12, 1, v18);
      v14 = objc_msgSend(a3, "closedCaptionsDisplayPublisher");
      v15 = [AVSinkSubscriber alloc];
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_8;
      v16[3] = &unk_1E302FCC0;
      objc_copyWeak(&v17, location);
      v16[4] = a3;
      self->_playerLayer->playerIsDisplayingClosedCaptionsSink = -[AVSinkSubscriber initWithPublisher:requestingInitialValue:sink:](v15, "initWithPublisher:requestingInitialValue:sink:", v14, 1, v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(location);
    }
  }
}

- (BOOL)_willManageSublayersAsSwappedLayers
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
  serialQueue = self->_playerLayer->serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AVPlayerLayer__willManageSublayersAsSwappedLayers__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __39__AVPlayerLayer__startObservingPlayer___block_invoke_7(uint64_t a1, void *a2)
{
  id result;

  result = objc_loadWeak((id *)(a1 + 40));
  if (result)
    return (id)objc_msgSend(result, "_handleNonForcedSubtitleDisplayDidChange:player:", objc_msgSend(a2, "BOOLValue"), *(_QWORD *)(a1 + 32));
  return result;
}

id __39__AVPlayerLayer__startObservingPlayer___block_invoke_2(uint64_t a1)
{
  id result;

  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
    return (id)objc_msgSend(result, "_applyCurrentItemPresentationSizeChangeAndForceUpdate:", 0);
  return result;
}

- (void)_handleNonForcedSubtitleDisplayDidChange:(BOOL)a3 player:(id)a4
{
  NSObject *configurationQueue;
  void (*v5[6])(_QWORD);
  BOOL v6;

  configurationQueue = self->_playerLayer->configurationQueue;
  v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v5[1] = (void (*)(_QWORD))3221225472;
  v5[2] = (void (*)(_QWORD))__65__AVPlayerLayer__handleNonForcedSubtitleDisplayDidChange_player___block_invoke;
  v5[3] = (void (*)(_QWORD))&unk_1E302FD10;
  v5[4] = (void (*)(_QWORD))self;
  v5[5] = (void (*)(_QWORD))a4;
  v6 = a3;
  AVSerializeOnQueueAsyncIfNecessary(configurationQueue, v5);
}

_QWORD *__39__AVPlayerLayer__startObservingPlayer___block_invoke_5(uint64_t a1)
{
  _QWORD *result;

  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
    return (_QWORD *)objc_msgSend(*(id *)(result[4] + 8), "currentItemTracksChanged");
  return result;
}

- (void)_updateReadyForDisplayForPlayerCurrentItem
{
  void (*v3[5])(_QWORD);

  if (!self->_playerLayer->isPresentationLayer)
  {
    v3[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v3[1] = (void (*)(_QWORD))3221225472;
    v3[2] = (void (*)(_QWORD))__59__AVPlayerLayer__updateReadyForDisplayForPlayerCurrentItem__block_invoke;
    v3[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v3[4] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v3);
  }
  -[AVPlayerLayer _applyCurrentItemPresentationSizeChangeAndForceUpdate:](self, "_applyCurrentItemPresentationSizeChangeAndForceUpdate:", 1);
}

uint64_t __59__AVPlayerLayer__updateReadyForDisplayForPlayerCurrentItem__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  _BOOL4 v10;
  void *v11;

  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "player"), "currentItem"), "_hasEnqueuedVideoFrame");
  MEMORY[0x194033BF8](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = *(unsigned __int8 *)(v3 + 194);
  result = MEMORY[0x194033C04](*(_QWORD *)(v3 + 32));
  if (v4 != v2)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "superlayer");
    v7 = *(void **)(a1 + 32);
    if (v6
      && (objc_msgSend(v7, "superlayer"),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v7 = *(void **)(a1 + 32),
          (isKindOfClass & 1) != 0))
    {
      v9 = (void *)objc_msgSend(v7, "superlayer");
      v11 = 0;
      objc_msgSend(v9, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v11);
      v7 = *(void **)(a1 + 32);
      v10 = v11 == v7;
      if (v11 == v7)
      {
        objc_msgSend(v9, "willChangeValueForKey:", CFSTR("readyForDisplay"));
        v7 = *(void **)(a1 + 32);
      }
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v7, "willChangeValueForKey:", CFSTR("readyForDisplay"));
    MEMORY[0x194033BF8](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 194) = v2;
    MEMORY[0x194033C04](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 32));
    result = objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("readyForDisplay"));
    if (v10)
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "superlayer"), "didChangeValueForKey:", CFSTR("readyForDisplay"));
  }
  return result;
}

uint64_t __39__AVPlayerLayer__startObservingPlayer___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nonForcedSubtitleDisplayEnabledPublisher");
}

uint64_t __39__AVPlayerLayer__startObservingPlayer___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tracksPublisher");
}

uint64_t __39__AVPlayerLayer__startObservingPlayer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentationSizePublisher");
}

id __39__AVPlayerLayer__startObservingPlayer___block_invoke_3(uint64_t a1)
{
  id result;

  result = objc_loadWeak((id *)(a1 + 40));
  if (result)
    return (id)objc_msgSend(result, "_handlePlayerCurrentItemDidChangeForPlayer:", *(_QWORD *)(a1 + 32));
  return result;
}

id __39__AVPlayerLayer__startObservingPlayer___block_invoke_8(uint64_t a1, void *a2)
{
  id result;

  result = objc_loadWeak((id *)(a1 + 40));
  if (result)
    return (id)objc_msgSend(result, "_handleIsDisplayingClosedCaptionsDidChange:player:", objc_msgSend(a2, "BOOLValue"), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_handleIsDisplayingClosedCaptionsDidChange:(BOOL)a3 player:(id)a4
{
  NSObject *configurationQueue;
  void (*v5[6])(_QWORD);
  BOOL v6;

  configurationQueue = self->_playerLayer->configurationQueue;
  v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v5[1] = (void (*)(_QWORD))3221225472;
  v5[2] = __67__AVPlayerLayer__handleIsDisplayingClosedCaptionsDidChange_player___block_invoke;
  v5[3] = (void (*)(_QWORD))&unk_1E302FD10;
  v5[4] = (void (*)(_QWORD))self;
  v5[5] = (void (*)(_QWORD))a4;
  v6 = a3;
  AVSerializeOnQueueAsyncIfNecessary(configurationQueue, v5);
}

void __67__AVPlayerLayer__handleIsDisplayingClosedCaptionsDidChange_player___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[5];
  char v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_closedCaptionLayer");
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 200))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __67__AVPlayerLayer__handleIsDisplayingClosedCaptionsDidChange_player___block_invoke_2;
    v3[3] = &unk_1E302FD38;
    v3[4] = v2;
    v4 = *(_BYTE *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v3);
  }
}

uint64_t __21__AVPlayerLayer_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8), "hudEnabled");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8), "setPlayerLayer:");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8), "startDispatchTimer");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8), "currentItemChanged");
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8), "currentItemTracksChanged");
  }
  return result;
}

- (void)hasEnqueuedVideoFrameChanged:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[AVPlayer currentItem](-[AVPlayerLayer player](self, "player"), "currentItem")))-[AVPlayerLayer _updateReadyForDisplayForPlayerCurrentItem](self, "_updateReadyForDisplayForPlayerCurrentItem");
}

id __33__AVPlayerLayer_setVideoGravity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 88);
  if ((v3 != 0) == (v2 == 0))
    goto LABEL_4;
  if ((objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 88);
LABEL_4:

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 88) = objc_msgSend(*(id *)(a1 + 40), "copyWithZone:", 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 128);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

uint64_t __35__AVPlayerLayer__setPlayer_forPIP___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "player");
  return objc_msgSend(*(id *)(a1 + 32), "_applyCurrentItemPresentationSizeChangeAndForceUpdate:", 0);
}

id __38__AVPlayerLayer_pixelBufferAttributes__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 96);
  if (result)
  {
    result = (id)objc_msgSend(result, "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (void)removeAllAnimations
{
  AVPlayerLayerInternal *playerLayer;
  BOOL v4;
  objc_super v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v9 = 0;
  v10 = 0;
  v7 = 0;
  v8 = 0;
  v6 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", &v10, &v9, &v8, &v7, &v6);
  playerLayer = self->_playerLayer;
  if (playerLayer)
    v4 = v9 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    -[CALayer removeAllAnimations](playerLayer->placeholderContentLayerDuringPIPMode, "removeAllAnimations");
    objc_msgSend(v10, "removeAllAnimations");
    objc_msgSend(v9, "removeAllAnimations");
    objc_msgSend(v7, "removeAllAnimations");
    objc_msgSend(v8, "removeAllAnimations");
    objc_msgSend(v6, "removeAllAnimations");
  }
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerLayer;
  -[AVPlayerLayer removeAllAnimations](&v5, sel_removeAllAnimations);
}

- (NSDictionary)pixelBufferAttributes
{
  NSDictionary *v2;
  AVPlayerLayerInternal *playerLayer;
  NSObject *serialQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v2 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  playerLayer = self->_playerLayer;
  if (!playerLayer->isPresentationLayer)
  {
    serialQueue = playerLayer->serialQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__AVPlayerLayer_pixelBufferAttributes__block_invoke;
    v6[3] = &unk_1E302FDB0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(serialQueue, v6);
    v2 = (NSDictionary *)v8[5];
  }
  _Block_object_dispose(&v7, 8);
  return v2;
}

+ (id)keyPathsForValuesAffectingVideoRect
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("bounds"), CFSTR("videoGravity"), CFSTR("playerCurrentItemPresentationSize"), 0);
}

- (id)_interstitialLayer
{
  AVPlayerLayer *v3;
  NSObject *serialQueue;
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  void *v12;

  v12 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v12);
  if (!v12)
  {
    v3 = objc_alloc_init(AVPlayerLayer);
    -[AVPlayerLayer bounds](self, "bounds");
    -[AVPlayerLayer setFrame:](v3, "setFrame:");
    -[AVPlayerLayer setHidden:](v3, "setHidden:", 1);
    serialQueue = self->_playerLayer->serialQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__AVPlayerLayer__interstitialLayer__block_invoke;
    v7[3] = &unk_1E302FE00;
    v7[4] = self;
    v7[5] = v3;
    v7[6] = &v8;
    dispatch_sync(serialQueue, v7);
    -[AVPlayerLayer addSublayer:](self, "addSublayer:", v3);
    if (*((_BYTE *)v9 + 24))
      -[AVPlayerLayer _setShowInterstitialInstead:](self, "_setShowInterstitialInstead:", 1);
  }
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v12);
  v5 = v12;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)_currentWindowSceneIsForeground
{
  BOOL v3;
  void *v4;
  void *v5;

  v3 = -[AVPlayerLayer _currentWindowSceneIsForegroundDefault](self, "_currentWindowSceneIsForegroundDefault");
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)uiWindowClass, "_windowWithContextId:", objc_msgSend((id)-[AVPlayerLayer context](self, "context"), "contextId")), "windowScene");
  if (v4)
  {
    v5 = v4;
    return !objc_msgSend(v4, "activationState") || objc_msgSend(v5, "activationState") == 1;
  }
  return v3;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  AVPlayerLayerInternal *playerLayer;
  BOOL v6;
  uint64_t v7;
  void *v8;
  double v9;
  AVPlayerLayerInternal *v10;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v15 = 0;
  v16 = 0;
  v13 = 0;
  v14 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", &v16, &v15, &v14, &v13, 0);
  playerLayer = self->_playerLayer;
  if (playerLayer)
    v6 = v15 == 0;
  else
    v6 = 1;
  if (v6)
    goto LABEL_16;
  playerLayer->isVisible = v3;
  if (v3)
  {
    v7 = -[AVPlayerLayer context](self, "context");
    if (v7)
    {
      v8 = (void *)v7;
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_12:
        -[AVPlayerLayer _applyCurrentItemPresentationSizeChangeAndForceUpdate:](self, "_applyCurrentItemPresentationSizeChangeAndForceUpdate:", 0);
        goto LABEL_13;
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)uiWindowClass, "_windowWithContextId:", objc_msgSend(v8, "contextId")), "screen"), "scale");
    }
    else
    {
      v9 = 1.0;
    }
    self->_playerLayer->screenScale = v9;
    goto LABEL_12;
  }
  self->_playerLayer->screenScale = 1.0;
LABEL_13:
  -[AVPlayerLayer _updateIsPartOfForegroundScene](self, "_updateIsPartOfForegroundScene");
  v10 = self->_playerLayer;
  if (v10->screenScale < 1.0)
    v10->screenScale = 1.0;
  v11 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerLayerVisibilityDidChangeNotification"), self, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v11);
LABEL_16:
  v12.receiver = self;
  v12.super_class = (Class)AVPlayerLayer;
  -[AVPlayerLayer layerDidBecomeVisible:](&v12, sel_layerDidBecomeVisible_, v3);
}

- (void)_updateIsPartOfForegroundScene
{
  -[AVPlayerLayer _setIsPartOfForegroundScene:](self, "_setIsPartOfForegroundScene:", -[AVPlayerLayer _currentWindowSceneIsForeground](self, "_currentWindowSceneIsForeground"));
}

- (void)_setIsPartOfForegroundScene:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v5[5];
  BOOL v6;

  serialQueue = self->_playerLayer->serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerLayer__setIsPartOfForegroundScene___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  dispatch_sync(serialQueue, v5);
  -[AVPlayerLayer _notifyPlayerOfLayerForegroundStateChange](self, "_notifyPlayerOfLayerForegroundStateChange");
}

- (BOOL)isPIPModeEnabled
{
  return self->_playerLayer->isPIPModeEnabled;
}

- (void)_notifyPlayerOfLayerForegroundStateChange
{
  BOOL v3;
  AVPlayerLayerInternal *playerLayer;
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;

  v3 = -[AVPlayerLayer _isPartOfForegroundScene](self, "_isPartOfForegroundScene");
  playerLayer = self->_playerLayer;
  v5 = v3 || playerLayer->lastWindowSceneEvent == 0;
  if (playerLayer->isVisible)
  {
    v6 = -[AVPlayerLayer _isPartOfForegroundScene](self, "_isPartOfForegroundScene");
    if (self->_playerLayer->isVisible)
      v5 = 1;
    if (!v5)
      goto LABEL_11;
LABEL_10:
    if (!v6)
      return;
    goto LABEL_11;
  }
  v6 = 0;
  if (v5)
    goto LABEL_10;
LABEL_11:
  v7 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerLayerIsPartOfForegroundSceneDidChangeNotification"), self, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v7);
}

- (BOOL)_isPartOfForegroundScene
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
  v9 = 1;
  serialQueue = self->_playerLayer->serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AVPlayerLayer__isPartOfForegroundScene__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLegibleContentInsets:(NSEdgeInsets)a3
{
  AVPlayerLayerInternal *playerLayer;
  BOOL v5;
  _OWORD *p_top;
  __int128 v7;
  AVPlayer *v8;
  _OWORD v9[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  *(CGFloat *)&v18 = a3.top;
  *((_QWORD *)&v18 + 1) = *(_QWORD *)&a3.left;
  *(CGFloat *)&v19 = a3.bottom;
  *((_QWORD *)&v19 + 1) = *(_QWORD *)&a3.right;
  v17 = 0;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", &v17, &v16, &v15, &v14, 0);
  playerLayer = self->_playerLayer;
  if (playerLayer)
    v5 = v16 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    p_top = (_OWORD *)&playerLayer->legibleContentInsets.top;
    v7 = v19;
    *p_top = v18;
    p_top[1] = v7;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    FigGeometryDimensionMake();
    FigGeometryDimensionMake();
    FigGeometryDimensionMake();
    FigGeometryDimensionMake();
    FigGeometryMarginsMake();
    if (v15)
    {
      v9[0] = v10;
      v9[1] = v11;
      v9[2] = v12;
      v9[3] = v13;
      objc_msgSend(v15, "setCaptionsAvoidanceMargins:", v9);
    }
    v8 = -[AVPlayerLayer player](self, "player");
    -[AVPlayer _updateClosedCaptionLayerBounds:videoRelativeToViewport:captionsAvoidanceMargins:](v8, "_updateClosedCaptionLayerBounds:videoRelativeToViewport:captionsAvoidanceMargins:", v14, 0, &v18);
  }
}

void __35__AVPlayerLayer__setPlayer_forPIP___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[7];

  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 80);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 80) = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 32);
  v5 = *(_QWORD *)(v4 + 80);
  v6 = *(NSObject **)(v4 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AVPlayerLayer__setPlayer_forPIP___block_invoke_2;
  block[3] = &unk_1E302FD88;
  block[4] = v3;
  block[5] = v2;
  block[6] = v5;
  dispatch_async(v6, block);

}

Class __21__AVPlayerLayer_init__block_invoke_5()
{
  Class result;

  result = NSClassFromString(CFSTR("UIWindow"));
  uiWindowClass = (uint64_t)result;
  return result;
}

- (BOOL)isReadyForDisplay
{
  AVPlayerLayerInternal *playerLayer;
  AVPlayerLayerInternal *v5;
  _BOOL4 isReadyForDisplay;
  id v7;

  playerLayer = self->_playerLayer;
  if (playerLayer->isPresentationLayer)
    return 0;
  if (playerLayer->showInterstitialInstead)
  {
    v7 = 0;
    -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v7);
    return objc_msgSend(v7, "isReadyForDisplay");
  }
  else
  {
    MEMORY[0x194033BF8](playerLayer->isReadyForDisplayMutex, a2);
    v5 = self->_playerLayer;
    isReadyForDisplay = v5->isReadyForDisplay;
    MEMORY[0x194033C04](v5->isReadyForDisplayMutex);
    return isReadyForDisplay;
  }
}

void __35__AVPlayerLayer__interstitialLayer__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1[4] + 32);
  v3 = *(void **)(v2 + 152);
  if (v3)
  {
    objc_msgSend(v3, "removeFromSuperlayer");

    v2 = *(_QWORD *)(a1[4] + 32);
  }
  *(_QWORD *)(v2 + 152) = a1[5];
  v4 = *(_QWORD *)(a1[4] + 32);
  if (*(_BYTE *)(v4 + 193))
  {
    *(_BYTE *)(v4 + 193) = 0;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

- (void)removeFromSuperlayer
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVPlayerLayer;
  -[AVPlayerLayer removeFromSuperlayer](&v2, sel_removeFromSuperlayer);
}

- (void)setPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes
{
  AVPlayerLayerInternal *playerLayer;
  NSObject *serialQueue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  playerLayer = self->_playerLayer;
  if (!playerLayer->isPresentationLayer)
  {
    serialQueue = playerLayer->serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__AVPlayerLayer_setPixelBufferAttributes___block_invoke;
    block[3] = &unk_1E302FE00;
    block[4] = self;
    block[5] = pixelBufferAttributes;
    block[6] = &v7;
    dispatch_sync(serialQueue, block);
    if (*((_BYTE *)v8 + 24))
      -[AVPlayer _pixelBufferAttributesDidChangeForLayer:](-[AVPlayerLayer player](self, "player"), "_pixelBufferAttributesDidChangeForLayer:", self);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __42__AVPlayerLayer_setPixelBufferAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 96);
  if ((v3 != 0) != (v2 == 0))
  {
    result = objc_msgSend(v3, "isEqual:");
    if ((result & 1) != 0)
      return result;
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 96);
  }

  result = objc_msgSend(*(id *)(a1 + 40), "copyWithZone:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 96) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)setContentsScale:(double)a3
{
  objc_super v4;

  self->_playerLayer->honorContentScale = 1;
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerLayer;
  -[AVPlayerLayer setContentsScale:](&v4, sel_setContentsScale_, a3);
  -[AVPlayerLayer _notifyPlayerOfDisplaySize](self, "_notifyPlayerOfDisplaySize");
}

uint64_t __21__AVPlayerLayer_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_windowSceneDidEnterBackground:", a2);
}

uint64_t __21__AVPlayerLayer_init__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_windowSceneWillEnterForeground:", a2);
}

- (AVPlayerLayer)initWithLayer:(id)a3
{
  AVPlayerLayerInternal *v5;
  NSObject *v6;
  NSObject *v7;
  objc_super v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerLayer;
  self = -[AVPlayerLayer initWithLayer:](&v9, sel_initWithLayer_, a3);
  if (self)
  {
    v5 = objc_alloc_init(AVPlayerLayerInternal);
    self->_playerLayer = v5;
    if (v5)
    {
      CFRetain(v5);
      v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_playerLayer->serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVPlayerLayerQueue", v6);
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_playerLayer->configurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.playerlayer.configuration", v7);
      self->_playerLayer->isPresentationLayer = 1;
      self->_playerLayer->videoGravity = (NSString *)(id)objc_msgSend(a3, "videoGravity");
      self->_playerLayer->player = (AVPlayer *)(id)objc_msgSend(a3, "player");
      self->_playerLayer->dependencyManager = -[AVKeyPathDependencyManager initWithDependencyHost:]([AVKeyPathDependencyManager alloc], "initWithDependencyHost:", self);
      -[AVKeyPathDependencyManager dependencyHostIsFullyInitialized](self->_playerLayer->dependencyManager, "dependencyHostIsFullyInitialized");
      return self;
    }
LABEL_5:

    return 0;
  }
  return self;
}

- (void)_addBoundsAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  id v8;
  const __CFString *v9;

  v8 = _animationByTransformingValues(a4, (uint64_t)&__block_literal_global_98);
  if (objc_msgSend(a4, "isAdditive"))
    v9 = CFSTR("bounds.size");
  else
    v9 = CFSTR("bounds");
  objc_msgSend(v8, "setKeyPath:", v9);
  objc_msgSend(v8, "setDelegate:", 0);
  objc_msgSend(a3, "addAnimation:forKey:", v8, a5);
}

uint64_t __66__AVPlayerLayer__addBoundsAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2;
}

- (void)_addPositionAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  void *v8;
  id v9;

  if (objc_msgSend(a4, "isAdditive"))
    v8 = &__block_literal_global_103;
  else
    v8 = &__block_literal_global_105;
  v9 = _animationByTransformingValues(a4, (uint64_t)v8);
  objc_msgSend(v9, "setKeyPath:", CFSTR("position"));
  objc_msgSend(v9, "setDelegate:", 0);
  objc_msgSend(a3, "addAnimation:forKey:", v9, a5);
}

uint64_t __68__AVPlayerLayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  objc_msgSend(a2, "sizeValue");
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v2 * 0.5, v3 * 0.5);
}

uint64_t __68__AVPlayerLayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a2, "rectValue");
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v2 + v3 * 0.5, v4 + v5 * 0.5);
}

- (void)_addSublayerTransformAnimationToLayer:(id)a3 fromTransform:(CATransform3D *)a4 usingAnimation:(id)a5 gravity:(id)a6 presentationSize:(CGSize)a7 forKey:(id)a8
{
  double height;
  double width;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double m22;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[7];
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  height = a7.height;
  width = a7.width;
  if (objc_msgSend(a5, "isAdditive"))
  {
    v16 = (id)objc_msgSend(a5, "copy");
    v17 = (id)objc_msgSend(a5, "copy");
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
    memset(v27, 0, sizeof(v27));
    -[AVPlayerLayer bounds](self, "bounds");
    AVLayerTransformForPlacement(a6, 0, (uint64_t)v27, width, height, v18, v19);
    v20 = *((double *)&v28 + 1);
    m22 = a4->m22;
    objc_msgSend(v16, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4->m11 - *(double *)v27));
    objc_msgSend(v16, "setToValue:", &unk_1E3093598);
    objc_msgSend(v16, "setDelegate:", 0);
    objc_msgSend(v16, "setKeyPath:", CFSTR("sublayerTransform.scale.x"));
    objc_msgSend(v17, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", m22 - v20));
    objc_msgSend(v16, "setToValue:", &unk_1E3093598);
    objc_msgSend(v16, "setDelegate:", 0);
    objc_msgSend(v17, "setKeyPath:", CFSTR("sublayerTransform.scale.y"));
    objc_msgSend(a3, "addAnimation:forKey:", v16, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_x"), a8));
    v22 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_y"), a8);
    v23 = a3;
    v24 = v17;
  }
  else
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __116__AVPlayerLayer__addSublayerTransformAnimationToLayer_fromTransform_usingAnimation_gravity_presentationSize_forKey___block_invoke;
    v26[3] = &unk_1E302FB28;
    v26[4] = a6;
    *(double *)&v26[5] = width;
    *(double *)&v26[6] = height;
    v25 = _animationByTransformingValues(a5, (uint64_t)v26);
    objc_msgSend(v25, "setKeyPath:", CFSTR("sublayerTransform"));
    objc_msgSend(v25, "setDelegate:", 0);
    v23 = a3;
    v24 = v25;
    v22 = a8;
  }
  objc_msgSend(v23, "addAnimation:forKey:", v24, v22);
}

uint64_t __116__AVPlayerLayer__addSublayerTransformAnimationToLayer_fromTransform_usingAnimation_gravity_presentationSize_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  _BYTE v7[128];

  objc_msgSend(a2, "rectValue");
  v3 = (void *)MEMORY[0x1E0CB3B18];
  AVLayerTransformForPlacement(*(void **)(a1 + 32), 0, (uint64_t)v7, *(double *)(a1 + 40), *(double *)(a1 + 48), v4, v5);
  return objc_msgSend(v3, "valueWithCATransform3D:", v7);
}

- (void)_addAnimationsForPIPPlaceholderLayer:(id)a3 forKey:(id)a4
{
  CALayer *placeholderContentLayerDuringPIPMode;

  placeholderContentLayerDuringPIPMode = self->_playerLayer->placeholderContentLayerDuringPIPMode;
  if (placeholderContentLayerDuringPIPMode)
  {
    -[AVPlayerLayer _addBoundsAnimationToLayer:usingAnimation:forKey:](self, "_addBoundsAnimationToLayer:usingAnimation:forKey:", placeholderContentLayerDuringPIPMode, a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_PIPPlaceholderLayer_Bounds_%@"), a4));
    -[AVPlayerLayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", self->_playerLayer->placeholderContentLayerDuringPIPMode, a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_PIPPlaceholderLayer_Position_%@"), a4));
  }
}

- (void)_addAnimationsForMaskLayer:(id)a3 forKey:(id)a4
{
  id v7;

  v7 = -[AVPlayerLayer _maskLayer](self, "_maskLayer");
  -[AVPlayerLayer _addBoundsAnimationToLayer:usingAnimation:forKey:](self, "_addBoundsAnimationToLayer:usingAnimation:forKey:", v7, a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_MaskLayer_Bounds_%@"), a4));
  -[AVPlayerLayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", v7, a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_MaskLayer_Position_%@"), a4));
}

- (void)_addAnimationsForClosedCaptionLayer:(id)a3 gravity:(id)a4 forKey:(id)a5
{
  id v9;
  double v10;
  double v11;
  _OWORD v12[8];

  v9 = -[AVPlayerLayer _closedCaptionLayer](self, "_closedCaptionLayer");
  -[AVPlayerLayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", v9, a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_ClosedCaptionLayer_Position_%@"), a5));
  if (v9)
    objc_msgSend(v9, "sublayerTransform");
  else
    memset(v12, 0, sizeof(v12));
  objc_msgSend(v9, "bounds");
  -[AVPlayerLayer _addSublayerTransformAnimationToLayer:fromTransform:usingAnimation:gravity:presentationSize:forKey:](self, "_addSublayerTransformAnimationToLayer:fromTransform:usingAnimation:gravity:presentationSize:forKey:", v9, v12, a3, a4, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_ClosedCaptionLayer_SublayerTransform_%@"), a5), v10, v11);
}

- (void)_addAnimationsForVideoLayer:(id)a3 size:(CGSize)a4 gravity:(id)a5 forKey:(id)a6
{
  double height;
  double width;
  id v12;
  _OWORD v13[8];

  height = a4.height;
  width = a4.width;
  v12 = -[AVPlayerLayer _videoLayer](self, "_videoLayer");
  -[AVPlayerLayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", v12, a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_VideoLayer_Position_%@"), a6));
  if (v12)
    objc_msgSend(v12, "sublayerTransform");
  else
    memset(v13, 0, sizeof(v13));
  -[AVPlayerLayer _addSublayerTransformAnimationToLayer:fromTransform:usingAnimation:gravity:presentationSize:forKey:](self, "_addSublayerTransformAnimationToLayer:fromTransform:usingAnimation:gravity:presentationSize:forKey:", v12, v13, a3, a5, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_VideoLayer_SublayerTransform_%@"), a6), width, height);
}

- (void)_forBoundsAnimations:(id)a3 applyBlock:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(CFSTR("bounds.size"), "isEqualToString:", objc_msgSend(a3, "keyPath")) & 1) != 0
      || objc_msgSend(CFSTR("bounds"), "isEqualToString:", objc_msgSend(a3, "keyPath")))
    {
      (*((void (**)(id, id))a4 + 2))(a4, a3);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = (void *)objc_msgSend(a3, "animations", 0);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            -[AVPlayerLayer _forBoundsAnimations:applyBlock:](self, "_forBoundsAnimations:applyBlock:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), a4);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }
    }
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  BOOL v7;
  objc_super v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v10 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, &v12, &v11, 0, &v10);
  if (self->_playerLayer)
    v7 = v12 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__AVPlayerLayer_addAnimation_forKey___block_invoke;
    v9[3] = &unk_1E302FB50;
    v9[4] = self;
    v9[5] = a4;
    v9[6] = v11;
    v9[7] = v10;
    -[AVPlayerLayer _forBoundsAnimations:applyBlock:](self, "_forBoundsAnimations:applyBlock:", a3, v9);
  }
  v8.receiver = self;
  v8.super_class = (Class)AVPlayerLayer;
  -[AVPlayerLayer addAnimation:forKey:](&v8, sel_addAnimation_forKey_, a3, a4);
}

uint64_t __37__AVPlayerLayer_addAnimation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = objc_msgSend(*(id *)(a1 + 32), "videoGravity");
  objc_msgSend(*(id *)(a1 + 32), "_playerCurrentItemPresentationSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "_addAnimationsForPIPPlaceholderLayer:forKey:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_addAnimationsForMaskLayer:forKey:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_addAnimationsForVideoLayer:size:gravity:forKey:", a2, v4, *(_QWORD *)(a1 + 40), v6, v8);
  objc_msgSend(*(id *)(a1 + 32), "_addAnimationsForClosedCaptionLayer:gravity:forKey:", a2, v4, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addAnimations:forKey:", a2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 56), "addAnimation:forKey:", a2, *(_QWORD *)(a1 + 40));
}

- (void)removeAnimationForKey:(id)a3
{
  BOOL v5;
  uint64_t v6;
  objc_super v7;
  _QWORD v8[11];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v10 = 0;
  v11 = 0;
  v9 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", &v13, &v12, &v11, &v10, &v9);
  if (self->_playerLayer)
    v5 = v12 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = -[AVPlayerLayer animationForKey:](self, "animationForKey:", a3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__AVPlayerLayer_removeAnimationForKey___block_invoke;
    v8[3] = &unk_1E302FB78;
    v8[4] = self;
    v8[5] = a3;
    v8[6] = v13;
    v8[7] = v12;
    v8[8] = v10;
    v8[9] = v11;
    v8[10] = v9;
    -[AVPlayerLayer _forBoundsAnimations:applyBlock:](self, "_forBoundsAnimations:applyBlock:", v6, v8);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerLayer;
  -[AVPlayerLayer removeAnimationForKey:](&v7, sel_removeAnimationForKey_, a3);
}

uint64_t __39__AVPlayerLayer_removeAnimationForKey___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 248);
  if (v2)
  {
    objc_msgSend(v2, "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_PIPPlaceholderLayer_Bounds_%@"), *(_QWORD *)(a1 + 40)));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 248), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_PIPPlaceholderLayer_Position_%@"), *(_QWORD *)(a1 + 40)));
  }
  objc_msgSend(*(id *)(a1 + 48), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_MaskLayer_Bounds_%@"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 48), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_MaskLayer_Position_%@"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 56), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_VideoLayer_SublayerTransform_%@"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 56), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_VideoLayer_SublayerTransform_%@_x"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 56), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_VideoLayer_SublayerTransform_%@_y"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 56), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_VideoLayer_Position_%@"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 64), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_ClosedCaptionLayer_SublayerTransform_%@"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 64), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_ClosedCaptionLayer_SublayerTransform_%@_x"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 64), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_ClosedCaptionLayer_SublayerTransform_%@_y"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 64), "removeAnimationForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVPlayerLayer_ClosedCaptionLayer_Position_%@"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 72), "removeAnimationsForKey:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 80), "removeAnimationForKey:", *(_QWORD *)(a1 + 40));
}

- (float)_percentCoverageRelativeToRootLayer
{
  void *v3;
  float v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = (void *)-[AVPlayerLayer context](self, "context");
  v4 = 0.0;
  if (v3)
  {
    v5 = v3;
    if (objc_msgSend(v3, "layer"))
    {
      -[AVPlayerLayer bounds](self, "bounds");
      -[AVPlayerLayer convertRect:toLayer:](self, "convertRect:toLayer:", 0);
      v7 = v6;
      v9 = v8;
      objc_msgSend((id)objc_msgSend(v5, "layer"), "bounds");
      return v7 * v9 / (v10 * v11);
    }
  }
  return v4;
}

- (id)playerPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:key:notificationName:](AVPropertyValuePublisher, "propertyValuePublisherWithObject:key:notificationName:", self, CFSTR("player"), CFSTR("AVPlayerLayerPlayerDidChangeNotification"));
}

- (id)_maskLayer
{
  void *v3;

  v3 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", &v3, 0, 0, 0, 0);
  return v3;
}

- (void)_setShowInterstitialInstead:(BOOL)a3
{
  -[AVPlayerLayer _setShowInterstitialInstead:afterDelay:](self, "_setShowInterstitialInstead:afterDelay:", a3, NAN);
}

- (void)_setShowInterstitialInstead:(BOOL)a3 afterDelay:(double)a4
{
  _BOOL8 v5;
  NSObject *serialQueue;
  void (*v8)(_QWORD);
  CFTimeInterval v9;
  void (*v10[9])(_QWORD);
  BOOL v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  void (*v19)(_QWORD);
  void (*v20)(_QWORD);

  if (!self->_playerLayer->isPresentationLayer)
  {
    v5 = a3;
    if (-[AVPlayerLayer _showInterstitialInstead](self, "_showInterstitialInstead") != a3)
    {
      v19 = 0;
      v20 = 0;
      v13 = 0;
      v14 = &v13;
      v15 = 0x3052000000;
      v16 = __Block_byref_object_copy_;
      v17 = __Block_byref_object_dispose_;
      v18 = 0;
      serialQueue = self->_playerLayer->serialQueue;
      v8 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke;
      block[3] = &unk_1E302FD60;
      block[4] = self;
      block[5] = &v13;
      dispatch_sync(serialQueue, block);
      objc_msgSend((id)v14[5], "_setShowInterstitialInstead:afterDelay:", v5, a4);

      -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", &v19, 0, 0, 0, &v20);
      if (v20)
      {
        v9 = CACurrentMediaTime();
        v10[0] = v8;
        v10[1] = (void (*)(_QWORD))3221225472;
        v10[2] = (void (*)(_QWORD))__56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke_2;
        v10[3] = (void (*)(_QWORD))&unk_1E302FE50;
        v11 = v5;
        v10[4] = (void (*)(_QWORD))self;
        v10[5] = v19;
        v10[6] = v20;
        v10[7] = *(void (**)(_QWORD))&a4;
        *(double *)&v10[8] = v9 + a4;
        AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v10);
      }
      _Block_object_dispose(&v13, 8);
    }
  }
}

id __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 168);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("videoRect"));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(v2 + 32) + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke_3;
  v5[3] = &unk_1E302FD38;
  v5[4] = v2;
  v6 = *(_BYTE *)(a1 + 72);
  dispatch_sync(v3, v5);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 48), "setHidden:", *(_BYTE *)(a1 + 72) == 0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCommitTime:", *(double *)(a1 + 64));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("videoRect"));
}

uint64_t __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32) + 193) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isOverscanSubtitleSupportEnabled
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
  serialQueue = self->_playerLayer->serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerLayer_isOverscanSubtitleSupportEnabled__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerLayer_isOverscanSubtitleSupportEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 136), "isOverscanSubtitleSupportEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setOverscanSubtitleSupportEnabled:(BOOL)a3
{
  objc_msgSend(-[AVPlayerLayer _subtitleLayer](self, "_subtitleLayer"), "setOverscanSubtitleSupportEnabled:", a3);
}

- (id)videoPerformanceMetrics
{
  return -[AVVideoPerformanceMetrics initWithDictionary:]([AVVideoPerformanceMetrics alloc], "initWithDictionary:", -[AVPlayer _performanceDictionary](-[AVPlayerLayer player](self, "player"), "_performanceDictionary"));
}

- (void)_setIsConnectedToSecondScreen:(BOOL)a3
{
  _BOOL8 v3;
  AVPlayerLayerInternal *playerLayer;
  id v6;

  v3 = a3;
  playerLayer = self->_playerLayer;
  if (playerLayer->isConnectedToSecondScreen != a3)
  {
    playerLayer->isConnectedToSecondScreen = a3;
    -[AVPlayer _updateConnectionToSecondScreen](self->_playerLayer->player, "_updateConnectionToSecondScreen");
  }
  v6 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v6);
  objc_msgSend(v6, "_setIsConnectedToSecondScreen:", v3);
}

- (void)setLanczosFilterDownscalingEnabled:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_playerLayer->serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__AVPlayerLayer_setLanczosFilterDownscalingEnabled___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(serialQueue, v4);
}

uint64_t __52__AVPlayerLayer_setLanczosFilterDownscalingEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32) + 104) = *(_BYTE *)(result + 40);
  return result;
}

- (int64_t)lanczosFilterDownscaleFactor
{
  NSObject *serialQueue;
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
  serialQueue = self->_playerLayer->serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerLayer_lanczosFilterDownscaleFactor__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVPlayerLayer_lanczosFilterDownscaleFactor__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 32)
                                                                              + 112);
  return result;
}

- (void)setLanczosFilterDownscaleFactor:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *serialQueue;
  _QWORD v6[8];

  if ((unint64_t)(a3 - 2) <= 6)
  {
    v6[6] = v3;
    v6[7] = v4;
    serialQueue = self->_playerLayer->serialQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__AVPlayerLayer_setLanczosFilterDownscaleFactor___block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(serialQueue, v6);
  }
}

uint64_t __49__AVPlayerLayer_setLanczosFilterDownscaleFactor___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32) + 112) = *(_QWORD *)(result + 40);
  return result;
}

- (CGRect)_videoRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSEdgeInsets)legibleContentInsets
{
  AVPlayerLayerInternal *playerLayer;
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  playerLayer = self->_playerLayer;
  top = playerLayer->legibleContentInsets.top;
  left = playerLayer->legibleContentInsets.left;
  bottom = playerLayer->legibleContentInsets.bottom;
  right = playerLayer->legibleContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isLegibleDisplayEnabled
{
  return self->_playerLayer->isLegibleDisplayEnabled;
}

- (void)setLegibleDisplayEnabled:(BOOL)a3
{
  AVPlayerLayerInternal *playerLayer;

  playerLayer = self->_playerLayer;
  if (playerLayer->isLegibleDisplayEnabled != a3)
  {
    playerLayer->isLegibleDisplayEnabled = a3;
    if (a3)
    {
      objc_msgSend(-[AVPlayerLayer _maskLayer](self, "_maskLayer"), "addSublayer:", -[AVPlayerLayer _subtitleLayer](self, "_subtitleLayer"));
      objc_msgSend(-[AVPlayerLayer _maskLayer](self, "_maskLayer"), "addSublayer:", -[AVPlayerLayer _closedCaptionLayer](self, "_closedCaptionLayer"));
    }
    else
    {
      objc_msgSend(-[AVPlayerLayer _closedCaptionLayer](self, "_closedCaptionLayer"), "removeFromSuperlayer");
      objc_msgSend(-[AVPlayerLayer _subtitleLayer](self, "_subtitleLayer"), "removeFromSuperlayer");
    }
  }
}

- (BOOL)isForScrubbingOnly
{
  return self->_playerLayer->isForScrubbingOnly;
}

- (void)setForScrubbingOnly:(BOOL)a3
{
  AVPlayerLayerInternal *playerLayer;

  playerLayer = self->_playerLayer;
  if (playerLayer->isForScrubbingOnly != a3)
  {
    playerLayer->isForScrubbingOnly = a3;
    -[FigVideoContainerLayer setForScrubbingOnly:](self->_playerLayer->videoLayer, "setForScrubbingOnly:");
  }
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend(-[AVPlayerLayer _videoLayer](self, "_videoLayer"), "setToneMapToStandardDynamicRange:", a3);
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerLayer;
  -[AVPlayerLayer setToneMapToStandardDynamicRange:](&v5, sel_setToneMapToStandardDynamicRange_, v3);
}

- (CVPixelBufferRef)copyDisplayedPixelBuffer
{
  NSObject *serialQueue;
  AVPlayer *v4;
  __CVBuffer *v5;
  _QWORD block[6];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8 = 0;
  serialQueue = self->_playerLayer->serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AVPlayerLayer_copyDisplayedPixelBuffer__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v10 + 24))
  {
    -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v8);
    v4 = (AVPlayer *)objc_msgSend(v8, "player");
  }
  else
  {
    v4 = -[AVPlayerLayer player](self, "player");
  }
  v5 = -[AVPlayer _copyDisplayedPixelBuffer](v4, "_copyDisplayedPixelBuffer");
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __41__AVPlayerLayer_copyDisplayedPixelBuffer__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32)
                                                                            + 193);
  return result;
}

- (void)_configurePlayerWhenEnteringPIP
{
  id v3;

  -[AVPlayer setPlayerRole:synchronously:](-[AVPlayerLayer player](self, "player"), "setPlayerRole:synchronously:", CFSTR("PIP"), 0);
  -[AVPlayer setShouldReduceResourceUsage:](-[AVPlayerLayer player](self, "player"), "setShouldReduceResourceUsage:", 1);
  v3 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v3);
  objc_msgSend(v3, "_configurePlayerWhenEnteringPIP");
}

- (void)_configurePlayerWhenLeavingPIP
{
  id v3;

  -[AVPlayer setPlayerRole:synchronously:](-[AVPlayerLayer player](self, "player"), "setPlayerRole:synchronously:", 0, 0);
  -[AVPlayer setShouldReduceResourceUsage:](-[AVPlayerLayer player](self, "player"), "setShouldReduceResourceUsage:", 0);
  v3 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v3);
  objc_msgSend(v3, "_configurePlayerWhenLeavingPIP");
}

+ (void)_swapSublayersBetweenPlayerLayer:(id)a3 andPlayerLayer:(id)a4
{
  uint64_t v6;
  uint64_t v7;

  if (a3 != a4)
  {
    v6 = objc_msgSend(a3, "_sublayersForPIP");
    v7 = objc_msgSend(a4, "_sublayersForPIP");
    objc_msgSend(a3, "_setSublayersForPIP:", 0);
    objc_msgSend(a4, "_setSublayersForPIP:", 0);
    objc_msgSend(a3, "_setSublayersForPIP:", v7);
    objc_msgSend(a4, "_setSublayersForPIP:", v6);
  }
}

- (void)_stashClientLayers
{
  id v3;
  NSDictionary *v4;
  NSDictionary *clientLayers;

  v3 = -[AVPlayerLayer _maskLayer](self, "_maskLayer");
  v4 = (NSDictionary *)AVPlayerLayerFilterClientLayersFromLayerWithIndexPath(v3, (void *)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0));
  clientLayers = self->_playerLayer->clientLayers;
  if (clientLayers != v4)
  {

    self->_playerLayer->clientLayers = v4;
    v4 = self->_playerLayer->clientLayers;
  }
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_196);
}

uint64_t __35__AVPlayerLayer__stashClientLayers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSLog(CFSTR("Layer %@ is not a permitted sublayer during Picture-in-Picture, will be temporarily removed from the layer tree"), a3);
  return objc_msgSend(a3, "removeFromSuperlayer");
}

- (void)_unstashClientLayers
{
  -[AVPlayerLayer _restoreClientLayers:intoMaskLayer:](self, "_restoreClientLayers:intoMaskLayer:", self->_playerLayer->clientLayers, -[AVPlayerLayer _maskLayer](self, "_maskLayer"));

  self->_playerLayer->clientLayers = 0;
}

- (void)_associateWithLayer:(id)a3 forMode:(int64_t)a4
{
  NSObject *serialQueue;
  void *v8;
  _QWORD v9[7];
  id v10;

  v10 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v10);
  serialQueue = self->_playerLayer->serialQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__AVPlayerLayer__associateWithLayer_forMode___block_invoke;
  v9[3] = &unk_1E302FEE0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  dispatch_sync(serialQueue, v9);
  if (a4)
  {
    +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:andPlayerLayer:](AVPlayerLayer, "_swapSublayersBetweenPlayerLayer:andPlayerLayer:", self, a3);
  }
  else
  {
    -[AVPlayer _ensureVideoLayersAreAttached](-[AVPlayerLayer player](self, "player"), "_ensureVideoLayersAreAttached");
    objc_msgSend((id)objc_msgSend(v10, "player"), "_ensureVideoLayersAreAttached");
    -[AVPlayerLayer _setSublayersPreventChangesToSublayerHierarchy:](self, "_setSublayersPreventChangesToSublayerHierarchy:", 1);
    -[AVPlayerLayer _stashClientLayers](self, "_stashClientLayers");
    objc_msgSend(v10, "_stashClientLayers");
    +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:andPlayerLayer:](AVPlayerLayer, "_swapSublayersBetweenPlayerLayer:andPlayerLayer:", self, a3);
    objc_msgSend(a3, "_setPreventsChangesToSublayerHierarchy:", 1);
  }
  objc_msgSend(a3, "_setWillManageSublayersAsSwappedLayers:", 1);
  objc_msgSend(a3, "_setPlayer:forPIP:", -[AVPlayerLayer player](self, "player"), 1);
  v8 = (void *)objc_msgSend(a3, "_interstitialLayer");
  objc_msgSend(v8, "_setPlayer:forPIP:", objc_msgSend(v10, "player"), 1);
  objc_msgSend(a3, "_setShowInterstitialInstead:", -[AVPlayerLayer _showInterstitialInstead](self, "_showInterstitialInstead"));
}

id __45__AVPlayerLayer__associateWithLayer_forMode___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 168) = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 184) = *(_QWORD *)(a1 + 48);
  return result;
}

- (int64_t)_activeMode
{
  NSObject *serialQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  serialQueue = self->_playerLayer->serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__AVPlayerLayer__activeMode__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__AVPlayerLayer__activeMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 32)
                                                                              + 184);
  return result;
}

- (void)_disassociateWithLayerForMode:(int64_t)a3
{
  NSObject *serialQueue;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  id v13;

  v13 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v13);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  serialQueue = self->_playerLayer->serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVPlayerLayer__disassociateWithLayerForMode___block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(serialQueue, block);
  objc_msgSend((id)v8[5], "_setPlayer:forPIP:", 0, 1);
  objc_msgSend((id)objc_msgSend((id)v8[5], "_interstitialLayer"), "_setPlayer:forPIP:", 0, 1);
  objc_msgSend((id)v8[5], "removeAllAnimations");
  if (!a3)
  {
    objc_msgSend((id)v8[5], "_setPreventsChangesToSublayerHierarchy:", 0);
    objc_msgSend((id)v8[5], "_setSublayersPreventChangesToSublayerHierarchy:", 0);
  }
  +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:andPlayerLayer:](AVPlayerLayer, "_swapSublayersBetweenPlayerLayer:andPlayerLayer:", self, v8[5]);
  objc_msgSend((id)v8[5], "_setWillManageSublayersAsSwappedLayers:", 0);
  if (!a3)
  {
    objc_msgSend((id)v8[5], "_mergeClientLayersIntoMaskLayer:", -[AVPlayerLayer _maskLayer](self, "_maskLayer"));
    -[AVPlayerLayer _unstashClientLayers](self, "_unstashClientLayers");
    objc_msgSend(v13, "_unstashClientLayers");
  }

  _Block_object_dispose(&v7, 8);
}

void __47__AVPlayerLayer__disassociateWithLayerForMode___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 32)
                                                                                  + 168));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 168) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 184) = -1;
}

- (void)startRedirectingVideoToLayer:(id)a3 forMode:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;

  if (!a3)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "targetLayer != nil";
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "[targetLayer isKindOfClass:[AVPlayerLayer class]]";
    goto LABEL_12;
  }
  if (objc_msgSend(a3, "player"))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "[targetLayer player] == nil";
LABEL_12:
    v15 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), a4, v4, v5, v6, v7, (uint64_t)v14), 0);
    objc_exception_throw(v15);
  }
  if (-[AVPlayerLayer _activeMode](self, "_activeMode") != a4)
    -[AVPlayerLayer stopRedirectingVideoToLayer:](self, "stopRedirectingVideoToLayer:", -[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer"));
  if (a4)
    -[AVPlayerLayer _enterSecondScreenModeRedirectingVideoToLayer:](self, "_enterSecondScreenModeRedirectingVideoToLayer:", a3);
  else
    -[AVPlayerLayer _enterPIPModeRedirectingVideoToLayer:](self, "_enterPIPModeRedirectingVideoToLayer:", a3);
}

- (void)stopRedirectingVideoToLayer:(id)a3
{
  if (-[AVPlayerLayer _activeMode](self, "_activeMode"))
    -[AVPlayerLayer _leaveSecondScreenModeForLayer:](self, "_leaveSecondScreenModeForLayer:", a3);
  else
    -[AVPlayerLayer _leavePIPModeForLayer:](self, "_leavePIPModeForLayer:", a3);
}

- (void)_enterSecondScreenModeRedirectingVideoToLayer:(id)a3
{
  void (*v5[6])(_QWORD);

  if (!-[AVPlayerLayer _isConnectedToSecondScreen](self, "_isConnectedToSecondScreen"))
  {
    v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v5[1] = (void (*)(_QWORD))3221225472;
    v5[2] = (void (*)(_QWORD))__63__AVPlayerLayer__enterSecondScreenModeRedirectingVideoToLayer___block_invoke;
    v5[3] = (void (*)(_QWORD))&unk_1E302FCE8;
    v5[4] = (void (*)(_QWORD))self;
    v5[5] = (void (*)(_QWORD))a3;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v5);
  }
}

uint64_t __63__AVPlayerLayer__enterSecondScreenModeRedirectingVideoToLayer___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_associateWithLayer:forMode:", *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(*(id *)(a1 + 40), "setVideoGravity:", objc_msgSend(*(id *)(a1 + 32), "videoGravity"));
  objc_msgSend(*(id *)(a1 + 32), "_setIsConnectedToSecondScreen:", 1);
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_leaveSecondScreenModeForLayer:(id)a3
{
  void (*v4[5])(_QWORD);

  if (objc_msgSend(-[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer"), "isEqual:", a3))
  {
    if (-[AVPlayerLayer _isConnectedToSecondScreen](self, "_isConnectedToSecondScreen"))
    {
      v4[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
      v4[1] = (void (*)(_QWORD))3221225472;
      v4[2] = (void (*)(_QWORD))__48__AVPlayerLayer__leaveSecondScreenModeForLayer___block_invoke;
      v4[3] = (void (*)(_QWORD))&unk_1E302FA10;
      v4[4] = (void (*)(_QWORD))self;
      AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v4);
    }
  }
}

uint64_t __48__AVPlayerLayer__leaveSecondScreenModeForLayer___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_disassociateWithLayerForMode:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_setIsConnectedToSecondScreen:", 0);
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)enterPIPModeRedirectingVideoToLayer:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;

  if (!a3)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = "newPlayerLayerForPIP != nil";
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = "[newPlayerLayerForPIP isKindOfClass:[AVPlayerLayer class]]";
    goto LABEL_8;
  }
  if (objc_msgSend(a3, "player"))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = "[newPlayerLayerForPIP player] == nil";
LABEL_8:
    v14 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)v13), 0);
    objc_exception_throw(v14);
  }
  -[AVPlayerLayer _enterPIPModeRedirectingVideoToLayer:](self, "_enterPIPModeRedirectingVideoToLayer:", a3);
}

- (void)_enterPIPModeRedirectingVideoToLayer:(id)a3
{
  void (*v5)(_QWORD);
  void (*v6)(_QWORD);
  BOOL v7;
  void (*v8[7])(_QWORD);

  v5 = -[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer");
  if (v5 != a3)
  {
    v6 = v5;
    v7 = -[AVPlayerLayer isPIPModeEnabled](self, "isPIPModeEnabled");
    if (!v7)
      -[AVPlayerLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("PIPModeEnabled"));
    v8[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v8[1] = (void (*)(_QWORD))3221225472;
    v8[2] = (void (*)(_QWORD))__54__AVPlayerLayer__enterPIPModeRedirectingVideoToLayer___block_invoke;
    v8[3] = (void (*)(_QWORD))&unk_1E302FD88;
    v8[4] = v6;
    v8[5] = (void (*)(_QWORD))self;
    v8[6] = (void (*)(_QWORD))a3;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v8);
    -[AVPlayerLayer setPIPModeEnabled:](self, "setPIPModeEnabled:", 1);
    if (!v7)
      -[AVPlayerLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("PIPModeEnabled"));
  }
}

uint64_t __54__AVPlayerLayer__enterPIPModeRedirectingVideoToLayer___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_disassociateWithLayerForMode:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_associateWithLayer:forMode:", *(_QWORD *)(a1 + 48), 0);
  v2 = *(_QWORD **)(a1 + 40);
  v3 = *(_QWORD *)(v2[4] + 248);
  if (v3)
  {
    objc_msgSend(v2, "insertSublayer:above:", v3, objc_msgSend(*(id *)(a1 + 40), "_maskLayer"));
    v4 = *(_QWORD **)(a1 + 40);
    v5 = *(void **)(v4[4] + 248);
    objc_msgSend(v4, "bounds");
    objc_msgSend(v5, "setFrame:");
    v2 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 48), "setVideoGravity:", objc_msgSend(v2, "videoGravity"));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)leavePIPMode
{
  -[AVPlayerLayer _leavePIPModeForLayer:](self, "_leavePIPModeForLayer:", -[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer"));
}

- (void)_leavePIPModeForLayer:(id)a3
{
  void (*v4[5])(_QWORD);

  if (objc_msgSend(-[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer"), "isEqual:", a3))
  {
    if (-[AVPlayerLayer isPIPModeEnabled](self, "isPIPModeEnabled"))
    {
      -[AVPlayerLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("PIPModeEnabled"));
      v4[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
      v4[1] = (void (*)(_QWORD))3221225472;
      v4[2] = (void (*)(_QWORD))__39__AVPlayerLayer__leavePIPModeForLayer___block_invoke;
      v4[3] = (void (*)(_QWORD))&unk_1E302FA10;
      v4[4] = (void (*)(_QWORD))self;
      AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v4);
      -[AVPlayerLayer setPIPModeEnabled:](self, "setPIPModeEnabled:", 0);
      -[AVPlayerLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("PIPModeEnabled"));
    }
  }
}

uint64_t __39__AVPlayerLayer__leavePIPModeForLayer___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 248), "removeFromSuperlayer");
  objc_msgSend(*(id *)(a1 + 32), "_disassociateWithLayerForMode:", 0);
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setPIPModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AVPlayerLayerInternal *playerLayer;
  id v6;

  v3 = a3;
  playerLayer = self->_playerLayer;
  if (playerLayer->isPIPModeEnabled != a3)
  {
    playerLayer->isPIPModeEnabled = a3;
    if (self->_playerLayer->isPIPModeEnabled)
      -[AVPlayerLayer _configurePlayerWhenEnteringPIP](self, "_configurePlayerWhenEnteringPIP");
    else
      -[AVPlayerLayer _configurePlayerWhenLeavingPIP](self, "_configurePlayerWhenLeavingPIP");
  }
  v6 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v6);
  objc_msgSend(v6, "setPIPModeEnabled:", v3);
}

- (void)_forceLayout
{
  -[AVPlayerLayer _applyCurrentItemPresentationSizeChangeAndForceUpdate:](self, "_applyCurrentItemPresentationSizeChangeAndForceUpdate:", 1);
}

- (id)_sublayersForPIP
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = 0;
  v6 = 0;
  v7 = 0;
  v5 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", &v9, &v8, &v7, &v6, &v5);
  v2 = objc_msgSend(v5, "_sublayersForPIP");
  if (!v9)
    return 0;
  v3 = MEMORY[0x1E0C9AA70];
  v10[0] = CFSTR("maskLayer");
  v10[1] = CFSTR("videoLayer");
  if (v2)
    v3 = v2;
  v11[0] = v9;
  v11[1] = v8;
  v10[2] = CFSTR("subtitleLayer");
  v10[3] = CFSTR("closedCaptionLayer");
  v11[2] = v7;
  v11[3] = v6;
  v10[4] = CFSTR("interstitialLayers");
  v11[4] = v3;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
}

- (void)_mergeClientLayersIntoMaskLayer:(id)a3
{
  id v5;

  v5 = -[AVPlayerLayer _maskLayer](self, "_maskLayer");
  -[AVPlayerLayer _restoreClientLayers:intoMaskLayer:](self, "_restoreClientLayers:intoMaskLayer:", AVPlayerLayerFilterClientLayersFromLayerWithIndexPath(v5, (void *)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0)), a3);
}

- (void)_restoreClientLayers:(id)a3 intoMaskLayer:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = (id)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_423);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = objc_msgSend(a3, "objectForKey:", v10);
        if ((unint64_t)objc_msgSend(v10, "length") < 2)
          break;
        v12 = a4;
        if ((unint64_t)(objc_msgSend(v10, "length") - 3) > 0xFFFFFFFFFFFFFFFDLL)
        {
LABEL_12:
          if (v12)
            objc_msgSend(v12, "insertSublayer:atIndex:", v11, objc_msgSend(v10, "indexAtPosition:", objc_msgSend(v10, "length") - 1));
        }
        else
        {
          v13 = 1;
          v12 = a4;
          while (1)
          {
            v14 = objc_msgSend(v10, "indexAtPosition:", v13);
            if (!objc_msgSend((id)objc_msgSend(v12, "sublayers"), "count"))
              break;
            v12 = (id)objc_msgSend((id)objc_msgSend(v12, "sublayers"), "objectAtIndex:", v14);
            if (objc_msgSend(v10, "length") - 1 <= (unint64_t)++v13)
              goto LABEL_12;
          }
        }
        if (++v9 == v7)
        {
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v7)
            goto LABEL_4;
          return;
        }
      }
    }
  }
}

- (void)_setSublayersPreventChangesToSublayerHierarchy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = a3;
  v8 = 0;
  v6 = 0;
  v7 = 0;
  v4 = 0;
  v5 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", &v8, &v7, &v6, &v5, &v4);
  objc_msgSend(v7, "setPreventsChangesToSublayerHierarchy:", v3);
  objc_msgSend(v6, "setPreventsChangesToSublayerHierarchy:", v3);
  objc_msgSend(v5, "setPreventsChangesToSublayerHierarchy:", v3);
  objc_msgSend(v8, "setPreventsChangesToSublayerHierarchy:", v3);
  objc_msgSend(v4, "_setSublayersPreventChangesToSublayerHierarchy:", v3);
}

- (void)_setSublayersForPIP:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *serialQueue;
  void *v10;
  _QWORD block[11];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v3 = a3;
  if (a3)
  {
    v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("videoLayer"));
    v6 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtitleLayer"));
    v7 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("closedCaptionLayer"));
    v8 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maskLayer"));
    v3 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("interstitialLayers"));
  }
  else
  {
    v8 = 0;
    v6 = 0;
    v5 = 0;
    v7 = 0;
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  if (objc_msgSend(v3, "count"))
    -[AVPlayerLayer _interstitialLayer](self, "_interstitialLayer");
  serialQueue = self->_playerLayer->serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AVPlayerLayer__setSublayersForPIP___block_invoke;
  block[3] = &unk_1E302FF08;
  block[4] = self;
  block[5] = v5;
  block[6] = v6;
  block[7] = v7;
  block[9] = v3;
  block[10] = &v12;
  block[8] = v8;
  dispatch_sync(serialQueue, block);
  v10 = (void *)v13[5];
  if (v10 != (void *)v8)
  {
    objc_msgSend(v10, "removeFromSuperlayer");
    if (v8)
    {
      -[AVPlayerLayer addSublayer:](self, "addSublayer:", v8);
      -[AVPlayerLayer _forceLayout](self, "_forceLayout");
    }
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __37__AVPlayerLayer__setSublayersForPIP___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = *(void **)(v2 + 128);
  if (v3 != *(void **)(a1 + 40))
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 128) = *(id *)(a1 + 40);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  }
  v4 = *(void **)(v2 + 136);
  if (v4 != *(void **)(a1 + 48))
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 136) = *(id *)(a1 + 48);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  }
  v5 = *(void **)(v2 + 144);
  if (v5 != *(void **)(a1 + 56))
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 144) = *(id *)(a1 + 56);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = *(id *)(v2 + 120);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) != *(_QWORD *)(a1 + 64))
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 120) = *(id *)(a1 + 64);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 152), "_setSublayersForPIP:", *(_QWORD *)(a1 + 72));
}

- (void)_setWillManageSublayersAsSwappedLayers:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *serialQueue;
  _QWORD block[5];
  BOOL v7;
  id v8;

  v3 = a3;
  v8 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v8);
  objc_msgSend(v8, "_setWillManageSublayersAsSwappedLayers:", v3);
  serialQueue = self->_playerLayer->serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerLayer__setWillManageSublayersAsSwappedLayers___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v7 = v3;
  dispatch_sync(serialQueue, block);
}

uint64_t __56__AVPlayerLayer__setWillManageSublayersAsSwappedLayers___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32) + 176) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_setPreventsChangesToSublayerHierarchy:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = 0;
  -[AVPlayerLayer _getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:](self, "_getMaskLayer:videoLayer:subtitleLayer:closedCaptionLayer:interstitialLayer:", 0, 0, 0, 0, &v5);
  objc_msgSend(v5, "_setPreventsChangesToSublayerHierarchy:", v3);
  self->_playerLayer->preventsChangesToSublayerHierarchy = v3;
}

- (id)placeholderContentLayerDuringPIPMode
{
  return self->_playerLayer->placeholderContentLayerDuringPIPMode;
}

- (void)setPlaceholderContentLayerDuringPIPMode:(id)a3
{
  CALayer *placeholderContentLayerDuringPIPMode;
  CALayer *v6;

  placeholderContentLayerDuringPIPMode = self->_playerLayer->placeholderContentLayerDuringPIPMode;
  if (placeholderContentLayerDuringPIPMode != a3)
  {
    -[CALayer removeFromSuperlayer](placeholderContentLayerDuringPIPMode, "removeFromSuperlayer");

    self->_playerLayer->placeholderContentLayerDuringPIPMode = (CALayer *)a3;
    if (self->_playerLayer->placeholderContentLayerDuringPIPMode)
    {
      if (-[AVPlayerLayer isPIPModeEnabled](self, "isPIPModeEnabled"))
      {
        -[AVPlayerLayer insertSublayer:above:](self, "insertSublayer:above:", self->_playerLayer->placeholderContentLayerDuringPIPMode, -[AVPlayerLayer _maskLayer](self, "_maskLayer"));
        v6 = self->_playerLayer->placeholderContentLayerDuringPIPMode;
        -[AVPlayerLayer bounds](self, "bounds");
        -[CALayer setFrame:](v6, "setFrame:");
      }
    }
  }
}

- (void)setSublayers:(id)a3
{
  objc_super v5;

  if (!-[AVPlayerLayer _preventsChangesToSublayerHierarchy](self, "_preventsChangesToSublayerHierarchy"))
  {
    v5.receiver = self;
    v5.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer setSublayers:](&v5, sel_setSublayers_, a3);
  }
}

- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4
{
  uint64_t v4;
  objc_super v7;

  v4 = *(_QWORD *)&a4;
  if (!-[AVPlayerLayer _preventsChangesToSublayerHierarchy](self, "_preventsChangesToSublayerHierarchy"))
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer insertSublayer:atIndex:](&v7, sel_insertSublayer_atIndex_, a3, v4);
  }
}

- (void)insertSublayer:(id)a3 below:(id)a4
{
  objc_super v7;

  if (!-[AVPlayerLayer _preventsChangesToSublayerHierarchy](self, "_preventsChangesToSublayerHierarchy"))
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer insertSublayer:below:](&v7, sel_insertSublayer_below_, a3, a4);
  }
}

- (void)insertSublayer:(id)a3 above:(id)a4
{
  objc_super v7;

  if (!-[AVPlayerLayer _preventsChangesToSublayerHierarchy](self, "_preventsChangesToSublayerHierarchy"))
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer insertSublayer:above:](&v7, sel_insertSublayer_above_, a3, a4);
  }
}

- (void)replaceSublayer:(id)a3 with:(id)a4
{
  objc_super v7;

  if (!-[AVPlayerLayer _preventsChangesToSublayerHierarchy](self, "_preventsChangesToSublayerHierarchy"))
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer replaceSublayer:with:](&v7, sel_replaceSublayer_with_, a3, a4);
  }
}

- (void)_windowSceneDidEnterBackground
{
  self->_playerLayer->lastWindowSceneEvent = 1;
  -[AVPlayerLayer _updateIsPartOfForegroundScene](self, "_updateIsPartOfForegroundScene");
}

- (void)_windowSceneDidEnterBackground:(id)a3
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)uiWindowClass, "_windowWithContextId:", objc_msgSend((id)-[AVPlayerLayer context](self, "context"), "contextId")), "windowScene"), "isEqual:", objc_msgSend(a3, "object")))-[AVPlayerLayer _windowSceneDidEnterBackground](self, "_windowSceneDidEnterBackground");
}

- (void)_windowSceneWillEnterForeground
{
  self->_playerLayer->lastWindowSceneEvent = 2;
  -[AVPlayerLayer _setIsPartOfForegroundScene:](self, "_setIsPartOfForegroundScene:", 1);
}

- (void)_windowSceneWillEnterForeground:(id)a3
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)uiWindowClass, "_windowWithContextId:", objc_msgSend((id)-[AVPlayerLayer context](self, "context"), "contextId")), "windowScene"), "isEqual:", objc_msgSend(a3, "object")))-[AVPlayerLayer _windowSceneWillEnterForeground](self, "_windowSceneWillEnterForeground");
}

- (void)_forceWindowSceneEvent:(BOOL)a3
{
  if (a3)
    -[AVPlayerLayer _windowSceneWillEnterForeground](self, "_windowSceneWillEnterForeground");
  else
    -[AVPlayerLayer _windowSceneDidEnterBackground](self, "_windowSceneDidEnterBackground");
}

- (id)_STSLabel
{
  id result;

  result = -[AVPlayerLayer _videoLayer](self, "_videoLayer");
  if (result)
    return (id)objc_msgSend(result, "STSLabel");
  return result;
}

@end
