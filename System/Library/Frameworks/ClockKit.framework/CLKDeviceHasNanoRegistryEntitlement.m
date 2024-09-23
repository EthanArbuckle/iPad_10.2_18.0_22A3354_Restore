@implementation CLKDeviceHasNanoRegistryEntitlement

void ___CLKDeviceHasNanoRegistryEntitlement_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  _BOOL4 v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  __int128 applier;
  uint64_t (*v21)(_QWORD *, uint64_t, void *);
  void *v22;
  __CFString *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v0 = xpc_copy_entitlements_for_self();
  v1 = (void *)v0;
  if (v0 && MEMORY[0x212BDC1C4](v0) == MEMORY[0x24BDACFA0])
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    v19 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    *(_QWORD *)&applier = MEMORY[0x24BDAC760];
    *((_QWORD *)&applier + 1) = 3221225472;
    v21 = ___CLKDeviceEntitlementWithPrefix_block_invoke;
    v22 = &unk_24CBFA0E0;
    v23 = CFSTR("com.apple.nano.nanoregistry");
    v24 = &v10;
    v25 = &v14;
    xpc_dictionary_apply(v1, &applier);
    v2 = objc_retainAutorelease((id)v15[5]);
    v3 = *((_BYTE *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v2 = 0;
    v3 = 0;
  }

  v4 = v2;
  _CLKDeviceHasNanoRegistryEntitlement_hasEntitlement = v3;
  CLKLoggingObjectForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      LODWORD(applier) = 138412290;
      *(_QWORD *)((char *)&applier + 4) = v4;
      v7 = "Has NanoRegistry entitlement %@";
      v8 = v5;
      v9 = 12;
LABEL_10:
      _os_log_impl(&dword_2114F4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&applier, v9);
    }
  }
  else if (v6)
  {
    LOWORD(applier) = 0;
    v7 = "Doesn't have NanoRegistry entitlement";
    v8 = v5;
    v9 = 2;
    goto LABEL_10;
  }

}

@end
