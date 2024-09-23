@implementation HMDAccessorySetupCoordinatorStagingRequest

- (HMDAccessorySetupCoordinatorStagingRequest)init
{
  HMDAccessorySetupCoordinatorStagingRequest *v2;
  uint64_t v3;
  NSUUID *UUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDAccessorySetupCoordinatorStagingRequest;
  v2 = -[HMDAccessorySetupCoordinatorStagingRequest init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;

  }
  return v2;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMFMessage)pendingCancelMessage
{
  return self->_pendingCancelMessage;
}

- (void)setPendingCancelMessage:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCancelMessage, a3);
}

- (HMFMessage)pendingRequestMessage
{
  return self->_pendingRequestMessage;
}

- (void)setPendingRequestMessage:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequestMessage, a3);
}

- (id)confirmDeviceCredentialCompletionHandler
{
  return self->_confirmDeviceCredentialCompletionHandler;
}

- (void)setConfirmDeviceCredentialCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)selectWiFiNetworkHandler
{
  return self->_selectWiFiNetworkHandler;
}

- (void)setSelectWiFiNetworkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)selectThreadNetworkHandler
{
  return self->_selectThreadNetworkHandler;
}

- (void)setSelectThreadNetworkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableArray)pendingResponsePayloads
{
  return self->_pendingResponsePayloads;
}

- (void)setPendingResponsePayloads:(id)a3
{
  objc_storeStrong((id *)&self->_pendingResponsePayloads, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_pendingResponsePayloads, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_selectThreadNetworkHandler, 0);
  objc_storeStrong(&self->_selectWiFiNetworkHandler, 0);
  objc_storeStrong(&self->_confirmDeviceCredentialCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pendingRequestMessage, 0);
  objc_storeStrong((id *)&self->_pendingCancelMessage, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
