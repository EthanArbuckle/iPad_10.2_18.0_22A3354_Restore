@implementation AVEditBehaviorContext

- (AVEditBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4;
  AVEditBehaviorContext *v5;
  AVEditBehaviorContext *v6;
  id v7;
  AVObservationController *v8;
  AVObservationController *observationController;
  uint64_t v10;
  NSMutableArray *pendingImageRequests;
  uint64_t v12;
  NSMutableDictionary *requestedImageTimeToCMTimeMap;
  AVZoomingBehavior *v14;
  AVZoomingBehavior *zoomingBehavior;
  uint64_t v16;
  __int128 v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AVEditBehaviorContext;
  v5 = -[AVEditBehaviorContext init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_playerViewController, v4);
    objc_msgSend(v4, "setRequiresImmediateAssetInspection:", 1);

    v8 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v6);
    observationController = v6->_observationController;
    v6->_observationController = v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    pendingImageRequests = v6->_pendingImageRequests;
    v6->_pendingImageRequests = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    requestedImageTimeToCMTimeMap = v6->_requestedImageTimeToCMTimeMap;
    v6->_requestedImageTimeToCMTimeMap = (NSMutableDictionary *)v12;

    v14 = objc_alloc_init(AVZoomingBehavior);
    zoomingBehavior = v6->_zoomingBehavior;
    v6->_zoomingBehavior = v14;

    v6->_currentRotation = 0;
    v16 = MEMORY[0x1E0C9BAA8];
    v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v6->_rotationTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v6->_rotationTransform.c = v17;
    *(_OWORD *)&v6->_rotationTransform.tx = *(_OWORD *)(v16 + 32);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[AVEditBehaviorContext endEditing](self, "endEditing");
  v3.receiver = self;
  v3.super_class = (Class)AVEditBehaviorContext;
  -[AVEditBehaviorContext dealloc](&v3, sel_dealloc);
}

- (void)startEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  CMTime v20;
  id location;
  _QWORD v22[5];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  if (!-[AVEditBehaviorContext isEditing](self, "isEditing"))
  {
    -[AVEditBehaviorContext setEditing:](self, "setEditing:", 1);
    -[AVEditBehaviorContext playerViewController](self, "playerViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadViewIfNeeded");

    -[AVEditBehaviorContext playerViewController](self, "playerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadPlaybackControlsViewIfNeeded");

    objc_initWeak(&location, self);
    -[AVEditBehaviorContext playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v20, 1, 30);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __37__AVEditBehaviorContext_startEditing__block_invoke;
    v18 = &unk_1E5BB20A8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v7, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v20, 0, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVEditBehaviorContext setPlayerTimeObserver:](self, "setPlayerTimeObserver:", v8, v15, v16, v17, v18);

    -[AVEditBehaviorContext observationController](self, "observationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = CFSTR("playerController.player.currentItem.duration");
    v23[1] = CFSTR("playerController.player.currentItem.presentationSize");
    v23[2] = CFSTR("playerController.status");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v9, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v10, 1, &__block_literal_global_8497);

    -[AVEditBehaviorContext observationController](self, "observationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = CFSTR("playerController.player.timeControlStatus");
    v22[1] = CFSTR("playerController.scrubbing");
    v22[2] = CFSTR("playerController.seeking");
    v22[3] = CFSTR("editView.trimming");
    v22[4] = CFSTR("editView.scrubbing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v12, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v13, 0, &__block_literal_global_40_8503);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)endEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AVEditBehaviorContext setEditing:](self, "setEditing:", 0);
  -[AVEditBehaviorContext observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  -[AVEditBehaviorContext containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[AVEditBehaviorContext setContainerView:](self, "setContainerView:", 0);
  -[AVEditBehaviorContext setEditView:](self, "setEditView:", 0);
  -[AVEditBehaviorContext playerTimeObserver](self, "playerTimeObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVEditBehaviorContext playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVEditBehaviorContext playerTimeObserver](self, "playerTimeObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTimeObserver:", v8);

    -[AVEditBehaviorContext setPlayerTimeObserver:](self, "setPlayerTimeObserver:", 0);
  }
}

- (void)rotateClockwise
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AVEditBehaviorContext playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVEditBehaviorContext setCurrentRotation:](self, "setCurrentRotation:", (-[AVEditBehaviorContext currentRotation](self, "currentRotation") + 1) & 3);
    -[AVEditBehaviorContext playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVEditBehaviorContext videoCompostitionRotatingAsset:](self, "videoCompostitionRotatingAsset:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AVEditBehaviorContext playerController](self, "playerController");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject player](v12, "player");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setVideoComposition:", v11);

    }
    else
    {
      _AVLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[AVEditBehaviorContext rotateClockwise]";
        _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s Did not get a valid video composition.", (uint8_t *)&v15, 0xCu);
      }
    }

  }
}

- (id)videoCompostitionRotatingAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v11;
  void *v15;
  int RotationAngleAndFlipsFromCGAffineTransform;
  int v17;
  float64x2_t v18;
  double v19;
  void *v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  __int128 v30;
  double v31;
  double v32;
  CMTime duration;
  CMTimeRange v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int16 v48;
  void *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "avkit_tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "naturalSize");
  v29 = *(double *)&v8;
  v31 = *(double *)&v7;
  v11 = ((v8 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v8 >= 0
     || (unint64_t)(v8 - 1) < 0xFFFFFFFFFFFFFLL;
  if ((v7 < 0 || ((v7 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(v7 - 1) > 0xFFFFFFFFFFFFELL
    || !v11)
  {
    v15 = 0;
  }
  else
  {
    v48 = 0;
    if (v6)
    {
      objc_msgSend(v6, "preferredTransform");
    }
    else
    {
      v46 = 0u;
      v47 = 0u;
      v45 = 0u;
    }
    RotationAngleAndFlipsFromCGAffineTransform = FigGetRotationAngleAndFlipsFromCGAffineTransform();
    v17 = RotationAngleAndFlipsFromCGAffineTransform
        + 90 * -[AVEditBehaviorContext currentRotation](self, "currentRotation");
    v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v44.a = *MEMORY[0x1E0C9BAA8];
    v27 = *(_OWORD *)&v44.a;
    *(_OWORD *)&v44.c = v28;
    *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v26 = *(_OWORD *)&v44.tx;
    CGAffineTransformMakeTranslation(&t2, v31 * -0.5, v29 * -0.5);
    *(_OWORD *)&t1.a = v27;
    *(_OWORD *)&t1.c = v28;
    *(_OWORD *)&t1.tx = v26;
    CGAffineTransformConcat(&v44, &t1, &t2);
    CGAffineTransformMakeRotation(&v41, (double)v17 / 180.0 * 3.14159265);
    v40 = v44;
    CGAffineTransformConcat(&t1, &v40, &v41);
    v44 = t1;
    if (HIBYTE(v48))
    {
      CGAffineTransformMakeScale(&v39, 1.0, -1.0);
      v40 = v44;
      CGAffineTransformConcat(&t1, &v40, &v39);
      v44 = t1;
    }
    if ((_BYTE)v48)
    {
      CGAffineTransformMakeScale(&v38, -1.0, 1.0);
      v40 = v44;
      CGAffineTransformConcat(&t1, &v40, &v38);
      v44 = t1;
    }
    CGAffineTransformMakeRotation(&v37, (double)v17 / 180.0 * 3.14159265);
    v18 = vrndaq_f64(vabsq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v37.c, v29), *(float64x2_t *)&v37.a, v31)));
    v19 = v18.f64[1];
    v32 = v18.f64[0];
    CGAffineTransformMakeTranslation(&v36, 0.5 * v18.f64[0], vmuld_lane_f64(0.5, v18, 1));
    v40 = v44;
    CGAffineTransformConcat(&t1, &v40, &v36);
    v44 = t1;
    objc_msgSend(MEMORY[0x1E0C8B298], "videoCompositionLayerInstruction");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTrackID:", objc_msgSend(v6, "trackID"));
    t1 = v44;
    v30 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&v40.a = *MEMORY[0x1E0CA2E68];
    v21 = *(double *)(MEMORY[0x1E0CA2E68] + 16);
    v40.c = v21;
    objc_msgSend(v20, "setTransform:atTime:", &t1, &v40);
    v35 = v44;
    -[AVEditBehaviorContext setRotationTransform:](self, "setRotationTransform:", &v35);
    objc_msgSend(MEMORY[0x1E0C8B290], "videoCompositionInstruction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v4, "duration");
    else
      memset(&duration, 0, sizeof(duration));
    *(_OWORD *)&t1.a = v30;
    t1.c = v21;
    CMTimeRangeMake(&v34, (CMTime *)&t1, &duration);
    objc_msgSend(v22, "setTimeRange:", &v34);
    v50[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLayerInstructions:", v23);

    objc_msgSend(MEMORY[0x1E0C8B288], "videoCompositionWithPropertiesOfAsset:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInstructions:", v24);

    objc_msgSend(v15, "setRenderSize:", v32, v19);
  }

  return v15;
}

- (void)cancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  -[AVEditBehaviorContext playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CA2E18];
  v14 = v17;
  v18 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v7 = v18;
  objc_msgSend(v6, "setReversePlaybackEndTime:", &v17);

  -[AVEditBehaviorContext playerViewController](self, "playerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v7;
  objc_msgSend(v10, "setForwardPlaybackEndTime:", &v15);

  -[AVEditBehaviorContext endEditing](self, "endEditing");
  -[AVEditBehaviorContext behavior](self, "behavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVEditBehaviorContext behavior](self, "behavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "editBehaviorDidCancel:", v13);

}

- (void)play:(id)a3
{
  void *v4;
  id v5;

  -[AVEditBehaviorContext playerViewController](self, "playerViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "play:", self);

}

- (void)pause:(id)a3
{
  void *v4;
  id v5;

  -[AVEditBehaviorContext playerViewController](self, "playerViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause:", self);

}

- (void)done:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVEditBehaviorContext doneButton](self, "doneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarButtonItem:", v5);

  -[AVEditBehaviorContext behavior](self, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVEditBehaviorContext behavior](self, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "editBehaviorAlertActionsForDoneButtonTap:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v4, "addAction:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15++), (_QWORD)v20);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v16 = (void *)MEMORY[0x1E0DC3448];
  AVLocalizedString(CFSTR("EDIT_BEHAVIOR_CONTEXT_CANCEL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setEnabled:", 1);
  objc_msgSend(v4, "addAction:", v18);
  -[AVEditBehaviorContext playerViewController](self, "playerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentViewController:animated:completion:", v4, 0, 0);

}

- (void)didAddBehavior:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[AVEditBehaviorContext playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVEditBehaviorContext zoomingBehavior](self, "zoomingBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addBehavior:", v5);

  -[AVEditBehaviorContext playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVEditBehaviorContext setPlayerController:](self, "setPlayerController:", v7);

  -[AVEditBehaviorContext observationController](self, "observationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.player.currentItem"), 1, &__block_literal_global_50);

}

- (void)didRemoveBehavior:(id)a3
{
  void *v4;
  void *v5;

  -[AVEditBehaviorContext playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVEditBehaviorContext zoomingBehavior](self, "zoomingBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeBehavior:", v5);

  -[AVEditBehaviorContext endEditing](self, "endEditing");
  -[AVEditBehaviorContext setPlayerController:](self, "setPlayerController:", 0);
}

- (void)contentViewWillTransitionToSize:(CGSize)a3 withCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__AVEditBehaviorContext_contentViewWillTransitionToSize_withCoordinator___block_invoke;
  v4[3] = &unk_1E5BB2130;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, &__block_literal_global_52);
}

- (double)editViewDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[AVEditBehaviorContext playerController](self, "playerController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentDuration");
  v5 = v4;

  return v5;
}

- (double)editViewThumbnailAspectRatio:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;

  -[AVEditBehaviorContext playerController](self, "playerController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationSize");
  v7 = v6;
  v9 = v8;

  result = v7 / v9;
  if (v9 <= 0.0)
    return 1.0;
  return result;
}

- (void)editView:(id)a3 requestThumbnailImageForTimestamp:(id)a4
{
  void *v5;
  id v6;
  Float64 v7;
  void *v8;
  void *v9;
  void *v10;
  CMTime v11;

  v5 = (void *)MEMORY[0x1E0CB3B18];
  v6 = a4;
  objc_msgSend(v6, "doubleValue");
  CMTimeMakeWithSeconds(&v11, v7, 90000);
  objc_msgSend(v5, "valueWithCMTime:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVEditBehaviorContext pendingImageRequests](self, "pendingImageRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  -[AVEditBehaviorContext requestedImageTimeToCMTimeMap](self, "requestedImageTimeToCMTimeMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v8);

}

- (void)editView:(id)a3 currentTimeDidChange:(double)a4
{
  void *v6;
  id v7;

  if (objc_msgSend(a3, "isScrubbing"))
  {
    -[AVEditBehaviorContext playerViewController](self, "playerViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "seekToTime:", a4);

  }
}

- (void)editView:(id)a3 trimStartTimeDidChange:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[AVEditBehaviorContext playerController](self, "playerController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v8, "reversePlaybackEndTime");

  if ((v15 & 0x100000000) != 0)
  {
    -[AVEditBehaviorContext playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CA2E18];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v9, "setReversePlaybackEndTime:", &v12);
LABEL_5:

  }
  -[AVEditBehaviorContext playerViewController](self, "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "seekToTime:", a4);

}

- (void)editView:(id)a3 trimEndTimeDidChange:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[AVEditBehaviorContext playerController](self, "playerController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v8, "forwardPlaybackEndTime");

  if ((v15 & 0x100000000) != 0)
  {
    -[AVEditBehaviorContext playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CA2E18];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v9, "setForwardPlaybackEndTime:", &v12);
LABEL_5:

  }
  -[AVEditBehaviorContext playerViewController](self, "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "seekToTime:", a4);

}

- (void)editViewDidBeginScrubbing:(id)a3
{
  void *v4;
  id v5;

  -[AVEditBehaviorContext playerViewController](self, "playerViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginScrubbing:", self);

}

- (void)editViewDidEndScrubbing:(id)a3
{
  id v4;
  Float64 v5;
  void *v6;
  void *v7;
  void *v8;
  Float64 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int32_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int32_t v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[3];
  CMTime v41;
  CMTime v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[3];
  CMTime time2;
  CMTime time1;
  CMTime v50;
  CMTime v51;
  CMTime v52;

  v4 = a3;
  if (objc_msgSend(v4, "isTrimming"))
  {
    objc_msgSend(v4, "trimStartTime");
    AVTimeIntervalToCMTime(&v52, v5);
    -[AVEditBehaviorContext playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReversePlaybackEndTime:", &v52);

    objc_msgSend(v4, "trimEndTime");
    AVTimeIntervalToCMTime(&v51, v9);
    -[AVEditBehaviorContext playerController](self, "playerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v51;
    objc_msgSend(v12, "setForwardPlaybackEndTime:", &v50);

    -[AVEditBehaviorContext playerController](self, "playerController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "forwardPlaybackEndTime");
    else
      memset(&time1, 0, sizeof(time1));
    -[AVEditBehaviorContext playerController](self, "playerController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "player");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "currentTime");
    else
      memset(&time2, 0, sizeof(time2));
    v21 = CMTimeCompare(&time1, &time2);

    -[AVEditBehaviorContext playerController](self, "playerController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "player");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currentItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v21 < 0)
    {
      -[AVEditBehaviorContext playerController](self, "playerController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "player");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "currentItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
        objc_msgSend(v28, "forwardPlaybackEndTime");
      else
        memset(v47, 0, sizeof(v47));
      v45 = *MEMORY[0x1E0CA2E68];
      v46 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v43 = v45;
      v44 = v46;
      v36 = v47;
      goto LABEL_24;
    }
    if (v24)
      objc_msgSend(v24, "reversePlaybackEndTime");
    else
      memset(&v42, 0, sizeof(v42));
    -[AVEditBehaviorContext playerController](self, "playerController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "player");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "currentItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
      objc_msgSend(v32, "currentTime");
    else
      memset(&v41, 0, sizeof(v41));
    v34 = CMTimeCompare(&v42, &v41);

    if (v34 >= 1)
    {
      -[AVEditBehaviorContext playerController](self, "playerController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "player");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "currentItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVEditBehaviorContext playerController](self, "playerController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "player");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "currentItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v35;
      if (v35)
        objc_msgSend(v35, "reversePlaybackEndTime");
      else
        memset(v40, 0, sizeof(v40));
      v45 = *MEMORY[0x1E0CA2E68];
      v46 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v43 = v45;
      v44 = v46;
      v36 = v40;
LABEL_24:
      objc_msgSend(v25, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", v36, &v45, &v43, 0);

    }
  }
  -[AVEditBehaviorContext playerViewController](self, "playerViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "playerController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "endScrubbing:", self);

  -[AVEditBehaviorContext playerController](self, "playerController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "currentTime");
  objc_msgSend(v4, "setCurrentTime:");

}

- (void)editViewWillBeginRequestingThumbnails:(id)a3
{
  id v3;

  -[AVEditBehaviorContext imageGenerator](self, "imageGenerator", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllCGImageGeneration");

}

- (void)_generateThumbnails
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[AVEditBehaviorContext imageGenerator](self, "imageGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVEditBehaviorContext pendingImageRequests](self, "pendingImageRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__AVEditBehaviorContext__generateThumbnails__block_invoke;
  v6[3] = &unk_1E5BB21A0;
  v6[4] = self;
  objc_msgSend(v3, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v4, v6);

  -[AVEditBehaviorContext pendingImageRequests](self, "pendingImageRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (id)_makeBarButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v33;
  char v34;
  _QWORD v35[5];
  _QWORD v36[6];

  v36[5] = *MEMORY[0x1E0C80C00];
  -[AVEditBehaviorContext flexibleSpaceItem](self, "flexibleSpaceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    -[AVEditBehaviorContext setFlexibleSpaceItem:](self, "setFlexibleSpaceItem:", v4);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
    -[AVEditBehaviorContext setCancelButton:](self, "setCancelButton:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 17, self, sel_play_);
    -[AVEditBehaviorContext setPlayButton:](self, "setPlayButton:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVEditBehaviorContext playButton](self, "playButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v7);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 18, self, sel_pause_);
    -[AVEditBehaviorContext setPauseButton:](self, "setPauseButton:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVEditBehaviorContext pauseButton](self, "pauseButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
    -[AVEditBehaviorContext setDoneButton:](self, "setDoneButton:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVEditBehaviorContext doneButton](self, "doneButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v13);

  }
  -[AVEditBehaviorContext toolbar](self, "toolbar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "items");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[AVEditBehaviorContext editView](self, "editView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isScrubbing") & 1) != 0)
    {
LABEL_9:

LABEL_10:
      -[AVEditBehaviorContext toolbar](self, "toolbar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "items");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    -[AVEditBehaviorContext editView](self, "editView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isTrimming") & 1) != 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    -[AVEditBehaviorContext playerController](self, "playerController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isSeeking") & 1) != 0)
    {

      goto LABEL_8;
    }
    -[AVEditBehaviorContext playerController](self, "playerController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isScrubbing");

    if ((v34 & 1) != 0)
      goto LABEL_10;
  }
  else
  {

  }
  -[AVEditBehaviorContext playerController](self, "playerController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "timeControlStatus");

  if (v24)
  {
    -[AVEditBehaviorContext editView](self, "editView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPrefersThumbVisible:", 1);

    -[AVEditBehaviorContext cancelButton](self, "cancelButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v21;
    -[AVEditBehaviorContext flexibleSpaceItem](self, "flexibleSpaceItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v26;
    -[AVEditBehaviorContext pauseButton](self, "pauseButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v27;
    -[AVEditBehaviorContext flexibleSpaceItem](self, "flexibleSpaceItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v28;
    -[AVEditBehaviorContext doneButton](self, "doneButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v29;
    v30 = (void *)MEMORY[0x1E0C99D20];
    v31 = v35;
  }
  else
  {
    -[AVEditBehaviorContext cancelButton](self, "cancelButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v21;
    -[AVEditBehaviorContext flexibleSpaceItem](self, "flexibleSpaceItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v26;
    -[AVEditBehaviorContext playButton](self, "playButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v27;
    -[AVEditBehaviorContext flexibleSpaceItem](self, "flexibleSpaceItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v28;
    -[AVEditBehaviorContext doneButton](self, "doneButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v29;
    v30 = (void *)MEMORY[0x1E0C99D20];
    v31 = v36;
  }
  objc_msgSend(v30, "arrayWithObjects:count:", v31, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v22;
}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_playerViewController);
}

- (AVEditBehavior)behavior
{
  return (AVEditBehavior *)objc_loadWeakRetained((id *)&self->_behavior);
}

- (void)setBehavior:(id)a3
{
  objc_storeWeak((id *)&self->_behavior, a3);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (CGAffineTransform)rotationTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].b;
  return self;
}

- (void)setRotationTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_rotationTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_rotationTransform.c = v4;
  *(_OWORD *)&self->_rotationTransform.a = v3;
}

- (AVEditBehaviorParameters)parameters
{
  return self->_parameters;
}

- (AVZoomingBehavior)zoomingBehavior
{
  return self->_zoomingBehavior;
}

- (void)setZoomingBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_zoomingBehavior, a3);
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_observationController, a3);
}

- (AVEditView)editView
{
  return self->_editView;
}

- (void)setEditView:(id)a3
{
  objc_storeStrong((id *)&self->_editView, a3);
}

- (AVAssetImageGenerator)imageGenerator
{
  return self->_imageGenerator;
}

- (void)setImageGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_imageGenerator, a3);
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
  objc_storeStrong((id *)&self->_playerController, a3);
}

- (id)playerTimeObserver
{
  return self->_playerTimeObserver;
}

- (void)setPlayerTimeObserver:(id)a3
{
  objc_storeStrong(&self->_playerTimeObserver, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIBarButtonItem)flexibleSpaceItem
{
  return self->_flexibleSpaceItem;
}

- (void)setFlexibleSpaceItem:(id)a3
{
  objc_storeStrong((id *)&self->_flexibleSpaceItem, a3);
}

- (UIBarButtonItem)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_playButton, a3);
}

- (UIBarButtonItem)pauseButton
{
  return self->_pauseButton;
}

- (void)setPauseButton:(id)a3
{
  objc_storeStrong((id *)&self->_pauseButton, a3);
}

- (NSMutableArray)pendingImageRequests
{
  return self->_pendingImageRequests;
}

- (NSMutableDictionary)requestedImageTimeToCMTimeMap
{
  return self->_requestedImageTimeToCMTimeMap;
}

- (unint64_t)currentRotation
{
  return self->_currentRotation;
}

- (void)setCurrentRotation:(unint64_t)a3
{
  self->_currentRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedImageTimeToCMTimeMap, 0);
  objc_storeStrong((id *)&self->_pendingImageRequests, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_playerTimeObserver, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_imageGenerator, 0);
  objc_storeStrong((id *)&self->_editView, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_zoomingBehavior, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_destroyWeak((id *)&self->_behavior);
  objc_destroyWeak((id *)&self->_playerViewController);
}

void __44__AVEditBehaviorContext__generateThumbnails__block_invoke(uint64_t a1, __int128 *a2, CGImageRef image, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD block[6];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a5)
  {
    v13 = v5;
    v14 = v6;
    CGImageRetain(image);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__AVEditBehaviorContext__generateThumbnails__block_invoke_2;
    block[3] = &unk_1E5BB2178;
    v11 = *a2;
    v12 = *((_QWORD *)a2 + 2);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = image;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __44__AVEditBehaviorContext__generateThumbnails__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestedImageTimeToCMTimeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "editView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThumbnailImage:forTimestamp:", *(_QWORD *)(a1 + 40), v4);

  objc_msgSend(*(id *)(a1 + 32), "requestedImageTimeToCMTimeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v2);

  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

void __73__AVEditBehaviorContext_contentViewWillTransitionToSize_withCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "editView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

void __40__AVEditBehaviorContext_didAddBehavior___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v4 = a3;
  objc_msgSend(v9, "playerViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(v9, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avkit_setCurrentEditBehaviorContext:", v9);

  }
}

void __37__AVEditBehaviorContext_startEditing__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrubbing");

  if ((v4 & 1) == 0)
  {
    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "editView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentTime");
    objc_msgSend(v5, "setCurrentTime:");

  }
}

void __37__AVEditBehaviorContext_startEditing__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "_makeBarButtonItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setItems:", v4);
}

void __37__AVEditBehaviorContext_startEditing__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  AVEditView *v5;
  AVEditView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  _QWORD v74[4];
  _QWORD v75[2];
  _QWORD v76[5];

  v76[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (AVEditView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_16;
  -[AVEditView duration](v5, "duration");
  if ((v73 & 0x1D) != 1)
    goto LABEL_16;
  objc_msgSend(v2, "playerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "status") != 2)
  {

LABEL_16:
    goto LABEL_17;
  }
  objc_msgSend(v2, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationSize");
  v12 = v11;
  v14 = v13;
  v15 = MEMORY[0x1E0C9D820];
  v16 = *MEMORY[0x1E0C9D820];

  if (v12 != v16 || v14 != *(double *)(v15 + 8))
  {
    objc_msgSend(v2, "editView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v2, "playerViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v3, "addSubview:", v4);
      v65 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v4, "leftAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "leftAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintEqualToAnchor:", v69);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v67;
      objc_msgSend(v4, "rightAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "rightAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v76[1] = v21;
      objc_msgSend(v4, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v76[2] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "activateConstraints:", v25);

      v6 = objc_alloc_init(AVEditView);
      -[AVEditView setDataSource:](v6, "setDataSource:", v2);
      -[AVEditView setDelegate:](v6, "setDelegate:", v2);
      objc_msgSend(v2, "playerController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "currentTime");
      -[AVEditView setCurrentTime:](v6, "setCurrentTime:");

      objc_msgSend(v2, "playerViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "player");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "currentItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "playerController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = objc_msgSend(v30, "hasEnabledVideo");

      v72 = v29;
      if ((_DWORD)v28)
      {
        v31 = (void *)MEMORY[0x1E0C8AFC8];
        objc_msgSend(v29, "asset");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "assetImageGeneratorWithAsset:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setImageGenerator:", v33);

        objc_msgSend(v2, "imageGenerator");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setAppliesPreferredTrackTransform:", 1);

        objc_msgSend(v2, "imageGenerator");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "playerViewController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "contentView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "traitCollection");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "displayScale");
        v40 = v39;
        v41 = 1.0;
        if (v39 >= 1.0)
        {
          objc_msgSend(v2, "playerViewController");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "contentView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "traitCollection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "displayScale");
          v41 = v42;
        }
        -[AVEditView intrinsicContentSize](v6, "intrinsicContentSize");
        objc_msgSend(v35, "setMaximumSize:", 0.0, v41 * v43);
        if (v40 >= 1.0)
        {

        }
      }
      v44 = objc_alloc_init(MEMORY[0x1E0DC3E68]);
      objc_msgSend(v2, "setToolbar:", v44);

      objc_msgSend(v2, "toolbar");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setBarStyle:", 1);

      objc_msgSend(v2, "_makeBarButtonItems");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "toolbar");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setItems:", v46);

      v48 = objc_alloc(MEMORY[0x1E0DC3CA8]);
      v75[0] = v6;
      objc_msgSend(v2, "toolbar");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v48, "initWithArrangedSubviews:", v50);

      objc_msgSend(v51, "setAxis:", 1);
      objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v4, "addSubview:", v51);
      objc_msgSend(v4, "safeAreaLayoutGuide");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v51, "leftAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "leftAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v68);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v66;
      objc_msgSend(v51, "rightAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "rightAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:", v62);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v60;
      objc_msgSend(v51, "bottomAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v52;
      objc_msgSend(v52, "bottomAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:", v58);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v74[2] = v53;
      objc_msgSend(v51, "topAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "topAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "activateConstraints:", v57);

      objc_msgSend(v2, "setContainerView:", v4);
      objc_msgSend(v2, "setEditView:", v6);

      goto LABEL_16;
    }
  }
LABEL_17:

}

@end
