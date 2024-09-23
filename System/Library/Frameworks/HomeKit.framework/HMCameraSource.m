@implementation HMCameraSource

- (HMCameraSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCameraSource;
  return -[HMCameraSource init](&v3, sel_init);
}

- (HMCameraSource)initWithProfileUniqueIdentifier:(id)a3 slotIdentifier:(id)a4 aspectRatio:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMCameraSource *v12;
  uint64_t v13;
  NSUUID *profileUniqueIdentifier;
  uint64_t v15;
  NSNumber *slotIdentifier;
  double v17;
  HMCameraSource *result;
  HMCameraSource *v19;
  SEL v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v19 = (HMCameraSource *)_HMFPreconditionFailure();
    -[HMCameraSource currentAspectRatio](v19, v20);
    return result;
  }
  v21.receiver = self;
  v21.super_class = (Class)HMCameraSource;
  v12 = -[HMCameraSource init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    profileUniqueIdentifier = v12->_profileUniqueIdentifier;
    v12->_profileUniqueIdentifier = (NSUUID *)v13;

    v15 = objc_msgSend(v9, "copy");
    slotIdentifier = v12->_slotIdentifier;
    v12->_slotIdentifier = (NSNumber *)v15;

    objc_msgSend(v11, "doubleValue");
    v12->_aspectRatio = v17;
  }

  return v12;
}

- (void)fillSlotWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMCameraSource profileUniqueIdentifier](self, "profileUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraSource slotIdentifier](self, "slotIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMCameraSource context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSUUID)profileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)slotIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (HMCameraView)cameraView
{
  return (HMCameraView *)objc_loadWeakRetained((id *)&self->_cameraView);
}

- (void)setCameraView:(id)a3
{
  objc_storeWeak((id *)&self->_cameraView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraView);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_39144 != -1)
    dispatch_once(&logCategory__hmf_once_t0_39144, &__block_literal_global_39145);
  return (id)logCategory__hmf_once_v1_39146;
}

void __29__HMCameraSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_39146;
  logCategory__hmf_once_v1_39146 = v0;

}

@end
