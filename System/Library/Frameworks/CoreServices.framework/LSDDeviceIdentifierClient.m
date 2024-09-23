@implementation LSDDeviceIdentifierClient

uint64_t __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

void __68___LSDDeviceIdentifierClient_getIdentifierOfType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v7 = a3;
  if (a4)
    goto LABEL_11;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 != 1)
    goto LABEL_5;
  if ((objc_msgSend(*(id *)(a1 + 32), "canAccessAdvertisingIdentifier") & 1) == 0)
  {
LABEL_11:
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3A28], "_LS_nullUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v12);
    goto LABEL_12;
  }
  v8 = *(_QWORD *)(a1 + 48);
LABEL_5:
  if (v8 != 2
    || (objc_msgSend(*(id *)(a1 + 32), "XPCConnection"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "_xpcConnection"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = _LSCheckEntitlementForXPCConnection(v10, CFSTR("com.apple.lsapplicationproxy.deviceidentifierforvendor")),
        v10,
        v9,
        v11))
  {
    if (v17 && v7)
    {
      +[_LSDeviceIdentifierManager sharedInstance](_LSDeviceIdentifierManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPersona");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cacheForPersona:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getIdentifierOfType:vendorName:bundleIdentifier:completionHandler:", *(_QWORD *)(a1 + 48), v17, v7, *(_QWORD *)(a1 + 40));

LABEL_12:
      goto LABEL_13;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_13:

}

void __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  _LSDServiceDomain *v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _LSDServiceDomain *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  CFURLRef v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  char v42;
  audit_token_t v43;
  uint8_t v44[8];
  id v45;
  char v46;
  id v47;
  uint8_t buf[4];
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  v36 = a3;
  objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _LSCopyBundleURLForXPCConnection(v6, 0);

  v37 = (void *)v7;
  if (!v7)
  {
    v12 = 0;
    v13 = 0;
LABEL_25:
    objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_xpcConnection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = _LSCopyExecutableURLForXPCConnection(v22);

    if (v23)
    {
      -[__CFURL lastPathComponent](v23, "lastPathComponent");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Path:%@"), v24, v35);
        v25 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v25;
      }
      -[__CFURL path](v23, "path");
      v26 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v26;
    }
    else
    {
      _LSDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_182882000, v24, OS_LOG_TYPE_DEFAULT, "Not enough info to create vendorName and bundleIdentifier", v44, 2u);
      }
    }

    goto LABEL_32;
  }
  v47 = 0;
  *(_QWORD *)v44 = 0;
  v45 = 0;
  v46 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v9 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)v44, v8, 0);

  if (!v9)
  {
    _LSDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)v44, v16, 0);

      if (v17)
        v18 = 0;
      else
        v18 = v47;
      *(_DWORD *)buf = 138543362;
      v49 = v18;
      _os_log_impl(&dword_182882000, v15, OS_LOG_TYPE_DEFAULT, "Failed to reach database with error %{public}@", buf, 0xCu);

    }
    LOBYTE(v7) = 0;
    v13 = 0;
    v12 = 0;
    goto LABEL_19;
  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "findAppBundleForExecutableURL:withContext:", v7, v9);
  if ((_DWORD)v10)
  {
    v11 = _LSBundleGet(*v9, v10);
    if (v11)
    {
      +[_LSDDeviceIdentifierService vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:](_LSDDeviceIdentifierService, "vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:", v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)_CSStringCopyCFString();
      objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        -[NSObject auditToken](v14, "auditToken");
      else
        memset(&v43, 0, sizeof(v43));
      if ((*(_BYTE *)(v11 + 179) & 0x18) != 0)
        LOBYTE(v7) = softLinkba_is_process_extension(&v43) ^ 1;
      else
        LOBYTE(v7) = 0;
LABEL_19:

      goto LABEL_20;
    }
  }
  LOBYTE(v7) = 0;
  v13 = 0;
  v12 = 0;
LABEL_20:
  if (*(_QWORD *)v44 && v46)
    _LSContextDestroy(*(void ***)v44);
  v19 = v45;
  *(_QWORD *)v44 = 0;
  v45 = 0;

  v46 = 0;
  v20 = v47;
  v47 = 0;

  if (!v12 || !v13)
    goto LABEL_25;
LABEL_32:
  +[_LSDeviceIdentifierManager sharedInstance](_LSDeviceIdentifierManager, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "currentPersona");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "cacheForPersona:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "queue");
  v31 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke_52;
  block[3] = &unk_1E1042EA0;
  v32 = *(id *)(a1 + 40);
  v40 = v13;
  v41 = v32;
  v39 = v12;
  v42 = v7;
  v33 = v13;
  v34 = v12;
  dispatch_async(v31, block);

}

void __90___LSDDeviceIdentifierClient_urlContainsDeviceIdentifierForAdvertising_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "containsString:"));

}

@end
