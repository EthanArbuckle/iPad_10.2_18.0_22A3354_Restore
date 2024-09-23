@implementation BSUIBackdropView

- (void)transitionIncrementallyToSettings:(id)a3 weighting:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int IsZero;
  int v13;
  char v14;
  void *v15;
  double v16;
  double v17;
  double scaleForNoBlur;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  double initialScale;
  double finalScale;
  objc_super v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!BSFloatIsZero())
    goto LABEL_15;
  -[_UIBackdropView inputSettings](self, "inputSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blurRadius");
  v9 = v8;

  objc_msgSend(v6, "blurRadius");
  v11 = v10;
  IsZero = BSFloatIsZero();
  v13 = BSFloatIsZero();
  v14 = v13;
  if (IsZero == v13)
  {
    if (self->_scaleForNoBlur <= 0.0)
      scaleForNoBlur = 1.0;
    else
      scaleForNoBlur = self->_scaleForNoBlur;
    if (IsZero)
    {
      self->_initialScale = scaleForNoBlur;
      if ((v13 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      -[_UIBackdropView inputSettings](self, "inputSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scale");
      self->_initialScale = v20;

      if ((v14 & 1) != 0)
        goto LABEL_12;
    }
    objc_msgSend(v6, "scale");
    scaleForNoBlur = v21;
    goto LABEL_12;
  }
  -[_UIBackdropView inputSettings](self, "inputSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  self->_initialScale = v16 + v16;

  objc_msgSend(v6, "scale");
  scaleForNoBlur = v17 + v17;
LABEL_12:
  self->_finalScale = scaleForNoBlur;
  BSLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    initialScale = self->_initialScale;
    finalScale = self->_finalScale;
    *(_DWORD *)buf = 134218752;
    v27 = initialScale;
    v28 = 2048;
    v29 = finalScale;
    v30 = 2048;
    v31 = v9;
    v32 = 2048;
    v33 = v11;
    _os_log_debug_impl(&dword_1A0234000, v22, OS_LOG_TYPE_DEBUG, "Setting initialScale:%f, finalScale: %f, initialRadius:%f, finalRadius: %f", buf, 0x2Au);
  }

LABEL_15:
  self->_transitionProgress = a4;
  v25.receiver = self;
  v25.super_class = (Class)BSUIBackdropView;
  -[_UIBackdropView transitionIncrementallyToSettings:weighting:](&v25, sel_transitionIncrementallyToSettings_weighting_, v6, a4);

}

- (void)applySettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL8 v12;
  NSObject *v13;
  double finalScale;
  double v15;
  double transitionProgress;
  objc_super v17;
  objc_super v18;
  _BYTE buf[24];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_rasterizationScale > 0.0)
  {
    -[_UIBackdropView effectView](self, "effectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    objc_msgSend(v7, "setRasterizationScale:", self->_rasterizationScale);

  }
  if (self->_initialScale <= 0.0 || (v8 = self->_finalScale, v8 <= 0.0))
  {
    BSLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      finalScale = self->_finalScale;
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = finalScale;
      _os_log_debug_impl(&dword_1A0234000, v13, OS_LOG_TYPE_DEBUG, "Not changing scale because _finalScale: %f", buf, 0xCu);
    }

    v17.receiver = self;
    v17.super_class = (Class)BSUIBackdropView;
    -[_UIBackdropView applySettings:](&v17, sel_applySettings_, v4);
  }
  else
  {
    *(double *)buf = self->_initialScale;
    buf[8] = 1;
    *(_DWORD *)&buf[9] = 0;
    *(_DWORD *)&buf[12] = 0;
    *(double *)&buf[16] = v8;
    LOBYTE(v20) = 1;
    *(_DWORD *)((char *)&v20 + 1) = 0;
    HIDWORD(v20) = 0;
    BSIntervalValueForFraction();
    v10 = v9;
    objc_msgSend(v4, "setScale:");
    BSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = self->_finalScale;
      transitionProgress = self->_transitionProgress;
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2048;
      v20 = transitionProgress;
      _os_log_debug_impl(&dword_1A0234000, v11, OS_LOG_TYPE_DEBUG, "Applying scale: %f for finalScale: %f, transitionProgress: %f", buf, 0x20u);
    }

    v12 = -[_UIBackdropView applyingTransition](self, "applyingTransition");
    -[_UIBackdropView setApplyingTransition:](self, "setApplyingTransition:", 0);
    v18.receiver = self;
    v18.super_class = (Class)BSUIBackdropView;
    -[_UIBackdropView applySettings:](&v18, sel_applySettings_, v4);
    -[_UIBackdropView setApplyingTransition:](self, "setApplyingTransition:", v12);
  }

}

- (void)transitionComplete
{
  objc_super v2;

  self->_transitionProgress = 0.0;
  self->_initialScale = 0.0;
  self->_finalScale = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)BSUIBackdropView;
  -[_UIBackdropView transitionComplete](&v2, sel_transitionComplete);
}

- (double)scaleForNoBlur
{
  return self->_scaleForNoBlur;
}

- (void)setScaleForNoBlur:(double)a3
{
  self->_scaleForNoBlur = a3;
}

- (double)rasterizationScale
{
  return self->_rasterizationScale;
}

- (void)setRasterizationScale:(double)a3
{
  self->_rasterizationScale = a3;
}

@end
