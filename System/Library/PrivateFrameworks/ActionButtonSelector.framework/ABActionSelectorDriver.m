@implementation ABActionSelectorDriver

- (id)initWithItems:(void *)a3 selectedIndex:(int)a4 isInWelcomeMode:(void *)a5 renderBlock:
{
  id v10;
  id v11;
  id *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  ABDeviceButtonAnimator *v31;
  void *v32;
  void *v33;
  id *v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  objc_super v43;
  _QWORD v44[10];
  _QWORD v45[12];

  v45[10] = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a5;
  if (a1)
  {
    v43.receiver = a1;
    v43.super_class = (Class)ABActionSelectorDriver;
    v12 = (id *)objc_msgSendSuper2(&v43, sel_init);
    a1 = v12;
    if (v12)
    {
      v42 = v10;
      objc_storeStrong(v12 + 11, a2);
      v40 = a3;
      v41 = v11;
      a1[12] = a3;
      *((_BYTE *)a1 + 82) = a4;
      v13 = MEMORY[0x23B7E420C](v11);
      v14 = a1[1];
      a1[1] = (id)v13;

      v15 = 2;
      if (a4)
        v15 = 0;
      a1[7] = (id)v15;
      v44[0] = CFSTR("Rotation");
      v39 = (void *)objc_opt_new();
      v45[0] = v39;
      v44[1] = CFSTR("Scale");
      v16 = (void *)objc_opt_new();
      v45[1] = v16;
      v44[2] = CFSTR("xOffset");
      v17 = (void *)objc_opt_new();
      v45[2] = v17;
      v44[3] = CFSTR("yOffset");
      v18 = (void *)objc_opt_new();
      v45[3] = v18;
      v44[4] = CFSTR("zOffset");
      v19 = (void *)objc_opt_new();
      v45[4] = v19;
      v44[5] = CFSTR("FocusDistance");
      v20 = (void *)objc_opt_new();
      v45[5] = v20;
      v44[6] = CFSTR("FocalLength");
      v21 = (void *)objc_opt_new();
      v45[6] = v21;
      v44[7] = CFSTR("fStop");
      v22 = (void *)objc_opt_new();
      v45[7] = v22;
      v44[8] = CFSTR("LightingIntensity");
      v23 = (void *)objc_opt_new();
      v45[8] = v23;
      v44[9] = CFSTR("ZoomInProgress");
      v24 = (void *)objc_opt_new();
      v45[9] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 10);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = a1[2];
      a1[2] = (id)v25;

      if (*((_BYTE *)a1 + 82))
        ABWelcomeModeZoomedOutSceneParams();
      else
        ABDefaultZoomedOutSceneParams();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = a1[5];
      a1[5] = (id)v27;

      v10 = v42;
      if (*((_BYTE *)a1 + 82))
        ABWelcomeModeZoomedInSceneParams();
      else
        ABDefaultZoomedInSceneParams();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = a1[6];
      a1[6] = (id)v29;

      v31 = [ABDeviceButtonAnimator alloc];
      objc_msgSend(v42, "objectAtIndexedSubscript:", v40);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "color");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[ABDeviceButtonAnimator initWithBaseColor:]((id *)&v31->super.isa, v33);
      v35 = a1[3];
      a1[3] = v34;

      v36 = objc_opt_new();
      v37 = a1[4];
      a1[4] = (id)v36;

      v11 = v41;
    }
  }

  return a1;
}

- (uint64_t)resume
{
  id *v1;
  NSObject *v2;
  uint64_t v3;
  id v4;
  double v5;
  id v6;
  void *v7;
  int v8;
  id *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = (id *)result;
    if (!*(_QWORD *)(result + 64))
    {
      ABLogger();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543362;
        v9 = v1;
        _os_log_impl(&dword_235E72000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) resume scene updates", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", v1, sel__updateForDisplayLink_);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = v1[8];
      v1[8] = (id)v3;

      *(float *)&v5 = ABFrameRateRange();
      objc_msgSend(v1[8], "setPreferredFrameRateRange:", v5);
      objc_msgSend(v1[8], "setHighFrameRateReason:", ABHighFrameRateUpdateReasonMake(101));
      v6 = v1[8];
      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addToRunLoop:forMode:", v7, *MEMORY[0x24BDBCB80]);

      objc_msgSend(v1, "_updateSceneInterpolatorsResettingToTarget:", 1);
      objc_msgSend(v1, "_updateTransitionSchedulerState");
      return objc_msgSend(v1, "_updateButtonAnimatorActiveState");
    }
  }
  return result;
}

- (uint64_t)pause
{
  _QWORD *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = (_QWORD *)result;
    if (*(_QWORD *)(result + 64))
    {
      ABLogger();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138543362;
        v7 = v1;
        _os_log_impl(&dword_235E72000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) pause scene updates", (uint8_t *)&v6, 0xCu);
      }

      v3 = (void *)v1[8];
      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeFromRunLoop:forMode:", v4, *MEMORY[0x24BDBCB80]);

      v5 = (void *)v1[8];
      v1[8] = 0;

      objc_msgSend(v1, "_updateTransitionSchedulerState");
      return objc_msgSend(v1, "_updateButtonAnimatorActiveState");
    }
  }
  return result;
}

- (void)updateSelectedIndex:(int)a3 animateButtonColor:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a1)
  {
    v6 = objc_msgSend(*(id *)(a1 + 88), "count");
    if (v6 - 1 < a2)
      a2 = v6 - 1;
    *(_QWORD *)(a1 + 96) = a2;
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend((id)a1, "_scheduleZoomOutIfNeeded");
    }
    else if (!*(_BYTE *)(a1 + 82))
    {
      objc_msgSend((id)a1, "_updateWithState:dragProgress:", 1, *(_QWORD *)(a1 + 72));
    }
    v7 = *(_QWORD *)(a1 + 24);
    objc_msgSend(*(id *)(a1 + 88), "objectAtIndexedSubscript:", a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABDeviceButtonAnimator setBaseColor:animated:](v7, v8, a3);

  }
}

- (void)zoomIn
{
  if (a1)
  {
    if ((unint64_t)(*((_QWORD *)a1 + 7) - 1) >= 2)
      return (void *)objc_msgSend(a1, "_updateWithState:dragProgress:", 1, *((_QWORD *)a1 + 9));
  }
  return a1;
}

- (void)updateItems:(int)a3 animateButtonColor:
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 88), a2);
    v6 = *(_QWORD *)(a1 + 96);
    v7 = objc_msgSend(*(id *)(a1 + 88), "count") - 1;
    if (v6 < v7)
      v7 = v6;
    *(_QWORD *)(a1 + 96) = v7;
    objc_msgSend((id)a1, "_scheduleZoomOutIfNeeded");
    v8 = *(_QWORD *)(a1 + 24);
    objc_msgSend(*(id *)(a1 + 88), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 96));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABDeviceButtonAnimator setBaseColor:animated:](v8, v10, a3);

  }
}

- (void)zoomOut
{
  uint64_t v2;
  BOOL v3;

  if (a1)
  {
    v2 = *((_QWORD *)a1 + 7);
    if (v2)
      v3 = v2 == 3;
    else
      v3 = 1;
    if (!v3)
      return (void *)objc_msgSend(a1, "_updateWithState:dragProgress:", 3, *((_QWORD *)a1 + 9));
  }
  return a1;
}

- (void)zoomOutAfterDelay:(uint64_t *)val
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v4 = val[4];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __44__ABActionSelectorDriver_zoomOutAfterDelay___block_invoke;
    v5[3] = &unk_25073EE18;
    objc_copyWeak(&v6, &location);
    -[ABDelayedBlockExecutor scheduleBlock:delay:](v4, v5, a2);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __44__ABActionSelectorDriver_zoomOutAfterDelay___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  BOOL v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[7];
    if (v2)
      v3 = v2 == 3;
    else
      v3 = 1;
    if (!v3)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_updateWithState:dragProgress:", 3, WeakRetained[9]);
      WeakRetained = v4;
    }
  }

}

- (_QWORD)startDragging
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    if (result[7] == 3)
      v2 = 1;
    else
      v2 = result[7];
    objc_msgSend(result, "_updateWithState:dragProgress:", v2, &unk_250742658);
    return (_QWORD *)objc_msgSend(v1, "_updateTransitionSchedulerState");
  }
  return result;
}

- (void)updateDragProgress:(_QWORD *)a1
{
  uint64_t v3;
  double v5;
  id v6;

  if (a1)
  {
    v3 = a1[7];
    if (v3 == 3 || v3 == 0)
    {
      v5 = -a2;
      if (a2 >= 0.0)
        v5 = a2;
      if (v5 > 0.1)
        v3 = 1;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_updateWithState:dragProgress:", v3, v6);

  }
}

- (_QWORD)endDragging
{
  void *v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    v2 = result[7];
    if (v2)
      v3 = v2 == 3;
    else
      v3 = 1;
    if (v3)
      v4 = 1;
    else
      v4 = result[7];
    objc_msgSend(result, "_updateWithState:dragProgress:", v4, 0);
    return (_QWORD *)objc_msgSend(v1, "_updateTransitionSchedulerState");
  }
  return result;
}

- (_BYTE)didRevealScene
{
  void *v1;

  if (result)
  {
    v1 = result;
    result[81] = 1;
    objc_msgSend(result, "_updateTransitionSchedulerState");
    objc_msgSend(v1, "_updateButtonAnimatorActiveState");
    return (_BYTE *)objc_msgSend(v1, "_scheduleZoomOutIfNeeded");
  }
  return result;
}

- (void)occlusionDidChange:(void *)a1
{
  if (a1)
  {
    if (*((unsigned __int8 *)a1 + 80) != (_DWORD)a2)
    {
      *((_BYTE *)a1 + 80) = (_BYTE)a2;
      return (void *)objc_msgSend(a1, "_updateTransitionSchedulerState");
    }
  }
  return a1;
}

- (void)updateWithZoomedOutSceneParamsOverride:(void *)a3 zoomedInSceneParamsOverride:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (a1)
  {
    if (v10)
    {
      v6 = v10;
    }
    else
    {
      ABDefaultZoomedOutSceneParams();
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)a1[5];
    a1[5] = v6;

    if (v5)
    {
      v8 = v5;
    }
    else
    {
      ABDefaultZoomedInSceneParams();
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)a1[6];
    a1[6] = v8;

    objc_msgSend(a1, "_updateSceneInterpolatorsResettingToTarget:", 1);
  }

}

- (id)_sceneParamsForState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  ABActionSelectorDriver *v8;
  NSNumber *dragProgress;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *zoomedInParams;
  uint64_t v16;
  long double __y;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v18 = v4;
  v19 = v3;
  v20 = v5;
  v21 = v6;
  v8 = self;
  switch(a3)
  {
    case 0:
    case 2:
      dragProgress = self->_dragProgress;
      if (!dragProgress)
      {
        v16 = 48;
        if (!a3)
          v16 = 40;
        zoomedInParams = *(NSDictionary **)((char *)&v8->super.isa + v16);
        goto LABEL_19;
      }
      -[NSNumber doubleValue](dragProgress, "doubleValue");
      if (v10 < 0.0)
        v10 = 0.0;
      v11 = modf(v10, &__y);
      if (v11 < 0.0)
        v11 = -v11;
      v12 = 48;
      if (a3)
        v13 = 48;
      else
        v13 = 40;
      if (a3)
        v12 = 40;
      ABScrollDraggingStateParams(*(void **)((char *)&v8->super.isa + v13), *(void **)((char *)&v8->super.isa + v12), v11, 0.1);
      self = (ABActionSelectorDriver *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      zoomedInParams = self->_zoomedInParams;
      goto LABEL_19;
    case 3:
      zoomedInParams = self->_zoomedOutParams;
LABEL_19:
      self = zoomedInParams;
      break;
    default:
      return self;
  }
  return self;
}

- (void)_updateSceneInterpolatorsResettingToTarget:(BOOL)a3
{
  void *v5;
  NSDictionary *sceneInterpolators;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  -[ABActionSelectorDriver _sceneParamsForState:](self, "_sceneParamsForState:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sceneInterpolators = self->_sceneInterpolators;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__ABActionSelectorDriver__updateSceneInterpolatorsResettingToTarget___block_invoke;
  v8[3] = &unk_25073EEA8;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](sceneInterpolators, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __69__ABActionSelectorDriver__updateSceneInterpolatorsResettingToTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;

  v22 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Damping"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("DampingSmooth"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ResponseSmooth"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v22, "setParameters:", v9, v12, 0.0, v15);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TimeFactor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v22, "setTimeFactor:", v18);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v22, "setTarget:", v21);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v22, "resetToTarget");

}

- (void)_updateTransitionSchedulerState
{
  if (self->_isOccluded || self->_dragProgress || !self->_displayLink || !self->_isSceneRevealed)
    -[ABDelayedBlockExecutor pause](self->_transitionScheduler, a2);
  else
    -[ABDelayedBlockExecutor resume]((uint64_t)self->_transitionScheduler);
}

- (void)_updateButtonAnimatorActiveState
{
  int v2;

  v2 = self->_isSceneRevealed && !self->_state && self->_displayLink != 0;
  -[ABDeviceButtonAnimator setActive:]((uint64_t)self->_buttonAnimator, v2);
}

- (void)_updateWithState:(int64_t)a3 dragProgress:(id)a4
{
  int64_t state;
  int64_t v8;
  NSDictionary *v9;
  NSDictionary *zoomedOutParams;
  NSDictionary *v11;
  NSDictionary *zoomedInParams;
  id v13;

  v13 = a4;
  state = self->_state;
  if (state != a3)
  {
LABEL_4:
    self->_state = a3;
    objc_storeStrong((id *)&self->_dragProgress, a4);
    v8 = self->_state;
    if (v8 == state)
    {
LABEL_11:
      -[ABActionSelectorDriver _updateSceneInterpolatorsResettingToTarget:](self, "_updateSceneInterpolatorsResettingToTarget:", 0);
      goto LABEL_12;
    }
    if (v8 == 2)
    {
      if (!self->_isInWelcomeMode)
      {
LABEL_10:
        -[ABActionSelectorDriver _updateButtonAnimatorActiveState](self, "_updateButtonAnimatorActiveState");
        -[ABActionSelectorDriver _scheduleZoomOutIfNeeded](self, "_scheduleZoomOutIfNeeded");
        goto LABEL_11;
      }
      self->_isInWelcomeMode = 0;
      ABDefaultZoomedOutSceneParams();
      v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      zoomedOutParams = self->_zoomedOutParams;
      self->_zoomedOutParams = v9;

      ABDefaultZoomedInSceneParams();
      v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      zoomedInParams = self->_zoomedInParams;
      self->_zoomedInParams = v11;

      v8 = self->_state;
    }
    if ((v8 | 2) == 3)
      -[ABDelayedBlockExecutor cancelPendingBlock](&self->_transitionScheduler->super.isa);
    goto LABEL_10;
  }
  if ((ABEqualObjects(self->_dragProgress, v13) & 1) == 0)
  {
    state = self->_state;
    goto LABEL_4;
  }
LABEL_12:

}

- (void)_updateRenderInputs
{
  void *v3;
  double v4;
  CGFloat v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  int64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _BOOL4 isInWelcomeMode;
  UIColor *v44;
  BOOL v45;
  double v46;
  BOOL v47;
  double v48;
  int64_t state;
  BOOL v50;
  BOOL v52;
  UIColor *color;
  CATransform3D v54;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v57;
  CATransform3D v58;
  CATransform3D v59;
  CATransform3D v60;
  CATransform3D v61;

  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("Scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = v4;

  memset(&v61, 0, sizeof(v61));
  CATransform3DMakeScale(&v61, v5, v5, v5);
  memset(&v60, 0, sizeof(v60));
  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("Rotation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v8 = ABDegreesToRadians(v7);
  CATransform3DMakeRotation(&v60, v8, 0.0, 1.0, 0.0);

  memset(&v59, 0, sizeof(v59));
  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("xOffset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v11 = v10;
  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("yOffset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v14 = v13;
  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("zOffset"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  CATransform3DMakeTranslation(&v59, v11, v14, v16);

  memset(&v58, 0, sizeof(v58));
  a = v61;
  b = v60;
  CATransform3DConcat(&v57, &a, &b);
  a = v59;
  CATransform3DConcat(&v58, &v57, &a);
  -[ABActionSelectorDriver _sceneParamsForState:](self, "_sceneParamsForState:", self->_state);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABDeviceButtonAnimator color]((id **)self->_buttonAnimator);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v58;
  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("fStop"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "value");
  v21 = v20;
  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("FocusDistance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "value");
  v24 = v23;
  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("FocalLength"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "value");
  v27 = v26;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ApertureBlades"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v30 = v29;

  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("LightingIntensity"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "value");
  v33 = v32;
  v34 = v18;
  v35 = -[ABDeviceButtonAnimator opacity]((uint64_t)self->_buttonAnimator);
  v36 = -[ABDeviceButtonAnimator pressProgress]((uint64_t)self->_buttonAnimator);
  if (self->_isInWelcomeMode)
    v37 = -[ABDeviceButtonAnimator islandMode]((uint64_t)self->_buttonAnimator);
  else
    v37 = 0;
  self->_sceneRenderInputs.modelTransform = v54;
  self->_sceneRenderInputs.cameraAndLight.fStop = v21;
  self->_sceneRenderInputs.cameraAndLight.focusDistance = v24;
  self->_sceneRenderInputs.cameraAndLight.focalLength = v27;
  self->_sceneRenderInputs.cameraAndLight.apertureBladeCount = v30;
  self->_sceneRenderInputs.cameraAndLight.lightingIntensity = v33;
  objc_storeStrong((id *)&self->_sceneRenderInputs.buttonHighlight.color, v18);
  self->_sceneRenderInputs.buttonHighlight.opacity = v35;
  self->_sceneRenderInputs.buttonPressProgress = v36;
  self->_sceneRenderInputs.islandMode = v37;

  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("ZoomInProgress"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "value");
  v40 = v39;

  if (self->_isInWelcomeMode)
    v41 = ABClamp((v40 + -0.25) / 0.65 + 0.0, 0.0, 1.0);
  else
    v41 = 1.0;
  v42 = -[ABDeviceButtonAnimator pressProgress]((uint64_t)self->_buttonAnimator);
  isInWelcomeMode = self->_isInWelcomeMode;
  v44 = (UIColor *)v34;
  v45 = -[ABDeviceButtonAnimator isRingHighlightVisible]((_BOOL8)self->_buttonAnimator);
  if (self->_isInWelcomeMode)
  {
    v46 = ABClamp(v40 / -0.15 + 1.0, 0.0, 1.0);
    if (self->_isInWelcomeMode)
    {
      v47 = 0;
      v48 = v40 * 0.25 + 0.25;
      goto LABEL_18;
    }
  }
  else
  {
    v46 = 0.0;
  }
  state = self->_state;
  if (state)
    v50 = state == 3;
  else
    v50 = 1;
  v47 = v50;
  v48 = 0.5;
LABEL_18:
  v52 = v40 > 0.3 || !isInWelcomeMode;
  self->_overlayRenderInputs.carouselInputs.pressProgress = v42;
  self->_overlayRenderInputs.carouselInputs.itemOpacity = v41;
  self->_overlayRenderInputs.carouselInputs.selectedItemIgnoresOpacity = isInWelcomeMode;
  self->_overlayRenderInputs.carouselInputs.isScrollingEnabled = v52;
  color = self->_overlayRenderInputs.highlightRingInputs.color;
  self->_overlayRenderInputs.highlightRingInputs.color = v44;

  self->_overlayRenderInputs.highlightRingInputs.isVisible = v45;
  self->_overlayRenderInputs.detailsViewOpacity = v41;
  self->_overlayRenderInputs.welcomeViewOpacity = v46;
  self->_overlayRenderInputs.topShadowRatio = v48;
  self->_overlayRenderInputs.isZoomInByTapEnabled = v47;

}

- (void)_updateForDisplayLink:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  int64_t state;
  uint64_t v30;
  void (**renderBlock)(id, double, double);
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v7 = v6;

  -[ABActionSelectorDriver _sceneParamsForState:](self, "_sceneParamsForState:", self->_state);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[NSDictionary allValues](self->_sceneInterpolators, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    v13 = (1.0 - v7 + -0.1) * -1.2 / 0.2 + 2.0;
    if (1.0 - v7 >= 0.3)
      v13 = 0.8;
    if (1.0 - v7 >= 0.1)
      v14 = v13;
    else
      v14 = (1.0 - v7) * -3.0 / 0.1 + 5.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v16, "parameters");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v23 = v14;
        if (self->_state != 3)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Response"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v23 = v25;

        }
        objc_msgSend(v16, "setParameters:", v18, v20, v23, v22);
        objc_msgSend(v4, "duration");
        objc_msgSend(v16, "step:");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v11);
  }

  -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:", CFSTR("ZoomInProgress"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "value");
  v28 = v27;

  state = self->_state;
  if (state == 1 && v28 > 0.99)
  {
    v30 = 2;
LABEL_20:
    -[ABActionSelectorDriver _updateWithState:dragProgress:](self, "_updateWithState:dragProgress:", v30, self->_dragProgress);
    goto LABEL_21;
  }
  if (state == 3 && v28 < 0.01)
  {
    v30 = 0;
    goto LABEL_20;
  }
LABEL_21:
  -[ABDeviceButtonAnimator update]((uint64_t)self->_buttonAnimator);
  -[ABActionSelectorDriver _updateRenderInputs](self, "_updateRenderInputs");
  renderBlock = (void (**)(id, double, double))self->_renderBlock;
  -[CADisplayLink targetTimestamp](self->_displayLink, "targetTimestamp");
  v33 = v32;
  -[CADisplayLink duration](self->_displayLink, "duration");
  renderBlock[2](renderBlock, v33, v34);

}

- (void)_scheduleZoomOutIfNeeded
{
  void *v3;
  int v4;

  if (self->_state == 2 && self->_isSceneRevealed)
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedIndex);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canBeHighlighted");

    if (v4)
      -[ABActionSelectorDriver zoomOutAfterDelay:]((uint64_t *)self, 1.5);
    else
      -[ABDelayedBlockExecutor cancelPendingBlock](&self->_transitionScheduler->super.isa);
  }
}

- (uint64_t)items
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (uint64_t)selectedIndex
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (BOOL)isInWelcomeMode
{
  if (result)
    return *(_BYTE *)(result + 82) != 0;
  return result;
}

- (double)sceneRenderInputs
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  __int128 v12;

  if (a1)
  {
    v4 = *(void **)(a1 + 344);
    *(_QWORD *)(a2 + 160) = *(_QWORD *)(a1 + 336);
    v5 = *(_OWORD *)(a1 + 320);
    *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 304);
    *(_OWORD *)(a2 + 144) = v5;
    v6 = *(_OWORD *)(a1 + 256);
    *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 240);
    *(_OWORD *)(a2 + 80) = v6;
    v7 = *(_OWORD *)(a1 + 288);
    *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 272);
    *(_OWORD *)(a2 + 112) = v7;
    v8 = *(_OWORD *)(a1 + 192);
    *(_OWORD *)a2 = *(_OWORD *)(a1 + 176);
    *(_OWORD *)(a2 + 16) = v8;
    v9 = *(_OWORD *)(a1 + 224);
    *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 208);
    *(_OWORD *)(a2 + 48) = v9;
    v10 = v4;
    v11 = *(_QWORD *)(a1 + 352);
    *(_QWORD *)(a2 + 168) = v10;
    *(_QWORD *)(a2 + 176) = v11;
    v12 = *(_OWORD *)(a1 + 360);
    *(_OWORD *)(a2 + 184) = v12;
  }
  else
  {
    *(_QWORD *)(a2 + 192) = 0;
    *(_QWORD *)&v12 = 0;
    *(_OWORD *)(a2 + 160) = 0u;
    *(_OWORD *)(a2 + 176) = 0u;
    *(_OWORD *)(a2 + 128) = 0u;
    *(_OWORD *)(a2 + 144) = 0u;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return *(double *)&v12;
}

- (double)overlayRenderInputs
{
  void *v4;
  __int128 v5;

  if (a1)
  {
    *(_OWORD *)a2 = *(_OWORD *)(a1 + 104);
    v4 = *(void **)(a1 + 128);
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 120);
    *(_QWORD *)(a2 + 24) = v4;
    *(_BYTE *)(a2 + 32) = *(_BYTE *)(a1 + 136);
    *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 144);
    v5 = *(_OWORD *)(a1 + 153);
    *(_OWORD *)(a2 + 49) = v5;
  }
  else
  {
    *(_QWORD *)(a2 + 64) = 0;
    *(_QWORD *)&v5 = 0;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return *(double *)&v5;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dragProgress, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_zoomedInParams, 0);
  objc_storeStrong((id *)&self->_zoomedOutParams, 0);
  objc_storeStrong((id *)&self->_transitionScheduler, 0);
  objc_storeStrong((id *)&self->_buttonAnimator, 0);
  objc_storeStrong((id *)&self->_sceneInterpolators, 0);
  objc_storeStrong(&self->_renderBlock, 0);
}

@end
