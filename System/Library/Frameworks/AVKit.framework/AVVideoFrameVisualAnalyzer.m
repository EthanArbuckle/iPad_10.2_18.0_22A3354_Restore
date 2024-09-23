@implementation AVVideoFrameVisualAnalyzer

- (AVVideoFrameVisualAnalyzer)initWithPlayerController:(id)a3 playerLayer:(id)a4
{
  id v7;
  id v8;
  AVVideoFrameVisualAnalyzer *v9;
  id *p_isa;
  AVVideoFrameVisualAnalyzer *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13.receiver = self;
    v13.super_class = (Class)AVVideoFrameVisualAnalyzer;
    v9 = -[AVVideoFrameVisualAnalyzer init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_playerController, a3);
      objc_storeStrong(p_isa + 12, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[AVObservationController stopAllObservation](self->_playerObservationController, "stopAllObservation");
  -[VKCImageAnalyzer cancelAllRequests](self->_imageAnalyzer, "cancelAllRequests");
  -[AVVideoFrameVisualAnalyzer _resetAnalysis]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)AVVideoFrameVisualAnalyzer;
  -[AVVideoFrameVisualAnalyzer dealloc](&v3, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVVideoFrameVisualAnalyzer _updateObserversIfNeeded]((id *)&self->super.isa);
    -[AVVideoFrameVisualAnalyzer _updateActualEnabledStateIfNeeded](self);
  }
}

- (void)setPlayerLayer:(id)a3
{
  AVPlayerLayer *v5;
  AVPlayerLayer *v6;

  v5 = (AVPlayerLayer *)a3;
  if (self->_playerLayer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_playerLayer, a3);
    -[AVVideoFrameVisualAnalyzer _updateActualEnabledStateIfNeeded](self);
    v5 = v6;
  }

}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  AVPlayerController *v6;

  v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_playerController, a3);
    -[AVVideoFrameVisualAnalyzer _updateObserversIfNeeded]((id *)&self->super.isa);
    v5 = v6;
  }

}

- (void)setActuallyEnabled:(BOOL)a3
{
  if (self->_actuallyEnabled != a3)
  {
    self->_actuallyEnabled = a3;
    if (!a3)
    {
      -[VKCImageAnalyzer cancelAllRequests](self->_imageAnalyzer, "cancelAllRequests");
      -[AVVideoFrameVisualAnalyzer _resetAnalysis]((uint64_t)self);
    }
    -[AVVideoFrameVisualAnalyzer _updateObserversIfNeeded]((id *)&self->super.isa);
  }
}

- (VKCImageAnalyzer)imageAnalyzer
{
  VKCImageAnalyzer *imageAnalyzer;
  void *v4;
  objc_class *v5;
  VKCImageAnalyzer *v6;
  VKCImageAnalyzer *v7;
  VKCImageAnalyzer *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  imageAnalyzer = self->_imageAnalyzer;
  if (!imageAnalyzer)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v4 = (void *)getVKCImageAnalyzerClass_softClass_4314;
    v15 = getVKCImageAnalyzerClass_softClass_4314;
    if (!getVKCImageAnalyzerClass_softClass_4314)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getVKCImageAnalyzerClass_block_invoke_4315;
      v11[3] = &unk_1E5BB4748;
      v11[4] = &v12;
      __getVKCImageAnalyzerClass_block_invoke_4315((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v12, 8);
    v6 = (VKCImageAnalyzer *)objc_alloc_init(v5);
    v7 = self->_imageAnalyzer;
    self->_imageAnalyzer = v6;

    v8 = self->_imageAnalyzer;
    -[AVVideoFrameVisualAnalyzer _imageAnalysisQueue](self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalyzer setCallbackQueue:](v8, "setCallbackQueue:", v9);

    imageAnalyzer = self->_imageAnalyzer;
  }
  return imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalyzer, a3);
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (AVVideoFrameVisualAnalyzerDelegate)delegate
{
  return (AVVideoFrameVisualAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unint64_t)videoFrameAnalysisTypes
{
  return self->_videoFrameAnalysisTypes;
}

- (void)setVideoFrameAnalysisTypes:(unint64_t)a3
{
  self->_videoFrameAnalysisTypes = a3;
}

- (BOOL)actuallyEnabled
{
  return self->_actuallyEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_lastAnalysis, 0);
  objc_storeStrong((id *)&self->_timeObservingTimer, 0);
  objc_storeStrong((id *)&self->_playerObservationController, 0);
}

- (id)_imageAnalysisQueue
{
  if (a1)
  {
    if (_imageAnalysisQueue_once != -1)
      dispatch_once(&_imageAnalysisQueue_once, &__block_literal_global_28);
    a1 = (id)_imageAnalysisQueue_videoFrameAnalysisQueue;
  }
  return a1;
}

void __49__AVVideoFrameVisualAnalyzer__imageAnalysisQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.avkit.videoframe-analysis", attr);
  v2 = (void *)_imageAnalysisQueue_videoFrameAnalysisQueue;
  _imageAnalysisQueue_videoFrameAnalysisQueue = (uint64_t)v1;

}

- (void)_resetAnalysis
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v2 = MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a1 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v2;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(v2 + 16);
    if (*(_DWORD *)(a1 + 16))
    {
      objc_msgSend((id)a1, "imageAnalyzer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "cancelRequestID:", *(unsigned int *)(a1 + 16));

      *(_DWORD *)(a1 + 16) = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend((id)a1, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        objc_msgSend((id)a1, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "videoFrameVisualAnalyzerDidFinishAnalyzingVideoFrame:withAnalysis:", a1, 0);

      }
    }
    v7 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

  }
}

- (void)_updateObserversIfNeeded
{
  int v2;
  int v3;
  id v4;
  AVObservationController *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(a1, "enabled");
    v3 = objc_msgSend(a1, "actuallyEnabled");
    v4 = a1[1];
    if (!v4)
    {
      v5 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", a1);
      v6 = a1[1];
      a1[1] = v5;

      v4 = a1[1];
    }
    objc_msgSend(v4, "stopAllObservation");
    v7 = v12;
    if (v2 && v12)
    {
      v8 = (id)objc_msgSend(a1[1], "startObserving:keyPath:includeInitialValue:observationHandler:", v12, CFSTR("currentAssetIfReady"), 0, &__block_literal_global_4323);
      v7 = v12;
    }
    if (v7)
    {
      if (((v3 ^ 1) & 1) == 0)
      {
        v9 = (id)objc_msgSend(a1[1], "startObserving:keyPath:includeInitialValue:observationHandler:", v12, CFSTR("activeRate"), 1, &__block_literal_global_11);
        objc_msgSend(a1[1], "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerCurrentTimeJumpedNotification"), 0, 0, &__block_literal_global_13);
        v10 = (id)objc_msgSend(a1[1], "startObserving:keyPath:includeInitialValue:observationHandler:", v12, CFSTR("player.currentItem.videoComposition"), 1, &__block_literal_global_16);
        v11 = (id)objc_msgSend(a1[1], "startObserving:keyPath:includeInitialValue:observationHandler:", v12, CFSTR("preferredTransform"), 1, &__block_literal_global_19);
        v7 = v12;
      }
    }

  }
}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke_5(uint64_t a1, uint64_t a2)
{
  -[AVVideoFrameVisualAnalyzer _updateAnalysisIfNeeded](a2);
}

- (void)_updateAnalysisIfNeeded
{
  void *v2;
  double v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (a1)
  {
    objc_msgSend((id)a1, "playerController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[AVVideoFrameVisualAnalyzer _resetAnalysis](a1);
    objc_msgSend(v8, "activeRate");
    v2 = v8;
    if (v3 == 0.0)
    {
      objc_msgSend(v8, "currentTime");
      *(_QWORD *)(a1 + 24) = v4;
      if (-[AVVideoFrameVisualAnalyzer _canStartAnalysis](a1))
      {
        if (-[AVVideoFrameVisualAnalyzer _canStartAnalysis](a1))
        {
          objc_msgSend(*(id *)(a1 + 32), "invalidate");
          objc_initWeak(&location, (id)a1);
          v5 = (void *)MEMORY[0x1E0C99E88];
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __62__AVVideoFrameVisualAnalyzer__setupTimeObservingTimerIfNeeded__block_invoke;
          v9[3] = &unk_1E5BB49A8;
          objc_copyWeak(&v10, &location);
          objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, 0.25);
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v6;

          objc_destroyWeak(&v10);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 80), "cancelAllRequests");
        -[AVVideoFrameVisualAnalyzer _resetAnalysis](a1);
      }
      v2 = v8;
    }

  }
}

- (BOOL)_canStartAnalysis
{
  void *v2;
  char v3;
  BOOL v4;
  double v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  char v12;
  char v13;
  _BOOL4 v14;
  _BOOL8 v15;
  CMTime v17;

  objc_msgSend((id)a1, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)a1, "actuallyEnabled");
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "activeRate");
    v4 = v5 != 0.0;
  }
  v6 = *(_DWORD *)(a1 + 52);
  v17 = *(CMTime *)(a1 + 40);
  v7 = CMTimeGetSeconds(&v17) != *(double *)(a1 + 24) && *(_QWORD *)(a1 + 64) == 0;
  objc_msgSend((id)a1, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentAssetIfReady");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasProtectedContent");

  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
    v12 = 0;
  else
    v12 = v3;
  v13 = v12 ^ 1 | v10 | v4;
  v14 = (v6 & 1) == 0 && v7;
  v15 = (v13 & 1) == 0 && v14;

  return v15;
}

void __62__AVVideoFrameVisualAnalyzer__setupTimeObservingTimerIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  _BOOL4 canStart;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _Unwind_Exception *v18;
  id *val;
  __int128 block;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id location[2];
  __int128 v32;
  __int128 v33;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    val = WeakRetained;
    canStart = -[AVVideoFrameVisualAnalyzer _canStartAnalysis]((uint64_t)WeakRetained);
    v2 = val;
    if (canStart)
    {
      objc_msgSend(val[10], "cancelAllRequests");
      -[AVVideoFrameVisualAnalyzer _resetAnalysis]((uint64_t)val);
      objc_msgSend(val, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activePlayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "currentItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v26 = 0uLL;
      v27 = 0;
      if (v6)
        objc_msgSend(v6, "currentTime");
      v32 = 0u;
      v33 = 0u;
      *(_OWORD *)location = 0u;
      v8 = val[11];
      if (v8)
      {
        objc_msgSend(v8, "preferredTransform");
        v8 = val[11];
      }
      objc_msgSend(v8, "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "videoComposition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = 0;
      }
      else
      {
        v28 = *(_OWORD *)location;
        v29 = v32;
        v30 = v33;
        *(_QWORD *)&block = 0;
        *((_QWORD *)&block + 1) = &block;
        *(_QWORD *)&v21 = 0x2020000000;
        v13 = getvk_imageOrientationFromTransformSymbolLoc_ptr;
        *((_QWORD *)&v21 + 1) = getvk_imageOrientationFromTransformSymbolLoc_ptr;
        if (!getvk_imageOrientationFromTransformSymbolLoc_ptr)
        {
          v14 = (void *)VisionKitCoreLibrary();
          v13 = dlsym(v14, "vk_imageOrientationFromTransform");
          *(_QWORD *)(*((_QWORD *)&block + 1) + 24) = v13;
          getvk_imageOrientationFromTransformSymbolLoc_ptr = v13;
        }
        _Block_object_dispose(&block, 8);
        if (!v13)
        {
          dlerror();
          v18 = (_Unwind_Exception *)abort_report_np();
          _Block_object_dispose(&block, 8);
          _Unwind_Resume(v18);
        }
        block = v28;
        v21 = v29;
        v22 = v30;
        v12 = ((uint64_t (*)(__int128 *))v13)(&block);
      }

      objc_msgSend(val, "playerLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, val);
      -[AVVideoFrameVisualAnalyzer _imageAnalysisQueue](val);
      v16 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&block = MEMORY[0x1E0C809B0];
      *((_QWORD *)&block + 1) = 3221225472;
      *(_QWORD *)&v21 = __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke;
      *((_QWORD *)&v21 + 1) = &unk_1E5BB1158;
      objc_copyWeak((id *)&v22 + 1, location);
      v24 = v26;
      v25 = v27;
      *(_QWORD *)&v22 = v15;
      v23 = v12;
      v17 = v15;
      dispatch_async(v16, &block);

      objc_destroyWeak((id *)&v22 + 1);
      objc_destroyWeak(location);

      v2 = val;
    }
  }

}

void __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke(uint64_t a1)
{
  id *v2;
  char *WeakRetained;
  uint64_t v4;
  __CVBuffer *v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = (id *)(a1 + 40);
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "copyDisplayedPixelBuffer");
    if (v4)
    {
      v5 = (__CVBuffer *)v4;
      v6 = *(_OWORD *)(a1 + 56);
      *((_QWORD *)WeakRetained + 7) = *(_QWORD *)(a1 + 72);
      *(_OWORD *)(WeakRetained + 40) = v6;
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v7 = (void *)getVKCImageAnalyzerRequestClass_softClass;
      v18 = getVKCImageAnalyzerRequestClass_softClass;
      v8 = MEMORY[0x1E0C809B0];
      if (!getVKCImageAnalyzerRequestClass_softClass)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __getVKCImageAnalyzerRequestClass_block_invoke;
        v14[3] = &unk_1E5BB4748;
        v14[4] = &v15;
        __getVKCImageAnalyzerRequestClass_block_invoke((uint64_t)v14);
        v7 = (void *)v16[3];
      }
      v9 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v15, 8);
      v10 = (void *)objc_msgSend([v9 alloc], "initWithCVPixelBuffer:orientation:requestType:", v5, *(_QWORD *)(a1 + 48), (8 * *((_QWORD *)WeakRetained + 14)) & 0x20 | (*((_QWORD *)WeakRetained + 14) >> 1) & 1 | (16 * ((*((_QWORD *)WeakRetained + 14) >> 3) & 1)) | (*((_QWORD *)WeakRetained + 14) >> 2) & 4);
      objc_msgSend(v10, "setImageSource:", 2);
      CVPixelBufferRelease(v5);
      objc_msgSend(WeakRetained, "imageAnalyzer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_2;
      v12[3] = &unk_1E5BB1130;
      objc_copyWeak(&v13, v2);
      *((_DWORD *)WeakRetained + 4) = objc_msgSend(v11, "processRequest:progressHandler:completionHandler:", v10, 0, v12);

      objc_destroyWeak(&v13);
    }
  }

}

void __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_3;
  block[3] = &unk_1E5BB4770;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3;
  v5 = v2;
  v6 = v5;
  if (WeakRetained)
  {
    *((_DWORD *)WeakRetained + 4) = 0;
    if (v5)
    {
      objc_msgSend(WeakRetained, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "videoFrameVisualAnalyzerFailedAnalyzingVideoFrame:withError:", WeakRetained, v6);

      }
      -[AVVideoFrameVisualAnalyzer _resetAnalysis]((uint64_t)WeakRetained);
    }
    else if (v4)
    {
      v10 = *((_QWORD *)WeakRetained + 14);
      if ((objc_msgSend(v4, "hasResultsForAnalysisTypes:", (8 * (int)v10) & 0x20 | (v10 >> 1) & 1 | (16 * ((v10 >> 3) & 1)) | (v10 >> 2) & 4) & 1) != 0|| (v10 & 4) != 0)
      {
        objc_msgSend(WeakRetained, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0)
        {
          objc_msgSend(WeakRetained, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "videoFrameVisualAnalyzerDidFinishAnalyzingVideoFrame:withAnalysis:", WeakRetained, v4);

        }
        objc_storeStrong((id *)WeakRetained + 8, v3);
      }
    }
  }

}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke_4(uint64_t a1, uint64_t a2)
{
  -[AVVideoFrameVisualAnalyzer _updateAnalysisIfNeeded](a2);
}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  -[AVVideoFrameVisualAnalyzer _updateAnalysisIfNeeded](a2);
}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  -[AVVideoFrameVisualAnalyzer _updateAnalysisIfNeeded](a2);
}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke(uint64_t a1, _QWORD *a2)
{
  -[AVVideoFrameVisualAnalyzer _updateActualEnabledStateIfNeeded](a2);
}

- (void)_updateActualEnabledStateIfNeeded
{
  void *v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentAssetIfReady");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(a1, "enabled");
    if (v6)
      v4 = v3;
    else
      v4 = 0;
    if (a1[12])
      v5 = v4;
    else
      v5 = 0;
    objc_msgSend(a1, "setActuallyEnabled:", v5);

  }
}

+ (BOOL)analysis:(id)a3 containsVideoFrameAnalysisType:(unint64_t)a4
{
  return objc_msgSend(a3, "hasResultsForAnalysisTypes:", (8 * (int)a4) & 0x20 | (a4 >> 1) & 1 | (16 * ((a4 >> 3) & 1)) | (a4 >> 2) & 4);
}

@end
