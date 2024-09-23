@implementation FCHealthServer

- (FCHealthServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  FCHealthServer *v12;
  FCHealthServer *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  FCHealthProfileExtending *profileExtension;
  objc_super v19;

  v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCHealthServer;
  v12 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v19, sel_initWithUUID_configuration_client_delegate_, v11, a4, a5, a6);
  v13 = v12;
  if (v12)
  {
    -[HDStandardTaskServer profile](v12, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "profileExtensionsConformingToProtocol:", &unk_1EF9CB4F0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = objc_claimAutoreleasedReturnValue();
    profileExtension = v13->_profileExtension;
    v13->_profileExtension = (FCHealthProfileExtending *)v16;

    objc_storeStrong((id *)&v13->_taskUUID, a3);
    v13->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (id)remoteInterface
{
  return 0;
}

- (void)connectionInvalidated
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC30F000, v3, OS_LOG_TYPE_DEFAULT, "[FCHealthServer] XPC connection invalidated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)FCHealthServer;
  -[HDStandardTaskServer connectionInvalidated](&v4, sel_connectionInvalidated);
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0D22098];
}

- (void)pluginMessage:(unint64_t)a3 data:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  -[FCHealthProfileExtending fitnessCoachingHealthService](self->_profileExtension, "fitnessCoachingHealthService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
    -[FCHealthServer handleRegisterGoalProgressConfigurationData:service:completion:](self, "handleRegisterGoalProgressConfigurationData:service:completion:", v10, v9, v8);

}

- (void)handleRegisterGoalProgressConfigurationData:(id)a3 service:(id)a4 completion:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x1E0D22138];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_msgSend([v7 alloc], "initWithTransportData:", v10);

  objc_msgSend(v9, "registerGoalProgressConfiguration:completion:", v11, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskUUID, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_storeStrong((id *)&self->_daemonTransaction, 0);
}

@end
