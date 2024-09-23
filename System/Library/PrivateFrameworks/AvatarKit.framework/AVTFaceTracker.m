@implementation AVTFaceTracker

+ (BOOL)usesInternalTrackingPipeline
{
  return gUsesInternalTrackingPipeline;
}

+ (void)setUsesInternalTrackingPipeline:(BOOL)a3
{
  gUsesInternalTrackingPipeline = a3;
}

- (AVTFaceTracker)init
{
  AVTFaceTracker *v2;
  AVTFaceTracker *v3;
  AVTFaceTrackingInfo *v4;
  AVTFaceTrackingInfo *trackingInfo;
  uint64_t v6;
  NSPointerArray *delegates;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTFaceTracker;
  v2 = -[AVTFaceTracker init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    *(int64x2_t *)&v2->_requestedState = vdupq_n_s64(3uLL);
    v2->_faceIsTracked = 0;
    v4 = objc_alloc_init(AVTFaceTrackingInfo);
    trackingInfo = v3->_trackingInfo;
    v3->_trackingInfo = v4;

    v3->_arSessionLock._os_unfair_lock_opaque = 0;
    v3->_trackingDataLock._os_unfair_lock_opaque = 0;
    v3->_shouldConstrainHeadPose = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
    delegates = v3->_delegates;
    v3->_delegates = (NSPointerArray *)v6;

  }
  return v3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void)addDelegate:(id)a3
{
  -[NSPointerArray addPointer:](self->_delegates, "addPointer:", a3);
}

- (void)removeDelegate:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v6 = a3;
  if (-[NSPointerArray count](self->_delegates, "count"))
  {
    v4 = 0;
    while (1)
    {
      -[NSPointerArray pointerAtIndex:](self->_delegates, "pointerAtIndex:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
        break;

      if (++v4 >= -[NSPointerArray count](self->_delegates, "count"))
        goto LABEL_7;
    }
    -[NSPointerArray removePointerAtIndex:](self->_delegates, "removePointerAtIndex:", v4);

  }
LABEL_7:

}

- (void)enumerateDelegates:(id)a3
{
  void (**v4)(id, _QWORD);
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_delegates;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)run
{
  unint64_t currentState;
  NSObject *v4;
  ARSession *arSession;
  ARSession *v6;
  NSObject *v7;
  _BOOL4 v8;
  ARSession *v9;
  int v10;
  ARSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  self->_requestedState = 0;
  currentState = self->_currentState;
  if (currentState)
  {
    if (currentState == 2)
    {
      avt_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        v10 = 134217984;
        v11 = arSession;
        _os_log_impl(&dword_1DD1FA000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Resuming face tracking ; will no longer skip frames from session %p",
          (uint8_t *)&v10,
          0xCu);
      }

      self->_currentState = 0;
    }
    else
    {
      os_unfair_lock_lock(&self->_arSessionLock);
      v6 = self->_arSession;
      avt_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          v9 = self->_arSession;
          v10 = 134217984;
          v11 = v9;
          _os_log_impl(&dword_1DD1FA000, v7, OS_LOG_TYPE_DEFAULT, "[Face tracker] Resuming face tracking ; calling -[ARSession runWithConfiguration:] on session %p",
            (uint8_t *)&v10,
            0xCu);
        }

        self->_currentState = 0;
        -[ARSession runWithConfiguration:](self->_arSession, "runWithConfiguration:", self->_arConfiguration);
      }
      else
      {
        if (v8)
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1DD1FA000, v7, OS_LOG_TYPE_DEFAULT, "[Face tracker] Running face tracking", (uint8_t *)&v10, 2u);
        }

        -[AVTFaceTracker _setupARKitForDebugging:](self, "_setupARKitForDebugging:", 0);
      }
      os_unfair_lock_unlock(&self->_arSessionLock);
    }
  }
}

- (void)pauseByPausingARSession
{
  os_unfair_lock_s *p_arSessionLock;
  NSObject *v4;
  ARSession *arSession;
  int v6;
  ARSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_requestedState = 1;
  if ((self->_currentState | 2) != 3)
  {
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      arSession = self->_arSession;
      v6 = 134217984;
      v7 = arSession;
      _os_log_impl(&dword_1DD1FA000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Pausing face tracking ; calling -[ARSession pause] on session %p",
        (uint8_t *)&v6,
        0xCu);
    }

    self->_currentState = 1;
    -[ARSession pause](self->_arSession, "pause");
    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (void)pauseBySkippingARFrames
{
  os_unfair_lock_s *p_arSessionLock;
  NSObject *v4;
  ARSession *arSession;
  int v6;
  ARSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_requestedState = 2;
  if (self->_currentState - 1 >= 3)
  {
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      arSession = self->_arSession;
      v6 = 134217984;
      v7 = arSession;
      _os_log_impl(&dword_1DD1FA000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Pausing face tracking ; will skip new frames from session %p",
        (uint8_t *)&v6,
        0xCu);
    }

    self->_currentState = 2;
    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (void)stop
{
  os_unfair_lock_s *p_arSessionLock;
  NSObject *v4;
  ARSession *arSession;
  ARSession *v6;
  int v7;
  ARSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_requestedState = 3;
  if (self->_currentState != 3)
  {
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      arSession = self->_arSession;
      v7 = 134217984;
      v8 = arSession;
      _os_log_impl(&dword_1DD1FA000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Stopping face tracking ; calling -[ARSession pause] on session %p before release",
        (uint8_t *)&v7,
        0xCu);
    }

    self->_currentState = 3;
    -[ARSession pause](self->_arSession, "pause");
    v6 = self->_arSession;
    self->_arSession = 0;

    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (unint64_t)state
{
  return self->_currentState;
}

- (uint64_t)projectionMatrixForViewportSize:zNear:zFar:
{
  ARCameraToDisplayRotation();
  ARAdjustIntrincisForOrientation();
  ARAdjustIntrinsicsForViewportSize();
  return ARMatrixMakeFrustum();
}

- (void)updateWithARFrame:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5 constrainHeadPose:(BOOL)a6 mirroredDepthData:(BOOL)a7
{
  _BOOL8 v8;
  id v12;
  double v13;
  double v14;
  void *v15;
  AVDepthData *fallBackDepthData;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  double *p_lastUpdateWithTrackedFaceTimestamp;
  double lastUpdateWithTrackedFaceTimestamp;
  id v29;
  _QWORD v30[5];
  id v31;

  v8 = a6;
  v12 = a3;
  objc_msgSend(v12, "timestamp");
  v14 = v13;
  self->_lastUpdateTimestamp = v13;
  +[AVTFaceTrackingInfo trackingInfoWithARFrame:worldAlignment:captureOrientation:interfaceOrientation:constrainHeadPose:](AVTFaceTrackingInfo, "trackingInfoWithARFrame:worldAlignment:captureOrientation:interfaceOrientation:constrainHeadPose:", v12, objc_msgSend(v12, "worldAlignment"), a4, a5, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_storeStrong((id *)&self->_trackingInfo, v15);
    fallBackDepthData = self->_fallBackDepthData;
    self->_fallBackDepthData = 0;

    self->_faceIsTracked = 1;
    objc_msgSend(v12, "camera");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "intrinsics");
    *(_DWORD *)&self->_anon_40[8] = v18;
    *(_DWORD *)&self->_anon_40[24] = v19;
    *(_QWORD *)self->_anon_40 = v20;
    *(_QWORD *)&self->_anon_40[16] = v21;
    *(_DWORD *)&self->_anon_40[40] = v22;
    *(_QWORD *)&self->_anon_40[32] = v23;

    objc_msgSend(v12, "camera");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageResolution");
    self->_cameraImageResolution.width = v25;
    self->_cameraImageResolution.height = v26;

    self->_captureVideoOrientation = a4;
    self->_interfaceOrientation = a5;
    p_lastUpdateWithTrackedFaceTimestamp = &self->_lastUpdateWithTrackedFaceTimestamp;
    self->_mirroredDepthData = a7;
LABEL_4:
    *p_lastUpdateWithTrackedFaceTimestamp = v14;
    goto LABEL_5;
  }
  p_lastUpdateWithTrackedFaceTimestamp = &self->_lastUpdateWithTrackedFaceTimestamp;
  lastUpdateWithTrackedFaceTimestamp = self->_lastUpdateWithTrackedFaceTimestamp;
  self->_faceIsTracked = 0;
  if (lastUpdateWithTrackedFaceTimestamp == 0.0)
    goto LABEL_4;
LABEL_5:
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __112__AVTFaceTracker_updateWithARFrame_captureOrientation_interfaceOrientation_constrainHeadPose_mirroredDepthData___block_invoke;
  v30[3] = &unk_1EA61DB58;
  v30[4] = self;
  v31 = v12;
  v29 = v12;
  -[AVTFaceTracker enumerateDelegates:](self, "enumerateDelegates:", v30);

}

uint64_t __112__AVTFaceTracker_updateWithARFrame_captureOrientation_interfaceOrientation_constrainHeadPose_mirroredDepthData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceTrackerDidUpdate:withARFrame:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)updateWithARFrame:(id)a3 worldAlignment:(int64_t)a4 fallBackDepthData:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 constrainHeadPose:(BOOL)a8 mirroredDepthData:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  double *p_lastUpdateWithTrackedFaceTimestamp;
  double lastUpdateWithTrackedFaceTimestamp;
  id v32;
  _QWORD v33[5];
  id v34;

  v9 = a8;
  v15 = a3;
  v16 = a5;
  objc_msgSend(v15, "timestamp");
  v18 = v17;
  self->_lastUpdateTimestamp = v17;
  +[AVTFaceTrackingInfo trackingInfoWithARFrame:worldAlignment:captureOrientation:interfaceOrientation:constrainHeadPose:](AVTFaceTrackingInfo, "trackingInfoWithARFrame:worldAlignment:captureOrientation:interfaceOrientation:constrainHeadPose:", v15, a4, a6, a7, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_storeStrong((id *)&self->_trackingInfo, v19);
    objc_storeStrong((id *)&self->_fallBackDepthData, a5);
    self->_faceIsTracked = 1;
    objc_msgSend(v15, "camera");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "intrinsics");
    *(_DWORD *)&self->_anon_40[8] = v21;
    *(_DWORD *)&self->_anon_40[24] = v22;
    *(_QWORD *)self->_anon_40 = v23;
    *(_QWORD *)&self->_anon_40[16] = v24;
    *(_DWORD *)&self->_anon_40[40] = v25;
    *(_QWORD *)&self->_anon_40[32] = v26;

    objc_msgSend(v15, "camera");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "imageResolution");
    self->_cameraImageResolution.width = v28;
    self->_cameraImageResolution.height = v29;

    self->_captureVideoOrientation = a6;
    self->_interfaceOrientation = a7;
    p_lastUpdateWithTrackedFaceTimestamp = &self->_lastUpdateWithTrackedFaceTimestamp;
    self->_mirroredDepthData = a9;
LABEL_4:
    *p_lastUpdateWithTrackedFaceTimestamp = v18;
    goto LABEL_5;
  }
  p_lastUpdateWithTrackedFaceTimestamp = &self->_lastUpdateWithTrackedFaceTimestamp;
  lastUpdateWithTrackedFaceTimestamp = self->_lastUpdateWithTrackedFaceTimestamp;
  self->_faceIsTracked = 0;
  if (lastUpdateWithTrackedFaceTimestamp == 0.0)
    goto LABEL_4;
LABEL_5:
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __145__AVTFaceTracker_updateWithARFrame_worldAlignment_fallBackDepthData_captureOrientation_interfaceOrientation_constrainHeadPose_mirroredDepthData___block_invoke;
  v33[3] = &unk_1EA61DB58;
  v33[4] = self;
  v34 = v15;
  v32 = v15;
  -[AVTFaceTracker enumerateDelegates:](self, "enumerateDelegates:", v33);

}

uint64_t __145__AVTFaceTracker_updateWithARFrame_worldAlignment_fallBackDepthData_captureOrientation_interfaceOrientation_constrainHeadPose_mirroredDepthData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceTrackerDidUpdate:withARFrame:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)discardARFrameData
{
  AVTFaceTrackingInfo *trackingInfo;
  AVDepthData *fallBackDepthData;

  trackingInfo = self->_trackingInfo;
  self->_trackingInfo = 0;

  fallBackDepthData = self->_fallBackDepthData;
  self->_fallBackDepthData = 0;

}

- (ARSession)arSession
{
  return self->_arSession;
}

- (void)configurationVideoFormatDidChange:(id)a3
{
  self->_captureVideoOrientation = 4;
}

- (NSURL)faceTrackingRecordingURL
{
  return self->_debugRecordingURL;
}

- (void)setFaceTrackingRecordingURL:(id)a3
{
  NSURL *v4;
  NSURL *debugRecordingURL;

  if (self->_debugRecordingURL != a3)
  {
    v4 = (NSURL *)objc_msgSend(a3, "copy");
    debugRecordingURL = self->_debugRecordingURL;
    self->_debugRecordingURL = v4;

    -[AVTFaceTracker setupARKit](self, "setupARKit");
  }
}

- (void)setLowLight:(BOOL)a3
{
  self->_lowLight = a3;
}

- (void)setSensorCovered:(BOOL)a3
{
  self->_isSensorCovered = a3;
}

- (BOOL)shouldUseAudioData
{
  return self->_shouldUseAudioData;
}

- (void)setShouldUseAudioData:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_arSessionLock;
  NSObject *v6;
  ARSession *arSession;
  int v8;
  ARSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_shouldUseAudioData != a3)
  {
    v3 = a3;
    self->_shouldUseAudioData = a3;
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    -[ARConfiguration setProvidesAudioData:](self->_arConfiguration, "setProvidesAudioData:", v3);
    if (!self->_requestedState)
    {
      avt_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        v8 = 134217984;
        v9 = arSession;
        _os_log_impl(&dword_1DD1FA000, v6, OS_LOG_TYPE_DEFAULT, "[Face tracker] Audio data status did change ; calling -[ARSession runWithConfiguration:] on session %p",
          (uint8_t *)&v8,
          0xCu);
      }

      self->_currentState = 0;
      -[ARSession runWithConfiguration:](self->_arSession, "runWithConfiguration:", self->_arConfiguration);
    }
    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (BOOL)wantsPersonSegmentation
{
  return self->_wantsPersonSegmentation;
}

- (void)setWantsPersonSegmentation:(BOOL)a3
{
  os_unfair_lock_s *p_arSessionLock;
  ARConfiguration *arConfiguration;
  unint64_t v6;
  NSObject *v7;
  ARSession *arSession;
  int v9;
  ARSession *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_wantsPersonSegmentation != a3)
  {
    self->_wantsPersonSegmentation = a3;
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    if (self->_wantsPersonSegmentation
      && objc_msgSend((id)objc_opt_class(), "supportsFrameSemantics:", 1))
    {
      arConfiguration = self->_arConfiguration;
      v6 = -[ARConfiguration frameSemantics](arConfiguration, "frameSemantics") | 1;
    }
    else
    {
      arConfiguration = self->_arConfiguration;
      v6 = -[ARConfiguration frameSemantics](arConfiguration, "frameSemantics") & 0xFFFFFFFFFFFFFFFELL;
    }
    -[ARConfiguration setFrameSemantics:](arConfiguration, "setFrameSemantics:", v6);
    if (!self->_requestedState)
    {
      avt_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        v9 = 134217984;
        v10 = arSession;
        _os_log_impl(&dword_1DD1FA000, v7, OS_LOG_TYPE_DEFAULT, "[Face tracker] Person segmentation status did change ; calling -[ARSession runWithConfiguration:] on session %p",
          (uint8_t *)&v9,
          0xCu);
      }

      self->_currentState = 0;
      -[ARSession runWithConfiguration:](self->_arSession, "runWithConfiguration:", self->_arConfiguration);
    }
    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (int64_t)faceTrackingFrameID
{
  return self->_frame_id;
}

- (double)arFrameTimestamp
{
  return self->_perfPacket.refTimestamp;
}

- (double)arDelegateTimestamp
{
  return self->_perfPacket.arDelegateTimestamp;
}

- (double)arFrameDeltaTime
{
  return self->_timeBetweenARFrame;
}

- (void)decreaseFrameRate
{
  os_unfair_lock_s *p_arSessionLock;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  ARSession *arSession;
  int v11;
  ARSession *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_arSessionLock = &self->_arSessionLock;
  os_unfair_lock_lock(&self->_arSessionLock);
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARConfiguration videoFormat](self->_arConfiguration, "videoFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  if (v7 && v7 < objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v7 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARConfiguration setVideoFormat:](self->_arConfiguration, "setVideoFormat:", v8);
    -[AVTFaceTracker configurationVideoFormatDidChange:](self, "configurationVideoFormatDidChange:", self->_arConfiguration);
    if (!self->_requestedState)
    {
      avt_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        v11 = 134217984;
        v12 = arSession;
        _os_log_impl(&dword_1DD1FA000, v9, OS_LOG_TYPE_DEFAULT, "[Face tracker] Video format did change ; calling -[ARSession runWithConfiguration:] on session %p",
          (uint8_t *)&v11,
          0xCu);
      }

      self->_currentState = 0;
      -[ARSession runWithConfiguration:](self->_arSession, "runWithConfiguration:", self->_arConfiguration);
    }

  }
  os_unfair_lock_unlock(p_arSessionLock);

}

- (void)increaseFrameRateToMaximum
{
  os_unfair_lock_s *p_arSessionLock;
  ARConfiguration *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  ARSession *arSession;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  ARSession *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_arSessionLock = &self->_arSessionLock;
  os_unfair_lock_lock(&self->_arSessionLock);
  v4 = self->_arConfiguration;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormats", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "framesPerSecond") > v9)
        {
          v9 = objc_msgSend(v12, "framesPerSecond");
          v13 = v12;

          v8 = v13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[ARConfiguration videoFormat](self->_arConfiguration, "videoFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "isEqual:", v14);

  if ((v15 & 1) == 0)
  {
    -[ARConfiguration setVideoFormat:](self->_arConfiguration, "setVideoFormat:", v8);
    -[AVTFaceTracker configurationVideoFormatDidChange:](self, "configurationVideoFormatDidChange:", self->_arConfiguration);
    if (!self->_requestedState)
    {
      avt_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        *(_DWORD *)buf = 134217984;
        v23 = arSession;
        _os_log_impl(&dword_1DD1FA000, v16, OS_LOG_TYPE_DEFAULT, "[Face tracker] Video format did change ; calling -[ARSession runWithConfiguration:] on session %p",
          buf,
          0xCu);
      }

      self->_currentState = 0;
      -[ARSession runWithConfiguration:](self->_arSession, "runWithConfiguration:", self->_arConfiguration);
    }
  }
  os_unfair_lock_unlock(p_arSessionLock);

}

- (void)setupARKit
{
  os_unfair_lock_s *p_arSessionLock;

  p_arSessionLock = &self->_arSessionLock;
  os_unfair_lock_lock(&self->_arSessionLock);
  -[AVTFaceTracker _setupARKitForDebugging:](self, "_setupARKitForDebugging:", 0);
  os_unfair_lock_unlock(p_arSessionLock);
}

- (void)setupARKitForDebugging
{
  os_unfair_lock_s *p_arSessionLock;

  p_arSessionLock = &self->_arSessionLock;
  os_unfair_lock_lock(&self->_arSessionLock);
  -[AVTFaceTracker _setupARKitForDebugging:](self, "_setupARKitForDebugging:", 1);
  os_unfair_lock_unlock(p_arSessionLock);
}

- (void)_setupARKitForDebugging:(BOOL)a3
{
  _BOOL4 v3;
  ARSession *v5;
  ARSession *arSession;
  ARConfiguration *arConfiguration;
  ARConfiguration *v8;
  NSObject *v9;
  ARConfiguration *v10;
  ARConfiguration *v11;
  ARConfiguration *v12;
  NSObject *v13;
  ARSession *v14;
  int v15;
  ARSession *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0C895B0], "isSupported") & 1) != 0)
  {
    if (!self->_arSession)
    {
      v5 = (ARSession *)objc_opt_new();
      arSession = self->_arSession;
      self->_arSession = v5;

      -[ARSession setDelegate:](self->_arSession, "setDelegate:", self);
    }
    arConfiguration = self->_arConfiguration;
    self->_arConfiguration = 0;

    if (+[AVTRecordView usesInternalTrackingPipeline](AVTRecordView, "usesInternalTrackingPipeline"))
    {
      v8 = (ARConfiguration *)objc_opt_new();
    }
    else
    {
      v8 = (ARConfiguration *)objc_opt_new();
      -[ARConfiguration setMaximumNumberOfTrackedFaces:](v8, "setMaximumNumberOfTrackedFaces:", 1);
    }
    v10 = self->_arConfiguration;
    self->_arConfiguration = v8;

    -[ARConfiguration setProvidesAudioData:](self->_arConfiguration, "setProvidesAudioData:", self->_shouldUseAudioData);
    -[ARConfiguration setLightEstimationEnabled:](self->_arConfiguration, "setLightEstimationEnabled:", 0);
    -[ARConfiguration setWorldAlignment:](self->_arConfiguration, "setWorldAlignment:", 2);
    if (self->_wantsPersonSegmentation
      && objc_msgSend((id)objc_opt_class(), "supportsFrameSemantics:", 1))
    {
      -[ARConfiguration setFrameSemantics:](self->_arConfiguration, "setFrameSemantics:", -[ARConfiguration frameSemantics](self->_arConfiguration, "frameSemantics") | 1);
    }
    -[ARConfiguration setAllowCameraInMultipleForegroundAppLayout:](self->_arConfiguration, "setAllowCameraInMultipleForegroundAppLayout:", 1);
    if (v3 && self->_debugRecordingURL)
    {
      v11 = (ARConfiguration *)objc_msgSend(objc_alloc(MEMORY[0x1E0C895F8]), "initWithBaseConfiguration:fileURL:", self->_arConfiguration, self->_debugRecordingURL);
      v12 = self->_arConfiguration;
      self->_arConfiguration = v11;

    }
    -[AVTFaceTracker configurationVideoFormatDidChange:](self, "configurationVideoFormatDidChange:", self->_arConfiguration);
    avt_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_arSession;
      v15 = 134217984;
      v16 = v14;
      _os_log_impl(&dword_1DD1FA000, v13, OS_LOG_TYPE_DEFAULT, "[Face tracker] ARKit setup ; calling -[ARSession runWithConfiguration:] on session %p",
        (uint8_t *)&v15,
        0xCu);
    }

    self->_currentState = 0;
    -[ARSession runWithConfiguration:](self->_arSession, "runWithConfiguration:", self->_arConfiguration);
  }
  else
  {
    avt_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1DD1FA000, v9, OS_LOG_TYPE_DEFAULT, "[Face tracker] Face tracking is not supported by this device", (uint8_t *)&v15, 2u);
    }

  }
}

- (void)stopRecording
{
  dispatch_semaphore_t v3;
  ARConfiguration *v4;
  NSObject *v5;
  ARConfiguration *v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  ARConfiguration *v12;
  dispatch_semaphore_t v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = dispatch_semaphore_create(0);
    v4 = self->_arConfiguration;
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __31__AVTFaceTracker_stopRecording__block_invoke;
    v11 = &unk_1EA61DB80;
    v12 = v4;
    v13 = v3;
    v5 = v3;
    v6 = v4;
    -[ARConfiguration finishRecordingWithHandler:](v6, "finishRecordingWithHandler:", &v8);
    v7 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v5, v7);
    -[AVTFaceTracker setupARKit](self, "setupARKit", v8, v9, v10, v11);

  }
}

void __31__AVTFaceTracker_stopRecording__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  avt_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1DD1FA000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Finished recording to %@, error: %@", (uint8_t *)&v6, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)startRecording
{
  if (self->_debugRecordingURL)
  {
    -[AVTFaceTracker setupARKitForDebugging](self, "setupARKitForDebugging");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ARConfiguration startRecording](self->_arConfiguration, "startRecording");
  }
}

- (void)sessionWasInterrupted:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  avt_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DD1FA000, v5, OS_LOG_TYPE_DEFAULT, "[Face tracker] Session was interrupted: %@", buf, 0xCu);
  }

  self->_faceIsTracked = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AVTFaceTracker_sessionWasInterrupted___block_invoke;
  v7[3] = &unk_1EA61DB58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AVTFaceTracker enumerateDelegates:](self, "enumerateDelegates:", v7);

}

void __40__AVTFaceTracker_sessionWasInterrupted___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "faceTracker:sessionWasInterrupted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  avt_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DD1FA000, v5, OS_LOG_TYPE_DEFAULT, "[Face tracker] Session interruption ended: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AVTFaceTracker_sessionInterruptionEnded___block_invoke;
  v7[3] = &unk_1EA61DB58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AVTFaceTracker enumerateDelegates:](self, "enumerateDelegates:", v7);

}

void __43__AVTFaceTracker_sessionInterruptionEnded___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "faceTracker:sessionInterruptionEnded:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)session:(id)a3 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  opaqueCMSampleBuffer *v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__AVTFaceTracker_session_didOutputAudioSampleBuffer___block_invoke;
  v8[3] = &unk_1EA61DBA8;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[AVTFaceTracker enumerateDelegates:](self, "enumerateDelegates:", v8);

}

void __53__AVTFaceTracker_session_didOutputAudioSampleBuffer___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "faceTracker:session:didOutputAudioSampleBuffer:", a1[4], a1[5], a1[6]);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double lastARFrameTime;
  double refTimestamp;
  double v23;
  AVTFaceTrackingInfo *v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  int64_t captureVideoOrientation;
  int64_t interfaceOrientation;
  _BOOL4 shouldConstrainHeadPose;
  unint64_t v32;
  int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  CGFloat v52;
  CGFloat v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  __n128 v58;
  __n128 v59;
  __n128 v60;
  __n128 v61;
  int v62;
  _QWORD v63[5];
  id v64;
  float v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_currentState == 2)
    goto LABEL_26;
  v8 = (void *)MEMORY[0x1DF0D6DC8]();
  objc_msgSend(v7, "timestamp");
  v10 = v9;
  os_unfair_lock_lock(&self->_trackingDataLock);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v7, "anchors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  if (v12)
  {
    v13 = v12;
    v54 = v8;
    v55 = v6;
    v57 = 0;
    v14 = *(_QWORD *)v67;
    v56 = v11;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v67 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
          if (objc_msgSend(v17, "isTracked"))
          {
            v62 = -[AVTFaceTracker directRetargetingMode](self, "directRetargetingMode");
            *(double *)&self->_frame_id = v10;
            kdebug_trace();
            kdebug_trace();
            v18 = v7;
            objc_msgSend(v7, "captureDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "timeIntervalSinceReferenceDate");
            self->_perfPacket.refTimestamp = v20;

            lastARFrameTime = self->_lastARFrameTime;
            refTimestamp = self->_perfPacket.refTimestamp;
            if (lastARFrameTime > 0.0)
              self->_timeBetweenARFrame = refTimestamp - lastARFrameTime;
            self->_lastARFrameTime = refTimestamp;
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            self->_perfPacket.arDelegateTimestamp = v23;
            v24 = self->_trackingInfo;
            objc_msgSend(v17, "_avt_rawTransform");
            v60 = v26;
            v61 = v25;
            v58 = v28;
            v59 = v27;
            captureVideoOrientation = self->_captureVideoOrientation;
            interfaceOrientation = self->_interfaceOrientation;
            shouldConstrainHeadPose = self->_shouldConstrainHeadPose;
            v32 = objc_msgSend(v18, "worldAlignment");
            v33 = shouldConstrainHeadPose;
            v7 = v18;
            *(__n128 *)&v24[1].super.isa = _convertARFaceAnchorTransformToSceneKitTransform(captureVideoOrientation, interfaceOrientation, v33, v18, v32, v61, v60, v59, v58);
            *(_OWORD *)&v24[1]._trackingData.timestamp = v34;
            *(_OWORD *)&v24[1]._anon_18[8] = v35;
            *(_OWORD *)&v24[1]._anon_18[24] = v36;
            v65 = 0.0;
            AVTTrackingDataFromARFrame((uint64_t)&v24->_trackingData, v18, objc_msgSend(v18, "worldAlignment"), v17, self->_captureVideoOrientation, self->_interfaceOrientation, self->_shouldConstrainHeadPose, v62, &v65);
            LODWORD(captureVideoOrientation) = -[AVTFaceTracker limitRoll](self, "limitRoll");

            if (!(_DWORD)captureVideoOrientation || v65 < 1.25663706)
              ++v57;
            v11 = v56;
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    }
    while (v13);

    self->_lastUpdateTimestamp = v10;
    v8 = v54;
    v6 = v55;
    if (v57)
    {
      v37 = 1;
LABEL_22:
      self->_lastUpdateWithTrackedFaceTimestamp = v10;
      v38 = v37;
      goto LABEL_23;
    }
  }
  else
  {

    self->_lastUpdateTimestamp = v10;
  }
  v37 = 0;
  v38 = 0;
  if (self->_lastUpdateWithTrackedFaceTimestamp == 0.0)
    goto LABEL_22;
LABEL_23:
  os_unfair_lock_unlock(&self->_trackingDataLock);
  self->_faceIsTracked = v38;
  objc_msgSend(v7, "faceData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "faceMeshPayload");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCCA8]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCCB0]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFaceTracker setLowLight:](self, "setLowLight:", objc_msgSend(v42, "BOOLValue"));
    objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCCB8]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFaceTracker setSensorCovered:](self, "setSensorCovered:", objc_msgSend(v43, "BOOLValue"));

  }
  objc_msgSend(v7, "camera");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "intrinsics");
  *(_DWORD *)&self->_anon_40[8] = v45;
  *(_DWORD *)&self->_anon_40[24] = v46;
  *(_QWORD *)self->_anon_40 = v47;
  *(_QWORD *)&self->_anon_40[16] = v48;
  *(_DWORD *)&self->_anon_40[40] = v49;
  *(_QWORD *)&self->_anon_40[32] = v50;
  objc_msgSend(v44, "imageResolution");
  v51 = MEMORY[0x1E0C809B0];
  self->_cameraImageResolution.width = v52;
  self->_cameraImageResolution.height = v53;
  v63[0] = v51;
  v63[1] = 3221225472;
  v63[2] = __41__AVTFaceTracker_session_didUpdateFrame___block_invoke;
  v63[3] = &unk_1EA61DB58;
  v63[4] = self;
  v64 = v7;
  -[AVTFaceTracker enumerateDelegates:](self, "enumerateDelegates:", v63);

  objc_autoreleasePoolPop(v8);
LABEL_26:

}

uint64_t __41__AVTFaceTracker_session_didUpdateFrame___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceTrackerDidUpdate:withARFrame:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  ARSession *arSession;
  dispatch_time_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  avt_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1DD1FA000, v8, OS_LOG_TYPE_DEFAULT, "[Face tracker] Session %p failed with error: %@", buf, 0x16u);
  }

  self->_faceIsTracked = 0;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__AVTFaceTracker_session_didFailWithError___block_invoke;
  v15[3] = &unk_1EA61DBD0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  -[AVTFaceTracker enumerateDelegates:](self, "enumerateDelegates:", v15);
  os_unfair_lock_lock(&self->_arSessionLock);
  self->_currentState = 3;
  -[ARSession pause](self->_arSession, "pause");
  arSession = self->_arSession;
  self->_arSession = 0;

  os_unfair_lock_unlock(&self->_arSessionLock);
  v13 = dispatch_time(0, 1000000000);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __43__AVTFaceTracker_session_didFailWithError___block_invoke_2;
  v14[3] = &unk_1EA61DBF8;
  v14[4] = self;
  dispatch_after(v13, MEMORY[0x1E0C80D38], v14);

}

void __43__AVTFaceTracker_session_didFailWithError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "faceTracker:session:didFailWithError:", a1[4], a1[5], a1[6]);

}

_QWORD *__43__AVTFaceTracker_session_didFailWithError___block_invoke_2(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[4])
    return (_QWORD *)objc_msgSend(result, "run");
  return result;
}

- (void)beginQuery
{
  os_unfair_lock_lock(&self->_trackingDataLock);
}

- (void)endQuery
{
  os_unfair_lock_unlock(&self->_trackingDataLock);
}

- (AVTFaceTrackingInfo)faceTrackingInfo
{
  return self->_trackingInfo;
}

- (void)copyTrackingData:(id *)a3
{
  memcpy(a3, -[AVTFaceTrackingInfo trackingData](self->_trackingInfo, "trackingData"), 0x1E0uLL);
}

- (__n128)rawTransform
{
  return *(__n128 *)(*(_QWORD *)(a1 + 136) + 496);
}

- (BOOL)lowLight
{
  return self->_lowLight;
}

- (BOOL)isSensorCovered
{
  return self->_isSensorCovered;
}

- (double)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (double)lastUpdateWithTrackedFaceTimestamp
{
  return self->_lastUpdateWithTrackedFaceTimestamp;
}

- (BOOL)shouldConstrainHeadPose
{
  return self->_shouldConstrainHeadPose;
}

- (void)setShouldConstrainHeadPose:(BOOL)a3
{
  self->_shouldConstrainHeadPose = a3;
}

- (BOOL)limitRoll
{
  return self->limitRoll;
}

- (void)setLimitRoll:(BOOL)a3
{
  self->limitRoll = a3;
}

- (AVDepthData)fallBackDepthData
{
  return self->_fallBackDepthData;
}

- (int64_t)captureVideoOrientation
{
  return self->_captureVideoOrientation;
}

- (BOOL)mirroredDepthData
{
  return self->_mirroredDepthData;
}

- (BOOL)faceIsTracked
{
  return self->_faceIsTracked;
}

- (BOOL)directRetargetingMode
{
  return self->_directRetargetingMode;
}

- (void)setDirectRetargetingMode:(BOOL)a3
{
  self->_directRetargetingMode = a3;
}

- (__n128)cameraIntrinsics
{
  return a1[4];
}

- (CGSize)cameraImageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_cameraImageResolution.width;
  height = self->_cameraImageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugRecordingURL, 0);
  objc_storeStrong((id *)&self->_trackingInfo, 0);
  objc_storeStrong((id *)&self->_fallBackDepthData, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_arConfiguration, 0);
  objc_storeStrong((id *)&self->_arSession, 0);
}

@end
