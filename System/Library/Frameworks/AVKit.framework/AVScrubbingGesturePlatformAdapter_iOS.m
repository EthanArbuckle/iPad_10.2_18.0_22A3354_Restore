@implementation AVScrubbingGesturePlatformAdapter_iOS

- (void)setGestureEnabled:(BOOL)a3
{
  _BOOL8 v4;

  if (self->_gestureEnabled != a3)
  {
    self->_gestureEnabled = a3;
    v4 = -[AVScrubbingGesturePlatformAdapter_iOS gestureEnabled](self, "gestureEnabled");
    -[AVScrubbingPanGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", v4);
    -[AVTouchGestureRecognizer setEnabled:](self->_touchGestureRecognizer, "setEnabled:", v4);
  }
}

- (AVScrubbingGesturePlatformAdapter_iOS)initWithView:(id)a3
{
  id v4;
  AVScrubbingGesturePlatformAdapter_iOS *v5;
  AVScrubbingPanGestureRecognizer *v6;
  AVTouchGestureRecognizer *v7;
  AVScrubbingPanGestureRecognizer *panGestureRecognizer;
  AVScrubbingPanGestureRecognizer *v9;
  AVTouchGestureRecognizer *touchGestureRecognizer;
  AVTouchGestureRecognizer *v11;
  void *v12;
  uint64_t v13;
  float v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVScrubbingGesturePlatformAdapter_iOS;
  -[AVScrubbingGesturePlatformAdapter _abstractInit](&v16, sel__abstractInit);
  v5 = (AVScrubbingGesturePlatformAdapter_iOS *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[AVScrubbingPanGestureRecognizer initWithTarget:action:]([AVScrubbingPanGestureRecognizer alloc], "initWithTarget:action:", v5, sel__panGestureAction_);
    -[AVScrubbingPanGestureRecognizer setEnabled:](v6, "setEnabled:", 0);
    -[AVScrubbingPanGestureRecognizer setDelegate:](v6, "setDelegate:", v5);
    -[AVScrubbingPanGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", &unk_1E5BF4158);
    -[AVScrubbingPanGestureRecognizer _setRequiresSystemGesturesToFail:](v6, "_setRequiresSystemGesturesToFail:", 1);
    objc_msgSend(v4, "addGestureRecognizer:", v6);
    v7 = -[AVTouchGestureRecognizer initWithTarget:action:]([AVTouchGestureRecognizer alloc], "initWithTarget:action:", v5, sel__touchGestureAction_);
    -[AVTouchGestureRecognizer setEnabled:](v7, "setEnabled:", 0);
    -[AVTouchGestureRecognizer setDelegate:](v7, "setDelegate:", v5);
    -[AVTouchGestureRecognizer setAllowedTouchTypes:](v7, "setAllowedTouchTypes:", &unk_1E5BF4170);
    objc_msgSend(v4, "addGestureRecognizer:", v7);
    objc_storeWeak((id *)&v5->_view, v4);
    panGestureRecognizer = v5->_panGestureRecognizer;
    v5->_panGestureRecognizer = v6;
    v9 = v6;

    touchGestureRecognizer = v5->_touchGestureRecognizer;
    v5->_touchGestureRecognizer = v7;
    v11 = v7;

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "userInterfaceIdiom");
    v14 = 0.125;
    if (!v13)
      v14 = 0.25;
    v5->_deviceCoordinateVelocityScaleFactor = v14;
  }

  return v5;
}

- (BOOL)gestureEnabled
{
  return self->_gestureEnabled;
}

- (BOOL)gestureActive
{
  return self->_gestureActiveCount > 0;
}

- (void)setScrubbingWidth:(double)a3
{
  if (self->_scrubbingWidth != a3)
    self->_scrubbingWidth = a3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  AVScrubbingGesturePlatformAdapter_iOS *v4;
  void *v5;

  if (self->_touchGestureRecognizer != a3)
    return 1;
  v4 = self;
  -[AVScrubbingGesturePlatformAdapter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "scrubbingGesturePlatformAdapterIsActivelyScrubbing:", v4);

  return (char)v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  char v4;
  void *v5;

  if (self->_touchGestureRecognizer == a3)
  {
    objc_msgSend(a4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    v4 = 1;
  }
  return v4 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  AVTouchGestureRecognizer *v6;
  id v7;
  char isKindOfClass;

  v6 = (AVTouchGestureRecognizer *)a3;
  v7 = a4;
  if (self->_touchGestureRecognizer != v6 && (AVTouchGestureRecognizer *)self->_panGestureRecognizer == v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  AVScrubbingGesturePlatformAdapter_iOS *v5;
  id v6;
  uint64_t v7;

  if (self->_touchGestureRecognizer != a3)
    return 0;
  v5 = self;
  v6 = a4;
  -[AVScrubbingGesturePlatformAdapter delegate](v5, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend((id)v7, "scrubbingGesturePlatformAdapterIsActivelyScrubbing:", v5);

  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  return v7 & (v5 ^ 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  AVScrubbingPanGestureRecognizer *v6;
  AVScrubbingPanGestureRecognizer *v7;
  AVTouchGestureRecognizer *touchGestureRecognizer;
  BOOL v10;
  void *v11;
  int v12;
  int v13;

  v6 = (AVScrubbingPanGestureRecognizer *)a4;
  v7 = v6;
  touchGestureRecognizer = self->_touchGestureRecognizer;
  if (touchGestureRecognizer == a3)
  {
    -[AVScrubbingGesturePlatformAdapter delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "scrubbingGesturePlatformAdapterIsActivelyScrubbing:", self);

    objc_opt_class();
    v13 = objc_opt_isKindOfClass() & v12;
    if (self->_panGestureRecognizer == v7)
      v10 = 1;
    else
      v10 = v13;
  }
  else
  {
    v10 = touchGestureRecognizer == (AVTouchGestureRecognizer *)v6 && self->_panGestureRecognizer == a3;
  }

  return v10;
}

- (void)_panGestureAction:(id)a3
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  NSObject *v7;
  int64_t gestureActiveCount;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = -[AVScrubbingPanGestureRecognizer state](self->_panGestureRecognizer, "state", a3);
  switch(v4)
  {
    case 1:
      gestureActiveCount = self->_gestureActiveCount;
      self->_gestureActiveCount = gestureActiveCount + 1;
      if (!gestureActiveCount)
        -[AVScrubbingGesturePlatformAdapter_iOS _scrubGestureDidBegin]((uint64_t)self);
      goto LABEL_10;
    case 2:
LABEL_10:
      -[AVScrubbingGesturePlatformAdapter_iOS _updateGestureState]((uint64_t)self);
      break;
    case 3:
    case 4:
      v5 = self->_gestureActiveCount - 1;
      self->_gestureActiveCount = v5;
      if (!v5)
        -[AVScrubbingGesturePlatformAdapter_iOS _scrubGestureDidEnd]((uint64_t)self);
      break;
    case 5:
      return;
    default:
      v6 = v4;
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = 134217984;
        v10 = v6;
        _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: Unrecognized pan gesture state %ld", (uint8_t *)&v9, 0xCu);
      }

      break;
  }
}

- (void)_touchGestureAction:(id)a3
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  NSObject *v7;
  int64_t gestureActiveCount;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = -[AVTouchGestureRecognizer state](self->_touchGestureRecognizer, "state", a3);
  switch(v4)
  {
    case 1:
      gestureActiveCount = self->_gestureActiveCount;
      self->_gestureActiveCount = gestureActiveCount + 1;
      if (!gestureActiveCount)
        -[AVScrubbingGesturePlatformAdapter_iOS _scrubGestureDidBegin]((uint64_t)self);
      break;
    case 2:
    case 5:
      return;
    case 3:
    case 4:
      v5 = self->_gestureActiveCount - 1;
      self->_gestureActiveCount = v5;
      if (!v5)
        -[AVScrubbingGesturePlatformAdapter_iOS _scrubGestureDidEnd]((uint64_t)self);
      break;
    default:
      v6 = v4;
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = 134217984;
        v10 = v6;
        _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: Found invalid touch gesture state %ld", (uint8_t *)&v9, 0xCu);
      }

      break;
  }
}

- (CGPoint)translation
{
  double x;
  double y;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (float)timelineVelocity
{
  return self->_timelineVelocity;
}

- (double)scrubbingWidth
{
  return self->_scrubbingWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_touchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)_scrubGestureDidBegin
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  float v9;
  long double v10;
  float v11;
  float v12;
  float v13;
  id v14;

  if (a1)
  {
    v2 = *(void **)(a1 + 64);
    if (!v2)
    {
      objc_msgSend((id)a1, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend((id)a1, "delegate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "configurationForScrubbingGesturePlatformAdapter:", a1);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v5;

      }
      v2 = *(void **)(a1 + 64);
      if (!v2)
      {
        +[AVScrubbingGesturePlatformConfiguration defaultConfiguration](AVScrubbingGesturePlatformConfiguration, "defaultConfiguration");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v7;

        v2 = *(void **)(a1 + 64);
      }
    }
    objc_msgSend(v2, "nonLinearity");
    v10 = v9;
    v11 = __exp10(v9);
    v12 = pow(20000.0, v10);
    v13 = 19990.0 / (float)(v12 - v11);
    *(float *)(a1 + 72) = (float)(v13 * v11) + -10.0;
    *(float *)(a1 + 76) = v13;
    objc_msgSend((id)a1, "delegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "scrubbingGesturePlatformAdapterDidBeginScrubbing:", a1);

  }
}

- (void)_scrubGestureDidEnd
{
  void *v2;
  id v3;

  if (a1)
  {
    *(_OWORD *)(a1 + 96) = *MEMORY[0x1E0C9D538];
    *(_DWORD *)(a1 + 48) = 0;
    v2 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    *(_DWORD *)(a1 + 76) = 0;
    *(_DWORD *)(a1 + 72) = 0;
    objc_msgSend((id)a1, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "scrubbingGesturePlatformAdapterDidEndScrubbing:", a1);

  }
}

- (void)_updateGestureState
{
  double v2;
  double v3;
  float v4;
  float v5;
  long double v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id WeakRetained;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  id v22;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "velocity");
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 64), "nonLinearity");
    v5 = *(float *)(a1 + 76);
    if (v3 < 0.0)
      v5 = -v5;
    v6 = -(*(float *)(a1 + 72) - v5 * pow(fabs(v3), v4));
    v7 = *(float *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 64), "magnitude");
    v9 = v6 * (float)(v7 * v8);
    objc_msgSend(*(id *)(a1 + 32), "translation");
    v12 = v11;
    v13 = v10;
    if (v11 == 0.0 && v10 == 0.0 || (UIPointIsDiscrete() & 1) == 0)
    {
      v14 = *(void **)(a1 + 40);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(v14, "locationInView:", WeakRetained);
      v12 = v16;
      v13 = v17;

    }
    v18 = *(double *)(a1 + 88);
    v19 = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(v19, "frame");
    v21 = v20;

    *(double *)(a1 + 96) = v12 / v18;
    *(double *)(a1 + 104) = v13 / v21;
    *(float *)(a1 + 48) = v9;
    objc_msgSend((id)a1, "delegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v22, "scrubbingGesturePlatformAdapterDidContinueScrubbing:", a1);

  }
}

@end
