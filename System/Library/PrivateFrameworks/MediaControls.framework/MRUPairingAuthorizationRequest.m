@implementation MRUPairingAuthorizationRequest

- (MRUPairingAuthorizationRequest)initWithOutputDevice:(id)a3 inputType:(int64_t)a4
{
  id v7;
  MRUPairingAuthorizationRequest *v8;
  MRUPairingAuthorizationRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRUPairingAuthorizationRequest;
  v8 = -[MRUPairingAuthorizationRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outputDevice, a3);
    v9->_inputType = a4;
  }

  return v9;
}

- (MRUPairingAuthorizationRequest)initWithOutputDevice:(id)a3
{
  return -[MRUPairingAuthorizationRequest initWithOutputDevice:inputType:](self, "initWithOutputDevice:inputType:", a3, 0);
}

- (void)completeWithPasscode:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  AVOutputDevice *outputDevice;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  AVOutputDevice *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _MPAVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    outputDevice = self->_outputDevice;
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = outputDevice;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ complete authorization request for device: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[AVOutputDevice deviceID](self->_outputDevice, "deviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteCompletePairingHandler();

}

- (void)cancel
{
  NSObject *v3;
  uint64_t v4;
  AVOutputDevice *outputDevice;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  AVOutputDevice *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _MPAVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    outputDevice = self->_outputDevice;
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = outputDevice;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel authorization request for device: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[AVOutputDevice deviceID](self->_outputDevice, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteCompletePairingHandler();

}

- (AVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevice, 0);
}

@end
