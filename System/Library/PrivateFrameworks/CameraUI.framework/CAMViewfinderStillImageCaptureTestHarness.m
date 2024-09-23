@implementation CAMViewfinderStillImageCaptureTestHarness

- (CAMViewfinderStillImageCaptureTestHarness)initWithTestName:(id)a3 maxStillImageCount:(unint64_t)a4 expectedNumberOfCapturesPerRequest:(unint64_t)a5 viewfinderViewController:(id)a6 performingWarmupCapture:(BOOL)a7 forCaptureMode:(int64_t)a8 delayBetweenCaptures:(double)a9 capturesOnTouchDown:(BOOL)a10
{
  id v17;
  CAMViewfinderStillImageCaptureTestHarness *v18;
  NSCountedSet *v19;
  NSCountedSet *requestIDs;
  objc_super v22;

  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
  v18 = -[CAMPerformanceTestHarness initWithTestName:](&v22, sel_initWithTestName_, a3);
  if (v18)
  {
    v19 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    requestIDs = v18->__requestIDs;
    v18->__requestIDs = v19;

    v18->__performWarmupCapture = a7;
    v18->__maxStillImageCount = a4;
    v18->__waitingOnWarmupCapture = a7;
    v18->__expectedNumberOfResponsesPerRequest = a5;
    v18->__delayBetweenCaptures = a9;
    objc_storeStrong((id *)&v18->__viewfinderViewController, a6);
    v18->__capturesOnTouchDown = a10;
  }

  return v18;
}

- (void)startTesting
{
  void *v3;
  void *v4;
  objc_super v5;

  if (-[CAMViewfinderStillImageCaptureTestHarness isStillDuringVideo](self, "isStillDuringVideo"))
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isStillDuringVideoSupportedForMode:", -[CAMViewfinderStillImageCaptureTestHarness _mode](self, "_mode")) & 1) == 0)-[CAMViewfinderStillImageCaptureTestHarness failedTestWithReason:](self, "failedTestWithReason:", CFSTR("Stills during video is not supported for this device and mode"));

  }
  -[CAMViewfinderStillImageCaptureTestHarness testIntervalometer](self, "testIntervalometer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMViewfinderStillImageCaptureTestHarness _performWarmupCapture](self, "_performWarmupCapture"))
  {
    objc_msgSend(v4, "manuallyGenerateRequest");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
    -[CAMPerformanceTestHarness startTesting](&v5, sel_startTesting);
    objc_msgSend(v4, "startGeneratingRequests");
  }

}

- (void)stopTesting
{
  CAMViewfinderActionIntervalometer *testIntervalometer;
  void *v4;
  uint64_t v5;
  objc_super v6;

  testIntervalometer = self->_testIntervalometer;
  if (testIntervalometer)
  {
    self->_testIntervalometer = 0;

  }
  -[CAMViewfinderStillImageCaptureTestHarness _requestIDs](self, "_requestIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[CAMViewfinderStillImageCaptureTestHarness failedTestWithReason:](self, "failedTestWithReason:", CFSTR("Ended test before receiving all responses"));
  v6.receiver = self;
  v6.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
  -[CAMPerformanceTestHarness stopTesting](&v6, sel_stopTesting);
}

- (void)cancelTesting
{
  CAMViewfinderActionIntervalometer *testIntervalometer;
  CAMViewfinderActionIntervalometer *v4;
  objc_super v5;

  testIntervalometer = self->_testIntervalometer;
  if (testIntervalometer)
  {
    -[CAMViewfinderActionIntervalometer stopAttemptingActions](testIntervalometer, "stopAttemptingActions");
    v4 = self->_testIntervalometer;
    self->_testIntervalometer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
  -[CAMPerformanceTestHarness stopTesting](&v5, sel_stopTesting);
}

- (void)failedTestWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
  -[CAMPerformanceTestHarness failedTestWithReason:](&v6, sel_failedTestWithReason_, v4);

}

- (void)viewfinderViewController:(id)a3 didReceiveStillImageRequestDidStopCapturingStillImage:(id)a4
{
  self->__lastCaptureCompletionTime = CFAbsoluteTimeGetCurrent();
}

- (void)viewfinderViewController:(id)a3 didReceiveStillImageRequestDidCompleteStillImageCapture:(id)a4 withResponse:(id)a5 error:(id)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a6;
  objc_msgSend(a4, "persistenceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capture failed with error: %@"), v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMViewfinderStillImageCaptureTestHarness failedTestWithReason:](self, "failedTestWithReason:", v9);

  }
  -[CAMViewfinderStillImageCaptureTestHarness _requestIDs](self, "_requestIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v8);

  if (-[CAMViewfinderStillImageCaptureTestHarness _performWarmupCapture](self, "_performWarmupCapture"))
  {
    -[CAMViewfinderStillImageCaptureTestHarness _requestIDs](self, "_requestIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countForObject:", v8);

    if (!v12)
    {
      -[CAMViewfinderStillImageCaptureTestHarness set_performWarmupCapture:](self, "set_performWarmupCapture:", 0);
      -[CAMViewfinderStillImageCaptureTestHarness set_waitingOnWarmupCapture:](self, "set_waitingOnWarmupCapture:", 0);
      -[CAMViewfinderStillImageCaptureTestHarness startTesting](self, "startTesting");
    }
  }

}

- (void)viewfinderViewController:(id)a3 didReceiveStillImageRequestDidCompleteCapture:(id)a4 error:(id)a5
{
  id v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CAMViewfinderStillImageCaptureTestHarness *v11;

  v6 = a4;
  v7 = dispatch_time(0, 1000000000);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __122__CAMViewfinderStillImageCaptureTestHarness_viewfinderViewController_didReceiveStillImageRequestDidCompleteCapture_error___block_invoke;
  v9[3] = &unk_1EA328A40;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v9);

}

void __122__CAMViewfinderStillImageCaptureTestHarness_viewfinderViewController_didReceiveStillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistenceUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "_finalRequestPersistenceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 40), "_generatedRequestsCount");
    v6 = objc_msgSend(*(id *)(a1 + 40), "_maxStillImageCount");
    *(_DWORD *)buf = 138544130;
    v13 = v2;
    v14 = 2114;
    v15 = v4;
    v16 = 2048;
    v17 = v5;
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "CAMViewfinderStillImageCaptureTestHarness didReceiveStillImageRequestDidCompleteCapture, persistenceUUID:%{public}@, finalRequestPersistenceUUID:%{public}@, generatedRequestsCount:%ld, _maxStillImageCount:%ld", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not receive correct number of callbacks for %@"), v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_requestIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countForObject:", v2);

  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "failedTestWithReason:", v7);
  objc_msgSend(*(id *)(a1 + 40), "_finalRequestPersistenceUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v2, "isEqualToString:", v10);

  if (v11)
    objc_msgSend(*(id *)(a1 + 40), "stopTesting");

}

- (void)viewfinderViewController:(id)a3 willCaptureStillImageForRequest:(id)a4
{
  void *v5;
  NSObject *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "persistenceUUID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderStillImageCaptureTestHarness set_generatedRequestsCount:](self, "set_generatedRequestsCount:", -[CAMViewfinderStillImageCaptureTestHarness _generatedRequestsCount](self, "_generatedRequestsCount") + 1);
  v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543874;
    v11 = v5;
    v12 = 2048;
    v13 = -[CAMViewfinderStillImageCaptureTestHarness _generatedRequestsCount](self, "_generatedRequestsCount");
    v14 = 2048;
    v15 = -[CAMViewfinderStillImageCaptureTestHarness _maxStillImageCount](self, "_maxStillImageCount");
    _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "CAMViewfinderStillImageCaptureTestHarness willCaptureStillImageForRequest, persistenceUUID:%{public}@, generatedRequestsCount:%ld, _maxStillImageCount:%ld", (uint8_t *)&v10, 0x20u);
  }

  v7 = -[CAMViewfinderStillImageCaptureTestHarness _generatedRequestsCount](self, "_generatedRequestsCount");
  if (v7 == -[CAMViewfinderStillImageCaptureTestHarness _maxStillImageCount](self, "_maxStillImageCount"))
    -[CAMViewfinderStillImageCaptureTestHarness set_finalRequestPersistenceUUID:](self, "set_finalRequestPersistenceUUID:", v5);
  if (-[CAMViewfinderStillImageCaptureTestHarness _expectedNumberOfResponsesPerRequest](self, "_expectedNumberOfResponsesPerRequest"))
  {
    v8 = 0;
    do
    {
      -[CAMViewfinderStillImageCaptureTestHarness _requestIDs](self, "_requestIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v5);

      ++v8;
    }
    while (-[CAMViewfinderStillImageCaptureTestHarness _expectedNumberOfResponsesPerRequest](self, "_expectedNumberOfResponsesPerRequest") > v8);
  }

}

- (void)viewfinderViewController:(id)a3 didUpdateImageWellWithRequest:(id)a4 response:(id)a5 error:(id)a6
{
  uint64_t v7;
  void *v8;
  void (**v9)(void);

  -[CAMViewfinderStillImageCaptureTestHarness testIntervalometer](self, "testIntervalometer", a3, a4, a5, a6);
  v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "successfullActionCount");
  if (v7 == -[CAMViewfinderStillImageCaptureTestHarness _maxStillImageCount](self, "_maxStillImageCount"))
  {
    -[CAMViewfinderStillImageCaptureTestHarness didUpdateFinalThumbnailHandler](self, "didUpdateFinalThumbnailHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      return;
    -[CAMViewfinderStillImageCaptureTestHarness didUpdateFinalThumbnailHandler](self, "didUpdateFinalThumbnailHandler");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();
  }

}

- (BOOL)_allowOverlappingCaptures
{
  double v2;

  -[CAMViewfinderStillImageCaptureTestHarness _delayBetweenCaptures](self, "_delayBetweenCaptures");
  return v2 <= 0.0;
}

- (BOOL)shouldAttemptAction
{
  void *v3;
  char v4;
  BOOL result;
  double v6;
  double Current;
  double v8;
  double v9;
  double v10;

  -[CAMViewfinderStillImageCaptureTestHarness _viewfinderViewController](self, "_viewfinderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCapturingPhoto");

  result = -[CAMViewfinderStillImageCaptureTestHarness _allowOverlappingCaptures](self, "_allowOverlappingCaptures");
  if (!result && (v4 & 1) == 0)
  {
    -[CAMViewfinderStillImageCaptureTestHarness _lastCaptureCompletionTime](self, "_lastCaptureCompletionTime");
    if (v6 == 0.0)
    {
      return 1;
    }
    else
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[CAMViewfinderStillImageCaptureTestHarness _lastCaptureCompletionTime](self, "_lastCaptureCompletionTime");
      v9 = Current - v8;
      -[CAMViewfinderStillImageCaptureTestHarness _delayBetweenCaptures](self, "_delayBetweenCaptures");
      return v9 >= v10;
    }
  }
  return result;
}

- (BOOL)executeAction
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  v3 = -[CAMViewfinderStillImageCaptureTestHarness isStillDuringVideo](self, "isStillDuringVideo");
  -[CAMViewfinderStillImageCaptureTestHarness _viewfinderViewController](self, "_viewfinderViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "takeStillDuringVideoWithTouchUpDelay:", 0.1);
  else
    v6 = objc_msgSend(v4, "pressShutterButtonWithTouchUpDelay:", 0.1);
  v7 = v6;

  return v7;
}

- (CAMViewfinderActionIntervalometer)testIntervalometer
{
  return self->_testIntervalometer;
}

- (void)setTestIntervalometer:(id)a3
{
  objc_storeStrong((id *)&self->_testIntervalometer, a3);
}

- (id)didUpdateFinalThumbnailHandler
{
  return self->_didUpdateFinalThumbnailHandler;
}

- (void)setDidUpdateFinalThumbnailHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isStillDuringVideo
{
  return self->_stillDuringVideo;
}

- (void)setStillDuringVideo:(BOOL)a3
{
  self->_stillDuringVideo = a3;
}

- (BOOL)_performWarmupCapture
{
  return self->__performWarmupCapture;
}

- (void)set_performWarmupCapture:(BOOL)a3
{
  self->__performWarmupCapture = a3;
}

- (BOOL)_waitingOnWarmupCapture
{
  return self->__waitingOnWarmupCapture;
}

- (void)set_waitingOnWarmupCapture:(BOOL)a3
{
  self->__waitingOnWarmupCapture = a3;
}

- (NSString)_finalRequestPersistenceUUID
{
  return self->__finalRequestPersistenceUUID;
}

- (void)set_finalRequestPersistenceUUID:(id)a3
{
  objc_storeStrong((id *)&self->__finalRequestPersistenceUUID, a3);
}

- (int64_t)_mode
{
  return self->__mode;
}

- (void)set_mode:(int64_t)a3
{
  self->__mode = a3;
}

- (NSCountedSet)_requestIDs
{
  return self->__requestIDs;
}

- (void)set_requestIDs:(id)a3
{
  objc_storeStrong((id *)&self->__requestIDs, a3);
}

- (unint64_t)_receivedCallbackCount
{
  return self->__receivedCallbackCount;
}

- (void)set_receivedCallbackCount:(unint64_t)a3
{
  self->__receivedCallbackCount = a3;
}

- (unint64_t)_expectedNumberOfResponsesPerRequest
{
  return self->__expectedNumberOfResponsesPerRequest;
}

- (void)set_expectedNumberOfResponsesPerRequest:(unint64_t)a3
{
  self->__expectedNumberOfResponsesPerRequest = a3;
}

- (double)_delayBetweenCaptures
{
  return self->__delayBetweenCaptures;
}

- (void)set_delayBetweenCaptures:(double)a3
{
  self->__delayBetweenCaptures = a3;
}

- (double)_lastCaptureCompletionTime
{
  return self->__lastCaptureCompletionTime;
}

- (void)set_lastCaptureCompletionTime:(double)a3
{
  self->__lastCaptureCompletionTime = a3;
}

- (CAMViewfinderViewController)_viewfinderViewController
{
  return self->__viewfinderViewController;
}

- (void)set_viewfinderViewController:(id)a3
{
  objc_storeStrong((id *)&self->__viewfinderViewController, a3);
}

- (BOOL)_capturesOnTouchDown
{
  return self->__capturesOnTouchDown;
}

- (void)set_capturesOnTouchDown:(BOOL)a3
{
  self->__capturesOnTouchDown = a3;
}

- (unint64_t)_maxStillImageCount
{
  return self->__maxStillImageCount;
}

- (void)set_maxStillImageCount:(unint64_t)a3
{
  self->__maxStillImageCount = a3;
}

- (unint64_t)_generatedRequestsCount
{
  return self->__generatedRequestsCount;
}

- (void)set_generatedRequestsCount:(unint64_t)a3
{
  self->__generatedRequestsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__viewfinderViewController, 0);
  objc_storeStrong((id *)&self->__requestIDs, 0);
  objc_storeStrong((id *)&self->__finalRequestPersistenceUUID, 0);
  objc_storeStrong(&self->_didUpdateFinalThumbnailHandler, 0);
  objc_storeStrong((id *)&self->_testIntervalometer, 0);
}

@end
