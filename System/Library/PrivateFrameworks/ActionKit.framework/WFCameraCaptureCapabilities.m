@implementation WFCameraCaptureCapabilities

- (WFCameraCaptureCapabilities)init
{
  WFCameraCaptureCapabilities *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  CAMCaptureCapabilities *capabilities;
  WFCameraCaptureCapabilities *v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)WFCameraCaptureCapabilities;
  v2 = -[WFCameraCaptureCapabilities init](&v9, sel_init);
  if (v2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)getCAMCaptureCapabilitiesClass_softClass;
    v14 = getCAMCaptureCapabilitiesClass_softClass;
    if (!getCAMCaptureCapabilitiesClass_softClass)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __getCAMCaptureCapabilitiesClass_block_invoke;
      v10[3] = &unk_24F8BB430;
      v10[4] = &v11;
      __getCAMCaptureCapabilitiesClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v5 = objc_msgSend([v4 alloc], "initWithHostProcess:", 0);
    capabilities = v2->_capabilities;
    v2->_capabilities = (CAMCaptureCapabilities *)v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)isSupportedMode:(int64_t)a3 withDevice:(int64_t)a4
{
  void *v6;

  -[WFCameraCaptureCapabilities capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "isSupportedMode:withDevice:", a3, a4);

  return a4;
}

- (CAMCaptureCapabilities)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
}

+ (WFCameraCaptureCapabilities)capabilities
{
  if (capabilities_onceToken != -1)
    dispatch_once(&capabilities_onceToken, &__block_literal_global_1269);
  return (WFCameraCaptureCapabilities *)(id)capabilities_capabilities;
}

void __43__WFCameraCaptureCapabilities_capabilities__block_invoke()
{
  WFCameraCaptureCapabilities *v0;
  void *v1;

  v0 = objc_alloc_init(WFCameraCaptureCapabilities);
  v1 = (void *)capabilities_capabilities;
  capabilities_capabilities = (uint64_t)v0;

}

@end
