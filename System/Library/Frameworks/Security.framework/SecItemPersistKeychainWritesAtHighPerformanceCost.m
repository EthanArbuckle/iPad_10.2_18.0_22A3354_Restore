@implementation SecItemPersistKeychainWritesAtHighPerformanceCost

void __SecItemPersistKeychainWritesAtHighPerformanceCost_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("SecError");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "xpc: failure to obtain XPC proxy object for Item Persistence, %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;

}

void __SecItemPersistKeychainWritesAtHighPerformanceCost_block_invoke_77(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109378;
      v8[1] = a2;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "xpc: Failed to persist keychain writes: %d %@", (uint8_t *)v8, 0x12u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  }
  else
  {
    secLogObjForScope("xpc");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "Successfully persisted keychain data to disk", (uint8_t *)v8, 2u);
    }

  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

@end
