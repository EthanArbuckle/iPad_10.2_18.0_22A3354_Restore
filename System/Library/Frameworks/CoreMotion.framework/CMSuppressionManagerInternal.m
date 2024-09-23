@implementation CMSuppressionManagerInternal

- (CMSuppressionManagerInternal)init
{
  CMSuppressionManagerInternal *v2;
  CMSuppressionManagerInternal *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CMSuppressionManagerInternal;
  v2 = -[CMSuppressionManagerInternal init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->fSuppressionEventHandler = 0;
    v2->fSuppressionEventQueue = 0;
    v2->fInputQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMSuppressionManager.InputQueue", 0);
    v3->fSuppressionEventDispatcher = 0;
    *(_WORD *)&v3->fServiceEnabled = 0;
    v3->fSmartPowerNap = 0;
    v3->fDevicePresence = 0;
    *(_OWORD *)&v3->fViewObstructedStateDispatcher = 0u;
    *(_OWORD *)&v3->fCameraCapturePoseHandler = 0u;
    v8 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v4, v5, v6, v7);
    v13 = (void *)objc_msgSend_UUIDString(v8, v9, v10, v11, v12);
    v17 = (void *)objc_msgSend_substringToIndex_(v13, v14, 3, v15, v16);
    v3->fSuppressionSources = objc_msgSend_copy(v17, v18, v19, v20, v21);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMSuppressionManagerInternal;
  -[CMSuppressionManagerInternal dealloc](&v2, sel_dealloc);
}

- (void)teardownPrivate
{
  void *fConnection;
  uint64_t v4;

  fConnection = self->fConnection;
  if (fConnection)
  {
    v4 = MEMORY[0x194001018](fConnection, a2);
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
  }
  self->fConnection = 0;

  self->fInputQueue = 0;
  self->fConnectionQueue = 0;

}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_QWORD *)self + 13) = 0;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  return self;
}

@end
