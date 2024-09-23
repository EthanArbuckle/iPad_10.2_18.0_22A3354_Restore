@implementation HKCoreTelephonyClient

- (HKCoreTelephonyClient)initWithQueue:(id)a3
{
  id v5;
  HKCoreTelephonyClient *v6;
  HKCoreTelephonyClient *v7;
  uint64_t v8;
  CoreTelephonyClient *client;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCoreTelephonyClient;
  v6 = -[HKCoreTelephonyClient init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v7->_queue);
    client = v7->_client;
    v7->_client = (CoreTelephonyClient *)v8;

    -[CoreTelephonyClient setDelegate:](v7->_client, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_onForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

  }
  return v7;
}

- (HKCoreTelephonyClient)init
{
  void *v3;
  HKCoreTelephonyClient *v4;

  HKCreateSerialDispatchQueue(self, CFSTR("HKCoreTelephonyClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKCoreTelephonyClient initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKCoreTelephonyClient;
  -[HKCoreTelephonyClient dealloc](&v4, sel_dealloc);
}

- (void)fetchMobileCountryCodeFromCellularWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  CoreTelephonyClient *client;
  _QWORD v7[5];
  void (**v8)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSString copy](self->_cachedCountryCode, "copy");
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v4[2](v4, v5, 0);
  }
  else
  {
    client = self->_client;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__HKCoreTelephonyClient_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke;
    v7[3] = &unk_1E37F0EC8;
    v7[4] = self;
    v8 = v4;
    -[CoreTelephonyClient getCurrentDataSubscriptionContext:](client, "getCurrentDataSubscriptionContext:", v7);

  }
}

void __74__HKCoreTelephonyClient_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__HKCoreTelephonyClient_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_2;
  v6[3] = &unk_1E37F0EA0;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v5, "copyMobileCountryCode:completion:", a2, v6);

}

void __74__HKCoreTelephonyClient_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  os_unfair_lock_s *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a3;
  v10 = a2;
  os_unfair_lock_lock(v5);
  v7 = objc_msgSend(v10, "copy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchStewieSupportedWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  CTStewieSupport *v5;
  CoreTelephonyClient *client;
  _QWORD v7[5];
  void (**v8)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_cachedStewieSupport;
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v4[2](v4, 1, 0);
  }
  else
  {
    client = self->_client;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__HKCoreTelephonyClient_fetchStewieSupportedWithCompletion___block_invoke;
    v7[3] = &unk_1E37F0EF0;
    v7[4] = self;
    v8 = v4;
    -[CoreTelephonyClient getStewieSupportWithCompletion:](client, "getStewieSupportWithCompletion:", v7);

  }
}

void __60__HKCoreTelephonyClient_fetchStewieSupportedWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = a3;
  os_unfair_lock_lock(v6);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v9, "status"), v10);

}

- (BOOL)isEmergencyServicePhoneNumber:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  CoreTelephonyClient *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v27;

  v4 = a3;
  client = self->_client;
  v27 = 0;
  -[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](client, "getCurrentDataSubscriptionContextSync:", &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;
  if (v7)
  {
    _HKInitializeLogging();
    v8 = HKLogMedicalID;
    if (os_log_type_enabled((os_log_t)HKLogMedicalID, OS_LOG_TYPE_ERROR))
      -[HKCoreTelephonyClient isEmergencyServicePhoneNumber:].cold.2((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 0;
  }
  else
  {
    v16 = self->_client;
    v26 = 0;
    v15 = -[CoreTelephonyClient isEmergencyNumberWithWhitelistIncluded:number:error:](v16, "isEmergencyNumberWithWhitelistIncluded:number:error:", v6, v4, &v26);
    v17 = v26;
    if (v17)
    {
      _HKInitializeLogging();
      v18 = HKLogMedicalID;
      if (os_log_type_enabled((os_log_t)HKLogMedicalID, OS_LOG_TYPE_ERROR))
        -[HKCoreTelephonyClient isEmergencyServicePhoneNumber:].cold.1((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
      v15 = 0;
    }

  }
  return v15;
}

- (void)invalidateCachedCountryCode
{
  os_unfair_lock_s *p_lock;
  NSString *cachedCountryCode;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedCountryCode = self->_cachedCountryCode;
  self->_cachedCountryCode = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)onForeground:(id)a3
{
  NSObject *v4;
  NSString *cachedCountryCode;
  CTStewieSupport *cachedStewieSupport;
  _QWORD v7[5];
  char v8;
  uint8_t buf[4];
  HKCoreTelephonyClient *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2082;
    v12 = "-[HKCoreTelephonyClient onForeground:]";
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s] flushing caches", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  cachedCountryCode = self->_cachedCountryCode;
  self->_cachedCountryCode = 0;

  cachedStewieSupport = self->_cachedStewieSupport;
  self->_cachedStewieSupport = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (cachedStewieSupport)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__HKCoreTelephonyClient_onForeground___block_invoke;
    v7[3] = &unk_1E37F0F18;
    v8 = 1;
    v7[4] = self;
    -[HKCoreTelephonyClient fetchStewieSupportedWithCompletion:](self, "fetchStewieSupportedWithCompletion:", v7);
  }
}

void __38__HKCoreTelephonyClient_onForeground___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v5 = a3;
  if (*(unsigned __int8 *)(a1 + 40) != a2)
  {
    v9 = v5;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    v5 = v9;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stewieSupportChanged:", *(_QWORD *)(a1 + 32));

      v5 = v9;
    }
  }

}

- (void)plmnChanged:(id)a3 plmn:(id)a4
{
  NSObject *v5;
  int v6;
  HKCoreTelephonyClient *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v5 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2082;
    v9 = "-[HKCoreTelephonyClient plmnChanged:plmn:]";
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s]", (uint8_t *)&v6, 0x16u);
  }
  -[HKCoreTelephonyClient invalidateCachedCountryCode](self, "invalidateCachedCountryCode");
}

- (void)subscriptionInfoDidChange
{
  NSObject *v3;
  int v4;
  HKCoreTelephonyClient *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    v4 = 138543618;
    v5 = self;
    v6 = 2082;
    v7 = "-[HKCoreTelephonyClient subscriptionInfoDidChange]";
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s]", (uint8_t *)&v4, 0x16u);
  }
  -[HKCoreTelephonyClient invalidateCachedCountryCode](self, "invalidateCachedCountryCode");
}

- (void)activeSubscriptionsDidChange
{
  NSObject *v3;
  int v4;
  HKCoreTelephonyClient *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    v4 = 138543618;
    v5 = self;
    v6 = 2082;
    v7 = "-[HKCoreTelephonyClient activeSubscriptionsDidChange]";
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s]", (uint8_t *)&v4, 0x16u);
  }
  -[HKCoreTelephonyClient invalidateCachedCountryCode](self, "invalidateCachedCountryCode");
}

- (void)simLessSubscriptionsDidChange
{
  NSObject *v3;
  int v4;
  HKCoreTelephonyClient *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    v4 = 138543618;
    v5 = self;
    v6 = 2082;
    v7 = "-[HKCoreTelephonyClient simLessSubscriptionsDidChange]";
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s]", (uint8_t *)&v4, 0x16u);
  }
  -[HKCoreTelephonyClient invalidateCachedCountryCode](self, "invalidateCachedCountryCode");
}

- (void)stewieSupportChanged
{
  NSObject *v3;
  CTStewieSupport *cachedStewieSupport;
  void *v5;
  char v6;
  void *v7;
  int v8;
  HKCoreTelephonyClient *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2082;
    v11 = "-[HKCoreTelephonyClient stewieSupportChanged]";
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s]", (uint8_t *)&v8, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  cachedStewieSupport = self->_cachedStewieSupport;
  self->_cachedStewieSupport = 0;

  os_unfair_lock_unlock(&self->_lock);
  -[HKCoreTelephonyClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HKCoreTelephonyClient delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stewieSupportChanged:", self);

  }
}

- (HKCoreTelephonyClientDelegate)delegate
{
  return (HKCoreTelephonyClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedStewieSupport, 0);
  objc_storeStrong((id *)&self->_cachedCountryCode, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)isEmergencyServicePhoneNumber:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Error validating if number is emergency number with error, %{public}@", a5, a6, a7, a8, 2u);
}

- (void)isEmergencyServicePhoneNumber:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Failed to get CTXPCServiceSubscriptionInfo with error, %{public}@", a5, a6, a7, a8, 2u);
}

@end
