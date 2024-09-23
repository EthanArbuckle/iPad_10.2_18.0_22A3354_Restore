@implementation CAMAnalyticsSessionEvent

- (CAMAnalyticsSessionEvent)initWithCapabilities:(id)a3 availableCaptureModes:(id)a4 currentCaptureMode:(int64_t)a5 currentCaptureDevice:(int64_t)a6 callStatusMonitor:(id)a7
{
  id v13;
  id v14;
  id v15;
  CAMAnalyticsSessionEvent *v16;
  CAMAnalyticsSessionEvent *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *captureCountsByMode;
  NSMutableDictionary *v20;
  NSMutableDictionary *captureCountsByMediaType;
  unint64_t v22;
  __CFString *v23;
  NSString *hostProcess;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v29.receiver = self;
  v29.super_class = (Class)CAMAnalyticsSessionEvent;
  v16 = -[CAMAnalyticsEvent init](&v29, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->__capabilities, a3);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    captureCountsByMode = v17->__captureCountsByMode;
    v17->__captureCountsByMode = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    captureCountsByMediaType = v17->__captureCountsByMediaType;
    v17->__captureCountsByMediaType = v20;

    v17->__cameraRollInteraction = 0;
    v17->__startTime = CFAbsoluteTimeGetCurrent();
    v22 = objc_msgSend(v13, "hostProcess");
    v23 = 0;
    if (v22 <= 5)
      v23 = off_1EA32F4D8[v22];
    hostProcess = v17->__hostProcess;
    v17->__hostProcess = &v23->isa;

    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v17->__textDetectionEnabled = objc_msgSend(v25, "isImageAnalysisEnabled");

    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v17->__mrcDetectionEnabled = objc_msgSend(v26, "shouldShowQRBanners");

    objc_storeStrong((id *)&v17->__availableCaptureModes, a4);
    v17->__firstConfiguredMode = a5;
    v17->__firstConfiguredDevice = a6;
    objc_storeStrong((id *)&v17->__callStatusMonitor, a7);
    v17->__launchMethod = 0;
    if (objc_msgSend(v15, "isCallActive"))
      -[CAMAnalyticsSessionEvent set_hadActiveCall:](v17, "set_hadActiveCall:", 1);
    +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v17, sel__handleCallStatusMonitorDidChangeCallActive_, CFSTR("CAMCallStatusMonitorDidChangeCallActiveNotification"), 0);

  }
  return v17;
}

- (id)eventName
{
  return CFSTR("session");
}

- (void)_endSession
{
  void *v3;
  double Current;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _BOOL8 v27;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  __CFString *v58;
  unint64_t v59;
  __CFString *v60;
  void *v61;
  id v62;

  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v62 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsSessionEvent _hostProcess](self, "_hostProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v3, CFSTR("hostProcess"));

  Current = CFAbsoluteTimeGetCurrent();
  -[CAMAnalyticsSessionEvent _startTime](self, "_startTime");
  v6 = Current - v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v7, CFSTR("totalDuration"));

  if (-[CAMAnalyticsSessionEvent _isInCameraRoll](self, "_isInCameraRoll"))
    -[CAMAnalyticsSessionEvent didDismissCameraRoll](self, "didDismissCameraRoll");
  -[CAMAnalyticsSessionEvent _firstCaptureMode](self, "_firstCaptureMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v8, CFSTR("firstCaptureMode"));

  -[CAMAnalyticsSessionEvent _firstCaptureDevicePosition](self, "_firstCaptureDevicePosition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v9, CFSTR("firstCaptureDevice"));

  -[CAMAnalyticsSessionEvent _cameraRollTotalTime](self, "_cameraRollTotalTime");
  if (v10 > 0.0)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMAnalyticsSessionEvent _cameraRollTotalTime](self, "_cameraRollTotalTime");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v12, CFSTR("totalCameraRollDuration"));

  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMAnalyticsSessionEvent _cameraRollTotalTime](self, "_cameraRollTotalTime");
  objc_msgSend(v13, "numberWithDouble:", v6 - v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v15, CFSTR("totalCameraDuration"));

  -[CAMAnalyticsSessionEvent _previewStartTime](self, "_previewStartTime");
  if (v16 > 0.0)
  {
    -[CAMAnalyticsSessionEvent _previewStartTime](self, "_previewStartTime");
    v18 = v17;
    -[CAMAnalyticsSessionEvent _startTime](self, "_startTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18 - v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v20, CFSTR("timeToPreview"));

  }
  if (-[CAMAnalyticsSessionEvent _cameraRollInteraction](self, "_cameraRollInteraction"))
  {
    v21 = -[CAMAnalyticsSessionEvent _cameraRollInteraction](self, "_cameraRollInteraction");
    if (v21 > 3)
      v22 = 0;
    else
      v22 = off_1EA32F508[v21];
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v22, CFSTR("didInteractWithCameraRoll"));
  }
  if (-[CAMAnalyticsSessionEvent _totalCaptures](self, "_totalCaptures"))
  {
    -[CAMAnalyticsSessionEvent _firstCaptureStartTime](self, "_firstCaptureStartTime");
    v24 = v23;
    -[CAMAnalyticsSessionEvent _startTime](self, "_startTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24 - v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v26, CFSTR("timeToFirstCapture"));

  }
  v27 = 1;
  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v28, CFSTR("captureCountVideoMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v29, CFSTR("captureCountPhotoMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v30, CFSTR("captureCountSquareMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v31, CFSTR("captureCountSlomoMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v32, CFSTR("captureCountPortraitMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v33, CFSTR("captureCountCinematicMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v34, CFSTR("captureCountPanoramaMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v35, CFSTR("captureCountTimelapseMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v36, CFSTR("captureCountSpatialVideoMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMode:](self, "_bucketCaptureCountForMode:", 9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v37, CFSTR("captureCountSpatialPhotoMode"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMediaType:](self, "_bucketCaptureCountForMediaType:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v38, CFSTR("mediaTypeCountVideo"));

  -[CAMAnalyticsSessionEvent _bucketCaptureCountForMediaType:](self, "_bucketCaptureCountForMediaType:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v39, CFSTR("mediaTypeCountPhoto"));

  v40 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CAMAnalyticsSessionEvent _totalCaptures](self, "_totalCaptures"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_bucketCaptureCount:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v42, CFSTR("captureCountTotal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsSessionEvent _totalCaptures](self, "_totalCaptures") != 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v43, CFSTR("didCapture"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsSessionEvent _totalZoomInteractions](self, "_totalZoomInteractions") != 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v44, CFSTR("didZoom"));

  v45 = (void *)MEMORY[0x1E0CB37E8];
  if (!-[CAMAnalyticsSessionEvent _totalFocusInteractions](self, "_totalFocusInteractions"))
    v27 = -[CAMAnalyticsSessionEvent _totalFocusLockInteractions](self, "_totalFocusLockInteractions") != 0;
  objc_msgSend(v45, "numberWithInt:", v27);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v46, CFSTR("didTapToFocus"));

  -[CAMAnalyticsSessionEvent _capabilities](self, "_capabilities");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "arePortraitEffectsSupported");

  if (v48)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsSessionEvent _totalPortraitLightingChanges](self, "_totalPortraitLightingChanges") != 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v49, CFSTR("didChangePortraitLighting"));

  }
  if (-[CAMAnalyticsSessionEvent _textDetectionEnabled](self, "_textDetectionEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsSessionEvent _totalTextInteractions](self, "_totalTextInteractions") != 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v50, CFSTR("didInteractWithText"));

  }
  if (-[CAMAnalyticsSessionEvent _mrcDetectionEnabled](self, "_mrcDetectionEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsSessionEvent _totalMRCInteractions](self, "_totalMRCInteractions") != 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v51, CFSTR("didInteractWithMRC"));

  }
  -[CAMAnalyticsSessionEvent _capabilities](self, "_capabilities");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "hasSystemTelephonyOfAnyKind");

  if (v53)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAMAnalyticsSessionEvent _hadActiveCall](self, "_hadActiveCall"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v54, CFSTR("hadActiveCall"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CAMAnalyticsSessionEvent _totalControlDrawerOpenings](self, "_totalControlDrawerOpenings"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v55, CFSTR("totalControlDrawerOpenings"));

  objc_msgSend((id)objc_opt_class(), "_launchMethodToString:", -[CAMAnalyticsSessionEvent _launchMethod](self, "_launchMethod"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v56, CFSTR("launchMethod"));

  v57 = -[CAMAnalyticsSessionEvent _firstConfiguredDevice](self, "_firstConfiguredDevice");
  if (v57 > 0xB)
    v58 = 0;
  else
    v58 = off_1EA32F528[v57];
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v58, CFSTR("firstConfiguredDevice"));
  v59 = -[CAMAnalyticsSessionEvent _firstConfiguredMode](self, "_firstConfiguredMode");
  if (v59 > 9)
    v60 = 0;
  else
    v60 = off_1EA32F588[v59];
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v60, CFSTR("firstConfiguredMode"));
  +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "removeObserver:", self);

}

- (void)didStartPreview
{
  double v3;

  -[CAMAnalyticsSessionEvent _previewStartTime](self, "_previewStartTime");
  if (v3 == 0.0)
    -[CAMAnalyticsSessionEvent set_previewStartTime:](self, "set_previewStartTime:", CFAbsoluteTimeGetCurrent());
}

- (void)didPresentCameraRoll
{
  -[CAMAnalyticsSessionEvent _setInCameraRoll:](self, "_setInCameraRoll:", 1);
  -[CAMAnalyticsSessionEvent set_cameraRollStartTime:](self, "set_cameraRollStartTime:", CFAbsoluteTimeGetCurrent());
}

- (void)didDismissCameraRoll
{
  double Current;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (-[CAMAnalyticsSessionEvent _isInCameraRoll](self, "_isInCameraRoll"))
  {
    -[CAMAnalyticsSessionEvent _setInCameraRoll:](self, "_setInCameraRoll:", 0);
    Current = CFAbsoluteTimeGetCurrent();
    -[CAMAnalyticsSessionEvent _cameraRollStartTime](self, "_cameraRollStartTime");
    v5 = Current - v4;
    -[CAMAnalyticsSessionEvent _cameraRollTotalTime](self, "_cameraRollTotalTime");
    -[CAMAnalyticsSessionEvent set_cameraRollTotalTime:](self, "set_cameraRollTotalTime:", v6 + v5);
    v7 = -[CAMAnalyticsSessionEvent _cameraRollInteraction](self, "_cameraRollInteraction");
    if (v7)
    {
      v8 = v7;
      if (v7 != 1)
      {
LABEL_10:
        -[CAMAnalyticsSessionEvent set_cameraRollInteraction:](self, "set_cameraRollInteraction:", v8);
        return;
      }
      v9 = 3;
    }
    else
    {
      v9 = 2;
    }
    if (-[CAMAnalyticsSessionEvent _totalCaptures](self, "_totalCaptures", v8))
      v8 = v9;
    else
      v8 = 1;
    goto LABEL_10;
  }
}

+ (void)_incrementDictionaryCount:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v6, "unsignedIntValue") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);

  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA3B14C8, v5);
  }

}

+ (id)_bucketCaptureCount:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  objc_msgSend(v4, "bucketedPowerOf2ForValue:allowZero:minPositiveValue:maxValue:", 1, v6, 1.0, 1024.0);
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
}

- (id)_bucketCaptureCountForMediaType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CAMAnalyticsSessionEvent _captureCountsByMediaType](self, "_captureCountsByMediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_bucketCaptureCount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_bucketCaptureCountForMode:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[CAMAnalyticsSessionEvent _availableCaptureModes](self, "_availableCaptureModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    -[CAMAnalyticsSessionEvent _captureCountsByMode](self, "_captureCountsByMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_bucketCaptureCount:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_incrementCaptureForGraphConfiguration:(id)a3 analyticsMediaType:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = objc_msgSend(a3, "mode");
  v7 = (void *)objc_opt_class();
  -[CAMAnalyticsSessionEvent _captureCountsByMode](self, "_captureCountsByMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_incrementDictionaryCount:forKey:", v8, v9);

  v10 = (void *)objc_opt_class();
  -[CAMAnalyticsSessionEvent _captureCountsByMediaType](self, "_captureCountsByMediaType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_incrementDictionaryCount:forKey:", v11, v12);

  if (!-[CAMAnalyticsSessionEvent _totalCaptures](self, "_totalCaptures"))
    -[CAMAnalyticsSessionEvent set_firstCaptureStartTime:](self, "set_firstCaptureStartTime:", CFAbsoluteTimeGetCurrent());
  -[CAMAnalyticsSessionEvent set_totalCaptures:](self, "set_totalCaptures:", -[CAMAnalyticsSessionEvent _totalCaptures](self, "_totalCaptures") + 1);
}

- (void)didCaptureWithRequest:(id)a3 currentConfiguration:(id)a4
{
  id v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_msgSend(v12, "type");
  if (v7 == 1)
  {
    v8 = 1;
  }
  else if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v12, "ctmCaptureType") == 2;
  }
  -[CAMAnalyticsSessionEvent _incrementCaptureForGraphConfiguration:analyticsMediaType:](self, "_incrementCaptureForGraphConfiguration:analyticsMediaType:", v6, v8);
  -[CAMAnalyticsSessionEvent _firstCaptureMode](self, "_firstCaptureMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v6, "modeDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsSessionEvent set_firstCaptureMode:](self, "set_firstCaptureMode:", v10);

    objc_msgSend(v6, "devicePositionDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsSessionEvent set_firstCaptureDevicePosition:](self, "set_firstCaptureDevicePosition:", v11);

  }
}

- (void)didCaptureTimelapseWithConfiguration:(id)a3
{
  -[CAMAnalyticsSessionEvent _incrementCaptureForGraphConfiguration:analyticsMediaType:](self, "_incrementCaptureForGraphConfiguration:analyticsMediaType:", a3, 1);
}

- (void)didZoomInteraction:(int64_t)a3
{
  -[CAMAnalyticsSessionEvent set_totalZoomInteractions:](self, "set_totalZoomInteractions:", -[CAMAnalyticsSessionEvent _totalZoomInteractions](self, "_totalZoomInteractions", a3) + 1);
}

- (void)didFocusInteraction
{
  -[CAMAnalyticsSessionEvent set_totalFocusInteractions:](self, "set_totalFocusInteractions:", -[CAMAnalyticsSessionEvent _totalFocusInteractions](self, "_totalFocusInteractions") + 1);
}

- (void)didFocusLockInteraction
{
  -[CAMAnalyticsSessionEvent set_totalFocusLockInteractions:](self, "set_totalFocusLockInteractions:", -[CAMAnalyticsSessionEvent _totalFocusLockInteractions](self, "_totalFocusLockInteractions") + 1);
}

- (void)didChangePortraitLighting
{
  -[CAMAnalyticsSessionEvent set_totalPortraitLightingChanges:](self, "set_totalPortraitLightingChanges:", -[CAMAnalyticsSessionEvent _totalPortraitLightingChanges](self, "_totalPortraitLightingChanges") + 1);
}

- (void)didPresentControlDrawerForReason:(int64_t)a3
{
  if (a3 != 2)
    -[CAMAnalyticsSessionEvent set_totalControlDrawerOpenings:](self, "set_totalControlDrawerOpenings:", -[CAMAnalyticsSessionEvent _totalControlDrawerOpenings](self, "_totalControlDrawerOpenings") + 1);
}

- (void)countEventsFromAnalyticsVisionSession:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[CAMAnalyticsSessionEvent set_totalMRCInteractions:](self, "set_totalMRCInteractions:", -[CAMAnalyticsSessionEvent _totalMRCInteractions](self, "_totalMRCInteractions")+ objc_msgSend(v4, "totalMRCInteractions"));
  v5 = objc_msgSend(v4, "totalTextInteractions");

  -[CAMAnalyticsSessionEvent set_totalTextInteractions:](self, "set_totalTextInteractions:", -[CAMAnalyticsSessionEvent _totalTextInteractions](self, "_totalTextInteractions") + v5);
}

- (void)publish
{
  objc_super v3;

  -[CAMAnalyticsSessionEvent _endSession](self, "_endSession");
  v3.receiver = self;
  v3.super_class = (Class)CAMAnalyticsSessionEvent;
  -[CAMAnalyticsEvent publish](&v3, sel_publish);
}

- (BOOL)didCapture
{
  return -[CAMAnalyticsSessionEvent _totalCaptures](self, "_totalCaptures") != 0;
}

- (void)_handleCallStatusMonitorDidChangeCallActive:(id)a3
{
  void *v4;
  int v5;

  -[CAMAnalyticsSessionEvent _callStatusMonitor](self, "_callStatusMonitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCallActive");

  if (v5)
    -[CAMAnalyticsSessionEvent set_hadActiveCall:](self, "set_hadActiveCall:", 1);
}

- (void)updateForLocationController:(id)a3
{
  unsigned int v4;
  __CFString *v5;
  id v6;

  if (a3)
  {
    v4 = objc_msgSend(a3, "lastKnownAuthorizationStatus");
    if (v4 > 4)
      v5 = 0;
    else
      v5 = off_1EA32F5D8[v4];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("locationAuthorizationStatus"));

  }
}

- (BOOL)_launchEventWithinReasonableTimeInterval
{
  double Current;
  double v4;

  Current = CFAbsoluteTimeGetCurrent();
  -[CAMAnalyticsSessionEvent _startTime](self, "_startTime");
  return Current - v4 < 0.2;
}

+ (id)_launchMethodToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1EA32F600[a3];
}

- (void)didLaunchWithURLConfigurationRequest:(id)a3
{
  int64_t v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  v4 = -[CAMAnalyticsSessionEvent _launchMethod](self, "_launchMethod");
  v5 = -[CAMAnalyticsSessionEvent _launchEventWithinReasonableTimeInterval](self, "_launchEventWithinReasonableTimeInterval");
  if (!v4 && v5)
  {
    -[CAMAnalyticsSessionEvent set_launchMethod:](self, "set_launchMethod:", 2);
    -[CAMAnalyticsSessionEvent set_firstConfiguredMode:](self, "set_firstConfiguredMode:", objc_msgSend(v6, "requestedCaptureMode"));
    -[CAMAnalyticsSessionEvent set_firstConfiguredDevice:](self, "set_firstConfiguredDevice:", objc_msgSend(v6, "requestedCaptureDevice"));
  }

}

- (void)didLaunchShortCutItemWithMode:(int64_t)a3 device:(int64_t)a4
{
  int64_t v7;
  _BOOL4 v8;

  v7 = -[CAMAnalyticsSessionEvent _launchMethod](self, "_launchMethod");
  v8 = -[CAMAnalyticsSessionEvent _launchEventWithinReasonableTimeInterval](self, "_launchEventWithinReasonableTimeInterval");
  if (!v7 && v8)
  {
    -[CAMAnalyticsSessionEvent set_launchMethod:](self, "set_launchMethod:", 1);
    -[CAMAnalyticsSessionEvent set_firstConfiguredMode:](self, "set_firstConfiguredMode:", a3);
    -[CAMAnalyticsSessionEvent set_firstConfiguredDevice:](self, "set_firstConfiguredDevice:", a4);
  }
}

- (CAMCaptureCapabilities)_capabilities
{
  return self->__capabilities;
}

- (NSString)_hostProcess
{
  return self->__hostProcess;
}

- (double)_startTime
{
  return self->__startTime;
}

- (NSString)_firstCaptureMode
{
  return self->__firstCaptureMode;
}

- (void)set_firstCaptureMode:(id)a3
{
  objc_storeStrong((id *)&self->__firstCaptureMode, a3);
}

- (NSString)_firstCaptureDevicePosition
{
  return self->__firstCaptureDevicePosition;
}

- (void)set_firstCaptureDevicePosition:(id)a3
{
  objc_storeStrong((id *)&self->__firstCaptureDevicePosition, a3);
}

- (double)_cameraRollStartTime
{
  return self->__cameraRollStartTime;
}

- (void)set_cameraRollStartTime:(double)a3
{
  self->__cameraRollStartTime = a3;
}

- (double)_cameraRollTotalTime
{
  return self->__cameraRollTotalTime;
}

- (void)set_cameraRollTotalTime:(double)a3
{
  self->__cameraRollTotalTime = a3;
}

- (BOOL)_isInCameraRoll
{
  return self->__inCameraRoll;
}

- (void)_setInCameraRoll:(BOOL)a3
{
  self->__inCameraRoll = a3;
}

- (int64_t)_cameraRollInteraction
{
  return self->__cameraRollInteraction;
}

- (void)set_cameraRollInteraction:(int64_t)a3
{
  self->__cameraRollInteraction = a3;
}

- (double)_previewStartTime
{
  return self->__previewStartTime;
}

- (void)set_previewStartTime:(double)a3
{
  self->__previewStartTime = a3;
}

- (double)_firstCaptureStartTime
{
  return self->__firstCaptureStartTime;
}

- (void)set_firstCaptureStartTime:(double)a3
{
  self->__firstCaptureStartTime = a3;
}

- (NSMutableDictionary)_captureCountsByMode
{
  return self->__captureCountsByMode;
}

- (NSMutableDictionary)_captureCountsByMediaType
{
  return self->__captureCountsByMediaType;
}

- (unint64_t)_totalControlDrawerOpenings
{
  return self->__totalControlDrawerOpenings;
}

- (void)set_totalControlDrawerOpenings:(unint64_t)a3
{
  self->__totalControlDrawerOpenings = a3;
}

- (unint64_t)_totalZoomInteractions
{
  return self->__totalZoomInteractions;
}

- (void)set_totalZoomInteractions:(unint64_t)a3
{
  self->__totalZoomInteractions = a3;
}

- (unint64_t)_totalFocusInteractions
{
  return self->__totalFocusInteractions;
}

- (void)set_totalFocusInteractions:(unint64_t)a3
{
  self->__totalFocusInteractions = a3;
}

- (unint64_t)_totalFocusLockInteractions
{
  return self->__totalFocusLockInteractions;
}

- (void)set_totalFocusLockInteractions:(unint64_t)a3
{
  self->__totalFocusLockInteractions = a3;
}

- (unint64_t)_totalPortraitLightingChanges
{
  return self->__totalPortraitLightingChanges;
}

- (void)set_totalPortraitLightingChanges:(unint64_t)a3
{
  self->__totalPortraitLightingChanges = a3;
}

- (unint64_t)_totalCaptures
{
  return self->__totalCaptures;
}

- (void)set_totalCaptures:(unint64_t)a3
{
  self->__totalCaptures = a3;
}

- (unint64_t)_totalTextInteractions
{
  return self->__totalTextInteractions;
}

- (void)set_totalTextInteractions:(unint64_t)a3
{
  self->__totalTextInteractions = a3;
}

- (unint64_t)_totalMRCInteractions
{
  return self->__totalMRCInteractions;
}

- (void)set_totalMRCInteractions:(unint64_t)a3
{
  self->__totalMRCInteractions = a3;
}

- (BOOL)_mrcDetectionEnabled
{
  return self->__mrcDetectionEnabled;
}

- (BOOL)_textDetectionEnabled
{
  return self->__textDetectionEnabled;
}

- (NSSet)_availableCaptureModes
{
  return self->__availableCaptureModes;
}

- (void)set_availableCaptureModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)_hadActiveCall
{
  return self->__hadActiveCall;
}

- (void)set_hadActiveCall:(BOOL)a3
{
  self->__hadActiveCall = a3;
}

- (CAMCallStatusMonitor)_callStatusMonitor
{
  return self->__callStatusMonitor;
}

- (int64_t)_launchMethod
{
  return self->__launchMethod;
}

- (void)set_launchMethod:(int64_t)a3
{
  self->__launchMethod = a3;
}

- (int64_t)_firstConfiguredMode
{
  return self->__firstConfiguredMode;
}

- (void)set_firstConfiguredMode:(int64_t)a3
{
  self->__firstConfiguredMode = a3;
}

- (int64_t)_firstConfiguredDevice
{
  return self->__firstConfiguredDevice;
}

- (void)set_firstConfiguredDevice:(int64_t)a3
{
  self->__firstConfiguredDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__callStatusMonitor, 0);
  objc_storeStrong((id *)&self->__availableCaptureModes, 0);
  objc_storeStrong((id *)&self->__captureCountsByMediaType, 0);
  objc_storeStrong((id *)&self->__captureCountsByMode, 0);
  objc_storeStrong((id *)&self->__firstCaptureDevicePosition, 0);
  objc_storeStrong((id *)&self->__firstCaptureMode, 0);
  objc_storeStrong((id *)&self->__hostProcess, 0);
  objc_storeStrong((id *)&self->__capabilities, 0);
}

@end
