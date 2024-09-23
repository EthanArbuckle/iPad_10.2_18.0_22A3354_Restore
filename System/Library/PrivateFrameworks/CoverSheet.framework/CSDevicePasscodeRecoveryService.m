@implementation CSDevicePasscodeRecoveryService

- (CSDevicePasscodeRecoveryService)init
{
  id v3;
  CSDevicePasscodeRecoveryService *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CC1338]);
  v4 = -[CSDevicePasscodeRecoveryService initWithService:](self, "initWithService:", v3);

  return v4;
}

- (CSDevicePasscodeRecoveryService)initWithService:(id)a3
{
  id v5;
  CSDevicePasscodeRecoveryService *v6;
  CSDevicePasscodeRecoveryService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDevicePasscodeRecoveryService;
  v6 = -[CSDevicePasscodeRecoveryService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_service, a3);

  return v7;
}

- (BOOL)canStartRecovery
{
  LAPasscodeRecoveryService *service;
  char v3;
  id v4;
  NSObject *v5;
  id v7;

  service = self->_service;
  v7 = 0;
  v3 = -[LAPasscodeRecoveryService isRecoveryAvailableWithError:](service, "isRecoveryAvailableWithError:", &v7);
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CSDevicePasscodeRecoveryService canStartRecovery].cold.1((uint64_t)v4, v5);

  }
  return v3;
}

- (void)startRecoveryInParentVC:(id)a3 completion:(id)a4
{
  -[LAPasscodeRecoveryService startRecoveryInParentVC:completion:](self->_service, "startRecoveryInParentVC:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)canStartRecovery
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D0337000, a2, OS_LOG_TYPE_ERROR, "Cannot start passcode recovery (error: %@)", (uint8_t *)&v2, 0xCu);
}

@end
