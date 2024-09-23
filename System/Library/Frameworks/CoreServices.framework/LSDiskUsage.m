@implementation LSDiskUsage

uint64_t __32___LSDiskUsage_encodeWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("knownUsage"));
}

void __27___LSDiskUsage_staticUsage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("static"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28___LSDiskUsage_dynamicUsage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("dynamic"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __38___LSDiskUsage_onDemandResourcesUsage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("ODR"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __27___LSDiskUsage_sharedUsage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("shared"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42___LSDiskUsage_removeAllCachedUsageValues__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("static"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  if (v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v2, CFSTR("static"));

}

void __32___LSDiskUsage_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithFormat:", CFSTR("<%@ %p> { %@ }"), v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __38___LSDiskUsage_Internal___serverQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("Disk usage population queue", v2);
  v1 = (void *)+[_LSDiskUsage(Internal) _serverQueue]::result;
  +[_LSDiskUsage(Internal) _serverQueue]::result = (uint64_t)v0;

}

void __56___LSDiskUsage_Internal___fetchWithXPCConnection_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("dynamic"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("ODR"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("shared"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 == 0;

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }

    v2 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __38___LSDiskUsage_Private__propertyQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("Disk usage property queue", v2);
  v1 = (void *)+[_LSDiskUsage(Private) propertyQueue]::result;
  +[_LSDiskUsage(Private) propertyQueue]::result = (uint64_t)v0;

}

void __48___LSDiskUsage_Private__mobileInstallationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("MobileInstallation callout queue for disk usage", v2);
  v1 = (void *)+[_LSDiskUsage(Private) mobileInstallationQueue]::result;
  +[_LSDiskUsage(Private) mobileInstallationQueue]::result = (uint64_t)v0;

}

void __78___LSDiskUsage_Private__usageFromMobileInstallationForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD, void *);
  void *v4;
  const __CFDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x186DAE7A0]();
  v15[0] = CFSTR("DynamicDiskUsage");
  v15[1] = CFSTR("SharedDiskUsage");
  v16[0] = MEMORY[0x1E0C9AAB0];
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)softLinkMobileInstallationCopyDiskUsageForLaunchServices(*(const void **)(a1 + 32), v5);
  v7 = v6;
  if (!v6
    || (objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        (v9 = v8) == 0))
  {
    v10 = 0;
    v11 = 0;
LABEL_7:
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 109, (uint64_t)"+[_LSDiskUsage(Private) usageFromMobileInstallationForBundleIdentifier:error:]_block_invoke", 319, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, v12);
    goto LABEL_8;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DynamicDiskUsage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SharedDiskUsage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || !v11)
    goto LABEL_7;
  v13[0] = CFSTR("dynamic");
  v13[1] = CFSTR("shared");
  v14[0] = v10;
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v3)[2](v3, v12, 0);
LABEL_8:

  objc_autoreleasePoolPop(v4);
}

void __38___LSDiskUsage_Private__ODRConnection__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCED950);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ondemandd.launchservices"), 4096);
  v1 = (void *)+[_LSDiskUsage(Private) ODRConnection]::result;
  +[_LSDiskUsage(Private) ODRConnection]::result = v0;

  objc_msgSend((id)+[_LSDiskUsage(Private) ODRConnection]::result, "setRemoteObjectInterface:", v2);
  objc_msgSend((id)+[_LSDiskUsage(Private) ODRConnection]::result, "setInterruptionHandler:", &__block_literal_global_123_1);
  objc_msgSend((id)+[_LSDiskUsage(Private) ODRConnection]::result, "resume");

}

void __38___LSDiskUsage_Private__ODRConnection__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_182882000, v0, OS_LOG_TYPE_DEFAULT, "Unable to connect to ondemandd.", v1, 2u);
  }

}

void __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 40), "ODRConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E103FE08;
  v6 = v3;
  v13 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_3;
  v10[3] = &unk_1E1043140;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v7, "bytesUsedForApplicationWithBundleID:replyBlock:", v8, v10);

}

uint64_t __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __61___LSDiskUsage_Private__fetchServerSideWithConnection_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

void __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get dynamic/ODR disk usage for app %@, error = %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_127(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "propertyQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_2;
    v10[3] = &unk_1E10422C8;
    v10[4] = a1[4];
    v11 = v5;
    dispatch_barrier_async(v7, v10);

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1[4] + 8);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get dynamic/ODR disk usage for app %@, error = %@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }

}

uint64_t __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

@end
