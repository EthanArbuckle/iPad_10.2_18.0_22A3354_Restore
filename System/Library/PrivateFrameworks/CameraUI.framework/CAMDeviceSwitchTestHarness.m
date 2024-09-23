@implementation CAMDeviceSwitchTestHarness

- (CAMDeviceSwitchTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 devicePosition:(int64_t)a5 testingAnimation:(BOOL)a6 startingCaptureMode:(int64_t)a7 testExtensionSeconds:(double)a8
{
  id v15;
  CAMDeviceSwitchTestHarness *v16;
  CAMDeviceSwitchTestHarness *v17;
  CAMDeviceSwitchTestHarness *v18;
  objc_super v20;

  v15 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMDeviceSwitchTestHarness;
  v16 = -[CAMModeAndDeviceConfigurationTestHarness initWithTestName:](&v20, sel_initWithTestName_, a3);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_viewfinderViewController, a4);
    v17->_desiredDevicePosition = a5;
    v17->_testingAnimation = a6;
    v17->_startingCaptureMode = a7;
    v17->_testExtensionSeconds = a8;
    v18 = v17;
  }

  return v17;
}

- (void)startTesting
{
  BOOL v3;
  int64_t v4;
  int64_t v5;
  _QWORD v6[7];
  BOOL v7;

  v3 = -[CAMDeviceSwitchTestHarness isTestingAnimation](self, "isTestingAnimation");
  v4 = -[CAMDeviceSwitchTestHarness desiredDevicePosition](self, "desiredDevicePosition");
  v5 = -[CAMDeviceSwitchTestHarness startingCaptureMode](self, "startingCaptureMode");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke;
  v6[3] = &unk_1EA32BFF0;
  v6[4] = self;
  v6[5] = v4;
  v6[6] = v5;
  v7 = v3;
  -[CAMDeviceSwitchTestHarness ensureCaptureDevicePosition:mode:thenPerform:](self, "ensureCaptureDevicePosition:mode:thenPerform:", v4 == 0, v5, v6);
}

void __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[5];
  __int128 v4;
  char v5;

  v2 = dispatch_time(0, 2000000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke_2;
  v3[3] = &unk_1EA32BFF0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
}

uint64_t __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];
  char v7;
  objc_super v8;

  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)CAMDeviceSwitchTestHarness;
  objc_msgSendSuper2(&v8, sel_startTesting);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke_3;
  v6[3] = &unk_1EA328908;
  v7 = *(_BYTE *)(a1 + 56);
  v6[4] = v2;
  return objc_msgSend(v2, "ensureCaptureDevicePosition:mode:thenPerform:", v3, v4, v6);
}

uint64_t __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke_3(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_internalStopTesting");
  return result;
}

- (void)handleDidOpenViewfinderForReason:(int64_t)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMDeviceSwitchTestHarness;
  -[CAMModeAndDeviceConfigurationTestHarness handleDidOpenViewfinderForReason:](&v6, sel_handleDidOpenViewfinderForReason_, a3);
  v4 = -[CAMPerformanceTestHarness isRunningTest](self, "isRunningTest");
  v5 = -[CAMDeviceSwitchTestHarness isTestingAnimation](self, "isTestingAnimation");
  if (v4 && v5)
    -[CAMDeviceSwitchTestHarness _internalStopTesting](self, "_internalStopTesting");
}

- (void)_internalStopTesting
{
  double v3;
  dispatch_time_t v4;
  _QWORD block[5];

  -[CAMDeviceSwitchTestHarness testExtensionSeconds](self, "testExtensionSeconds");
  if (v3 <= 0.0)
  {
    -[CAMModeAndDeviceConfigurationTestHarness stopTesting](self, "stopTesting");
  }
  else
  {
    v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__CAMDeviceSwitchTestHarness__internalStopTesting__block_invoke;
    block[3] = &unk_1EA328868;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __50__CAMDeviceSwitchTestHarness__internalStopTesting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopTesting");
}

- (void)ensureCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4 thenPerform:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);

  v12 = (void (**)(_QWORD))a5;
  -[CAMDeviceSwitchTestHarness viewfinderViewController](self, "viewfinderViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_configuredMode");
  v10 = objc_msgSend(v8, "_configuredDevice");
  if ((unint64_t)(v10 - 1) > 0xA)
    v11 = 0;
  else
    v11 = qword_1DB9A6A80[v10 - 1];
  if (v9 == a4 && v11 == a3)
  {
    v12[2](v12);
  }
  else
  {
    -[CAMModeAndDeviceConfigurationTestHarness registerHandler:forChangeToMode:devicePosition:](self, "registerHandler:forChangeToMode:devicePosition:", v12, a4, a3);
    objc_msgSend(v8, "changeToMode:device:animated:", a4, a3 == 1, 1);
  }

}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (int64_t)desiredDevicePosition
{
  return self->_desiredDevicePosition;
}

- (int64_t)startingCaptureMode
{
  return self->_startingCaptureMode;
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
