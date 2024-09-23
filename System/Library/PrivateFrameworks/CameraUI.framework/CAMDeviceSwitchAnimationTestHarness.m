@implementation CAMDeviceSwitchAnimationTestHarness

- (CAMDeviceSwitchAnimationTestHarness)initWithTestName:(id)a3 viewfinder:(id)a4 devicePosition:(int64_t)a5
{
  id v9;
  CAMDeviceSwitchAnimationTestHarness *v10;
  CAMDeviceSwitchAnimationTestHarness *v11;
  CAMDeviceSwitchAnimationTestHarness *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CAMDeviceSwitchAnimationTestHarness;
  v10 = -[CAMModeAndDeviceConfigurationTestHarness initWithTestName:](&v14, sel_initWithTestName_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_viewfinder, a4);
    v11->_desiredDevicePosition = a5;
    v12 = v11;
  }

  return v11;
}

+ (id)harnessWithTestName:(id)a3 viewfinder:(id)a4 devicePosition:(int64_t)a5
{
  id v7;
  id v8;
  CAMDeviceSwitchAnimationTestHarness *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[CAMDeviceSwitchAnimationTestHarness initWithTestName:viewfinder:devicePosition:]([CAMDeviceSwitchAnimationTestHarness alloc], "initWithTestName:viewfinder:devicePosition:", v8, v7, a5);

  return v9;
}

- (void)startTesting
{
  _BOOL8 v2;
  _QWORD v3[5];

  v2 = self->_desiredDevicePosition == 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__CAMDeviceSwitchAnimationTestHarness_startTesting__block_invoke;
  v3[3] = &unk_1EA328868;
  v3[4] = self;
  -[CAMDeviceSwitchAnimationTestHarness ensureCaptureDevicePosition:mode:thenPerform:](self, "ensureCaptureDevicePosition:mode:thenPerform:", v2, 0, v3);
}

void __51__CAMDeviceSwitchAnimationTestHarness_startTesting__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CAMDeviceSwitchAnimationTestHarness_startTesting__block_invoke_2;
  block[3] = &unk_1EA328868;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

uint64_t __51__CAMDeviceSwitchAnimationTestHarness_startTesting__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)CAMDeviceSwitchAnimationTestHarness;
  objc_msgSendSuper2(&v6, sel_startTesting);
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[8];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__CAMDeviceSwitchAnimationTestHarness_startTesting__block_invoke_3;
  v5[3] = &unk_1EA328868;
  v5[4] = v2;
  return objc_msgSend(v2, "ensureCaptureDevicePosition:mode:thenPerform:", v3, 0, v5);
}

uint64_t __51__CAMDeviceSwitchAnimationTestHarness_startTesting__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopTesting");
}

- (void)ensureCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4 thenPerform:(id)a5
{
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  void (**v12)(_QWORD);

  v12 = (void (**)(_QWORD))a5;
  v8 = -[CAMViewfinderViewController _configuredMode](self->_viewfinder, "_configuredMode");
  v9 = -[CAMViewfinderViewController _configuredDevice](self->_viewfinder, "_configuredDevice");
  if ((unint64_t)(v9 - 1) > 0xA)
    v10 = 0;
  else
    v10 = qword_1DB9A71A8[v9 - 1];
  if (v8 == a4 && v10 == a3)
  {
    v12[2](v12);
  }
  else
  {
    -[CAMModeAndDeviceConfigurationTestHarness registerHandler:forChangeToMode:devicePosition:](self, "registerHandler:forChangeToMode:devicePosition:", v12, a4, a3);
    -[CAMViewfinderViewController changeToMode:device:animated:](self->_viewfinder, "changeToMode:device:animated:", a4, a3 == 1, 1);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewfinder, 0);
}

@end
