@implementation CAMModeSwitchTestHarness

- (CAMModeSwitchTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 mode:(int64_t)a5 testingAnimation:(BOOL)a6 testExtensionSeconds:(double)a7
{
  id v13;
  CAMModeSwitchTestHarness *v14;
  CAMModeSwitchTestHarness *v15;
  CAMModeSwitchTestHarness *v16;
  objc_super v18;

  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CAMModeSwitchTestHarness;
  v14 = -[CAMModeAndDeviceConfigurationTestHarness initWithTestName:](&v18, sel_initWithTestName_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_viewfinderViewController, a4);
    v15->_desiredMode = a5;
    v15->_testingAnimation = a6;
    v15->_testExtensionSeconds = a7;
    v16 = v15;
  }

  return v15;
}

- (void)startTesting
{
  BOOL v3;
  _BOOL8 v4;
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  v3 = -[CAMModeSwitchTestHarness isTestingAnimation](self, "isTestingAnimation");
  v4 = -[CAMModeSwitchTestHarness desiredMode](self, "desiredMode") == 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__CAMModeSwitchTestHarness_startTesting__block_invoke;
  v5[3] = &unk_1EA329808;
  objc_copyWeak(&v6, &location);
  v7 = v3;
  -[CAMModeSwitchTestHarness _ensureCaptureMode:thenPerform:](self, "_ensureCaptureMode:thenPerform:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__CAMModeSwitchTestHarness_startTesting__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = dispatch_time(0, 2000000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CAMModeSwitchTestHarness_startTesting__block_invoke_2;
  v3[3] = &unk_1EA329808;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = *(_BYTE *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __40__CAMModeSwitchTestHarness_startTesting__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startTestingAfterModeSwitchIsTestingAnimation:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_startTestingAfterModeSwitchIsTestingAnimation:(BOOL)a3
{
  int64_t desiredMode;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMModeSwitchTestHarness;
  -[CAMModeAndDeviceConfigurationTestHarness startTesting](&v10, sel_startTesting);
  objc_initWeak(&location, self);
  desiredMode = self->_desiredMode;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__CAMModeSwitchTestHarness__startTestingAfterModeSwitchIsTestingAnimation___block_invoke;
  v6[3] = &unk_1EA329808;
  v8 = a3;
  objc_copyWeak(&v7, &location);
  -[CAMModeSwitchTestHarness _ensureCaptureMode:thenPerform:](self, "_ensureCaptureMode:thenPerform:", desiredMode, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __75__CAMModeSwitchTestHarness__startTestingAfterModeSwitchIsTestingAnimation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (!*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_internalStopTesting");

  }
}

- (void)_internalStopTesting
{
  double v3;
  dispatch_time_t v4;
  _QWORD block[5];

  -[CAMModeSwitchTestHarness testExtensionSeconds](self, "testExtensionSeconds");
  if (v3 <= 0.0)
  {
    -[CAMModeAndDeviceConfigurationTestHarness stopTesting](self, "stopTesting");
  }
  else
  {
    v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__CAMModeSwitchTestHarness__internalStopTesting__block_invoke;
    block[3] = &unk_1EA328868;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __48__CAMModeSwitchTestHarness__internalStopTesting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopTesting");
}

- (void)handleDidOpenViewfinderForReason:(int64_t)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMModeSwitchTestHarness;
  -[CAMModeAndDeviceConfigurationTestHarness handleDidOpenViewfinderForReason:](&v6, sel_handleDidOpenViewfinderForReason_, a3);
  v4 = -[CAMPerformanceTestHarness isRunningTest](self, "isRunningTest");
  v5 = -[CAMModeSwitchTestHarness isTestingAnimation](self, "isTestingAnimation");
  if (v4 && v5)
    -[CAMModeSwitchTestHarness _internalStopTesting](self, "_internalStopTesting");
}

- (void)_ensureCaptureMode:(int64_t)a3 thenPerform:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (**v11)(void);

  v11 = (void (**)(void))a4;
  -[CAMModeSwitchTestHarness viewfinderViewController](self, "viewfinderViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_configuredMode");
  v8 = objc_msgSend(v6, "_configuredDevice");
  if ((unint64_t)(v8 - 8) >= 4 && v8 != 1 && v7 == a3)
  {
    v11[2]();
  }
  else
  {
    -[CAMModeAndDeviceConfigurationTestHarness registerHandler:forChangeToMode:devicePosition:](self, "registerHandler:forChangeToMode:devicePosition:", v11, a3, 0);
    -[CAMModeAndDeviceConfigurationTestHarness registerHandler:forChangeToMode:devicePosition:](self, "registerHandler:forChangeToMode:devicePosition:", v11, a3, 1);
    objc_msgSend(v6, "changeToMode:device:animated:", a3, 0, 1);
  }

}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (int64_t)desiredMode
{
  return self->_desiredMode;
}

- (BOOL)isTestingAnimation
{
  return self->_testingAnimation;
}

- (double)testExtensionSeconds
{
  return self->_testExtensionSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewfinderViewController, 0);
}

@end
