@implementation INFocusStatusCenter

- (INFocusStatusCenter)init
{
  INFocusStatusCenter *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  DNDAvailabilityService *service;
  INFocusStatusCenter *v9;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v11.receiver = self;
  v11.super_class = (Class)INFocusStatusCenter;
  v2 = -[INFocusStatusCenter init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v5 = (void *)getDNDAvailabilityServiceClass_softClass;
    v16 = getDNDAvailabilityServiceClass_softClass;
    if (!getDNDAvailabilityServiceClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getDNDAvailabilityServiceClass_block_invoke;
      v12[3] = &unk_1E22953C0;
      v12[4] = &v13;
      __getDNDAvailabilityServiceClass_block_invoke((uint64_t)v12);
      v5 = (void *)v14[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v6, "serviceForClientIdentifier:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    service = v2->_service;
    v2->_service = (DNDAvailabilityService *)v7;

    v9 = v2;
  }

  return v2;
}

- (INFocusStatus)focusStatus
{
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  INFocusStatus *v7;
  void *v8;
  INFocusStatus *v9;
  INFocusStatus *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[INFocusStatusCenter authorizationStatus](self, "authorizationStatus") == INFocusStatusAuthorizationStatusAuthorized)
  {
    -[INFocusStatusCenter service](self, "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v4 = objc_msgSend(v3, "isLocalUserAvailableReturningError:", &v12);
    v5 = v12;

    if (v5)
    {
      v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[INFocusStatusCenter focusStatus]";
        v15 = 2114;
        v16 = v5;
        _os_log_error_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_ERROR, "%s Unable to get local user availability: %{public}@", buf, 0x16u);
      }
    }
    v7 = [INFocusStatus alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4 ^ 1u);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[INFocusStatus initWithIsFocused:](v7, "initWithIsFocused:", v8);

  }
  else
  {
    v10 = [INFocusStatus alloc];
    v9 = -[INFocusStatus initWithIsFocused:](v10, "initWithIsFocused:", MEMORY[0x1E0C9AAA0]);
  }
  return v9;
}

- (INFocusStatusAuthorizationStatus)authorizationStatus
{
  int v3;

  if (TCCAccessRestricted())
    return 1;
  v3 = TCCAccessPreflight();
  if (v3)
    return 2 * (v3 == 1);
  else
    return 3;
}

- (void)requestAuthorizationWithCompletionHandler:(void *)completionHandler
{
  void (**v4)(void *, uint64_t);
  void (**v5)(void *, uint64_t);

  v4 = completionHandler;
  if (-[INFocusStatusCenter authorizationStatus](self, "authorizationStatus") == INFocusStatusAuthorizationStatusRestricted)
  {
    if (v4)
      v4[2](v4, 1);
  }
  else
  {
    v5 = v4;
    TCCAccessRequest();

  }
}

- (DNDAvailabilityService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

uint64_t __65__INFocusStatusCenter_requestAuthorizationWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2)
      v3 = 3;
    else
      v3 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

+ (INFocusStatusCenter)defaultCenter
{
  if (defaultCenter_onceToken != -1)
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_55830);
  return (INFocusStatusCenter *)(id)defaultCenter_defaultCenter;
}

void __36__INFocusStatusCenter_defaultCenter__block_invoke()
{
  INFocusStatusCenter *v0;
  void *v1;

  v0 = objc_alloc_init(INFocusStatusCenter);
  v1 = (void *)defaultCenter_defaultCenter;
  defaultCenter_defaultCenter = (uint64_t)v0;

}

@end
