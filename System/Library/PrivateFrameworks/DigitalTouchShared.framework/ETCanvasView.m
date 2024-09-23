@implementation ETCanvasView

- (ETCanvasView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  ETCanvasView *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  SKScene *scene;
  SKScene *v10;
  void *v11;
  DTSSceneView *v12;
  DTSSceneView *sceneView;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *messageIdentifierToDoodleView;
  uint64_t v19;
  NSMutableSet *playingMessages;
  uint64_t v21;
  UILongPressGestureRecognizer *heartbeatRecognizer;
  uint64_t v23;
  UITapGestureRecognizer *tapRecognizer;
  uint64_t v25;
  UITapGestureRecognizer *kissRecognizer;
  void *v27;
  void *v28;
  uint64_t v29;
  NSMutableSet *touchesDown;
  uint64_t v31;
  UIColor *drawingColor;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  ETCanvasView *v37;
  objc_super v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  height = a3.size.height;
  width = a3.size.width;
  v39.receiver = self;
  v39.super_class = (Class)ETCanvasView;
  v5 = -[ETCanvasView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2050000000;
    v6 = (void *)getSKSceneClass_softClass;
    v44 = getSKSceneClass_softClass;
    if (!getSKSceneClass_softClass)
    {
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __getSKSceneClass_block_invoke;
      v40[3] = &unk_24F6E6C30;
      v40[4] = &v41;
      __getSKSceneClass_block_invoke((uint64_t)v40);
      v6 = (void *)v42[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v41, 8);
    v8 = objc_msgSend([v7 alloc], "initWithSize:", width, height);
    scene = v5->_scene;
    v5->_scene = (SKScene *)v8;

    v10 = v5->_scene;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScene setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[SKScene setAnchorPoint:](v5->_scene, "setAnchorPoint:", 0.5, 0.5);
    v12 = -[DTSSceneView initWithSize:]([DTSSceneView alloc], "initWithSize:", width, height);
    sceneView = v5->_sceneView;
    v5->_sceneView = v12;

    -[DTSSceneView setShouldCullNonVisibleNodes:](v5->_sceneView, "setShouldCullNonVisibleNodes:", 0);
    -[DTSSceneView setIgnoresSiblingOrder:](v5->_sceneView, "setIgnoresSiblingOrder:", 1);
    -[DTSSceneView setAllowsTransparency:](v5->_sceneView, "setAllowsTransparency:", 1);
    -[DTSSceneView presentScene:](v5->_sceneView, "presentScene:", v5->_scene);
    -[DTSSceneView setPaused:](v5->_sceneView, "setPaused:", 1);
    -[DTSSceneView setPreferredFramesPerSecond:](v5->_sceneView, "setPreferredFramesPerSecond:", 60);
    -[DTSSceneView options](v5->_sceneView, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("ignoreBackgroundNotifications"));

    -[DTSSceneView setUserInteractionEnabled:](v5->_sceneView, "setUserInteractionEnabled:", 0);
    -[ETCanvasView addSubview:](v5, "addSubview:", v5->_sceneView);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETCanvasView setBackgroundColor:](v5, "setBackgroundColor:", v15);

    -[ETCanvasView layer](v5, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    messageIdentifierToDoodleView = v5->_messageIdentifierToDoodleView;
    v5->_messageIdentifierToDoodleView = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    playingMessages = v5->_playingMessages;
    v5->_playingMessages = (NSMutableSet *)v19;

    v5->_canComposeHeartbeat = 1;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v5, sel__heartbeatRecognized_);
    heartbeatRecognizer = v5->_heartbeatRecognizer;
    v5->_heartbeatRecognizer = (UILongPressGestureRecognizer *)v21;

    -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](v5->_heartbeatRecognizer, "setNumberOfTouchesRequired:", 2);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v5->_heartbeatRecognizer, "setMinimumPressDuration:", 0.2);
    -[ETCanvasView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_heartbeatRecognizer);
    v5->_canComposeTap = 1;
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v5, sel__tapRecognized_);
    tapRecognizer = v5->_tapRecognizer;
    v5->_tapRecognizer = (UITapGestureRecognizer *)v23;

    -[UITapGestureRecognizer setDelaysTouchesBegan:](v5->_tapRecognizer, "setDelaysTouchesBegan:", 1);
    -[UITapGestureRecognizer setAllowableMovement:](v5->_tapRecognizer, "setAllowableMovement:", 11.0);
    -[UITapGestureRecognizer setDelegate:](v5->_tapRecognizer, "setDelegate:", v5);
    -[ETCanvasView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_tapRecognizer);
    v5->_canComposeKiss = 1;
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v5, sel__kissRecognized_);
    kissRecognizer = v5->_kissRecognizer;
    v5->_kissRecognizer = (UITapGestureRecognizer *)v25;

    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v5->_kissRecognizer, "setNumberOfTouchesRequired:", 2);
    -[UITapGestureRecognizer setDelegate:](v5->_kissRecognizer, "setDelegate:", v5);
    -[ETCanvasView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_kissRecognizer);
    v5->_canComposeAnger = 1;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETCanvasView setForceTouchEnabled:](v5, "setForceTouchEnabled:", objc_msgSend(v28, "forceTouchCapability") == 2);

    -[ETCanvasView _configureAngerRecognizer](v5, "_configureAngerRecognizer");
    -[ETCanvasView setMultipleTouchEnabled:](v5, "setMultipleTouchEnabled:", 1);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v29 = objc_claimAutoreleasedReturnValue();
    touchesDown = v5->_touchesDown;
    v5->_touchesDown = (NSMutableSet *)v29;

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v31 = objc_claimAutoreleasedReturnValue();
    drawingColor = v5->_drawingColor;
    v5->_drawingColor = (UIColor *)v31;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "persistentDomainForName:", CFSTR("com.apple.ET"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", CFSTR("ETWispDelay"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    v5->_wispDelay = v36;

    -[ETCanvasView setPaused:](v5, "setPaused:", 1);
    v5->_messageType = -1;
    v37 = v5;
  }

  return v5;
}

- (void)showPhotoForImage:(id)a3
{
  id v4;
  UIImageView *photoView;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  id v9;

  v4 = a3;
  photoView = self->_photoView;
  v9 = v4;
  if (!photoView)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    v7 = self->_photoView;
    self->_photoView = v6;

    -[UIImageView setContentMode:](self->_photoView, "setContentMode:", 2);
    -[UIImageView layer](self->_photoView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMasksToBounds:", 1);

    -[ETCanvasView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_photoView, 0);
    v4 = v9;
    photoView = self->_photoView;
  }
  -[UIImageView setImage:](photoView, "setImage:", v4);
  -[ETCanvasView _updatePhotoViewFrame](self, "_updatePhotoViewFrame");

}

- (void)hidePhoto
{
  UIImageView *photoView;

  -[UIImageView removeFromSuperview](self->_photoView, "removeFromSuperview");
  photoView = self->_photoView;
  self->_photoView = 0;

}

- (void)showVideoForPlayer:(id)a3
{
  AVPlayerLayer *v4;
  AVPlayerLayer *videoLayer;
  UIView *v6;
  UIView *videoView;
  id v8;

  if (!self->_videoView)
  {
    objc_msgSend(MEMORY[0x24BDB2648], "playerLayerWithPlayer:", a3);
    v4 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue();
    videoLayer = self->_videoLayer;
    self->_videoLayer = v4;

    v6 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    videoView = self->_videoView;
    self->_videoView = v6;

    -[UIView layer](self->_videoView, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", self->_videoLayer);
    objc_msgSend(v8, "setMasksToBounds:", 1);
    -[ETCanvasView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_videoView, 0);
    -[ETCanvasView _updateVideoViewFrame](self, "_updateVideoViewFrame");

  }
}

- (void)hideVideo
{
  UIView *videoView;
  AVPlayerLayer *videoLayer;

  -[UIView removeFromSuperview](self->_videoView, "removeFromSuperview");
  videoView = self->_videoView;
  self->_videoView = 0;

  -[AVPlayerLayer removeFromSuperlayer](self->_videoLayer, "removeFromSuperlayer");
  videoLayer = self->_videoLayer;
  self->_videoLayer = 0;

}

- (void)_updateVideoViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[ETCanvasView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[AVPlayerLayer setFrame:](self->_videoLayer, "setFrame:", 0.0, 0.0);
  -[UIView setFrame:](self->_videoView, "setFrame:", 0.0, 0.0, v4, v6);
}

- (void)_updatePhotoViewFrame
{
  -[ETCanvasView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_photoView, "setFrame:", 0.0, 0.0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  char v8;
  ETGLSketchView *currentSketchView;
  id v10;
  ETGLSketchView *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ETCanvasView;
  -[ETCanvasView layoutSubviews](&v12, sel_layoutSubviews);
  -[ETCanvasView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SKScene setSize:](self->_scene, "setSize:", v3, v5);
  -[DTSSceneView setSize:](self->_sceneView, "setSize:", v4, v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    currentSketchView = self->_currentSketchView;
    v10 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    -[ETGLSketchView setUseFastVerticalWisp:](currentSketchView, "setUseFastVerticalWisp:", objc_msgSend(v10, "canvasViewShouldUseFastVerticalWisp:", self));

  }
  v11 = self->_currentSketchView;
  -[ETCanvasView bounds](self, "bounds");
  -[ETGLSketchView setFrame:](v11, "setFrame:");
  -[ETCanvasView _updateVideoViewFrame](self, "_updateVideoViewFrame");
  -[ETCanvasView _updatePhotoViewFrame](self, "_updatePhotoViewFrame");
}

- (BOOL)_sketchInProgress
{
  return self->_currentSketchView || self->_messageType == 1;
}

- (BOOL)isComposingHeartbeat
{
  return self->_currentHeartbeat || self->_messageType == 2;
}

- (BOOL)isComposingSketch
{
  return self->_isComposing && -[ETCanvasView _sketchInProgress](self, "_sketchInProgress");
}

- (BOOL)_tapsInProgress
{
  return self->_currentTaps || self->_messageType == 0;
}

- (void)_startDoodleMessageCompositionAtTime:(double)a3
{
  void *v5;
  void *v6;
  ETSketchMessage *v7;

  v7 = objc_alloc_init(ETSketchMessage);
  -[ETSketchMessage setHasMultipleColors:](v7, "setHasMultipleColors:", 1);
  -[ETCanvasView timeSource](self, "timeSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETMessage setTimeSource:](v7, "setTimeSource:", v5);

  -[ETSketchMessage setParentMessage:](v7, "setParentMessage:", self->_parentMessage);
  -[ETCanvasView drawingColor](self, "drawingColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETCanvasView _createSketchViewWithColor:time:message:](self, "_createSketchViewWithColor:time:message:", v6, v7, a3);

  -[ETCanvasView _setIsComposingMessageOfType:](self, "_setIsComposingMessageOfType:", 1);
}

- (void)startDoodleMessageComposition
{
  -[ETCanvasView endMessageComposition](self, "endMessageComposition");
  -[ETCanvasView _startDoodleMessageCompositionAtTime:](self, "_startDoodleMessageCompositionAtTime:", CFAbsoluteTimeGetCurrent());
}

- (void)_setIsComposingMessageOfType:(unsigned __int16)a3
{
  uint64_t v3;
  int *v5;
  id WeakRetained;

  v3 = a3;
  self->_isComposing = 1;
  self->_messageType = a3;
  if (a3 == 1)
  {
    -[UITapGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:", 0);
    if (!self->_parentMessage)
    {
      -[UITapGestureRecognizer setEnabled:](self->_kissRecognizer, "setEnabled:", 0);
      -[UILongPressGestureRecognizer setEnabled:](self->_heartbeatRecognizer, "setEnabled:", 0);
      -[UILongPressGestureRecognizer setEnabled:](self->_angerRecognizer, "setEnabled:", 0);
    }
    v5 = &OBJC_IVAR___ETCanvasView__currentSketchView;
  }
  else
  {
    v5 = &OBJC_IVAR___ETCanvasView__sceneView;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "setPaused:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  objc_msgSend(WeakRetained, "canvasView:didBeginComposingMessageType:", self, v3);

  -[ETCanvasView _startCheckForIdleTimer](self, "_startCheckForIdleTimer");
}

- (void)_updateRecognizersAtEndOfComposition
{
  -[UITapGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:", self->_canComposeTap);
  if (!self->_parentMessage)
  {
    -[UITapGestureRecognizer setEnabled:](self->_kissRecognizer, "setEnabled:", self->_canComposeKiss);
    -[UILongPressGestureRecognizer setEnabled:](self->_heartbeatRecognizer, "setEnabled:", self->_canComposeHeartbeat);
    -[UILongPressGestureRecognizer setEnabled:](self->_angerRecognizer, "setEnabled:", self->_canComposeAnger);
  }
}

- (void)_endMessage:(id)a3 withSend:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  ETGLSketchView *currentSketchView;
  NSMutableDictionary *messageIdentifierToDoodleView;
  void *v10;
  ETGLSketchView *v11;
  int messageType;
  id WeakRetained;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_22C68B000, v7, OS_LOG_TYPE_INFO, "Ending message: %@. Will send: %d", (uint8_t *)&v16, 0x12u);
    }

  }
  currentSketchView = self->_currentSketchView;
  messageIdentifierToDoodleView = self->_messageIdentifierToDoodleView;
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](messageIdentifierToDoodleView, "objectForKey:", v10);
  v11 = (ETGLSketchView *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (messageType = self->_messageType, messageType == objc_msgSend(v6, "messageType")))
  {
    if (self->_messageType != 1 || currentSketchView == v11)
    {
      self->_isComposing = 0;
      self->_sketchDidReachSizeLimit = 0;
      self->_messageType = -1;
    }
  }
  -[ETCanvasView _updateRecognizersAtEndOfComposition](self, "_updateRecognizersAtEndOfComposition");
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  objc_msgSend(WeakRetained, "canvasView:didEndComposingMessageType:", self, objc_msgSend(v6, "messageType"));

  if (v4)
  {
    v15 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    objc_msgSend(v15, "canvasView:sendMessage:", self, v6);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ETCanvasView _stopCheckForIdleTimer](self, "_stopCheckForIdleTimer");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ETCanvasView;
  -[ETCanvasView dealloc](&v4, sel_dealloc);
}

- (void)_setSketchesPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_messageIdentifierToDoodleView, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPaused:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_sketchesPaused
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_messageIdentifierToDoodleView, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isPaused") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  self->_paused = a3;
  if (a3)
  {
    -[ETCanvasView _clearSendMessageTimer](self, "_clearSendMessageTimer");
  }
  else if (-[ETCanvasView isComposing](self, "isComposing"))
  {
    -[ETCanvasView _startSendMessageTimer](self, "_startSendMessageTimer");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableSet allObjects](self->_playingMessages, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setMute:", v3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[DTSSceneView setPaused:](self->_sceneView, "setPaused:", v3);
  -[ETCanvasView _setSketchesPaused:](self, "_setSketchesPaused:", v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  if (v3)
  {
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      return;
    v12 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    objc_msgSend(v12, "canvasViewDidPause:", self);
  }
  else
  {
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
      return;
    v12 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    objc_msgSend(v12, "canvasViewDidUnpause:", self);
  }

}

- (void)setAlwaysPaused:(BOOL)a3
{
  void *v4;
  uint64_t v5;

  self->_setAlwaysPaused = a3;
  if (a3)
  {
    -[ETCanvasView clearCanvasAnimated:](self, "clearCanvasAnimated:", 0);
    -[ETCanvasView setPaused:](self, "setPaused:", 1);
    -[ETCanvasView _stopCheckForIdleTimer](self, "_stopCheckForIdleTimer");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "applicationState");

    if (!v5)
    {
      -[ETCanvasView setPaused:](self, "setPaused:", 0);
      -[ETCanvasView _startCheckForIdleTimer](self, "_startCheckForIdleTimer");
    }
  }
}

- (void)wispVisibleSketchViewsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__ETCanvasView_wispVisibleSketchViewsWithCompletion___block_invoke;
  v16[3] = &unk_24F6E6B00;
  v16[4] = self;
  v5 = v4;
  v17 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x22E2FF82C](v16);
  if (-[NSMutableDictionary count](self->_messageIdentifierToDoodleView, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](self->_messageIdentifierToDoodleView, "allValues", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
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
          -[ETCanvasView _animateOutSketchView:withCompletion:](self, "_animateOutSketchView:withCompletion:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      }
      while (v9);
    }

  }
  else if (v5)
  {
    v6[2](v6);
  }

}

uint64_t __53__ETCanvasView_wispVisibleSketchViewsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "count");
  if (!result)
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
    {
      (*(void (**)(void))(result + 16))();
      return objc_msgSend(*(id *)(a1 + 32), "_updateRecognizersAtEndOfComposition");
    }
  }
  return result;
}

- (void)_animateOutSketchView:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  char v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "messageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "delayWisp");
  objc_msgSend(v8, "setDelayWisp:", 0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__ETCanvasView__animateOutSketchView_withCompletion___block_invoke;
  v13[3] = &unk_24F6E6E68;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v17 = v9;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v12, "animateOutWithCompletion:", v13);

}

uint64_t __53__ETCanvasView__animateOutSketchView_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "messageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_clearDoodleViewForMessage:", v3);

  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "setDelayWisp:", *(unsigned __int8 *)(a1 + 64));
}

- (void)_clearDoodleViewForMessage:(id)a3
{
  ETGLSketchView *v4;
  id v5;

  objc_msgSend(a3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_messageIdentifierToDoodleView, "objectForKey:", v5);
  v4 = (ETGLSketchView *)objc_claimAutoreleasedReturnValue();
  -[ETGLSketchView clear](v4, "clear");
  -[ETGLSketchView removeFromSuperview](v4, "removeFromSuperview");
  if (v5)
    -[NSMutableDictionary removeObjectForKey:](self->_messageIdentifierToDoodleView, "removeObjectForKey:", v5);
  if (self->_currentSketchView == v4)
  {
    self->_currentSketchView = 0;

  }
}

- (void)clearCanvasAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSTimer *sendMessageTimer;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  ETGLSketchView *currentSketchView;
  UITouch *drawingTouch;
  ETTapMessage *currentTaps;
  ETKissMessage *currentKissMessage;
  ETHeartbeatMessage *currentHeartbeat;
  ETAngerMessage *currentAnger;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[ETCanvasView bounds](self, "bounds");
    v6 = (void *)objc_msgSend(v5, "initWithFrame:");
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[NSMutableDictionary allValues](self->_messageIdentifierToDoodleView, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "snapshotViewAfterScreenUpdates:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addSubview:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v9);
    }

    -[DTSSceneView snapshotViewAfterScreenUpdates:](self->_sceneView, "snapshotViewAfterScreenUpdates:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v13);

    -[ETCanvasView addSubview:](self, "addSubview:", v6);
  }
  else
  {
    v6 = 0;
  }
  -[NSTimer invalidate](self->_sendMessageTimer, "invalidate");
  sendMessageTimer = self->_sendMessageTimer;
  self->_sendMessageTimer = 0;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[NSMutableDictionary allValues](self->_messageIdentifierToDoodleView, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v20, "clear");
        objc_msgSend(v20, "removeFromSuperview");
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v17);
  }

  -[NSMutableDictionary removeAllObjects](self->_messageIdentifierToDoodleView, "removeAllObjects");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[NSMutableSet allObjects](self->_playingMessages, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v42 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "setMute:", 1);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v23);
  }

  -[NSMutableSet removeAllObjects](self->_playingMessages, "removeAllObjects");
  currentSketchView = self->_currentSketchView;
  self->_currentSketchView = 0;

  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_drawingTouchMovedDistance = 0.0;
  currentTaps = self->_currentTaps;
  self->_currentTaps = 0;

  currentKissMessage = self->_currentKissMessage;
  self->_currentKissMessage = 0;

  currentHeartbeat = self->_currentHeartbeat;
  self->_currentHeartbeat = 0;

  currentAnger = self->_currentAnger;
  self->_currentAnger = 0;

  self->_isComposing = 0;
  self->_messageType = -1;
  self->_lastActivityTimestamp = 0.0;
  self->_ignoreTouchesUntilAllTouchesEnded = 0;
  self->_sketchDidReachSizeLimit = 0;
  -[SKScene removeAllActions](self->_scene, "removeAllActions");
  -[SKScene removeAllChildren](self->_scene, "removeAllChildren");
  -[ETCanvasView _startCheckForIdleTimer](self, "_startCheckForIdleTimer");
  if (v3)
  {
    v32 = (void *)MEMORY[0x24BDF6F90];
    v33 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __36__ETCanvasView_clearCanvasAnimated___block_invoke;
    v39[3] = &unk_24F6E6A98;
    v40 = v6;
    v34 = v33;
    v35 = 3221225472;
    v36 = __36__ETCanvasView_clearCanvasAnimated___block_invoke_2;
    v37 = &unk_24F6E6BC8;
    v38 = v40;
    objc_msgSend(v32, "animateWithDuration:animations:completion:", v39, &v34, 0.25);

  }
  -[ETCanvasView _updateRecognizersAtEndOfComposition](self, "_updateRecognizersAtEndOfComposition", v34, v35, v36, v37);

}

uint64_t __36__ETCanvasView_clearCanvasAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __36__ETCanvasView_clearCanvasAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_startCheckForIdleTimer
{
  NSTimer *v3;
  NSTimer *idleTimer;

  if (!self->_idleTimer && !self->_setAlwaysPaused)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__checkForIdle, 0, 1, 1.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    idleTimer = self->_idleTimer;
    self->_idleTimer = v3;

  }
}

- (void)_stopCheckForIdleTimer
{
  NSTimer *idleTimer;
  NSTimer *v4;

  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    -[NSTimer invalidate](idleTimer, "invalidate");
    v4 = self->_idleTimer;
    self->_idleTimer = 0;

  }
}

- (void)_checkForIdle
{
  _BOOL4 isComposing;
  id v4;

  if (!self->_parentMessage && (-[SKScene hasActions](self->_scene, "hasActions") & 1) == 0)
  {
    -[SKScene children](self->_scene, "children");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") || -[NSMutableDictionary count](self->_messageIdentifierToDoodleView, "count"))
    {

    }
    else
    {
      isComposing = self->_isComposing;

      if (!isComposing)
      {
        -[ETCanvasView setPaused:](self, "setPaused:", 1);
        -[ETCanvasView _stopCheckForIdleTimer](self, "_stopCheckForIdleTimer");
      }
    }
  }
}

- (void)setDrawingColor:(id)a3
{
  objc_storeStrong((id *)&self->_drawingColor, a3);
  -[ETCanvasView _clearSendMessageTimer](self, "_clearSendMessageTimer");
  if (-[ETCanvasView isComposing](self, "isComposing"))
    -[ETCanvasView _startSendMessageTimer](self, "_startSendMessageTimer");
}

- (BOOL)_canComposeExclusiveMessage
{
  return self->_parentMessage || !self->_isComposing;
}

- (BOOL)_isTapTooRecentAfterKissGesture
{
  return self->_currentKissMessage && CFAbsoluteTimeGetCurrent() - self->_lastActivityTimestamp < 1.0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UILongPressGestureRecognizer *v4;
  UILongPressGestureRecognizer *v5;
  char v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  char v11;
  id WeakRetained;
  char v13;
  id v14;
  char v15;
  CGPoint v17;
  CGRect v18;

  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = v4;
  if ((UILongPressGestureRecognizer *)self->_tapRecognizer == v4)
  {
    -[UILongPressGestureRecognizer locationOfTouch:inView:](v4, "locationOfTouch:inView:", 0, self);
    v8 = v7;
    v10 = v9;
    v18 = CGRectInset(self->_ignoredTouchesRect, -15.0, -15.0);
    v17.x = v8;
    v17.y = v10;
    v11 = CGRectContainsPoint(v18, v17);
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      v15 = objc_msgSend(v14, "canvasView:tapRecognizerShouldBegin:", self, v5);

    }
    else
    {
      v15 = 1;
    }
    if (-[ETCanvasView _isTapTooRecentAfterKissGesture](self, "_isTapTooRecentAfterKissGesture"))
      v6 = 0;
    else
      v6 = (self->_messageType != 1) & ~v11 & v15;
  }
  else if (self->_angerRecognizer == v4 || self->_heartbeatRecognizer == v4)
  {
    v6 = -[ETCanvasView _canComposeExclusiveMessage](self, "_canComposeExclusiveMessage");
  }
  else
  {
    objc_opt_class();
    v6 = objc_opt_isKindOfClass() ^ 1;
  }

  return v6 & 1;
}

- (void)updateIgnoredTouchesRectForStatusBarSize:(CGSize)a3
{
  CGFloat height;
  double width;
  int v6;
  double v7;
  CGRect v8;

  height = a3.height;
  width = a3.width;
  v6 = -[ETCanvasView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v7 = 0.0;
  if (v6)
  {
    -[ETCanvasView bounds](self, "bounds", 0.0);
    v7 = CGRectGetWidth(v8) - width;
  }
  self->_ignoredTouchesRect.origin.x = v7;
  self->_ignoredTouchesRect.origin.y = 0.0;
  self->_ignoredTouchesRect.size.width = width;
  self->_ignoredTouchesRect.size.height = height;
}

- (void)_startFastTapAllowableMovementTimer
{
  NSTimer *v3;
  NSTimer *fastTapAllowableMovementTimer;

  -[NSTimer invalidate](self->_fastTapAllowableMovementTimer, "invalidate");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__fastTapAllowableMovementTimerFired, 0, 0, 1.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  fastTapAllowableMovementTimer = self->_fastTapAllowableMovementTimer;
  self->_fastTapAllowableMovementTimer = v3;

  -[UITapGestureRecognizer setAllowableMovement:](self->_tapRecognizer, "setAllowableMovement:", 30.0);
}

- (void)_fastTapAllowableMovementTimerFired
{
  NSTimer *fastTapAllowableMovementTimer;

  fastTapAllowableMovementTimer = self->_fastTapAllowableMovementTimer;
  self->_fastTapAllowableMovementTimer = 0;

  if (CFAbsoluteTimeGetCurrent() - self->_lastFastTapTimestamp >= 1.0)
    -[UITapGestureRecognizer setAllowableMovement:](self->_tapRecognizer, "setAllowableMovement:", 11.0);
  else
    -[ETCanvasView _startFastTapAllowableMovementTimer](self, "_startFastTapAllowableMovementTimer");
}

- (CGPoint)_normalizedGesturePoint:(id)a3
{
  id v4;
  double MidX;
  double MidY;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  -[ETCanvasView bounds](self, "bounds");
  MidX = CGRectGetMidX(v16);
  -[ETCanvasView bounds](self, "bounds");
  MidY = CGRectGetMidY(v17);
  if (-[ETMessage messageType](self->_parentMessage, "messageType") == 8 || self->_messageType == 10)
  {
    objc_msgSend(v4, "locationInView:", self);
    MidX = v7;
    MidY = v8;
  }
  -[ETCanvasView _viewPointNormalizedInSceneSpace:](self, "_viewPointNormalizedInSceneSpace:", MidX, MidY);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)_angerRecognized:(id)a3
{
  ETAngerMessage *v4;
  void *v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  CFAbsoluteTime Current;
  id v12;

  v12 = a3;
  switch(objc_msgSend(v12, "state"))
  {
    case 1:
      if (!self->_parentMessage
        && -[ETCanvasView _sketchInProgress](self, "_sketchInProgress")
        && self->_drawingTouchMovedDistance < 20.0)
      {
        -[ETGLSketchView messageData](self->_currentSketchView, "messageData");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[ETCanvasView _endMessage:withSend:](self, "_endMessage:withSend:", v5, 0);

      }
      if (-[ETCanvasView _canComposeExclusiveMessage](self, "_canComposeExclusiveMessage"))
      {
        if (self->_currentAnger)
          -[ETCanvasView _sendAnger](self, "_sendAnger");
        -[ETCanvasView _setIsComposingMessageOfType:](self, "_setIsComposingMessageOfType:", 10);
        -[ETCanvasView _normalizedGesturePoint:](self, "_normalizedGesturePoint:", v12);
        -[ETCanvasView _showAngerAtPoint:](self, "_showAngerAtPoint:");
        self->_lastActivityTimestamp = CFAbsoluteTimeGetCurrent();
      }
      break;
    case 2:
      WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      objc_msgSend(WeakRetained, "canvasView:didUpdateComposingMessageType:", self, self->_messageType);

      -[ETCanvasView _normalizedGesturePoint:](self, "_normalizedGesturePoint:", v12);
      v8 = v7;
      v10 = v9;
      Current = CFAbsoluteTimeGetCurrent();
      -[ETAngerMessage setNormalizedPoint:atRelativeTime:inScene:](self->_currentAnger, "setNormalizedPoint:atRelativeTime:inScene:", self->_scene, v8, v10, Current - self->_lastActivityTimestamp);
      self->_lastActivityTimestamp = Current;
      break;
    case 3:
      -[ETCanvasView _sendAnger](self, "_sendAnger");
      break;
    case 4:
    case 5:
      v4 = self->_currentAnger;
      -[ETCanvasView _hideAnger](self, "_hideAnger");
      -[ETCanvasView _endMessage:withSend:](self, "_endMessage:withSend:", v4, 0);

      break;
    default:
      break;
  }

}

- (void)_sendAnger
{
  double Current;
  double v4;
  ETAngerMessage *v5;

  if (self->_currentAnger)
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[ETMessage timeCreated](self->_currentAnger, "timeCreated");
    -[ETAngerMessage setDuration:](self->_currentAnger, "setDuration:", fmax(Current - v4, 1.0));
    v5 = self->_currentAnger;
    -[ETCanvasView _hideAnger](self, "_hideAnger");
    -[ETCanvasView _endMessage:withSend:](self, "_endMessage:withSend:", v5, 1);

  }
}

- (void)_showAngerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  ETAngerMessage *v6;
  ETAngerMessage *currentAnger;
  ETAngerMessage *v8;
  void *v9;
  NSTimer *v10;
  NSTimer *angerDurationLimitTimer;

  y = a3.y;
  x = a3.x;
  v6 = (ETAngerMessage *)objc_opt_new();
  currentAnger = self->_currentAnger;
  self->_currentAnger = v6;

  -[ETAngerMessage setNormalizedCenter:](self->_currentAnger, "setNormalizedCenter:", x, y);
  -[ETMessage setParentMessage:](self->_currentAnger, "setParentMessage:", self->_parentMessage);
  v8 = self->_currentAnger;
  -[ETCanvasView timeSource](self, "timeSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elapsedTimeSinceStartOfMessage:", self->_currentAnger);
  -[ETMessage setStartDelay:](v8, "setStartDelay:");

  -[ETAngerMessage displayInScene:](self->_currentAnger, "displayInScene:", self->_scene);
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__angerDurationLimitTimerFired, 0, 0, 10.0);
  v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  angerDurationLimitTimer = self->_angerDurationLimitTimer;
  self->_angerDurationLimitTimer = v10;

}

- (void)_hideAnger
{
  NSTimer *angerDurationLimitTimer;
  ETAngerMessage *currentAnger;

  -[NSTimer invalidate](self->_angerDurationLimitTimer, "invalidate");
  angerDurationLimitTimer = self->_angerDurationLimitTimer;
  self->_angerDurationLimitTimer = 0;

  -[ETAngerMessage stopPlaying](self->_currentAnger, "stopPlaying");
  currentAnger = self->_currentAnger;
  self->_currentAnger = 0;

}

- (void)_kissRecognized:(id)a3
{
  id v4;
  ETKissMessage *currentKissMessage;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  ETKissMessage *v11;
  ETKissMessage *v12;
  ETKissMessage *v13;
  void *v14;
  ETKissMessage *v15;
  void *v16;
  double v17;
  id v18;

  v4 = a3;
  currentKissMessage = self->_currentKissMessage;
  v18 = v4;
  if (currentKissMessage)
  {
    v6 = -[ETKissMessage reachedSizeLimit](currentKissMessage, "reachedSizeLimit");
    v4 = v18;
    if (v6)
    {
      -[ETCanvasView _sendKiss](self, "_sendKiss");
      v4 = v18;
    }
  }
  objc_msgSend(v4, "locationInView:", self);
  -[ETCanvasView _viewPointNormalizedInSceneSpace:](self, "_viewPointNormalizedInSceneSpace:");
  v8 = v7;
  v10 = v9;
  self->_lastActivityTimestamp = CFAbsoluteTimeGetCurrent();
  if (!self->_currentKissMessage)
  {
    v11 = objc_alloc_init(ETKissMessage);
    v12 = self->_currentKissMessage;
    self->_currentKissMessage = v11;

    v13 = self->_currentKissMessage;
    -[ETCanvasView timeSource](self, "timeSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETMessage setTimeSource:](v13, "setTimeSource:", v14);

    v15 = self->_currentKissMessage;
    -[ETCanvasView timeSource](self, "timeSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "elapsedTimeSinceStartOfMessage:", self->_currentTaps);
    -[ETMessage setStartDelay:](v15, "setStartDelay:");

    -[ETMessage setDelayWisp:](self->_currentKissMessage, "setDelayWisp:", self->_parentMessage != 0);
    -[ETKissMessage setParentMessage:](self->_currentKissMessage, "setParentMessage:", self->_parentMessage);
    -[ETCanvasView _setIsComposingMessageOfType:](self, "_setIsComposingMessageOfType:", 9);
  }
  -[ETCanvasView _angleOfRotationBetweenTwoFingers:](self, "_angleOfRotationBetweenTwoFingers:", v18);
  -[ETKissMessage addKissAtNormalizedPoint:angle:time:toScene:](self->_currentKissMessage, "addKissAtNormalizedPoint:angle:time:toScene:", self->_scene, v8, v10, v17, self->_lastActivityTimestamp);
  -[ETCanvasView _startSendMessageTimer](self, "_startSendMessageTimer");

}

- (void)_tapRecognized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  CFAbsoluteTime Current;
  double v17;
  double v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "touches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInNode:", self->_scene);
  v8 = v7;
  v10 = v9;

  self->_lastActivityTimestamp = CFAbsoluteTimeGetCurrent();
  if (-[ETCanvasView _tapsInProgress](self, "_tapsInProgress"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    objc_msgSend(WeakRetained, "canvasView:didUpdateComposingMessageType:", self, self->_messageType);

  }
  else
  {
    -[ETCanvasView _setIsComposingMessageOfType:](self, "_setIsComposingMessageOfType:", 0);
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ETUtility dateFormatWithMilliseconds:](ETUtility, "dateFormatWithMilliseconds:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v14;
      _os_log_impl(&dword_22C68B000, v12, OS_LOG_TYPE_INFO, "(%@) Got tap!", (uint8_t *)&v19, 0xCu);

    }
  }
  -[ETCanvasView drawingColor](self, "drawingColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  v17 = Current;
  *(float *)&Current = v8;
  *(float *)&v18 = v10;
  -[ETCanvasView handleTapAtX:Y:color:time:isRemote:](self, "handleTapAtX:Y:color:time:isRemote:", v15, 0, Current, v18, v17);

  self->_lastFastTapTimestamp = CFAbsoluteTimeGetCurrent();
  if (!self->_fastTapAllowableMovementTimer)
    -[ETCanvasView _startFastTapAllowableMovementTimer](self, "_startFastTapAllowableMovementTimer");
  -[ETCanvasView _startSendMessageTimer](self, "_startSendMessageTimer");

}

- (BOOL)_areRecognizersTrackingMultipleFingers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ETCanvasView gestureRecognizers](self, "gestureRecognizers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "numberOfTouches") > 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  UITouch *v12;
  UITouch *drawingTouch;
  NSObject *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  int v21;
  void *v22;
  uint64_t v23;
  CGPoint v24;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableSet unionSet:](self->_touchesDown, "unionSet:", v6);
  v8 = !self->_isComposing && (unint64_t)-[NSMutableSet count](self->_touchesDown, "count") > 1;
  self->_ignoreTouchesUntilAllTouchesEnded = v8;
  if (self->_drawingTouch
    || -[ETCanvasView _areRecognizersTrackingMultipleFingers](self, "_areRecognizersTrackingMultipleFingers")
    || self->_ignoreTouchesUntilAllTouchesEnded)
  {
    -[UILongPressGestureRecognizer touches](self->_heartbeatRecognizer, "touches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      objc_msgSend(WeakRetained, "canvasView:didUpdateComposingMessageType:", self, 2);

    }
  }
  else
  {
    objc_msgSend(v6, "anyObject");
    v12 = (UITouch *)objc_claimAutoreleasedReturnValue();
    drawingTouch = self->_drawingTouch;
    self->_drawingTouch = v12;

    self->_drawingTouchStartedStroke = 0;
    self->_drawingTouchMovedDistance = 0.0;
    -[ETCanvasView _clearSendMessageTimer](self, "_clearSendMessageTimer");
    if ((IMOSLoggingEnabled() & 1) != 0)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[ETUtility dateFormatWithMilliseconds:](ETUtility, "dateFormatWithMilliseconds:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v16;
        _os_log_impl(&dword_22C68B000, v14, OS_LOG_TYPE_INFO, "(%@) UITouchPhaseBegan", (uint8_t *)&v21, 0xCu);

      }
    }
    self->_touchesBeganTimestamp = CFAbsoluteTimeGetCurrent();
    -[UITouch locationInNode:](self->_drawingTouch, "locationInNode:", self->_scene);
    self->_lastPt.x = v17;
    self->_lastPt.y = v18;
    -[UITouch locationInView:](self->_drawingTouch, "locationInView:", self);
    v24.x = v19;
    v24.y = v20;
    self->_didIgnoreTouchesBegan = CGRectContainsPoint(self->_ignoredTouchesRect, v24);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint *p_lastPt;
  float v11;
  float v12;
  float v13;
  void *v14;
  CFAbsoluteTime Current;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  UITouch *v20;
  UITouch *drawingTouch;
  float x;
  float y;
  void *v24;
  double v25;
  double v26;
  id v27;
  CGPoint v28;

  if (objc_msgSend(a3, "containsObject:", self->_drawingTouch, a4)
    && !self->_ignoreTouchesUntilAllTouchesEnded)
  {
    if (-[ETCanvasView _sketchInProgress](self, "_sketchInProgress"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      objc_msgSend(WeakRetained, "canvasView:didUpdateComposingMessageType:", self, self->_messageType);

    }
    -[UITouch locationInNode:](self->_drawingTouch, "locationInNode:", self->_scene);
    v7 = v6;
    v9 = v8;
    p_lastPt = &self->_lastPt;
    *(float *)&v6 = self->_lastPt.x - v6;
    *(float *)&v8 = self->_lastPt.y - v8;
    v11 = hypotf(*(float *)&v6, *(float *)&v8);
    self->_drawingTouchMovedDistance = self->_drawingTouchMovedDistance + v11;
    if (self->_drawingTouchStartedStroke)
      goto LABEL_6;
    if (v11 >= 3.0)
    {
      -[UITouch locationInView:](self->_drawingTouch, "locationInView:", self);
      v28.x = v18;
      v28.y = v19;
      if (!CGRectContainsPoint(self->_ignoredTouchesRect, v28))
      {
        if (self->_didIgnoreTouchesBegan)
        {
          p_lastPt->x = v7;
          self->_lastPt.y = v9;
          self->_touchesBeganTimestamp = CFAbsoluteTimeGetCurrent();
        }
        if (!self->_drawingTouchStartedStroke)
        {
          if (-[ETCanvasView _tapsInProgress](self, "_tapsInProgress"))
          {
            v20 = self->_drawingTouch;
            -[ETCanvasView _sendTaps](self, "_sendTaps");
            drawingTouch = self->_drawingTouch;
            self->_drawingTouch = v20;

          }
          if (!self->_parentMessage && self->_currentKissMessage)
            -[ETCanvasView _sendKiss](self, "_sendKiss");
          self->_lastActivityTimestamp = self->_touchesBeganTimestamp;
          if (!-[ETCanvasView _sketchInProgress](self, "_sketchInProgress")
            && (self->_parentMessage || !self->_isComposing))
          {
            -[ETCanvasView _startDoodleMessageCompositionAtTime:](self, "_startDoodleMessageCompositionAtTime:", self->_touchesBeganTimestamp);
          }
          x = p_lastPt->x;
          y = self->_lastPt.y;
          -[ETCanvasView drawingColor](self, "drawingColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v25 = x;
          *(float *)&v26 = y;
          -[ETCanvasView handlePanAtX:Y:color:time:state:isRemote:](self, "handlePanAtX:Y:color:time:state:isRemote:", v24, 1, 0, v25, v26, self->_touchesBeganTimestamp);

          self->_drawingTouchStartedStroke = 1;
          v27 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
          objc_msgSend(v27, "canvasViewDidBeginStroke:", self);

        }
LABEL_6:
        -[ETCanvasView drawingColor](self, "drawingColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        Current = CFAbsoluteTimeGetCurrent();
        v16 = Current;
        v12 = v7;
        *(float *)&Current = v12;
        v13 = v9;
        *(float *)&v17 = v13;
        -[ETCanvasView handlePanAtX:Y:color:time:state:isRemote:](self, "handlePanAtX:Y:color:time:state:isRemote:", v14, 2, 0, Current, v17, v16);

        p_lastPt->x = v7;
        self->_lastPt.y = v9;
      }
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[ETCanvasView _doodleEndedWithTouches:cancelled:](self, "_doodleEndedWithTouches:cancelled:", a3, 0);
}

- (void)_doodleEndedWithTouches:(id)a3 cancelled:(BOOL)a4
{
  id v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v10;
  BOOL v11;
  BOOL v12;
  UITouch *drawingTouch;
  NSObject *v14;
  void *v15;
  void *v16;
  double Current;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id WeakRetained;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableSet minusSet:](self->_touchesDown, "minusSet:", v6);
  if (!objc_msgSend(v6, "containsObject:", self->_drawingTouch) || self->_sketchDidReachSizeLimit)
  {
    if (-[NSMutableSet count](self->_touchesDown, "count"))
      v7 = !self->_ignoreTouchesUntilAllTouchesEnded;
    else
      v7 = 1;
    v8 = !v7;
    self->_ignoreTouchesUntilAllTouchesEnded = v8;
    goto LABEL_10;
  }
  v9 = !self->_drawingTouchStartedStroke
    && -[ETCanvasView _isTapTooRecentAfterKissGesture](self, "_isTapTooRecentAfterKissGesture");
  if (-[ETCanvasView isComposingHeartbeat](self, "isComposingHeartbeat")
    || !-[ETCanvasView _sketchInProgress](self, "_sketchInProgress")
    || (self->_ignoreTouchesUntilAllTouchesEnded ? (v10 = 1) : (v10 = v9), (v10 & 1) != 0))
  {
    if (self->_drawingTouch)
      -[ETCanvasView _startSendMessageTimer](self, "_startSendMessageTimer");
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ETUtility dateFormatWithMilliseconds:](ETUtility, "dateFormatWithMilliseconds:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v16;
      _os_log_impl(&dword_22C68B000, v14, OS_LOG_TYPE_INFO, "(%@) UITouchPhaseEnded", (uint8_t *)&v28, 0xCu);

    }
  }
  Current = CFAbsoluteTimeGetCurrent();
  -[UITouch locationInNode:](self->_drawingTouch, "locationInNode:", self->_scene);
  v19 = v18;
  v21 = v20;
  if (self->_drawingTouchStartedStroke)
  {
    -[ETCanvasView drawingColor](self, "drawingColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v23 = v19;
    *(float *)&v24 = v21;
    -[ETCanvasView handlePanAtX:Y:color:time:state:isRemote:](self, "handlePanAtX:Y:color:time:state:isRemote:", v22, 3, 0, v23, v24, Current);
LABEL_37:

    goto LABEL_38;
  }
  if (!a4)
  {
    -[ETCanvasView drawingColor](self, "drawingColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v25 = v19;
    *(float *)&v26 = v21;
    -[ETCanvasView handleDotAtX:Y:color:time:isRemote:](self, "handleDotAtX:Y:color:time:isRemote:", v22, 0, v25, v26, Current);
    goto LABEL_37;
  }
LABEL_38:
  -[ETCanvasView _startSendMessageTimer](self, "_startSendMessageTimer");
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  objc_msgSend(WeakRetained, "canvasViewDidEndStroke:", self);

LABEL_22:
  if (-[NSMutableSet count](self->_touchesDown, "count"))
    v11 = !self->_ignoreTouchesUntilAllTouchesEnded;
  else
    v11 = 1;
  v12 = !v11;
  self->_ignoreTouchesUntilAllTouchesEnded = v12;
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

LABEL_10:
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (!self->_isComposing)
  {
    -[ETCanvasView clearCanvasAnimated:](self, "clearCanvasAnimated:", 0);
    v5 = v6;
  }
  -[ETCanvasView _doodleEndedWithTouches:cancelled:](self, "_doodleEndedWithTouches:cancelled:", v5, 1);

}

- (void)_createSketchViewWithColor:(id)a3 time:(double)a4 message:(id)a5
{
  id v7;
  id v8;
  ETGLSketchView *v9;
  ETGLSketchView *v10;
  ETGLSketchView *currentSketchView;
  id WeakRetained;
  char v13;
  ETGLSketchView *v14;
  id v15;
  NSMutableDictionary *messageIdentifierToDoodleView;
  ETGLSketchView *v17;
  void *v18;
  ETGLSketchView *v19;
  NSObject *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = [ETGLSketchView alloc];
  -[ETCanvasView bounds](self, "bounds");
  v10 = -[ETGLSketchView initWithFrame:](v9, "initWithFrame:");
  currentSketchView = self->_currentSketchView;
  self->_currentSketchView = v10;

  if (self->_currentSketchView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = self->_currentSketchView;
      v15 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      -[ETGLSketchView setUseFastVerticalWisp:](v14, "setUseFastVerticalWisp:", objc_msgSend(v15, "canvasViewShouldUseFastVerticalWisp:", self));

    }
    -[ETGLSketchView setWispDelay:](self->_currentSketchView, "setWispDelay:", self->_wispDelay);
    -[ETGLSketchView setMessageData:](self->_currentSketchView, "setMessageData:", v8);
    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "setColor:", v7);
    messageIdentifierToDoodleView = self->_messageIdentifierToDoodleView;
    v17 = self->_currentSketchView;
    objc_msgSend(v8, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](messageIdentifierToDoodleView, "setObject:forKey:", v17, v18);

    v19 = self->_currentSketchView;
    if (self->_usesMediaAppearance)
      -[ETCanvasView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v19, self->_sceneView);
    else
      -[ETCanvasView addSubview:](self, "addSubview:", v19);
    -[ETGLSketchView layoutIfNeeded](self->_currentSketchView, "layoutIfNeeded");
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_22C68B000, v20, OS_LOG_TYPE_INFO, "ERROR: Failed to allocate ETGLSketchView for message: %@", (uint8_t *)&v21, 0xCu);
    }

  }
}

- (void)handleTapAtX:(float)a3 Y:(float)a4 color:(id)a5 time:(double)a6 isRemote:(BOOL)a7
{
  id v12;
  ETTapMessage *currentTaps;
  ETTapMessage *v14;
  ETTapMessage *v15;
  ETTapMessage *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v12 = a5;
  if (!a7)
  {
    v21 = v12;
    currentTaps = self->_currentTaps;
    if (!currentTaps)
      goto LABEL_6;
    if (-[ETTapMessage reachedSizeLimit](currentTaps, "reachedSizeLimit"))
      -[ETCanvasView sendCurrentMessage](self, "sendCurrentMessage");
    if (!self->_currentTaps)
    {
LABEL_6:
      v14 = objc_alloc_init(ETTapMessage);
      v15 = self->_currentTaps;
      self->_currentTaps = v14;

      -[ETMessage setDelegate:](self->_currentTaps, "setDelegate:", self);
      -[ETMessage setColor:](self->_currentTaps, "setColor:", v21);
      -[ETMessage setParentMessage:](self->_currentTaps, "setParentMessage:", self->_parentMessage);
      -[ETTapMessage preVisualizeInScene:](self->_currentTaps, "preVisualizeInScene:", self->_scene);
      v16 = self->_currentTaps;
      -[ETCanvasView timeSource](self, "timeSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "elapsedTimeSinceStartOfMessage:", self->_currentTaps);
      -[ETMessage setStartDelay:](v16, "setStartDelay:");

    }
    self->_lastActivityTimestamp = a6;
    -[SKScene size](self->_scene, "size");
    v19 = a3 / v18 + a3 / v18;
    -[SKScene size](self->_scene, "size");
    -[ETTapMessage addTapAtPoint:time:color:](self->_currentTaps, "addTapAtPoint:time:color:", v21, v19, a4 / v20 + a4 / v20, a6);
    v12 = v21;
  }

}

- (void)handlePanAtX:(float)a3 Y:(float)a4 color:(id)a5 time:(double)a6 state:(int64_t)a7 isRemote:(BOOL)a8
{
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
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  double v28;
  float v29;
  float v30;
  ETGLSketchView **p_currentSketchView;
  ETGLSketchView *currentSketchView;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;

  v37 = a5;
  if (a7 == 1)
    -[ETGLSketchView beginStrokeWithColor:](self->_currentSketchView, "beginStrokeWithColor:", v37);
  self->_lastActivityTimestamp = a6;
  -[SKScene size](self->_scene, "size");
  v15 = v14;
  v17 = v16;
  UIRoundToViewScale();
  v19 = v18 * fmax(v15 / 156.0, 1.0);
  v20 = v15 * 0.5 - v19;
  v21 = -v20;
  if (v20 >= a3)
    v20 = a3;
  if (v20 <= v21)
    v22 = v21;
  else
    v22 = v20;
  v23 = v17 * 0.5 - v19;
  v24 = -v23;
  if (v23 >= a4)
    v23 = a4;
  if (v23 <= v24)
    v25 = v24;
  else
    v25 = v23;
  v26 = a7 - 5;
  if ((unint64_t)(a7 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
    -[UITouch locationInNode:](self->_drawingTouch, "locationInNode:", self->_scene);
    *(float *)&v27 = self->_lastPt.x - v27;
    *(float *)&v28 = self->_lastPt.y - v28;
    if (hypotf(*(float *)&v27, *(float *)&v28) < 3.0)
    {
      p_currentSketchView = &self->_currentSketchView;
LABEL_19:
      -[ETGLSketchView didCompleteStroke](*p_currentSketchView, "didCompleteStroke");
      goto LABEL_20;
    }
  }
  v29 = v22;
  v30 = v25;
  p_currentSketchView = &self->_currentSketchView;
  currentSketchView = self->_currentSketchView;
  v33 = v29;
  -[SKScene size](self->_scene, "size");
  v35 = v33 / v34 + v33 / v34;
  -[SKScene size](self->_scene, "size");
  -[ETGLSketchView handleSketchAtPosition:](currentSketchView, "handleSketchAtPosition:", v35, v30 / v36 + v30 / v36);
  if (v26 >= 0xFFFFFFFFFFFFFFFELL && !a8)
    goto LABEL_19;
LABEL_20:

}

- (void)handleDotAtX:(float)a3 Y:(float)a4 color:(id)a5 time:(double)a6 isRemote:(BOOL)a7
{
  ETGLSketchView *currentSketchView;
  double v11;
  double v12;
  double v13;

  if (!a7)
  {
    self->_lastActivityTimestamp = a6;
    -[ETGLSketchView beginStrokeWithColor:](self->_currentSketchView, "beginStrokeWithColor:", a5);
    currentSketchView = self->_currentSketchView;
    -[SKScene size](self->_scene, "size");
    v12 = a3 / v11 + a3 / v11;
    -[SKScene size](self->_scene, "size");
    -[ETGLSketchView handleTapAtPosition:](currentSketchView, "handleTapAtPosition:", v12, a4 / v13 + a4 / v13);
  }
}

- (void)_startSendMessageTimer
{
  void *v3;
  int v4;
  NSTimer *v5;
  NSTimer *sendMessageTimer;

  -[ETCanvasView canvasDelegate](self, "canvasDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canvasViewShouldSendWithTimer:", self);

  if (v4)
  {
    -[NSTimer invalidate](self->_sendMessageTimer, "invalidate");
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__sendMessageTimerFired, 0, 0, 2.0);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    sendMessageTimer = self->_sendMessageTimer;
    self->_sendMessageTimer = v5;

  }
}

- (void)_clearSendMessageTimer
{
  NSTimer *sendMessageTimer;

  -[NSTimer invalidate](self->_sendMessageTimer, "invalidate");
  sendMessageTimer = self->_sendMessageTimer;
  self->_sendMessageTimer = 0;

}

- (BOOL)_sendMessageTimerFired
{
  NSTimer *sendMessageTimer;
  double v4;

  sendMessageTimer = self->_sendMessageTimer;
  self->_sendMessageTimer = 0;

  v4 = CFAbsoluteTimeGetCurrent() - self->_lastActivityTimestamp;
  if (v4 > 2.0)
    -[ETCanvasView sendCurrentMessage](self, "sendCurrentMessage");
  return v4 > 2.0;
}

- (id)composedSketchMessage
{
  return -[ETGLSketchView messageData](self->_currentSketchView, "messageData");
}

- (void)_sendSketch
{
  void *v3;
  void *v4;
  ETGLSketchView *currentSketchView;

  -[ETGLSketchView messageData](self->_currentSketchView, "messageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETCanvasView _endMessage:withSend:](self, "_endMessage:withSend:", v3, 1);

  if (-[ETGLSketchView isPaused](self->_currentSketchView, "isPaused"))
  {
    -[ETGLSketchView messageData](self->_currentSketchView, "messageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETCanvasView _clearDoodleViewForMessage:](self, "_clearDoodleViewForMessage:", v4);

  }
  else if (!self->_usesMediaAppearance)
  {
    -[ETCanvasView _animateOutSketchView:withCompletion:](self, "_animateOutSketchView:withCompletion:", self->_currentSketchView, 0);
  }
  currentSketchView = self->_currentSketchView;
  self->_currentSketchView = 0;

  self->_sketchDidReachSizeLimit = 0;
}

- (void)_sendTaps
{
  ETTapMessage *currentTaps;
  ETTapMessage *v4;

  currentTaps = self->_currentTaps;
  if (currentTaps)
  {
    -[ETCanvasView _endMessage:withSend:](self, "_endMessage:withSend:", currentTaps, 1);
    v4 = self->_currentTaps;
    self->_currentTaps = 0;

  }
}

- (void)sendCurrentMessage
{
  UITouch *drawingTouch;

  -[ETCanvasView _clearSendMessageTimer](self, "_clearSendMessageTimer");
  if (self->_currentHeartbeat)
    -[ETCanvasView _sendHeartbeat](self, "_sendHeartbeat");
  if (self->_currentTaps)
    -[ETCanvasView _sendTaps](self, "_sendTaps");
  if (self->_currentSketchView)
    -[ETCanvasView _sendSketch](self, "_sendSketch");
  if (self->_currentKissMessage)
    -[ETCanvasView _sendKiss](self, "_sendKiss");
  if (self->_currentAnger)
    -[ETCanvasView _sendAnger](self, "_sendAnger");
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_lastActivityTimestamp = 0.0;
}

- (void)setCanComposeTap:(BOOL)a3
{
  self->_canComposeTap = a3;
  -[UITapGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:");
}

- (void)setCanComposeKiss:(BOOL)a3
{
  self->_canComposeKiss = a3;
  -[UITapGestureRecognizer setEnabled:](self->_kissRecognizer, "setEnabled:");
}

- (void)setCanComposeAnger:(BOOL)a3
{
  self->_canComposeAnger = a3;
  -[UILongPressGestureRecognizer setEnabled:](self->_angerRecognizer, "setEnabled:");
}

- (void)setCanComposeHeartbeat:(BOOL)a3
{
  if (self->_canComposeHeartbeat != a3)
  {
    self->_canComposeHeartbeat = a3;
    -[UILongPressGestureRecognizer setEnabled:](self->_heartbeatRecognizer, "setEnabled:");
  }
}

- (double)_angleOfRotationBetweenTwoFingers:(id)a3
{
  id v4;
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
  long double v15;
  double result;
  double v17;

  v4 = a3;
  objc_msgSend(v4, "locationOfTouch:inView:", 0, self);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "locationOfTouch:inView:", 1, self);
  v10 = v9;
  v12 = v11;

  if (v6 <= v10)
  {
    v13 = v6;
    v14 = v8;
    v6 = v10;
    v8 = v12;
  }
  else
  {
    v13 = v10;
    v14 = v12;
  }
  v15 = atan2(-(v14 - v8), v13 - v6);
  result = fmod(v15, 6.28318531);
  v17 = 3.14159265;
  if (result <= 3.14159265)
  {
    if (result >= 3.14159265)
      return result;
  }
  else
  {
    v17 = -3.14159265;
  }
  return result + v17;
}

- (CGPoint)_viewPointNormalizedInSceneSpace:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[SKScene size](self->_scene, "size");
  v7 = v6;
  v9 = v8;
  -[SKScene convertPointFromView:](self->_scene, "convertPointFromView:", x, y);
  v11 = v10 / v7;
  v13 = v12 / v9;
  result.y = v13;
  result.x = v11;
  return result;
}

- (void)_heartbeatRecognized:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  id WeakRetained;
  double v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "state") == 1)
  {
    if (!self->_parentMessage)
    {
      if (-[ETCanvasView _sketchInProgress](self, "_sketchInProgress") && self->_drawingTouchMovedDistance < 20.0)
      {
        -[ETGLSketchView messageData](self->_currentSketchView, "messageData");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[ETCanvasView _endMessage:withSend:](self, "_endMessage:withSend:", v4, 0);

      }
      if (!self->_parentMessage && self->_currentKissMessage)
        -[ETCanvasView _sendKiss](self, "_sendKiss");
    }
    if (-[ETCanvasView _canComposeExclusiveMessage](self, "_canComposeExclusiveMessage"))
    {
      if (self->_currentHeartbeat)
        -[ETCanvasView _sendHeartbeat](self, "_sendHeartbeat");
      -[ETCanvasView _setIsComposingMessageOfType:](self, "_setIsComposingMessageOfType:", 2);
      -[ETCanvasView _normalizedGesturePoint:](self, "_normalizedGesturePoint:", v14);
      v6 = v5;
      v8 = v7;
      -[ETCanvasView _angleOfRotationBetweenTwoFingers:](self, "_angleOfRotationBetweenTwoFingers:", v14);
      -[ETCanvasView _showHeartbeatAtNormalizedPoint:rotation:](self, "_showHeartbeatAtNormalizedPoint:rotation:", v6, v8, v9);
      objc_msgSend(v14, "locationInView:", self);
      self->_heartbeatStartCenter.x = v10;
      self->_heartbeatStartCenter.y = v11;
    }
  }
  else if (objc_msgSend(v14, "state") == 2)
  {
    if (-[ETCanvasView isComposingHeartbeat](self, "isComposingHeartbeat"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      objc_msgSend(WeakRetained, "canvasView:didUpdateComposingMessageType:", self, self->_messageType);

      if (!-[ETHeartbeatMessage isBroken](self->_currentHeartbeat, "isBroken"))
      {
        objc_msgSend(v14, "locationInView:", self);
        if (v13 - self->_heartbeatStartCenter.y > 20.0)
          -[ETHeartbeatMessage breakHeart](self->_currentHeartbeat, "breakHeart");
      }
    }
  }
  else if ((objc_msgSend(v14, "state") == 3 || objc_msgSend(v14, "state") == 4)
         && -[ETCanvasView isComposingHeartbeat](self, "isComposingHeartbeat"))
  {
    -[ETCanvasView _sendHeartbeat](self, "_sendHeartbeat");
  }

}

- (void)_sendKiss
{
  ETKissMessage *currentKissMessage;
  ETKissMessage *v4;

  currentKissMessage = self->_currentKissMessage;
  if (currentKissMessage)
  {
    -[ETKissMessage stopPlaying](currentKissMessage, "stopPlaying");
    -[ETCanvasView _endMessage:withSend:](self, "_endMessage:withSend:", self->_currentKissMessage, 1);
    v4 = self->_currentKissMessage;
    self->_currentKissMessage = 0;

  }
}

- (void)_sendHeartbeat
{
  double Current;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  ETHeartbeatMessage *currentHeartbeat;
  ETHeartbeatMessage *v9;
  int v10;
  ETHeartbeatMessage *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[ETCanvasView isComposingHeartbeat](self, "isComposingHeartbeat"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[ETMessage timeCreated](self->_currentHeartbeat, "timeCreated");
    v5 = Current - v4;
    if (v5 > (double)10)
      v5 = (double)10;
    if (v5 <= (double)1)
      v6 = (double)1;
    else
      v6 = v5;
    -[ETHeartbeatMessage setDuration:](self->_currentHeartbeat, "setDuration:", (int)v6);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        currentHeartbeat = self->_currentHeartbeat;
        v10 = 138412546;
        v11 = currentHeartbeat;
        v12 = 1024;
        v13 = v6 > 0.7;
        _os_log_impl(&dword_22C68B000, v7, OS_LOG_TYPE_INFO, "Ending %@, will send: %d", (uint8_t *)&v10, 0x12u);
      }

    }
    v9 = self->_currentHeartbeat;
    -[ETCanvasView _hideHeartbeat](self, "_hideHeartbeat");
    -[ETCanvasView _endMessage:withSend:](self, "_endMessage:withSend:", v9, v6 > 0.7);

  }
}

- (void)updateCurrentMessageWithHeartRate:(unint64_t)a3
{
  double v3;

  *(float *)&v3 = (float)a3;
  -[ETHeartbeatMessage setBeatsPerMinute:](self->_currentHeartbeat, "setBeatsPerMinute:", v3);
}

- (void)_showHeartbeatAtNormalizedPoint:(CGPoint)a3 rotation:(double)a4
{
  double y;
  double x;
  ETHeartbeatMessage *v7;
  ETHeartbeatMessage *currentHeartbeat;
  void *v9;
  ETHeartbeatMessage *v10;
  void *v11;
  NSTimer *v12;
  NSTimer *heartbeatDurationTimer;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, unint64_t);
  void *v17;
  id v18;
  id location;

  y = a3.y;
  x = a3.x;
  v7 = (ETHeartbeatMessage *)objc_opt_new();
  currentHeartbeat = self->_currentHeartbeat;
  self->_currentHeartbeat = v7;

  -[ETHeartbeatMessage setNormalizedCenter:](self->_currentHeartbeat, "setNormalizedCenter:", x, y);
  objc_initWeak(&location, self->_currentHeartbeat);
  +[HeartRateStore sharedStore](HeartRateStore, "sharedStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __57__ETCanvasView__showHeartbeatAtNormalizedPoint_rotation___block_invoke;
  v17 = &unk_24F6E6E90;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v9, "recentHeartRateWithCompletion:", &v14);

  -[ETMessage setParentMessage:](self->_currentHeartbeat, "setParentMessage:", self->_parentMessage, v14, v15, v16, v17);
  -[ETHeartbeatMessage startHeartbeat:](self->_currentHeartbeat, "startHeartbeat:", self->_scene);
  v10 = self->_currentHeartbeat;
  -[ETCanvasView timeSource](self, "timeSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "elapsedTimeSinceStartOfMessage:", self->_currentHeartbeat);
  -[ETMessage setStartDelay:](v10, "setStartDelay:");

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__hideHeartbeatTimerFired, 0, 0, (double)10);
  v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  heartbeatDurationTimer = self->_heartbeatDurationTimer;
  self->_heartbeatDurationTimer = v12;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __57__ETCanvasView__showHeartbeatAtNormalizedPoint_rotation___block_invoke(uint64_t a1, unint64_t a2)
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v3 = (float)a2;
  objc_msgSend(WeakRetained, "setBeatsPerMinute:", v3);

}

- (void)_hideHeartbeat
{
  NSTimer *heartbeatDurationTimer;
  ETHeartbeatMessage *currentHeartbeat;

  -[NSTimer invalidate](self->_heartbeatDurationTimer, "invalidate");
  heartbeatDurationTimer = self->_heartbeatDurationTimer;
  self->_heartbeatDurationTimer = 0;

  -[ETHeartbeatMessage stopPlaying](self->_currentHeartbeat, "stopPlaying");
  currentHeartbeat = self->_currentHeartbeat;
  self->_currentHeartbeat = 0;

}

- (void)_hideHeartbeatTimerFired
{
  if (-[ETCanvasView isComposingHeartbeat](self, "isComposingHeartbeat"))
    -[ETCanvasView _sendHeartbeat](self, "_sendHeartbeat");
}

- (void)playTestStrokeWithColor:(id)a3 duration:(double)a4
{
  id v6;
  dispatch_time_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  id v12;
  dispatch_time_t v13;
  id v14;
  dispatch_time_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD block[5];
  id v24;
  double v25;

  v6 = a3;
  v7 = dispatch_time(0, (uint64_t)(a4 * 0.3 * 1000000000.0));
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke;
  block[3] = &unk_24F6E6EB8;
  block[4] = self;
  v9 = v6;
  v24 = v9;
  v25 = a4;
  v10 = MEMORY[0x24BDAC9B8];
  dispatch_after(v7, MEMORY[0x24BDAC9B8], block);
  v11 = dispatch_time(0, (uint64_t)(a4 * 0.6 * 1000000000.0));
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_2;
  v21[3] = &unk_24F6E6B78;
  v21[4] = self;
  v12 = v9;
  v22 = v12;
  dispatch_after(v11, v10, v21);

  v13 = dispatch_time(0, (uint64_t)(a4 * 0.88 * 1000000000.0));
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_3;
  v19[3] = &unk_24F6E6B78;
  v19[4] = self;
  v14 = v12;
  v20 = v14;
  dispatch_after(v13, v10, v19);

  v15 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_4;
  v17[3] = &unk_24F6E6B78;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  dispatch_after(v15, v10, v17);

}

uint64_t __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke(uint64_t a1)
{
  double Current;
  double v3;
  double v4;
  double v5;
  double v6;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(double *)(a1 + 48);
  v4 = Current + v3 * -0.300000012;
  LODWORD(v3) = -1035468800;
  objc_msgSend(*(id *)(a1 + 32), "handlePanAtX:Y:color:time:state:isRemote:", *(_QWORD *)(a1 + 40), 1, 0, v3, -0.300000014, v4);
  LODWORD(v5) = 0;
  LODWORD(v6) = -30.0;
  return objc_msgSend(*(id *)(a1 + 32), "handlePanAtX:Y:color:time:state:isRemote:", *(_QWORD *)(a1 + 40), 2, 0, v5, v6, Current);
}

uint64_t __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  CFAbsoluteTime Current;
  double v4;
  double v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  Current = CFAbsoluteTimeGetCurrent();
  v4 = Current;
  LODWORD(Current) = 1112014848;
  LODWORD(v5) = 1109393408;
  return objc_msgSend(v1, "handlePanAtX:Y:color:time:state:isRemote:", v2, 3, 0, Current, v5, v4);
}

uint64_t __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  CFAbsoluteTime Current;
  double v4;
  double v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  Current = CFAbsoluteTimeGetCurrent();
  v4 = Current;
  LODWORD(v5) = 1110704128;
  LODWORD(Current) = -25.0;
  return objc_msgSend(v1, "handleDotAtX:Y:color:time:isRemote:", v2, 0, Current, v5, v4);
}

uint64_t __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  CFAbsoluteTime Current;
  double v4;
  double v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  Current = CFAbsoluteTimeGetCurrent();
  v4 = Current;
  LODWORD(v5) = 1110704128;
  LODWORD(Current) = 25.0;
  return objc_msgSend(v1, "handleDotAtX:Y:color:time:isRemote:", v2, 0, Current, v5, v4);
}

- (void)playMessage:(id)a3
{
  id v4;
  NSObject *v5;
  SKScene *scene;
  void *v7;
  id WeakRetained;
  int v9;
  id v10;
  __int16 v11;
  SKScene *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      scene = self->_scene;
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = scene;
      _os_log_impl(&dword_22C68B000, v5, OS_LOG_TYPE_INFO, "Displaying message %@ in scene %@", (uint8_t *)&v9, 0x16u);
    }

  }
  if (objc_msgSend(v4, "messageType") == 1)
  {
    objc_msgSend(v4, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETCanvasView _createSketchViewWithColor:time:message:](self, "_createSketchViewWithColor:time:message:", v7, v4, 0.0);

    -[ETGLSketchView setPlaying:](self->_currentSketchView, "setPlaying:", 1);
  }
  else if (objc_msgSend(v4, "messageType") != 8)
  {
    objc_msgSend(v4, "displayInScene:", self->_scene);
  }
  objc_msgSend(v4, "setDelegate:", self);
  -[ETCanvasView setPaused:](self, "setPaused:", self->_setAlwaysPaused);
  -[ETCanvasView _startCheckForIdleTimer](self, "_startCheckForIdleTimer");
  -[NSMutableSet addObject:](self->_playingMessages, "addObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  objc_msgSend(WeakRetained, "canvasView:didBeginPlayingMessage:", self, v4);

}

- (void)messageWillReachSizeLimit:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  objc_msgSend(WeakRetained, "canvasViewWillReachComposingSizeLimit:", self);

  self->_sketchDidReachSizeLimit = 1;
}

- (void)messageWillStopPlaying:(id)a3
{
  ETCanvasViewDelegate **p_canvasDelegate;
  id v5;
  id WeakRetained;

  p_canvasDelegate = &self->_canvasDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_canvasDelegate);
  objc_msgSend(WeakRetained, "canvasView:willEndPlayingMessage:", self, v5);

}

- (void)messageDidStopPlaying:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  -[ETCanvasView _clearDoodleViewForMessage:](self, "_clearDoodleViewForMessage:", v4);
  -[NSMutableSet removeObject:](self->_playingMessages, "removeObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  objc_msgSend(WeakRetained, "canvasView:didEndPlayingMessage:", self, v4);

}

- (void)setUsesMediaAppearance:(BOOL)a3
{
  DTSSceneView *sceneView;
  void *v5;
  SKScene *scene;
  void *v7;
  _BOOL4 usesMediaAppearance;
  id WeakRetained;
  char v10;
  int v11;
  id v12;

  if (self->_usesMediaAppearance != a3)
  {
    self->_usesMediaAppearance = a3;
    -[ETCanvasView setPaused:](self, "setPaused:", 0);
    sceneView = self->_sceneView;
    if (self->_usesMediaAppearance)
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTSSceneView setBackgroundColor:](sceneView, "setBackgroundColor:", v5);

    scene = self->_scene;
    if (self->_usesMediaAppearance)
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScene setBackgroundColor:](scene, "setBackgroundColor:", v7);

    -[DTSSceneView setAllowsTransparency:](self->_sceneView, "setAllowsTransparency:", self->_usesMediaAppearance);
    -[DTSSceneView setNeedsLayout](self->_sceneView, "setNeedsLayout");
    -[SKScene _setNeedsUpdate](self->_scene, "_setNeedsUpdate");
    -[ETCanvasView _startCheckForIdleTimer](self, "_startCheckForIdleTimer");
    usesMediaAppearance = self->_usesMediaAppearance;
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    if (usesMediaAppearance)
    {
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
        return;
      v12 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      objc_msgSend(v12, "canvasViewDidStartMediaAppearance:", self);
    }
    else
    {
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
        return;
      v12 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      objc_msgSend(v12, "canvasViewDidEndMediaAppearance:", self);
    }

  }
}

- (void)willMoveToWindow:(id)a3
{
  UITouch *drawingTouch;

  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_drawingTouchStartedStroke = 0;
  -[NSMutableSet removeAllObjects](self->_touchesDown, "removeAllObjects");
  self->_sketchDidReachSizeLimit = 0;
}

- (void)setForceTouchEnabled:(BOOL)a3
{
  if (self->_angerUsesForceTouch != a3)
  {
    self->_angerUsesForceTouch = a3;
    -[ETCanvasView _configureAngerRecognizer](self, "_configureAngerRecognizer");
  }
}

- (void)_configureAngerRecognizer
{
  Class *v3;
  UILongPressGestureRecognizer *v4;
  UILongPressGestureRecognizer *angerRecognizer;
  id WeakRetained;
  char v7;
  id v8;

  if (self->_angerRecognizer)
    -[ETCanvasView removeGestureRecognizer:](self, "removeGestureRecognizer:");
  if (self->_angerUsesForceTouch)
    v3 = (Class *)off_24F6E6110;
  else
    v3 = (Class *)0x24BDF6BA0;
  v4 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(*v3), "initWithTarget:action:", self, sel__angerRecognized_);
  angerRecognizer = self->_angerRecognizer;
  self->_angerRecognizer = v4;

  -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](self->_angerRecognizer, "setNumberOfTouchesRequired:", 1);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_angerRecognizer, "setMinimumPressDuration:", 0.2);
  -[UILongPressGestureRecognizer setDelegate:](self->_angerRecognizer, "setDelegate:", self);
  -[ETCanvasView addGestureRecognizer:](self, "addGestureRecognizer:", self->_angerRecognizer);
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    objc_msgSend(v8, "canvasView:angerUsesForceTouch:", self, self->_angerUsesForceTouch);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETCanvasView setForceTouchEnabled:](self, "setForceTouchEnabled:", objc_msgSend(v4, "forceTouchCapability") == 2);

}

- (ETCanvasViewDelegate)canvasDelegate
{
  return (ETCanvasViewDelegate *)objc_loadWeakRetained((id *)&self->_canvasDelegate);
}

- (void)setCanvasDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_canvasDelegate, a3);
}

- (ETMessageTimeSource)timeSource
{
  return (ETMessageTimeSource *)objc_loadWeakRetained((id *)&self->_timeSource);
}

- (void)setTimeSource:(id)a3
{
  objc_storeWeak((id *)&self->_timeSource, a3);
}

- (UIColor)drawingColor
{
  return self->_drawingColor;
}

- (BOOL)canComposeHeartbeat
{
  return self->_canComposeHeartbeat;
}

- (BOOL)canComposeTap
{
  return self->_canComposeTap;
}

- (BOOL)canComposeKiss
{
  return self->_canComposeKiss;
}

- (BOOL)canComposeAnger
{
  return self->_canComposeAnger;
}

- (BOOL)isComposing
{
  return self->_isComposing;
}

- (BOOL)usesMediaAppearance
{
  return self->_usesMediaAppearance;
}

- (ETMessage)parentMessage
{
  return self->_parentMessage;
}

- (void)setParentMessage:(id)a3
{
  objc_storeStrong((id *)&self->_parentMessage, a3);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)useFastVerticalWisp
{
  return self->_useFastVerticalWisp;
}

- (void)setUseFastVerticalWisp:(BOOL)a3
{
  self->_useFastVerticalWisp = a3;
}

- (BOOL)angerUsesForceTouch
{
  return self->_angerUsesForceTouch;
}

- (void)setAngerUsesForceTouch:(BOOL)a3
{
  self->_angerUsesForceTouch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentMessage, 0);
  objc_storeStrong((id *)&self->_drawingColor, 0);
  objc_destroyWeak((id *)&self->_timeSource);
  objc_destroyWeak((id *)&self->_canvasDelegate);
  objc_storeStrong((id *)&self->_videoLayer, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_angerDurationLimitTimer, 0);
  objc_storeStrong((id *)&self->_currentAnger, 0);
  objc_storeStrong((id *)&self->_angerRecognizer, 0);
  objc_storeStrong((id *)&self->_currentKissMessage, 0);
  objc_storeStrong((id *)&self->_kissRecognizer, 0);
  objc_storeStrong((id *)&self->_fastTapAllowableMovementTimer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_messageIdentifierToDoodleView, 0);
  objc_storeStrong((id *)&self->_touchesDown, 0);
  objc_storeStrong((id *)&self->_drawingTouch, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_sendMessageTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatRecognizer, 0);
  objc_storeStrong((id *)&self->_heartbeatDurationTimer, 0);
  objc_storeStrong((id *)&self->_currentHeartbeat, 0);
  objc_storeStrong((id *)&self->_currentTaps, 0);
  objc_storeStrong((id *)&self->_currentSketchView, 0);
  objc_storeStrong((id *)&self->_playingMessages, 0);
}

@end
