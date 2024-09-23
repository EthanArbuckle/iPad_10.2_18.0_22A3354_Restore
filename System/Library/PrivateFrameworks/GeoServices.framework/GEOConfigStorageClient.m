@implementation GEOConfigStorageClient

+ (GEOConfigStorageClient)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__GEOConfigStorageClient_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBC070 != -1)
    dispatch_once(&qword_1ECDBC070, block);
  return (GEOConfigStorageClient *)(id)_MergedGlobals_241;
}

- (id)getAllKeysAndValuesForOptions:(unint64_t)a3
{
  return _GEOGetAllValuesInStore(a3);
}

- (void)getExpiringKeys:(unint64_t)a3 result:(id)a4
{
  id v5;
  GEOConfigGetExpiringKeysRequest *v6;
  void *v7;
  void *global_queue;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = -[GEOConfigGetExpiringKeysRequest initWithTraits:auditToken:throttleToken:]([GEOConfigGetExpiringKeysRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOConfigGetExpiringKeysRequest setKeyOptions:](v6, "setKeyOptions:", a3);
  _GEODefaultsServerConnection();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  global_queue = (void *)geo_get_global_queue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__GEOConfigStorageClient_getExpiringKeys_result___block_invoke;
  v10[3] = &unk_1E1C0C820;
  v11 = v5;
  v9 = v5;
  -[GEOXPCRequest send:withReply:handler:](v6, "send:withReply:handler:", v7, global_queue, v10);

}

void __32__GEOConfigStorageClient_shared__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)_MergedGlobals_241;
  _MergedGlobals_241 = v1;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOConfigStorageClient;
  return -[GEOConfigStorageClient init](&v3, sel_init);
}

void __49__GEOConfigStorageClient_getExpiringKeys_result___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "expiringKeys");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v9;
  id v10;
  GEOConfigStorageGetValueForKeyRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a4;
  v10 = a3;
  v11 = -[GEOConfigStorageGetValueForKeyRequest initWithTraits:auditToken:throttleToken:]([GEOConfigStorageGetValueForKeyRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOConfigStorageGetValueForKeyRequest setKeyOptions:](v11, "setKeyOptions:", a5);
  -[GEOConfigStorageGetValueForKeyRequest setKeyString:](v11, "setKeyString:", v10);

  -[GEOConfigStorageGetValueForKeyRequest setCountryCode:](v11, "setCountryCode:", v9);
  _GEODefaultsServerConnection();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCRequest sendSync:error:](v11, "sendSync:error:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "keyValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6 && v14)
    *a6 = objc_msgSend(v13, "keySource");
  objc_msgSend(v13, "keyValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)migrateEntitledKey:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  GEOConfigMigrateEntitledKeyRequest *v7;

  v5 = a3;
  v7 = -[GEOConfigMigrateEntitledKeyRequest initWithTraits:auditToken:throttleToken:]([GEOConfigMigrateEntitledKeyRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOConfigMigrateEntitledKeyRequest setKeyString:](v7, "setKeyString:", v5);

  -[GEOConfigMigrateEntitledKeyRequest setKeyOptions:](v7, "setKeyOptions:", a4);
  _GEODefaultsServerConnection();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCRequest send:](v7, "send:", v6);

}

- (void)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 result:(id)a6
{
  id v9;
  id v10;
  id v11;
  GEOConfigStorageGetValueForKeyRequest *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[GEOConfigStorageGetValueForKeyRequest initWithTraits:auditToken:throttleToken:]([GEOConfigStorageGetValueForKeyRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOConfigStorageGetValueForKeyRequest setKeyOptions:](v12, "setKeyOptions:", a5);
  -[GEOConfigStorageGetValueForKeyRequest setKeyString:](v12, "setKeyString:", v11);

  -[GEOConfigStorageGetValueForKeyRequest setCountryCode:](v12, "setCountryCode:", v10);
  _GEODefaultsServerConnection();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__GEOConfigStorageClient_getConfigValueForKey_countryCode_options_result___block_invoke;
  v15[3] = &unk_1E1C0C7F8;
  v16 = v9;
  v14 = v9;
  -[GEOXPCRequest send:withReply:handler:](v12, "send:withReply:handler:", v13, MEMORY[0x1E0C80D38], v15);

}

void __74__GEOConfigStorageClient_getConfigValueForKey_countryCode_options_result___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v3, "keySource");
  objc_msgSend(v3, "keyValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (void)setConfigKeyExpiry:(id)a3 options:(unint64_t)a4 date:(id)a5 osVersion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  GEOConfigSetExpiringKeyRequest *v13;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v13 = -[GEOConfigSetExpiringKeyRequest initWithTraits:auditToken:throttleToken:]([GEOConfigSetExpiringKeyRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOConfigSetExpiringKeyRequest setKeyString:](v13, "setKeyString:", v11);

  -[GEOConfigSetExpiringKeyRequest setKeyOptions:](v13, "setKeyOptions:", a4);
  -[GEOConfigSetExpiringKeyRequest setExpireTime:](v13, "setExpireTime:", v10);

  -[GEOConfigSetExpiringKeyRequest setExpireOSVersion:](v13, "setExpireOSVersion:", v9);
  _GEODefaultsServerConnection();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCRequest send:](v13, "send:", v12);

}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  GEOConfigStorageSetValueForKeyRequest *v13;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  v13 = -[GEOConfigStorageSetValueForKeyRequest initWithTraits:auditToken:throttleToken:]([GEOConfigStorageSetValueForKeyRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOConfigStorageSetValueForKeyRequest setKeyOptions:](v13, "setKeyOptions:", a5);
  -[GEOConfigStorageSetValueForKeyRequest setKeyString:](v13, "setKeyString:", v9);

  -[GEOConfigStorageSetValueForKeyRequest setKeyValue:](v13, "setKeyValue:", v10);
  _GEODefaultsServerConnection();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v12 = -[GEOXPCRequest sendSync:error:](v13, "sendSync:error:", v11, 0);
  else
    -[GEOXPCRequest send:](v13, "send:", v11);

}

@end
