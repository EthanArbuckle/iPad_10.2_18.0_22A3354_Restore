@implementation PKPencilShadowView

- (PKPencilShadowView)initWithFrame:(CGRect)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  void *v21;
  void *v22;
  PKMetalPencilShadowRenderer *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  _QWORD block[4];
  id v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PKPencilShadowView;
  v3 = -[PKPencilShadowView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "maximumFramesPerSecond");

    *((double *)v3 + 60) = 1.0 / (double)v5;
    *((_QWORD *)v3 + 79) = 0x3FF0000000000000;
    +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
    *((_QWORD *)v3 + 57) = v6;
    +[PKMetalPencilShadowRenderer pixelSize](PKMetalPencilShadowRenderer, "pixelSize");
    v7 = *((double *)v3 + 57);
    *((double *)v3 + 58) = v8 / v7;
    *((double *)v3 + 59) = v9 / v7;
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toolShadowMaxOpacityInDrawingCanvas");
    *((_QWORD *)v3 + 61) = v11;

    v12 = objc_alloc_init(MEMORY[0x1E0CD27E0]);
    objc_storeStrong((id *)v3 + 52, v12);
    objc_msgSend(*((id *)v3 + 52), "setPixelFormat:", 80);
    objc_msgSend(v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v12);

    +[PKMetalUtility defaultDevice](PKMetalUtility, "defaultDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDevice:", v14);

    objc_msgSend(v12, "setOpaque:", 0);
    objc_msgSend(v12, "setFramebufferOnly:", 1);
    +[PKMetalPencilShadowRenderer pixelSize](PKMetalPencilShadowRenderer, "pixelSize");
    objc_msgSend(v12, "setDrawableSize:");
    objc_msgSend(v12, "setContentsScale:", *((double *)v3 + 57));
    objc_msgSend(v12, "setPresentsWithTransaction:", 1);
    objc_msgSend(v12, "setAllowsHitTesting:", 0);
    objc_msgSend(v12, "setLowLatency:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "setLowWorkload:", 1);
    v15 = (void *)*((_QWORD *)v3 + 52);
    *((_QWORD *)v3 + 52) = v12;
    v16 = v12;

    objc_msgSend(v3, "setNeedsLayout");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INTERACTIVE, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = dispatch_queue_create("com.apple.pencilkit.shadowRenderer", v18);
    v20 = (void *)*((_QWORD *)v3 + 56);
    *((_QWORD *)v3 + 56) = v19;

    objc_msgSend(*((id *)v3 + 52), "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = [PKMetalPencilShadowRenderer alloc];
    objc_msgSend(*((id *)v3 + 52), "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalResourceHandler shaderLibrary]((uint64_t)v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PKMetalPencilShadowRenderer initWithDevice:library:](v23, "initWithDevice:library:", v24, v25);
    v27 = (void *)*((_QWORD *)v3 + 55);
    *((_QWORD *)v3 + 55) = v26;

    *((_BYTE *)v3 + 553) = 1;
    objc_msgSend(v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(v3, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAllowsHitTesting:", 0);

    objc_msgSend(v3, "setAnchorPoint:", 0.5, 0.0);
    v29 = *((_QWORD *)v3 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PKPencilShadowView_initWithFrame___block_invoke;
    block[3] = &unk_1E7778020;
    v30 = v3;
    v34 = v30;
    dispatch_async(v29, block);
    +[PKRendererVSyncController sharedController]();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRendererVSyncController addRendererController:]((uint64_t)v31, v30);

  }
  return (PKPencilShadowView *)v3;
}

uint64_t __36__PKPencilShadowView_initWithFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "updateInk:", 0);
}

- (void)dealloc
{
  void *v3;
  NSTimer *idleTimer;
  objc_super v5;

  +[PKRendererVSyncController sharedController]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRendererVSyncController removeRendererController:]((uint64_t)v3, self);

  -[NSTimer invalidate](self->_idleTimer, "invalidate");
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)PKPencilShadowView;
  -[PKPencilShadowView dealloc](&v5, sel_dealloc);
}

+ (void)createShadowViewForSceneIfNecessary:(id)a3
{
  unsigned __int8 *v3;
  id v4;

  v4 = a3;
  if (_UIUpdateCycleEnabled())
  {
    +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v4);
    v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    -[PKPencilObserverInteraction createShadowViewIfNecessary](v3);

  }
}

+ (void)hideShadowViewForSceneIfNecessary:(id)a3
{
  void *v3;
  id v4;

  +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    *((_BYTE *)v4 + 32) = 0;
    objc_msgSend(*((id *)v4 + 6), "removeFromSuperview");
    v3 = (void *)*((_QWORD *)v4 + 6);
    *((_QWORD *)v4 + 6) = 0;

  }
}

+ (id)shadowViewForScene:(id)a3
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;

  +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v3 = (_QWORD *)v3[6];
  v5 = v3;

  return v5;
}

- (void)strokeBegan
{
  self->_presentationCount = 0;
}

void __38__PKPencilShadowView_startUpdateCycle__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  id WeakRetained;
  void *v5;
  BOOL IsEmpty;
  double v7;
  CFTimeInterval v8;
  uint64_t v9;
  CGRect v10;

  _UIMediaTimeForMachTime();
  v3 = v2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (uint64_t)WeakRetained;
    objc_msgSend(WeakRetained, "bounds");
    IsEmpty = CGRectIsEmpty(v10);
    v5 = (void *)v9;
    if (!IsEmpty)
    {
      v7 = v3 + *(double *)(v9 + 480) * 2.0 + -0.001;
      v8 = CACurrentMediaTime();
      v5 = (void *)v9;
      if (v8 < v7)
        atomic_store(*(unint64_t *)&v7, (unint64_t *)(v9 + 584));
      if (!*(_BYTE *)(v9 + 554))
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
        -[PKPencilShadowView _updateFrame](v9);
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        v5 = (void *)v9;
      }
    }
  }

}

void __38__PKPencilShadowView_startUpdateCycle__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  id WeakRetained;
  void *v5;
  BOOL IsEmpty;
  char ShouldBeVisibleForCurrentTiled;
  uint64_t v8;
  uint64_t v9;
  BOOL v11;
  double v12;
  int v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  os_log_t v43;
  uint64_t v44;
  _QWORD block[5];
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint8_t buf[8];
  uint64_t v52;
  uint64_t (*v53)(uint64_t);
  void *v54;
  uint64_t v55;
  os_log_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  CGRect v66;

  _UIMediaTimeForMachTime();
  v3 = v2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v44 = (uint64_t)WeakRetained;
    objc_msgSend(WeakRetained, "bounds");
    IsEmpty = CGRectIsEmpty(v66);
    v5 = (void *)v44;
    if (!IsEmpty)
    {
      ShouldBeVisibleForCurrentTiled = -[PKPencilShadowView _shadowShouldBeVisibleForCurrentTiledView](v44);
      v8 = v44;
      if ((ShouldBeVisibleForCurrentTiled & 1) != 0 || *(double *)(v44 + 424) == 0.0)
      {
        v9 = *(_QWORD *)(v44 + 560);
        *(_QWORD *)(v44 + 560) = v9 + 1;
        v11 = ((v9 + 1) & 1) == 0 && v9 < 15;
        *(_BYTE *)(v44 + 554) = v11;
        if (!*(_BYTE *)(v44 + 554))
        {
          v12 = COERCE_DOUBLE(atomic_load((unint64_t *)(v44 + 584)));
          if (v3 < v12)
          {
            v13 = -5;
            while (!__CFADD__(v13++, 1))
            {
              usleep(0xFAu);
              v8 = v44;
              v15 = COERCE_DOUBLE(atomic_load((unint64_t *)(v44 + 584)));
              if (v3 >= v15)
                goto LABEL_19;
            }
            *(_BYTE *)(v8 + 554) = 1;
            _UIMachTimeForMediaTime();
            kdebug_trace();
            v8 = v44;
          }
        }
LABEL_19:
        v16 = *(double *)(v8 + 432);
        v17 = *(double *)(v8 + 424);
        v18 = 10.0;
        if (v17 > v16)
          v18 = 30.0;
        v19 = (v17 + v16 * (v18 + -1.0)) / v18;
        *(double *)(v8 + 432) = v19;
        v20 = *(double *)(v8 + 632) * (*(double *)(v8 + 488) * v19);
        v21 = 0.0;
        if (v20 >= 0.00390625)
        {
          v21 = v20;
          if (v20 > 0.99609375)
            v21 = 1.0;
        }
        v22 = CACurrentMediaTime();
        v23 = (void *)v44;
        if (*(_QWORD *)(v44 + 624)
          && *(double *)(v44 + 424) == 1.0
          && *(double *)(v44 + 432) > 0.9
          && v22 - *(double *)(v44 + 504) > 0.1
          && !*(_BYTE *)(v44 + 552))
        {
          objc_msgSend((id)v44, "updateInk:animated:", 0, 1);
          v23 = (void *)v44;
        }
        objc_msgSend(v23, "zPosition");
        v25 = v24;
        objc_msgSend((id)v44, "altitude");
        v27 = v26;
        objc_msgSend((id)v44, "rollAngle");
        v29 = v28;
        v30 = *(unsigned __int8 *)(v44 + 520);
        objc_msgSend((id)v44, "ink");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v32 = *(id *)(v44 + 536);

          v33 = *(id *)(v44 + 528);
          v34 = v44;
          v35 = v22 - *(double *)(v44 + 512) + v22 - *(double *)(v44 + 512);
          v36 = 1.0;
          if (v35 >= 1.0)
          {
            v37 = *(void **)(v44 + 536);
            *(_QWORD *)(v44 + 536) = 0;

            v38 = *(void **)(v44 + 528);
            *(_QWORD *)(v44 + 528) = 0;

            v34 = v44;
            *(_BYTE *)(v44 + 520) = 0;
            v31 = v32;
          }
          else
          {
            v31 = v32;
            v36 = v35;
          }
        }
        else
        {
          v33 = 0;
          v36 = 1.0;
          v34 = v44;
        }
        if (v21 == 0.0 || !*(_BYTE *)(v34 + 554))
        {
          objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
          objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
          objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
          objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
          objc_msgSend((id)v44, "setAlpha:", v21);
          objc_msgSend((id)v44, "setHidden:", v21 == 0.0);
          if (v21 > 0.0)
          {
            v39 = *(NSObject **)(v44 + 448);
            v40 = MEMORY[0x1E0C809B0];
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __48__PKPencilShadowView__vsyncWithTargetTimestamp___block_invoke;
            block[3] = &unk_1E777BA60;
            block[4] = v44;
            v46 = v31;
            v47 = v33;
            v48 = v29;
            v49 = v27;
            v50 = v36;
            dispatch_async(v39, block);
            if ((objc_msgSend(*(id *)(v44 + 416), "isDrawableAvailable") & 1) != 0)
            {
              objc_msgSend(*(id *)(v44 + 416), "nextDrawable");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41)
              {
                v60 = 0;
                v61 = &v60;
                v62 = 0x3032000000;
                v63 = __Block_byref_object_copy__20;
                v64 = __Block_byref_object_dispose__20;
                v65 = 0;
                v42 = *(NSObject **)(v44 + 448);
                *(_QWORD *)buf = v40;
                v52 = 3221225472;
                v53 = __53__PKPencilShadowView__renderAtHeight_altitude_alpha___block_invoke;
                v54 = &unk_1E777BA88;
                v57 = &v60;
                v55 = v44;
                v43 = v41;
                v56 = v43;
                v58 = v27;
                v59 = v25;
                dispatch_sync(v42, buf);
                objc_msgSend((id)v61[5], "waitUntilScheduled");
                -[NSObject present](v43, "present");

                _Block_object_dispose(&v60, 8);
              }
              else
              {
                v43 = 0;
              }
            }
            else
            {
              v43 = os_log_create("com.apple.pencilkit", ");
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BE213000, v43, OS_LOG_TYPE_DEFAULT, "PKPencilShadowView: No drawable available; skipping frame",
                  buf,
                  2u);
              }
            }

          }
          objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
          if (v21 == 0.0 && *(double *)(v44 + 424) == 0.0 && !*(_BYTE *)(v44 + 520))
            -[PKPencilShadowView pauseUpdateCycle](v44);
        }

      }
      else
      {
        objc_msgSend((id)v44, "updateOpacity:animated:", 1, 0.0);
      }
      v5 = (void *)v44;
    }
  }

}

- (void)didMoveToSuperview
{
  void *v3;

  -[PKPencilShadowView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PKPencilShadowView pauseUpdateCycle]((uint64_t)self);
}

- (void)pauseUpdateCycle
{
  void *v2;

  if (a1)
  {
    *(_BYTE *)(a1 + 553) = 1;
    if (*(_QWORD *)(a1 + 576))
    {
      _UIUpdateRequestDeactivate();
      _UIUpdateSequenceRemoveItem();
      _UIUpdateSequenceRemoveItem();
      *(_QWORD *)(a1 + 576) = 0;
      *(_QWORD *)(a1 + 568) = 0;
    }
    *(_QWORD *)(a1 + 432) = 0;
    objc_msgSend(*(id *)(a1 + 496), "invalidate");
    v2 = *(void **)(a1 + 496);
    *(_QWORD *)(a1 + 496) = 0;

  }
}

- (void)updateOpacity:(double)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  NSTimer *v8;
  NSTimer *idleTimer;
  _QWORD v10[4];
  id v11[5];
  id v12;
  id from[4];
  id v14;
  id location;

  self->_targetOpacity = a3;
  if (a3 > 0.0 && self->_updateCyclePaused)
  {
    self->_updateCyclePaused = 0;
    self->_presentationCount = 0;
    if (!self->_vsyncItem)
    {
      objc_initWeak(&location, self);
      _UIUpdateRequestActivate();
      v6 = (void *)MEMORY[0x1E0C809B0];
      from[0] = (id)MEMORY[0x1E0C809B0];
      from[1] = (id)3221225472;
      from[2] = __38__PKPencilShadowView_startUpdateCycle__block_invoke;
      from[3] = &unk_1E777BA10;
      objc_copyWeak(&v14, &location);
      self->_commitItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
      v11[1] = v6;
      v11[2] = (id)3221225472;
      v11[3] = __38__PKPencilShadowView_startUpdateCycle__block_invoke_2;
      v11[4] = &unk_1E777BA10;
      objc_copyWeak(&v12, &location);
      self->_vsyncItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    if (!self->_idleTimer)
    {
      objc_initWeak(from, self);
      v7 = (void *)MEMORY[0x1E0C99E88];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __45__PKPencilShadowView_updateOpacity_animated___block_invoke;
      v10[3] = &unk_1E777BA38;
      objc_copyWeak(v11, from);
      objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, v10, 0.5);
      v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      idleTimer = self->_idleTimer;
      self->_idleTimer = v8;

      objc_destroyWeak(v11);
      objc_destroyWeak(from);
    }
  }
}

void __45__PKPencilShadowView_updateOpacity_animated___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  CFTimeInterval v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WeakRetained[62])
    {
      v3 = WeakRetained;
      v2 = CACurrentMediaTime();
      WeakRetained = v3;
      if (v2 - *((double *)v3 + 63) > 10.0 && !*((_BYTE *)v3 + 552))
      {
        objc_msgSend(v3, "updateOpacity:animated:", 1, 0.0);
        WeakRetained = v3;
      }
    }
  }

}

- (void)updateInk:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  PKInk *v7;
  PKInk *ink;
  PKInk *v9;
  PKInk *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *renderQueue;
  _QWORD v15[5];
  PKInk *v16;

  v4 = a4;
  v7 = (PKInk *)a3;
  ink = self->_ink;
  v9 = ink;
  v10 = v9;
  if (v9 != v7)
  {
    -[PKInk identifier](v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInk identifier](v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_ink, a3);
      if (v4 && !self->_updateCyclePaused)
      {
        self->_animatingInk = 1;
        self->_animatingInkBeginTimestamp = CACurrentMediaTime();
        objc_storeStrong((id *)&self->_animatingInkOld, ink);
        objc_storeStrong((id *)&self->_animatingInkNew, a3);
      }
      else
      {
        self->_animatingInk = 0;
        renderQueue = self->_renderQueue;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __41__PKPencilShadowView_updateInk_animated___block_invoke;
        v15[3] = &unk_1E7777C20;
        v15[4] = self;
        v16 = v7;
        dispatch_async(renderQueue, v15);

      }
    }
  }

}

uint64_t __41__PKPencilShadowView_updateInk_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "updateInk:", *(_QWORD *)(a1 + 40));
}

- (void)setInk:(id)a3
{
  -[PKPencilShadowView updateInk:animated:](self, "updateInk:animated:", a3, 1);
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
  if (CACurrentMediaTime() - self->_latestKeepVisibleTimestamp < 10.0)
    -[PKPencilShadowView updateOpacity:animated:](self, "updateOpacity:animated:", 1, 1.0);
  -[PKPencilShadowView _updateFrameIfNecessary]((uint64_t)self);
}

- (uint64_t)_updateFrameIfNecessary
{
  uint64_t v1;
  double v2;
  double v3;
  BOOL v4;
  double v5;
  double v6;
  BOOL v7;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 416), "bounds");
    v4 = v3 == *(double *)(v1 + 464) && v2 == *(double *)(v1 + 472);
    if (!v4
      || ((result = objc_msgSend((id)v1, "bounds"), v6 == *(double *)(v1 + 464))
        ? (v7 = v5 == *(double *)(v1 + 472))
        : (v7 = 0),
          !v7 || *(_BYTE *)(v1 + 553)))
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
      -[PKPencilShadowView _updateFrame](v1);
      return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
  return result;
}

- (void)setAzimuth:(double)a3
{
  self->_azimuth = a3;
  -[PKPencilShadowView _updateFrameIfNecessary]((uint64_t)self);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPencilShadowView;
  -[PKPencilShadowView layoutSubviews](&v3, sel_layoutSubviews);
  -[CAMetalLayer setFrame:](self->_metalLayer, "setFrame:", 0.0, 0.0, self->_viewSize.width, self->_viewSize.height);
}

- (uint64_t)_shadowShouldBeVisibleForCurrentTiledView
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    if (*(_BYTE *)(result + 552))
      return 1;
    v1 = objc_loadWeakRetained((id *)(result + 544));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.freeform"));

    if (v4)
    {

      if (v1)
        return 1;
    }
    else
    {
      v5 = v1;
      if (v1)
      {
        objc_msgSend(v1, "window");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v1;
        if (v6)
        {
          v5 = v1;
          while ((objc_msgSend(v5, "isHidden") & 1) == 0)
          {
            objc_msgSend(v5, "superview");
            v7 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v7;
            if (!v7)
            {

              return 1;
            }
          }
        }
      }

    }
    CACurrentMediaTime();
    return 0;
  }
  return result;
}

- (void)keepAlwaysVisible
{
  self->_keepAlwaysVisible = 1;
  -[PKPencilShadowView updateOpacity:animated:](self, "updateOpacity:animated:", 1, 1.0);
}

- (void)keepVisibleInTiledView:(id)a3
{
  int ShouldBeVisibleForCurrentTiled;
  double v5;

  objc_storeWeak((id *)&self->_keepVisibleInTiledView, a3);
  self->_latestKeepVisibleTimestamp = CACurrentMediaTime();
  ShouldBeVisibleForCurrentTiled = -[PKPencilShadowView _shadowShouldBeVisibleForCurrentTiledView]((uint64_t)self);
  v5 = 0.0;
  if (ShouldBeVisibleForCurrentTiled)
    v5 = 1.0;
  -[PKPencilShadowView updateOpacity:animated:](self, "updateOpacity:animated:", 1, v5);
}

- (void)hideShadow
{
  -[PKPencilShadowView updateOpacity:animated:](self, "updateOpacity:animated:", 1, 0.0);
}

- (uint64_t)_updateFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  CGAffineTransform v18;
  _OWORD v19[3];
  CGAffineTransform v20;

  v2 = *(double *)(a1 + 472) * 0.5;
  +[PKMetalPencilShadowRenderer maxBlurSize](PKMetalPencilShadowRenderer, "maxBlurSize");
  v4 = v2 * v3;
  +[PKMetalPencilShadowRenderer pixelSize](PKMetalPencilShadowRenderer, "pixelSize");
  memset(&v20, 0, sizeof(v20));
  v6 = v4 / v5;
  objc_msgSend((id)a1, "azimuth");
  CGAffineTransformMakeRotation(&v20, v7);
  v8 = v20.tx + v6 * v20.c + v20.a * 0.0;
  v9 = v20.ty + v6 * v20.d + v20.b * 0.0;
  objc_msgSend((id)a1, "location");
  v11 = v10 - *(double *)(a1 + 464) * 0.5 - v8;
  objc_msgSend((id)a1, "location");
  v13 = v12 - v9;
  v14 = *(double *)(a1 + 464);
  v15 = *(double *)(a1 + 472);
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v19[0] = *MEMORY[0x1E0C9BAA8];
  v19[1] = v16;
  v19[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend((id)a1, "setTransform:", v19);
  objc_msgSend((id)a1, "setFrame:", v11, v13, v14, v15);
  v18 = v20;
  objc_msgSend((id)a1, "setTransform:", &v18);
  return objc_msgSend(*(id *)(a1 + 416), "setFrame:", 0.0, 0.0, *(double *)(a1 + 464), *(double *)(a1 + 472));
}

uint64_t __48__PKPencilShadowView__vsyncWithTargetTimestamp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "updateInk:oldInk:rollAngle:altitudeAngle:progress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __53__PKPencilShadowView__renderAtHeight_altitude_alpha___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "commandQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandBuffer");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  +[PKMetalPencilShadowRenderer pixelSize](PKMetalPencilShadowRenderer, "pixelSize");
  v7 = v6;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  objc_msgSend(*(id *)(a1 + 40), "texture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderInto:commandBuffer:position:azimuth:altitude:height:alpha:scale:clearFramebuffer:grayscale:", v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 1, v7 * 0.5, 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64), 1.0, 1.0, 0.1);

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "commit");
}

- (void)signalVSyncSemaphore:(double)a3 presentationTime:(unint64_t)a4
{
  atomic_store(0, (unint64_t *)&self->_skipRendersUntilTime);
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)azimuth
{
  return self->_azimuth;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (void)setRollAngle:(double)a3
{
  self->_rollAngle = a3;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (void)setZPosition:(double)a3
{
  self->_zPosition = a3;
}

- (PKInk)ink
{
  return self->_ink;
}

- (double)shadowAlphaMultiplier
{
  return self->_shadowAlphaMultiplier;
}

- (void)setShadowAlphaMultiplier:(double)a3
{
  self->_shadowAlphaMultiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ink, 0);
  objc_destroyWeak((id *)&self->_keepVisibleInTiledView);
  objc_storeStrong((id *)&self->_animatingInkNew, 0);
  objc_storeStrong((id *)&self->_animatingInkOld, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_shadowRenderer, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
}

@end
