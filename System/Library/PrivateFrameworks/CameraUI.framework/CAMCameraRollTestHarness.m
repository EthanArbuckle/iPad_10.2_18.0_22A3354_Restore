@implementation CAMCameraRollTestHarness

- (CAMCameraRollTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 testingAnimation:(BOOL)a5 testingWarmPresentation:(BOOL)a6 awaitPreload:(BOOL)a7 settlingDelay:(double)a8
{
  id v15;
  CAMCameraRollTestHarness *v16;
  CAMCameraRollTestHarness *v17;
  CAMCameraRollTestHarness *v18;
  objc_super v20;

  v15 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMCameraRollTestHarness;
  v16 = -[CAMPerformanceTestHarness initWithTestName:](&v20, sel_initWithTestName_, a3);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_viewfinderViewController, a4);
    v17->_awaitPreload = a7;
    v17->_settlingDelay = a8;
    v17->_testingWarmPresentation = a6;
    v17->_testingAnimation = a5;
    v18 = v17;
  }

  return v17;
}

- (void)startTesting
{
  BOOL v3;
  _BOOL4 v4;
  _BOOL4 v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  double v20;
  _QWORD aBlock[5];
  BOOL v22;

  v3 = -[CAMCameraRollTestHarness isTestingAnimation](self, "isTestingAnimation");
  v4 = -[CAMCameraRollTestHarness awaitPreload](self, "awaitPreload");
  v5 = -[CAMCameraRollTestHarness testingWarmPresentation](self, "testingWarmPresentation");
  -[CAMCameraRollTestHarness settlingDelay](self, "settlingDelay");
  v7 = v6;
  -[CAMCameraRollTestHarness viewfinderViewController](self, "viewfinderViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCameraRollControllerTestDelegate:", self);

  if (v5)
  {
    -[CAMCameraRollTestHarness _presentCameraRollAnimated](self, "_presentCameraRollAnimated");
    -[CAMCameraRollTestHarness _dismissCameraRollImmediately](self, "_dismissCameraRollImmediately");
  }
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CAMCameraRollTestHarness_startTesting__block_invoke;
  aBlock[3] = &unk_1EA328908;
  aBlock[4] = self;
  v22 = v3;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v11 = v10;
  if (v7 > 0.0)
  {
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __40__CAMCameraRollTestHarness_startTesting__block_invoke_3;
    v18[3] = &unk_1EA328F58;
    v20 = v7;
    v19 = v10;
    v11 = (void (**)(_QWORD))_Block_copy(v18);

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "cameraRollController");
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __40__CAMCameraRollTestHarness_startTesting__block_invoke_4;
    v15[3] = &unk_1EA328F80;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    v14 = v16;
    v11 = (void (**)(_QWORD))_Block_copy(v15);

  }
  v11[2](v11);

}

void __40__CAMCameraRollTestHarness_startTesting__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)CAMCameraRollTestHarness;
  objc_msgSendSuper2(&v5, sel_startTesting);
  objc_msgSend(*(id *)(a1 + 32), "_presentCameraRollAnimated");
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handlePUDisplayLinkStarted_, *MEMORY[0x1E0D7D250], 0);

  }
  else
  {
    v3 = (void *)*MEMORY[0x1E0DC4730];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__CAMCameraRollTestHarness_startTesting__block_invoke_2;
    v4[3] = &unk_1EA328868;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "installCACommitCompletionBlock:", v4);
  }
}

uint64_t __40__CAMCameraRollTestHarness_startTesting__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopTesting");
}

void __40__CAMCameraRollTestHarness_startTesting__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  dispatch_after(v2, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __40__CAMCameraRollTestHarness_startTesting__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ppt_awaitPreload:", *(_QWORD *)(a1 + 40));
}

- (void)stopTesting
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMCameraRollTestHarness;
  -[CAMPerformanceTestHarness stopTesting](&v4, sel_stopTesting);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CAMCameraRollTestHarness _dismissCameraRollImmediately](self, "_dismissCameraRollImmediately");
}

- (void)_handlePUDisplayLinkStarted:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  -[CAMCameraRollTestHarness viewfinderViewController](self, "viewfinderViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = v5;
    v7 = MEMORY[0x1E0C809B0];
    v8 = (void *)*MEMORY[0x1E0DC4730];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke;
    v12[3] = &unk_1EA328868;
    v12[4] = self;
    objc_msgSend(v8, "installCACommitCompletionBlock:", v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke_2;
    v10[3] = &unk_1EA328A40;
    v10[4] = self;
    v11 = v6;
    v9 = v6;
    objc_msgSend(v9, "ppt_installTransitionAnimationCompletionHandler:", v10);

  }
}

uint64_t __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startSubtestWithName:", CFSTR("animation"));
}

void __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "stopSubtestWithName:", CFSTR("animation"));
  objc_msgSend(*(id *)(a1 + 40), "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke_3;
  v3[3] = &unk_1EA328A68;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout:handler:", v3, 30.0);

}

uint64_t __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke_3(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    objc_msgSend(v3, "stopSubtestWithName:", CFSTR("TimeToSharp"));
    v3 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v3, "stopTesting");
}

- (void)_presentCameraRollAnimated
{
  id v3;

  -[CAMCameraRollTestHarness viewfinderViewController](self, "viewfinderViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMPerformanceTestHarness startSubtestWithName:withMetrics:](self, "startSubtestWithName:withMetrics:", CFSTR("TimeToSharp"), &unk_1EA3B2E88);
  objc_msgSend(v3, "simulateImageWellTap");

}

- (void)_dismissCameraRollImmediately
{
  id v2;

  -[CAMCameraRollTestHarness viewfinderViewController](self, "viewfinderViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)awaitPreload
{
  return self->_awaitPreload;
}

- (double)settlingDelay
{
  return self->_settlingDelay;
}

- (BOOL)testingWarmPresentation
{
  return self->_testingWarmPresentation;
}

- (BOOL)isTestingAnimation
{
  return self->_testingAnimation;
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewfinderViewController, 0);
}

@end
