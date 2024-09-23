@implementation AVPictureInPictureSampleBufferDisplayLayerView

- (AVPictureInPictureSampleBufferDisplayLayerView)initWithSourceLayer:(id)a3 playerController:(id)a4
{
  id v7;
  id v8;
  AVPictureInPictureSampleBufferDisplayLayerView *v9;
  AVPictureInPictureSampleBufferDisplayLayerView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerView;
  v9 = -[AVPictureInPictureSampleBufferDisplayLayerView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLayer, a3);
    objc_storeStrong((id *)&v10->_playerController, a4);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVPictureInPictureSampleBufferDisplayLayerView observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerView;
  -[AVPictureInPictureSampleBufferDisplayLayerView dealloc](&v4, sel_dealloc);
}

- (void)_updateSourceLayerHost
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  int v16;
  id v17;

  -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avkit_sbdlpip_findFirstCALayerHost");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v17, "contextId");
  -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v17)
  {
    if (!v4)
    {

      goto LABEL_6;
    }
    v15 = -[AVPictureInPictureSampleBufferDisplayLayerView sourceContextId](self, "sourceContextId");
    v16 = objc_msgSend(v17, "contextId");

    if (v15 == v16)
      goto LABEL_6;
  }
  else
  {

  }
  -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVPictureInPictureSampleBufferDisplayLayerView observationController](self, "observationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopObserving:", v8);

  }
  -[AVPictureInPictureSampleBufferDisplayLayerView setSourceLayerHost:](self, "setSourceLayerHost:", v17);
  -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureSampleBufferDisplayLayerView setSourceContextId:](self, "setSourceContextId:", objc_msgSend(v9, "contextId"));

  -[AVPictureInPictureSampleBufferDisplayLayerView observationController](self, "observationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "startObserving:keyPath:includeInitialValue:observationHandler:", v11, CFSTR("beginTime"), 1, &__block_literal_global_20938);

  v13 = -[AVPictureInPictureSampleBufferDisplayLayerView sourceContextId](self, "sourceContextId");
  -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContextId:", v13);

  objc_msgSend(v17, "setContextId:", 0);
LABEL_6:

}

- (void)setPIPModeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  AVObservationController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  AVPictureInPictureSampleBufferDisplayLayerHostView *v29;
  AVPictureInPictureSampleBufferDisplayLayerHostView *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  uint8_t v67[16];
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  if (self->_PIPModeEnabled != a3)
  {
    v3 = a3;
    self->_PIPModeEnabled = a3;
    -[AVPictureInPictureSampleBufferDisplayLayerView observationController](self, "observationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAllObservation");

    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v67 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Expected a source layer.", v67, 2u);
      }

    }
    -[AVPictureInPictureSampleBufferDisplayLayerView playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (!v3)
      {
LABEL_16:
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setHidden:", 1);

        -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeFromSuperview");

        -[AVPictureInPictureSampleBufferDisplayLayerView setSbdlHostView:](self, "setSbdlHostView:", 0);
        v16 = -[AVPictureInPictureSampleBufferDisplayLayerView sourceContextId](self, "sourceContextId");
        -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setContextId:", v16);

        -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setContextId:", 0);

        -[AVPictureInPictureSampleBufferDisplayLayerView setSourceContextId:](self, "setSourceContextId:", 0);
        -[AVPictureInPictureSampleBufferDisplayLayerView setSourceLayerHost:](self, "setSourceLayerHost:", 0);
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        -[AVPictureInPictureSampleBufferDisplayLayerView placeholderLayer](self, "placeholderLayer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeFromSuperlayer");

        -[AVPictureInPictureSampleBufferDisplayLayerView setPlaceholderLayer:](self, "setPlaceholderLayer:", 0);
        return;
      }
    }
    else
    {
      _AVLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v67 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Expected a player controller.", v67, 2u);
      }

      if (!v3)
        goto LABEL_16;
    }
    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_16;
    v11 = (void *)v10;
    -[AVPictureInPictureSampleBufferDisplayLayerView playerController](self, "playerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_16;
    -[AVPictureInPictureSampleBufferDisplayLayerView observationController](self, "observationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[AVPictureInPictureSampleBufferDisplayLayerView setObservationController:](self, "setObservationController:", v13);
    }
    else
    {
      v20 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
      -[AVPictureInPictureSampleBufferDisplayLayerView setObservationController:](self, "setObservationController:", v20);

    }
    -[AVPictureInPictureSampleBufferDisplayLayerView placeholderLayer](self, "placeholderLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[AVPictureInPictureSampleBufferDisplayLayerView setPlaceholderLayer:](self, "setPlaceholderLayer:", v21);
    }
    else
    {
      -[AVPictureInPictureSampleBufferDisplayLayerView _makePictureInPicturePlatformAdapterContentPlaceholderLayer](self, "_makePictureInPicturePlatformAdapterContentPlaceholderLayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureSampleBufferDisplayLayerView setPlaceholderLayer:](self, "setPlaceholderLayer:", v22);

    }
    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "avkit_sbdlpip_findFirstCALayerHost");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureSampleBufferDisplayLayerView setSourceLayerHost:](self, "setSourceLayerHost:", v25);

      -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureSampleBufferDisplayLayerView setSourceContextId:](self, "setSourceContextId:", objc_msgSend(v26, "contextId"));

      -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setContextId:", 0);

    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      -[AVPictureInPictureSampleBufferDisplayLayerView setSbdlHostView:](self, "setSbdlHostView:", v28);
    }
    else
    {
      v29 = [AVPictureInPictureSampleBufferDisplayLayerHostView alloc];
      -[AVPictureInPictureSampleBufferDisplayLayerView bounds](self, "bounds");
      v30 = -[AVPictureInPictureSampleBufferDisplayLayerHostView initWithFrame:](v29, "initWithFrame:");
      -[AVPictureInPictureSampleBufferDisplayLayerView setSbdlHostView:](self, "setSbdlHostView:", v30);

    }
    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayerHost](self, "sourceLayerHost");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "beginTime");
    v33 = v32;
    -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBeginTime:", v33);

    v35 = -[AVPictureInPictureSampleBufferDisplayLayerView sourceContextId](self, "sourceContextId");
    -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContextId:", v35);

    -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureSampleBufferDisplayLayerView addSubview:](self, "addSubview:", v37);

    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureSampleBufferDisplayLayerView placeholderLayer](self, "placeholderLayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSublayer:", v39);

    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bounds");
    -[AVPictureInPictureSampleBufferDisplayLayerView setImageQueueSize:](self, "setImageQueueSize:", v41, v42);

    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    -[AVPictureInPictureSampleBufferDisplayLayerView placeholderLayer](self, "placeholderLayer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setBounds:", v45, v47, v49, v51);

    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bounds");
    UIRectGetCenter();
    v55 = v54;
    v57 = v56;
    -[AVPictureInPictureSampleBufferDisplayLayerView placeholderLayer](self, "placeholderLayer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setPosition:", v55, v57);

    -[AVPictureInPictureSampleBufferDisplayLayerView _updateGeometry](self, "_updateGeometry");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    -[AVPictureInPictureSampleBufferDisplayLayerView observationController](self, "observationController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureSampleBufferDisplayLayerView playerController](self, "playerController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = CFSTR("contentDimensions");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (id)objc_msgSend(v59, "startObserving:keyPaths:includeInitialValue:observationHandler:", v60, v61, 0, &__block_literal_global_13_20927);

    -[AVPictureInPictureSampleBufferDisplayLayerView observationController](self, "observationController");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (id)objc_msgSend(v63, "startObserving:keyPath:includeInitialValue:observationHandler:", v64, CFSTR("bounds"), 0, &__block_literal_global_16_20929);

    -[AVPictureInPictureSampleBufferDisplayLayerView observationController](self, "observationController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("VideoQueue_CAContextIDDidChange"), 0, 0, &__block_literal_global_20_20931);

  }
}

- (void)setLastKnownRenderSize:(CGSize)a3
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  height = a3.height;
  width = a3.width;
  if (a3.width != self->_lastKnownRenderSize.width || a3.height != self->_lastKnownRenderSize.height)
  {
    self->_lastKnownRenderSize = a3;
    -[AVPictureInPictureSampleBufferDisplayLayerView playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pictureInPictureController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sampleBufferPlaybackDelegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[AVPictureInPictureSampleBufferDisplayLayerView playerController](self, "playerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pictureInPictureController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pictureInPictureController:didTransitionToRenderSize:", v11, (int)width | ((unint64_t)(int)height << 32));

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerView;
  -[AVPictureInPictureSampleBufferDisplayLayerView layoutSubviews](&v3, sel_layoutSubviews);
  -[AVPictureInPictureSampleBufferDisplayLayerView _updateGeometry](self, "_updateGeometry");
}

- (void)_updateGeometry
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v21;
  _BOOL4 v24;
  BOOL v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  AVPictureInPictureSampleBufferDisplayLayerView *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  CGSize v43;
  CGRect v44;

  -[AVPictureInPictureSampleBufferDisplayLayerView playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentDimensions");
  v5 = v4;
  v7 = v6;

  -[AVPictureInPictureSampleBufferDisplayLayerView playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentDimensions");
  v11 = v10;
  v12 = v10 - 1;
  v13 = ((v10 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  v16 = ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v9 >= 0
     || (unint64_t)(v9 - 1) < 0xFFFFFFFFFFFFFLL;

  -[AVPictureInPictureSampleBufferDisplayLayerView imageQueueSize](self, "imageQueueSize");
  v21 = ((v17 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v17 >= 0
     || (unint64_t)(v17 - 1) < 0xFFFFFFFFFFFFFLL;
  v24 = ((v18 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v18 >= 0
     || (unint64_t)(v18 - 1) < 0xFFFFFFFFFFFFFLL;
  v26 = (v11 < 0 || v13 > 0x3FE) && v12 > 0xFFFFFFFFFFFFELL;
  if (!v26
    && v16
    && v21
    && v24
    && -[AVPictureInPictureSampleBufferDisplayLayerView isPIPModeEnabled](self, "isPIPModeEnabled"))
  {
    -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", 0);

    -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureSampleBufferDisplayLayerView bounds](self, "bounds");
    objc_msgSend(v28, "setFrame:contentDimensions:imageQueueSize:");

    -[AVPictureInPictureSampleBufferDisplayLayerView frame](self, "frame");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v43.width = v5;
    v43.height = v7;
    v44.origin.x = v30;
    v44.origin.y = v32;
    v44.size.width = v34;
    v44.size.height = v36;
    AVMakeRectWithAspectRatioInsideRect(v43, v44);
    v37 = self;
    UIPointRoundToViewScale();
    UISizeRoundToViewScale();
    v39 = v38;
    v41 = v40;

  }
  else
  {
    -[AVPictureInPictureSampleBufferDisplayLayerView sbdlHostView](self, "sbdlHostView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setHidden:", 1);

    v39 = *MEMORY[0x1E0C9D820];
    v41 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[AVPictureInPictureSampleBufferDisplayLayerView setLastKnownRenderSize:](self, "setLastKnownRenderSize:", v39, v41);
}

- (id)_makePictureInPicturePlatformAdapterContentPlaceholderLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AVPictureInPictureIndicatorLayer *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  AVPictureInPictureIndicatorLayer *v23;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 100.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:withConfiguration:", CFSTR("pip"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorForegroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_flatImageWithColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [AVPictureInPictureIndicatorLayer alloc];
  -[AVPictureInPictureSampleBufferDisplayLayerView sourceLayer](self, "sourceLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "avkit_window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  v15 = v14;
  v16 = objc_retainAutorelease(v9);
  v17 = objc_msgSend(v16, "CGImage");
  v18 = *MEMORY[0x1E0C9D538];
  v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[AVPictureInPictureSampleBufferDisplayLayerView playerController](self, "playerController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentDimensions");
  v23 = -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](v10, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", v17, 0, v15, v18, v19, v21, v22);

  return v23;
}

- (AVSampleBufferDisplayLayer)sourceLayer
{
  return self->_sourceLayer;
}

- (BOOL)isPIPModeEnabled
{
  return self->_PIPModeEnabled;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_observationController, a3);
}

- (AVSampleBufferDisplayLayerPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
  objc_storeStrong((id *)&self->_playerController, a3);
}

- (AVPictureInPictureIndicatorLayer)placeholderLayer
{
  return self->_placeholderLayer;
}

- (void)setPlaceholderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderLayer, a3);
}

- (AVPictureInPictureSampleBufferDisplayLayerHostView)sbdlHostView
{
  return self->_sbdlHostView;
}

- (void)setSbdlHostView:(id)a3
{
  objc_storeStrong((id *)&self->_sbdlHostView, a3);
}

- (CALayerHost)sourceLayerHost
{
  return (CALayerHost *)objc_loadWeakRetained((id *)&self->_sourceLayerHost);
}

- (void)setSourceLayerHost:(id)a3
{
  objc_storeWeak((id *)&self->_sourceLayerHost, a3);
}

- (unsigned)sourceContextId
{
  return self->_sourceContextId;
}

- (void)setSourceContextId:(unsigned int)a3
{
  self->_sourceContextId = a3;
}

- (CGSize)lastKnownRenderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastKnownRenderSize.width;
  height = self->_lastKnownRenderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)imageQueueSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageQueueSize.width;
  height = self->_imageQueueSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageQueueSize:(CGSize)a3
{
  self->_imageQueueSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceLayerHost);
  objc_storeStrong((id *)&self->_sbdlHostView, 0);
  objc_storeStrong((id *)&self->_placeholderLayer, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_sourceLayer, 0);
}

uint64_t __68__AVPictureInPictureSampleBufferDisplayLayerView_setPIPModeEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateSourceLayerHost");
}

void __68__AVPictureInPictureSampleBufferDisplayLayerView_setPIPModeEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "sourceLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v21, "placeholderLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);

  objc_msgSend(v21, "sourceLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  UIRectGetCenter();
  v14 = v13;
  v16 = v15;
  objc_msgSend(v21, "placeholderLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPosition:", v14, v16);

  objc_msgSend(v21, "sourceLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  objc_msgSend(v21, "setImageQueueSize:", v19, v20);

  objc_msgSend(v21, "_updateGeometry");
}

uint64_t __68__AVPictureInPictureSampleBufferDisplayLayerView_setPIPModeEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateGeometry");
}

void __72__AVPictureInPictureSampleBufferDisplayLayerView__updateSourceLayerHost__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a2;
  objc_msgSend(a3, "beginTime");
  v6 = v5;
  objc_msgSend(v4, "sbdlHostView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setBeginTime:", v6);
}

@end
