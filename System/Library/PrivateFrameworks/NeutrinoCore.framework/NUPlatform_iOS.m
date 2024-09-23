@implementation NUPlatform_iOS

- (NUPlatform_iOS)init
{
  NUPlatform_iOS *v2;
  void *v3;
  NUDevice_iOS *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NUPlatform_iOS;
  v2 = -[NUPlatform_iOS init](&v7, sel_init);
  v3 = (void *)MGCopyAnswer();
  -[NUPlatform setName:](v2, "setName:", v3);

  v4 = -[NUDevice_iOS initWithName:]([NUDevice_iOS alloc], "initWithName:", CFSTR("GPU"));
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPlatform setDevices:](v2, "setDevices:", v5);

  -[NUPlatform setHasExtendedColorDisplay:](v2, "setHasExtendedColorDisplay:", +[NUGlobalSettings platformHasWideColor](NUGlobalSettings, "platformHasWideColor"));
  return v2;
}

- (id)mainDevice
{
  void *v2;
  void *v3;

  -[NUPlatform devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displays
{
  return +[NUDisplay_iOS displays](NUDisplay_iOS, "displays");
}

- (id)mainDisplay
{
  return +[NUDisplay_iOS mainDisplay](NUDisplay_iOS, "mainDisplay");
}

- (BOOL)defaultSupportsLiveVideoRendering
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NUPlatform_iOS_defaultSupportsLiveVideoRendering__block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  if (defaultSupportsLiveVideoRendering_onceToken != -1)
    dispatch_once(&defaultSupportsLiveVideoRendering_onceToken, block);
  return defaultSupportsLiveVideoRendering_canRenderLiveVideo;
}

- (BOOL)hasDiscreteGPU
{
  return 0;
}

- (BOOL)supportsANE
{
  return MGGetBoolAnswer();
}

@end
