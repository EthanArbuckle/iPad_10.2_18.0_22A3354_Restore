@implementation GEONetworkDefaults

void __39__GEONetworkDefaults_allKeysAndValues___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (GEONetworkDefaults)sharedNetworkDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__GEONetworkDefaults_sharedNetworkDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBC050 != -1)
    dispatch_once(&qword_1ECDBC050, block);
  return (GEONetworkDefaults *)(id)qword_1ECDBC048;
}

- (void)allKeysAndValues:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  GEODefaultsDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  geo_isolate_sync_data();
  if (!*((_BYTE *)v12 + 24))
    -[GEONetworkDefaults updateNetworkDefaultsWithReason:completionHandler:](self, "updateNetworkDefaultsWithReason:completionHandler:", 5, 0, v8, 3221225472, __39__GEONetworkDefaults_allKeysAndValues___block_invoke, &unk_1E1C04318, self, v6, v7, &v11);

  _Block_object_dispose(&v11, 8);
}

uint64_t __26__GEONetworkDefaults_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_updateReason");
  if (!v2)
  {
    result = GEOConfigGetBOOL(GeoServicesConfig_ShouldAlwaysUpdateNetworkDefaultsAtLaunch, (uint64_t)off_1EDF4D3B8);
    if (!(_DWORD)result)
      return result;
    v2 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateNetworkDefaultsWithReason:completionHandler:", v2, 0);
}

- (void)updateNetworkDefaultsWithReason:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  _GEONetworkDefaultsServerProxy *serverProxy;
  void (**v8)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  serverProxy = self->_serverProxy;
  if (serverProxy)
  {
    v8 = v6;
    -[_GEONetworkDefaultsServerProxy updateNetworkDefaultsWithReason:completionHandler:](serverProxy, "updateNetworkDefaultsWithReason:completionHandler:", a3);
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  if (v6)
  {
    v8 = v6;
    v6[2](v6, 0);
    goto LABEL_5;
  }
LABEL_6:

}

void __34__GEONetworkDefaults_valueForKey___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) != 0;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(unsigned __int8 *)(v3 + 24);
  if (*(_BYTE *)(v3 + 24))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v6);
  if (v4)
  {

  }
}

void __43__GEONetworkDefaults_sharedNetworkDefaults__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECDBC048;
  qword_1ECDBC048 = (uint64_t)v1;

}

- (GEONetworkDefaults)init
{
  GEONetworkDefaults *v2;
  uint64_t v3;
  id v4;
  NSDictionary *networkDefaults;
  uint64_t v6;
  geo_isolater *networkDefaultsIsolation;
  __objc2_class **v8;
  _GEONetworkDefaultsServerProxy *v9;
  _GEONetworkDefaultsServerProxy *serverProxy;
  GEONetworkDefaults *v11;
  GEONetworkDefaults *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GEONetworkDefaults;
  v2 = -[GEONetworkDefaults init](&v15, sel_init);
  if (v2)
  {
    v14 = 0;
    readNetworkDefaultsFromFile((uint64_t *)&v14);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v14;
    networkDefaults = v2->_networkDefaults;
    v2->_networkDefaults = (NSDictionary *)v3;

    v6 = geo_isolater_create();
    networkDefaultsIsolation = v2->_networkDefaultsIsolation;
    v2->_networkDefaultsIsolation = (geo_isolater *)v6;

    if ((byte_1ECDBC041 & 1) == 0)
    {
      if (_MergedGlobals_240)
        v8 = off_1E1BEF328;
      else
        v8 = off_1E1BEF330;
      v9 = (_GEONetworkDefaultsServerProxy *)objc_alloc_init(*v8);
      serverProxy = v2->_serverProxy;
      v2->_serverProxy = v9;

    }
    -[_GEONetworkDefaultsServerProxy setDelegate:](v2->_serverProxy, "setDelegate:", v2);
    v13 = v2;
    geo_dispatch_async_qos();
    v11 = v13;

  }
  return v2;
}

- (id)valueForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  if (v4)
  {
    GEODefaultsDomain();
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__47;
    v13 = __Block_byref_object_dispose__47;
    v14 = 0;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    geo_isolate_sync_data();
    if (!*((_BYTE *)v16 + 24))
      -[GEONetworkDefaults updateNetworkDefaultsWithReason:completionHandler:](self, "updateNetworkDefaultsWithReason:completionHandler:", 5, 0);
    v6 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)setUseLocalProxy:(BOOL)a3
{
  _MergedGlobals_240 = a3;
}

+ (BOOL)useLocalProxy
{
  return _MergedGlobals_240;
}

- (void)updateIfNecessary:(id)a3
{
  uint64_t v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  v4 = -[_GEONetworkDefaultsServerProxy _updateReason](self->_serverProxy, "_updateReason");
  if (v4)
  {
    -[GEONetworkDefaults updateNetworkDefaultsWithReason:completionHandler:](self, "updateNetworkDefaultsWithReason:completionHandler:", v4, v5);
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }

}

- (void)updateNetworkDefaults:(id)a3
{
  -[GEONetworkDefaults updateNetworkDefaultsWithReason:completionHandler:](self, "updateNetworkDefaultsWithReason:completionHandler:", 4, a3);
}

- (id)allKeys
{
  void *v3;
  id v4;
  id v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  GEODefaultsDomain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__47;
  v13 = __Block_byref_object_dispose__47;
  v14 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v4 = v3;
  v8 = v4;
  geo_isolate_sync_data();
  if (!*((_BYTE *)v16 + 24))
    -[GEONetworkDefaults updateNetworkDefaultsWithReason:completionHandler:](self, "updateNetworkDefaultsWithReason:completionHandler:", 5, 0, v7, 3221225472, __29__GEONetworkDefaults_allKeys__block_invoke, &unk_1E1C03ED8, self, v4, &v15, &v9);
  v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __29__GEONetworkDefaults_allKeys__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (void)serverProxy:(id)a3 networkDefaultsDidChange:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[10];
  id v9;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  block[5] = MEMORY[0x1E0C809B0];
  block[6] = 3221225472;
  block[7] = __59__GEONetworkDefaults_serverProxy_networkDefaultsDidChange___block_invoke;
  block[8] = &unk_1E1C00738;
  block[9] = self;
  v9 = v5;
  v7 = v5;
  geo_isolate_sync_data();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __59__GEONetworkDefaults_serverProxy_networkDefaultsDidChange___block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__GEONetworkDefaults_serverProxy_networkDefaultsDidChange___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

void __59__GEONetworkDefaults_serverProxy_networkDefaultsDidChange___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GEONetworkDefaultsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkDefaultsIsolation, 0);
  objc_storeStrong((id *)&self->_networkDefaults, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
}

@end
