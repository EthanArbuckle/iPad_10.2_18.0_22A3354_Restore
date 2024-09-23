@implementation _HKBackgroundObservationExtensionRemoteContext

- (_HKBackgroundObservationExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  _HKBackgroundObservationExtensionRemoteContext *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKBackgroundObservationExtensionRemoteContext;
  v5 = -[_HKBackgroundObservationExtensionRemoteContext initWithInputItems:listenerEndpoint:contextUUID:](&v8, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogBackgroundUpdates;
    if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEBUG))
      -[_HKBackgroundObservationExtensionRemoteContext initWithInputItems:listenerEndpoint:contextUUID:].cold.1(v6, v5);
  }
  return v5;
}

- (void)performCleanup
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    -[_HKBackgroundObservationExtensionRemoteContext _UUID](self, "_UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_INFO, "HealthKit app extension cleaning up for UUID: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[_HKBackgroundObservationExtensionRemoteContext setExtensionInstance:](self, "setExtensionInstance:", 0);
  -[_HKBackgroundObservationExtensionRemoteContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", 0, 0);
}

- (void)didReceiveUpdateForSampleType:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[_HKBackgroundObservationExtensionRemoteContext extensionInstance](self, "extensionInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v9 = (void *)HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    -[_HKBackgroundObservationExtensionRemoteContext _UUID](self, "_UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_INFO, "HealthKit app extension with UUID: %{public}@ did receive update for sample type: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  if (v8)
    objc_msgSend(v8, "didReceiveUpdateForSampleType:completionHandler:", v6, v7);
  else
    v7[2](v7);

}

- (void)backgroundObservationExtensionTimeWillExpire
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    -[_HKBackgroundObservationExtensionRemoteContext _UUID](self, "_UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_INFO, "HealthKit app extension with UUID: %{public}@ will time out", (uint8_t *)&v7, 0xCu);

  }
  -[_HKBackgroundObservationExtensionRemoteContext extensionInstance](self, "extensionInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundObservationExtensionTimeWillExpire");

}

- (HKBackgroundObservationExtension)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
  objc_storeStrong((id *)&self->_extensionInstance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInstance, 0);
}

- (void)initWithInputItems:(void *)a1 listenerEndpoint:(void *)a2 contextUUID:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "_UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEBUG, "HealthKit app extension context initialized for UUID: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
