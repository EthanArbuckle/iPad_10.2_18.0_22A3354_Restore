uint64_t useFMFForFences()
{
  return _os_feature_enabled_impl() ^ 1;
}

void sub_230F166A4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    LogCategory_Unspecified();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230F15000, v3, OS_LOG_TYPE_INFO, "Creating XPC Connection...", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    v5 = (void *)objc_msgSend(v4, "initWithMachServiceName:options:", NSXPC_SERVICE_NAME, 4096);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255EAEC28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    v7 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_230F16804;
    v9[3] = &unk_24FFAE468;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "setInterruptionHandler:", v9);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = sub_230F16874;
    v8[3] = &unk_24FFAE468;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "setInvalidationHandler:", v8);
    objc_msgSend(v5, "resume");
    objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", v5);

  }
}

uint64_t sub_230F16804(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_230F15000, v2, OS_LOG_TYPE_INFO, "XPC Connection interrupted. Setting the xpcConnection to nil, so that it can be recreated the next time its needed.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_destroyXPCConnection");
}

uint64_t sub_230F16874(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_230F15000, v2, OS_LOG_TYPE_INFO, "XPC Connection invalidated. Setting the xpcConnection to nil, so that it can be recreated the next time its needed.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_destroyXPCConnection");
}

void sub_230F16C00(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_230F17824((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

uint64_t sub_230F16C50(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_signal);
}

void sub_230F16E18(uint64_t a1)
{
  int v1;
  void *v3;
  int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;

  v1 = *(_DWORD *)(a1 + 56);
  if ((v1 - 1) <= 2)
  {
    if (v1 == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "accountType");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject identifier](v19, "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB3FD8]))
      {
        v4 = objc_msgSend(*(id *)(a1 + 32), "aa_isPrimaryAccount");

        if (!v4)
          return;
        LogCategory_Unspecified();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          sub_230F17888();
          v13 = v19;
          v5 = CFSTR("iCloud-delete");
          goto LABEL_28;
        }
        v5 = CFSTR("iCloud-delete");
LABEL_27:
        v13 = v19;
LABEL_28:

        objc_msgSend(*(id *)(a1 + 48), "_currentXPCConnection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", &unk_24FFAE4F0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "didChangeFMFAccountInfo:usingCallback:", v5, &unk_24FFAE510);
        return;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "accountType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDB4050]);

      v9 = *(void **)(a1 + 40);
      if (v8)
      {
        if (!objc_msgSend(v9, "isPropertyDirty:", CFSTR("credential")))
          return;
        LogCategory_Unspecified();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          sub_230F178B4();
          v13 = v19;
          v5 = CFSTR("FMF-auth-token");
          goto LABEL_28;
        }
        v5 = CFSTR("FMF-auth-token");
        goto LABEL_27;
      }
      objc_msgSend(v9, "accountType");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject identifier](v19, "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB3FD8]))
      {
        v10 = objc_msgSend(*(id *)(a1 + 40), "aa_isPrimaryAccount");

        if (!v10)
          return;
        if (*(_DWORD *)(a1 + 56) == 1)
        {
          LogCategory_Unspecified();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            sub_230F178E0();
            v13 = v19;
            v5 = CFSTR("iCloud-add");
            goto LABEL_28;
          }
          v5 = CFSTR("iCloud-add");
          goto LABEL_27;
        }
        v11 = objc_msgSend(*(id *)(a1 + 32), "isProvisionedForDataclass:", CFSTR("com.apple.Dataclass.ShareLocation"));
        v12 = objc_msgSend(*(id *)(a1 + 40), "isProvisionedForDataclass:", CFSTR("com.apple.Dataclass.ShareLocation"));
        if ((v12 & 1) == 0 && v11)
        {
          LogCategory_Unspecified();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            sub_230F17990();
            v13 = v19;
            v5 = CFSTR("FMF-deprovisioned");
            goto LABEL_28;
          }
          v5 = CFSTR("FMF-deprovisioned");
          goto LABEL_27;
        }
        if (((v12 ^ 1 | v11) & 1) == 0)
        {
          LogCategory_Unspecified();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            sub_230F17964();
            v13 = v19;
            v5 = CFSTR("FMF-provisioned");
            goto LABEL_28;
          }
          v5 = CFSTR("FMF-provisioned");
          goto LABEL_27;
        }
        if (!v12)
          return;
        if (objc_msgSend(*(id *)(a1 + 40), "isPropertyDirty:", CFSTR("credential")))
        {
          LogCategory_Unspecified();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            sub_230F1790C();
            v13 = v19;
            v5 = CFSTR("iCloud-auth-token");
            goto LABEL_28;
          }
          v5 = CFSTR("iCloud-auth-token");
          goto LABEL_27;
        }
        v16 = *(void **)(a1 + 32);
        if (v16)
          objc_msgSend(v16, "fmfAccountInfoForProactiveChanges");
        else
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
        v19 = objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 40);
        if (v17)
          objc_msgSend(v17, "fmfAccountInfoForProactiveChanges");
        else
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSObject isEqual:](v19, "isEqual:", v3) & 1) == 0)
        {
          LogCategory_Unspecified();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            sub_230F17938();

          v5 = CFSTR("FMF-info");
          goto LABEL_27;
        }
      }
    }

  }
}

void sub_230F17200(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_230F17824((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void sub_230F17250(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    LogCategory_Unspecified();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_230F179BC((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

void sub_230F172FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_230F17314(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id LogCategory_Unspecified()
{
  if (qword_25414BC08 != -1)
    dispatch_once(&qword_25414BC08, &unk_24FFAE578);
  return (id)qword_25414BC00;
}

void sub_230F17378()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.fmflocatord", "_");
  v1 = (void *)qword_25414BC00;
  qword_25414BC00 = (uint64_t)v0;

}

id LogCategory_Locations()
{
  if (qword_255EAC128 != -1)
    dispatch_once(&qword_255EAC128, &unk_24FFAE598);
  return (id)qword_255EAC130;
}

void sub_230F173E8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.fmflocatord", "Locations");
  v1 = (void *)qword_255EAC130;
  qword_255EAC130 = (uint64_t)v0;

}

id LogCategory_Traffic()
{
  if (qword_255EAC138 != -1)
    dispatch_once(&qword_255EAC138, &unk_24FFAE5B8);
  return (id)qword_255EAC140;
}

void sub_230F17458()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.fmflocatord", "Traffic");
  v1 = (void *)qword_255EAC140;
  qword_255EAC140 = (uint64_t)v0;

}

id LogCategory_SecureLocations()
{
  if (qword_255EAC148 != -1)
    dispatch_once(&qword_255EAC148, &unk_24FFAE5D8);
  return (id)qword_255EAC150;
}

void sub_230F174C8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.fmflocatord", "secureLocations");
  v1 = (void *)qword_255EAC150;
  qword_255EAC150 = (uint64_t)v0;

}

id LogCategory_Fences()
{
  if (qword_255EAC158 != -1)
    dispatch_once(&qword_255EAC158, &unk_24FFAE5F8);
  return (id)qword_255EAC160;
}

void sub_230F17538()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.fmflocatord", "Fences");
  v1 = (void *)qword_255EAC160;
  qword_255EAC160 = (uint64_t)v0;

}

id sub_230F17568(void *a1, uint64_t a2, int a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("username"), v6);

  objc_msgSend(a1, "aa_personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("dsid"), v7);

  if (a3)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDB4398]);
    objc_msgSend(a1, "aa_fmfAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v8, "credentialForAccount:error:", v9, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;

    if (!v10)
    {
      LogCategory_Unspecified();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_230F17A20((uint64_t)v11, v12);

    }
    objc_msgSend(v10, "credentialItemForKey:", *MEMORY[0x24BDB4228]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("appToken"), v13);

    objc_msgSend(v10, "credentialItemForKey:", *MEMORY[0x24BDB4230]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("internalToken"), v14);

  }
  objc_msgSend(a1, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.ShareLocation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("appHostname"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("appHostname"), v16);

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hostname"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("hostname"), v17);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("scheme"), CFSTR("https"));
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("apsEnv"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("apsEnv"), v18);

  v19 = (void *)objc_msgSend(v5, "copy");
  return v19;
}

id sub_230F177DC(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "fmfAccountInfoWithTokens:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = (void *)objc_msgSend(v2, "copy");
  return v3;
}

void sub_230F17824(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230F17314(&dword_230F15000, a2, a3, "XPC error for willDeleteiCloudAccountUsingCallback: %@", a5, a6, a7, a8, 2u);
  sub_230F17330();
}

void sub_230F17888()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F17324();
  sub_230F172FC(&dword_230F15000, v0, v1, "iCloud account deleted", v2, v3, v4, v5, v6);
  sub_230F1730C();
}

void sub_230F178B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F17324();
  sub_230F172FC(&dword_230F15000, v0, v1, "FMF token has changed", v2, v3, v4, v5, v6);
  sub_230F1730C();
}

void sub_230F178E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F17324();
  sub_230F172FC(&dword_230F15000, v0, v1, "iCloud account added", v2, v3, v4, v5, v6);
  sub_230F1730C();
}

void sub_230F1790C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F17324();
  sub_230F172FC(&dword_230F15000, v0, v1, "iCloud token has changed", v2, v3, v4, v5, v6);
  sub_230F1730C();
}

void sub_230F17938()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F17324();
  sub_230F172FC(&dword_230F15000, v0, v1, "FMF info changed", v2, v3, v4, v5, v6);
  sub_230F1730C();
}

void sub_230F17964()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F17324();
  sub_230F172FC(&dword_230F15000, v0, v1, "FMF was provisioned", v2, v3, v4, v5, v6);
  sub_230F1730C();
}

void sub_230F17990()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F17324();
  sub_230F172FC(&dword_230F15000, v0, v1, "FMF was deprovisioned", v2, v3, v4, v5, v6);
  sub_230F1730C();
}

void sub_230F179BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230F17314(&dword_230F15000, a2, a3, "didChangeFMFAccountInfo failed with error %@", a5, a6, a7, a8, 2u);
  sub_230F17330();
}

void sub_230F17A20(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230F15000, a2, OS_LOG_TYPE_ERROR, "No credential found for aa_fmfAccount : %@", (uint8_t *)&v2, 0xCu);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

