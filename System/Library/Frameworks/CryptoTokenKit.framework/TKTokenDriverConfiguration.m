@implementation TKTokenDriverConfiguration

+ (id)driverConfigurationsWithClient:(id)a3
{
  TKClientToken *v3;
  void *v4;
  TKTokenConfigurationConnection *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = (TKClientToken *)a3;
  if (!v3)
    v3 = -[TKClientToken initWithTokenID:]([TKClientToken alloc], "initWithTokenID:", &stru_1E708AD68);
  -[TKClientToken configurationEndpoint](v3, "configurationEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[TKTokenConfigurationConnection initWithEndpoint:]([TKTokenConfigurationConnection alloc], "initWithEndpoint:", v4);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    v21 = (id)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    -[TKTokenConfigurationConnection configurationProtocol](v5, "configurationProtocol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __61__TKTokenDriverConfiguration_driverConfigurationsWithClient___block_invoke;
    v13 = &unk_1E7089910;
    v7 = v5;
    v14 = v7;
    v15 = &v16;
    objc_msgSend(v6, "getClassIDsWithReply:", &v10);

    v8 = (void *)objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    TK_LOG_tokencfg();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[TKTokenDriverConfiguration driverConfigurationsWithClient:].cold.1(v7);
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

void __61__TKTokenDriverConfiguration_driverConfigurationsWithClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TKTokenDriverConfiguration *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = -[TKTokenDriverConfiguration initWithClassID:configurationConnection:]([TKTokenDriverConfiguration alloc], "initWithClassID:configurationConnection:", v8, *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v9, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

+ (NSDictionary)driverConfigurations
{
  return (NSDictionary *)objc_msgSend(a1, "driverConfigurationsWithClient:", 0);
}

- (TKTokenDriverConfiguration)initWithClassID:(id)a3 configurationConnection:(id)a4
{
  id v7;
  id v8;
  TKTokenDriverConfiguration *v9;
  TKTokenDriverConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TKTokenDriverConfiguration;
  v9 = -[TKTokenDriverConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_classID, a3);
    objc_storeStrong((id *)&v10->_configurationConnection, a4);
  }

  return v10;
}

- (NSDictionary)tokenConfigurations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  TKTokenDriverConfiguration *v13;
  id v14;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenDriverConfiguration classID](self, "classID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __49__TKTokenDriverConfiguration_tokenConfigurations__block_invoke;
  v12 = &unk_1E7089938;
  v13 = self;
  v14 = v3;
  v6 = v3;
  objc_msgSend(v4, "getTokenIDsForClassID:reply:", v5, &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return (NSDictionary *)v7;
}

void __49__TKTokenDriverConfiguration_tokenConfigurations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  TKTokenConfiguration *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = -[TKTokenConfiguration initWithTokenID:configurationConnection:]([TKTokenConfiguration alloc], "initWithTokenID:configurationConnection:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v8, "instanceID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (id)beginTransaction
{
  void *v3;

  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginTransactionWithReply:", &__block_literal_global_175);

  return -[TKTokenConfigurationTransaction initWithConfigurationConnection:]([TKTokenConfigurationTransaction alloc], "initWithConfigurationConnection:", self->_configurationConnection);
}

- (TKTokenConfiguration)addTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID
{
  return (TKTokenConfiguration *)-[TKTokenDriverConfiguration createTokenConfigurationWithInstanceID:persistent:](self, "createTokenConfigurationWithInstanceID:persistent:", instanceID, 1);
}

- (id)createTokenConfigurationWithInstanceID:(id)a3 persistent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  TKTokenID *v7;
  void *v8;
  TKTokenID *v9;
  id v10;
  _QWORD v12[4];
  TKTokenID *v13;
  TKTokenDriverConfiguration *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a4;
  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v7 = -[TKTokenID initWithClassID:instanceID:]([TKTokenID alloc], "initWithClassID:instanceID:", self->_classID, v6);
  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__TKTokenDriverConfiguration_createTokenConfigurationWithInstanceID_persistent___block_invoke;
  v12[3] = &unk_1E7089350;
  v15 = &v16;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v8, "createTokenID:persistent:reply:", v9, v4, v12);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __80__TKTokenDriverConfiguration_createTokenConfigurationWithInstanceID_persistent___block_invoke(_QWORD *a1)
{
  TKTokenConfiguration *v2;
  uint64_t v3;
  void *v4;

  v2 = -[TKTokenConfiguration initWithTokenID:configurationConnection:]([TKTokenConfiguration alloc], "initWithTokenID:configurationConnection:", a1[4], *(_QWORD *)(a1[5] + 8));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID
{
  NSString *v4;
  void *v5;
  TKTokenID *v6;

  v4 = instanceID;
  v6 = -[TKTokenID initWithClassID:instanceID:]([TKTokenID alloc], "initWithClassID:instanceID:", self->_classID, v4);

  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTokenID:reply:", v6, &__block_literal_global_176);

}

- (TKTokenDriverClassID)classID
{
  return self->_classID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classID, 0);
  objc_storeStrong((id *)&self->_configurationConnection, 0);
}

+ (void)driverConfigurationsWithClient:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9768000, log, OS_LOG_TYPE_ERROR, "Failed to get configurationEndpoint, returning empty configurations", v1, 2u);
}

@end
