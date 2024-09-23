@implementation LACClientInfoProvider

+ (id)infoForXPCClient:(id)a3
{
  return (id)objc_msgSend(a1, "infoForXPCClient:evaluationOptions:", a3, 0);
}

+ (id)infoForXPCClient:(id)a3 evaluationOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  LACClientInfo *v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1038);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1080);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1021);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = objc_msgSend(v6, "checkEntitlement:", CFSTR("com.apple.private.LocalAuthentication.CallerName"));

    if (!v16)
    {
      v17 = 0;
      if (v9)
        goto LABEL_6;
LABEL_10:
      if (v6)
      {
        objc_msgSend(v6, "auditToken");
      }
      else
      {
        v24 = 0u;
        v25 = 0u;
      }
      objc_msgSend(a1, "_infoForClientWithAuditToken:", &v24);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1021);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  if (!v9)
    goto LABEL_10;
LABEL_6:
  if ((v12 & 4) != 0)
    objc_msgSend(a1, "_infoForClientWithApplicationIdentityData:", v9);
  else
    objc_msgSend(a1, "_infoForClientWithAuditTokenData:", v9);
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v19 = (void *)v18;
  if (objc_msgSend(v17, "length", v24, v25))
  {
    v20 = [LACClientInfo alloc];
    objc_msgSend(v19, "bundleId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[LACClientInfo initWithBundleId:displayName:](v20, "initWithBundleId:displayName:", v21, v17);

    v19 = (void *)v22;
  }

  return v19;
}

+ (id)auditTokenDataForProcessId:(int)a3
{
  void *v3;
  id v4;
  char *v5;
  void *v6;
  uint64_t v8;
  NSUInteger sizep;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(v10, 0, sizeof(v10));
  if (!objc_msgSend(a1, "processId:toAuditToken:", *(_QWORD *)&a3, v10))
    return 0;
  objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", v10, "{?=[8I]}");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sizep = 0;
  v4 = objc_retainAutorelease(v3);
  NSGetSizeAndAlignment((const char *)objc_msgSend(v4, "objCType"), &sizep, 0);
  v5 = (char *)&v8 - ((sizep + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v4, "getValue:", v5);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, sizep);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)applicationIdentityDataForProcessId:(int)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v12;
  id v13;
  _OWORD v14[2];
  id v15;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  if (!objc_msgSend(a1, "processId:toAuditToken:", *(_QWORD *)&a3, &v16))
    return 0;
  v15 = 0;
  v14[0] = v16;
  v14[1] = v17;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", v14, &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v3)
  {
    v5 = objc_alloc(MEMORY[0x24BDC1530]);
    objc_msgSend(v3, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithBundleIdentifier:URL:personaUniqueString:personaType:", v6, 0, 0, 4);

    if (v7)
    {
      v13 = v4;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v13);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v13;

      if (v8)
      {
        v8 = v8;
        v10 = v8;
      }
      else
      {
        LACLogDefault();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          +[LACClientInfoProvider applicationIdentityDataForProcessId:].cold.3();

        v10 = 0;
      }
    }
    else
    {
      LACLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[LACClientInfoProvider applicationIdentityDataForProcessId:].cold.2();
      v10 = 0;
      v9 = v4;
    }

    v4 = v9;
  }
  else
  {
    LACLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[LACClientInfoProvider applicationIdentityDataForProcessId:].cold.1();
    v10 = 0;
  }

  return v10;
}

+ (BOOL)processId:(int)a3 toAuditToken:(id *)a4
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  kern_return_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t tn;

  v5 = *(_QWORD *)&a3;
  tn = 0;
  if (task_name_for_pid(*MEMORY[0x24BDAEC58], a3, &tn))
  {
    LACLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[LACClientInfoProvider processId:toAuditToken:].cold.3(v5, v6, v7, v8, v9, v10, v11, v12);

    return 0;
  }
  else
  {
    task_info_outCnt = 8;
    v14 = task_info(tn, 0xFu, (task_info_t)a4, &task_info_outCnt);
    v13 = v14 == 0;
    LACLogDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[LACClientInfoProvider processId:toAuditToken:].cold.2(v5, v16, v17, v18, v19, v20, v21, v22);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      +[LACClientInfoProvider processId:toAuditToken:].cold.1(v5, v16);
    }

  }
  return v13;
}

+ (id)_infoForClientWithAuditTokenData:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v8;
  void *v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(a3), "bytes"), "{?=[8I]}");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v11 = 0u;
      v12 = 0u;
      objc_msgSend(v4, "getValue:", &v11);
      v10[0] = v11;
      v10[1] = v12;
      objc_msgSend(a1, "_infoForClientWithAuditToken:", v10);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LACLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[LACClientInfoProvider _infoForClientWithAuditTokenData:].cold.1(v8);

      +[LACClientInfo emptyClientInfo](LACClientInfo, "emptyClientInfo");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v6;

    return v9;
  }
  else
  {
    +[LACClientInfo emptyClientInfo](LACClientInfo, "emptyClientInfo");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)_infoForClientWithApplicationIdentityData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    v7 = v6;
    if (v5)
    {
      v15 = v6;
      objc_msgSend(v5, "findApplicationRecordWithError:", &v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15;

      if (v8)
      {
        objc_msgSend(a1, "_infoForClientWithBundleRecord:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        LACLogDefault();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          +[LACClientInfoProvider _infoForClientWithApplicationIdentityData:].cold.2();

        +[LACClientInfo emptyClientInfo](LACClientInfo, "emptyClientInfo");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)v10;

      v7 = v9;
    }
    else
    {
      LACLogDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[LACClientInfoProvider _infoForClientWithApplicationIdentityData:].cold.1();

      +[LACClientInfo emptyClientInfo](LACClientInfo, "emptyClientInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[LACClientInfo emptyClientInfo](LACClientInfo, "emptyClientInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)_infoForClientWithAuditToken:(id *)a3
{
  __int128 v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _OWORD v11[2];
  id v12;

  v12 = 0;
  v4 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", v11, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    objc_msgSend(a1, "_infoForClientWithBundleRecord:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LACLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[LACClientInfoProvider _infoForClientWithAuditToken:].cold.1();

    +[LACClientInfo emptyClientInfo](LACClientInfo, "emptyClientInfo");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

  return v9;
}

+ (id)_infoForClientWithBundleRecord:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  LACClientInfo *v20;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v4, "localizedShortName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v8 = v9;
      }
      else
      {
        objc_msgSend(v4, "bundleIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (void *)v11;
        else
          v13 = v5;
        v8 = v13;

      }
    }

  }
  else
  {
    v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v4;
    v15 = v14;
    if (v4)
    {
      objc_msgSend(v14, "extensionPointRecord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.intents-service")))
      {

        v5 = CFSTR("com.apple.siri");
      }
      if ((objc_msgSend(a1, "_isNonUiExtensionPointIdentifier:", v17) & 1) == 0)
      {
        objc_msgSend(v15, "containingBundleRecord");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v19;
      }

    }
  }
  v20 = -[LACClientInfo initWithBundleId:displayName:]([LACClientInfo alloc], "initWithBundleId:displayName:", v5, v8);

  return v20;
}

+ (BOOL)_isNonUiExtensionPointIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.services")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ctk-tokens")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Safari.web-extension"));
  }

  return v4;
}

+ (void)applicationIdentityDataForProcessId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Failed to find LSBundleRecord: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)applicationIdentityDataForProcessId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Failed to create LSApplicationIdentity from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)applicationIdentityDataForProcessId:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2409DC000, v0, v1, "Failed to encode %@: %@");
  OUTLINED_FUNCTION_2();
}

+ (void)processId:(int)a1 toAuditToken:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_2409DC000, a2, OS_LOG_TYPE_DEBUG, "Successfully acquired audit token for PID %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

+ (void)processId:(uint64_t)a3 toAuditToken:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_2409DC000, a2, a3, "Failed to get audit token for PID %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)processId:(uint64_t)a3 toAuditToken:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_2409DC000, a2, a3, "Failed to determine task name for PID %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)_infoForClientWithAuditTokenData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "Unable to get audit token from data", v1, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)_infoForClientWithApplicationIdentityData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Unable to unarchive application identity error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_infoForClientWithApplicationIdentityData:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2409DC000, v0, v1, "Unable to find application record for identity: %@ error: %@");
  OUTLINED_FUNCTION_2();
}

+ (void)_infoForClientWithAuditToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Unable to find bundle record for audit token error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
