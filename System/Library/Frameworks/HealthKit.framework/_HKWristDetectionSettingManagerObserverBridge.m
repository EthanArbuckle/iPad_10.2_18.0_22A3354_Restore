@implementation _HKWristDetectionSettingManagerObserverBridge

- (_HKWristDetectionSettingManagerObserverBridge)initWithHandle:(id)a3
{
  id v5;
  _HKWristDetectionSettingManagerObserverBridge *v6;
  _HKWristDetectionSettingManagerObserverBridge *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKWristDetectionSettingManagerObserverBridge;
  v6 = -[_HKWristDetectionSettingManagerObserverBridge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handle, a3);

  return v7;
}

- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  HKObserverBridgeHandle *handle;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed change in wrist detection setting, notifying observers", (uint8_t *)&v12, 0xCu);

  }
  handle = self->_handle;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v4, "isWristDetectEnabled");

  objc_msgSend(v9, "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObserverBridgeHandle notifyObserversOfChangeForKey:newValue:](handle, "notifyObserversOfChangeForKey:newValue:", v8, v11);

}

- (HKObserverBridgeHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
