@implementation HKDarwinNotificationDataSource

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v14;
  id v15;
  int out_token;

  v5 = a3;
  v6 = a4;
  out_token = 0;
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __78__HKDarwinNotificationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke;
  handler[3] = &unk_1E37F5A40;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  notify_register_dispatch(v8, &out_token, MEMORY[0x1E0C80D38], handler);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __78__HKDarwinNotificationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyObserversOfChangeForKey:newValue:", v2, v3);

}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "intValue");
    if (v6 != -1)
      notify_cancel(v6);
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[HKDarwinNotificationDataSource unregisterBridgedObserver:forKey:].cold.1((uint64_t)self, (uint64_t)v5, v7);

  }
}

- (void)unregisterBridgedObserver:(NSObject *)a3 forKey:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v4;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot unregister observer of type %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
