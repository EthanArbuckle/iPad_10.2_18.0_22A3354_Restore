@implementation CAMDeviceAndModeTestHarness

- (CAMDeviceAndModeTestHarness)initWithTestName:(id)a3 devicePosition:(int64_t)a4 captureMode:(int64_t)a5 viewFinderViewControl:(id)a6
{
  id v11;
  CAMDeviceAndModeTestHarness *v12;
  CAMDeviceAndModeTestHarness *v13;
  CAMDeviceAndModeTestHarness *v14;
  objc_super v16;

  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CAMDeviceAndModeTestHarness;
  v12 = -[CAMModeAndDeviceConfigurationTestHarness initWithTestName:](&v16, sel_initWithTestName_, a3);
  v13 = v12;
  if (v12)
  {
    v12->__desiredPosition = a4;
    v12->__desiredMode = a5;
    objc_storeStrong((id *)&v12->__viewController, a6);
    v14 = v13;
  }

  return v13;
}

- (void)startTesting
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  _QWORD aBlock[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMDeviceAndModeTestHarness;
  -[CAMModeAndDeviceConfigurationTestHarness startTesting](&v12, sel_startTesting);
  -[CAMDeviceAndModeTestHarness _viewController](self, "_viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentCaptureMode");
  v5 = objc_msgSend(v3, "currentCaptureDevice") - 1;
  if (v5 > 0xA)
    v6 = 0;
  else
    v6 = qword_1DB9A59D8[v5];
  v7 = -[CAMDeviceAndModeTestHarness _desiredMode](self, "_desiredMode");
  v8 = -[CAMDeviceAndModeTestHarness _desiredPosition](self, "_desiredPosition");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__CAMDeviceAndModeTestHarness_startTesting__block_invoke;
  aBlock[3] = &unk_1EA328868;
  aBlock[4] = self;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  if (v7 == v4 && v8 == v6)
  {
    (*((void (**)(void *))v9 + 2))(v9);
  }
  else
  {
    -[CAMModeAndDeviceConfigurationTestHarness registerHandler:forChangeToMode:devicePosition:](self, "registerHandler:forChangeToMode:devicePosition:", v9, v7, v8);
    objc_msgSend(v3, "changeToMode:device:", v7, v8 == 1);
  }

}

uint64_t __43__CAMDeviceAndModeTestHarness_startTesting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopTesting");
}

- (int64_t)_desiredPosition
{
  return self->__desiredPosition;
}

- (int64_t)_desiredMode
{
  return self->__desiredMode;
}

- (CAMViewfinderViewController)_viewController
{
  return self->__viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__viewController, 0);
}

@end
