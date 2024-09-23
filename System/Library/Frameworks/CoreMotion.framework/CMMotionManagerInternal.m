@implementation CMMotionManagerInternal

- (CMMotionManagerInternal)init
{
  char *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[5];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMMotionManagerInternal;
  v2 = -[CMMotionManagerInternal init](&v21, sel_init);
  v7 = v2;
  if (v2)
  {
    *((_DWORD *)v2 + 2) = 0;
    *((_QWORD *)v2 + 2) = 0;
    *((_QWORD *)v2 + 3) = 0x3F847AE147AE147BLL;
    *((_QWORD *)v2 + 4) = 0;
    *(_OWORD *)(v2 + 40) = 0u;
    *((_QWORD *)v2 + 7) = 0xBFF0000000000000;
    *((_QWORD *)v2 + 10) = 0;
    *((_QWORD *)v2 + 11) = 0x3F847AE147AE147BLL;
    *((_QWORD *)v2 + 12) = 0;
    *(_OWORD *)(v2 + 104) = 0u;
    *((_QWORD *)v2 + 15) = 0xBFF0000000000000;
    *((_QWORD *)v2 + 17) = 0;
    *((_QWORD *)v2 + 18) = 0x3F847AE147AE147BLL;
    *((_QWORD *)v2 + 19) = 0;
    *((_OWORD *)v2 + 10) = 0u;
    *((_QWORD *)v2 + 22) = 0xBFF0000000000000;
    *((_QWORD *)v2 + 24) = 0;
    *((_QWORD *)v2 + 25) = 0x3F847AE147AE147BLL;
    *((_OWORD *)v2 + 13) = 0u;
    *((_QWORD *)v2 + 28) = 0;
    *((_QWORD *)v2 + 29) = 0xBFF0000000000000;
    *((_QWORD *)v2 + 32) = 0;
    *((_QWORD *)v2 + 33) = 0x3F847AE147AE147BLL;
    *((_QWORD *)v2 + 36) = 0;
    *((_DWORD *)v2 + 74) = 0;
    *((_OWORD *)v2 + 17) = 0u;
    *((_QWORD *)v2 + 38) = 1;
    *((_DWORD *)v2 + 144) = 0;
    *((_DWORD *)v2 + 78) = 256;
    v2[316] = 0;
    *((_QWORD *)v2 + 44) = 0;
    *((_OWORD *)v2 + 20) = xmmword_18F5061B0;
    *((_OWORD *)v2 + 21) = 0u;
    v2[360] = 0;
    *((_QWORD *)v2 + 46) = 0;
    *((_QWORD *)v2 + 47) = 0x3FA47AE147AE147BLL;
    *((_OWORD *)v2 + 24) = 0u;
    *((_QWORD *)v2 + 50) = 0;
    *((_QWORD *)v2 + 51) = 0xBFF0000000000000;
    v2[432] = 0;
    *(_OWORD *)(v2 + 440) = 0u;
    *(_OWORD *)(v2 + 456) = 0u;
    *(_OWORD *)(v2 + 472) = 0u;
    *((_OWORD *)v2 + 32) = 0u;
    *((_QWORD *)v2 + 66) = 0;
    *((_WORD *)v2 + 268) = 257;
    *((_OWORD *)v2 + 38) = 0u;
    v8 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v3, v4, v5, v6);
    v13 = (void *)objc_msgSend_bundleIdentifier(v8, v9, v10, v11, v12);
    v14 = operator new();
    sub_18F1F52FC(v14, v13, v15, v16, v17);
    sub_18F3ABDF0((uint64_t *)v7 + 80, v14);
    *((_QWORD *)v7 + 81) = 0;
    *((_QWORD *)v7 + 82) = 0x3F847AE147AE147BLL;
    *((_QWORD *)v7 + 83) = 0;
    *((_QWORD *)v7 + 84) = 0x3FF0000000000000;
    *(_OWORD *)(v7 + 680) = 0u;
    *(_OWORD *)(v7 + 696) = 0u;
    *(_OWORD *)(v7 + 712) = 0u;
    *(_OWORD *)(v7 + 728) = 0u;
    *(_OWORD *)(v7 + 744) = 0u;
    *(_OWORD *)(v7 + 760) = 0u;
    *(_OWORD *)(v7 + 776) = 0u;
    *(_OWORD *)(v7 + 792) = 0u;
    *(_OWORD *)(v7 + 808) = 0u;
    *(_OWORD *)(v7 + 824) = 0u;
    *(_OWORD *)(v7 + 840) = 0u;
    *(_OWORD *)(v7 + 856) = 0u;
    *(_OWORD *)(v7 + 872) = 0u;
    *(_OWORD *)(v7 + 888) = 0u;
    *(_OWORD *)(v7 + 904) = 0u;
    *(_OWORD *)(v7 + 920) = 0u;
    *(_OWORD *)(v7 + 936) = 0u;
    *(_OWORD *)(v7 + 952) = 0u;
    *(_OWORD *)(v7 + 968) = 0u;
    *(_QWORD *)(v7 + 983) = 0;
    *((_OWORD *)v7 + 63) = 0u;
    *((_OWORD *)v7 + 64) = 0u;
    *((_OWORD *)v7 + 62) = 0u;
    *((_QWORD *)v7 + 130) = 0xBFF0000000000000;
    *(_OWORD *)(v7 + 1048) = xmmword_18F5061C0;
    *((_DWORD *)v7 + 266) = -1082130432;
    *((_QWORD *)v7 + 134) = 0;
    v18 = MEMORY[0x1E0C809B0];
    v7[624] = 0;
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = sub_18F1DF67C;
    block[3] = &unk_1E2955938;
    block[4] = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  return (CMMotionManagerInternal *)v7;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 71) = 0;
  *(_OWORD *)((char *)self + 632) = 0u;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMMotionManagerInternal;
  -[CMMotionManagerInternal dealloc](&v3, sel_dealloc);
}

- (void)teardownPrivate
{
  void *fPrivateDeviceMotionCallbackInfo;
  uint64_t v4;

  fPrivateDeviceMotionCallbackInfo = self->fPrivateDeviceMotionCallbackInfo;
  if (fPrivateDeviceMotionCallbackInfo)
  {
    v4 = MEMORY[0x194001018](fPrivateDeviceMotionCallbackInfo, a2);
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
  }
  self->fPrivateDeviceMotionCallbackInfo = 0;

  *(_QWORD *)&self->fPrivateDeviceMotionUse9Axis = 0;
}

- (NSOperationQueue)fDeviceMotionLiteClientQueue
{
  return *(NSOperationQueue **)&self->fKeyboardMotionGravityHIDReportPrev.elements[2];
}

- (void)setFDeviceMotionLiteClientQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (id)fDeviceMotionLiteFusedHandler
{
  return *(id *)&self->fKeyboardMotionGravityNotificationFrequency;
}

- (void)setFDeviceMotionLiteFusedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (NSString)fDeviceMotionLitePhysicalDeviceID
{
  return (NSString *)&self->fKeyboardMotionDispatcher->var0;
}

- (void)setFDeviceMotionLitePhysicalDeviceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1096);
}

- (void).cxx_destruct
{
  NSOperationQueue *fDeviceMotionErrorQueue;
  OS_dispatch_queue *fConnectionQueue;

  sub_18F3ABDF0((uint64_t *)&self->fIsApplicationActive, 0);
  fDeviceMotionErrorQueue = self->fDeviceMotionErrorQueue;
  self->fDeviceMotionErrorQueue = 0;
  if (fDeviceMotionErrorQueue)
    (*((void (**)(NSOperationQueue *))fDeviceMotionErrorQueue->super.isa + 1))(fDeviceMotionErrorQueue);
  fConnectionQueue = self->fConnectionQueue;
  self->fConnectionQueue = 0;
  if (fConnectionQueue)
    (*(void (**)(OS_dispatch_queue *))(*(_QWORD *)fConnectionQueue + 8))(fConnectionQueue);
}

@end
