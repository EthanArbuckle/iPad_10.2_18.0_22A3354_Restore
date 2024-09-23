@implementation MKLookAroundGestureController

- (MKLookAroundGestureController)initWithLookAroundView:(id)a3
{
  id v4;
  MKLookAroundGestureController *v5;
  MKLookAroundGestureController *v6;
  uint64_t v7;
  UITapGestureRecognizer *singleNavigateGestureRecognizer;
  uint64_t v9;
  UIPanGestureRecognizer *panGestureRecognizer;
  uint64_t v11;
  UIPinchGestureRecognizer *zoomGestureRecognizer;
  id WeakRetained;
  id v14;
  id v15;
  uint64_t v16;
  NSDate *singleTapTime;
  MKLookAroundGestureController *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MKLookAroundGestureController;
  v5 = -[MKLookAroundGestureController init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_lookAroundView, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v6, sel__handleSingleNavigate_);
    singleNavigateGestureRecognizer = v6->_singleNavigateGestureRecognizer;
    v6->_singleNavigateGestureRecognizer = (UITapGestureRecognizer *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", v6, sel__handlePan_);
    panGestureRecognizer = v6->_panGestureRecognizer;
    v6->_panGestureRecognizer = (UIPanGestureRecognizer *)v9;

    -[UIPanGestureRecognizer setDelegate:](v6->_panGestureRecognizer, "setDelegate:", v6);
    -[UIPanGestureRecognizer _setRequiresSystemGesturesToFail:](v6->_panGestureRecognizer, "_setRequiresSystemGesturesToFail:", 1);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v6->_panGestureRecognizer, "setAllowedScrollTypesMask:", 2);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA840]), "initWithTarget:action:", v6, sel__handleZoom_);
    zoomGestureRecognizer = v6->_zoomGestureRecognizer;
    v6->_zoomGestureRecognizer = (UIPinchGestureRecognizer *)v11;

    -[UIPinchGestureRecognizer setDelegate:](v6->_zoomGestureRecognizer, "setDelegate:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_lookAroundView);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v6->_singleNavigateGestureRecognizer);

    v14 = objc_loadWeakRetained((id *)&v6->_lookAroundView);
    objc_msgSend(v14, "addGestureRecognizer:", v6->_panGestureRecognizer);

    v15 = objc_loadWeakRetained((id *)&v6->_lookAroundView);
    objc_msgSend(v15, "addGestureRecognizer:", v6->_zoomGestureRecognizer);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    singleTapTime = v6->_singleTapTime;
    v6->_singleTapTime = (NSDate *)v16;

    v6->_readyToReplayTap = 0;
    v18 = v6;
  }

  return v6;
}

- (void)setNavigatingEnabled:(BOOL)a3
{
  -[UITapGestureRecognizer setEnabled:](self->_singleNavigateGestureRecognizer, "setEnabled:", a3);
}

- (void)setPanningEnabled:(BOOL)a3
{
  -[UIPanGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", a3);
}

- (void)setZoomingEnabled:(BOOL)a3
{
  -[UIPinchGestureRecognizer setEnabled:](self->_zoomGestureRecognizer, "setEnabled:", a3);
}

- (void)_moveBackToReplayTap
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  __int128 v8;
  id WeakRetained;
  void *v10;
  id v11;
  _QWORD v12[6];
  __int128 v13;
  uint8_t buf[16];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MKGetMKLookAroundLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "<MKLookAroundView: %p> -_moveBackToReplayTap", buf, 0xCu);
  }

  *(_OWORD *)buf = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x1E0DC64E8], "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "muninTapState");
  }
  else
  {
    *(_OWORD *)buf = 0u;
    v15 = 0u;
  }

  objc_msgSend(MEMORY[0x1E0DC64E8], "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMuninReplayLastTap:", 0);

  v7 = *(double *)&buf[8];
  v8 = v15;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundView);
  objc_msgSend(WeakRetained, "lookAroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke;
  v12[3] = &unk_1E20DCBF0;
  v12[4] = self;
  *(double *)&v12[5] = v7;
  v13 = v8;
  v11 = (id)objc_msgSend(v10, "muninMarkerAtCoordinate:completeMarkerHandler:", v12, v7, *(double *)&v8);

}

void __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  double v6;
  _QWORD v7[5];
  id v8;
  __int128 v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
    objc_msgSend(WeakRetained, "lookAroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(float *)(a1 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke_2;
    v7[3] = &unk_1E20DCBC8;
    v7[4] = *(_QWORD *)(a1 + 32);
    v9 = *(_OWORD *)(a1 + 40);
    v8 = v3;
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "moveToMarker:withHeading:animated:completionHandler:", v8, 0, v7, v6);

  }
}

void __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
    objc_msgSend(WeakRetained, "lookAroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "coordinate");
    v5 = *MEMORY[0x1E0DC65C8];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke_3;
    v6[3] = &unk_1E20D82F8;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));

  }
}

uint64_t __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = 1;
  return result;
}

- (void)_handleSingleNavigate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSDate *v38;
  NSDate *singleTapTime;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_singleTapTime);
  if (v6 >= 0.6)
  {
    objc_msgSend(MEMORY[0x1E0DC64E8], "sharedSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "muninReplayLastTap");

    if (v8)
    {
      -[MKLookAroundGestureController _moveBackToReplayTap](self, "_moveBackToReplayTap");
    }
    else
    {
      if (!self->_userInteractionCount)
      {
        MKGetMKLookAroundLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_DEBUG, "[Gesture] _handleSingleNavigate: DidStartUserInteraction>", buf, 2u);
        }

        -[MKLookAroundGestureController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lookAroundGestureControllerDidStartUserInteraction:", self);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v4, "locationInView:", WeakRetained);
      v13 = v12;
      v15 = v14;

      if (self->_readyToReplayTap)
      {
        objc_msgSend(MEMORY[0x1E0DC64E8], "sharedSettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "muninTapState");
          v13 = *(float *)&v42;
        }
        else
        {
          v42 = 0u;
          v43 = 0u;
          v13 = 0.0;
        }

        objc_msgSend(MEMORY[0x1E0DC64E8], "sharedSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "muninTapState");
          v15 = *((float *)&v40 + 1);
        }
        else
        {
          v40 = 0u;
          v41 = 0u;
          v15 = 0.0;
        }

        self->_readyToReplayTap = 0;
      }
      v20 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v20, "lookAroundView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "enableDebugLabelHighlighting");

      v23 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v23, "lookAroundView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v22)
      {
        objc_msgSend(v24, "debugHighlightLabelAtPoint:", v13, v15);

      }
      else
      {
        objc_msgSend(v24, "labelMarkerForSelectionAtPoint:selectableLabelsOnly:", 1, v13, v15);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_loadWeakRetained((id *)&self->_lookAroundView);
        objc_msgSend(v27, "selectedLabelMarker");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28 && v28 != v26)
        {
          v29 = objc_loadWeakRetained((id *)&self->_lookAroundView);
          objc_msgSend(v29, "deselectLabelMarker");

        }
        v30 = objc_loadWeakRetained((id *)&self->_lookAroundView);
        v31 = v30;
        if (v26)
        {
          objc_msgSend(v30, "selectLabelMarker:", v26);

          MKGetMKLookAroundLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18B0B0000, v32, OS_LOG_TYPE_DEBUG, "[Gesture] _handleSingleNavigate: DidTapLabelMarker>", buf, 2u);
          }

          -[MKLookAroundGestureController delegate](self, "delegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lookAroundGestureController:didTapLabelMarker:", self, v26);
        }
        else
        {
          v34 = objc_msgSend(v30, "tapAtPoint:", v13, v15);

          MKGetMKLookAroundLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18B0B0000, v35, OS_LOG_TYPE_DEBUG, "[Gesture] _handleSingleNavigate: DidTapAtPoint>", buf, 2u);
          }

          -[MKLookAroundGestureController delegate](self, "delegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lookAroundGestureController:didTapAtPoint:areaAvailable:", self, v34, v13, v15);
        }

        if (!self->_userInteractionCount)
        {
          MKGetMKLookAroundLog();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18B0B0000, v36, OS_LOG_TYPE_DEBUG, "[Gesture] _handleSingleNavigate: DidStopUserInteraction>", buf, 2u);
          }

          -[MKLookAroundGestureController delegate](self, "delegate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "lookAroundGestureControllerDidStopUserInteraction:", self);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date", v40, v41, v42, v43);
        v38 = (NSDate *)objc_claimAutoreleasedReturnValue();
        singleTapTime = self->_singleTapTime;
        self->_singleTapTime = v38;

      }
    }
  }

}

- (void)_handlePan:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  VKCompoundAnimation *panDecelerationAnimationGroup;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  int64_t userInteractionCount;
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  VKCompoundAnimation *v31;
  VKCompoundAnimation *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  int64_t v39;
  NSObject *v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45[11];
  uint8_t buf[8];
  uint8_t *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t v52[4];
  int64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundView);
  objc_msgSend(v4, "locationInView:", WeakRetained);
  v7 = v6;
  v9 = v8;

  -[VKCompoundAnimation stop](self->_panDecelerationAnimationGroup, "stop");
  panDecelerationAnimationGroup = self->_panDecelerationAnimationGroup;
  self->_panDecelerationAnimationGroup = 0;

  if (!self->_userInteractionCount)
  {
    MKGetMKLookAroundLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidStartUserInteraction>", buf, 2u);
    }

    -[MKLookAroundGestureController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lookAroundGestureControllerDidStartUserInteraction:", self);

  }
  *(_QWORD *)buf = 0;
  v47 = buf;
  v48 = 0x3010000000;
  v50 = 0;
  v51 = 0;
  v49 = "";
  v13 = objc_loadWeakRetained((id *)&self->_lookAroundView);
  objc_msgSend(v4, "translationInView:", v13);
  v50 = v14;
  v51 = v15;

  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      MKGetMKLookAroundLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: Began>", v52, 2u);
      }

      ++self->_userInteractionCount;
      MKGetMKLookAroundLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        userInteractionCount = self->_userInteractionCount;
        *(_DWORD *)v52 = 134217984;
        v53 = userInteractionCount;
        _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: _userInteractionCount == %ld", v52, 0xCu);
      }

      v19 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v19, "lookAroundView");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startPanningAtPoint:", v7, v9);
      goto LABEL_13;
    case 2:
      v19 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v19, "lookAroundView");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updatePanWithTranslation:", *((double *)v47 + 4), *((double *)v47 + 5));
      goto LABEL_13;
    case 3:
      v21 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v4, "velocityInView:", v21);
      v23 = v22;
      v25 = v24;

      v19 = objc_alloc_init(MEMORY[0x1E0DC64F0]);
      v26 = (void *)MEMORY[0x1E0C809B0];
      v45[6] = (id)MEMORY[0x1E0C809B0];
      v45[7] = (id)3221225472;
      v45[8] = __44__MKLookAroundGestureController__handlePan___block_invoke;
      v45[9] = &unk_1E20DCC18;
      v45[10] = buf;
      dynamicValueAnimation();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDynamicStepHandler:", v27);

      v20 = objc_alloc_init(MEMORY[0x1E0DC64F0]);
      v45[1] = v26;
      v45[2] = (id)3221225472;
      v45[3] = __44__MKLookAroundGestureController__handlePan___block_invoke_2;
      v45[4] = &unk_1E20DCC18;
      v45[5] = buf;
      dynamicValueAnimation();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDynamicStepHandler:", v28);

      objc_initWeak((id *)v52, self);
      v29 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v29, "lookAroundView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "willStopPanningAtPoint:withVelocity:", v7, v9, v23, v25);

      v31 = (VKCompoundAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC64D0]), "initWithAnimations:", v19, v20, 0);
      v32 = self->_panDecelerationAnimationGroup;
      self->_panDecelerationAnimationGroup = v31;

      v43[0] = v26;
      v43[1] = 3221225472;
      v43[2] = __44__MKLookAroundGestureController__handlePan___block_invoke_3;
      v43[3] = &unk_1E20DCC40;
      objc_copyWeak(v45, (id *)v52);
      v44 = v4;
      -[VKCompoundAnimation setCompletionHandler:](self->_panDecelerationAnimationGroup, "setCompletionHandler:", v43);
      v41[0] = v26;
      v41[1] = 3221225472;
      v41[2] = __44__MKLookAroundGestureController__handlePan___block_invoke_20;
      v41[3] = &unk_1E20DCC68;
      objc_copyWeak(&v42, (id *)v52);
      v41[4] = buf;
      -[VKCompoundAnimation setGroupStepHandler:](self->_panDecelerationAnimationGroup, "setGroupStepHandler:", v41);
      v33 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v33, "lookAroundView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "runAnimation:", self->_panDecelerationAnimationGroup);

      objc_destroyWeak(&v42);
      objc_destroyWeak(v45);
      objc_destroyWeak((id *)v52);
LABEL_13:

      goto LABEL_14;
    case 4:
      v35 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v35, "lookAroundView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stopPanningAtPoint:", v7, v9);

      MKGetMKLookAroundLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_18B0B0000, v37, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: Cancelled>", v52, 2u);
      }

      --self->_userInteractionCount;
      MKGetMKLookAroundLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        v39 = self->_userInteractionCount;
        *(_DWORD *)v52 = 134217984;
        v53 = v39;
        _os_log_impl(&dword_18B0B0000, v38, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: _userInteractionCount == %ld", v52, 0xCu);
      }

      if (self->_userInteractionCount)
        goto LABEL_15;
      MKGetMKLookAroundLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_18B0B0000, v40, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidStopUserInteraction>", v52, 2u);
      }

      -[MKLookAroundGestureController delegate](self, "delegate");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lookAroundGestureControllerDidStopUserInteraction:", self);
LABEL_14:

LABEL_15:
      _Block_object_dispose(buf, 8);

      return;
    default:
      goto LABEL_15;
  }
}

uint64_t __44__MKLookAroundGestureController__handlePan___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = a2;
  return result;
}

uint64_t __44__MKLookAroundGestureController__handlePan___block_invoke_2(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = a2;
  return result;
}

void __44__MKLookAroundGestureController__handlePan___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 12);
    objc_msgSend(v4, "lookAroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = objc_loadWeakRetained(v3 + 12);
    objc_msgSend(v6, "locationInView:", v7);
    objc_msgSend(v5, "stopPanningAtPoint:");

    MKGetMKLookAroundLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: Ended>", (uint8_t *)&v14, 2u);
    }

    v3[1] = (char *)v3[1] - 1;
    MKGetMKLookAroundLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = v3[1];
      v14 = 134217984;
      v15 = v10;
      _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidPan (_userInteractionCount == %ld)", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v3, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lookAroundGestureControllerDidPan:", v3);

    if (!v3[1])
    {
      MKGetMKLookAroundLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidStopUserInteraction>", (uint8_t *)&v14, 2u);
      }

      objc_msgSend(v3, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lookAroundGestureControllerDidStopUserInteraction:", v3);

    }
  }

}

void __44__MKLookAroundGestureController__handlePan___block_invoke_20(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 12);
    objc_msgSend(v3, "lookAroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatePanWithTranslation:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

    WeakRetained = v5;
  }

}

- (void)_handleZoom:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  int64_t userInteractionCount;
  id v17;
  void *v18;
  id v19;
  void *v20;
  int64_t v21;
  NSObject *v22;
  NSObject *v23;
  int64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  int64_t v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_userInteractionCount)
  {
    MKGetMKLookAroundLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: DidStartUserInteraction>", (uint8_t *)&v33, 2u);
    }

    -[MKLookAroundGestureController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lookAroundGestureControllerDidStartUserInteraction:", self);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundView);
  objc_msgSend(v4, "locationInView:", WeakRetained);
  v9 = v8;
  v11 = v10;

  objc_msgSend(v4, "scale");
  v13 = v12;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      MKGetMKLookAroundLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: Began>", (uint8_t *)&v33, 2u);
      }

      ++self->_userInteractionCount;
      MKGetMKLookAroundLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        userInteractionCount = self->_userInteractionCount;
        v33 = 134217984;
        v34 = userInteractionCount;
        _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: _userInteractionCount == %ld", (uint8_t *)&v33, 0xCu);
      }

      v17 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v17, "lookAroundView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startPinchingWithFocusPoint:", v9, v11);

      self->_lastZoomDirection = 0;
      self->_lastZoomScale = 1.0;
      self->_startZoomScale = v13;
      break;
    case 2:
      v19 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v19, "lookAroundView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updatePinchWithFocusPoint:oldFactor:newFactor:", v9, v11, self->_lastZoomScale, v13);

      v21 = 2;
      if (self->_lastZoomScale > self->_startZoomScale)
        v21 = 1;
      self->_lastZoomDirection = v21;
      self->_lastZoomScale = v13;
      break;
    case 3:
      MKGetMKLookAroundLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_18B0B0000, v22, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: Ended>", (uint8_t *)&v33, 2u);
      }

      --self->_userInteractionCount;
      MKGetMKLookAroundLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = self->_userInteractionCount;
        v33 = 134217984;
        v34 = v24;
        _os_log_impl(&dword_18B0B0000, v23, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: DidZoom (_userInteractionCount == %ld)", (uint8_t *)&v33, 0xCu);
      }

      -[MKLookAroundGestureController delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lookAroundGestureController:didZoomWithDirection:type:", self, self->_lastZoomDirection, 1);

      if (self->_userInteractionCount)
        goto LABEL_30;
      MKGetMKLookAroundLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        goto LABEL_29;
      LOWORD(v33) = 0;
      goto LABEL_28;
    case 4:
      MKGetMKLookAroundLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_18B0B0000, v27, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: Cancelled>", (uint8_t *)&v33, 2u);
      }

      --self->_userInteractionCount;
      MKGetMKLookAroundLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = self->_userInteractionCount;
        v33 = 134217984;
        v34 = v29;
        _os_log_impl(&dword_18B0B0000, v28, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: _userInteractionCount == %ld", (uint8_t *)&v33, 0xCu);
      }

      if (!self->_userInteractionCount)
      {
        MKGetMKLookAroundLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v33) = 0;
LABEL_28:
          _os_log_impl(&dword_18B0B0000, v26, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidStopUserInteraction>", (uint8_t *)&v33, 2u);
        }
LABEL_29:

        -[MKLookAroundGestureController delegate](self, "delegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lookAroundGestureControllerDidStopUserInteraction:", self);

      }
LABEL_30:
      v31 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      objc_msgSend(v31, "lookAroundView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stopPinchingWithFocusPoint:", v9, v11);

      break;
    default:
      break;
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[MKLookAroundGestureController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "lookAroundGestureControllerShouldReceive:shouldReceiveTouch:", self, v5);

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  UIPinchGestureRecognizer *zoomGestureRecognizer;
  UIPanGestureRecognizer *panGestureRecognizer;
  BOOL v11;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  panGestureRecognizer = self->_panGestureRecognizer;
  zoomGestureRecognizer = self->_zoomGestureRecognizer;
  v11 = zoomGestureRecognizer == v7 && panGestureRecognizer == v6;
  v13 = zoomGestureRecognizer == v6 && panGestureRecognizer == v7 || v11;

  return v13;
}

- (MKLookAroundGestureControllerDelegate)delegate
{
  return (MKLookAroundGestureControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)navigatingEnabled
{
  return self->_navigatingEnabled;
}

- (BOOL)panningEnabled
{
  return self->_panningEnabled;
}

- (BOOL)zoomingEnabled
{
  return self->_zoomingEnabled;
}

- (MKLookAroundView)lookAroundView
{
  return (MKLookAroundView *)objc_loadWeakRetained((id *)&self->_lookAroundView);
}

- (void)setLookAroundView:(id)a3
{
  objc_storeWeak((id *)&self->_lookAroundView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lookAroundView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_panDecelerationAnimationGroup, 0);
  objc_storeStrong((id *)&self->_singleTapTime, 0);
  objc_storeStrong((id *)&self->_zoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singleNavigateGestureRecognizer, 0);
}

@end
