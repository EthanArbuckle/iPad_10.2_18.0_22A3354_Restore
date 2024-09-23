@implementation CacheDeleteRemoteExtensionContext

void __70__CacheDeleteRemoteExtensionContext_servicePurgeable_info_replyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEFAULT, "calling completeRequestReturningItems", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "serviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "completeRequestReturningItems:completionHandler:", 0, &__block_literal_global_62);

}

- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v6 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  CDGetLogHandle((uint64_t)"client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = v6;
    _os_log_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEFAULT, "purgeable, urgency: %d", buf, 8u);
  }

  +[CacheDeleteServiceListener cacheDeleteServiceListener:options:](CacheDeleteServiceListener, "cacheDeleteServiceListener:options:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__CacheDeleteRemoteExtensionContext_servicePurgeable_info_replyBlock___block_invoke;
    v12[3] = &unk_1E4A33258;
    v14 = v8;
    v13 = v10;
    objc_msgSend(v13, "servicePurgeable:info:replyBlock:", v6, v7, v12);

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v11, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    (*((void (**)(id, void *))v8 + 2))(v8, &unk_1E4A38FA0);
  }

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_9 != -1)
    dispatch_once(&_MergedGlobals_9, &__block_literal_global_11);
  return (id)qword_1ECE24350;
}

void __70__CacheDeleteRemoteExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6C7F08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE24360;
  qword_1ECE24360 = v0;

}

void __68__CacheDeleteRemoteExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6C7350);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE24350;
  qword_1ECE24350 = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1ECE24358 != -1)
    dispatch_once(&qword_1ECE24358, &__block_literal_global_41_0);
  return (id)qword_1ECE24360;
}

- (CacheDeleteRemoteExtensionContext)init
{
  CacheDeleteRemoteExtensionContext *v2;
  NSObject *v3;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CacheDeleteRemoteExtensionContext;
  v2 = -[CacheDeleteRemoteExtensionContext init](&v6, sel_init);
  if (v2)
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "ENTRY", v5, 2u);
    }

  }
  return v2;
}

void __70__CacheDeleteRemoteExtensionContext_servicePurgeable_info_replyBlock___block_invoke_60(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2)
      v4 = "YES";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v6 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  CDGetLogHandle((uint64_t)"client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = v6;
    _os_log_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEFAULT, "purge, urgency: %d", buf, 8u);
  }

  +[CacheDeleteServiceListener cacheDeleteServiceListener:options:](CacheDeleteServiceListener, "cacheDeleteServiceListener:options:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__CacheDeleteRemoteExtensionContext_servicePurge_info_replyBlock___block_invoke;
    v12[3] = &unk_1E4A33258;
    v14 = v8;
    v13 = v10;
    objc_msgSend(v13, "servicePurge:info:replyBlock:", v6, v7, v12);

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v11, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    (*((void (**)(id, void *))v8 + 2))(v8, &unk_1E4A38FC8);
  }

}

void __66__CacheDeleteRemoteExtensionContext_servicePurge_info_replyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "serviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeRequestReturningItems:completionHandler:", 0, &__block_literal_global_71_0);

}

void __66__CacheDeleteRemoteExtensionContext_servicePurge_info_replyBlock___block_invoke_70(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2)
      v4 = "YES";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)serviceCancelPurge:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void (**v9)(_QWORD);
  uint8_t buf[16];

  v3 = (void (**)(_QWORD))a3;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "cancelPurge", buf, 2u);
  }

  +[CacheDeleteServiceListener cacheDeleteServiceListener:options:](CacheDeleteServiceListener, "cacheDeleteServiceListener:options:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__CacheDeleteRemoteExtensionContext_serviceCancelPurge___block_invoke;
    v7[3] = &unk_1E4A332A0;
    v9 = v3;
    v8 = v5;
    objc_msgSend(v8, "serviceCancelPurge:", v7);

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v6, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    v3[2](v3);
  }

}

void __56__CacheDeleteRemoteExtensionContext_serviceCancelPurge___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "serviceInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completeRequestReturningItems:completionHandler:", 0, &__block_literal_global_75);

}

void __56__CacheDeleteRemoteExtensionContext_serviceCancelPurge___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2)
      v4 = "YES";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v6 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  CDGetLogHandle((uint64_t)"client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = v6;
    _os_log_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEFAULT, "periodic, urgency: %d", buf, 8u);
  }

  +[CacheDeleteServiceListener cacheDeleteServiceListener:options:](CacheDeleteServiceListener, "cacheDeleteServiceListener:options:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__CacheDeleteRemoteExtensionContext_servicePeriodic_info_replyBlock___block_invoke;
    v12[3] = &unk_1E4A33258;
    v14 = v8;
    v13 = v10;
    objc_msgSend(v13, "servicePeriodic:info:replyBlock:", v6, v7, v12);

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v11, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    (*((void (**)(id, void *))v8 + 2))(v8, &unk_1E4A38FF0);
  }

}

void __69__CacheDeleteRemoteExtensionContext_servicePeriodic_info_replyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "serviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeRequestReturningItems:completionHandler:", 0, &__block_literal_global_77);

}

void __69__CacheDeleteRemoteExtensionContext_servicePeriodic_info_replyBlock___block_invoke_76(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2)
      v4 = "YES";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)serviceCallback:(id)a3 replyBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  CDGetLogHandle((uint64_t)"client");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEFAULT, "callback, urgency: %@", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Unsupported callback"), CFSTR("CACHE_DELETE_ERROR"));
  v6[2](v6, v8);

}

- (void)serviceNotify:(id)a3 replyBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(_QWORD);
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  CDGetLogHandle((uint64_t)"client");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEFAULT, "notify: %@", buf, 0xCu);
  }

  +[CacheDeleteServiceListener cacheDeleteServiceListener:options:](CacheDeleteServiceListener, "cacheDeleteServiceListener:options:", 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__CacheDeleteRemoteExtensionContext_serviceNotify_replyBlock___block_invoke;
    v10[3] = &unk_1E4A332A0;
    v12 = v6;
    v11 = v8;
    objc_msgSend(v11, "serviceNotify:replyBlock:", v5, v10);

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    v6[2](v6);
  }

}

void __62__CacheDeleteRemoteExtensionContext_serviceNotify_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "serviceInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completeRequestReturningItems:completionHandler:", 0, &__block_literal_global_83);

}

void __62__CacheDeleteRemoteExtensionContext_serviceNotify_replyBlock___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2)
      v4 = "YES";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)servicePing:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(_QWORD))a3;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "PING", v5, 2u);
  }

  v3[2](v3);
}

@end
