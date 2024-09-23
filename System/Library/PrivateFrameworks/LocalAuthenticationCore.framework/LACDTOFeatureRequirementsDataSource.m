@implementation LACDTOFeatureRequirementsDataSource

- (LACDTOFeatureRequirementsDataSource)initWithDevice:(id)a3 replyQueue:(id)a4
{
  id v7;
  id v8;
  LACDTOFeatureRequirementsDataSource *v9;
  LACDTOFeatureRequirementsDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOFeatureRequirementsDataSource;
  v9 = -[LACDTOFeatureRequirementsDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_replyQueue, a4);
  }

  return v10;
}

- (BOOL)hasPasscodeSetForCurrentUser
{
  return -[LACDTODeviceInfoProvider hasPasscodeSetForCurrentUser](self->_device, "hasPasscodeSetForCurrentUser");
}

- (BOOL)isPhone
{
  return -[LACDTODeviceInfoProvider isPhone](self->_device, "isPhone");
}

- (BOOL)hasBiometricEnrollmentsForCurrentUser
{
  return -[LACDTODeviceInfoProvider hasBiometricEnrollmentsForCurrentUser](self->_device, "hasBiometricEnrollmentsForCurrentUser");
}

- (void)hasHSA2AccountWithCompletion:(id)a3
{
  id v4;
  LACBackgroundTask *v5;
  uint64_t v6;
  LACBackgroundTask *v7;
  OS_dispatch_queue *replyQueue;
  LACBackgroundTask *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  LACBackgroundTask *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v4 = a3;
  if (getAKAccountManagerClass_0())
  {
    objc_initWeak(&location, self);
    v5 = [LACBackgroundTask alloc];
    v6 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __68__LACDTOFeatureRequirementsDataSource_hasHSA2AccountWithCompletion___block_invoke;
    v22[3] = &unk_2510C0F20;
    objc_copyWeak(&v23, &location);
    v7 = -[LACBackgroundTask initWithIdentifier:worker:](v5, "initWithIdentifier:worker:", CFSTR("HSA2AccountQuery"), v22);
    replyQueue = self->_replyQueue;
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __68__LACDTOFeatureRequirementsDataSource_hasHSA2AccountWithCompletion___block_invoke_2;
    v18[3] = &unk_2510C0C38;
    objc_copyWeak(&v21, &location);
    v20 = v4;
    v9 = v7;
    v19 = v9;
    -[LACBackgroundTask runWithTimeout:queue:completion:](v9, "runWithTimeout:queue:completion:", replyQueue, v18, 1.0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Missing AuthKit dependency"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogDTOFeature();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[LACDTOFeatureRequirementsDataSource hasHSA2AccountWithCompletion:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v10);
  }

}

void __68__LACDTOFeatureRequirementsDataSource_hasHSA2AccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  _BOOL8 v6;
  LACBackgroundTaskResult *v7;
  void *v8;
  LACBackgroundTaskResult *v9;
  void (**v10)(id, void *);

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(getAKAccountManagerClass_0(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryAuthKitAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "securityLevelForAccount:", v5) == 4;

    v7 = [LACBackgroundTaskResult alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LACBackgroundTaskResult initWithValue:](v7, "initWithValue:", v8);
    v10[2](v10, v9);

  }
}

void __68__LACDTOFeatureRequirementsDataSource_hasHSA2AccountWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

  }
}

- (void)hasLocationServicesEnabledWithCompletion:(id)a3
{
  id v4;
  LACBackgroundTask *v5;
  uint64_t v6;
  LACBackgroundTask *v7;
  OS_dispatch_queue *replyQueue;
  LACBackgroundTask *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  LACBackgroundTask *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v4 = a3;
  if (getCLLocationManagerClass())
  {
    objc_initWeak(&location, self);
    v5 = [LACBackgroundTask alloc];
    v6 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __80__LACDTOFeatureRequirementsDataSource_hasLocationServicesEnabledWithCompletion___block_invoke;
    v22[3] = &unk_2510C0F20;
    objc_copyWeak(&v23, &location);
    v7 = -[LACBackgroundTask initWithIdentifier:worker:](v5, "initWithIdentifier:worker:", CFSTR("LocationServicesQuery"), v22);
    replyQueue = self->_replyQueue;
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __80__LACDTOFeatureRequirementsDataSource_hasLocationServicesEnabledWithCompletion___block_invoke_2;
    v18[3] = &unk_2510C0C38;
    objc_copyWeak(&v21, &location);
    v20 = v4;
    v9 = v7;
    v19 = v9;
    -[LACBackgroundTask runWithTimeout:queue:completion:](v9, "runWithTimeout:queue:completion:", replyQueue, v18, 1.0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Missing CoreLocation dependency"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogDTOFeature();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[LACDTOFeatureRequirementsDataSource hasLocationServicesEnabledWithCompletion:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v10);
  }

}

void __80__LACDTOFeatureRequirementsDataSource_hasLocationServicesEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  LACBackgroundTaskResult *v5;
  void *v6;
  LACBackgroundTaskResult *v7;
  void (**v8)(id, void *);

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_msgSend(getCLLocationManagerClass(), "locationServicesEnabled");
    v5 = [LACBackgroundTaskResult alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[LACBackgroundTaskResult initWithValue:](v5, "initWithValue:", v6);
    v8[2](v8, v7);

  }
}

void __80__LACDTOFeatureRequirementsDataSource_hasLocationServicesEnabledWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)hasHSA2AccountWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, a2, a3, "Could not fetch HSA2 account %{public}@", a5, a6, a7, a8, 2u);
}

- (void)hasLocationServicesEnabledWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, a2, a3, "Could not fetch LocationServices status %{public}@", a5, a6, a7, a8, 2u);
}

@end
