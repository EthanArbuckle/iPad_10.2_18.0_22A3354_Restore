@implementation NSXPCConnection

- (id)bm_accessControlPolicy
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[NSXPCConnection bm_userInfo](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("bm_accessControlPolicy"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)bm_userInfo
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  id v7;
  uint64_t v9;
  _QWORD block[5];
  __int128 buf;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __biome_log_for_category(0);
      v4 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v12 = 0x2020000000;
      v13 = 16;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__NSXPCConnection_BiomeUserInfo__bm_userInfo__block_invoke;
      block[3] = &unk_1E5E3C680;
      block[4] = &buf;
      if (bm_userInfo_onceToken != -1)
        dispatch_once(&bm_userInfo_onceToken, block);
      v5 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (void *)objc_opt_class();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        v7 = v6;
        _os_log_impl(&dword_1AEB31000, v4, v5, "NSXPCConnection userInfo is of class %@", (uint8_t *)&buf, 0xCu);

      }
      return 0;
    }
  }
  else
  {
    v9 = objc_opt_new();

    objc_msgSend(a1, "setUserInfo:", v9);
    v2 = (void *)v9;
  }
  return v2;
}

- (BMProcess)bm_process
{
  BMProcess *v1;
  void *v2;
  BMProcess *v3;
  BMProcess *v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v9;
  _QWORD block[5];
  char v11[32];
  __int128 buf;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v1 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[NSXPCConnection bm_userInfo](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bm_process"));
    v3 = (BMProcess *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = [BMProcess alloc];
      -[BMProcess auditToken](v1, "auditToken");
      v3 = -[BMProcess initWithAuditToken:](v4, "initWithAuditToken:", v11);
      -[NSXPCConnection bm_accessControlPolicy](v1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        __biome_log_for_category(0);
        v6 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v13 = 0x2020000000;
        v14 = 16;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__NSXPCConnection_BiomeAccessControl__bm_process__block_invoke;
        block[3] = &unk_1E5E3C680;
        block[4] = &buf;
        if (bm_process_onceToken != -1)
          dispatch_once(&bm_process_onceToken, block);
        v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
        _Block_object_dispose(&buf, 8);
        if (os_log_type_enabled(v6, v7))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v1;
          _os_log_impl(&dword_1AEB31000, v6, v7, "Access control policy already set %@", (uint8_t *)&buf, 0xCu);
        }

        v1 = 0;
        goto LABEL_10;
      }
      -[NSXPCConnection bm_userInfo](v1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v3, CFSTR("bm_process"));

    }
    v3 = v3;
    v1 = v3;
LABEL_10:

  }
  return v1;
}

- (void)setBm_accessControlPolicy:(BMProcess *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD block[5];
  __int128 buf;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[NSXPCConnection bm_accessControlPolicy](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "useCase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      __biome_log_for_category(0);
      v6 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v15 = 0x2020000000;
      v16 = 16;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__NSXPCConnection_BiomeAccessControl__setBm_accessControlPolicy___block_invoke;
      block[3] = &unk_1E5E3C680;
      block[4] = &buf;
      if (setBm_accessControlPolicy__onceToken != -1)
        dispatch_once(&setBm_accessControlPolicy__onceToken, block);
      v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (!os_log_type_enabled(v6, v7))
        goto LABEL_13;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = a1;
      v8 = "Access control policy useCase cannot change %@";
    }
    else
    {
      -[NSXPCConnection bm_process](a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "process");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v10)
      {
        -[NSXPCConnection bm_userInfo](a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, CFSTR("bm_accessControlPolicy"));

        goto LABEL_14;
      }
      __biome_log_for_category(0);
      v6 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v15 = 0x2020000000;
      v16 = 16;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__NSXPCConnection_BiomeAccessControl__setBm_accessControlPolicy___block_invoke_8;
      v12[3] = &unk_1E5E3C680;
      v12[4] = &buf;
      if (setBm_accessControlPolicy__onceToken_7 != -1)
        dispatch_once(&setBm_accessControlPolicy__onceToken_7, v12);
      v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (!os_log_type_enabled(v6, v7))
        goto LABEL_13;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = a1;
      v8 = "Access control policy process mismatch %@";
    }
    _os_log_impl(&dword_1AEB31000, v6, v7, v8, (uint8_t *)&buf, 0xCu);
LABEL_13:

  }
LABEL_14:

}

uint64_t __45__NSXPCConnection_BiomeUserInfo__bm_userInfo__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

+ (id)bm_connectionWithPeer:(void *)a3 queue:
{
  _xpc_connection_s *v4;
  NSObject *v5;
  id v6;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v5)
    xpc_connection_set_target_queue(v4, v5);
  v6 = -[_BMXPCConnection _initWithConnection:queue:]([_BMXPCConnection alloc], "_initWithConnection:queue:", v4, v5);

  return v6;
}

uint64_t __49__NSXPCConnection_BiomeAccessControl__bm_process__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__NSXPCConnection_BiomeAccessControl__setBm_accessControlPolicy___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__NSXPCConnection_BiomeAccessControl__setBm_accessControlPolicy___block_invoke_8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)bm_connectionFlags
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    -[NSXPCConnection bm_userInfo](result);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("bm_connectionFlags"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "unsignedLongLongValue");

    return (void *)v3;
  }
  return result;
}

- (void)setBm_connectionFlags:(void *)a1
{
  void *v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  id v9;
  _QWORD block[5];
  __int128 buf;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[NSXPCConnection bm_userInfo](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bm_connectionFlags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      __biome_log_for_category(0);
      v6 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v12 = 0x2020000000;
      v13 = 16;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__NSXPCConnection_BiomeAccessControl__setBm_connectionFlags___block_invoke;
      block[3] = &unk_1E5E3C680;
      block[4] = &buf;
      if (setBm_connectionFlags__onceToken != -1)
        dispatch_once(&setBm_connectionFlags__onceToken, block);
      v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (os_log_type_enabled(v6, v7))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = a1;
        _os_log_impl(&dword_1AEB31000, v6, v7, "Connection flags cannot change after being set %@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection bm_userInfo](a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("bm_connectionFlags"));

    }
  }
}

uint64_t __61__NSXPCConnection_BiomeAccessControl__setBm_connectionFlags___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

@end
