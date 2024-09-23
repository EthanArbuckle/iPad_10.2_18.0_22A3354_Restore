@implementation HKLookUpAppPrivacyPolicyURLOperation

- (HKLookUpAppPrivacyPolicyURLOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKLookUpAppPrivacyPolicyURLOperation)initWithBundleIdentifier:(id)a3
{
  id v4;
  HKLookUpAppPrivacyPolicyURLOperation *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKLookUpAppPrivacyPolicyURLOperation;
  v5 = -[HKLookUpAppPrivacyPolicyURLOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[HKLookUpAppPrivacyPolicyURLOperation bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p bundleIdentifier: %@>"), v4, self, v6);

  return v7;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[HKLookUpAppPrivacyPolicyURLOperation bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HKLookUpAppPrivacyPolicyURLOperation;
  -[HKLookUpAppPrivacyPolicyURLOperation debugDescription](&v10, sel_debugDescription);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p bundleIdentifier: %@, operationDescription: %@>"), v4, self, v6, v7);

  return v8;
}

- (void)cancel
{
  HKLookUpAppPrivacyPolicyURLOperation *v2;
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  HKLookUpAppPrivacyPolicyURLOperation *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!-[HKLookUpAppPrivacyPolicyURLOperation isFinished](v2, "isFinished"))
  {
    v5.receiver = v2;
    v5.super_class = (Class)HKLookUpAppPrivacyPolicyURLOperation;
    -[HKLookUpAppPrivacyPolicyURLOperation cancel](&v5, sel_cancel);
    -[HKLookUpAppPrivacyPolicyURLOperation outstandingPromise](v2, "outstandingPromise");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    -[HKLookUpAppPrivacyPolicyURLOperation setOutstandingPromise:](v2, "setOutstandingPromise:", 0);
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v2;
      _os_log_impl(&dword_1D7813000, v4, OS_LOG_TYPE_INFO, "%{public}@ did cancel", buf, 0xCu);
    }
    -[HKLookUpAppPrivacyPolicyURLOperation setExecuting:](v2, "setExecuting:", 0);
    -[HKLookUpAppPrivacyPolicyURLOperation setFinished:](v2, "setFinished:", 1);
  }
  objc_sync_exit(v2);

}

- (void)_performLookup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CFD9E8];
  objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bagForProfile:profileVersion:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CFDB48]);
  v8 = (void *)objc_msgSend(v7, "initWithType:clientIdentifier:clientVersion:bag:", 0, *MEMORY[0x1E0CB7630], CFSTR("1"), v6);
  -[HKLookUpAppPrivacyPolicyURLOperation bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBundleIdentifiers:", v10);

  objc_msgSend(v8, "setAdditionalQueryParams:", &unk_1E9CED740);
  objc_msgSend(v8, "perform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke;
  v12[3] = &unk_1E9C42A58;
  v12[4] = self;
  objc_msgSend(v11, "addFinishBlock:", v12);
  -[HKLookUpAppPrivacyPolicyURLOperation setOutstandingPromise:](self, "setOutstandingPromise:", v11);

}

void __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  os_log_t *v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v24 = a3;
  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  v8 = v7;
  objc_sync_enter(v8);
  if ((objc_msgSend(*v6, "isCancelled") & 1) == 0)
  {
    if (v5)
    {
      objc_msgSend(v5, "responseDataItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ios"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("privacyPolicyUrl"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      HKSafeObject();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;

      v16 = (os_log_t *)MEMORY[0x1E0CB52D8];
      if (v15)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
          __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke_cold_2();
      }
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          _HKInitializeLogging();
          v18 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
          {
            v19 = v18;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v20 = *v6;
              objc_msgSend(*v6, "privacyPolicyURL");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              HKSensitiveLogItem();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v26 = v20;
              v27 = 2112;
              v28 = v22;
              _os_log_impl(&dword_1D7813000, v19, OS_LOG_TYPE_INFO, "%{public}@ did finish with privacy policy URL: %@", buf, 0x16u);

            }
          }
        }
      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(*v6, "setPrivacyPolicyURL:", v17);

    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke_cold_1();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/healthcare/health-records/"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v6, "setPrivacyPolicyURL:", v15);
    }

    objc_msgSend(*v6, "setError:", v24);
    objc_msgSend(*v6, "setExecuting:", 0);
    objc_msgSend(*v6, "setFinished:", 1);
    objc_msgSend(*v6, "setOutstandingPromise:", 0);
  }
  objc_sync_exit(v8);

}

- (void)start
{
  HKLookUpAppPrivacyPolicyURLOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  if ((-[HKLookUpAppPrivacyPolicyURLOperation isReady](obj, "isReady") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-start received by operation %@"), obj);
  if (-[HKLookUpAppPrivacyPolicyURLOperation isCancelled](obj, "isCancelled"))
  {
    -[HKLookUpAppPrivacyPolicyURLOperation setFinished:](obj, "setFinished:", 1);
  }
  else
  {
    -[HKLookUpAppPrivacyPolicyURLOperation setExecuting:](obj, "setExecuting:", 1);
    -[HKLookUpAppPrivacyPolicyURLOperation _performLookup](obj, "_performLookup");
  }
  objc_sync_exit(obj);

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setExecuting:(BOOL)a3
{
  HKLookUpAppPrivacyPolicyURLOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  -[HKLookUpAppPrivacyPolicyURLOperation willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("isExecuting"));
  obj->_executing = a3;
  -[HKLookUpAppPrivacyPolicyURLOperation didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("isExecuting"));
  objc_sync_exit(obj);

}

- (BOOL)isExecuting
{
  HKLookUpAppPrivacyPolicyURLOperation *v2;
  BOOL executing;

  v2 = self;
  objc_sync_enter(v2);
  executing = v2->_executing;
  objc_sync_exit(v2);

  return executing;
}

- (void)setFinished:(BOOL)a3
{
  HKLookUpAppPrivacyPolicyURLOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  -[HKLookUpAppPrivacyPolicyURLOperation willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("isFinished"));
  obj->_finished = a3;
  -[HKLookUpAppPrivacyPolicyURLOperation didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("isFinished"));
  objc_sync_exit(obj);

}

- (BOOL)isFinished
{
  HKLookUpAppPrivacyPolicyURLOperation *v2;
  BOOL finished;

  v2 = self;
  objc_sync_enter(v2);
  finished = v2->_finished;
  objc_sync_exit(v2);

  return finished;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)privacyPolicyURL
{
  return (NSURL *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPrivacyPolicyURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 272, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (AMSPromise)outstandingPromise
{
  return (AMSPromise *)objc_getProperty(self, a2, 280, 1);
}

- (void)setOutstandingPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingPromise, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

void __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "%{public}@ failed to look up privacy policy URL: %{public}@");
}

void __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "%{public}@ encountered error parsing the privacy policy URL: %{public}@");
}

@end
