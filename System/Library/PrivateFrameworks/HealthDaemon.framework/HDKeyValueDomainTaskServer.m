@implementation HDKeyValueDomainTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB5250];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (HDKeyValueDomainTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  HDKeyValueDomainTaskServer *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  HDKeyValueDomain *v18;
  void *v19;
  uint64_t v20;
  HDKeyValueDomain *keyValueDomain;
  objc_super v23;

  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HDKeyValueDomainTaskServer;
  v12 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v23, sel_initWithUUID_configuration_client_delegate_, a3, v10, v11, a6);
  if (v12)
  {
    v13 = objc_msgSend(v10, "category");
    if (v13 > 4)
      v14 = -1;
    else
      v14 = qword_1B7F40F38[v13];
    objc_msgSend(v10, "domainName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("HDKeyValueEntityDefaultDomain")))
    {
      v16 = &stru_1E6D11BB8;
    }
    else
    {
      objc_msgSend(v10, "domainName");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    v18 = [HDKeyValueDomain alloc];
    objc_msgSend(v11, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v18, "initWithCategory:domainName:profile:", v14, v17, v19);
    keyValueDomain = v12->_keyValueDomain;
    v12->_keyValueDomain = (HDKeyValueDomain *)v20;

  }
  return v12;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  char v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "domainName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("{public}%@: domain name must be non-empty"), objc_opt_class());
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(v7, "category") >= 5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "category"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_assignError:code:format:", a5, 3, CFSTR("{public}%@: invalid HKKeyValueCategory: %@"), v13, v14);

    goto LABEL_11;
  }
  if ((objc_msgSend(v8, "hasEntitlement:", *MEMORY[0x1E0CB59B0]) & 1) == 0)
  {
    v15 = objc_msgSend(v7, "category");
    objc_opt_self();
    if (v15 <= 4 && ((0x1Bu >> v15) & 1) != 0)
    {
      v16 = **((id **)&unk_1E6CF89D8 + v15);
      if (v16)
      {
        objc_msgSend(v8, "entitlements");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "domainName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "arrayEntitlement:containsString:", v16, v21);

        if ((v22 & 1) != 0)
        {

          goto LABEL_4;
        }
      }
    }
    else
    {
      v16 = 0;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "domainName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_assignError:code:format:", a5, 4, CFSTR("Unauthorized access to key-value domain %@"), v18);

LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
LABEL_4:
  v11 = 1;
LABEL_12:

  return v11;
}

- (void)_unitTest_overrideKeyValueDomainCategory:(int64_t)a3
{
  HDKeyValueDomain *v5;
  void *v6;
  HDKeyValueDomain *v7;
  HDKeyValueDomain *keyValueDomain;
  id v9;

  v5 = [HDKeyValueDomain alloc];
  -[HDKeyValueDomain domainName](self->_keyValueDomain, "domainName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v5, "initWithCategory:domainName:profile:", a3, v9, v6);
  keyValueDomain = self->_keyValueDomain;
  self->_keyValueDomain = v7;

}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB67F0], "clientInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB67F0], "serverInterface");
}

- (void)remote_setNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  HDKeyValueDomain *keyValueDomain;
  uint64_t v10;
  id v11;
  id v12;

  v8 = (void (**)(id, uint64_t, id))a5;
  keyValueDomain = self->_keyValueDomain;
  v12 = 0;
  v10 = -[HDKeyValueDomain setNumber:forKey:error:](keyValueDomain, "setNumber:forKey:error:", a3, a4, &v12);
  v11 = v12;
  if (v8)
    v8[2](v8, v10, v11);

}

- (void)remote_setData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  HDKeyValueDomain *keyValueDomain;
  uint64_t v10;
  id v11;
  id v12;

  v8 = (void (**)(id, uint64_t, id))a5;
  keyValueDomain = self->_keyValueDomain;
  v12 = 0;
  v10 = -[HDKeyValueDomain setData:forKey:error:](keyValueDomain, "setData:forKey:error:", a3, a4, &v12);
  v11 = v12;
  if (v8)
    v8[2](v8, v10, v11);

}

- (void)remote_setDate:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  HDKeyValueDomain *keyValueDomain;
  uint64_t v10;
  id v11;
  id v12;

  v8 = (void (**)(id, uint64_t, id))a5;
  keyValueDomain = self->_keyValueDomain;
  v12 = 0;
  v10 = -[HDKeyValueDomain setDate:forKey:error:](keyValueDomain, "setDate:forKey:error:", a3, a4, &v12);
  v11 = v12;
  if (v8)
    v8[2](v8, v10, v11);

}

- (void)remote_setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  HDKeyValueDomain *keyValueDomain;
  uint64_t v10;
  id v11;
  id v12;

  v8 = (void (**)(id, uint64_t, id))a5;
  keyValueDomain = self->_keyValueDomain;
  v12 = 0;
  v10 = -[HDKeyValueDomain setString:forKey:error:](keyValueDomain, "setString:forKey:error:", a3, a4, &v12);
  v11 = v12;
  if (v8)
    v8[2](v8, v10, v11);

}

- (void)remote_setValuesWithDictionary:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  HDKeyValueDomain *keyValueDomain;
  uint64_t v8;
  id v9;
  id v10;

  v6 = (void (**)(id, uint64_t, id))a4;
  keyValueDomain = self->_keyValueDomain;
  v10 = 0;
  v8 = -[HDKeyValueDomain setValuesWithDictionary:error:](keyValueDomain, "setValuesWithDictionary:error:", a3, &v10);
  v9 = v10;
  if (v6)
    v6[2](v6, v8, v9);

}

- (void)remote_setValueForAllKeys:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  HDKeyValueDomain *keyValueDomain;
  uint64_t v8;
  id v9;
  id v10;

  v6 = (void (**)(id, uint64_t, id))a4;
  keyValueDomain = self->_keyValueDomain;
  v10 = 0;
  v8 = -[HDKeyValueDomain setValueForAllKeys:error:](keyValueDomain, "setValueForAllKeys:error:", a3, &v10);
  v9 = v10;
  if (v6)
    v6[2](v6, v8, v9);

}

- (void)remote_removeValuesForKeys:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  HDKeyValueDomain *keyValueDomain;
  uint64_t v8;
  id v9;
  id v10;

  v6 = (void (**)(id, uint64_t, id))a4;
  keyValueDomain = self->_keyValueDomain;
  v10 = 0;
  v8 = -[HDKeyValueDomain removeValuesForKeys:error:](keyValueDomain, "removeValuesForKeys:error:", a3, &v10);
  v9 = v10;
  if (v6)
    v6[2](v6, v8, v9);

}

- (void)remote_numberForKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__91;
  v20 = __Block_byref_object_dispose__91;
  v21 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HDKeyValueDomainTaskServer_remote_numberForKey_completion___block_invoke;
  v12[3] = &unk_1E6CF1528;
  v14 = &v16;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v9, "performHighPriorityTransactionsWithError:block:", &v15, v12);
  v11 = v15;

  if (v7)
    v7[2](v7, v17[5], v11);

  _Block_object_dispose(&v16, 8);
}

uint64_t __61__HDKeyValueDomainTaskServer_remote_numberForKey_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 40), "numberForKey:error:", a1[5], a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_dataForKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__91;
  v20 = __Block_byref_object_dispose__91;
  v21 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HDKeyValueDomainTaskServer_remote_dataForKey_completion___block_invoke;
  v12[3] = &unk_1E6CF1528;
  v14 = &v16;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v9, "performHighPriorityTransactionsWithError:block:", &v15, v12);
  v11 = v15;

  if (v7)
    v7[2](v7, v17[5], v11);

  _Block_object_dispose(&v16, 8);
}

uint64_t __59__HDKeyValueDomainTaskServer_remote_dataForKey_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 40), "dataForKey:error:", a1[5], a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_dateForKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__91;
  v20 = __Block_byref_object_dispose__91;
  v21 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HDKeyValueDomainTaskServer_remote_dateForKey_completion___block_invoke;
  v12[3] = &unk_1E6CF1528;
  v14 = &v16;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v9, "performHighPriorityTransactionsWithError:block:", &v15, v12);
  v11 = v15;

  if (v7)
    v7[2](v7, v17[5], v11);

  _Block_object_dispose(&v16, 8);
}

uint64_t __59__HDKeyValueDomainTaskServer_remote_dateForKey_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 40), "dateForKey:error:", a1[5], a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_stringForKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__91;
  v20 = __Block_byref_object_dispose__91;
  v21 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HDKeyValueDomainTaskServer_remote_stringForKey_completion___block_invoke;
  v12[3] = &unk_1E6CF1528;
  v14 = &v16;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v9, "performHighPriorityTransactionsWithError:block:", &v15, v12);
  v11 = v15;

  if (v7)
    v7[2](v7, v17[5], v11);

  _Block_object_dispose(&v16, 8);
}

uint64_t __61__HDKeyValueDomainTaskServer_remote_stringForKey_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 40), "stringForKey:error:", a1[5], a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_allValuesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD, id))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__91;
  v14 = __Block_byref_object_dispose__91;
  v15 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HDKeyValueDomainTaskServer_remote_allValuesWithCompletion___block_invoke;
  v8[3] = &unk_1E6CF1500;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v6, "performHighPriorityTransactionsWithError:block:", &v9, v8);
  v7 = v9;

  if (v4)
    v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);

}

uint64_t __61__HDKeyValueDomainTaskServer_remote_allValuesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allValuesWithError:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_observeChanges:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  HDKeyValueDomain *keyValueDomain;
  void (**v7)(id, uint64_t, _QWORD);

  v4 = a3;
  keyValueDomain = self->_keyValueDomain;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (v4)
    -[HDKeyValueDomain startObservation:](keyValueDomain, "startObservation:", self);
  else
    -[HDKeyValueDomain stopObservation:](keyValueDomain, "stopObservation:", self);
  v7[2](v7, 1, 0);

}

- (void)didUpdateKeyValueDomain:(id)a3
{
  void *v4;
  void *v5;
  HDKeyValueDomain *keyValueDomain;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  HDKeyValueDomainTaskServer *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HDKeyValueDomainTaskServer_didUpdateKeyValueDomain___block_invoke;
  v9[3] = &unk_1E6CE8030;
  v9[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
    {
      keyValueDomain = self->_keyValueDomain;
      v7 = v5;
      -[HDKeyValueDomain domainName](keyValueDomain, "domainName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "%{public}@: Notify client for domain:%{public}@ change", buf, 0x16u);

    }
    objc_msgSend(v4, "clientRemote_didUpdate");
  }

}

void __54__HDKeyValueDomainTaskServer_didUpdateKeyValueDomain___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    v5 = v2;
    objc_msgSend(v4, "domainName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client for domain:%{public}@ change", (uint8_t *)&v7, 0x16u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
}

@end
