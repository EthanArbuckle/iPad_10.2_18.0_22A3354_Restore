@implementation MSKeyValueStore

+ (id)valueForKey:(id)a3
{
  id v3;
  MSKeyValueStore *v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  dispatch_semaphore_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v4 = objc_alloc_init(MSKeyValueStore);
  -[MSMailDefaultService setShouldLaunchMobileMail:](v4, "setShouldLaunchMobileMail:", 1);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __31__MSKeyValueStore_valueForKey___block_invoke;
  v10[3] = &unk_24C385468;
  v6 = v3;
  v12 = v5;
  v13 = &v14;
  v11 = v6;
  v7 = v5;
  -[MSKeyValueStore _valueForKey:handler:](v4, "_valueForKey:handler:", v6, v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __31__MSKeyValueStore_valueForKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    MFLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_20AC30000, v8, OS_LOG_TYPE_DEFAULT, "#Warning failed to retrieve value for key '%@' error: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_valueForKey:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = (void *)MEMORY[0x20BD2EA04]();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, CFSTR("key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__MSKeyValueStore__valueForKey_handler___block_invoke;
  v10[3] = &unk_24C385178;
  v9 = v6;
  v11 = v9;
  -[MSService _callServicesMethod:arguments:callback:](self, "_callServicesMethod:arguments:callback:", CFSTR("MailValueForKey"), v8, v10);

  objc_autoreleasePoolPop(v7);
}

void __40__MSKeyValueStore__valueForKey_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "objectForKey:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("MailValueForKey")))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("key"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = CFSTR("SignatureKey");
    v20[1] = CFSTR("UseAccountSignatures");
    v21[0] = CFSTR("Sent from my iPhone Simulator");
    v21[1] = MEMORY[0x24BDBD1C0];
    v12 = *MEMORY[0x24BE2E390];
    v20[2] = *MEMORY[0x24BE2E380];
    v20[3] = v12;
    v21[2] = MEMORY[0x24BDBD1C0];
    v21[3] = &unk_24C38A1C0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      v18 = CFSTR("value");
      v19 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v10[2](v10, v16, 0);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MSKeyValueStore;
    -[MSService _simulateServicesMethod:arguments:callback:](&v17, sel__simulateServicesMethod_arguments_callback_, v8, v9, v10);
  }

}

@end
