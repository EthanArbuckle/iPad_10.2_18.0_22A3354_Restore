@implementation MOSettingMetadata

- (id)defaultValue
{
  return self->_defaultValue;
}

- (MOSettingMetadata)initWithSettingName:(id)a3 defaultValue:(id)a4 isPublic:(BOOL)a5 scope:(id)a6 isPrivacySensitive:(BOOL)a7
{
  NSString *v12;
  id v13;
  NSString *v14;
  MOSettingMetadata *v15;
  NSString *settingName;
  NSString *v17;
  id defaultValue;
  id v19;
  NSString *scope;
  objc_super v22;

  v12 = (NSString *)a3;
  v13 = a4;
  v14 = (NSString *)a6;
  v22.receiver = self;
  v22.super_class = (Class)MOSettingMetadata;
  v15 = -[MOSettingMetadata init](&v22, sel_init);
  settingName = v15->_settingName;
  v15->_settingName = v12;
  v17 = v12;

  defaultValue = v15->_defaultValue;
  v15->_defaultValue = v13;
  v19 = v13;

  v15->_isPublic = a5;
  scope = v15->_scope;
  v15->_scope = v14;

  v15->_isPrivacySensitive = a7;
  return v15;
}

- (NSSet)responsibleClients
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  +[MOManagedSettingsAgentConnection oneTimeConnection](MOManagedSettingsAgentConnection, "oneTimeConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__MOSettingMetadata_responsibleClients__block_invoke;
  v7[3] = &unk_1E675E518;
  v7[4] = self;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v4, 1, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (NSSet *)v5;
}

void __39__MOSettingMetadata_responsibleClients__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  _QWORD v13[5];
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[MOLogger store](MOLogger, "store");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "settingName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Getting responsible clients for setting “%{public}@”", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "settingName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__MOSettingMetadata_responsibleClients__block_invoke_3;
    v13[3] = &unk_1E675E4F0;
    v13[4] = *(_QWORD *)(a1 + 32);
    v12 = *(_OWORD *)(a1 + 40);
    v11 = (id)v12;
    v14 = v12;
    objc_msgSend(v5, "responsibleClientsForSetting:replyHandler:", v10, v13);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __39__MOSettingMetadata_responsibleClients__block_invoke_cold_1((uint64_t)v6, v8);

  }
}

void __39__MOSettingMetadata_responsibleClients__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[MOLogger store](MOLogger, "store");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __39__MOSettingMetadata_responsibleClients__block_invoke_3_cold_1(a1, (uint64_t)v6, v8);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "settingName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Sucessfully got responsible clients %{public}@ for setting “%{public}@”", (uint8_t *)&v12, 0x16u);

    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v5;
    v8 = *(NSObject **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (NSString)settingName
{
  return self->_settingName;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (NSString)scope
{
  return self->_scope;
}

- (BOOL)isPrivacySensitive
{
  return self->_isPrivacySensitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_settingName, 0);
  objc_storeStrong(&self->_defaultValue, 0);
}

- (id)persistableValueFromValue:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)valueFromPersistableValue:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)sanitizePersistableValue:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  return result;
}

void __39__MOSettingMetadata_responsibleClients__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B4020000, a2, OS_LOG_TYPE_ERROR, "Unable to obtain remote object proxy. Error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __39__MOSettingMetadata_responsibleClients__block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "settingName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1B4020000, a3, OS_LOG_TYPE_ERROR, "Unable to get responsible clients for setting “%{public}@.” Error: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
