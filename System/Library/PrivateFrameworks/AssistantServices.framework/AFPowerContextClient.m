@implementation AFPowerContextClient

- (AFPowerContextClient)init
{
  AFPowerContextClient *v2;
  AFPowerContextClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFPowerContextClient;
  v2 = -[AFPowerContextClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_registrationStatus = -1;
    -[AFPowerContextClient _registerForDarwinNotificationIfNeeded](v2, "_registerForDarwinNotificationIfNeeded");
  }
  return v3;
}

- (void)_registerForDarwinNotificationIfNeeded
{
  if (!-[AFPowerContextClient _isNotificationTokenRegistered](self, "_isNotificationTokenRegistered"))
    self->_registrationStatus = notify_register_check("com.apple.siri.power.PowerContextPolicy.updated", &self->_notificationToken);
}

- (BOOL)_isNotificationTokenRegistered
{
  return self->_registrationStatus == 0;
}

- (unint64_t)currentEncodedPowerPolicyWithError:(id *)a3
{
  uint32_t state;
  NSObject *v6;
  uint32_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  unint64_t result;
  uint64_t state64;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AFPowerContextClient _registerForDarwinNotificationIfNeeded](self, "_registerForDarwinNotificationIfNeeded");
  if (!-[AFPowerContextClient _isNotificationTokenRegistered](self, "_isNotificationTokenRegistered"))
  {
    v10 = AFSiriLogContextPower;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFPowerContextClient currentEncodedPowerPolicyWithError:]";
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s PowerContextClient: Error retrieving current power policy - unregistered token", buf, 0xCu);
      if (a3)
        goto LABEL_8;
    }
    else if (a3)
    {
LABEL_8:
      v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v9 = 7100;
      goto LABEL_9;
    }
    return 0;
  }
  state64 = 0;
  state = notify_get_state(self->_notificationToken, &state64);
  v6 = AFSiriLogContextPower;
  if (state)
  {
    v7 = state;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[AFPowerContextClient currentEncodedPowerPolicyWithError:]";
      v16 = 1024;
      LODWORD(v17) = v7;
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s PowerContextClient: Error retrieving current power policy - failed to get state with status code: %u", buf, 0x12u);
      if (a3)
        goto LABEL_5;
    }
    else if (a3)
    {
LABEL_5:
      v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v9 = 7101;
LABEL_9:
      v11 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), v9, 0);
      result = 0;
      *a3 = v11;
      return result;
    }
    return 0;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[AFPowerContextClient currentEncodedPowerPolicyWithError:]";
    v16 = 2048;
    v17 = state64;
    v18 = 2048;
    v19 = state64;
    _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s PowerContextClient: Retrieved current power policy: %llu -> 0x%llx", buf, 0x20u);
  }
  return state64;
}

- (id)currentPowerPolicyWithError:(id *)a3
{
  return -[AFPowerContextPolicy initWithEncodedPolicy:]([AFPowerContextPolicy alloc], "initWithEncodedPolicy:", -[AFPowerContextClient currentEncodedPowerPolicyWithError:](self, "currentEncodedPowerPolicyWithError:", a3));
}

- (BOOL)updateCurrentPowerPolicy:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint32_t v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AFPowerContextClient _registerForDarwinNotificationIfNeeded](self, "_registerForDarwinNotificationIfNeeded");
  if (!-[AFPowerContextClient _isNotificationTokenRegistered](self, "_isNotificationTokenRegistered"))
  {
    v13 = AFSiriLogContextPower;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[AFPowerContextClient(PolicyProvider) updateCurrentPowerPolicy:withError:]";
      _os_log_error_impl(&dword_19AF50000, v13, OS_LOG_TYPE_ERROR, "%s PowerContextClient: Error updating current power policy - unregistered token", (uint8_t *)&v16, 0xCu);
      if (!a4)
        goto LABEL_16;
    }
    else if (!a4)
    {
      goto LABEL_16;
    }
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = 7100;
    goto LABEL_9;
  }
  v7 = objc_msgSend(v6, "encodePolicy");
  v8 = notify_set_state(self->_notificationToken, v7);
  v9 = AFSiriLogContextPower;
  if (v8)
  {
    v10 = v8;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[AFPowerContextClient(PolicyProvider) updateCurrentPowerPolicy:withError:]";
      v18 = 1024;
      LODWORD(v19) = v10;
      _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s PowerContextClient: Error updating current power policy - failed to set state with status code: %u", (uint8_t *)&v16, 0x12u);
      if (a4)
        goto LABEL_5;
    }
    else if (a4)
    {
LABEL_5:
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = 7102;
LABEL_9:
      v14 = 0;
      *a4 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), v12, 0);
      goto LABEL_17;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315650;
    v17 = "-[AFPowerContextClient(PolicyProvider) updateCurrentPowerPolicy:withError:]";
    v18 = 2048;
    v19 = v7;
    v20 = 2048;
    v21 = v7;
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s PowerContextClient: Updated current power policy: %llu -> 0x%llx", (uint8_t *)&v16, 0x20u);
  }
  notify_post("com.apple.siri.power.PowerContextPolicy.updated");
  v14 = 1;
LABEL_17:

  return v14;
}

@end
