@implementation CAMViewfinderVideoCaptureTestHarness

- (CAMViewfinderVideoCaptureTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 videoDurationInSeconds:(double)a5 initialDelayInSeconds:(double)a6 captureCTMVideo:(BOOL)a7
{
  id v13;
  CAMViewfinderVideoCaptureTestHarness *v14;
  CAMViewfinderVideoCaptureTestHarness *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CAMViewfinderVideoCaptureTestHarness;
  v14 = -[CAMPerformanceTestHarness initWithTestName:](&v17, sel_initWithTestName_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->__viewfinderViewController, a4);
    v15->__videoDurationInSeconds = a5;
    v15->__initialDelayInSeconds = a6;
    v15->__captureCTMVideo = a7;
  }

  return v15;
}

- (void)startTesting
{
  double v3;
  dispatch_time_t v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMViewfinderVideoCaptureTestHarness;
  -[CAMPerformanceTestHarness startTesting](&v6, sel_startTesting);
  -[CAMViewfinderVideoCaptureTestHarness _initialDelayInSeconds](self, "_initialDelayInSeconds");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CAMViewfinderVideoCaptureTestHarness_startTesting__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

void __52__CAMViewfinderVideoCaptureTestHarness_startTesting__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  char v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_viewfinderViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_captureCTMVideo"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_videoDurationInSeconds");
    v3 = v2;
  }
  else
  {
    v3 = 0.2;
  }
  v4 = objc_msgSend(v6, "pressShutterButtonWithTouchUpDelay:shutterBehavior:", objc_msgSend(*(id *)(a1 + 32), "_captureCTMVideo"), v3);
  v5 = *(void **)(a1 + 32);
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "startSubtestWithName:withMetrics:", CFSTR("TimeToStartRecording"), &unk_1EA3B2F00);
  else
    objc_msgSend(v5, "failedTestWithReason:", CFSTR("Unable to start video recording"));

}

- (void)viewfinderViewController:(id)a3 didReceiveVideoRequestDidCompleteCapture:(id)a4 withResponse:(id)a5 error:(id)a6
{
  -[CAMViewfinderVideoCaptureTestHarness _endCaptureWithError:](self, "_endCaptureWithError:", a6, a4, a5);
}

- (void)stillImageRequestsWillRequestCTMVideoCaptureEndForViewfinderViewController:(id)a3
{
  -[CAMViewfinderVideoCaptureTestHarness _endCaptureWithError:](self, "_endCaptureWithError:", 0);
}

- (void)_startCapture
{
  void *v3;
  void *v4;
  void (**v5)(void);
  double v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  CAMViewfinderVideoCaptureTestHarness *v10;

  -[CAMViewfinderVideoCaptureTestHarness _viewfinderViewController](self, "_viewfinderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPerformanceTestHarness stopSubtestWithName:](self, "stopSubtestWithName:", CFSTR("TimeToStartRecording"));
  -[CAMViewfinderVideoCaptureTestHarness startVideoHandler](self, "startVideoHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAMViewfinderVideoCaptureTestHarness startVideoHandler](self, "startVideoHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  if (!-[CAMViewfinderVideoCaptureTestHarness _captureCTMVideo](self, "_captureCTMVideo"))
  {
    -[CAMViewfinderVideoCaptureTestHarness _videoDurationInSeconds](self, "_videoDurationInSeconds");
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__CAMViewfinderVideoCaptureTestHarness__startCapture__block_invoke;
    v8[3] = &unk_1EA328A40;
    v9 = v3;
    v10 = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __53__CAMViewfinderVideoCaptureTestHarness__startCapture__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "pressShutterButtonWithTouchUpDelay:", 0.2);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "failedTestWithReason:", CFSTR("Unable to end video recording"));
  return result;
}

- (void)_endCaptureWithError:(id)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CAMViewfinderVideoCaptureTestHarness endVideoHandler](self, "endVideoHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAMViewfinderVideoCaptureTestHarness endVideoHandler](self, "endVideoHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  if (v9)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Error from videoRequestDidCompleteCapture: %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPerformanceTestHarness failedTestWithReason:](self, "failedTestWithReason:", v8);

  }
  else
  {
    -[CAMPerformanceTestHarness stopTesting](self, "stopTesting");
  }

}

- (id)startVideoHandler
{
  return self->_startVideoHandler;
}

- (void)setStartVideoHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)endVideoHandler
{
  return self->_endVideoHandler;
}

- (void)setEndVideoHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CAMViewfinderViewController)_viewfinderViewController
{
  return self->__viewfinderViewController;
}

- (void)set_viewfinderViewController:(id)a3
{
  objc_storeStrong((id *)&self->__viewfinderViewController, a3);
}

- (double)_videoDurationInSeconds
{
  return self->__videoDurationInSeconds;
}

- (double)_initialDelayInSeconds
{
  return self->__initialDelayInSeconds;
}

- (BOOL)_captureCTMVideo
{
  return self->__captureCTMVideo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__viewfinderViewController, 0);
  objc_storeStrong(&self->_endVideoHandler, 0);
  objc_storeStrong(&self->_startVideoHandler, 0);
}

@end
