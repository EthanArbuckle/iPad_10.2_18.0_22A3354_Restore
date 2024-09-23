@implementation _HMCameraControl

- (_HMCameraControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  _HMCameraControl *v8;
  _HMCameraControl *v9;
  uint64_t v10;
  NSUUID *profileUniqueIdentifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_HMCameraControl;
  v8 = -[_HMCameraControl init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_cameraProfile, v6);
    v10 = objc_msgSend(v7, "copy");
    profileUniqueIdentifier = v9->_profileUniqueIdentifier;
    v9->_profileUniqueIdentifier = (NSUUID *)v10;

  }
  return v9;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (isInternalBuild())
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[_HMCameraControl cameraProfile](self, "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMCameraControl profileUniqueIdentifier](self, "profileUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_HMCameraControl profileUniqueIdentifier](self, "profileUniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NSUUID)profileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (_HMCameraProfile)cameraProfile
{
  return (_HMCameraProfile *)objc_loadWeakRetained((id *)&self->_cameraProfile);
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[_HMCameraControl context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_cameraProfile);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setCameraProfile:(id)a3
{
  objc_storeWeak((id *)&self->_cameraProfile, a3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_27261 != -1)
    dispatch_once(&logCategory__hmf_once_t0_27261, &__block_literal_global_27262);
  return (id)logCategory__hmf_once_v1_27263;
}

@end
