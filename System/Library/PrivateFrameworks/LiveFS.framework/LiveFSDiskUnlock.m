@implementation LiveFSDiskUnlock

+ (void)unlockDomain:(id)a3 withPassword:(id)a4 saveToKeychain:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;

  v9 = a4;
  v10 = a6;
  objc_msgSend(a3, "storageURLs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke;
  v16[3] = &unk_24F64C310;
  v17 = v9;
  v18 = v10;
  v19 = a5;
  v14 = v9;
  v15 = v10;
  objc_msgSend(v13, "getFileProviderServicesForItemAtURL:completionHandler:", v12, v16);

}

void __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_22BD61000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "getFPServices: error %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.filesystems.unlock"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_1;
        v12[3] = &unk_24F64C2E8;
        v14 = *(id *)(a1 + 40);
        v13 = *(id *)(a1 + 32);
        v15 = *(_BYTE *)(a1 + 48);
        objc_msgSend(v7, "getFileProviderConnectionWithCompletionHandler:", v12);

        v8 = v14;
      }
      else
      {
        livefs_std_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v5;
          _os_log_impl(&dword_22BD61000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find unlock service in %@", buf, 0xCu);
        }

        v11 = *(_QWORD *)(a1 + 40);
        getNSErrorFromLiveFSErrno(53);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v8);
      }

    }
    else
    {
      v9 = *(_QWORD *)(a1 + 40);
      getNSErrorFromLiveFSErrno(45);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
    }

  }
}

void __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_22BD61000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "getFPConn: error %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255C02F10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v7);

    objc_msgSend(v5, "resume");
    v8 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_46;
    v14[3] = &unk_24F64BFB0;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(unsigned __int8 *)(a1 + 48);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_48;
    v12[3] = &unk_24F64BFB0;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v9, "unlockWithPassword:saveToKeychain:completionHandler:", v11, v10, v12);

  }
}

void __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_46_cold_1((uint64_t)v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_46_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_22BD61000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "connection error %@", (uint8_t *)&v1, 0xCu);
}

@end
