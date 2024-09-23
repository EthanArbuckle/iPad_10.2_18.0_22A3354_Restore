@implementation CAMIntervalometerTestHarness

- (CAMIntervalometerTestHarness)initWithTestName:(id)a3 expectedNumberOfCapturesPerRequest:(unint64_t)a4 captureController:(id)a5 performingWarmupCapture:(BOOL)a6 forCaptureMode:(int64_t)a7 delayBetweenCaptures:(double)a8
{
  id v15;
  CAMIntervalometerTestHarness *v16;
  CAMIntervalometerTestHarness *v17;
  uint64_t v18;
  NSMutableDictionary *numberOfResponsesForRequest;
  objc_super v21;

  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CAMIntervalometerTestHarness;
  v16 = -[CAMPerformanceTestHarness initWithTestName:](&v21, sel_initWithTestName_, a3);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_captureController, a5);
    v17->_mode = a7;
    v17->_expectedNumberOfResponsesPerRequest = a4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    numberOfResponsesForRequest = v17->_numberOfResponsesForRequest;
    v17->_numberOfResponsesForRequest = (NSMutableDictionary *)v18;

    v17->_performWarmupCapture = a6;
    v17->_delayBetweenCaptures = a8;
    v17->_lastCaptureCompletionTime = 0.0;
  }

  return v17;
}

- (void)startTesting
{
  id v3;
  objc_super v4;

  if (self->_performWarmupCapture)
  {
    -[CAMIntervalometerTestHarness testIntervalometer](self, "testIntervalometer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "manuallyGenerateRequest");

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CAMIntervalometerTestHarness;
    -[CAMPerformanceTestHarness startTesting](&v4, sel_startTesting);
    -[CAMCaptureRequestIntervalometer startGeneratingRequests](self->_testIntervalometer, "startGeneratingRequests");
  }
}

- (void)stopTesting
{
  CAMCaptureRequestIntervalometer *testIntervalometer;
  BOOL v4;
  id v5;
  objc_super v6;
  id v7;

  testIntervalometer = self->_testIntervalometer;
  if (testIntervalometer)
  {
    self->_testIntervalometer = 0;

  }
  v7 = 0;
  v4 = -[CAMIntervalometerTestHarness _hasReceivedExpectedNumberOfResponsesForRequestsWithFailureReason:](self, "_hasReceivedExpectedNumberOfResponsesForRequestsWithFailureReason:", &v7);
  v5 = v7;
  if (!v4)
    -[CAMIntervalometerTestHarness failedTestWithReason:](self, "failedTestWithReason:", v5);
  v6.receiver = self;
  v6.super_class = (Class)CAMIntervalometerTestHarness;
  -[CAMPerformanceTestHarness stopTesting](&v6, sel_stopTesting);

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
  v6.super_class = (Class)CAMIntervalometerTestHarness;
  -[CAMPerformanceTestHarness failedTestWithReason:](&v6, sel_failedTestWithReason_, v4);

}

- (void)stillImageRequestDidStopCapturingStillImage:(id)a3
{
  self->_lastCaptureCompletionTime = CFAbsoluteTimeGetCurrent();
}

- (void)stillImageRequestDidCompleteStillImageCapture:(id)a3 withResponse:(id)a4 error:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  objc_msgSend(a3, "persistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capture failed with error: %@"), v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMIntervalometerTestHarness failedTestWithReason:](self, "failedTestWithReason:", v8);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_numberOfResponsesForRequest, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_numberOfResponsesForRequest, "setObject:forKeyedSubscript:", v10, v7);

  if (self->_performWarmupCapture
    && -[CAMIntervalometerTestHarness _hasReceivedExpectedNumberOfResponsesForPersistenceUUID:failureReason:](self, "_hasReceivedExpectedNumberOfResponsesForPersistenceUUID:failureReason:", v7, 0))
  {
    self->_performWarmupCapture = 0;
    self->_waitingOnWarmupCapture = 0;
    -[CAMIntervalometerTestHarness startTesting](self, "startTesting");
  }

}

- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4
{
  id v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  v6 = dispatch_time(0, 1000000000);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CAMIntervalometerTestHarness_stillImageRequestDidCompleteCapture_error___block_invoke;
  v8[3] = &unk_1EA328A40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v8);

}

void __74__CAMIntervalometerTestHarness_stillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "persistenceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = objc_msgSend(v2, "_hasReceivedExpectedNumberOfResponsesForPersistenceUUID:failureReason:", v3, &v8);
  v5 = v8;

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "failedTestWithReason:", v5);
  objc_msgSend(*(id *)(a1 + 40), "persistenceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "stopTesting");

}

- (BOOL)_allowOverlappingCaptures
{
  return self->_delayBetweenCaptures <= 0.0;
}

- (BOOL)_shouldDelayBeforeCapturing
{
  if (-[CAMIntervalometerTestHarness _allowOverlappingCaptures](self, "_allowOverlappingCaptures"))
    return 0;
  if (-[CUCaptureController isCapturingStillImage](self->_captureController, "isCapturingStillImage"))
    return 1;
  return self->_lastCaptureCompletionTime != 0.0
      && CFAbsoluteTimeGetCurrent() - self->_lastCaptureCompletionTime < self->_delayBetweenCaptures;
}

- (BOOL)intervalometer:(id)a3 didGenerateCaptureRequest:(id)a4
{
  id v5;
  CUCaptureController *v6;
  BOOL v7;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  id v13;
  id v14;
  _BOOL4 v15;
  id v16;
  _BOOL4 v17;
  _BOOL4 performWarmupCapture;
  NSMutableDictionary *numberOfResponsesForRequest;
  void *v20;
  id v21;
  id v22;
  id v23;

  v5 = a4;
  v6 = self->_captureController;
  if (!self->_waitingOnWarmupCapture
    && !-[CAMIntervalometerTestHarness _shouldDelayBeforeCapturing](self, "_shouldDelayBeforeCapturing")
    && (-[CUCaptureController isCaptureAvailable](v6, "isCaptureAvailable")
     || !-[CAMIntervalometerTestHarness _allowOverlappingCaptures](self, "_allowOverlappingCaptures")))
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCTMVideoCaptureSupportedForMode:", self->_mode);

    if (v11)
    {
      objc_msgSend(v9, "setUserInitiationTime:", mach_absolute_time());
      objc_msgSend(v9, "setCtmCaptureType:", 1);
      v23 = 0;
      v12 = -[CUCaptureController initiateCTMCaptureWithSettings:error:](v6, "initiateCTMCaptureWithSettings:error:", v9, &v23);
      v13 = v23;
      v14 = v13;
      if (!v12)
        goto LABEL_21;
      v22 = v13;
      v15 = -[CUCaptureController commitCTMCaptureWithRequest:error:](v6, "commitCTMCaptureWithRequest:error:", v9, &v22);
      v16 = v22;

      v14 = v16;
    }
    else
    {
      v21 = 0;
      v15 = -[CUCaptureController captureStillImageWithRequest:error:](v6, "captureStillImageWithRequest:error:", v9, &v21);
      v14 = v21;
    }
    if (v14)
      v17 = 0;
    else
      v17 = v15;
    performWarmupCapture = self->_performWarmupCapture;
    if (self->_performWarmupCapture && v17)
    {
      v14 = 0;
      self->_waitingOnWarmupCapture = 1;
      performWarmupCapture = self->_performWarmupCapture;
    }
    if (performWarmupCapture)
      v17 = 0;
    if (v17)
    {
      numberOfResponsesForRequest = self->_numberOfResponsesForRequest;
      objc_msgSend(v5, "persistenceUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](numberOfResponsesForRequest, "setObject:forKeyedSubscript:", &unk_1EA3B1270, v20);

      v7 = 1;
LABEL_22:

      goto LABEL_4;
    }
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  v7 = 0;
LABEL_4:

  return v7;
}

- (void)intervalometer:(id)a3 didReachMaximumCountWithRequest:(id)a4
{
  NSString *v5;
  NSString *finalRequestPersistenceUUID;

  objc_msgSend(a4, "persistenceUUID", a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  finalRequestPersistenceUUID = self->_finalRequestPersistenceUUID;
  self->_finalRequestPersistenceUUID = v5;

}

- (BOOL)_hasReceivedExpectedNumberOfResponsesForPersistenceUUID:(id)a3 failureReason:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t expectedNumberOfResponsesPerRequest;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_numberOfResponsesForRequest, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = v8;
  expectedNumberOfResponsesPerRequest = self->_expectedNumberOfResponsesPerRequest;
  if (a4 && v8 != expectedNumberOfResponsesPerRequest)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not receive the expected number of reponses for the given test (%lu instead of %lu for persistenceUUID %@)"), v8, expectedNumberOfResponsesPerRequest, v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 == expectedNumberOfResponsesPerRequest;
}

- (BOOL)_hasReceivedExpectedNumberOfResponsesForRequestsWithFailureReason:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_numberOfResponsesForRequest, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!-[CAMIntervalometerTestHarness _hasReceivedExpectedNumberOfResponsesForPersistenceUUID:failureReason:](self, "_hasReceivedExpectedNumberOfResponsesForPersistenceUUID:failureReason:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), a3))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (CAMCaptureRequestIntervalometer)testIntervalometer
{
  return self->_testIntervalometer;
}

- (void)setTestIntervalometer:(id)a3
{
  objc_storeStrong((id *)&self->_testIntervalometer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testIntervalometer, 0);
  objc_storeStrong((id *)&self->_numberOfResponsesForRequest, 0);
  objc_storeStrong((id *)&self->_finalRequestPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_captureController, 0);
}

@end
