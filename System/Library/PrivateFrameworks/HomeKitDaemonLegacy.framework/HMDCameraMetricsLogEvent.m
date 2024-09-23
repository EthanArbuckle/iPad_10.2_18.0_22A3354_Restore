@implementation HMDCameraMetricsLogEvent

- (HMDCameraMetricsLogEvent)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDCameraMetricsLogEvent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraMetricsLogEvent;
  v13 = -[HMMHomeLogEvent initWithHomeUUID:](&v15, sel_initWithHomeUUID_, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_sessionID, a3);
    objc_storeWeak((id *)&v13->_accessory, v10);
    v13->_isLocal = a5;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (HMDCameraSessionID)sessionID
{
  return self->_sessionID;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

@end
